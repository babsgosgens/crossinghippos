<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_login
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

?>

<ul class="lt-gutters list-inline list-icons">
<?php foreach ($platforms as $item): ?>
	<li class="tl-base  list-icons__icon">
		<a href="?platform=<?php echo $item; ?>"><i class="fa <?php echo $icons[$item] ?> fa-2x hd--iconlink"></i></a>
	</li>
<?php endforeach; ?>
</ul>