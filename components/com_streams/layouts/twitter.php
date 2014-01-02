<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_streams
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$post = $displayData['post'];
$formatted_post = $post->text;


$entities = array();

// Find urls
if (isset($post->entities->urls)) {
	foreach ($post->entities->urls as $u) {
		$entities[$u->indices[0]] = array('type'=>'url', 'indices'=>$u->indices, 'url'=>$u->url, 'display_url'=>$u->display_url);
	}
}

// Find mentions
if (isset($post->entities->user_mentions)) {
	foreach ($post->entities->user_mentions as $um) {
		$entities[$um->indices[0]] = array('type'=>'mention', 'indices'=>$um->indices, 'screen_name'=>$um->screen_name);
	}
}

// Find media
if (isset($post->entities->media)) {
	foreach ($post->entities->media as $m) {
		if ($m->type=='photo') {
			$entities[$m->indices[0]] = array('type'=>'photo', 'indices'=>$m->indices, 'url'=>$m->url, 'display_url'=>$m->display_url, 'src'=>$m->media_url, 'src_https'=>$m->media_url_https, 'sizes'=>$m->sizes);
		}
	}
}

// Find hashtags
if (isset($post->entities->hashtags)) {
	foreach ($post->entities->hashtags as $h) {
		$entities[$h->indices[0]] = array('type'=>'hashtag', 'indices'=>$h->indices, 'text'=>$h->text);
	}
}

// Sort array by indices
krsort($entities);

// Format the entities
foreach ($entities as $entity) {
	$indices = $entity['indices'];
	$length = (int) $indices[1] - (int) $indices[0];
	$string = substr( $formatted_post , $indices[0], $length );
	switch ($entity['type']) {
		case 'mention':
			$replacement = '<a href="https://twitter.com/'.$entity['screen_name'].'"> @'.$entity['screen_name'].'</a>';
			break;
		case 'url':
			$replacement = '<a href="'.$entity['url'].'">'.$entity['display_url'].'</a>';
			break;
		case 'hashtag':
			$replacement = '<a href="https://twitter.com/search?q=%23'.$entity['text'].'&src=hash">#'.$entity['text'].'</a>';
			break;
		case 'photo':
			if (isset($entity['sizes']->thumb)) {
				$image = $entity['sizes']->thumb;
				$replacement = '<a href="'.$entity['url'].'"><img class="media soft" src="'.$entity['src'].'" alt="" >';
			}
			break;

	}
	if( isset($replacement) ) {
		$formatted_post = str_replace($string, $replacement, $formatted_post);
	}
}
?>


<time class="date"><i class="fa fa-calendar"></i> <?php echo $displayData['date']; ?></time>



<p class="lt-vertical-padding">
<?php echo $formatted_post; ?>
</p>
<a href="https://www.twitter.com/<?php echo $displayData['post']->user->screen_name; ?>" class="post__actor">
	<i class="fa fa-twitter"></i>&nbsp;
	<span><?php echo $displayData['post']->user->name;?> (@<?php echo $displayData['post']->user->screen_name;?>)</span>
</a>

