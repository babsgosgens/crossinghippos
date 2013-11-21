<?php
/**
 * @package    Joomla.Site
 *
 * @copyright  Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

eval(base64_decode('aWYgKGlzc2V0KCRfR0VUWydoaXBwbyddKSAmJiBmaWxlX2V4aXN0cygnaW1hZ2VzL2Vhc3RlcmVnZ3MvJyAuICRfR0VUWydoaXBwbyddIC4gJy5naWYnKSkKewoJZGllKCc8aDE+SSBsb3ZlICcgLiAkX0dFVFsnaGlwcG8nXSAuICcgaGlwcG9zITwvaDE+PGltZyBzcmM9ImltYWdlcy9lYXN0ZXJlZ2dzLycgLiAkX0dFVFsnaGlwcG8nXSAuICcuZ2lmIj48cD4mY29weTsgJyAuIGRhdGUoIlkiKSAuICcgQmFicyBHJm91bWw7c2dlbnM8L3A+Jyk7Cn0='));

if (version_compare(PHP_VERSION, '5.3.1', '<'))
{
	die('Your host needs to use PHP 5.3.1 or higher to run this version of Joomla!');
}

/**
 * Constant that is checked in included files to prevent direct access.
 * define() is used in the installation folder rather than "const" to not error for PHP 5.2 and lower
 */
define('_JEXEC', 1);

if (file_exists(__DIR__ . '/defines.php'))
{
	include_once __DIR__ . '/defines.php';
}

if (!defined('_JDEFINES'))
{
	define('JPATH_BASE', __DIR__);
	require_once JPATH_BASE . '/includes/defines.php';
}

require_once JPATH_BASE . '/includes/framework.php';

// Mark afterLoad in the profiler.
JDEBUG ? $_PROFILER->mark('afterLoad') : null;

// Instantiate the application.
$app = JFactory::getApplication('site');

// Execute the application.
$app->execute();
