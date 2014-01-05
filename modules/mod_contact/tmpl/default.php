<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_contact
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// We can re-use the contact session data: $app->setUserState('com_contact.contact.data', null);

$gravatar = "http://www.gravatar.com/avatar/" . md5( strtolower( trim( $params->get('gravatar') ) ) ) . "?&amp;s=78";
?>
<p class="txt-center"><img src="<?php echo $gravatar; ?>" class="round outline--decorative" alt="<?php echo JText::_('MOD_CONTACT_ALT_GRAVATAR'); ?>"></p>
<h1 class="hd hd--section txt-center"><?php echo $module->title; ?></h1>
<?php echo $params->get('text'); ?>

<form action="index.php" method="post" class="leader">
	<input type="hidden" name="option" value="com_contact" />
	<input type="hidden" name="task" value="contact.submit" />
	<input type="hidden" name="id" value="1:babsgosgens" />
	<input type="hidden" name="jform[contact_subject]" value="Make contact with Crossing Hippos" />
	<input type="hidden" name="jform[contact_redirect]" value="<?php echo base64_encode( $current_url ); ?>" />
	<?php echo JHtml::_('form.token'); ?>
	<fieldset>
		<div class="fld-group--ff lt-column lt-column--half lt-gutters leader--half trailer--half">
			<label class="fld-group__label--ff" for="name">
				<?php echo JText::_('MOD_CONTACT_LABEL_NAME'); ?>
			</label>
			<div class="fld-group__input--ff">
				<input class="fld-input fld-input--ff" type="text" name="jform[contact_name]" id="name" required="required" placeholder="<?php echo JText::_('MOD_CONTACT_PLACEHOLDER_NAME'); ?>">
			</div>
		</div>
		<div class="fld-group--ff lt-column lt-column--half lt-gutters leader--half trailer--half">
			<label class="fld-group__label--ff" for="email">
				<?php echo JText::_('MOD_CONTACT_LABEL_EMAIL'); ?>
			</label>
			<div class="fld-group__input--ff">
				<input class="fld-input fld-input--ff" type="email" name="jform[contact_email]" id="email" required="required" placeholder="<?php echo JText::_('MOD_CONTACT_PLACEHOLDER_EMAIL'); ?>">
			</div>
		</div>
		<div class="fld-group--ff lt-gutters leader--half trailer--half">
			<label class="fld-group__label--ff" for="message">
				<?php echo JText::_('MOD_CONTACT_LABEL_MESSAGE'); ?>
			</label>
			<div class="fld-group__input--ff">
				<textarea class="fld-input fld-input--textarea fld-input--ff" name="jform[contact_message]" id="message" required="required" placeholder="<?php echo JText::_('MOD_CONTACT_PLACEHOLDER_MESSAGE'); ?>"></textarea>
			</div>
		</div>
	</fieldset>
	<fieldset class="txt-center leader">
		<input type="text" name="jform[contact_catchascatchcan]" class="no-speak only-bot" value="">
		<input type="submit" value="<?php echo JText::_("MOD_CONTACT_LABEL_SUBMIT"); ?>" class="btn-base soft btn btn--large lt-column--half">
	</fieldset>
</form>
<div class="custom<?php echo $moduleclass_sfx ?>" <?php if ($params->get('backgroundimage')) : ?> style="background-image:url(<?php echo $params->get('backgroundimage');?>)"<?php endif;?> >
	<?php echo $module->content;?>
</div>
