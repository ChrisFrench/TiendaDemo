<?php
/**
 * @version		$Id: element.php 10381 2008-06-01 03:35:53Z pasamio $
 * @package		Joomla
 * @subpackage	Content
 * @copyright	Copyright (C) 2005 - 2008 Open Source Matters. All rights reserved.
 * @license		GNU/GPL, see LICENSE.php
 * Joomla! is free software. This version may have been modified pursuant to the
 * GNU General Public License, and as distributed it includes or is derivative
 * of works licensed under the GNU General Public License or other free or open
 * source software licenses. See COPYRIGHT.php for copyright notices and
 * details.
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

/**
 * Content Component User Model
 *
 * @package		Joomla
 * @subpackage	Content
 * @since		1.5
 */
class TiendaModelElementproduct extends DSCModelElement
{
	var $_list = null;
	
	var $_page = null;
	
	var $select_title_constant = 'COM_TIENDA_SELECT_PRODUCTS';
	
	function getTable($name = '', $prefix = null, $options = array()) {
		$table = JTable::getInstance('Products', 'TiendaTable');
		return $table;
	}
	
	/**
	 * Method to get content article data for the frontpage
	 *
	 * @since 1.5
	 */
	function getList( $refresh = false )
	{
		$where = array();
		$mainframe = JFactory::getApplication();

		if (!empty($this->_list)) {
			return $this->_list;
		}

		// Initialize variables
		$db		= $this->getDBO();
		$filter	= null;

		// Get some variables from the request
		$filter_order		= $mainframe->getUserStateFromRequest('userelement.filter_order',		'filter_order',		'',	'cmd');
		$filter_order_Dir	= $mainframe->getUserStateFromRequest('userelement.filter_direction',	'filter_direction',	'',	'word');
		$limit				= $mainframe->getUserStateFromRequest('global.list.limit',					'limit', $mainframe->getCfg('list_limit'), 'int');
		$limitstart			= $mainframe->getUserStateFromRequest('userelement.limitstart',			'limitstart',		0,	'int');
		$search				= $mainframe->getUserStateFromRequest('userelement.filter',				'filter',			'',	'string');
		$search				= JString::strtolower($search);

		if (!$filter_order) {
			$filter_order = 'c.product_id';
		}
		$order = ' ORDER BY '. $filter_order .' '. $filter_order_Dir;
		$all = 1;

		// Keyword filter
		if ($search) {
			$where[] = 'LOWER( c.product_id ) LIKE '.$db->Quote( '%'.$db->getEscaped( $search, true ).'%', false );
			$where[] = 'LOWER( c.product_name ) LIKE '.$db->Quote( '%'.$db->getEscaped( $search, true ).'%', false );
		}
		// Build the where clause of the query
		$where = (count($where) ? ' WHERE '.implode(' OR ', $where) : '');

		// Get the total number of records
		$query = 'SELECT COUNT(c.product_id)' .
				' FROM #__tienda_products AS c' .
				$where;
		$db->setQuery($query);
		$total = $db->loadResult();

		// Create the pagination object
		jimport('joomla.html.pagination');
		$this->_page = new JPagination($total, $limitstart, $limit);

		// Get the products
		$query = 'SELECT c.*, pp.* ' .
				' FROM #__tienda_products AS c' .
				' LEFT JOIN #__tienda_productprices pp ON pp.product_id = c.product_id '.
				$where .
				' GROUP BY c.product_id '.
				$order;
		$db->setQuery($query, $this->_page->limitstart, $this->_page->limit);
		$this->_list = $db->loadObjectList();
		
		//currency formatting
		Tienda::load( 'TiendaHelperBase', 'helpers._base' );
		foreach($this->_list as $item)
		{
			$item->product_price = TiendaHelperBase::currency($item->product_price); 
		}

		// If there is a db query error, throw a HTTP 500 and exit
		if ($db->getErrorNum()) {
			JError::raiseError( 500, $db->stderr() );
			return false;
		}

		return $this->_list;
	}

	/**
	 *
	 * @return unknown_type
	 */
	function getPagination()
	{
		if (is_null($this->_list) || is_null($this->_page)) {
			$this->getList();
		}
		return $this->_page;
	}	
	
	function fetchElement($name, $value = '', $control_name = '', $js_extra = '', $fieldName = '', $clear = NULL) {
		$doc = JFactory::getDocument();

		if (empty($fieldName)) {
			$fieldName = $control_name ? $control_name . '[' . $name . ']' : $name;
		}

		if ($value) {
			$table = $this -> getTable();
			$table -> load($value);
			$title_key = $this -> title_key;
			$title = $table -> $title_key;
		} else {
			$title = JText::_($this -> select_title_constant);
		}

		$close_window = '';
		if (version_compare(JVERSION, '1.6.0', 'ge')) {
			$close_window = "window.parent.SqueezeBox.close();";
		} else {
			$close_window = "document.getElementById('sbox-window').close();";
		}

		$js = "Dsc.select" . $this -> getName() . " = function(id, title, object) {
                        document.getElementById(object + '_id').value = id;
                        document.getElementById(object + '_name').value = title;
                        document.getElementById(object + '_name_hidden').value = title;
        $close_window
        $js_extra
                   }";
		$doc -> addScriptDeclaration($js);

		if (!empty($this -> option)) {
			$option = $this -> option;
		} else {
			$r = null;

			if (!preg_match('/(.*)Model/i', get_class($this), $r)) {
				JError::raiseError(500, JText::_('JLIB_APPLICATION_ERROR_MODEL_GET_NAME'));
			}

			$option = 'com_' . strtolower($r[1]);
		}
		$link = 'index.php?option=' . $option . '&view=' . $this -> getName() . '&tmpl=component&object=' . $name;

		JHTML::_('behavior.modal', 'a.modal');
		$html = "\n" . '<div class="pull-left"><input type="text" style="background: #ffffff;" type="text" id="' . $name . '_name" value="' . htmlspecialchars($title, ENT_QUOTES, 'UTF-8') . '" disabled="disabled" /></div>';
		$html .= '<a class="modal btn btn-primary" style="color:#fff;"  title="' . JText::_($this -> select_title_constant) . '"  href="' . $link . '" rel="{handler: \'iframe\', size: {x: 800, y: 500}}">' . JText::_($this -> select_constant) . '</a>' . "\n";
		$html .= "\n" . '<input type="hidden" id="' . $name . '_id" name="' . $fieldName . '" value="' . $value . '" />';
		$html .= "\n" . '<input type="hidden" id="' . $name . '_name_hidden" name="' . $name . '_name_hidden" value="' . htmlspecialchars($title, ENT_QUOTES, 'UTF-8') . '" />';

		return $html;
	}

	/**
	 *
	 * @return
	 * @param object $name
	 * @param object $value[optional]
	 * @param object $node[optional]
	 * @param object $control_name[optional]
	 */
	function clearElement($name, $value = '', $control_name = '') {
		$doc = JFactory::getDocument();
		$fieldName = $control_name ? $control_name . '[' . $name . ']' : $name;

		$js = "
            Dsc.reset" . $this -> getName() . " = function(id, title, object) {
                document.getElementById(object + '_id').value = id;
                document.getElementById(object + '_name').value = title;
            }";
		$doc -> addScriptDeclaration($js);

		$html = '<a class="btn btn-danger"  style="color:#fff;" href="javascript:void(0);" onclick="Dsc.reset' . $this -> getName() . '( \'' . $value . '\', \'' . JText::_($this -> select_title_constant) . '\', \'' . $name . '\' )">' . JText::_($this -> clear_constant) . '
                    </a>';

		return $html;
	}
	
}
?>