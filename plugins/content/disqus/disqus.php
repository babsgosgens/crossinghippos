<?php
/**
 * @version     1.0
 * @package     CrossingHippos.Plugin
 * @subpackage  Content.disqus
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Babs Gösgens, Netherlands
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * Plug-in to enable loading disqus thread
 * It responds to html elements with an id of disqus_thread
 *
 * @package     CrossingHippos.Plugin
 * @subpackage  Content.disqus
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

		// Expression to search for
		$pattern		= '/<\w+\s*id="disqus_thread".*><\/\w+>/i';

		preg_match($pattern, $article->text, $matches);

		// Simple performance check to determine whether we should process further
		if (!isset($matches[0])) {
			return true;
		}

		if ( (bool) !$this->params->get('shortname', '') ) {
			$article->text = preg_replace('/{disqus.*}/i', '', $article->text);
			return true;
		}

		// Get a reference to the document object	
		$doc = JFactory::getDocument();

		if ($context == 'com_content.article')
		{

			// Build script
			$script = '';
			$script .= 'var disqus_shortname = "' . $this->params->get('shortname') . '";'; // Required - Replace example with your forum shortname

			if (isset($article->slug) && $article->slug!='') {
				$script .= 'var disqus_identifier = "' . $article->slug . '";';

				if (isset($article->catid) && $article->catid != '') {
					$url = JRoute::_(ContentHelperRoute::getArticleRoute($article->slug, $article->catid));
				}
				else {
					$url = JRoute::_(ContentHelperRoute::getArticleRoute($article->slug));
				}
				$script .= 'var disqus_url = "' . $url . '";';
			}
			if (isset($article->title) && $article->title != '') {
				$script .= 'var disqus_title = "' . $article->title . '";';
			}

			$script .= '(function() {
	        var dsq = document.createElement("script");
	        dsq.type = "text/javascript"; dsq.async = true;
	        dsq.src = "//" + disqus_shortname + ".disqus.com/embed.js";
	        (document.getElementsByTagName("head")[0] || document.getElementsByTagName("body")[0]).appendChild(dsq);
	    	})();';

			$doc->addScriptDeclaration($script);
    	}

    	else if ($context == 'com_content.featured' || $context == 'com_content.category') {

    		$html = '';
    		if( isset($vars['url']) ) {

 			
	 			// Replace with disqus container
				$html = '<p class="disquss-comments-count leader"><i class="icn icn-comments"></i>&nbsp;<a href="' . JRoute::_($vars['url']) . '" data-disqus-identifier="' . $article->slug . '"></a></p>';
				// $html = '<p class="disquss-comments-count leader"><i class="icn icn-comments"></i>&nbsp;<a href="' . $vars['url'] . '" data-disqus-identifier="' . $article->slug . '"></a></p>';
				
				// Build script
				$script = '';
				$script .= 'var disqus_shortname = "' . $this->params->get('shortname') . '";'; // Required - Replace example with your forum shortname

				$script .= '(function () {
				var s = document.createElement("script"); s.async = true;
				s.type = "text/javascript";
				s.src = "http://" + disqus_shortname + ".disqus.com/count.js";
				(document.getElementsByTagName("HEAD")[0] || document.getElementsByTagName("BODY")[0]).appendChild(s);
				}());';

				$doc->addScriptDeclaration($script);
    		}

			$article->text = preg_replace($pattern, $html, $article->text);


    	}
	}
}
