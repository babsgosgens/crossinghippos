<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Disallow access to disabled articles
if ($this->item->state == 0) {
	return false;
}

$params     = &$this->item->params;
$tags 		= &$this->item->tags;
$images     = json_decode($this->item->images);
$canEdit    = $params->get('access-edit');
$info       = $params->get('info_block_position', 0);
$url 		= JRoute::_(ContentHelperRoute::getArticleRoute($this->item->slug, $this->item->catid));
$urls    	= json_decode($this->item->urls);

$useDefList = (
	$params->get('show_modify_date') || 
	// $params->get('show_publish_date') || 
	$params->get('show_create_date') || 
	$params->get('show_hits') || 
	$params->get('show_category') || 
	$params->get('show_parent_category') || 
	$params->get('show_author') 
);

// Prepare display data for article layout
$article = array();
$article['params'] = &$params;
$article['title'] = array(
	'tag' => 'h2',
	'url' => $url,
	'title' => $this->escape($this->item->title),
	'event' =>	array(
		'after' => $this->item->event->afterDisplayTitle
		)
	);
if (isset($images->image_intro) && !empty($images->image_intro)) {
$article['image'] = array(
		'caption' => $images->image_intro_caption ? htmlspecialchars($images->image_intro_caption) : '',
		'src' => htmlspecialchars($images->image_intro),
		'alt' => $images->image_intro_alt ? htmlspecialchars($images->image_intro_alt) : '',
		'float' => 	empty($images->float_intro) ? $params->get('float_intro') : $images->float_intro
	);		
}
$article['article'] = array(
	'content' => $this->item->introtext,
	'event' => array(
		'before' => $this->item->event->beforeDisplayContent,
		'after' => $this->item->event->afterDisplayContent
		)
	);
?>


<article class="lt-column lt-column--half lt-gutters">
	<div class="box box--filled soft">
		<h1 class="hd box__title lt-gutters"><a href="<?php echo $article['title']['url'];?>#disqus_thread" class="anchor--incognito"><?php echo $article['title']['title']; ?></a></h1>
		<?php if (isset($images->image_intro) && !empty($images->image_intro)) : ?><a href="<?php echo $article['title']['url'];?>#disqus_thread" class="anchor--incognito"><img src="<?php echo $article['image']['src']; ?>" class="outline media soft"></a><?php endif; ?>
	</div>
	<?php // Article date ?>
	<?php if ($params->get('show_publish_date')) : ?>
		<time class="article__date"><?php echo JHtml::_('date', $this->item->publish_up, JText::_('DATE_FORMAT_LC3')); ?></time>
	<?php endif; ?>
</article>

