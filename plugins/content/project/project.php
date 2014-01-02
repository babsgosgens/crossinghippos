<?php
/**
 * @version     1.0
 * @subpackage  plg_content_project
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Babs Gösgens, Netherlands
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access
defined('_JEXEC') or die;

class PlgContentProject extends JPlugin
{

    /**
     * Are we frontend or backend.
     *
     * @var    boolean
     * @since  3.1
     */
    protected $isAdmin = false;

    /**
     * Are we in category view.
     *
     * @var    boolean
     * @since  3.1
     */
    protected $isCategory = false;

    /**
     * Are we in article view.
     *
     * @var    boolean
     * @since  3.1
     */
    protected $isArticle = false;

    /**
     * Are we in the correct category group.
     *
     * @var    boolean
     * @since  3.1
     */
    protected $isTargetCategory = false;


    /**
     * Constructor.
     *
     * @param   object  &$subject  The object to observe
     * @param   array   $config    An array that holds the plugin configuration
     *
     * @since   1.5
     */
    public function __construct(& $subject, $config)
    {
        $this->isAdmin = JFactory::getApplication()->isAdmin();

        parent::__construct($subject, $config);
        $this->loadLanguage();
    }


    /**
     * Adds the project attributes to the row (admin)
     *
     * @param   string   $context  The context of the content being passed to the plugin
     * @param   object   $row     The content object (category)
     *
     * @return  mixed
     *
     * @since   1.6
     */
    public function onContentPrepareData($context, $row)
    {
        // This seems to only be triggered backend
        $this->isCategory   = $context == 'com_categories.category';

        // Only display in specified category
        $this->isTargetCategory = $this->checkCategoryId($row);

        if (!$this->isCategory||  !$this->isTargetCategory)
        {
            return;
        }

        // Load the project data
        $projectData = $this->getProjectData($row->id);
        foreach ($projectData as $v)
        {
            $attribute = $v['attribute'];
            $value = $v['value'];
            $row->params[$attribute] = $value;
        }
        
        return true;
    }


    /**
     * Injects additional form elements to submit project attributes
     *
     * @param   string   form     The form
     * @param   object   $row     The row object (category)
     *
     * @return  mixed
     *
     * @since   1.6
     */
    public function onContentPrepareForm($form, $row)
    {
        if (!$this->isAdmin)
        {
            return;
        }
        if (!$this->isCategory)
        {
            return;
        }
        if (!$this->isTargetCategory)
        {
            return;
        }
        if (!($form instanceof JForm))
        {
         $this->_subject->setError('JERROR_NOT_A_FORM');
         return false;
        }

        // Add the extra fields to the form.
        JForm::addFormPath(dirname(__FILE__) . '/form');
        $form->loadFile('project', false);

        return true;
    }


    /**
     * Saves the project attributes into the database
     *
     * @param   string   $context  The context of the content being passed to the plugin
     * @param   object   &$row     The row object
     * @param   object   $isNew   Boolean, true if the content item (category) is new
     *
     * @return  mixed
     *
     * @since   1.6
     */
    public function onContentAfterSave($context, &$row, $isNew)
    {
        
        $input = JFactory::getApplication()->input;

        $post = $input->post->get('jform', null, null);
        
        JForm::addFormPath(dirname(__FILE__) . '/form');
        $form = new JForm(null);
        $form->loadFile('project', false);

        $attributes = array();
        foreach ($form->getFieldsets() as $fieldset) {
            foreach ($form->getFieldset($fieldset->name) as $field) {
                
                $strlength = strlen($field->name);

                $name = rtrim($field->name, ']');
                $name = stristr($name, '[');
                $name = ltrim($name, '[');
                $attributes[] = $name;
            }
        }

        $contentId = isset($row->id) ? $row->id : 0;
        if ($contentId && !empty($attributes))
        {
            try
            {
                $db = JFactory::getDbo();
 
                $query = $db->getQuery(true);
                $query->delete('#__data_extensions');
                $query->where('parent_table = ' . $db->Quote('categories'));
                $query->where('content_id = ' . $db->Quote($contentId));
                $db->setQuery($query);
                if (!$db->query()) {
                   throw new Exception($db->getErrorMsg());
                }
 
                $query->clear();
                $query->insert('#__data_extensions');

                $columns = array('parent_table', 'content_id', 'attribute', 'value', 'state', 'ordering');

                $store = false;
                $i=0; foreach ($attributes as $attribute)
                {
                    if (isset($post['params'][$attribute]) && $post['params'][$attribute]!='')
                    {
                        $values = array($db->quote('categories'), $contentId, $db->quote($attribute), $db->quote($post['params'][$attribute]), 1, $i);
                        $query->values(implode(',', $values));
                        $db->setQuery($query);
                        $store = true;
                    }
                    $i++;
                }

                if ($store && !$db->query())
                {
                   throw new Exception($db->getErrorMsg());
                }
            }
            catch (JException $e)
            {
                $this->_subject->setError($e->getMessage());
                return false;
            }
        }

        return true;
    }


    /**
     * Removes attributes for the deleted content item (category)
     *
     * @param   string   $context  The context of the content being passed to the plugin
     * @param   object   $row      The row object (category)
     *
     * @return  mixed
     *
     * @since   1.6
     */
    public function onContentAfterDelete($context, $row)
    {
        $contentId = isset($row->id) ? $row->id : 0;

        if ($contentId)
        {
            try
            {
                $db = JFactory::getDbo();
 
                $query = $db->getQuery(true);
                $query->delete('#__data_extensions');
                $query->where('parent_table = ' . $db->Quote('categories'));
                $query->where('content_id = ' . $db->Quote($contentId));
                $db->setQuery($query);
                if (!$db->query()) {
                   throw new Exception($db->getErrorMsg());
                }
            }
            catch (JException $e)
            {
                $this->_subject->setError($e->getMessage());
                return false;
            }
        }
        return true;
    }


    /**
     * Adds the project attributes to the row (can be category or article)
     *
     * @param   string   $context  The context of the content being passed to the plugin
     * @param   object   &$row     The row object
     * @param   object   &$params  The content params
     * @param   integer  $page     The 'page' number
     *
     * @return  mixed
     *
     * @since   1.6
     */
    public function onContentPrepare($context, &$row, &$params, $page = 0)
    {
        // This seems to only be triggered frontend
        $this->isCategory   = $context == 'com_content.category';
        $this->isArticle    = $context == 'com_content.article';

        if (!$this->isCategory && !$this->isArticle)
        {
            return;
        }

        $input = JFactory::getApplication()->input;
        $itemId = $input->getInt('id');

        if ($this->isCategory)
        {
            $contentId = $itemId;
        }
        if ($this->isArticle)
        {
            $contentId = $row->catid;
        }

        $category =  $this->getCategory($contentId);

        $this->isTargetCategory = $this->checkCategoryId($category);

        if (!$this->isTargetCategory)
        {
            return;
        }

        // Load the project data
        $projectData = $this->getProjectData($contentId);
        foreach ($projectData as $v)
        {
            $attribute = $v['attribute'];
            $value = $v['value'];
            $row->project[$attribute] = $value;
        }

        if ($this->isCategory)
        {
            return $row;
        }
        else
        {
            return true;
        }
    }


    /**
     * Retrieves the project attributes for a given category id
     *
     * @param   integer  $catid    The category id
     *
     * @return  mixed  array containing project attributes else boolean false
     *
     * @since   1.6
     */
    protected function getProjectData($catid)
    {
        $projectData = null;

        if ($catid > 0)
        {
            // Load the data from the database.
            $db = JFactory::getDbo();
            $query = $db->getQuery(true);
            $query->select('attribute, value');
            $query->from('#__data_extensions');
            $query->where('parent_table = ' . $db->Quote('categories'));
            $query->where('content_id = ' . $db->Quote($catid));
            $query->where('state = 1');
            $query->order('ordering');
            $db->setQuery($query);
            $projectData = $db->loadAssocList();

            // Check for a database error.
            if ($db->getErrorNum())
            {
               $this->_subject->setError($db->getErrorMsg());
               return false;
            }
        }

        return $projectData;
    }


    /**
     * Retrieves the category object attributes for a given category id
     *
     * @param   integer  $catid    The category id
     *
     * @return  mixed  the category object
     *
     * @since   1.6
     */
    protected function getCategory($catid)
    {
        $categoriesModel = JCategories::getInstance('content');
        return $categoriesModel->get($catid);
    }


    /**
     * Checks if the category has the correct category parent
     *
     * @param   integer  $catid    The category id
     *
     * @return  boolean  true if the parent is a match
     *
     * @since   1.6
     */
    protected function checkCategoryId($category)
    {
        // Only display in specified category
        // Todo: make configurable
        $categoryIds = array(8);

        $isTargetCategory = false;
        if (is_object($category) && isset($category->parent_id))
        {
            $isTargetCategory = in_array($category->parent_id, $categoryIds);
        }

        return $isTargetCategory;
    }
}
