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


/*
 * The plugin is only triggered for child articles
 * Trigger the plugin manually to retrieve the project data
 */
$this->category->text = ''; // LoadModule plugin expects this attribute to exist - report as bug!
JPluginHelper::importPlugin('content'); 
$dispatcher = JEventDispatcher::getInstance();
$project = $dispatcher->trigger( 'onContentPrepare', array('com_content.category', &$this->category, &$this->params) );

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
$pattern = '/<figure.+\/figure>/';
if( preg_match($pattern, $this->category->description, $images) )
{
	$this->category->description = preg_replace('/<figure.+\/figure>/', '', $this->category->description);
	$image = $images[0];
}

// print_r($this->category);
?>

<section class="section lt-root">
	
	<header class="title-selector  txt-l  lt-gutters">
		<a href="<?php echo JRoute::_(ContentHelperRoute::getCategoryRoute($this->category->parent_id));?>" class="anchor--incognito title-selector__parent"><?php echo $this->escape($this->params->get('page_heading', 'Projects')); ?></a>&nbsp;
		<h1 class="hd title-selector__title">
			<?php echo $this->escape($this->params->get('page_subheading')); ?>
			<span class="subheading-category"><?php echo $this->category->title;?></span>&nbsp;
			<span class="fa fa-sort title-selector__trigger"></span>
		</h1>
	</header>

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
			<dl class="lt-column lt-gutter-right trailer--double">

				<dt class="lt-base lt-column--third-persistent  underline--dashed" style="vertical-align: bottom;"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_PROJECT'); ?></dt>
				<dd class="lt-base lt-column--two-third-persistent  underline--dashed">
					<?php if ($this->params->get('show_description_image') && $this->category->getParams()->get('image')) : ?>
					<div class="lt-column lt-column--two-third-persistent trailer--half">
						<img src="<?php echo $this->category->getParams()->get('image'); ?>" class="media">
					</div>
					<?php endif; ?>
					<div><?php echo $this->category->title;?></div>
				</dd>

				<?php if (isset($project['projectclient']) && !empty($project['projectclient'])): ?>
				<dt class="lt-base lt-column--third-persistent  underline--dashed"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_CLIENT'); ?></dt>
				<dd class="lt-base lt-column--two-third-persistent  underline--dashed"><?php echo $project['projectclient']; ?></dd>
				<?php endif; ?>

				<?php if (isset($project['projectcontractor']) && !empty($project['projectcontractor'])): ?>
				<dt class="lt-base lt-column--third-persistent  underline--dashed"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_CONTRACTOR'); ?></dt>
				<dd class="lt-base lt-column--two-third-persistent  underline--dashed"><?php echo $project['projectcontractor']; ?></dd>
				<?php endif; ?>

				<?php if (isset($project['projectstart']) && !empty($project['projectstart'])): ?>
				<dt class="lt-base lt-column--third-persistent  underline--dashed"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_PROJECTSTART'); ?></dt>
				<dd class="lt-base lt-column--two-third-persistent  underline--dashed"><?php echo $project['projectstart']; ?></dd>
				<?php endif; ?>

				<?php if (isset($project['projectend']) && !empty($project['projectend'])): ?>
				<dt class="lt-base lt-column--third-persistent  underline--dashed"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_PROJECTEND'); ?></dt>
				<dd class="lt-base lt-column--two-third-persistent  underline--dashed"><?php echo $project['projectend']; ?></dd>
				<?php endif; ?>

				<?php if (isset($project['projecturl']) && !empty($project['projecturl'])): ?>
				<dt class="lt-base lt-column--third-persistent"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_WEBSITE'); ?></dt>
				<dd class="lt-base lt-column--two-third-persistent"><a href="<?php echo $project['projecturl']; ?>"><?php echo $project['projecturl']; ?></a></dd>
				<?php endif; ?>
			</dl>
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
	<div class="lt-prime lt-prime--tags lt-prime--alpha-beta lt-gutters">
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
		<?php $tagsLayout = new JLayoutFile('content.tags', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
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

<?php if (!empty($this->links_items)) : ?>
<?php  endif; ?>

<?php if (!empty($this->link_items)) : ?>


<aside class="leader--double lt-root">
<h1 class="lt-column lt-column--fourth lt-gutters hd"><?php echo JText::sprintf('TPL_CROSSINGHIPPOS_TITLE_PROJECT_ARTICLES', $this->category->title); ?></h1>
<ol class="lt-column lt-column--half link-list">
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
			<?php $tagsLayout = new JLayoutFile('content.tags', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
			<?php echo $tagsLayout->render($item->tags->itemTags); ?>

			<span class="link-list__category"><i class="fa fa-folder-open"></i> <?php echo $this->escape($item->parent_title); ?></span>
			</div>
			<a href="<?php echo $url; ?>" class="anchor--incognito"><img src="<?php echo $article['image']['src']; ?>" alt="<?php echo $article['image']['alt']; ?>" class="media link-list__image"></a>
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
