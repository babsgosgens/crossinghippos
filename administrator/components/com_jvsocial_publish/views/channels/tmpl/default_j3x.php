<?php
/**
 * @version     1.0.0
 * @package     com_jvsocial_publish
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      joomlavi <info@joomlavi.com> - http://www.joomlavi.com
 */

// No direct access
defined('_JEXEC') or die;

JHtml::_('bootstrap.tooltip');
JHtml::_('behavior.multiselect');
JHtml::_('dropdown.init');
JHtml::_('formbehavior.chosen', 'select');

$user	= JFactory::getUser();
$userId	= $user->get('id');
$listOrder	= $this->state->get('list.ordering');
$listDirn	= $this->state->get('list.direction');
$canOrder	= $user->authorise('core.edit.state', 'com_jvsocial_publish');
$saveOrder	= $listOrder == 'a.ordering';
?>
<form action="<?php echo JRoute::_('index.php?option=com_jvsocial_publish&view=channels'); ?>" method="post" name="adminForm" id="adminForm" class="jvsocial-form">
    <?php if (!empty( $this->sidebar)){ ?>
    <div id="j-sidebar-container" class="span2">
        <?php echo $this->sidebar; ?>
    </div>
    <div id="j-main-container" class="span10">
<?php }else{ ?>
    <div id="j-main-container">
<?php }?>
    <div id="filter-bar" class="btn-toolbar">
        <div class="filter-search btn-group pull-left">
            <input type="text" name="filter_search" id="filter_search" value="<?php echo $this->escape($this->state->get('filter.search')); ?>" />
        </div>
        <div class="btn-group pull-left">
            <button class="btn hasTooltip" type="submit" title="<?php echo JText::_('JSEARCH_FILTER_SUBMIT'); ?>"><i class="icon-search"></i></button>
            <button class="btn hasTooltip" type="button" title="<?php echo JText::_('JSEARCH_FILTER_CLEAR'); ?>" onclick="document.id('filter_search').value='';this.form.submit();"><i class="icon-remove"></i></button>
        </div>

        <div class="btn-group pull-right hidden-phone">
            <label for="limit" class="element-invisible"><?php echo JText::_('JFIELD_PLG_SEARCH_SEARCHLIMIT_DESC');?></label>
            <?php echo $this->pagination->getLimitBox(); ?>
        </div>
    </div>

    <div class="clearfix"> </div>

    <table class="table table-striped">
        <thead>
        <tr>
            <th width="1%">
                <input type="checkbox" name="checkall-toggle" value="" onclick="Joomla.checkAll(this)" />
            </th>
            <th class='left'>
                <?php echo JHtml::_('grid.sort', 'COM_JVSOCIAL_PUBLISH_CHANNELS_NAME', 'a.name', $listDirn, $listOrder); ?>
            </th>
            <th class="center">
                <?php echo JHtml::_('grid.sort', 'COM_JVSOCIAL_PUBLISH_CHANNELS_TYPE', 'a.type', $listDirn, $listOrder); ?>
            </th>
            <th class="center">
                <?php echo JHtml::_('grid.sort', 'COM_JVSOCIAL_PUBLISH_CHANNELS_SOURCE', 'a.source', $listDirn, $listOrder); ?>
            </th>
            <th class="center">
                <?php echo JHtml::_('grid.sort', 'COM_JVSOCIAL_PUBLISH_CHANNELS_POST', 'a.post', $listDirn, $listOrder); ?>
            </th>
            <th class="center">
                <?php echo JText::_('User');?>
            </th>
            <th width="5%">
                <?php echo JHtml::_('grid.sort', 'JPUBLISHED', 'a.state', $listDirn, $listOrder); ?>
            </th>
            <th width="1%" class="nowrap">
                <?php echo JHtml::_('grid.sort', 'JGRID_HEADING_ID', 'a.id', $listDirn, $listOrder); ?>
            </th>
        </tr>
        </thead>
        <tfoot>
            <?php
            if(isset($this->items[0])){
                $colspan = count(get_object_vars($this->items[0]));
            }
            else{
                $colspan = 10;
            }
            ?>
            <tr>
                <td colspan="<?php echo $colspan ?>">
                    <?php echo $this->pagination->getListFooter(); ?>
                </td>
            </tr>
        </tfoot>
        <tbody>
        <?php foreach ($this->items as $i => $item) :
            $ordering	= ($listOrder == 'a.ordering');
            $canCreate	= $user->authorise('core.create',		'com_jvsocial_publish');
            $canEdit	= $user->authorise('core.edit',			'com_jvsocial_publish');
            $canCheckin	= $user->authorise('core.manage',		'com_jvsocial_publish');
            $canChange	= $user->authorise('core.edit.state',	'com_jvsocial_publish');
            ?>
            <tr class="row<?php echo $i % 2; ?>">
                <td class="center"><?php echo JHtml::_('grid.id', $i, $item->id); ?></td>
                <td>
                    <?php
                    if ($item->checked_out){
                        echo JHtml::_('jgrid.checkedout', $i, $item->editor, $item->checked_out_time, 'channels.', $canCheckin);
                    }
                    if ($canEdit){?>
                        <a class="hasTooltip" data-original-title="<?php echo JText::_('COM_JVSOCIAL_PUBLISH_TIP_EDIT_CHANNEL');?>" href="<?php echo JRoute::_('index.php?option=com_jvsocial_publish&task=channel.edit&id='.(int) $item->id); ?>">
                            <?php echo $this->escape($item->name); ?>
                        </a>
                        <?php }else{
                        echo $this->escape($item->name);
                    }?>
                </td>
                <td class="center">
                    <span class="icon">
                        <i class="jvsocial-cus-<?php echo $item->type;?>"></i>&nbsp;-&nbsp;<?php echo ucwords($item->type); ?>
                    </span>
                </td>
                <td class="center">
                    <span class="icon">
                        <i class="jvsocial-cus-<?php echo $item->source;?>"></i>&nbsp;-&nbsp;<?php echo ucfirst($item->source); ?>
                    </span>
                </td>
                <td class="center">
                    <span class="icon">
                        <i class="cus-<?php if($item->post == 'auto') echo 'cog-go'; else echo 'disk';?>"></i>&nbsp;-&nbsp;<?php echo ucwords($item->post); ?>
                    </span>
                </td>
                <td class="center">
                    <div><a class="hasTooltip" data-original-title="<?php echo JText::_('COM_JVSOCIAL_PUBLISH_TIP_GO_TO_TARGET');?>" href="<?php echo Jvsocial_publishHelper::getSocialUrl($item->type, $item->params->user_username);?>" target="blank"><?php echo $item->params->user_name;?></a></div>
                    <div><img src="<?php echo $item->params->user_photo;?>"></div>
                    <?php if($item->params->target){?>
                    <?php if($item->params->groups) foreach($item->params->groups as $group) if($item->params->target == $group->id){?>
                        <div><a class="hasTooltip" data-original-title="<?php echo JText::_('COM_JVSOCIAL_PUBLISH_TIP_GO_TO_TARGET');?>" href="<?php echo Jvsocial_publishHelper::getSocialUrl($item->type, $group->id);?>" target="blank"><?php echo $group->name;?></a></div>
                        <?php }?>
                    <?php if($item->params->pages) foreach($item->params->pages as $page) if($item->params->target == $page->id){?>
                        <div><a class="hasTooltip" data-original-title="<?php echo JText::_('COM_JVSOCIAL_PUBLISH_TIP_GO_TO_TARGET');?>" href="<?php echo Jvsocial_publishHelper::getSocialUrl($item->type, $page->id);?>" target="blank"><?php echo $page->name;?></a></div>
                        <?php }?>
                    <?php }?>
                </td>
                <td class="center">
                    <?php echo JHtml::_('jgrid.published', $item->state, $i, 'channels.', $canChange, 'cb'); ?>
                </td>
                <td class="center"><?php echo (int) $item->id; ?></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <div>
        <input type="hidden" name="task" value="" />
        <input type="hidden" name="boxchecked" value="0" />
        <input type="hidden" name="filter_order" value="<?php echo $listOrder; ?>" />
        <input type="hidden" name="filter_order_Dir" value="<?php echo $listDirn; ?>" />
        <?php echo JHtml::_('form.token'); ?>
    </div>
</div>
</form>