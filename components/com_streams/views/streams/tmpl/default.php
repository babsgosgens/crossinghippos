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
  /* required settings */
  position:relative;
  overflow:hidden;
  width: 605px;
}
 
.scrollable .items {
  /* this cannot be too large */
  width:20000em;
  position:absolute;
}

article
{
	float: left;
	width: 300px;
	height: 200px;
}

.avatar
{
	width: 32px;
	height: 32px;
}

.postimage
{
	width: 32px;
	height: 32px;
}

.intro
{
	background-color: grey;
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

<?php if ( empty($this->items) ):
	?>
	<p>Geen resultaten</p>
	<?php else: 

			// echo '<pre>';
			// print_r($this->items);
			// echo '</pre>';

			foreach ($this->items as $item) :

			// echo '<pre>';
			// print_r($item);
			// echo '</pre>';
			$date = new JDate($item->date_created);
			$platform = $item->platform;

			$this->post = $item->php;
			?>
			<article class="stream <?php echo $platform; ?>">
				<?php echo $this->loadTemplate($platform); ?>
				<time><?php echo $item->date_created = $date->format( JText::_('DATE_FORMAT_LC2') ); ?></time>
			</article>
		<?php endforeach; ?>
<?php endif; ?>

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
