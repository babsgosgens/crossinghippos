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

		<a href="?platform=<?php echo $item; ?>"><i class="<?php echo $icons[$item] ?>"></i></a>

<?php endforeach; ?>