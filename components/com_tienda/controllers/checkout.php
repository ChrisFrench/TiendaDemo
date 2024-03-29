<?php /** * @version 1.5 * @link http://www.dioscouri.com * @copyright 
Copyright (C) 2007 Dioscouri Design. All rights reserved. * @license
http://www.gnu.org/copyleft/gpl.html GNU/GPL, see LICENSE.php * @author
Dioscouri Design * @package Tienda */

/** ensure this file is being included by a parent file */
defined( '_JEXEC' ) or die( 'Restricted access' );

class TiendaControllerCheckout extends TiendaController
{
    var $_order                = null; // a TableOrders() object
    var $initial_order_state   = 15; // pre-payment/orphan set in costructor
    var $billing_input_prefix  = 'billing_input_';
    var $shipping_input_prefix = 'shipping_input_';
    var $defaultShippingMethod = null; // set in constructor
    var $steps 				   = array(); // set in constructor
    var $current_step 		   = 0;
    var $onepage_checkout	   = false;

    /**
     * constructor
     */
    function __construct()
    {
        parent::__construct();
        if (!Tienda::getInstance()->get('shop_enabled', '1'))
        {
            JFactory::getApplication()->redirect( JRoute::_( 'index.php?option=com_tienda&view=products' ), JText::_('COM_TIENDA_CHECKOUT_DISABLED') );
            return;
        }

        // get the items and add them to the order
        Tienda::load( "TiendaHelperBase", 'helpers._base' );
        $cart_helper = TiendaHelperBase::getInstance( 'Carts' );
        $items = $cart_helper->getProductsInfo();

        $task = JRequest::getVar('task');
        if (empty($items) && $task != 'confirmPayment' && $task != 'poscheckout' )
        {
            JFactory::getApplication()->redirect( JRoute::_( 'index.php?option=com_tienda&view=products' ), JText::_('COM_TIENDA_YOUR_CART_IS_EMPTY') );
            return;
        }

        $uri = JFactory::getURI();
        if (Tienda::getInstance()->get('force_ssl_checkout') && $uri->isSSL() == false )
        {
            $post = JRequest::get('post');
            if (is_array($post) && !empty($post))
            {
                // Don't redirect if this is POST
            }
            else
            {
                $uri->setScheme('https');
                JFactory::getApplication()->redirect( $uri->toString() );
                return;
            }
        }

        $this->set('suffix', 'checkout');
        // create the order object
        JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
        $this->_order = JTable::getInstance('Orders', 'TiendaTable');

        // set userid
        if( !$this->_order->user_id && !(JFactory::getUser()->guest) )
            $this->_order->user_id = JFactory::getUser()->id;

        $this->defaultShippingMethod = Tienda::getInstance()->get('defaultShippingMethod', '2');
        $this->initial_order_state = Tienda::getInstance()->get('initial_order_state', '15');
        // Default Steps
        $this->steps = array(
                'COM_TIENDA_STEP_SELECTSHIPPINGMETHOD',
                'COM_TIENDA_STEP_SELECTPAYMENTMETHOD',
                'COM_TIENDA_STEP_REVIEWORDER',
                'COM_TIENDA_STEP_CHECKOUTRESULTS'
        );
        $this->current_step = 0;

        if( Tienda::getInstance()->get('one_page_checkout', '0') )
            $this->onepage_checkout = true;
    }

    /**
     * Gets this view's unique namespace for request & session variables
     * (non-PHPdoc)
     *
     * @see tienda/site/TiendaController#getNamespace()
     * @return unknown
     */
    function getNamespace()
    {
        $app = JFactory::getApplication();
        $ns = $app->getName().'::'.'com.tienda.model.checkout';
        return $ns;
    }

    /**
     * (non-PHPdoc)
     *
     * @see tienda/site/TiendaController#view()
     */
    function display($cachable=false, $urlparams = false)
    {
        $user = JFactory::getUser();

        JRequest::setVar( 'view', $this->get('suffix') );


        //check if we have one page checkout
        if($this->onepage_checkout)
        {
            if( !$user->id ) // saves session id (will be needed after logging in)
            {
                $session = JFactory::getSession();
                $session->set( 'old_sessionid', $session->getId() );
            }
            // Display the onepage checkout view
             
            $opc_layout = Tienda::getInstance()->get('one_page_checkout_layout', 'onepage-opc' );
            JRequest::setVar('layout', $opc_layout);
            $view = $this->getView( 'checkout', 'html' );

            $order = $this->_order;
            $order = $this->populateOrder();

            //get order summarry
            $html = $this->getOrderSummary();
            $view->assign( 'orderSummary', $html );
            $view->assign( 'order', $order );
            $view->setTask(true);
            $view->assign( 'user', $user );

            if( !$user->id )
            {
                $view->form_user_register = $this->getAdditionalInfoUser();
            }

            //get addresses
            JModel::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/models' );
            $model = JModel::getInstance( 'addresses', 'TiendaModel' );
            $model->setState("filter_userid", JFactory::getUser()->id);
            $model->setState("filter_deleted", 0);
            $addresses = $model->getList();

            // Checking whether shipping is required
            $showShipping = false;

            $cartsModel = $this->getModel('carts');
            if ($isShippingEnabled = $cartsModel->getShippingIsEnabled())
            {
                $showShipping = true;
            }

            $billingAddress = $order->getBillingAddress();

            $billing_address_form = $this->getAddressForm( $this->billing_input_prefix, !$user->id );
            $view->assign( 'billing_address_form', $billing_address_form );

            $view->assign( 'showShipping', $showShipping );
            $view->assign( 'billing_address', $billingAddress);

            if($showShipping)
            {
                $shippingAddress = $order->getShippingAddress();
                 
                $shipping_address_form = $this->getAddressForm( $this->shipping_input_prefix, !$user->id ,true );

                $view->assign( 'shipping_address', $shippingAddress );
                $view->assign( 'shipping_address_form', $shipping_address_form );
            }

            Tienda::load( 'TiendaHelperPlugin', 'helpers.plugin' );
            $dispatcher = JDispatcher::getInstance();

            if($showShipping)
            {
                $rates = $this->getShippingRates();
                $default_rate = array();
                if (count($rates) == 1)
                {
                    $default_rate = $rates[0];
                }

                $shipping_layout = "shipping_yes";
                if (empty( $shippingAddress ))
                {
                    $shipping_layout = "shipping_calculate";
                }

                $shipping_method_form = $this->getShippingHtml( $shipping_layout );
                $view->assign( 'showShipping', $showShipping );
                $view->assign( 'shipping_method_form', $shipping_method_form );

                $view->assign( 'rates', $rates );
            }

            $view->assign( 'payment_options_html', $this->getPaymentOptionsHtml() );
            $view->assign( 'order', $order );

            // are there any enabled coupons?
            $coupons_present = false;
            $model = JModel::getInstance( 'Coupons', 'TiendaModel' );
            $model->setState('filter_enabled', '1');
            if ($coupons = $model->getList())
            {
                $coupons_present = true;
            }
            $view->assign( 'coupons_present', $coupons_present );
             
            // assign userinfo for credits
            $userinfo = JTable::getInstance( 'UserInfo', 'TiendaTable' );
            $userinfo->load( array( 'user_id'=>JFactory::getUser()->id ) );
            $userinfo->credits_total = (float) $userinfo->credits_total;
            $view->assign('userinfo', $userinfo);
             
            $dispatcher = JDispatcher::getInstance();
            ob_start();
            $dispatcher->trigger( 'onBeforeDisplaySelectPayment', array( $order ) );
            $view->assign( 'onBeforeDisplaySelectPayment', ob_get_contents() );
            ob_end_clean();
             
            ob_start();
            $dispatcher->trigger( 'onAfterDisplaySelectPayment', array( $order ) );
            $view->assign( 'onAfterDisplaySelectPayment', ob_get_contents() );
            ob_end_clean();

        }
        else
        {
            $guest_var = JRequest::getInt( 'guest', '0' );
            $guest = false;
            if ($guest_var == '1')
            {
                $guest = true;
            }

            $register_var = JRequest::getInt( 'register', '0' );
            $form_register = '';
            $register = false;
            if ($register_var == '1')
            {
                $register = true;
                $form_register = $this->getRegisterForm();
            }

            // determine layout based on login status
            // Login / Register / Checkout as a guest
            if (empty($user->id) && !($guest || $register))
            {
                // Display a form for selecting either to register or to login
                JRequest::setVar('layout', 'form');
                Tienda::load( "TiendaHelperRoute", 'helpers.route' );
                $helper = new TiendaHelperRoute();
                $view = $this->getView( 'checkout', 'html' );
                $checkout_itemid = $helper->findItemid( array('view'=>'checkout') );
                if (empty($checkout_itemid))
                {
                    $checkout_itemid = JRequest::getInt('Itemid');
                }
                $view->assign('checkout_itemid', $checkout_itemid );
                parent::display();
                return;
            }

            if (($guest && Tienda::getInstance()->get('guest_checkout_enabled')) || $register)
            {
                // Checkout as a Guest
                $order = $this->_order;
                $order = $this->populateOrder(true);

                // now that the order object is set, get the orderSummary html
                $html = $this->getOrderSummary();

                // Get the current step
                $progress = $this->getProgress();

                // get address forms
                $billing_address_form = $this->getAddressForm( $this->billing_input_prefix, true );
                $shipping_address_form = $this->getAddressForm( $this->shipping_input_prefix, true, true );

                // get all the enabled shipping plugins
                Tienda::load( 'TiendaHelperPlugin', 'helpers.plugin' );
                $plugins = TiendaHelperPlugin::getPluginsWithEvent( 'onGetShippingPlugins' );

                $dispatcher = JDispatcher::getInstance();

                $rates = array();
                if ($plugins)
                {
                    foreach ($plugins as $plugin)
                    {
                        $results = $dispatcher->trigger( "onGetShippingRates", array( $plugin->element, $order ) );

                        foreach ($results as $result)
                        {
                            if(is_array($result))
                            {
                                foreach( $result as $r )
                                {
                                    $rates[] = $r;
                                }
                            }
                        }// endforeach results

                    } // endforeach plugins
                } // endif plugins


                // now display the entire checkout page
                $view = $this->getView( 'checkout', 'html' );
                $view->set( 'hidemenu', false);
                $view->assign( 'order', $order );
                $view->assign( 'register', $register );
                $view->assign( 'form_register', $form_register );
                $view->assign( 'billing_address_form', $billing_address_form );
                $view->assign( 'shipping_address_form', $shipping_address_form );
                $view->assign( 'orderSummary', $html );
                $view->assign( 'progress', $progress );
                //$view->assign( 'default_billing_address', $default_billing_address );
                //$view->assign( 'default_shipping_address', $default_shipping_address );
                $view->assign( 'rates', $rates );

                // Checking whether shipping is required
                $showShipping = false;
                $shipping_layout = "shipping_no";

                $cartsModel = $this->getModel('carts');
                if ($isShippingEnabled = $cartsModel->getShippingIsEnabled())
                {
                    $showShipping = true;
                }

                if ($showShipping)
                {
                    $shipping_layout = "shipping_yes";
                    if (empty( $shippingAddress ))
                    {
                        $shipping_layout = "shipping_calculate";
                    }
                }
                $shipping_method_form = $this->getShippingHtml( $shipping_layout );
                $view->assign( 'showShipping', $showShipping );
                $view->assign( 'shipping_method_form', $shipping_method_form );

                JRequest::setVar('layout', 'guest');
            }
            else
            {
                // Already Logged in, a traditional checkout
                $order = $this->_order;
                $order = $this->populateOrder(false);
                 
                // now that the order object is set, get the orderSummary html
                $html = $this->getOrderSummary();

                // Get the current step
                $progress = $this->getProgress();

                $user_id = JFactory::getUser()->id;
                $addresses = array();
                JModel::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/models' );
                $model = JModel::getInstance( 'addresses', 'TiendaModel' );
                if (!empty($user_id))
                {
                    $model->setState("filter_userid", $user_id );
                    $model->setState("filter_deleted", 0);
                    $addresses = $model->getList();
                }

                $billingAddress = $order->getBillingAddress();
                $shippingAddress = $order->getShippingAddress();

                // get address forms
                $billing_address_form = $this->getAddressForm( $this->billing_input_prefix );
                $shipping_address_form = $this->getAddressForm( $this->shipping_input_prefix, false ,true );

                // get the default shipping and billing addresses, if possible
                $default_billing_address = $this->getAddressHtml( @$billingAddress->address_id );
                $default_shipping_address = $this->getAddressHtml( @$shippingAddress->address_id );

                // now display the entire checkout page
                $view = $this->getView( 'checkout', 'html' );
                $view->set( 'hidemenu', false);
                $view->assign( 'order', $order );
                $view->assign( 'addresses', $addresses );
                $view->assign( 'billing_address', $billingAddress);
                $view->assign( 'shipping_address', $shippingAddress );
                $view->assign( 'billing_address_form', $billing_address_form );
                $view->assign( 'shipping_address_form', $shipping_address_form );
                $view->assign( 'orderSummary', $html );
                $view->assign( 'progress', $progress );
                $view->assign( 'default_billing_address', $default_billing_address );
                $view->assign( 'default_shipping_address', $default_shipping_address );

                // Check whether shipping is required
                $showShipping = false;
                $shipping_layout = "shipping_no";

                $cartsModel = $this->getModel('carts');
                if ($isShippingEnabled = $cartsModel->getShippingIsEnabled())
                {
                    $showShipping = true;
                }

                if ($showShipping)
                {
                    $shipping_layout = "shipping_yes";
                    if (empty( $shippingAddress ))
                    {
                        $shipping_layout = "shipping_calculate";
                    }

                }
                $shipping_method_form = $this->getShippingHtml( $shipping_layout );
                $view->assign( 'showShipping', $showShipping );
                $view->assign( 'shipping_method_form', $shipping_method_form );

                JRequest::setVar('layout', 'default');
            }

            $dispatcher = JDispatcher::getInstance();

            ob_start();
            $dispatcher->trigger( 'onBeforeDisplaySelectShipping', array( $order ) );
            $view->assign( 'onBeforeDisplaySelectShipping', ob_get_contents() );
            ob_end_clean();

            ob_start();
            $dispatcher->trigger( 'onAfterDisplaySelectShipping', array( $order ) );
            $view->assign( 'onAfterDisplaySelectShipping', ob_get_contents() );
            ob_end_clean();

        }
        $view->setTask(true);
        parent::display();
        return;
    }

    /**
     * Populate the order object with items and addresses, and calculate the order Totals
     * @param $guest	guest mode?
     * @return $order 	the populated order
     */
    function populateOrder($guest = false)
    {
        $order = $this->_order;
        // set the currency
        Tienda::load( 'TiendaHelperCurrency', 'helpers.currency' );
        $order->currency_id = TiendaHelperCurrency::getCurrentCurrency(); // USD is default if no currency selected
        // set the shipping method
        $order->shipping_method_id = $this->defaultShippingMethod;

        if (!$guest)
        {
            // set the order's addresses based on the form inputs
            // set to user defaults
            Tienda::load( "TiendaHelperBase", 'helpers._base' );
            $user_helper = TiendaHelperBase::getInstance( 'User' );

            $billingAddress = $user_helper->getPrimaryAddress( JFactory::getUser()->id, 'billing' );
            $shippingAddress = $user_helper->getPrimaryAddress( JFactory::getUser()->id, 'shipping' );

            $order->setAddress( $billingAddress, 'billing' );
            $order->setAddress( $shippingAddress, 'shipping' );
        }

        // get the items and add them to the order
        Tienda::load( "TiendaHelperBase", 'helpers._base' );
        $cart_helper = TiendaHelperBase::getInstance( 'Carts' );
        $items = $cart_helper->getProductsInfo();

        foreach ($items as $item)
        {
            $order->addItem( $item );
        }

        $this->addAutomaticCoupons();

        // get the order totals
        $order->calculateTotals();

        return $order;
    }

