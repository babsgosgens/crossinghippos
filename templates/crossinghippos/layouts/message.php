<?php
/**
 * @package     Joomla.CMS
 * @subpackage  Layout
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('JPATH_BASE') or die;
// var_dump($displayData);exit;
?>
<?php foreach($displayData as $type => $messages): ?>
<div id="system-message-container" class="lt-root">
	<div id="system-message" class="lt-column lt-gutters lt-vertical-padding">
	    <?php foreach ($messages as $message): ?>
		<div class="alert alert-message box box--filled box--outline trailer">
			<?php /*<a class="close btn btn--close lt-gutters soft hd" data-dismiss="alert">×</a>*/ ?>
			<h4 class="hd alert-heading"><?php echo JText::_($type); ?></h4>
			<div><p><?php echo $message; ?></p></div>
		</div>
		<?php endforeach; ?>
	</div>
</div>
<?php endforeach; ?>


