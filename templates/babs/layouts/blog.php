<?php
/**
 * @package     Joomla.Site
 * @subpackage  Templates.crossinghippos
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens. All rights reserved.
 */

// No direct access.
defined('_JEXEC') or die;
?>

<jdoc:include type="message" />
<div class="component-top">
	<jdoc:include type="modules" name="component-top" style="raw" headerLevel="2" />
</div>
<div class="$option component">
	<div class="component-output">
		<jdoc:include type="component" />
		<div class="component-bottom">
			<jdoc:include type="modules" name="component-bottom" style="raw" headerLevel="2" />
		</div>
	</div>
</div>