    /**
     * Get the progress bar
     */
    function getProgress()
    {
        $view = $this->getView( 'checkout', 'html' );
        $view->set( '_controller', 'checkout' );
        $view->set( '_view', 'checkout' );
        $view->set( '_doTask', true);
        $view->set( 'hidemenu', true);
        $view->assign( 'steps', $this->steps );
        $view->assign( 'current_step', $this->current_step );
        $view->setLayout( 'progress' );

        // Get and Set Model
        $model = $this->getModel('checkout');
        $view->setModel( $model, true );

        ob_start();
        $view->display();
        $html = ob_get_contents();
        ob_end_clean();

        return $html;
    }

    /**
     * Prepares data for and returns the html of the order summary layout.
     * This assumes that $this->_order has already had its properties set
     *
     * @return unknown_type
     */
    function getOrderSummary()
    {
        // get the order object
        $order = $this->_order; // a TableOrders object (see constructor)

        Tienda::load('TiendaHelperCoupon', 'helpers.coupon');

        // Coupons
        $coupons_id = array();
        $coupons = $order->getCoupons();
        foreach($coupons as $cg)
        {
            foreach($cg as $c)
            {
                if($c->coupon_type == '1')
                {
                    $coupons_id = array_merge($coupons_id, TiendaHelperCoupon::getCouponProductIds( @$c->coupon_id ) );
                }
            }
        }

        $model = $this->getModel('carts');
        $view = $this->getView( 'checkout', 'html' );
        $view->set( '_controller', 'checkout' );
        $view->set( '_view', 'checkout' );
        $view->set( '_doTask', true);
        $view->set( 'hidemenu', true);
        $view->setModel( $model, true );
        $view->assign( 'state', $model->getState() );
        $view->assign( 'coupons', $coupons_id);

        $config = Tienda::getInstance();
        $show_tax = $config->get('display_prices_with_tax');
        $view->assign( 'show_tax', $show_tax );
        $view->assign( 'using_default_geozone', false );

        $view->assign( 'order', $order );

        Tienda::load( "TiendaHelperBase", 'helpers._base' );
        $product_helper = TiendaHelperBase::getInstance( 'Product' );
        $order_helper = TiendaHelperBase::getInstance( 'Order' );

        $tax_sum = 0;
        $orderitems = $order->getItems();
        $taxes = TiendaHelperTax::calculateTax( $orderitems, 4, $order->getBillingAddress(), $order->getShippingAddress() );

        foreach( $orderitems as $item )
        {
            $item->price = $item->orderitem_final_price / $item->orderitem_quantity;
            if( $show_tax )
            {
                $order->order_subtotal += $item->orderitem_tax;
            }
        }

        $view->assign( 'orderitems', $orderitems );

        // Checking whether shipping is required
        $showShipping = false;
        $cartsModel = $this->getModel('carts');
        if ($isShippingEnabled = $cartsModel->getShippingIsEnabled())
        {
            $showShipping = true;
            $view->assign( 'shipping_total', $order->getShippingTotal() );
        }
        $view->assign( 'showShipping', $showShipping );

        //START onDisplayOrderItem: trigger plugins for extra orderitem information
        if (!empty($orderitems))
        {
            $onDisplayOrderItem = $order_helper->onDisplayOrderItems($orderitems);
            $view->assign( 'onDisplayOrderItem', $onDisplayOrderItem );
        }
        //END onDisplayOrderItem

        $view->setLayout( 'cart' );
        $view->setTask(true);
        ob_start();
        $view->display();
        $html = ob_get_contents();
        ob_end_clean();

        return $html;
    }

    /**
     * Gets form with additional data for user registration during one-page checkout
     *
     * @return unknown_type
     */
    function getAdditionalInfoUser()
    {
        $html = '';
        $model = $this->getModel( 'Checkout', 'TiendaModel' );
        $view   = $this->getView( 'checkout', 'html' );
        $view->set( '_controller', 'checkout' );
        $view->set( '_view', 'checkout' );
        $view->set( '_doTask', true);
        $view->set( 'hidemenu', true);
        $view->setModel( $model, true );
        $view->setLayout( 'form_register_opc' );
        ob_start();
        $view->display();
        $html = ob_get_contents();
        ob_end_clean();

        return $html;
    }

    /**
     * Prepares data for and returns the html of the total amount
     * This assumes that $this->_order has already had its properties set
     *
     * @return unknown_type
     */
    function getTotalAmountDue()
    {
        // get the order object
        $order = $this->_order; // a TableOrders object (see constructor)

        $model = $this->getModel('carts');
        $view = $this->getView( 'checkout', 'html' );
        $view->set( '_controller', 'checkout' );
        $view->set( '_view', 'checkout' );
        $view->set( '_doTask', true);
        $view->set( 'hidemenu', true);
        $view->setModel( $model, true );
        $view->assign( 'state', $model->getState() );
        $view->assign( 'order', $order );
        $orderitems = $order->order_total;
        $view->assign( 'orderitems', $orderitems );

        $view->setLayout( 'total' );

        ob_start();
        $view->display();
        $html = ob_get_contents();
        ob_end_clean();

        return $html;
    }

    /**
     * (non-PHPdoc)
     * @see tienda/site/TiendaController#validate()
     */
    function validate()
    {
        $response = array();
        $response['msg'] = '';
        $response['error'] = '';

        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();

        // get elements from post
        $elements = json_decode( preg_replace('/[\n\r]+/', '\n', JRequest::getVar( 'elements', '', 'post', 'string' ) ) );

        // Test if elements are empty
        // Return proper message to user
        if (empty($elements))
        {
            // do form validation
            // if it fails check, return message
            $response['error'] = '1';
            $response['msg'] = $helper->generateMessage(JText::_('COM_TIENDA_ERROR_WHILE_VALIDATING_THE_PARAMETERS'));
            echo ( json_encode( $response ) );
            return;
        }

        // convert elements to array that can be binded
        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();
        $submitted_values = $helper->elementsToArray( $elements );

        $step = (!empty($submitted_values['step'])) ? strtolower($submitted_values['step']) : '';
        switch ($step)
        {
            case "selectshipping":
                // Validate the email address if it is a guest checkout!
                if((Tienda::getInstance()->get('guest_checkout_enabled', '1')) && !empty($submitted_values['guest']) )
                {
                    jimport('joomla.mail.helper');
                    if(!JMailHelper::isEmailAddress($submitted_values['email_address'])){
                        $response['msg'] = $helper->generateMessage( JText::_('COM_TIENDA_PLEASE_INSERT_A_CORRECT_EMAIL_ADDRESS') );
                        $response['error'] = '1';
                        echo ( json_encode( $response ) );
                        return;
                    }
                    Tienda::load( 'TiendaHelperUser', 'helpers.user' );
                    if(TiendaHelperUser::emailExists($submitted_values['email_address'])){
                        $response['msg'] = $helper->generateMessage( JText::_('COM_TIENDA_THIS_EMAIL_ADDRESS_IS_ALREADY_REGISTERED') );
                        $response['error'] = '1';
                        echo ( json_encode( $response ) );
                        return;
                    }
                }
                // checking for the registartion
                if(!empty($submitted_values['register']) )
                {
                    // verify that fields are present
                    if (empty($submitted_values['email_address']) || empty($submitted_values['name']) || empty($submitted_values['username']) || empty($submitted_values['password'] ) || empty ($submitted_values['password2']) )
                    {
                        $response['error'] = '1';
                        $response['msg'] .= $helper->generateMessage(JText::_('COM_TIENDA_ALL_FIELDS_OF_REGISTRATION_SECTIONS_ARE_MANDATORY'));
                        echo ( json_encode( $response ) );
                        return;
                    }

                    jimport('joomla.mail.helper');
                    if(!JMailHelper::isEmailAddress($submitted_values['email_address'])){
                        $response['msg'] = $helper->generateMessage( JText::_('COM_TIENDA_PLEASE_INSERT_A_CORRECT_EMAIL_ADDRESS') );
                        $response['error'] = '1';
                        echo ( json_encode( $response ) );
                        return;
                    }
                    Tienda::load( 'TiendaHelperUser', 'helpers.user' );
                    if(TiendaHelperUser::emailExists($submitted_values['email_address'])){
                        $response['msg'] = $helper->generateMessage( JText::_('COM_TIENDA_THIS_EMAIL_ADDRESS_IS_ALREADY_REGISTERED=') );
                        $response['error'] = '1';
                        echo ( json_encode( $response ) );
                        return;
                    }
                    if (TiendaHelperUser::usernameExists($submitted_values['username']))
                    {
                        $response['error'] = '1';
                        $response['msg'] .= $helper->generateMessage(JText::_('COM_TIENDA_USER_NAME_ALREADY_EXISTS'));
                        echo ( json_encode( $response ) );
                        return;
                        // TODO user already exists

                    }
                    if (strcmp($submitted_values['password'],$submitted_values['password2'] ) )
                    {
                        $response['error'] = '1';
                        $response['msg'] .= $helper->generateMessage(JText::_('COM_TIENDA_PASSWORDS_ARE_NOT_MATCHING'));
                        echo ( json_encode( $response ) );
                        return;
                        // TODO user already exists

                    }

                }

                // Check if there are errors in the Shipping area. If yes, return without going on
                if( !$this->validateSelectShipping( $submitted_values ) )
                {
                    return;
                }
                break;
            case "selectpayment":
                $this->validateSelectPayment( $submitted_values );
                break;
            default:
                $response['error'] = '1';
                $response['msg'] = $helper->generateMessage(JText::_('COM_TIENDA_INVALID_STEP_IN_CHECKOUT_PROCESS'));
                echo ( json_encode( $response ) );
                break;
        }
        return;
    }

    /**
     * Validates the select shipping method form
     */
    function validateSelectShipping( $submitted_values )
    {
        $response = array();
        $response['msg'] = '';
        $response['error'] = '';

        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();

        // fail if no shipping method selected

        if ($submitted_values['shippingrequired'])
        {
            if (empty($submitted_values['_checked']['shipping_plugin']))
            {
                 
                $response['msg'] = $helper->generateMessage( JText::_('COM_TIENDA_PLEASE_SELECT_SHIPPING_METHOD') );
                $response['error'] = '1';
                echo ( json_encode( $response ) );
                return false;
            }
        }

        $order = $this->_order;
        // get the items and add them to the order
        Tienda::load( 'TiendaHelperCarts', 'helpers.carts' );
        $items = TiendaHelperCarts::getProductsInfo();
        foreach ($items as $item)
        {
            $order->addItem( $item );
        }
        $order->calculateTotals();
        if ( (float) $order->order_total == (float) '0.00' )
        {
            if($this->onepage_checkout)
            {
                // no echo
                return true;
            }
            
            $response['error'] = '0';
            echo ( json_encode( $response ) );
            return true;
        }

        // fail if billing address is invalid
        if (!$this->validateAddress( $submitted_values, $this->billing_input_prefix , @$submitted_values['billing_address_id'], true ))
        {
            $response['msg'] = $helper->generateMessage( JText::_('COM_TIENDA_BILLING_ADDRESS_ERROR')." :: ".$this->getError() );
            $response['error'] = '1';
            echo ( json_encode( $response ) );
            return false;
        }

        // fail if shipping address is invalid
        if($submitted_values['shippingrequired'])
        {
            if ( !$this->validateAddress( $submitted_values, $this->shipping_input_prefix, @$submitted_values['shipping_address_id'], true ))
            {
                $response['msg'] = $helper->generateMessage( JText::_('COM_TIENDA_SHIPPING_ADDRESS_ERROR')." :: ".$this->getError() );
                $response['error'] = '1';
                echo ( json_encode( $response ) );
                return false;
            }
        }

        // no matter what, fire this validation plugin event for plugins that extend the checkout workflow
        $results = array();
        $dispatcher = JDispatcher::getInstance();
        $results = $dispatcher->trigger( "onValidateSelectShipping", array( $submitted_values ) );

        for ($i=0; $i<count($results); $i++)
        {
            $result = $results[$i];
            if (!empty($result->error))
            {
                $response['msg'] = $helper->generateMessage( $result->message );
                $response['error'] = '1';
                echo ( json_encode( $response ) );
                return false;
            }
            else
            {
                // if here, all is OK
                $response['error'] = '0';
            }
        }

        //we will not echo the response if its onpagecheckout
        if($this->onepage_checkout)
        {
            return true;
        }

        echo ( json_encode( $response ) );

        // Return to Parent function the result!
        if($response['error'] == '1')
        {
            return false;
        }

        return true;
    }

    /**
     * Validates the select payment form
     */
    function validateSelectPayment( $submitted_values )
    {
        $response = array();
        $response['msg'] = '';
        $response['error'] = '';

        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();

        // fail if not checked terms & condition
        if( Tienda::getInstance()->get('require_terms') && empty($submitted_values['_checked']['shipping_terms']) )
        {
            $response['msg'] = $helper->generateMessage(JText::_('COM_TIENDA_PLEASE_CHECK_THE_TERMS_CONDITIONS'));
            $response['error'] = '1';
        }
        else
        {
            $guest = false;
            if( Tienda::getInstance()->get('guest_checkout_enabled') )
            {
                if( !$this->onepage_checkout )
                {
                    $guest = JFactory::getUser()->id ? 0 : 1;
                }
                else // normal checkout
                {
                    $guest = JRequest::getVar( 'guest', '0');
                }
                 
                $guest = $guest ? true : false;
            }
            
            $this->populateOrder($guest);
            $this->addCouponCodes( $submitted_values );
            
            // bind what you can from the post
            $this->_order->bind( $submitted_values );
            
            // set the shipping method
            $this->_order->shipping = new JObject();
            $this->_order->shipping->shipping_price      = @$submitted_values['shipping_price'];
            $this->_order->shipping->shipping_extra      = @$submitted_values['shipping_extra'];
            $this->_order->shipping->shipping_code      	= @$submitted_values['shipping_code'];
            $this->_order->shipping->shipping_name       = @$submitted_values['shipping_name'];
            $this->_order->shipping->shipping_tax        = @$submitted_values['shipping_tax'];
            $this->_order->shipping->shipping_type				= @$submitted_values['shipping_plugin'];
            
            $this->_order->calculateTotals();

            // fail if no payment method selected
            if (empty($submitted_values['_checked']['payment_plugin']) && (float)$this->_order->order_total != (float)'0.00')
            {
                $response['msg'] = $helper->generateMessage(JText::_('COM_TIENDA_PLEASE_SELECT_PAYMENT_METHOD'));
                $response['error'] = '1';
            }
            elseif ( (float)$this->_order->order_total == (float)'0.00' )
            {
                $response['error'] = '0';
            }
            else
            {
                // Validate the results of the payment plugin
                $results = array();
                $dispatcher = JDispatcher::getInstance();
                $results = $dispatcher->trigger( "onGetPaymentFormVerify", array( $submitted_values['_checked']['payment_plugin'], $submitted_values) );

                for ($i=0; $i<count($results); $i++)
                {
                    $result = $results[$i];
                    if (!empty($result->error))
                    {
                        $response['msg'] = $helper->generateMessage( $result->message );
                        $response['error'] = '1';
                    }
                }
            }
        }

        // no matter what, fire this validation plugin event for plugins that extend the checkout workflow
        $results = array();
        $dispatcher = JDispatcher::getInstance();
        $results = $dispatcher->trigger( "onValidateSelectPayment", array( $submitted_values ) );

        for ($i=0; $i<count($results); $i++)
        {
            $result = $results[$i];
            if (!empty($result->error))
            {
                $response['msg'] = $helper->generateMessage( $result->message );
                $response['error'] = '1';
            }
        }

        //we will not echo the response if its onpagecheckout
        if($this->onepage_checkout)
        {
            return true;
        }

        echo ( json_encode( $response ) );
        return;
    }

