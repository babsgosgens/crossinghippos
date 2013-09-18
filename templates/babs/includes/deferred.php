<?php
/**
 * @package     Joomla.Site
 * @subpackage  Templates.crossinghippos
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens. All rights reserved.
 */

// No direct access.
defined('_JEXEC') or die;
$deferredScripts = isset($this->_deferredScripts) ? $this->_deferredScripts : array();
$inlineScripts = null;
?>
<?php foreach($deferredScripts as $script): ?>
<?php if($script['type']=='source'): ?>
<script type="text/javascript" src="<?php echo $script['value']; ?>"></script>
<?php elseif($script['type']=='inline'): ?>
<?php $inlineScripts[] = $script['value']; ?>
<?php endif; ?>
<?php endforeach; ?>
<?php if($inlineScripts!=null): ?>
<script type="text/javascript">
<!--
jQuery(function($){<?php echo implode("",$inlineScripts); ?>});
-->
</script>
<?php endif; ?>