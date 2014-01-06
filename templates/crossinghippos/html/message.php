<?php
/**
 * @package     Crossing Hippos
 * @subpackage  Template.Crossinghippos
 *
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Babs Gösgens
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

function renderMessage($msgList)
{
	$layout = new JLayoutFile('message', JPATH_SITE . '/templates/crossinghippos/layouts/');
    return $layout->render($msgList);
}
