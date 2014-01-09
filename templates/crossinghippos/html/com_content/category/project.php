<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT.'/helpers');


$dummyClass = array();
$document	= JFactory::getDocument();


/*
 * The plugin is only triggered for child articles
 * Trigger the plugin manually to retrieve the project data
 */
$this->category->text = ''; // LoadModule plugin expects this attribute to exist - report as bug!
JPluginHelper::importPlugin('content'); 
$dispatcher = JEventDispatcher::getInstance();
$project = $dispatcher->trigger( 'onContentPrepare', array('com_content.category', &$this->category, &$this->params) );
$hasTags = $this->params->get('show_tags', 1) && !empty($this->category->tags);

// $context, &$row, &$params, $page = 0
if( isset($project[0]->project) ) {
	$project = $project[0]->project;
}
else {
	$project = array();
}

/*
 * Check for project image
 */
$image = '';
$pattern = '/<img.+\/>/';
if( preg_match($pattern, $this->category->description, $images) )
{
	$this->category->description = preg_replace($pattern, '', $this->category->description);
	$image = $images[0];
}

// /*
//  * Use a module for the header
//  */
// $renderer	= $document->loadRenderer('module');
// $header	= JModuleHelper::getModule('mod_articles_categories');
// $headerIsActive = !is_null($header) && $header->id > 0;

// $identifier = 'categories';
// if ($headerIsActive) {
// 	$headerAttribs	= array(
// 		'style' => 'id',
// 		'module_id' => $identifier
// 	);
// 	$titleNavigationOptions = $renderer->render($header, $headerAttribs);
// }
$title = $this->escape($this->category->title);
$url = JRoute::_(ContentHelperRoute::getCategoryRoute($this->category->id));
$parentUrl = JRoute::_(ContentHelperRoute::getCategoryRoute($this->category->parent_id));
?>
<section class="section lt-root leader">

	<div class="trailer">

		<?php
		/*
		 * ------------------------------------------------------------------------------------------------------------------
		 * PRIMARY + ALPHA - PROJECT SCREENDUMP
		 * ------------------------------------------------------------------------------------------------------------------
		 */
		?>


		<div class="lt-prime-alpha valign-bottom">
		<?php if ($image != '') : ?>
			<?php echo $image; ?>
		<?php endif; ?>
		</div>


		<?php
		/*
		 * ------------------------------------------------------------------------------------------------------------------
		 * TERTIARY - PROJECT LOGO AND DATA
		 * ------------------------------------------------------------------------------------------------------------------
		 */
		?>
		<div class="lt-beta lt-gutters valign-bottom">
			<?php if (!empty($project)): ?>
			<?php
			$layoutData = array(
				'category' => $title,
				'project'  => $project,
				);
			if ($this->params->get('show_description_image') && $this->category->getParams()->get('image')) {
				$layoutData['image'] = $this->category->getParams()->get('image');
			}
			?>
			<?php $projectDetails = new JLayoutFile('content.project', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
			<?php echo $projectDetails->render($layoutData); ?>
			<?php endif; ?>
		</div>

	</div>

	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * PRIMARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<?php if ($this->params->get('show_page_heading') != 0) : ?>
	<h1 class="hd hd--section lt-prime lt-prime--clear lt-gutters"><a href="<?php echo $parentUrl; ?>" title="<?php echo JText::sprintf('TPL_CROSSINGHIPPOS_ANCHOR_TITLE_PARENTCATEGORY', $this->params->get('page_title')); ?>" class="btn-base anchor--incognito"><?php echo $this->params->get('page_title'); ?></a></h1>
	<?php endif; ?>
	<div class="lt-prime <?php if ($hasTags) : ?> divider<?php endif; ?> lt-prime--alpha-beta lt-gutters">
	<?php if ($this->params->get('show_description', 1) || $this->params->def('show_description_image', 1)) : ?>
	<div class="category-desc clearfix">
		<?php if ($this->params->get('show_description') && $this->category->description) : ?>
			<?php echo JHtml::_('content.prepare', $this->category->description, '', 'com_content.category'); ?>
		<?php endif; ?>
	</div>
	<?php endif; ?>


	</div>


	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * SECONDARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-alpha lt-gutters">
		<?php $tagsLayout = new JLayoutFile('content.tags.button', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
		<?php echo $tagsLayout->render($this->category->tags->itemTags); ?>
	</div>


	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * TERTIARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-beta lt-gutters">
	</div>

</section>


<?php
/*
 * ------------------------------------------------------------------------------------------------------------------
 * Articles
 * ------------------------------------------------------------------------------------------------------------------
 */
?>
<?php if (!empty($this->lead_items)) : ?>
<?php  endif; ?>

<?php if (!empty($this->intro_items)) : ?>
<?php  endif; ?>

<?php if (!empty($this->link_items)) : ?>

<aside class="leader--double lt-root">
<h1 class="lt-beta lt-gutters hd hd--page trailer--half"><?php echo JText::sprintf('TPL_CROSSINGHIPPOS_TITLE_PROJECT_ARTICLES', $this->category->title); ?></h1>
<ol class="lt-prime lt-prime--beta link-list">
<?php
	foreach ($this->link_items as &$item) :

		/*
		 * Count title length, add css hook for longer titles
		 */
		$title = $this->escape($item->title);
		$titleClass = 'box__title link-list__title';
		if ( strlen($title) > 45 ) {
			$titleClass .= ' link-list__title--long';
		}

		$url = JRoute::_(ContentHelperRoute::getArticleRoute($item->slug, $item->catid));

		$images = json_decode($item->images);
		if (isset($images->image_intro) && !empty($images->image_intro)) {
			$article['image'] = array(
				'caption' => $images->image_intro_caption ? htmlspecialchars($images->image_intro_caption) : '',
				'src' => htmlspecialchars($images->image_intro),
				'alt' => $images->image_intro_alt ? htmlspecialchars($images->image_intro_alt) : '',
			);		
		}
	?>
	<li class="lt-column lt-column--half lt-gutters trailer">
		<article class="box box--primary soft outline link-list__item">
			<time class="date link-list__date"><i class="fa fa-calendar-o"></i> <?php echo JHtml::_('date', $item->publish_up, JText::_('DATE_FORMAT_LC3')); ?></time>
			
			<h1 class="<?php echo $titleClass; ?>"><a href="<?php echo $url; ?>" class="anchor--incognito"><?php echo $title; ?></a></h1>

			<div class="link-list__meta">
			<?php // $tagsLayout = new JLayoutFile('content.tags', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
			<?php // echo $tagsLayout->render($item->tags->itemTags); ?>

			<span class="link-list__category"><i class="fa fa-folder-open"></i> <?php echo $this->escape($item->parent_title); ?></span>
			</div>
			<?php if (isset($images->image_intro) && !empty($images->image_intro)) : ?><a href="<?php echo $url; ?>" class="anchor--incognito"><img src="<?php echo $article['image']['src']; ?>" alt="<?php echo $article['image']['alt']; ?>" class="media link-list__image"></a><?php endif; ?>
		</article>
	</li>
<?php endforeach; ?>
</ol>
</aside>

<pre>
	<?php //print_r($this->link_items[0]); ?>
	<?php //print_r($images); ?>
</pre>

<?php  endif; ?>
