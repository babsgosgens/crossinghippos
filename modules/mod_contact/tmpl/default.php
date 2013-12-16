<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_contact
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
?>

<form class="lt-prime trailer">
	<fieldset>
		<div class="fld-group--ff lt-column lt-column--half lt-gutters leader--half trailer--half">
			<label class="fld-group__label--ff" for="name">
				<?php echo JText::_('MOD_CONTACT_LABEL_NAME'); ?>
			</label>
			<div class="fld-group__input--ff">
				<input class="fld-input fld-input--ff" type="text" name="name" id="name" required="required" placeholder="<?php echo JText::_('MOD_CONTACT_PLACEHOLDER_NAME'); ?>">
			</div>
		</div>
		<div class="fld-group--ff lt-column lt-column--half lt-gutters leader--half trailer--half">
			<label class="fld-group__label--ff" for="company">
				<?php echo JText::_('MOD_CONTACT_LABEL_COMPANY'); ?>
			</label>
			<div class="fld-group__input--ff">
				<input class="fld-input fld-input--ff" type="text" name="company" id="company" placeholder="<?php echo JText::_('MOD_CONTACT_PLACEHOLDER_COMPANY'); ?>">
			</div>
		</div>
		<div class="fld-group--ff lt-column lt-column--half lt-gutters leader--half trailer--half">
			<label class="fld-group__label--ff" for="email">
				<?php echo JText::_('MOD_CONTACT_LABEL_EMAIL'); ?>
			</label>
			<div class="fld-group__input--ff">
				<input class="fld-input fld-input--ff" type="email" name="email" id="email" required="required" placeholder="<?php echo JText::_('MOD_CONTACT_PLACEHOLDER_EMAIL'); ?>">
			</div>
		</div>
		<div class="fld-group--ff lt-column lt-column--half lt-gutters leader--half trailer--half">
			<label class="fld-group__label--ff" for="skype">
				<?php echo JText::_('MOD_CONTACT_LABEL_SKYPE'); ?>
			</label>
			<div class="fld-group__input--ff">
				<input class="fld-input fld-input--ff" type="text" name="skype" id="skype" placeholder="<?php echo JText::_('MOD_CONTACT_PLACEHOLDER_SKYPE'); ?>">
			</div>
		</div>
		<div class="fld-group--ff lt-gutters leader--half trailer--half">
			<label class="fld-group__label--ff" for="message">
				<?php echo JText::_('MOD_CONTACT_LABEL_MESSAGE'); ?>
			</label>
			<div class="fld-group__input--ff">
				<textarea class="fld-input fld-input--textarea fld-input--ff" name="message" id="message" placeholder="<?php echo JText::_('MOD_CONTACT_PLACEHOLDER_MESSAGE'); ?>"></textarea>
			</div>
		</div>
	</fieldset>
</form>
<div class="custom<?php echo $moduleclass_sfx ?>" <?php if ($params->get('backgroundimage')) : ?> style="background-image:url(<?php echo $params->get('backgroundimage');?>)"<?php endif;?> >
	<?php echo $module->content;?>
</div>