    /**
     * Validates a submitted address inputs
     */
    function validateAddress( $values, $prefix, $address_id, $ajax = false )
    {
        $table = JTable::getInstance( 'Addresses', 'TiendaTable' );

        // IS Guest Checkout or register??
        $user_id = JFactory::getUser()->id;
        if( $this->onepage_checkout )
            $register = !empty($values['_checked']['create_account']);
        else
            $register = !empty($values['register']);

        // Add type of the array
        switch($prefix)
        {
            case 'shipping_input_':
                $address_type = '2';

                if( $ajax )
                {
                    if (!empty($values['_checked']['sameasbilling']) )
                        $prefix = 'billing_input_';
                }
                else
                {
                    if( !empty( $values['sameasbilling'] ) )
                        $prefix = 'billing_input_';
                }
                break;
            default:
            case 'billing_input_':
                $address_type = '1';
                break;
        }
        $addressArray = $this->getAddress( $address_id, $prefix, $values );
        if((Tienda::getInstance()->get('guest_checkout_enabled', '1') && $user_id == 0) || $register )
            $addressArray['user_id'] = -1; // Fake id for the checkout process

        $table->bind( $addressArray );
        $table->addresstype_id = $address_type;

        if (!$table->check())
        {
            $this->setError( $table->getError() );
            return false;
        }
        return true;
    }

    /**
     * Returns a selectlist of zones
     * Called via Ajax
     *
     * @return unknown_type
     */
    function getZones()
    {
        Tienda::load( 'TiendaSelect', 'library.select' );
        $html = '';
        $text = '';
         
        $country_id = JRequest::getInt('country_id');
        $zone_id = JRequest::getInt('zone_id');
        $prefix = JRequest::getVar('prefix');
        $disabled = JRequest::getInt( 'disabled', 0 );
        $attribs = array('class' => 'inputbox', 'size' => '1');
        if( $disabled )
            $attribs['disabled'] = 'disabled';

        if( $this->onepage_checkout )
            $attribs['onchange'] = 'tiendaCheckoutAutomaticShippingRatesUpdate( \''.$prefix.'zone_id\', \''.JText::_('COM_TIENDA_UPDATING_SHIPPING_RATES').'\', \''.JText::_('COM_TIENDA_UPDATING_CART').'\', \''.JText::_('COM_TIENDA_UPDATING_ADDRESS').'\', \''.JText::_('COM_TIENDA_UPDATING_PAYMENT_METHODS').'\' ); ';

        if (empty($country_id))
        {
            $html = JText::_('COM_TIENDA_SELECT_COUNTRY');
        }
        else
        {
            $html = TiendaSelect::zone( $zone_id, $prefix.'zone_id', $country_id, $attribs, $prefix.'zone_id' );
        }
         
        $response = array();
        $response['msg'] = $html;
        $response['error'] = '';

        // encode and echo (need to echo to send back to browser)
        echo ( json_encode($response) );

        return;
    }

    /**
     *
     * @param $values
     * @param boolean - save the addresses
     * @return unknown_type
     */
    function setAddresses( &$values, $saved = false, $ajax = false )
    {
        $order = $this->_order; // a TableOrders object (see constructor)

        // Get the currency from the configuration
        Tienda::load( 'TiendaHelperCurrency', 'helpers.currency' );
        $currency_id = TiendaHelperCurrency::getCurrentCurrency(); // USD is default if no currency selected
        $billing_address_id     = (!empty($values['billing_address_id'])) ? $values['billing_address_id'] : 0;
        $shipping_address_id    = (!empty($values['shipping_address_id'])) ? $values['shipping_address_id'] : 0;
        //$shipping_method_id     = $values['shipping_method_id'];
        $same_as_billing        = (!empty($values['sameasbilling'])) ? true : false;
        if( $ajax )
        {
            $same_as_billing     = !empty($values['_checked']['sameasbilling']) ? true : false;
        }

        $user_id                = JFactory::getUser()->id;
        $billing_input_prefix   = $this->billing_input_prefix;
        $shipping_input_prefix  = $this->shipping_input_prefix;

        // Guest checkout
        if ($user_id == 0 && Tienda::getInstance()->get('guest_checkout_enabled', '1'))
        {
            $user_id = -1;
        }

        $billing_zone_id = 0;
        $billingAddressArray = $this->getAddress( $billing_address_id, $billing_input_prefix, $values );
        if (array_key_exists('zone_id', $billingAddressArray))
        {
            $billing_zone_id = $billingAddressArray['zone_id'];
        }

        //SHIPPING ADDRESS: get shipping address from dropdown or form (depending on selection)
        $shipping_zone_id = 0;
        if ($same_as_billing)
        {
            $shippingAddressArray = $billingAddressArray;
        }
        else
        {
            $shippingAddressArray = $this->getAddress($shipping_address_id, $shipping_input_prefix, $values);
        }

        if (array_key_exists('zone_id', $shippingAddressArray))
        {
            $shipping_zone_id = $shippingAddressArray['zone_id'];
        }

        // keep the array for binding during the save process
        $this->_orderinfoBillingAddressArray = $this->filterArrayUsingPrefix($billingAddressArray, '', 'billing_', true);
        $this->_orderinfoShippingAddressArray = $this->filterArrayUsingPrefix($shippingAddressArray, '', 'shipping_', true);
        $this->_billingAddressArray = $billingAddressArray;
        $this->_shippingAddressArray = $shippingAddressArray;

        JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
        $billingAddress = JTable::getInstance('Addresses', 'TiendaTable');
        $shippingAddress = JTable::getInstance('Addresses', 'TiendaTable');

        // set the order billing address
        $billingAddress->bind( $billingAddressArray );
        $billingAddress->user_id = $user_id;
        $billingAddress->addresstype_id = 1;
        if($saved)
        {
            $billingAddress->save();
            if( !$billing_address_id )
                $values['billing_address_id'] = $billingAddress->address_id;
        }

        $order->setAddress( $billingAddress);

        // set the order shipping address
        $shippingAddress->bind( $shippingAddressArray );
        $shippingAddress->user_id = $user_id;
        $shippingAddress->addresstype_id = 2;
        if($saved)
        {
            $shippingAddress->save();
            if( !$shipping_address_id )
                $values['shipping_address_id'] = $shippingAddress->address_id;
        }

        $order->setAddress( $shippingAddress, 'shipping' );

        return;
    }

    /**
     *
     * @param unknown_type $address_id
     * @param unknown_type $input_prefix
     * @param unknown_type $form_input_array
     * @return unknown_type
     */
    function getAddress( $address_id, $input_prefix, $form_input_array )
    {
        $addressArray = array();
        if (!empty($address_id))
        {
            $addressArray = $this->retrieveAddressIntoArray($address_id);
        }
        else
        {
            $addressArray = $this->filterArrayUsingPrefix($form_input_array, $input_prefix, '', false );
            // set the zone name
            $zone = JTable::getInstance('Zones', 'TiendaTable');
            $zone->load( @$addressArray['zone_id'] );
            $addressArray['zone_name'] = $zone->zone_name;
            // set the country name
            $country = JTable::getInstance('Countries', 'TiendaTable');
            $country->load( @$addressArray['country_id'] );
            $addressArray['country_name'] = $country->country_name;
        }
        return $addressArray;
    }

    /**
     * Gets an address formatted for display
     *
     * @param int $address_id
     * @return string html
     */
    function getAddressHtml( $address_id )
    {
        $html = '';
        $model = JModel::getInstance( 'Addresses', 'TiendaModel' );
        $model->setId( $address_id );
        if ($item = $model->getItem())
        {
            $view   = $this->getView( 'addresses', 'html' );
            $view->set( '_controller', 'addresses' );
            $view->set( '_view', 'addresses' );
            $view->set( '_doTask', true);
            $view->set( 'hidemenu', true);
            $view->setModel( $model, true );
            $view->setLayout( 'view_inner' );
            $view->set('row', $item);

            ob_start();
            $view->display();
            $html = ob_get_contents();
            ob_end_clean();
        }

        return $html;
    }

    /**
     * Gets an address form for display
     *
     * @param string $prefix
     * @return string html
     */
    function getAddressForm( $prefix, $guest = false, $forShipping=false )
    {
        $html = '';
        $model = $this->getModel( 'Addresses', 'TiendaModel' );
        $view   = $this->getView( 'checkout', 'html' );
        $view->set( '_controller', 'checkout' );
        $view->set( '_view', 'checkout' );
        $view->set( '_doTask', true);
        $view->set( 'hidemenu', true);
        $view->set( 'form_prefix', $prefix );
        $view->set( 'guest', $guest );
        $view->setModel( $model, true );
        $view->setLayout( 'form_address' );

        // Checking whether shipping is required
        $showShipping = false;
        $cartsModel = $this->getModel('carts');
        if ($isShippingEnabled = $cartsModel->getShippingIsEnabled())
        {
            $showShipping = true;
        }
        $view->assign( 'showShipping', $showShipping );
        $view->assign( 'forShipping', $forShipping );

        JModel::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/models' );
        $countries_model = JModel::getInstance( 'Countries', 'TiendaModel' );
        $default_country = $countries_model->getDefault();
        $default_country_id = $default_country->country_id;

        $attribs = array('class' => 'inputbox','size' => '1' );
        if( $this->onepage_checkout )
            $attribs['onchange'] = 'tiendaCheckoutAutomaticShippingRatesUpdate( \''.$prefix.'zone_id\', \''.JText::_('COM_TIENDA_UPDATING_SHIPPING_RATES').'\', \''.JText::_('COM_TIENDA_UPDATING_CART').'\', \''.JText::_('COM_TIENDA_UPDATING_ADDRESS').'\', \''.JText::_('COM_TIENDA_UPDATING_PAYMENT_METHODS').'\' ); ';

        Tienda::load( 'TiendaSelect', 'library.select' );
        $zones = TiendaSelect::zone( '', $prefix.'zone_id', $default_country_id , $attribs, $prefix.'zone_id' );

        $view->assign( 'default_country_id', $default_country_id );
        $view->assign( 'zones', $zones );

        ob_start();
        $view->display();
        $html = ob_get_contents();
        ob_end_clean();

        return $html;
    }

    /**
     * Gets the selected shipping method
     *
     * @param $shipping_method_id
     * @return unknown_type
     */
    function getShippingHtml( $layout='shipping_yes' )
    {
        $html = '';
        $model = $this->getModel( 'Checkout', 'TiendaModel' );
        $view   = $this->getView( 'checkout', 'html' );
        $view->set( '_controller', 'checkout' );
        $view->set( '_view', 'checkout' );
        $view->set( '_doTask', true);
        $view->set( 'hidemenu', true);
        $view->setModel( $model, true );
        $view->setLayout( $layout );

        switch (strtolower($layout))
        {
            case "shipping_calculate":
                break;
            case "shipping_no":
                break;
            case "shipping_yes":
            default:
                $rates = $this->getShippingRates();
                $default_rate = array();
                if (count($rates) == 1)
                {
                    $default_rate = $rates[0];
                }
                $view->assign( 'rates', $rates );
                $view->assign( 'default_rate', $default_rate );
                break;
        }

        ob_start();
        $view->display();
        $html = ob_get_contents();
        ob_end_clean();

        return $html;
    }

    /**
     * Gets the Register Form
     *
     * @param string $shipping_method_id
     * @param array $values
     * @return unknown_type
     */
    function getRegisterForm( $layout='form_register', $values= array() )
    {
        $html = '';
        $model = $this->getModel( 'Checkout', 'TiendaModel' );
        $view   = $this->getView( 'checkout', 'html' );
        $view->set( '_controller', 'checkout' );
        $view->set( '_view', 'checkout' );
        $view->set( '_doTask', true);
        $view->set( 'hidemenu', true);
        $view->assign( 'values', $values );
        $view->setModel( $model, true );
        $view->setLayout( $layout );
        ob_start();
        $view->display();
        $html = ob_get_contents();
        ob_end_clean();

        if ( $this->onepage_checkout && empty($values))
        {
            // set response array
            $response = array();
            $response['msg'] = '<form action="index.php?option=com_tienda&view=checkout" method="post" id="tienda_registration_form" name="adminForm" enctype="multipart/form-data">';
            $response['msg'] .= "<div class='tienda_registration'>".$html."</div>";
            $response['msg'] .= "</form>";
            $response['label'] = JText::_('COM_TIENDA_REGISTER');

            // encode and echo (need to echo to send back to browser)
            echo json_encode($response);
            return;
        }
         
        return $html;
    }

    /**
     * Gets the applicable rates
     *
     * @return array
     */
    function getShippingRates()
    {
        // get all the enabled shipping plugins
        Tienda::load( 'TiendaHelperPlugin', 'helpers.plugin' );
        //$plugins = TiendaHelperPlugin::getPluginsWithEvent( 'onGetShippingPlugins' );
        $model = JModel::getInstance('Shipping', 'TiendaModel');
        $model->setState('filter_enabled', '1');
        $plugins = $model->getList();

        $dispatcher = JDispatcher::getInstance();

        $rates = array();

        // add taxes, even thought they aren't displayed
        $order_tax = 0;
        $orderitems = $this->_order->getItems();
        foreach( $orderitems as $item )
        {
            $this->_order->order_subtotal += $item->orderitem_tax;
            $order_tax += $item->orderitem_tax;
        }


        if ($plugins)
        {
            foreach ($plugins as $plugin)
            {

                $shippingOptions = $dispatcher->trigger( "onGetShippingOptions", array( $plugin->element, $this->_order ) );
                 
                if (in_array(true, $shippingOptions, true))
                {
                    $results = $dispatcher->trigger( "onGetShippingRates", array( $plugin->element, $this->_order ) );
                    foreach ($results as $result)
                    {
                        if(is_array($result))
                        {
                            foreach( $result as $r )
                            {
                                $extra = 0;
                                // here is where a global handling rate would be added
                                if ($global_handling = Tienda::getInstance()->get( 'global_handling' ))
                                {
                                    $extra = $global_handling;
                                }
                                $r['extra'] += $extra;
                                $r['total'] += $extra;
                                $rates[] = $r;
                            }
                        }
                    }
                }
            }
        }

        $this->_order->order_subtotal -= $order_tax;
        return $rates;
    }

    /**
     * Updates shipping rates and captures output
     * Returns via json_encode
     *
     * @return unknown_type
     */
    function updateShippingRates()
    {
        $response = array();
        $response['msg'] = '';
        $response['error'] = '';
        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();

        // get elements from post
        $elements = json_decode( preg_replace('/[\n\r]+/', '\n', JRequest::getVar( 'elements', '', 'post', 'string' ) ) );

        // Test if elements are empty
        // Return proper message to user
        if (empty($elements))
        {
            // do form validation
            // if it fails check, return message
            $response['error'] = '1';
            $response['msg'] = $this->getShippingHtml('shipping_calculate');
            $response['msg'] .= $helper->generateMessage(JText::_('COM_TIENDA_ERROR_WHILE_VALIDATING_THE_PARAMETERS'));
            echo ( json_encode( $response ) );
            return;
        }

        // convert elements to array that can be binded
        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();
        $submitted_values = $helper->elementsToArray( $elements );

        // Use AJAX to show plugins that are available
        JLoader::import( 'com_tienda.library.json', JPATH_ADMINISTRATOR.'/components' );

        $guest = false;
        if( Tienda::getInstance()->get('guest_checkout_enabled') )
        {
            if( !$this->onepage_checkout )
            {
                $guest = JFactory::getUser()->id ? 0 : 1;
            }
            else // normal checkout
            {
                $guest = JRequest::getVar( 'guest', '0');
            }
             
            $guest = $guest ? true : false;
        }

        $values = $this->populateOrder($guest);

        $this->setAddresses( $submitted_values, false, true );
        // fail if shipping address is invalid
        // if we're checking shipping and the sameasbilling is checked, then this is good
        if ($submitted_values['shippingrequired'])
        {
            if (!$this->validateAddress( $submitted_values, $this->shipping_input_prefix, @$submitted_values['shipping_address_id'], true ))
            {
                $response['msg'] = $this->getShippingHtml('shipping_calculate');
                $response['msg'] .= $helper->generateMessage( JText::_('COM_TIENDA_SHIPPING_ADDRESS_ERROR')." :: ".$this->getError());
                $response['error'] = '1';
                echo ( json_encode( $response ) );
                return;
            }
        }

        // set response array
        $response = array();
        $text = "";
        $user = JFactory::getUser();

        $rates = $this->getShippingRates();
        $c = count($rates);
        if( $c )
        {
            $default_rate = array();
            if ( $c == 1)
            {
                $default_rate = $rates[0];
                $response['default_rate'] = $default_rate;
            }

            //Set display
            $view = $this->getView( 'checkout', 'html' );
            $view->setLayout('shipping_yes');
            $view->set( '_doTask', true);

            //Get and Set Model
            $model = $this->getModel('checkout');
            $view->setModel( $model, true );

            $view->set( 'hidemenu', false);
            $view->assign( 'rates', $rates );
            $view->assign( 'default_rate', $default_rate );

            ob_start();
            $view->display();
            $html = ob_get_contents();
            ob_end_clean();
        }
        else
        {
            $html = $this->getShippingHtml('shipping_calculate');
        }
        $response['msg'] = $html;
        // encode and echo (need to echo to send back to browser)
        echo json_encode($response);

        return;
    }

