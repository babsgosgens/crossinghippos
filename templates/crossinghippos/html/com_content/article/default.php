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

$input = JFactory::getApplication()->input;
$itemid = $input->getInt('Itemid');

$document	= JFactory::getDocument();
$params 	= $this->item->params;
$images  	= json_decode($this->item->images);
$url 		= JRoute::_(ContentHelperRoute::getArticleRoute($this->item->slug, $this->item->catid));
$urls    	= json_decode($this->item->urls);
$canEdit 	= $params->get('access-edit');
$user    	= JFactory::getUser();
$info    	= $params->get('info_block_position', 0);

$useDefList = (
	$params->get('show_modify_date')	 || 
	$params->get('show_publish_date')	 || 
	$params->get('show_create_date')	 || 
	$params->get('show_hits')			 || 
	$params->get('show_category') 	  	 || 
	$params->get('show_parent_category') || 
	$params->get('show_author')
);

// Check for images
$image = null;
$hasIntroImage = isset($images->image_intro) && !empty($images->image_intro);
$hasFullArticleImage = isset($images->image_fulltext) && !empty($images->image_fulltext);
$hasTags = $params->get('show_tags', 1) && !empty($this->item->tags);

if ( $hasFullArticleImage ) {
	$image = array();
	$image['src'] = $images->image_fulltext;
	$image['caption'] = $images->image_fulltext_caption;
	$image['alt'] = $images->image_fulltext_alt;
	$image['float'] = $images->float_intro;
}
else if ( $hasIntroImage ) {
	$image = array();
	$image['src'] = $images->image_intro;
	$image['caption'] = $images->image_intro_caption;
	$image['alt'] = $images->image_intro_alt;
	$image['float'] = $images->float_fulltext;
}

// Prepare display data for article layout
$article = array();
$article['params'] = &$params;
$article['title'] = array(
	'tag' => 'h1',
	'url' => $url,
	'title' => $this->escape($this->item->title),
	'event' =>	array(
		'after' => $this->item->event->afterDisplayTitle
		)
	);
if (!is_null($image)) {
	$article['image'] = $image;
	$article['image']['figureClass'] = '';
	$article['image']['imageClass'] = 'lt-prime article__intro-image';
	$article['url'] = $url;
}
$article['article'] = array(
	'toc' => isset ($this->item->toc) ? $this->item->toc : '',
	'content' => $this->item->text,
	'event' => array(
		'before' => $this->item->event->beforeDisplayContent,
		'after' => $this->item->event->afterDisplayContent
		)
	);

// <!-- for Google -->
// $document->addCustomTag('<meta name="copyright" content="Crossing Hippos" /> ');
$document->addCustomTag('<meta name="application-name" content="Crossing Hippos" /> ');

// <!-- for Facebook -->          
$document->addCustomTag('<meta property="og:title" content="'.$article['title']['title'].'"/> ');
$document->addCustomTag('<meta property="og:type" content="article"/> ');
$document->addCustomTag('<meta property="og:url" content="'.str_replace('//', '/', JUri::root() . $url).'"/> ');
if ($params->get('page_description') != '') {
	$document->addCustomTag('<meta property="og:site_name" content="'.$params->get('page_description').'"/> ');
}
if (!is_null($image)) { 
	$document->addCustomTag('<meta property="og:image" content="'.str_replace('//', '/', JUri::root() . $image['src']).'"/> ');
}

// <!-- for Twitter -->          
$document->addCustomTag('<meta name="twitter:card" content="summary"/> ');
$document->addCustomTag('<meta name="twitter:title" content="'.$article['title']['title'].'"/> ');
if ($params->get('page_description') != '') {
	$document->addCustomTag('<meta name="twitter:description" content="'.$params->get('page_description').'"/> ');
}
if (!is_null($image)) { 
	$document->addCustomTag('<meta name="twitter:image" content="'.str_replace('//', '/', JUri::root() . $image['src']).'"/> ');
}


$identifier = 'categories';

$parentTitle = $this->escape($this->item->parent_title);
$parentUrl = JRoute::_(ContentHelperRoute::getCategoryRoute($this->item->parent_slug));
$categoryTitle = $this->escape($this->item->category_title);
$categoryUrl = JRoute::_(ContentHelperRoute::getCategoryRoute($this->item->catslug));

// echo '<pre>';
// print_r($article);
// echo '</pre>';
?>



