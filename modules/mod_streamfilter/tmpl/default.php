<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_login
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$icons = array('twitter' => 'fa fa-twitter-square fa-2x',
			   'facebook' => 'fa fa-facebook-square fa-2x',
			   'github' => 'fa fa-github-square fa-2x',
			   'dribbble' => 'fa fa-dribbble fa-2x',
			   'flickr' => 'fa fa-flickr fa-2x',
			   'behance' => 'fa fa-bug fa-2x',
			   'googleplus' => 'fa fa-google-plus-square fa-2x',
			   'linkedin' => 'fa fa-linkedin-square fa-2x',
			   'tumblr' => 'fa fa-tumblr-square fa-2x');
?>

<?php foreach ($platforms as $item): ?>

	<a href="?platform=<?php echo $item; ?>"><i class="<?php echo $icons[$item]; ?>"></i></a>

<?php endforeach; ?>