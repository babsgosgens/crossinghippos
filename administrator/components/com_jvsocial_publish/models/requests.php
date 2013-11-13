<?php

/**
 * @version     1.0.0
 * @package     com_jvsocial_publish
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      joomlavi <info@joomlavi.com> - http://www.joomlavi.com
 */
defined('_JEXEC') or die;

jimport('joomla.application.component.modellist');

/**
 * Methods supporting a list of Jvsocial_publish records.
 */
class Jvsocial_publishModelrequests extends JModelList {

    /**
     * Constructor.
     *
     * @param    array    An optional associative array of configuration settings.
     * @see        JController
     * @since    1.6
     */
    public function __construct($config = array()) {
        if (empty($config['filter_fields'])) {
            $config['filter_fields'] = array(
                'id', 'a.id',
                'channel_id', 'a.channel_id',
                'source', 'a.source',
                'source_id', 'a.source_id',
                'target', 'a.target',
                'feed_id', 'a.feed_id',
                'state', 'a.state',
                'created', 'a.created',
                'created_by', 'a.created_by',
                'created_by_name', 'a.created_by_name',
                'source_title', 'channel_name'
            );
        }

        parent::__construct($config);
    }

    /**
     * Method to auto-populate the model state.
     *
     * Note. Calling getState in this method will result in recursion.
     */
    protected function populateState($ordering = null, $direction = null) {
        // Initialise variables.
        $app = JFactory::getApplication('administrator');

        // Load the filter state.
        $search = $app->getUserStateFromRequest($this->context . '.filter.search', 'filter_search');
        $this->setState('filter.search', $search);

        $state = $app->getUserStateFromRequest($this->context . '.filter.state', 'filter_state', '', 'string');
        $this->setState('filter.state', $state);

        $source = $app->getUserStateFromRequest($this->context . '.filter.source', 'filter_source', '', 'string');
        $this->setState('filter.source', $source);

        $channel = $app->getUserStateFromRequest($this->context . '.filter.channel', 'filter_channel', '', 'string');
        $this->setState('filter.channel', $channel);

        $type = $app->getUserStateFromRequest($this->context . '.filter.type', 'filter_type', '', 'string');
        $this->setState('filter.type', $type);

        // Load the parameters.
        $params = JComponentHelper::getParams('com_jvsocial_publish');
        $this->setState('params', $params);

        // List state information.
        parent::populateState('a.created', 'desc');
    }

    /**
     * Method to get a store id based on model configuration state.
     *
     * This is necessary because the model is used by the component and
     * different modules that might need different sets of data or different
     * ordering requirements.
     *
     * @param	string		$id	A prefix for the store id.
     * @return	string		A store id.
     * @since	1.6
     */
    protected function getStoreId($id = '') {
        // Compile the store id.
        $id.= ':' . $this->getState('filter.search');
        $id.= ':' . $this->getState('filter.state');

        return parent::getStoreId($id);
    }

    /**
     * Build an SQL query to load the list data.
     *
     * @return	JDatabaseQuery
     * @since	1.6
     */
    protected function getListQuery() {
        // Create a new query object.
        $db = $this->getDbo();
        $query = $db->getQuery(true);

        // Select the required fields from the table.
        $query->select(
            $this->getState(
                    'list.select', 'a.*'
            )
        );
        $query->from('`#__jvsocial_publish_requests` AS a');

        $query->select('s.title as source_title');
        $query->join('LEFT','#__content AS s ON s.id=a.source_id');

        $query->select('c.name as channel_name, c.type, c.params');
        $query->join('LEFT','#__jvsocial_publish_channels AS c ON c.id=a.channel_id');

        // Join over the user field 'created_by'
        $query->select('created_by.name AS created_by_name');
        $query->join('LEFT', '#__users AS created_by ON created_by.id = a.created_by');

        // Filter by published state
        $state = $this->getState('filter.state');
        if (is_numeric($state)) {
            $query->where('a.state = '.(int) $state);
        }

        // Filter by source
        $source = $this->getState('filter.source');
        if ($source) {
            $query->where('a.source = '.$db->quote($source));
        }

        // Filter by channel
        $channel = $this->getState('filter.channel');
        if ($channel) {
            $query->where('a.channel_id = '.$db->quote($channel));
        }

        // Filter by type
        $type = $this->getState('filter.type');
        if ($type) {
            $query->where('c.type = '.$db->quote($type));
        }

        // Filter by search in title
        $search = $this->getState('filter.search');
        if (!empty($search)) {
            if (stripos($search, 'id:') === 0) {
                $query->where('a.id = ' . (int) substr($search, 3));
            } else {
                $search = $db->Quote('%' . $db->escape($search, true) . '%');
                $query->where('( s.title LIKE '.$search.' )');
            }
        }

        // Add the list ordering clause.
        $orderCol = $this->state->get('list.ordering');
        $orderDirn = $this->state->get('list.direction');
        if ($orderCol && $orderDirn) {
            $query->order($db->escape($orderCol . ' ' . $orderDirn));
        }

        return $query;
    }

    public function getItems() {
        if($items = parent::getItems()){
            foreach($items as &$item){
                $item->params = json_decode($item->params);
            }
        }
        return $items;
    }

}
