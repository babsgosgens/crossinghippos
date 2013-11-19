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

<?php foreach ($platforms as $item): ?>

		<a href="?platform=<?php echo $item; ?>"><i class="fa <?php echo $icons[$item] ?> fa-2x hd--iconlink"></i></a>

<?php endforeach; ?>