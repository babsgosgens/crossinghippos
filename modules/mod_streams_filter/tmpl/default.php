<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_login
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$requestedApi = $input->getWord('platform', '');
?>

<ul class="lt-gutters list-inline streams-filter">
<?php foreach ($platforms as $item):

	$apiUri = clone($uri);
	if ($apiUri->getPath() == "/") {
		$apiUri->setPath('/index.php');
	}
	$apiUri->setVar('platform',$item);
	$apiUri->toString();

	$class = array();
	$class[] = 'streams-filter__anchor';
	$class[] = 'streams-filter__anchor--'.$item;
	if ($requestedApi==$item) {
		$class[] = 'streams-filter__anchor--active';
	}
	?>
	<li class="tl-base">
		<a href="<?php echo $apiUri; ?>" class="<?php echo implode(' ', $class); ?>"><i class="fa <?php echo $icons[$item] ?> fa-2x hd--iconlink streams-filter__icon"></i></a>
	</li>

<?php endforeach; ?>
</ul>

<script>
jQuery(document).ready(function($) {

	var requestedApi = '<?php echo $requestedApi; ?>';

	$(".box-list__item--js")
	.on("mouseout", function(){
		if( requestedApi == $(this).data("api") ) {
			return;
		}
		$(".streams-filter__anchor").removeClass("streams-filter__anchor--active");
	})
	.on("mouseover", function(){
		if( $(this).hasClass("streams-filter__anchor--active") ) {
			return;
		}
		$(".streams-filter__anchor").trigger("mousout");
		$(".streams-filter__anchor--" + $(this).data("api") ).addClass("streams-filter__anchor--active");
	});

});
</script>