    /**
     * Sets the selected shipping method
     *
     * @return unknown_type
     */
    function setShippingMethod()
    {
        $elements = json_decode( preg_replace('/[\n\r]+/', '\n', JRequest::getVar( 'elements', '', 'post', 'string' ) ) );

        // convert elements to array that can be binded
        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();
        $values = $helper->elementsToArray( $elements );

        $response = array();
        $response['msg'] = '';
        $response['error'] = '';

        // get the order object so we can populate it
        $order = $this->_order; // a TableOrders object (see constructor)

        // bind what you can from the post
        $order->bind( $values );

        // set the currency
        Tienda::load( 'TiendaHelperCurrency', 'helpers.currency' );
        $order->currency_id = TiendaHelperCurrency::getCurrentCurrency(); // USD is default if no currency selected

        // set the shipping method
        $order->shipping = new JObject();
        $order->shipping->shipping_price      = @$values['shipping_price'];
        $order->shipping->shipping_extra      = @$values['shipping_extra'];
        $order->shipping->shipping_code      	= @$values['shipping_code'];
        $order->shipping->shipping_name       = @$values['shipping_name'];
        $order->shipping->shipping_tax        = @$values['shipping_tax'];
        $order->shipping->shipping_type				= @$values['shipping_plugin'];

        // set the addresses
        $this->setAddresses( $values, false, true );

        // get the items and add them to the order
        Tienda::load( "TiendaHelperBase", 'helpers._base' );
        $cart_helper = TiendaHelperBase::getInstance( 'Carts' );
        $items = $cart_helper->getProductsInfo();
        foreach ($items as $item)
        {
            $order->addItem( $item );
        }

        // get all coupons and add them to the order
        if (!empty($values['coupons']))
        {
            foreach ($values['coupons'] as $coupon_id)
            {
                $coupon = JTable::getInstance('Coupons', 'TiendaTable');
                $coupon->load(array('coupon_id'=>$coupon_id));
                $order->addCoupon( $coupon );
            }
        }
         
        // get the order totals
        $order->calculateTotals();

        // now get the summary
        $html = $this->getOrderSummary();

        $response = array();
        $response['msg'] = $html;
        $response['error'] = '';

        // encode and echo (need to echo to send back to browser)
        echo json_encode($response);

        return;
    }

    /**
     * Returning total amount value
     *
     * @return unknown_type
     */
    function totalAmountDue()
    {
        $elements = json_decode( preg_replace('/[\n\r]+/', '\n', JRequest::getVar( 'elements', '', 'post', 'string' ) ) );

        // convert elements to array that can be binded
        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();
        $values = $helper->elementsToArray( $elements );

        $response = array();
        $response['msg'] = '';
        $response['error'] = '';

        // get the order object so we can populate it
        $order = $this->_order; // a TableOrders object (see constructor)

        // bind what you can from the post
        $order->bind( $values );
        $order->shipping = new JObject();
        $order->shipping->shipping_price      = @$values['shipping_price'];
        $order->shipping->shipping_extra      = @$values['shipping_extra'];
        $order->shipping->shipping_name       = @$values['shipping_name'];
        $order->shipping->shipping_tax        = @$values['shipping_tax'];

        // set the currency
        Tienda::load( 'TiendaHelperCurrency', 'helpers.currency' );
        $order->currency_id = TiendaHelperCurrency::getCurrentCurrency(); // USD is default if no currency selected

        // get the items and add them to the order
        Tienda::load( "TiendaHelperBase", 'helpers._base' );
        $cart_helper = TiendaHelperBase::getInstance( 'Carts' );
        $items = $cart_helper->getProductsInfo();
        foreach ($items as $item)
        {
            $order->addItem( $item );
        }

        // get all coupons and add them to the order
        if (!empty($values['coupons']))
        {
            foreach ($values['coupons'] as $coupon_id)
            {
                $coupon = JTable::getInstance('Coupons', 'TiendaTable');
                $coupon->load(array('coupon_id'=>$coupon_id));
                $order->addCoupon( $coupon );
            }
        }

        // get the order totals
        $order->calculateTotals();

        // now get the summary
        $html = $this->getTotalAmountDue();

        $response = array();
        $response['msg'] = $html;
        $response['error'] = '';

        // encode and echo (need to echo to send back to browser)
        echo json_encode($response);
    }

    function getPaymentOptionsHtml()
    {
        $html = '';
        $model = $this->getModel( 'Checkout', 'TiendaModel' );
        $view   = $this->getView( 'checkout', 'html' );
        $view->set( '_controller', 'checkout' );
        $view->set( '_view', 'checkout' );
        $view->set( '_doTask', true);
        $view->set( 'hidemenu', true);
        $view->setModel( $model, true );
        $view->setLayout( 'payment_options' );

        $payment_plugins = $this->getPaymentOptions($this->_order);
        $view->assign( 'payment_plugins',  $payment_plugins);

        if (count($payment_plugins) == 1)
        {
            $payment_plugins[0]->checked = true;
            $dispatcher    = JDispatcher::getInstance();
            $results = $dispatcher->trigger( "onGetPaymentForm", array( $payment_plugins[0]->element, '' ) );

            $text = '';
            for ($i=0; $i<count($results); $i++)
            {
                $text .= $results[$i];
            }

            $view->assign( 'payment_form_div', $text );
        }
        
        $showPayment = true;
        if ((float)$this->_order->order_total == (float)'0.00')
        {
            $showPayment = false;
        }

        $view->assign( 'showPayment', $showPayment );
        $view->assign( 'one_page', $this->onepage_checkout );
        ob_start();
        $view->display();
        $html = ob_get_contents();
        ob_end_clean();

        return $html;
    }

    /**
     * Method to get the Payment Methods
     * @param object $order -
     * @return array
     */
    function getPaymentOptions($order = null)
    {
        $options = array();

        if(is_null($order)) return $options;

        //get payment plugins
        // get all the enabled payment plugins
        Tienda::load( 'TiendaHelperPlugin', 'helpers.plugin' );
        $plugins = TiendaHelperPlugin::getPluginsWithEvent( 'onGetPaymentPlugins' );

        if ($plugins)
        {
            $dispatcher = JDispatcher::getInstance();
            foreach ($plugins as $plugin)
            {
                $results = $dispatcher->trigger( "onGetPaymentOptions", array( $plugin->element, $order ) );
                if (in_array(true, $results, true))
                {
                    $options[] = $plugin;
                }
            }
        }

        return $options;
    }

    function updatePaymentOptions()
    {
        $response = array();
        $response['msg'] = '';
        $response['error'] = '';
        $error_message = '';

        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();

        // get elements from post
        $elements = json_decode( preg_replace('/[\n\r]+/', '\n', JRequest::getVar( 'elements', '', 'post', 'string' ) ) );

        // Test if elements are empty
        // Return proper message to user
        if (empty($elements))
        {
            // do form validation
            // if it fails check, return message
            $response['error'] = '1';
            $response['msg'] = $helper->generateMessage(JText::_('COM_TIENDA_ERROR_WHILE_VALIDATING_THE_PARAMETERS'));
            echo json_encode($response);
            return;
        }

        // convert elements to array that can be binded
        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = new TiendaHelperBase();
        $submitted_values = $helper->elementsToArray( $elements );

        // Use AJAX to show plugins that are available
        JLoader::import( 'com_tienda.library.json', JPATH_ADMINISTRATOR.'/components' );

        $this->setAddresses( $submitted_values, false, true );
        if (!$this->validateAddress( $submitted_values, $this->billing_input_prefix, @$submitted_values['billing_address_id'], true ))
        {
            $error_message = $helper->generateMessage( JText::_('COM_TIENDA_BILLING_ADDRESS_ERROR')." :: ".$this->getError());
            $response['error'] = '1';
            $response['msg'] = $error_message;
            echo json_encode($response);
            return;
        }

        $model = $this->getModel( 'Checkout', 'TiendaModel' );
        $view   = $this->getView( 'checkout', 'html' );
        $view->set( '_controller', 'checkout' );
        $view->set( '_view', 'checkout' );
        $view->set( '_doTask', true);
        $view->set( 'hidemenu', true);
        $view->setModel( $model, true );
        $view->setLayout( 'payment_options' );

        $payment_plugins = $this->getPaymentOptions($this->_order);
        $view->assign( 'payment_plugins',  $payment_plugins);

        $guest = false;
        if( Tienda::getInstance()->get('guest_checkout_enabled') )
        {
            if( !$this->onepage_checkout )
            {
                $guest = JFactory::getUser()->id ? 0 : 1;
            }
            else // normal checkout
            {
                $guest = JRequest::getVar( 'guest', '0');
            }
             
            $guest = $guest ? true : false;
        }
        
        $this->populateOrder($guest);
        $this->addCouponCodes( $submitted_values );
        $this->_order->calculateTotals();        

        if (count($payment_plugins) == 1)
        {
            $payment_plugins[0]->checked = true;
            $dispatcher    = JDispatcher::getInstance();
            $results = $dispatcher->trigger( "onGetPaymentForm", array( $payment_plugins[0]->element, '' ) );

            $text = '';
            for ($i=0; $i<count($results); $i++)
            {
                $text .= $results[$i];
            }

            $view->assign( 'payment_form_div', $text );
        }
        else
        {
            if( isset( $submitted_values['_checked']['payment_plugin'] ) )
            {
                foreach ($payment_plugins as $plugin)
                {
                    if($plugin->element == $submitted_values['_checked']['payment_plugin'])
                    {
                        $plugin->checked = true;
                    }
                }
            }
        }

        $showPayment = true;
        if ((float)$this->_order->order_total == (float)'0.00')
        {
            $showPayment = false;
        }
        $view->assign( 'showPayment', $showPayment );
        
        ob_start();
        $view->display();
        $html = ob_get_contents();
        ob_end_clean();

        // set response array
        $response = array();
        $response['msg'] = $error_message . $html;

        // encode and echo (need to echo to send back to browser)
        echo json_encode($response);

        return;
    }

    /**
     * Prepare the review tmpl
     *
     * @return unknown_type
     */
    function selectPayment()
    {
        $this->current_step = 1;

        // get the posted values
        $values = JRequest::get('post');
        // check shipping hash
        if( @$values['shippingrequired'] && !$this->checkShippingHash( $values ) )
        {
            jexit( JText::_( 'COM_TIENDA_INVALID_SHIPPING_VALUES' ) );
            return false;
        }

        // get the order object so we can populate it
        $order = $this->_order; // a TableOrders object (see constructor)

        $user_id = JFactory::getUser()->id;
        if ( !empty($values['register']) && empty($user_id) )
        {
            $this->registerNewUser($values);
            $user_id = JFactory::getUser()->id;
        }

        // Guest Checkout
        $guest = false;
        if ( empty($user_id) && Tienda::getInstance()->get('guest_checkout_enabled', '1') )
        {
            $email_address = $values['email_address'];
            $guest = true;
            $user_id = -1;
        }

        $order->bind( $values );
        $order->user_id = $user_id;
        //$order->shipping_method_id = $values['shipping_method_id'];

        // set the shipping method
        $order->shipping = new JObject();
        $order->shipping->shipping_price      = @$values['shipping_price'];
        $order->shipping->shipping_extra      = @$values['shipping_extra'];
        $order->shipping->shipping_name       = @$values['shipping_name'];
        $order->shipping->shipping_tax        = @$values['shipping_tax'];

        $this->setAddresses( $values );

        // get the items and add them to the order
        Tienda::load( "TiendaHelperBase", 'helpers._base' );
        $cart_helper = TiendaHelperBase::getInstance( 'Carts' );
        $items = $cart_helper->getProductsInfo();
        foreach ($items as $item)
        {
            $order->addItem( $item );
        }

        $this->addAutomaticCoupons();

        // get the order totals
        $order->calculateTotals();

        // now that the order object is set, get the orderSummary html
        $html = $this->getOrderSummary();

        $values = JRequest::get('post');

        //Set key information from post
        $billing_address_id     = (!empty($values['billing_address_id'])) ? $values['billing_address_id'] : 0;
        $shipping_address_id    = (!empty($values['shipping_address_id'])) ? $values['shipping_address_id'] : 0;
        $same_as_billing        = (!empty($values['sameasbilling'])) ? true : false;
        //$shipping_method_id     = $values['shipping_method_id'];
        $customerNote           = @$values['customer_note'];

        $progress = $this->getProgress();

        $paymentOptionsHtml = $this->getPaymentOptionsHtml();

        //Set display
        $view = $this->getView( 'checkout', 'html' );
        $view->setLayout('selectpayment');
        $view->set( '_doTask', true);

        //Get and Set Model
        $model = $this->getModel('checkout');
        $view->setModel( $model, true );

        // Checking whether shipping is required
        $showShipping = false;
        $cartsModel = $this->getModel('carts');
        if ($isShippingEnabled = $cartsModel->getShippingIsEnabled())
        {
            $showShipping = true;
        }
        $view->assign( 'showShipping', $showShipping );

        //Get Addresses
        //$shippingAddressArray = $this->retrieveAddressIntoArray($shipping_address_id);
        //$billingAddressArray = $this->retrieveAddressIntoArray($billing_address_id);
        $billingAddressArray = $this->_billingAddressArray;
        $shippingAddressArray = $this->_shippingAddressArray;

        // save the addresses
        JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
        $billingAddress = JTable::getInstance('Addresses', 'TiendaTable');
        $shippingAddress = JTable::getInstance('Addresses', 'TiendaTable');

        // set the order billing address
        $billingAddress->load( $billing_address_id );
        $billingAddress->bind( $billingAddressArray );
        $billingAddress->user_id = $user_id;
        $billingAddress->save();

        $showBilling = true;
        if (empty($billingAddress->address_id))
        {
            $showBilling = false;
        }
        $view->assign( 'showBilling', $showBilling );

        $values['billing_address_id'] = $billingAddress->address_id;
        if ($same_as_billing)
        {
            $shipping_address_id = $values['billing_address_id'];
        }

        // set the order shipping address
        if (!$same_as_billing)
        {
            $shippingAddress->load( $shipping_address_id );
            $shippingAddress->bind( $shippingAddressArray );
            $shippingAddress->user_id = $user_id;
            $shippingAddress->save();
            $shipping_address_id = $shippingAddress->address_id;
        }
        $values['shipping_address_id'] = $shipping_address_id;

        $shippingMethodName = @$values['shipping_name'];

        //Assign Addresses and Shippping Method to view
        $view->assign('shipping_method_name',$shippingMethodName);
        //$view->assign('shipping_method_id',$shipping_method_id);
        $view->assign('shipping_info',$shippingAddressArray);
        $view->assign('billing_info',$billingAddressArray);
        $view->assign('customer_note', $customerNote);
        $view->assign('values', $values);
        $view->assign('progress', $progress);
        $view->assign('guest', $guest);

        $view->set( 'hidemenu', false);
        $view->assign( 'order', $order );
        $view->assign( 'orderSummary', $html );

        $showPayment = true;
        if( $order->isRecurring() )
        {
            if( (float)$order->getRecurringItem()->recurring_price == (float)'0.00' )
            {
                $showPayment = false;
            }
        }
        else {
            if ((float)$order->order_total == (float)'0.00')
            {
                $showPayment = false;
            }
        }
        
        $view->assign( 'showPayment', $showPayment );

        // are there any enabled coupons?
        $coupons_present = false;
        $model = JModel::getInstance( 'Coupons', 'TiendaModel' );
        $model->setState('filter_enabled', '1');
        if ($coupons = $model->getList())
        {
            $coupons_present = true;
        }
        $view->assign( 'coupons_present', $coupons_present );

        // assign userinfo for credits
        $userinfo = JTable::getInstance( 'UserInfo', 'TiendaTable' );
        $userinfo->load( array( 'user_id'=>$user_id ) );
        $userinfo->credits_total = (float) $userinfo->credits_total;
        $view->assign('userinfo', $userinfo);

        $dispatcher = JDispatcher::getInstance();
        ob_start();
        $dispatcher->trigger( 'onBeforeDisplaySelectPayment', array( $order ) );
        $view->assign( 'onBeforeDisplaySelectPayment', ob_get_contents() );
        ob_end_clean();
        $view->assign( 'payment_options_html', $paymentOptionsHtml );
        ob_start();
        $dispatcher->trigger( 'onAfterDisplaySelectPayment', array( $order ) );
        $view->assign( 'onAfterDisplaySelectPayment', ob_get_contents() );
        ob_end_clean();

        $view->display();
        $this->footer();
    }

