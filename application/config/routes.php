<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] = 'login'; 
$route['register'] = 'login/RegisterNewUser';
$route['reset_password'] = 'login/user_verification_get';
$route['forgot_password'] = 'login/forgot_password';

///Deals
$route['deals'] = 'Admin/deals/LoadDeals';
$route['detail'] = 'Admin/deals/DealDetails';

///Dashboard
$route['profile'] = 'Admin/dashboard/profile';
$route['change_password'] = 'Admin/dashboard/ChangePassword';
$route['logout'] = 'Admin/dashboard/Logout';



///delete
$route['delete'] = 'Admin/Partial/delete';


///smiley
$route['emoji'] = 'Smileys';
$route['socket'] = 'Admin/deals/socket';


 

$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
