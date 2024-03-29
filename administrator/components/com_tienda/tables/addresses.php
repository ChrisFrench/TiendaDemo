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
defined( '_JEXEC' ) or die( 'Restricted access' );

Tienda::load( 'TiendaTable', 'tables._base' );

class TiendaTableAddresses extends TiendaTable
{
    /**
     *
     *
     * @param $db
     * @return unknown_type
     */
    function TiendaTableAddresses ( &$db )
    {

        $tbl_key 	= 'address_id';
        $tbl_suffix = 'addresses';
        $this->set( '_suffix', $tbl_suffix );
        $name 		= 'tienda';

        parent::__construct( "#__{$name}_{$tbl_suffix}", $tbl_key, $db );
    }

    /**
     * First stores the record
     * Then checks if it should be the default
     *
     * @see tienda/admin/tables/TiendaTable#store($updateNulls)
     */
    function store( $updateNulls=false )
    {
        if ( $return = parent::store( $updateNulls ))
        {
            if ($this->is_default_shipping == '1' || $this->is_default_billing == '1')
            {
                // update the defaults
                $query = new TiendaQuery();
                $query->update( "#__tienda_addresses" );
                $query->where( "`user_id` = '{$this->user_id}'" );
                $query->where( "`address_id` != '{$this->address_id}'" );
                if ($this->is_default_shipping == '1')
                {
                    $query->set( "`is_default_shipping` = '0'" );
                }
                if ($this->is_default_billing == '1')
                {
                    $query->set( "`is_default_billing` = '0'" );
                }
                $this->_db->setQuery( (string) $query );
                if (!$this->_db->query())
                {
                    $this->setError( $this->_db->getErrorMsg() );
                    return false;
                }
            }
        }
        return $return;
    }

    /**
     * Checks the entry to maintain DB integrity
     * @return unknown_type
     */
    function check()
    {
        $config = Tienda::getInstance();

        if(!$this->addresstype_id)
        {
            $this->addresstype_id = '1';
        }
        $address_type = $this->addresstype_id;

        if (empty($this->user_id))
        {
            $this->user_id = JFactory::getUser()->id;
            if (empty($this->user_id))
            {
                $this->setError( JText::_('COM_TIENDA_USER_REQUIRED') );
                return false;
            }
        }
        Tienda::load( 'TiendaHelperAddresses', 'helpers.addresses' );
        $elements  = TiendaHelperAddresses::getAddressElementsData( $address_type );

        if (empty($this->address_name)) {
            $this->address_name = $this->address_2;
        }
        
        if (empty($this->address_name) && $elements['address_name'][1] )
        {
            $this->setError( JText::_("COM_TIENDA_PLEASE_INCLUDE_AN_ADDRESS_TITLE".$address_type) );
            return false;
        }

        $address_checks = array(
                array( 'first_name' ,'name', "COM_TIENDA_FIRST_NAME_REQUIRED" ),
                array( 'middle_name' ,'middle', "COM_TIENDA_MIDDLE_NAME_REQUIRED" ),
                array( 'last_name', 'last', "COM_TIENDA_LAST_NAME_REQUIRED" ),
                array( 'address_1', 'address1', "COM_TIENDA_AT_LEAST_ONE_ADDRESS_LINE_IS_REQUIRED" ),
                array( 'address_2' ,'address2', "COM_TIENDA_SECOND_ADDRESS_LINE_IS_REQUIRED" ),
                array( 'company', 'company', "COM_TIENDA_COMPANY_REQUIRED" ),
                array( 'tax_number', 'tax_number', "COM_TIENDA_COMPANY_TAX_NUMBER_REQUIRED" ),
                array( 'city', 'city', "COM_TIENDA_CITY_REQUIRED" ),
                array( 'postal_code', 'zip', "COM_TIENDA_POSTAL_CODE_REQUIRED" ),
                array( 'phone_1', 'phone', "COM_TIENDA_PHONE_REQUIRED" )
        );
        for( $i = 0, $c = count( $address_checks ); $i < $c; $i++ )
        {
            $current = $address_checks[$i];
            if( empty( $this->$current[0] ) && $elements[ $current[1] ][1] )
            {
                $this->setError( JText::_($current[2]) );
                return false;
            }
        }

        if( empty( $this->country_id ) )
        {
            if ( $elements['country'][1] )
            {
                $this->setError( JText::_('COM_TIENDA_COUNTRY_REQUIRED') );
                return false;
            }
            else
            {
                $this->country_id = 9999;
            }
        }

        $countryA = explode(',', trim($config->get('ignored_countries', '83,188,190')));
        if ( empty( $this->zone_id ) && !in_array( $this->country_id, $countryA ) )
        {
            if( $elements['zone'][1] )
            {
                $this->setError( JText::_('COM_TIENDA_ZONE_REQUIRED') );
                return false;
            }
            else
            {
                $this->zone_id = 9999;
            }
        }
        return true;
    }
}