    /**
     * Fires selected tienda payment plugin and captures output
     * Returns via json_encode
     *
     * @return unknown_type
     */
    function getPaymentForm( $element='' )
    {
        // Use AJAX to show plugins that are available
        JLoader::import( 'com_tienda.library.json', JPATH_ADMINISTRATOR.'/components' );
        $values = JRequest::get('post');
        $html = '';
        $text = "";
        $user = JFactory::getUser();
        if (empty($element)) {
            $element = JRequest::getVar( 'payment_element' );
        }
        $results = array();
        $dispatcher    = JDispatcher::getInstance();
        $results = $dispatcher->trigger( "onGetPaymentForm", array( $element, $values ) );

        for ($i=0; $i<count($results); $i++)
        {
            $result = $results[$i];
            $text .= $result;
        }

        $html = $text;

        // set response array
        $response = array();
        $response['msg'] = $html;

        // encode and echo (need to echo to send back to browser)
        echo json_encode($response);

        return;
    }

    /**
     * This method is called after the submitted values is successfully validated and order successfully save
     * It will prepare the data to be passed to the function _prePayment() of payment plugin
     * @return unknown
     */
    function preparePaymentOnepage($values, $user_id)
    {
        $data = new JObject();
        $data->html = '';
        $data->summary = '';

        // Get Order Object
        $order = $this->_order;

        // Update the addresses' user id!
        $shippingAddress = $order->getShippingAddress();
        $billingAddress = $order->getBillingAddress();

        $shippingAddress->user_id = $user_id;
        $billingAddress->user_id = $user_id;

        // Checking whether shipping is required
        $showShipping = false;
        $cartsModel = $this->getModel('carts');
        if ($isShippingEnabled = $cartsModel->getShippingIsEnabled())
        {
            $showShipping = true;
        }


        if ($showShipping && !$shippingAddress->save())
        {
            $data->_errors = $shippingAddress->getError();
            return $data;
        }

        if (!$billingAddress->save())
        {
            $data->_errors = $billingAddress->getError();
            return $data;
        }

        $orderpayment_type = @$values['payment_plugin'];
        $transaction_status = JText::_('COM_TIENDA_INCOMPLETE');
        
        // in the case of orders with a value of 0.00, use custom values
        if ( (float) $order->order_total == (float)'0.00' )
        {
            $orderpayment_type = 'free';
            $transaction_status = JText::_('COM_TIENDA_COMPLETE');
        }

        // Save an orderpayment with an Incomplete status
        JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
        $orderpayment = JTable::getInstance('OrderPayments', 'TiendaTable');
        $orderpayment->order_id = $order->order_id;
        $orderpayment->orderpayment_type = $orderpayment_type; // this is the payment plugin selected
        $orderpayment->transaction_status = $transaction_status; // payment plugin updates this field onPostPayment
        $orderpayment->orderpayment_amount = $order->order_total; // this is the expected payment amount.  payment plugin should verify actual payment amount against expected payment amount
        if (!$orderpayment->save())
        {
            $data->_errors = $orderpayment->getError();
            return $data;
        }

        // send the order_id and orderpayment_id to the payment plugin so it knows which DB record to update upon successful payment
        $values["order_id"]             = $order->order_id;
        $values["orderinfo"]            = $order->orderinfo;
        $values["orderpayment_id"]      = $orderpayment->orderpayment_id;
        $values["orderpayment_amount"]  = $orderpayment->orderpayment_amount;

        // IMPORTANT: Store the order_id in the user's session for the postPayment "View Invoice" link
        $mainframe = JFactory::getApplication();
        $mainframe->setUserState( 'tienda.order_id', $order->order_id );
        $mainframe->setUserState( 'tienda.orderpayment_id', $orderpayment->orderpayment_id );

        $html = "";
        if (!empty($values['payment_plugin'])) 
        {
            $dispatcher    = JDispatcher::getInstance();
            $results = $dispatcher->trigger( "onPrePayment", array( $values['payment_plugin'], $values ) );
    
            // Display whatever comes back from Payment Plugin for the onPrePayment
            for ($i=0; $i<count($results); $i++)
            {
                $html .= $results[$i];
            }
        } 
        else if ((float) $order->order_total == (float) '0.00') 
        {
            $data->redirect = JRoute::_( 'index.php?option=com_tienda&view=checkout&task=confirmPayment' );
        }
        
        $data->html = $html;
        $data->summary = $this->getOrderSummary();
        return $data;
    }

    /**
     * This method occurs before payment is attempted
     * and fires the onPrePayment plugin event
     *
     * @return unknown_type
     */
    function preparePayment()
    {
        $this->current_step = 2;
        // verify that form was submitted by checking token
        JRequest::checkToken() or jexit( 'TiendaControllerCheckout::preparePayment - Invalid Token' );
         
        // 1. save the order to the table with a 'pre-payment' status

        // Get post values
        $values = JRequest::get('post');
        $user = JFactory::getUser();
        //set to session to know that we are not doing POS order
        JFactory::getApplication()->setUserState( 'tienda.pos_order', false );

        $user_id = -1;
        // Guest Checkout
        if (Tienda::getInstance()->get('guest_checkout_enabled', '1') && $values['guest'] == '1')
        {
            Tienda::load( 'TiendaHelperUser', 'helpers.user' );
            $userHelper = TiendaHelperUser::getInstance('User', 'TiendaHelper');

            if ($userHelper->emailExists($values['email_address']))
            {
                // TODO user already exists

            }
            else
            {
                // save the real user's info in the userinfo table
                JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
                $userinfo = JTable::getInstance('UserInfo', 'TiendaTable');
                $userinfo->user_id = TiendaHelperUser::getNextGuestUserId();
                $userinfo->email = $values['email_address'];
                $userinfo->save();
                $user_id = $userinfo->user_id;
            }
        }
        else
            $user_id = $user->id; // get

        // Save the order with a pending status
        if (!$this->saveOrder($values, $user_id))
        {
            // Output error message and halt
            JError::raiseNotice( 'Error Saving Order', $this->getError() );
            return false;
        }
         
        // Get Order Object
        $order = $this->_order;

        // Update the addresses' user id!
        $shippingAddress = $order->getShippingAddress();
        $billingAddress = $order->getBillingAddress();

        $shippingAddress->user_id = $user_id;
        $billingAddress->user_id = $user_id;

        // Checking whether shipping is required
        $showShipping = false;
        $cartsModel = $this->getModel('carts');
        if ($isShippingEnabled = $cartsModel->getShippingIsEnabled())
        {
            $showShipping = true;
        }

        if ($showShipping && !$shippingAddress->save())
        {
            // Output error message and halt
            JError::raiseNotice( 'Error Updating the Shipping Address', $shippingAddress->getError() );
            return false;
        }

        if (!$billingAddress->save())
        {
            // Output error message and halt
            JError::raiseNotice( 'Error Updating the Billing Address', $billingAddress->getError() );
            return false;
        }

        $orderpayment_type = $values['payment_plugin'];
        $transaction_status = JText::_('COM_TIENDA_INCOMPLETE');
        // in the case of orders with a value of 0.00, use custom values

        if( $order->isRecurring() )
        {
            if( (float)$order->getRecurringItem()->recurring_price == (float)'0.00' )
            {
                $orderpayment_type = 'free';
                $transaction_status = JText::_('COM_TIENDA_COMPLETE');
            }
        }
        else {
            if ( (float) $order->order_total == (float)'0.00' )
            {
                $orderpayment_type = 'free';
                $transaction_status = JText::_('COM_TIENDA_COMPLETE');
            }
        }

        // Save an orderpayment with an Incomplete status
        JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
        $orderpayment = JTable::getInstance('OrderPayments', 'TiendaTable');
        $orderpayment->order_id = $order->order_id;
        $orderpayment->orderpayment_type = $orderpayment_type; // this is the payment plugin selected
        $orderpayment->transaction_status = $transaction_status; // payment plugin updates this field onPostPayment
        $orderpayment->orderpayment_amount = $order->order_total; // this is the expected payment amount.  payment plugin should verify actual payment amount against expected payment amount
        if (!$orderpayment->save())
        {
            // Output error message and halt
            JError::raiseNotice( 'Error Saving Pending Payment Record', $orderpayment->getError() );
            return false;
        }

        // send the order_id and orderpayment_id to the payment plugin so it knows which DB record to update upon successful payment
        $values["order_id"]             = $order->order_id;
        $values["orderinfo"]            = $order->orderinfo;
        $values["orderpayment_id"]      = $orderpayment->orderpayment_id;
        $values["orderpayment_amount"]  = $orderpayment->orderpayment_amount;

        // IMPORTANT: Store the order_id in the user's session for the postPayment "View Invoice" link
        $mainframe = JFactory::getApplication();
        $mainframe->setUserState( 'tienda.order_id', $order->order_id );
        $mainframe->setUserState( 'tienda.orderpayment_id', $orderpayment->orderpayment_id );
         
        // 2. perform payment process
        // this is the onPrePayment plugin event
        // in the case of offsite payment plugins (like Paypal), they will display an order summary (perhaps with ****** for CC number)
        // with a button that submits a form to the external site (button: "confirm order" or Paypal, MB, Alertpay, whatever)
        // the return url will point to the method that fires the onPostPayment plugin event:
        // target: index.php?option=com_tienda&view=checkout&task=confirmPayment&orderpayment_type=xxxxxx
        // in the case of onsite payment plugins, they will display an order summary (perhaps with ****** for CC number)
        // with a button that submits a form to the method that fires the onPostPayment plugin event ("confirm order")
        // target: index.php?option=com_tienda&view=checkout&task=confirmPayment&orderpayment_type=xxxxxx
        // onPostPayment, payment plugin to update order status with payment status

        // in the case of orders with a value of 0.00, we redirect to the confirmPayment page
        if( $order->isRecurring() )
        {
            if( (float)$order->getRecurringItem()->recurring_price == (float)'0.00' )
            {
                JFactory::getApplication()->redirect( 'index.php?option=com_tienda&view=checkout&task=confirmPayment' );
                return;
            }
        }
        else {
            if ( (float) $order->order_total == (float)'0.00' )
            {
                JFactory::getApplication()->redirect( 'index.php?option=com_tienda&view=checkout&task=confirmPayment' );
                return;
            }
        }

        $dispatcher    = JDispatcher::getInstance();
        $results = $dispatcher->trigger( "onPrePayment", array( $values['payment_plugin'], $values ) );

        // Display whatever comes back from Payment Plugin for the onPrePayment
        $html = "";
        for ($i=0; $i<count($results); $i++)
        {
            $html .= $results[$i];
        }

        // get all coupons and add them to the order
        if (!empty($values['coupons']))
        {
            foreach ($values['coupons'] as $coupon_id)
            {
                $coupon = JTable::getInstance('Coupons', 'TiendaTable');
                $coupon->load(array('coupon_id'=>$coupon_id));
                $order->addCoupon( $coupon );
            }
        }

        $this->addCoupons($values);
        // get the order totals
        $order->calculateTotals();

        // get the order summary
        $summary = $this->getOrderSummary();

        // Get Addresses
        $shipping_address = $order->getShippingAddress();
        $billing_address = $order->getBillingAddress();

        $shippingAddressArray = $showShipping ? $this->_shippingAddressArray : array();
        $billingAddressArray = $this->_billingAddressArray;
         
        $shippingMethodName = $values['shipping_name'];

        $progress = $this->getProgress();

        // Set display
        $view = $this->getView( 'checkout', 'html' );
        $view->setLayout('prepayment');
        $view->set( '_doTask', true);
        $view->assign('order', $order);
        $view->assign('plugin_html', $html);
        $view->assign('progress', $progress);
        $view->assign('orderSummary', $summary);
        $view->assign('shipping_info', $shippingAddressArray);
        $view->assign('billing_info', $billingAddressArray);
        $view->assign('shipping_method_name',$shippingMethodName);
        $view->assign( 'showShipping', $showShipping );

        // Get and Set Model
        $model = $this->getModel('checkout');
        $view->setModel( $model, true );

        ob_start();
        $dispatcher->trigger( 'onBeforeDisplayPrePayment', array( $order ) );
        $view->assign( 'onBeforeDisplayPrePayment', ob_get_contents() );
        ob_end_clean();

        ob_start();
        $dispatcher->trigger( 'onAfterDisplayPrePayment', array( $order ) );
        $view->assign( 'onAfterDisplayPrePayment', ob_get_contents() );
        ob_end_clean();

        $view->display();

        return;
    }

