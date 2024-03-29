<?php
/**
 * @version	1.5
 * @package	Tienda
 * @author 	Dioscouri Design
 * @link 	http://www.dioscouri.com
 * @copyright Copyright (C) 2007 Dioscouri Design. All rights reserved.
 * @license http://www.gnu.org/copyleft/gpl.html GNU/GPL, see LICENSE.php
 */

/** ensure this file is being included by a parent file */
defined( '_JEXEC' ) or die( 'Direct Access to this location is not allowed.' );

class TiendaUrl extends DSCUrl {
	
	public static function popup( $url, $text, $options = array() ) 
	{
		$html = "";
		
		JHTML::_('behavior.modal', 'a.tienda-modal');
		
		if (!empty($options['update']))
		{
		    $onclose = 'onClose: function(){ Dsc.update(); },';
		}
            else
		{
		    $onclose = '';
		}

		// set the $handler_string based on the user's browser
        $handler_string = "{handler:'iframe', ". $onclose ." size:{x: window.innerWidth-80, y: window.innerHeight-80}, onShow:$('sbox-window').setStyles({'padding': 0})}";
	    $browser = DSC::getClass( 'DSCBrowser', 'library.browser' );
        if ( $browser->getBrowser() == DSCBrowser::BROWSER_IE ) 
        {
            // if IE, use 
            $handler_string = "{handler:'iframe', ". $onclose ." size:{x:window.getSize().scrollSize.x-80, y: window.getSize().size.y-80}, onShow:$('sbox-window').setStyles({'padding': 0})}";            
        }
		
		$handler = (!empty($options['img']))
		  ? "{handler:'image'}"
		  : $handler_string;

		if (!empty($options['width']))
		{
			if (empty($options['height']))
			{
				$options['height'] = 480;
			}
			$handler = "{handler: 'iframe', ". $onclose ." size: {x: ".$options['width'].", y: ".$options['height']. "}}";
		}

		$id = (!empty($options['id'])) ? $options['id'] : '';
		$class = (!empty($options['class'])) ? $options['class'] : '';
		
		$html	= "<a class=\"tienda-modal\" href=\"$url\" rel=\"$handler\" >\n";
		$html 	.= "<span class=\"".$class."\" id=\"".$id."\" >\n";
        $html   .= "$text\n";
		$html 	.= "</span>\n";
		$html	.= "</a>\n";
		
		return $html;
	}

}