<?php if ($hasIntroImage) :?>
<div class="box--filled">
	<div class="lt-root">
		<?php $articleLayout = new JLayoutFile('content.image', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
		<?php echo $articleLayout->render($article['image']); ?>
	</div>
</div>	
<?php endif; ?>

<article class="article<?php echo $this->pageclass_sfx?> lt-root">

<header class="leader--half lt-prime lt-prime--clear lt-gutters">
	<?php if ($params->get('show_title')) :?>
	<<?php echo $article['title']['tag']; ?> class="hd hd--article">
		<a href="<?php echo $article['title']['url']; ?>" class="anchor--incognito"><?php echo $article['title']['title']; ?></a>
	</<?php echo $article['title']['tag']; ?>>
	<?php endif; ?>
	<?php // Article date ?>
	<?php if ($params->get('show_publish_date')) : ?>
		<time class="date link-list__date trailer lt-column" datetime="<?php echo JHtml::_('date', $this->item->publish_up, 'Y-m-d').'T'.JHtml::_('date', $this->item->publish_up, 'H:i'); ?>"><i class="fa fa-calendar-o"></i> <?php echo JHtml::_('date', $this->item->publish_up, JText::_('DATE_FORMAT_LC3')); ?> <span><a href="https://twitter.com/babsgosgens"><i class="icn icn-twitter"></i>@babsgosgens</a></span></time>

	<?php endif; ?>
</header>
	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * PRIMARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-prime lt-prime--alpha-beta lt-gutters<?php if ($hasTags) : ?> divider<?php endif; ?>">

		<?php $articleLayout = new JLayoutFile('content.article.body', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
		<?php echo $articleLayout->render($article); ?>


		<?php echo $this->item->event->afterDisplayContent; ?>


    
    

	<?php if (!empty($this->item->pagination) && $this->item->pagination && !$this->item->paginationposition && $this->item->paginationrelative)
	{
		echo $this->item->pagination;
	}
	?>

	<script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'crossinghippos'; // required: replace example with your forum shortname

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
    

	</div>

	
	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * SECONDARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-alpha lt-gutters">
		<?php if ($hasTags) : ?>
			<?php $tagsLayout = new JLayoutFile('content.tags.button', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
			<?php echo $tagsLayout->render($this->item->tags->itemTags); ?>
		<?php endif; ?>	
	</div>

	
	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * TERTIARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-beta lt-gutters">
		<?php if (isset($this->item->project)): ?>
		<?php $project = $this->item->project; ?>
		<dl class="lt-column lt-gutter-right trailer">

			<?php if (!empty($this->item->parent_slug)) : ?>
			<dt  class="lt-base lt-column--third-persistent  underline--dashed"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_PROJECT'); ?></dt>
			<dd class="lt-base lt-column--two-third-persistent  underline--dashed"><a href="<?php echo $categoryUrl; ?>" class="hd"><?php echo $categoryTitle;?></a></dd>
			<?php endif; ?>

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
			<dd class="lt-base lt-column underline--dashed"><a href="<?php echo $project['projecturl']; ?>"><?php echo $project['projecturl']; ?></a></dd>
			<?php endif; ?>
		</dl>
	<?php endif; ?>
	</div>


	<?php /*
		$share_uri = str_replace('//', '/', JUri::root() . $url);
		$share_twitter = "http://twitter.com/share?url=$share_uri&amp;via=crossinghippos&amp;text=".$article['title']['title'];
		$share_facebook = "https://www.facebook.com/sharer/sharer.php?u=$share_uri";
		$share_gplus = "https://plus.google.com/share?url=$share_uri";
	?>
	<ul class="list-inline">
		<li class="twitter"><a 
			href="<?php echo $share_twitter; ?>" 
			class="soft btn btn--icn btn--twitter" 
			target="_blank"
			onclick="window.open('<?php echo $share_twitter; ?>','', 'width=715,height=450'); return false"
			title="<?php echo JText::_('Share on Twitter'); ?>"><i class="icn icn-twitter"></i></a></li>
		<li class="facebook lt-gutters"><a 
			href="<?php echo $share_facebook; ?>" 
			onclick="window.open('<?php echo $share_facebook; ?>','', 'width=715,height=450'); return false"
			target="_blank"
			class="soft btn btn--icn btn--facebook" 
			title="<?php echo JText::_('Share on Facebook'); ?>"><i class="icn icn-facebook"></i></a></li>
		<li class="gplus"><a 
			href="<?php echo $share_gplus; ?>" 
			onclick="window.open('<?php echo $share_gplus ?>','', 'width=715,height=450'); return false" 
			target="_blank"
			class="soft btn btn--icn btn--googleplus" 
			title="<?php echo JText::_('Share on Google Plus'); ?>"><i class="icn icn-googleplus"></i></a></li>
	</ul>
	</div>
	*/ ?>


</article>