    /**
     * This method occurs after payment is attempted,
     * and fires the onPostPayment plugin event
     *
     * @return unknown_type
     */
    function confirmPayment()
    {
        $this->current_step = 3;
        $orderpayment_type = JRequest::getVar('orderpayment_type');

        // Get post values
        $values = JRequest::get('post');

        // get the order_id from the session set by the prePayment
        $mainframe = JFactory::getApplication();
        $order_id = (int) $mainframe->getUserState( 'tienda.order_id' );
        $order_link = 'index.php?option=com_tienda&view=orders&task=view&id='.$order_id;

        $pos_order = $mainframe->getUserState( 'tienda.pos_order' );

        //redirect to the backend since we are doing pos order
        if($pos_order)
        {
            // build URL for POS
            $uri	 = JURI::getInstance();
            $uriA = JRequest::get('get');
            $uriA['view'] = 'pos';
            $uriA['task'] = 'display';
            $uriA['subtask'] = 'confirmPayment';
            $uriA['data'] = base64_encode(@json_encode($values));
            $uriA['order_id'] = $order_id;
            $uriA['nextstep'] = 'step5';
            $uriA['Itemid'] = null;
            $pos_link = $uri->buildQuery(array_filter($uriA));
            $mainframe->redirect(JURI::root().'administrator/index.php?' . $pos_link);
        }

        $dispatcher = JDispatcher::getInstance();
        $html = "";
        $order = $this->_order;
        $order->load( array('order_id'=>$order_id) );
        if( !empty( $order->order_hash ) )
            $order_link .= '&h='.$order->order_hash;

        if ( (!empty($order_id)) && (float) $order->order_total == (float)'0.00' )
        {
            $order->order_state_id = '17'; // PAYMENT RECEIVED
            $order->save();

            // send notice of new order
            Tienda::load( "TiendaHelperBase", 'helpers._base' );
            $helper = TiendaHelperBase::getInstance('Email');
            $order_model = Tienda::getClass("TiendaModelOrders", "models.orders");
            $order_model->setId( $order_id );
            $order_model_item = $order_model->getItem();
            $helper->sendEmailNotices($order_model_item, 'new_order');

            Tienda::load( 'TiendaHelperOrder', 'helpers.order' );
            TiendaHelperOrder::setOrderPaymentReceived( $order_id );
        }
        else
        {
            // get the payment results from the payment plugin
            $results = $dispatcher->trigger( "onPostPayment", array( $orderpayment_type, $values ) );

            // Display whatever comes back from Payment Plugin for the onPrePayment
            for ($i=0; $i<count($results); $i++)
            {
                $html .= $results[$i];
            }

            // re-load the order in case the payment plugin updated it
            $order->load( array('order_id'=>$order_id) );
        }

        // $order_id would be empty on posts back from Paypal, for example
        if (!empty($order_id))
        {

            // Set display
            if( !$this->onepage_checkout )
            {
                $progress = $this->getProgress();
            }
            $view = $this->getView( 'checkout', 'html' );
            $view->setLayout('postpayment');
            $view->set( '_doTask', true);
            $view->assign('order_link', $order_link );
            $view->assign('plugin_html', $html);
            if( !$this->onepage_checkout )
            {
                $view->assign('progress', $progress );
            }

            // Get and Set Model
            $model = $this->getModel('checkout');
            $view->setModel( $model, true );

            // get the articles to display after checkout
            $articles = array();
            $article_id = Tienda::getInstance()->get( 'article_checkout' );
            if (!empty($article_id))
            {
                Tienda::load( 'TiendaArticle', 'library.article' );
                $articles[] = TiendaArticle::display( $article_id );
            }

            switch ($order->order_state_id)
            {
                case "2":
                case "3":
                case "5":
                case "17":
                    $articles = array_merge( $articles, $this->getOrderArticles( $order_id ) );
                    break;
                case "7":
                case "8":
                case "9":
                case "10":
                case "14":
                    $article_id = Tienda::getInstance()->get( 'article_default_payment_failure' );
                    Tienda::load( 'TiendaArticle', 'library.article' );
                    $articles = array( TiendaArticle::display( $article_id ) );
                    break;
            }
            $view->assign( 'articles', $articles );

            ob_start();
            $dispatcher->trigger( 'onBeforeDisplayPostPayment', array( $order_id ) );
            $view->assign( 'onBeforeDisplayPostPayment', ob_get_contents() );
            ob_end_clean();

            ob_start();
            $dispatcher->trigger( 'onAfterDisplayPostPayment', array( $order_id ) );
            $view->assign( 'onAfterDisplayPostPayment', ob_get_contents() );
            ob_end_clean();
             
            $view->display();
        }

        // set up user_id for cart items for guest account
        if( $order->user_id < Tienda::getGuestIdStart() )
        {
            Tienda::load( 'TiendaHelperCarts', 'helpers.cart' );
            $session = JFactory::getSession();
            $helper = new TiendaHelperCarts();
            $helper->mergeSessionCartWithUserCart( $session->getId() , $order->user_id );
        }
        return;
    }

    function saveOrderOnePage()
    {
        $response = array();
        $response['msg'] = '';
        $response['error'] = '';
        $response['anchor'] = '';
        $config = Tienda::getInstance();

        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();

        // get elements from post
        $elements = json_decode( preg_replace('/[\n\r]+/', '\n', JRequest::getVar( 'elements', '', 'post', 'string' ) ) );

        // Test if elements are empty
        // Return proper message to user
        if (empty($elements))
        {
            // do form validation
            // if it fails check, return message
            $response['error'] = '1';
            $response['msg'] = $helper->generateMessage(JText::_('COM_TIENDA_ERROR_WHILE_VALIDATING_THE_PARAMETERS'));
            echo ( json_encode( $response ) );
            return;
        }

        // convert elements to array that can be binded
        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();
        $submitted_values = $helper->elementsToArray( $elements );

        $guest = false;
        if( Tienda::getInstance()->get('guest_checkout_enabled') )
        {
            if( !$this->onepage_checkout )
            {
                $guest = JFactory::getUser()->id ? 0 : 1;
            }
            else // normal checkout
            {
                $guest = JRequest::getVar( 'guest', '0');
            }
             
            $guest = $guest ? true : false;
        }
        
        $this->populateOrder($guest);
        $this->addCouponCodes( $submitted_values );

        // bind what you can from the post
        $this->_order->bind( $submitted_values );
        
        // set the shipping method
        $this->_order->shipping = new JObject();
        $this->_order->shipping->shipping_price      = @$submitted_values['shipping_price'];
        $this->_order->shipping->shipping_extra      = @$submitted_values['shipping_extra'];
        $this->_order->shipping->shipping_code      	= @$submitted_values['shipping_code'];
        $this->_order->shipping->shipping_name       = @$submitted_values['shipping_name'];
        $this->_order->shipping->shipping_tax        = @$submitted_values['shipping_tax'];
        $this->_order->shipping->shipping_type				= @$submitted_values['shipping_plugin'];
        
        $this->_order->calculateTotals();
        
        // fail if no payment method selected
        if (empty($submitted_values['_checked']['payment_plugin']) && (float)$this->_order->order_total != (float)'0.00')
        {
            $response['msg'] = $helper->generateMessage(JText::_('Please select payment method'));
            $response['error'] = '1';
            echo ( json_encode( $response ) );
            return;
        }
        
        // fail if not checked terms & condition
        if( $config->get('require_terms') && empty($submitted_values['_checked']['shipping_terms']) )
        {
            $response['msg'] = $helper->generateMessage(JText::_('COM_TIENDA_PLEASE_CHECK_THE_TERMS_CONDITIONS'));
            $response['error'] = '1';
            echo ( json_encode( $response ) );
            return;
        }

        // check if "Same as billing address" was checked
        if( !empty( $submitted_values['_checked']['sameasbilling'] ) )
        {
            foreach( $submitted_values as $key => $value )
            {
                if( substr( $key, 0, 8) == 'billing_' )
                    $submitted_values[ str_replace( 'billing_', 'shipping_', $key )] = $value;
            }
        }

        //override the payment plugin with the check value
        if (!empty($submitted_values['_checked']['payment_plugin'])) {
            $submitted_values['payment_plugin'] = $submitted_values['_checked']['payment_plugin'];
        }

        if(!$this->validateSelectShipping($submitted_values))
        {
            return;
        }

        // check shipping hash
        if( @$submitted_values['shippingrequired'] && !$this->checkShippingHash( $submitted_values ) )
        {
            $response['msg'] = $helper->generateMessage(JText::_('COM_TIENDA_INVALID_SHIPPING_VALUES'));
            $response['error'] = '1';
            echo ( json_encode( $response ) );
            return;
        }

        if(!$this->validateSelectPayment($submitted_values))
        {
            return;
        }
        
        //check email if in correct format
        jimport('joomla.mail.helper');
        if(!JMailHelper::isEmailAddress($submitted_values['email_address']))
        {
            $response['msg'] = $helper->generateMessage(JText::_('COM_TIENDA_PLEASE_ENTER_CORRECT_EMAIL'));
            $response['error'] = '1';
            echo json_encode($response);
            return;
        }

        $user_id = -1;
        $userHelper = TiendaHelperUser::getInstance('User', 'TiendaHelper');
        $create_account = !empty($submitted_values['_checked']['create_account']);
        $guest_checkout = $config->get('guest_checkout_enabled', '1');
        if ( !$create_account && $guest_checkout && !JFactory::getUser()->id ) // guest checkout
        {
            Tienda::load( 'TiendaHelperUser', 'helpers.user' );

            if ($userHelper->emailExists($submitted_values['email_address']))
            {
                $response['msg'] = $helper->generateMessage(JText::_('COM_TIENDA_EMAIL_ALREADY_EXIST'));
                $response['error'] = '1';
                echo ( json_encode($response) );
                return false;
            }
            $user_id = $userHelper->getNextGuestUserId();
            $email_user = $submitted_values['email_address'];
            // save the real user's info in the userinfo table
            JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
            $userinfo = JTable::getInstance('UserInfo', 'TiendaTable');
            $userinfo->user_id = $user_id;
            $userinfo->email = $submitted_values['email_address'];
            $userinfo->save();
            $this->setAddresses($submitted_values, true, true);
        }
        else // register or the user is already logged in
        {
            if( JFactory::getUser()->id ) // user is logged in
            {
                $user = JFactory::getUser();
                $user_id = $user->id;
                if( $user->email != $submitted_values['email_address'] ) // user wants to change his email
                {
                    if ($userHelper->emailExists($submitted_values['email_address']))
                    {
                        $response['msg'] = $helper->generateMessage(JText::_('COM_TIENDA_EMAIL_ALREADY_EXIST'));
                        $response['error'] = '1';
                        echo ( json_encode($response) );
                        return false;
                    }

                    JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
                    $userinfo = JTable::getInstance('UserInfo', 'TiendaTable');
                    $userinfo->load( array('user_id' => $user_id ) );
                    $userinfo->email = $submitted_values['email_address'];
                    $userinfo->save();

                    if( $user->username == $user->email ) // user is using email as his login
                        $user->username = $submitted_values['email_address'];
                    $user->email = $submitted_values['email_address'];

                    if ( !$user->save() )
                    {
                        $response['msg'] = $helper->generateMessage( $user->getError() );
                        $response['error'] = '1';
                        echo ( json_encode($response) );
                        return false;
                    }
                }
            }
            else
                if( $create_account )// user wants to register
                {
                    // create a new user from billing info
                    $details = array(
                            'email' => $submitted_values['email_address'],
                            'name' => @$submitted_values['billing_input_first_name'].' '.@$submitted_values['billing_input_middle_name'].' '.@$submitted_values['billing_input_last_name'],
                            'username' => $submitted_values['email_address']
                    );
                    if( $details['name'] == '  ' ) // both first and last name are empty -> use a generic name
                        $details['name'] = JText::_('COM_TIENDA_USER');

                    $details['password']    = $submitted_values['password'];
                    $details['password2']   = $submitted_values['password2'];

                    $validate_pass = $userHelper->validateUserPassword( $details['password'] );
                    if( !$validate_pass[0] )
                    {
                        $response['msg'] = $helper->generateMessage( JText::_('COM_TIENDA_PASSWORD_INVALID') );
                        $response['error'] = '1';
                        echo ( json_encode($response) );
                        return false;
                    }

                    $user = $userHelper->createNewUser( $details, false );
                    if ( !$user )
                    {
                        $response['msg'] = $helper->generateMessage( $user->getError() );
                        $response['error'] = '1';
                        echo ( json_encode($response) );
                        return false;
                    }
                    $userHelper->login(
                            array('username' => $user->username, 'password' => $details['password'])
                    );
                    $user_id = $user->id;
                    // save userinfo
                    JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
                    $userinfo = JTable::getInstance('UserInfo', 'TiendaTable');
                    $userinfo->load( array('user_id' => $user_id ) );
                    $userinfo->user_id = $user_id;
                    $userinfo->first_name = @$submitted_values['billing_input_first_name'];
                    $userinfo->last_name = @$submitted_values['billing_input_last_name'];
                    $userinfo->company = @$submitted_values['billing_input_company'];
                    $userinfo->middle_name = @$submitted_values['billing_input_middle_name'];
                    $userinfo->phone_1 = @$submitted_values['billing_input_phone_1'];
                    $userinfo->email = $submitted_values['email_address'];
                    $userinfo->save();
                }
                else
                {
                    $response['msg'] = $helper->generateMessage( 'COM_TIENDA_CHECKOUT_USER_ACCOUNT_REQUIRED' );
                    $response['error'] = '1';
                    echo ( json_encode($response) );
                    return false;
                }
                $this->setAddresses($submitted_values, true, true);
        }

        //save order
        if(!$this->saveOrder($submitted_values, $user_id, true ))
        {
            // Output error message and halt
            $response['msg'] = $helper->generateMessage($this->getError());
            $response['error'] = '1';
            // encode and echo (need to echo to send back to browser)
            echo ( json_encode($response) );
            return false;
        }

        $data = $this->preparePaymentOnepage($submitted_values, $user_id);
        if(!empty($data->_errors))
        {
            $response['msg'] = $helper->generateMessage($data->_errors);
            $response['error'] = '1';
        }
        else
        {
            $response['msg'] = $data->html;
            $response['summary'] = $data->summary;
            $response['error'] = '';
            if (!empty($data->redirect)) {
                $response['redirect'] = $data->redirect;
            }
        }
        // encode and echo (need to echo to send back to browser)
        echo ( json_encode($response) );

        return;
    }

    /**
     * Saves the order to the database
     *
     * @param $values
     * @return unknown_type
     */
    function saveOrder($values, $user_id, $ajax = false )
    {
        $error = false;
        $guest = $user_id < Tienda::getGuestIdStart();
        $order = $this->_order; // a TableOrders object (see constructor)
        $order->_adjustCredits = true; // this is not a POS order, so adjust the user's credits (if any used)
        $order->bind( $values );
        $order->user_id = $user_id;
        $order->ip_address = $_SERVER['REMOTE_ADDR'];
        $this->setAddresses( $values, false, $ajax );

        // set the shipping method
        if(@$values['shippingrequired'] || !empty($values['shipping_plugin']))
        {
            $order->shipping = new JObject();
            $order->shipping->shipping_price      = $values['shipping_price'];
            $order->shipping->shipping_extra   = $values['shipping_extra'];
            $order->shipping->shipping_name        = $values['shipping_name'];
            $order->shipping->shipping_tax      = $values['shipping_tax'];
        }

        // Store the text verion of the currency for order integrity
        Tienda::load( 'TiendaHelperOrder', 'helpers.order' );
        $order->order_currency = TiendaHelperOrder::currencyToParameters($order->currency_id);

        //get the items and add them to the order
        Tienda::load( 'TiendaHelperCarts', 'helpers.carts' );

        //we dont need to add items in the order if onepage checkout since its already added in the shipping validation
        if(!$this->onepage_checkout)
        {
            $reviewitems = TiendaHelperCarts::getProductsInfo();
            foreach ($reviewitems as $reviewitem)
            {
                $order->addItem( $reviewitem );
            }
        }

        $this->addCoupons($values);

        $order->order_state_id = $this->initial_order_state;
        $order->calculateTotals();
        $order->getShippingTotal();
        $order->getInvoiceNumber();

        $model  = JModel::getInstance('Orders', 'TiendaModel');
        //TODO: Do Something with Payment Infomation
        if ( $order->save() )
        {
            $model->setId( $order->order_id );

            // save the order items
            if (!$this->saveOrderItems())
            {
                // TODO What to do if saving order items fails?
                $error = true;
            }

            // save the order vendors
            if (!$this->saveOrderVendors())
            {
                // TODO What to do if saving order vendors fails?
                $error = true;
            }

            // save the order info
            if (!$this->saveOrderInfo())
            {
                // TODO What to do if saving order info fails?
                $error = true;
            }

            // save the order history
            if (!$this->saveOrderHistory())
            {
                // TODO What to do if saving order history fails?
                $error = true;
            }

            // save the order taxes
            if (!$this->saveOrderTaxes())
            {
                // TODO What to do if saving order taxes fails?
                $error = true;
            }

            // save the order shipping info
            if ( isset( $order->shipping ) && !$this->saveOrderShippings( $values ))
            {
                // TODO What to do if saving order shippings fails?
                $error = true;
            }

            // save the order coupons
            if (!$this->saveOrderCoupons())
            {
                // TODO What to do if saving order coupons fails?
                $error = true;
            }
            
            $model->clearCache();
        }

        if ($error)
        {
            return false;
        }

        return true;
    }

