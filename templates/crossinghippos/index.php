<?php
/**
 * @package     WinTOP
 * @subpackage  tmp_nszonetaxi
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Transvision B.V., Netherlands
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access.
defined('_JEXEC') or die;
include(JPATH_SITE.'/templates/'.$this->template.'/template/template.php');
?>

<!DOCTYPE html>
<!-- <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>" class="no-js"> -->
<html lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>" class="no-js">
<head>
    <meta http-equiv="x-ua-compatible" content="IE=9">
    <jdoc:include type="head" />
    <link rel="apple-touch-icon" href="webclip-72x72v2.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="webclip-72x72v2.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="webclip-114x114v2.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="webclip-144x144v2.png" />
    <!-- <link href='http://fonts.googleapis.com/css?family=Asap:400,700,700italic,400italic' rel='stylesheet' type='text/css'> -->
    <style type="text/css">
    .root {
      overflow: auto;
    }
    </style>
</head>
<body>
  <header role="banner" class="banner">
    <div class="root">
      <h1 class="banner-title">Crossing Hippos<span class="banner-subtitle">webdesign met overbite</span></h1>
      <nav role="navigation" class="navbar">
        <jdoc:include type="modules" name="mainnav" />
      </nav>
    </div>
  </header>
  <div class="body">
    <span class="page-header"><?php echo $pageTitle;?></span>
    <div class="root" style="min-height: 500px;">
      <nav class="navbar">
        <jdoc:include type="modules" name="breadcrumbs" />
      </nav>
      <jdoc:include type="message"/>
      <jdoc:include type="modules" name="content-top" />
      <jdoc:include type="modules" name="position-6" />
      <jdoc:include type="modules" name="component-modules" style="raw" />
  </div>
  <footer class="footer">
    <div class="root">
      <article class="fourth column">
        <h1>Lorem ipsum</h1>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vehicula nisl 
          ac justo tempus, ac lacinia massa bibendum. Proin nec diam egestas, dignissim purus ac, volutpat leo
        </p>
      </article>
      <article class="fourth column">
        <h1>Lorem ipsum</h1>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vehicula nisl 
          ac justo tempus, ac lacinia massa bibendum. Proin nec diam egestas, dignissim purus ac, volutpat leo
        </p>
      </article>
      <article class="fourth column">
        <h1>Lorem ipsum</h1>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vehicula nisl 
          ac justo tempus, ac lacinia massa bibendum. Proin nec diam egestas, dignissim purus ac, volutpat leo
        </p>
      </article>
      <article class="fourth column">
        <h1>Lorem ipsum</h1>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vehicula nisl 
          ac justo tempus, ac lacinia massa bibendum. Proin nec diam egestas, dignissim purus ac, volutpat leo
        </p>
      </article>
    </div>
  </footer>
    <jdoc:include type="modules" name="debug" />

    <script type="text/javascript">

      // Fonts
      var webkit = "WebkitAppearance" in document.body.style;
      if(webkit) {
        document.getElementsByTagName('html')[0].className+=' webkit';
      }

      var i = 0;
      // Fonts
      WebFontConfig = {<?php echo $params->get('webFontConfig'); ?>};
      (function() {
        var wf   = document.createElement('script');
        wf.src   = ('https:' == document.location.protocol ? 'https' : 'http') + '://ajax.googleapis.com/ajax/libs/webfont/<?php echo $params->get('webFontVersion'); ?>/webfont.js';
        wf.type  = 'text/javascript';
        wf.async = 'false';
        var s    = document.getElementsByTagName('script')[i]; s.parentNode.insertBefore(wf, s);
        i++;
      })();

      // jQuery
      (function() {
        if(window.jQuery == undefined) {
          var jq = document.createElement('script'); jq.type = 'text/javascript'; jq.async = true;
          jq.src = '<?php echo $path_to_local_jquery ?>';
          var s = document.getElementsByTagName('script')[i]; s.parentNode.insertBefore(jq, s);
          i++;
        }
      })();

      // Google Analytics Tracking Code
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-12737688-1']);
      _gaq.push(['_setDomainName', 'crossinghippos.com']);
      _gaq.push(['_setAllowLinker', true]);
      _gaq.push(['_trackPageview']);
      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[i]; s.parentNode.insertBefore(ga, s);
        i++;
      })();

    </script>
</body>
</html>
