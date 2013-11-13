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

<i class="fa fa-<?php echo $item; ?>-square fa-2x"></i>

<?php endforeach; ?>