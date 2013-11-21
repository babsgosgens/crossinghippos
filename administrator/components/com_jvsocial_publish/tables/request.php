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

/**
 * request Table class
 */
class Jvsocial_publishTablerequest extends JTable {

    /**
     * Constructor
     *
     * @param JDatabase A database connector object
     */
    public function __construct(&$db) {
        parent::__construct('#__jvsocial_publish_requests', 'id', $db);
    }

    /**
     * Overloaded bind function to pre-process the params.
     *
     * @param	array		Named array
     * @return	null|string	null is operation was satisfactory, otherwise returns an error
     * @see		JTable:bind
     * @since	1.5
     */
    public function bind($array, $ignore = '') {

        if(!$array['created'] && !$array['id']){
            $now = new JDate();
            $array['created'] = $now->toSql();
        }
		return parent::bind($array, $ignore);
    }
}
