<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_weblinks
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
?>
<script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
<script>
$(function() {
  $(".scrollable").scrollable();
});
</script>
<style>
.scrollable {
  position:relative;
  overflow:hidden;
}

.scrollable .items {
  width:20000em;
  position:absolute;
}

article
{
	float: left;
	width: 150px;
	height: 200px;
	overflow: hidden;
}

div .grouped
{
	float: left;
}

.avatar
{
	width: 32px;
	height: 32px;
}

.postimage
{
	width: 64px;
	height: 64px;
}

.intro
{
	background-color: grey;
	width: 550px;
	height: 200px;
}
</style>

<div class="scrollable" id="scrollable" style="height: 205px;">
  <div class="items">

  	<article class="stream intro">
  		<p>
  			Hello, this is a small intro block.
  			I describe unnecessery info here.
  			And this is also not interesting.
  		</p>
  	</article>

  <?php

  	$count = 1;

	foreach($this->items as $item) 
	{
		$date = new JDate($item->date_created);
		$platform = $item->platform;
		$this->post = $item->php;

	    if ($count%4 == 1)
	    {  
	         echo '<div class="grouped">';
	    }

	    echo '<article class="stream ' . $platform . '">';
	    echo $this->loadTemplate($platform);
	    echo '<time>' . $item->date_created = $date->format( JText::_('DATE_FORMAT_LC2') ) . '</time>';
	    echo '</article>';

	    if ($count%4 == 0)
	    {
	        echo '</div>';
	    }

	    $count++;
	}

	//This is to ensure there is no open div if it's not a multiple of 4 at the end
	if ($count%4 != 1) echo "</div>";

?>

  </div>
</div>

<a class="prev browse left">back</a>&nbsp;
<a class="next browse right">next</a>
</div>

<div class="pagination" style="display: none;">
	<p class="counter pull-right">
		<?php echo $this->pagination->getPagesCounter(); ?>
	</p>
	<?php echo $this->pagination->getPagesLinks(); ?>
</div>
