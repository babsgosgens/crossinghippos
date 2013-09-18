<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
?>
<section class="blog root">
		<?php
		// Re-index array
		$intro_items = array_values($this->items);
		$this->columns = 4;
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
</section>