    /**
     * Saves each individual item in the order to the DB
     *
     * @return unknown_type
     */
    function saveOrderItems()
    {
        JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
        $order = $this->_order;
        $items = $order->getItems();


        if (empty($items) || !is_array($items))
        {
            $this->setError( "saveOrderItems:: ".JText::_('COM_TIENDA_ITEMS_ARRAY_INVALID') );
            return false;
        }

        $error = false;
        $errorMsg = "";
        Tienda::load( 'TiendaHelperUser', 'helpers.user' );
        foreach ($items as $item)
        {
            $item->order_id = $order->order_id;

            if (!$item->save())
            {
                // track error
                $error = true;
                $errorMsg .= $item->getError();
            }
            else
            {
                //fire onAfterSaveOrderItem
                $dispatcher = JDispatcher::getInstance();
                $dispatcher->trigger( 'onAfterSaveOrderItem', array( $item ) );

                // does the orderitem create a subscription?
                if (!empty($item->orderitem_subscription))
                {
                    $date = JFactory::getDate();
                    // these are only for one-time payments that create subscriptions
                    // recurring payment subscriptions are handled differently - by the payment plugins
                    $subscription = JTable::getInstance('Subscriptions', 'TiendaTable');
                    $subscription->user_id = $order->user_id;
                    $subscription->order_id = $order->order_id;
                    $subscription->product_id = $item->product_id;
                    $subscription->orderitem_id = $item->orderitem_id;
                    $subscription->transaction_id = ''; // in recurring payments, this is the subscr_id
                    $subscription->created_datetime = $date->toMySQL();
                    $subscription->subscription_enabled = '0'; // disabled at first, enabled after payment clears

                    switch($item->subscription_period_unit)
                    {
                        case "Y":
                            $period_unit = "YEAR";
                            break;
                        case "M":
                            $period_unit = "MONTH";
                            break;
                        case "W":
                            $period_unit = "WEEK";
                            break;
                        case "I":
                            // expiration date is not important (it's calculated on-the-fly) => create a seemingly lifetime subscription
                            $period_unit = 'YEAR';
                            $item->subscription_period_interval = '100'; // we dont need to know the interval (we will know the last ID)
                            break;
                        case "D":
                        default:
                            $period_unit = "DAY";
                            break;
                    }

                    if (!empty($item->subscription_lifetime))
                    {
                        // set expiration 100 years in future
                        $period_unit = "YEAR";
                        $item->subscription_period_interval = '100';
                        $subscription->lifetime_enabled = '1';
                    }
                    $database = JFactory::getDBO();
                    $query = " SELECT DATE_ADD('{$subscription->created_datetime}', INTERVAL {$item->subscription_period_interval} $period_unit ) ";
                    $database->setQuery( $query );
                    $subscription->expires_datetime = $database->loadResult();

                    if( Tienda::getInstance()->get( 'display_subnum', 0 ) )
                    {
                        $subscription->sub_number = TiendaHelperUser::getSubNumber( $order->user_id );
                    }

                    if (!$subscription->save())
                    {
                        $error = true;
                        $errorMsg .= $subscription->getError();
                    }

                    // add a sub history entry, email the user?
                    $subscriptionhistory = JTable::getInstance('SubscriptionHistory', 'TiendaTable');
                    $subscriptionhistory->subscription_id = $subscription->subscription_id;
                    $subscriptionhistory->subscriptionhistory_type = 'creation';
                    $subscriptionhistory->created_datetime = $date->toMySQL();
                    $subscriptionhistory->notify_customer = '0'; // notify customer of new trial subscription?
                    $subscriptionhistory->comments = JText::_('COM_TIENDA_NEW_SUBSCRIPTION_CREATED');
                    $subscriptionhistory->save();
                }

                // Save the attributes also
                if (!empty($item->orderitem_attributes))
                {
                    $attributes = explode(',', $item->orderitem_attributes);
                    foreach (@$attributes as $attribute)
                    {
                        unset($productattribute);
                        unset($orderitemattribute);
                        $productattribute = JTable::getInstance('ProductAttributeOptions', 'TiendaTable');
                        $productattribute->load( $attribute );
                        $orderitemattribute = JTable::getInstance('OrderItemAttributes', 'TiendaTable');
                        $orderitemattribute->orderitem_id = $item->orderitem_id;
                        $orderitemattribute->productattributeoption_id = $productattribute->productattributeoption_id;
                        $orderitemattribute->orderitemattribute_name = $productattribute->productattributeoption_name;
                        $orderitemattribute->orderitemattribute_price = $productattribute->productattributeoption_price;
                        $orderitemattribute->orderitemattribute_code = $productattribute->productattributeoption_code;
                        $orderitemattribute->orderitemattribute_prefix = $productattribute->productattributeoption_prefix;
                        $orderitemattribute->orderitemattribute_weight = $productattribute->productattributeoption_weight;
                        $orderitemattribute->orderitemattribute_prefix_weight = $productattribute->productattributeoption_prefix_weight;
                        if (!$orderitemattribute->save())
                        {
                            // track error
                            $error = true;
                            $errorMsg .= $orderitemattribute->getError();
                        }
                    }
                }
            }
        }

        if ($error)
        {
            $this->setError( $errorMsg );
            return false;
        }
        return true;
    }

    /**
     * Saves the order info to the DB
     * @return unknown_type
     */
    function saveOrderInfo()
    {
        $order = $this->_order;

        JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
        $row = JTable::getInstance('OrderInfo', 'TiendaTable');
        $row->order_id = $order->order_id;
        $row->user_email = JFactory::getUser()->get('email');
        $row->bind( $this->_orderinfoBillingAddressArray );
        $row->bind( $this->_orderinfoShippingAddressArray );
        $row->user_id = $order->user_id;

        // Get Addresses
        $shipping_address = $order->getShippingAddress();
        $billing_address = $order->getBillingAddress();

        // set zones and countries
        $row->billing_zone_id       = $billing_address->zone_id;
        $row->billing_country_id    = $billing_address->country_id;
        $row->shipping_zone_id      = $shipping_address->zone_id;
        $row->shipping_country_id   = $shipping_address->country_id;

        if (!$row->save())
        {
            $this->setError( $row->getError() );
            return false;
        }

        $order->orderinfo = $row;
        return true;
    }

    /**
     * Adds an order history record to the DB for this order
     * @return unknown_type
     */
    function saveOrderHistory( )
    {
        $order = $this->_order;

        JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
        $row = JTable::getInstance('OrderHistory', 'TiendaTable');
        $row->order_id = $order->order_id;
        $row->order_state_id = $order->order_state_id;

        $row->notify_customer = '0'; // don't notify the customer on prepayment
        $row->comments = JRequest::getVar('order_history_comments', '', 'post');

        if (!$row->save())
        {
            $this->setError( $row->getError() );
            return false;
        }
        return true;
    }

    /**
     * Saves each vendor related to this order to the DB
     * @return unknown_type
     */
    function saveOrderVendors()
    {
        $order = $this->_order;
        $items = $order->getVendors();

        if (empty($items) || !is_array($items))
        {
            // No vendors other than store owner, so just skip this
            //$this->setError( "saveOrderVendors:: ".JText::_('COM_TIENDA_VENDORS_ARRAY_INVALID') );
            //return false;
            return true;
        }

        $error = false;
        $errorMsg = "";
        foreach ($items as $item)
        {
            if (empty($item->vendor_id))
            {
                continue;
            }
            $item->order_id = $order->order_id;
            if (!$item->save())
            {
                // track error
                $error = true;
                $errorMsg .= $item->getError();
            }
        }

        if ($error)
        {
            $this->setError( $errorMsg );
            return false;
        }
        return true;
    }

    /**
     * Adds an order tax class/rate record to the DB for this order
     * for each relevant tax class & rate
     *
     * @return unknown_type
     */
    function saveOrderTaxes()
    {
        $order = $this->_order;
        JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );

        $taxclasses = $order->getTaxClasses();
        foreach ($taxclasses as $taxclass)
        {
            unset($row);
            $row = JTable::getInstance('OrderTaxClasses', 'TiendaTable');
            $row->order_id = $order->order_id;
            $row->tax_class_id = $taxclass->tax_class_id;
            $row->ordertaxclass_amount = $order->getTaxClassAmount( $taxclass->tax_class_id );
            $row->ordertaxclass_description = $taxclass->tax_class_description;
            $row->save();
        }

        $taxrates = $order->getTaxRates();
        foreach ($taxrates as $taxrate)
        {
            unset($row);
            $row = JTable::getInstance('OrderTaxRates', 'TiendaTable');
            $row->order_id = $order->order_id;
            $row->tax_rate_id = $taxrate->tax_rate_id;
            $row->ordertaxrate_rate = $taxrate->tax_rate;
            $row->ordertaxrate_amount = $order->getTaxRateAmount( $taxrate->tax_rate_id );
            $row->ordertaxrate_description = $taxrate->tax_rate_description;
            $row->ordertaxrate_level = $taxrate->level;
            $row->ordertaxclass_id = $taxrate->tax_class_id;
            $row->save();
        }

