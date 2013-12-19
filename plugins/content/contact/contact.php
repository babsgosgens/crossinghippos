<?php
/**
 * @version     1.0
 * @subpackage  plg_project
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Babs Gösgens, Netherlands
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */
// No direct access
defined('_JEXEC') or die;

class PlgContentContact extends JPlugin
{
    /**
     * Method to fail a form submit when a certain post attribute is not empty.
     *
     * @return  void
     */
    public function onSubmitContact(&$contact, &$post)
    {
        if ( is_array($post) ) {

            if ( isset($post['contact_catchascatchcan']) && $post['contact_catchascatchcan'] != '' )
            {
                // You're a bot - get lost
                die('Go away, you\'re nasty!');
            }
            if ( isset($post['contact_redirect']) )
            {
                $url = base64_decode($post['contact_redirect']);
                $contact->params->set('redirect', $url);
            }

        }

        return true;
    }
}
