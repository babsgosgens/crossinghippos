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

<ul class="list-inline streams-filter leader--double">
<?php foreach ($platforms as $item):

	$apiUri = clone($uri);
	if ($apiUri->getPath() == "/") {
		$apiUri->setPath('/index.php');
	}
	$apiUri->setVar('platform',$item);
	$apiUri->toString();

	$class = array();
	$class[] = 'lt-gutters--half streams-filter__anchor';
	$class[] = 'streams-filter__anchor--'.$item;
	if ($requestedApi==$item) {
		$class[] = 'streams-filter__anchor--current';
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

	$(".box--js")
	.on("mouseout", function(){
		$(".streams-filter__anchor").removeClass("streams-filter__anchor--active");
	})
	.on("mouseover", function(){
		$(".streams-filter__anchor").trigger("mousout");
		$(".streams-filter__anchor--" + $(this).data("api") ).addClass("streams-filter__anchor--active");
	});

});
</script>