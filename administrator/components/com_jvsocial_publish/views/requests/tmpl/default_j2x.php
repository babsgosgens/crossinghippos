<?php
/**
 * @version     1.0.0
 * @package     com_jvsocial_publish
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      joomlavi <info@joomlavi.com> - http://www.joomlavi.com
 */


// no direct access
defined('_JEXEC') or die;

JHtml::_('behavior.tooltip');
JHTML::_('script','system/multiselect.js',false,true);

$user	= JFactory::getUser();
$userId	= $user->get('id');
$listOrder	= $this->state->get('list.ordering');
$listDirn	= $this->state->get('list.direction');
$canOrder	= $user->authorise('core.edit.state', 'com_jvsocial_publish');
$saveOrder	= $listOrder == 'a.ordering';
?>

<form action="<?php echo JRoute::_('index.php?option=com_jvsocial_publish&view=requests'); ?>" method="post" name="adminForm" id="adminForm" class="jvsocial-form">
    <fieldset id="filter-bar">
        <div class="filter-search fltlft">
            <label class="filter-search-lbl" for="filter_search"><?php echo JText::_('JSEARCH_FILTER_LABEL'); ?></label>
            <input type="text" name="filter_search" id="filter_search" value="<?php echo $this->escape($this->state->get('filter.search')); ?>" title="<?php echo JText::_('Search'); ?>" />
            <button class="btn" type="submit"><?php echo JText::_('JSEARCH_FILTER_SUBMIT'); ?></button>
            <button class="btn" type="button" onclick="document.id('filter_search').value='';this.form.submit();"><?php echo JText::_('JSEARCH_FILTER_CLEAR'); ?></button>
        </div>

        <div class='filter-select fltrt'>
            <select name="filter_type" class="inputbox" onchange="this.form.submit()">
                <option value=""><?php echo JText::_('COM_JVSOCIAL_PUBLISH_SELECT_TYPE');?></option>
                <?php echo JHtml::_('select.options', $this->f_type, "value", "text", $this->state->get('filter.type'), true);?>
            </select>

            <select name="filter_channel" class="inputbox" onchange="this.form.submit()">
                <option value=""><?php echo JText::_('COM_JVSOCIAL_PUBLISH_SELECT_CHANNEL');?></option>
                <?php echo JHtml::_('select.options', $this->f_channel, "value", "text", $this->state->get('filter.channel'), true);?>
            </select>

            <select name="filter_source" class="inputbox" onchange="this.form.submit()">
                <option value=""><?php echo JText::_('COM_JVSOCIAL_PUBLISH_SELECT_SOURCE');?></option>
                <?php echo JHtml::_('select.options', $this->f_source, "value", "text", $this->state->get('filter.source'), true);?>
            </select>

            <select name="filter_state" class="inputbox" onchange="this.form.submit()">
                <option value=""><?php echo JText::_('COM_JVSOCIAL_PUBLISH_SELECT_PROCESS');?></option>
                <?php echo JHtml::_('select.options', $this->f_state, "value", "text", $this->state->get('filter.state'), true);?>
            </select>
        </div>
    </fieldset>
    <div class="clr"> </div>

    <table class="table table-bordered adminlist">
        <thead>
        <tr>
            <th width="1%"><input type="checkbox" name="checkall-toggle" value="" onclick="checkAll(this)" /></th>
            <th class='left'><?php echo JHtml::_('grid.sort', 'COM_JVSOCIAL_PUBLISH_REQUESTS_SOURCE_TITLE', 'source_title', $listDirn, $listOrder); ?></th>
            <th><?php echo JHtml::_('grid.sort', 'COM_JVSOCIAL_PUBLISH_REQUESTS_CHANNEL_ID', 'channel_name', $listDirn, $listOrder); ?></th>
            <th><?php echo JHtml::_('grid.sort', 'COM_JVSOCIAL_PUBLISH_REQUESTS_SOURCE', 'a.source', $listDirn, $listOrder); ?></th>
            <th width="5%"><?php echo JHtml::_('grid.sort', 'COM_JVSOCIAL_PUBLISH_REQUESTS_STATE', 'a.state', $listDirn, $listOrder); ?></th>
            <th width="5%"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_REQUESTS_POST')?></th>
            <th><?php echo JHtml::_('grid.sort', 'COM_JVSOCIAL_PUBLISH_REQUESTS_TARGET', 'a.target', $listDirn, $listOrder); ?></th>
            <th><?php echo JHtml::_('grid.sort', 'COM_JVSOCIAL_PUBLISH_REQUESTS_CREATED', 'a.created', $listDirn, $listOrder); ?></th>
            <th class="center"><?php echo JHtml::_('grid.sort', 'COM_JVSOCIAL_PUBLISH_REQUESTS_CREATED_BY', 'a.created_by_name', $listDirn, $listOrder); ?></th>
            <th width="1%" class="nowrap"><?php echo JHtml::_('grid.sort',  'JGRID_HEADING_ID', 'a.id', $listDirn, $listOrder); ?></th>
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
                <a href="<?php
                    if($item->source == 'content') echo 'index.php?option=com_content&task=article.edit&id='.$item->source_id;
                    else echo 'index.php?option=com_k2&view=item&cid='.$item->source_id;
                    ?>" target="_blank" title="<?php echo JText::_('COM_JVSOCIAL_PUBLISH_TIP_EDIT_ARTICLE');?>">
                    <?php echo $item->source_title; ?>
                </a>
            </td>
            <td class="center">
                    <span class="icon">
                        <i class="jvsocial-cus-<?php echo $item->type;?>"></i>&nbsp;-&nbsp;
                        <a href="<?php echo JRoute::_('index.php?option=com_jvsocial_publish&task=channel.edit&id='.(int) $item->channel_id); ?>" target="_blank"
                           title="<?php echo JText::_('COM_JVSOCIAL_PUBLISH_TIP_EDIT_CHANNEL');?>">
                            <?php echo $item->channel_name; ?>
                        </a>
                    </span>
            </td>
            <td class="center">
                    <span class="icon">
                        <i class="jvsocial-cus-<?php echo $item->source;?>"></i>&nbsp;-&nbsp;<?php echo ucfirst($item->source); ?>
                    </span>
            </td>
            <td class="center">
                    <span class="label label-<?php if($item->state) echo 'success'; else echo 'warning';?>">
                    <?php if($item->state) echo JText::_('COM_JVSOCIAL_PUBLISH_STATE_COMPLETE'); else echo JText::_('COM_JVSOCIAL_PUBLISH_STATE_WAIT')?>
                    </span>
            </td>
            <td class="center">
                <a href="index.php?option=com_jvsocial_publish&task=request.process&id=<?php echo $item->id;?>"
                   title="<?php echo JText::_('COM_JVSOCIAL_PUBLISH_REQUESTS_POST_TO_CHANNEL');?>">
                        <span class="icon">
                            <i class="cus-feed-go"></i>
                        </span>
                </a>
            </td>
            <td class="center">
                <?php if($item->target){?>
                    <?php if($item->params->groups) foreach($item->params->groups as $group) if($item->target == $group->id){?>
                    <a title="<?php echo JText::_('COM_JVSOCIAL_PUBLISH_TIP_GO_TO_TARGET');?>" href="<?php echo Jvsocial_publishHelper::getSocialUrl($item->type, $group->id);?>" target="blank"><?php echo $group->name;?></a>
                    <?php }?>
                    <?php if($item->params->pages) foreach($item->params->pages as $page) if($item->target == $page->id){?>
                    <a title="<?php echo JText::_('COM_JVSOCIAL_PUBLISH_TIP_GO_TO_TARGET');?>" href="<?php echo Jvsocial_publishHelper::getSocialUrl($item->type, $page->id);?>" target="blank"><?php echo $page->name;?></a>
                    <?php }?>
                <?php }elseif($item->params->target){?>
                    <?php if($item->params->groups) foreach($item->params->groups as $group) if($item->params->target == $group->id){?>
                    <a title="<?php echo JText::_('COM_JVSOCIAL_PUBLISH_TIP_GO_TO_TARGET');?>" href="<?php echo Jvsocial_publishHelper::getSocialUrl($item->type, $group->id);?>" target="blank"><?php echo $group->name;?></a>
                    <?php }?>
                    <?php if($item->params->pages) foreach($item->params->pages as $page) if($item->params->target == $page->id){?>
                    <a title="<?php echo JText::_('COM_JVSOCIAL_PUBLISH_TIP_GO_TO_TARGET');?>" href="<?php echo Jvsocial_publishHelper::getSocialUrl($item->type, $page->id);?>" target="blank"><?php echo $page->name;?></a>
                    <?php }?>
                <?php }else{ ?>
                    <a title="<?php echo JText::_('COM_JVSOCIAL_PUBLISH_TIP_GO_TO_TARGET');?>" href="<?php echo Jvsocial_publishHelper::getSocialUrl($item->type, $item->params->user_username);?>" target="blank"><?php echo $item->params->user_name;?></a>
                <?php }?>
            </td>
            <td class="center"><?php echo $item->created; ?></td>
            <td class="center"><?php echo $item->created_by_name; ?></td>
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
</form>