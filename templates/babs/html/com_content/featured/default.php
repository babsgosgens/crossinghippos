<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// JHtml::addIncludePath(JPATH_COMPONENT . '/helpers');
// JHtml::_('behavior.caption');

$doc = JFactory::getDocument();
// $doc->addScript(JUri::root().'media/crossinghippos/js/jquery.crossinghippos.js');
$doc->addScriptDeclaration('$(\'.stream\').slider();');
?>
<section class="featured">
	<div class="stream">
		<div class="unit-set">
			<div class="unit-set-subset intro">
				<header class="unit-set-item">
					<h1 class="item-title"><?php echo JText::_('CROSSINGHIPPOS_FEATURED_INTRO_TITLE'); ?></h1>
					<p class="item-intro"><?php echo JText::_('CROSSINGHIPPOS_FEATURED_INTRO_TEXT'); ?></p>
				</header>
			</div><?php if (!empty($this->lead_items)) : ?><div
				class="unit-set-subset"><?php foreach ($this->lead_items as &$item) : ?><div
				class="unit-set-item">
						<?php
							$this->item = &$item;
							echo $this->loadTemplate('item');
						?>
					</div><?php endforeach; ?>
			</div>
			<?php endif; ?>
		</div>
		<?php
		// Re-index array
		$intro_items = array_values($this->intro_items);
		$introcount = (count($intro_items));
		if($introcount>0):
			$pages = ceil( $introcount / (int) $this->columns );
			for($i=0; $i<$pages; $i++):
				echo '<div class="unit-set">';
				$k=0; for($j=0; $j<(int)$this->columns; $j++):
					$key = $j+($i*$this->columns);
					if(isset($intro_items[$key])):
						$this->item = $intro_items[$key];
						if($k%2==0):
							echo '<div class="unit-set-subset">';
						endif;
						echo '<div class="unit-set-item">';
						echo $this->loadTemplate('item');
						echo '</div>';
						if($k%2==1 || $key==$introcount-1):
							echo '</div>';
						endif;
					endif;
				$k++; endfor;
				echo '</div>';
			endfor; ?>
		<?php endif; ?>
	</div>
</section>
<nav class="slider-navigation">
	<ul class="slider-navigation-buttons">
		<li class="slider-navigation-button-previous"><a href="" class="button slide-toggle previous"><i class="icon-chevron-left"></i><span class="verbose"><?php echo JText::_('Previous'); ?></span></a></li>
		<li class="slider-navigation-button-next"><a href="" class="button slide-toggle next"><i class="icon-chevron-right"></i><span class="verbose"><?php echo JText::_('Next'); ?></span></a></li>
	</ul>
</nav>