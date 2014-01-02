<?php
/**
 * @version     1.0
 * @subpackage  plg_content_disqus
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Babs Gösgens, Netherlands
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * Plug-in to enable loading modules into content (e.g. articles)
 * This uses the {loadmodule} syntax
 *
 * @package     Joomla.Plugin
 * @subpackage  Content.loadmodule
 * @since       1.5
 */
class PlgContentDisqus extends JPlugin
{
	protected static $modules = array();

	protected static $mods = array();

	/**
	 * Plugin that loads module positions within content
	 *
	 * @param   string   $context   The context of the content being passed to the plugin.
	 * @param   object   &$article  The article object.  Note $article->text is also available
	 * @param   mixed    &$params   The article params
	 * @param   integer  $page      The 'page' number
	 *
	 * @return  mixed   true if there is an error. Void otherwise.
	 *
	 * @since   1.6
	 */
	public function onContentPrepare($context, &$article, &$params, $page = 0)
	{
		// Don't run this plugin when the content is being indexed
		if ($context == 'com_finder.indexer')
		{
			return true;
		}
		// if ($context == 'com_content.featured')
		// {
		// 	return true;
		// }

		// Expression to search for
		$pattern		= '/{disqus\s?(.*?)}/i';

		preg_match($pattern, $article->text, $matches);

		// Simple performance check to determine whether we should process further
		if (!isset($matches[0])) {
			return true;
		}

		if ( (bool) !$this->params->get('shortname', '') ) {
			$article->text = preg_replace('/{disqus.*}/i', '', $article->text);
			return true;
		}


		// Extract variables (if any) from the disqus string
		if ($matches[1] != '') {
			if (preg_match_all('/(\w+)="([^"]*)"/', $matches[1], $vars)) {
			    $vars = array_combine($vars[1], $vars[2]);
			} else {
			    $vars = array();
			}
		}

		if ($context == 'com_content.article')
		{

			// Replace with disqus container
			$html = '<div id="disqus_thread" class="disquss"></div>';
			$article->text = preg_replace('/{disqus.*}/i', $html, $article->text);

			// Build script
			$script = '';
			$script .= 'var disqus_shortname = "' . $this->params->get('shortname') . '";'; // Required - Replace example with your forum shortname

			if (isset($vars['id'])) {
				$script .= 'var disqus_identifier = "' . $vars['id'] . '";';
			}
			else {
				$script .= 'var disqus_identifier = "' . $article->slug . '";';
			}

			if (isset($vars['title'])) {
				$script .= 'var disqus_title = "' . $vars['title'] . '";';
			}
			else {
				$script .= 'var disqus_title = "' . $article->title . '";';
			}

			if (isset($vars['url'])) {
				$script .= 'var disqus_url = "' . $vars['url'] . '";';
			}

			$script .= '(function() {
	        var dsq = document.createElement("script");
	        dsq.type = "text/javascript"; dsq.async = true;
	        dsq.src = "//" + disqus_shortname + ".disqus.com/embed.js";
	        (document.getElementsByTagName("head")[0] || document.getElementsByTagName("body")[0]).appendChild(dsq);
	    	})();';
			
			$doc = JFactory::getDocument();
			$doc->addScriptDeclaration($script);
    	}
    	else if ($context == 'com_content.featured') {
 			// Replace with disqus container
			$html = '<p class="disquss-comments-count leader"><i class="icn icn-comments"></i>&nbsp;<a href="' . $vars['url'] . '" data-disqus-identifier="' . $article->slug . '"></a></p>';
			$article->text = preg_replace('/{disqus.*}/i', $html, $article->text);
    	}
	}
}