        // TODO Better error tracking necessary here
        return true;
    }

    /**
     * Saves the order shipping info to the DB
     * @return unknown_type
     */
    function saveOrderShippings( $values )
    {
        $order = $this->_order;

        JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
        $row = JTable::getInstance('OrderShippings', 'TiendaTable');
        $row->order_id = $order->order_id;
        $row->ordershipping_type = $values['shipping_plugin'];
        $row->ordershipping_price = $values['shipping_price'];
        $row->ordershipping_name = $values['shipping_name'];
        $row->ordershipping_code = $values['shipping_code'];
        $row->ordershipping_tax = $values['shipping_tax'];
        $row->ordershipping_extra = $values['shipping_extra'];

        if (!$row->save())
        {
            $this->setError( $row->getError() );
            return false;
        }

        // Let the plugin store the information about the shipping
        $dispatcher = JDispatcher::getInstance();
        $dispatcher->trigger( "onPostSaveShipping", array( $values['shipping_plugin'], $row ) );

        return true;
    }

    /**
     * Saves the order coupons to the DB
     * @return unknown_type
     */
    function saveOrderCoupons()
    {
        $order = $this->_order;
        JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );

        $error = false;
        $errorMsg = "";
        $ordercoupons = $order->getOrderCoupons();
        foreach ($ordercoupons as $ordercoupon)
        {
            $ordercoupon->_increase_coupon_uses = false;
            $ordercoupon->order_id = $order->order_id;
            if (!$ordercoupon->save())
            {
                // track error
                $error = true;
                $errorMsg .= $ordercoupon->getError();
            }
        }

        if ($error)
        {
            $this->setError( $errorMsg );
            return false;
        }

        return true;
    }

    /**
     *
     * @param unknown_type $oldArray
     * @param unknown_type $old_prefix
     * @param unknown_type $new_prefix
     * @param unknown_type $append
     * @return unknown_type
     */
    function filterArrayUsingPrefix( $oldArray, $old_prefix, $new_prefix, $append )
    {
        // create array with input form keys and values
        $address_input = array();

        foreach ($oldArray as $key => $value)
        {
            if (($append) || (strpos($key, $old_prefix) !== false))
            {
                $new_key = '';
                if ($append){
                    $new_key = $new_prefix.$key;
                }
                else{
                    $new_key = str_replace($old_prefix, $new_prefix, $key);
                }
                if (strlen($new_key)>0){
                    $address_input[$new_key] = $value;
                }
            }
        }
        return $address_input;
    }

    /**
     * Validate Coupon Code
     *
     * @return unknown_type
     */
    function validateCouponCode()
    {
        JLoader::import( 'com_tienda.library.json', JPATH_ADMINISTRATOR.'/components' );
        $elements = json_decode( preg_replace('/[\n\r]+/', '\n', JRequest::getVar( 'elements', '', 'post', 'string' ) ) );

        // convert elements to array that can be binded
        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();
        $values = $helper->elementsToArray( $elements );

        $coupon_code = JRequest::getVar( 'coupon_code', '');

        $response = array();
        $response['msg'] = '';
        $response['error'] = '';

        // check if coupon code is valid
        $user_id = JFactory::getUser()->id;
        Tienda::load( 'TiendaHelperCoupon', 'helpers.coupon' );
        $helper_coupon = new TiendaHelperCoupon();
        $coupon = $helper_coupon->isValid( $coupon_code, 'code', $user_id );
        if (!$coupon)
        {
            $response['error'] = '1';
            $response['msg'] = $helper->generateMessage( $helper_coupon->getError() );
            echo json_encode($response);
            return;
        }

        if (!empty($values['coupons']) && in_array($coupon->coupon_id, $values['coupons']))
        {
            $response['error'] = '1';
            $response['msg'] = $helper->generateMessage( JText::_('COM_TIENDA_THIS_COUPON_ALREADY_ADDED_TO_THE_ORDER') );
            echo json_encode($response);
            return;
        }

        // TODO Check that the user can add this coupon to the order
        $can_add = true;
        if (!$can_add)
        {
            $response['error'] = '1';
            $response['msg'] = $helper->generateMessage( JText::_('COM_TIENDA_CANNOT_ADD_THIS_COUPON_TO_ORDER') );
            echo json_encode($response);
            return;
        }

        // Check per product coupon code
        $ids = array();
        $items = TiendaHelperCarts::getProductsInfo();
        foreach($items as $item)
        {
            $ids[] = $item->product_id;
        }
        if($coupon->coupon_type == '1')
        {
            $check = $helper_coupon->checkByProductIds($coupon->coupon_id, $ids);
            if(!$check)
            {
                $response['error'] = '1';
                $response['msg'] = $helper->generateMessage( JText::_('COM_TIENDA_THIS_COUPON_NOT_RELATED_TO_PRODUCT_IN_YOUR_CART') );
                echo json_encode($response);
                return;
            }
        }

        // if valid, return the html for the coupon
        $response['msg'] = " <input type='hidden' name='coupons[]' value='$coupon->coupon_id'>";

        echo json_encode($response);
        return;
    }

    /**
     * Validates the credit amount and applies it to the order
     * @return unknown_type
     */
    function validateApplyCredit()
    {
        JLoader::import( 'com_tienda.library.json', JPATH_ADMINISTRATOR.'/components' );
        $elements = json_decode( preg_replace('/[\n\r]+/', '\n', JRequest::getVar( 'elements', '', 'post', 'string' ) ) );

        // convert elements to array that can be binded
        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();
        $values = $helper->elementsToArray( $elements );

        $user_id = JFactory::getUser()->id;
        $apply_credit_amount = (float) JRequest::getVar( 'apply_credit_amount', '');

        $response = array();
        $response['msg'] = '';
        $response['error'] = '';

        // is the credit amount valid (i.e. greater than 0,
        if ($apply_credit_amount < (float) '0.00')
        {
            $response['error'] = '1';
            $response['msg'] = $helper->generateMessage( JText::_('COM_TIENDA_PLEASE_SPECIFY_VALID_CREDIT_AMOUNT') );
            echo json_encode($response);
            return;
        }

        // less than/== their available amount & order amount?
        $userinfo = JTable::getInstance( 'UserInfo', 'TiendaTable' );
        $userinfo->load( array( 'user_id'=>$user_id ) );
        $userinfo->credits_total = (float) $userinfo->credits_total;
        if ($apply_credit_amount > $userinfo->credits_total)
        {
            $apply_credit_amount = $userinfo->credits_total;
        }

        // get the order object so we can populate it
        $order = $this->_order; // a TableOrders object (see constructor)

        // bind what you can from the post
        $order->bind( $values );

        // unset the order credit because it may have been set by the bind
        $order->order_credit = '0';

        // set the currency
        Tienda::load( 'TiendaHelperCurrency', 'helpers.currency' );
        $order->currency_id = TiendaHelperCurrency::getCurrentCurrency(); // USD is default if no currency selected

        // set the shipping method
        $order->shipping = new JObject();
        $order->shipping->shipping_price      = @$values['shipping_price'];
        $order->shipping->shipping_extra      = @$values['shipping_extra'];
        $order->shipping->shipping_name       = @$values['shipping_name'];
        $order->shipping->shipping_tax        = @$values['shipping_tax'];

        // set the addresses
        $this->setAddresses( $values, false, true );

        // get the items and add them to the order
        Tienda::load( 'TiendaHelperCarts', 'helpers.carts' );
        $items = TiendaHelperCarts::getProductsInfo();
        foreach ($items as $item)
        {
            $order->addItem( $item );
        }

        // get all coupons and add them to the order
        if (!empty($values['coupons']))
        {
            foreach ($values['coupons'] as $coupon_id)
            {
                $coupon = JTable::getInstance('Coupons', 'TiendaTable');
                $coupon->load(array('coupon_id'=>$coupon_id));
                $order->addCoupon( $coupon );
            }
        }

        $this->addAutomaticCoupons();

        // get the order totals
        $order->calculateTotals();

        if ($apply_credit_amount > $order->order_total)
        {
            $apply_credit_amount = $order->order_total;
        }

        // if valid, return the html for the credit
        $response['msg'] = "<input type='hidden' name='order_credit' value='$apply_credit_amount'>";
        echo json_encode($response);
        return;
    }

    /**
     *
     * @param $address_id
     * @return unknown_type
     */
    function retrieveAddressIntoArray( $address_id )
    {
        $model = JModel::getInstance( 'Addresses', 'TiendaModel' );
        $model->setId($address_id);
        $item = $model->getItem();
        if (is_object($item))
        {
            return get_object_vars( $item );
        }
        return array();
    }

    /**
     * Checks that an email is valid
     * @return unknown_type
     */
    function checkEmail()
    {
        Tienda::load('TiendaHelperUser', 'helpers.user');
        $checker = TiendaHelperUser::getInstance('User', 'TiendaHelper');
        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();
        $response = array();
        $response['msg'] = '';
        $response['error'] = '0';

        // get elements from post
        $elements = json_decode( preg_replace('/[\n\r]+/', '\n', JRequest::getVar( 'elements', '', 'post', 'string','string' ) ) );

        // convert elements to array that can be binded
        $values = $helper->elementsToArray( $elements );

        $email = $values['email_address'];
        if (empty($email))
        {
            $response['msg'] = $helper->validationMessage( "COM_TIENDA_EMAIL_CANNOT_BE_EMPTY", 'fail' );
            $response['error'] = '1';
            echo ( json_encode( $response ) );
            return;

        }

        $message = "";
        if (!$checker->isEmailAddress($email))
        {
            $message .= $helper->validationMessage( "COM_TIENDA_EMAIL_INVALID", 'fail' );
            $response['error'] = '1';
        }
        if ( $checker->emailExists( $email ) )
        {
            $user_id = JFactory::getUser()->id;
            $user_email = $checker->getBasicInfo( $user_id )->email;

            if( $user_id && $user_id > Tienda::getGuestIdStart() )
            {
                if( $user_email != $email )
                {
                    $message .= $helper->validationMessage( "COM_TIENDA_EMAIL_ALREADY_REGISTERED", 'fail' );
                    $response['error'] = '1';
                }
            }
            else
            {
                $message .= $helper->validationMessage( "COM_TIENDA_EMAIL_ALREADY_REGISTERED", 'fail' );
                $response['error'] = '1';
            }
        }

        if ($response['error'] == '0')
        {
            // no error
            $message .= $helper->validationMessage( 'COM_TIENDA_VALID_EMAIL', 'success' );
        }

        $response['msg'] = $message;

        echo ( json_encode( $response ) );
        return;
    }

    /**
     * Checks that a username is available
     * @return unknown_type
     */
    function checkUsername()
    {
        Tienda::load('TiendaHelperUser', 'helpers.user');
        $checker = TiendaHelperUser::getInstance('User', 'TiendaHelper');
        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();
        $response = array();
        $response['msg'] = '';
        $response['error'] = '';

        // get elements from post
        $elements = json_decode( preg_replace('/[\n\r]+/', '\n', JRequest::getVar( 'elements', '', 'post', 'string','string' ) ) );

        // convert elements to array that can be binded
        $values = TiendaHelperBase::elementsToArray( $elements );

        $username = $values['username'];

        if (empty($username))
        {
            $response['msg'] = $helper->validationMessage( "COM_TIENDA_USERNAME_CANNOT_BE_EMPTY", 'fail' );
            $response['error'] = '1';
            echo ( json_encode( $response ) );
            return;
        }

        $message = "";
        if ($checker->usernameExists($username))
        {
            $message .= $helper->validationMessage( "COM_TIENDA_USERNAME_UNAVAILABLE", 'fail' );
        }
        else
        {
            // no error
            $message .= $helper->validationMessage( 'COM_TIENDA_VALID_USERNAME', 'success' );
        }

        $response['msg'] = $message;
        $response['error'] = '1';

        echo ( json_encode( $response ) );
        return;
    }

    /**
     * Checks that a password is strong enough
     * @return unknown_type
     */
    function checkPassword()
    {
        Tienda::load('TiendaHelperPassword', 'helpers.password');
        $checker = TiendaHelperUser::getInstance('Password', 'TiendaHelper');
        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();
        $response = array();
        $response['msg'] = '';
        $response['error'] = '';

        // get elements from post
        $elements = json_decode( preg_replace('/[\n\r]+/', '\n', JRequest::getVar( 'elements', '', 'post', 'string','string' ) ) );

        // convert elements to array that can be binded
        $values = TiendaHelperBase::elementsToArray( $elements );

        $password = $values['password'];
        $username = empty( $values['username'] ) ? '' : $values['username'];

        if (empty($password))
        {
            $response['msg'] = $helper->validationMessage( "COM_TIENDA_PASSWORD_CANNOT_BE_EMPTY", 'fail' );
            $response['error'] = '1';
            echo ( json_encode( $response ) );
            return;
        }

        // get the password checker & check it
        $checker->setConfig();

        $message = "";
        if (!$checker->checkPassword($password, $username))
        {
            // error encountered
            foreach ($checker->errorMsgArray as $error)
            {
                $message .= $helper->validationMessage( $error, 'fail' );
            }
        }
        else
        {
            // no error
            $message .= $helper->validationMessage( 'COM_TIENDA_STRONG_PASSWORD', 'success' );
        }

        $response['msg'] = $message;
        $response['error'] = '1';

        echo ( json_encode( $response ) );
        return;
    }

    /**
     * Checks that a password and password2 match
     * @return unknown_type
     */
    function checkPassword2()
    {
        Tienda::load( 'TiendaHelperBase', 'helpers._base' );
        $helper = TiendaHelperBase::getInstance();
        $response = array();
        $response['msg'] = '';
        $response['error'] = '';

        // get elements from post
        $elements = json_decode( preg_replace('/[\n\r]+/', '\n', JRequest::getVar( 'elements', '', 'post', 'string','string' ) ) );

        // convert elements to array that can be binded
        $values = TiendaHelperBase::elementsToArray( $elements );

        $password = $values['password'];
        $password2 = $values['password2'];

        if (empty($password))
        {
            $response['msg'] = $helper->validationMessage( "COM_TIENDA_PASSWORD_CANNOT_BE_EMPTY", 'fail' );
            $response['error'] = '1';
            echo ( json_encode( $response ) );
            return;
        }

        if (empty($password2))
        {
            $response['msg'] = $helper->validationMessage( "COM_TIENDA_PASSWORD_VERIFY_CANNOT_BE_EMPTY", 'fail' );
            $response['error'] = '1';
            echo ( json_encode( $response ) );
            return;
        }

        $message = "";
        if ($password != $password2)
        {
            $message .= $helper->validationMessage( 'COM_TIENDA_PASSWORD_DO_NOT_MATCH', 'fail' );
        }
        else
        {
            // no error
            $message .= $helper->validationMessage( 'COM_TIENDA_PASSWORD_VALID', 'success' );
        }

        $response['msg'] = $message;
        $response['error'] = '1';

        echo ( json_encode( $response ) );
        return;
    }

    /*
     * Regiter the new user with the Form
    */
    function registerNewUser ($values){

        JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );

        //  Register an User
        Tienda::load( 'TiendaHelperUser', 'helpers.user' );
        $userHelper = TiendaHelperUser::getInstance('User', 'TiendaHelper');

        $response = array();
        $response['msg'] = '';
        $response['error'] = '';

        if ($userHelper->emailExists($values['email_address']))
        {
            // TODO user already exists
            $response['error'] = '1';
            $response['msg'] = JText::_('COM_TIENDA_EMAIL_ALREADY_EXIST');
            $response['key'] = 'email_address';
            return $response;
        }
        else
        {
            Tienda::load( 'TiendaHelperUser', 'helpers.user' );
            $userHelper = TiendaHelperUser::getInstance('User', 'TiendaHelper');

            $details = array(
                    'email' => $values['email_address'],
                    'name' => $values['name'],
                    'username' => $values['username'],
                    'password'=> $values['password'],
                    'password2'=> $values['password2']
            );
            // create the new user
            $msg = $this->getError();
            $user = $userHelper->createNewUser($details, isset($values['guest']));

            if (empty($user->id))
            {
                // TODO what to do if creating new user failed?
            }

            // save the real user's info in the userinfo table also
            JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
            $userinfo = JTable::getInstance('UserInfo', 'TiendaTable');
            $userinfo->load( array('user_id'=>$user->id) );
            $userinfo->user_id = $user->id;
            if( isset( $values['billing_input_first_name'] ) )
                $userinfo->first_name = $values['billing_input_first_name'];
            if( isset( $values['billing_input_last_name'] ) )
                $userinfo->last_name = $values['billing_input_last_name'];
            if( isset( $values['billing_input_company'] ) )
                $userinfo->company = $values['billing_input_company'];
            if( isset( $values['billing_input_middle_name'] ) )
                $userinfo->middle_name = $values['billing_input_middle_name'];
            if( isset( $values['billing_input_phone_1'] ) )
                $userinfo->phone_1 = $values['billing_input_phone_1'];
            if( isset( $values['email_address'] ) )
                $userinfo->email = $values['email_address'];
            $userinfo->save();

            // login the user
            $userHelper->login(
                    array('username' => $user->username, 'password' => $details['password'])
            );

            return true;
        }
    }

    /**
     * Returns an array of objects,
     * each containing the parsed html of all articles that should be displayed
     * after an order is completed,
     * based on the defined global article and any product-, shippingmethod-, and paymentmethod-specific articles
     *
     * @param $order_id
     * @return array
     */
    function getOrderArticles( $order_id )
    {
        Tienda::load( 'TiendaArticle', 'library.article' );

        $articles = array();

        JModel::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/models' );
        $model = JModel::getInstance( 'OrderItems', 'TiendaModel' );
        $model->setState( 'filter_orderid', $order_id);
        $orderitems = $model->getList();
        foreach ($orderitems as $item)
        {
            if (!empty($item->product_article))
            {
                $articles[] = TiendaArticle::display( $item->product_article );
            }
        }

        $dispatcher = JDispatcher::getInstance();
        $dispatcher->trigger( 'onGetOrderArticles', array( $order_id, &$articles ) );

        return $articles;
    }

    function poscheckout()
    {
        $tmpl = JRequest::getVar('tmpl');
        if(empty($tmpl))
        {
            JFactory::getApplication()->redirect( JRoute::_( 'index.php?option=com_tienda&view=products' ), JText::_('COM_TIENDA_RESTRICTED_ACCESS') );
            return;
        }

        //set to session to know that we are doing POS order
        JFactory::getApplication()->setUserState( 'tienda.pos_order', true );

        $values = JRequest::getVar('data');
        $values = json_decode(base64_decode($values));
        if(is_object($values)) $values = get_object_vars($values);

        //TODO: do some security check?
        $user_id= JRequest::getInt('userid');
        $this->pos_order = new JObject();
        $this->pos_order->user = JFactory::getUser($user_id);
        $this->pos_order->order_id = $values['order_id'];

        $view = $this->getView( $this->get('suffix') , 'html' );
        $model  = $this->getModel( $this->get('suffix') );
        $view->set( '_controller', 'checkout' );
        $view->set( '_view', 'checkout' );
        $view->set( '_doTask', true);
        $view->set( 'hidemenu', true);

        JTable::addIncludePath( JPATH_ADMINISTRATOR.'/components/com_tienda/tables' );
        $order = JTable::getInstance('Orders', 'TiendaTable');
        $order->load( array('order_id' => $this->pos_order->order_id));
        $items = $order->getItems();

        $dispatcher    = JDispatcher::getInstance();
        $results = $dispatcher->trigger( "onPrePayment", array( $values['payment_plugin'], $values ) );

        // Display whatever comes back from Payment Plugin for the onPrePayment
        $html = "";
        for ($i=0; $i<count($results); $i++)
        {
            $html .= $results[$i];
        }

        $view->assign( 'plugin_html', $html );
        $view->assign( 'values', $values );
        $view->assign( 'order', $order );
        $view->setModel( $model, true );
        $view->setLayout('pospayment');
        $view->display();
        $this->footer();
    }

    private function addCoupons( $values )
    {
        $this->addCouponCodes( $values );
        $this->addAutomaticCoupons();
    }

    private function addCouponCodes($values)
    {
        $order = &$this->_order;

        // get all coupons and add them to the order
        $coupons_enabled = Tienda::getInstance()->get('coupons_enabled');
        $mult_enabled = Tienda::getInstance()->get('multiple_usercoupons_enabled');
        if (!empty($values['coupons']) && $coupons_enabled)
        {
            foreach ($values['coupons'] as $coupon_id)
            {
                $coupon = JTable::getInstance('Coupons', 'TiendaTable');
                $coupon->load(array('coupon_id'=>$coupon_id));
                $order->addCoupon( $coupon );
                if (empty($mult_enabled))
                {
                    // this prevents Firebug users from adding multiple coupons to orders
                    break;
                }
            }
        }
    }

    private function addAutomaticCoupons()
    {
        $order = &$this->_order;
        $date = JFactory::getDate();
        $date = $date->toMysql();

        // Per Order Automatic Coupons
        $model = JModel::getInstance('Coupons', 'TiendaModel');
        $model->setState('filter_automatic', '1');
        $model->setState('filter_date_from', $date);
        $model->setState('filter_date_to', $date);
        $model->setState('filter_datetype', 'validity');
        $model->setState('filter_type', '0');
        $model->setState('filter_enabled', '1');

        $coupons = $model->getList();

        // Per Product Automatic Coupons
        $model->setState('filter_type', '1');
        $coupons_2 = $model->getList(true);

        $coupons = array_merge( $coupons, $coupons_2 );

        if($coupons)
        {
            foreach($coupons as $coupon)
            {
                $order->addCoupon($coupon);
            }
        }

    }

    /**
     * Displays the form registration link
     * (non-PHPdoc)
     * @see tienda/site/TiendaController#registrationLink()
     */
    function registrationLink( )
    {
        JRequest::setVar( 'view', $this->get( 'suffix' ) );
        $model = $this->getModel( $this->get( 'suffix' ) );
        $view = $this->getView( $this->get( 'suffix' ), JFactory::getDocument( )->getType( ) );
        $view->set( '_doTask', true );

        $view->setModel( $model, true );
        $view->setLayout( 'form_registration_link' );
        $view->display( );
        $this->footer( );
        return;
    }


    function checkShippingHash( $values )
    {
        $ship_values = array();
        $ship_values['type'] = @$values['shipping_plugin'];
        $ship_values['name'] = @$values['shipping_name'];
        $ship_values['price'] = @$values['shipping_price'];
        $ship_values['tax'] = @$values['shipping_tax'];
        $ship_values['code'] = @$values['shipping_code'];
        $ship_values['extra'] = @$values['shipping_extra'];
        Tienda::load( 'TiendaHelperShipping', 'helpers.shipping' );
        $gh = TiendaHelperShipping::generateShippingHash( $ship_values );
        return $gh == @$values['shipping_hash'];
    }

}