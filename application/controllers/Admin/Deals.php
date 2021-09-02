<?php defined('BASEPATH') or exit('No direct script access allowed');
class Deals extends CI_Controller
{
    ///Load Helper
    function __construct()
    {
        parent::__construct();
        $this->load->library('ObjectIdFactory'); 
        
        ///check login
        if (!$this->session->userdata('logged_in'))
        { 
            redirect(base_url());
        }
    }
    ///dashboard
    public function LoadDeals()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);
            // echo '<pre>';
            // print_r($_POST);
            // echo '</pre>';
            // die;
            $this->form_validation->set_rules('name', 'name', 'required');
            // $this->form_validation->set_rules('address', 'address', 'required');
            // $this->form_validation->set_rules('description', 'description', 'required');
            // // $this->form_validation->set_rules('members', 'invite member', 'trim|required|valid_email');
            //run validation 
            if ($this->form_validation->run()) {
                ///check deal type
                if (isset($deal_check) && ($deal_check == 'new')) {
                    $postData['user_id'] = $_SESSION['user_id'];
                    $response = 'New deal added';
                } else {
                    ///check deal creator original or not
                    if ($user_id != $_SESSION['user_id']) {
                        ///credential not correct
                        $data = array('code' => 'warning', 'message' => 'Sorry you are not original creator of this deal');
                        echo json_encode($data);
                        die;
                    }
                    $response = 'Deal updated';
                }



                ///chat emails
                $emails = array();
                $postData['name'] = $name;
                $postData['address'] = $address;
                // $postData['description'] = TextAreaDescriptionReplace($description);
                $postData['description'] = $description;
                $postData['created_at'] =  IntegerDate();
                if (isset($deal_id) && !empty($deal_id)) {
                    ///update deal
                    $updated =  updateByWhere('deal', $postData, array('deal_id' => $deal_id));
                } else {

                    $deal_id = $this->objectidfactory->getNewId(rand());
                    $postData['deal_id'] = $deal_id;
                    ///new deal
                    $last_id = addNew('deal', $postData);
                }
                if (isset($last_id) || isset($updated)) {

                    ///deal_timeline_tasks 
                    if (isset($tasks) && !empty($tasks)) {
                        deleteRecordWhere('deal_timeline_tasks', array('deal_id' => $deal_id));
                        for ($i = 0; $i < count($tasks); $i++) {
                            $postData = array();
                            $postData['deal_id'] = $deal_id;
                            $postData['task_name'] = $tasks[$i];
                            $postData['created_at'] = IntegerDate();
                            if (!empty($tasks[$i])) {
                                addNew('deal_timeline_tasks', $postData);
                            }
                        }
                    }

                    ///deal_invite_members
                    $invited_members = array();
                    $invited_members = $_SESSION['invite_list'];



                    if (isset($invited_members) && !empty($invited_members)) {
                        deleteRecordWhere('deal_invite_members', array('deal_id' => $deal_id));
                        foreach ($invited_members as $key => $value) {
                            $value = (array) $value;
                            $postData = array();
                            $postData['deal_id'] = $deal_id;
                            $postData['invited_user_id'] = $value['user_id'];
                            $postData['created_at'] = IntegerDate();
                            addNew('deal_invite_members', $postData);
                        }
                    }




                    if ($deal_check == 'new') {
                        $deal_chat_room_id = $this->objectidfactory->getNewId(rand());
                    } else {
                        $findData = getByWhere('deal_chat_room', '*', array('deal_id' => $deal_id, 'public_room' => 1));
                        $deal_chat_room_id = $findData[0]->deal_chat_room_id;
                        deleteRecordWhere('deal_chat_participant', array('deal_chat_room_id' => $deal_chat_room_id));
                    }
                    ///create deal_chat_room
                    $postData = array();
                    $postData['deal_chat_room_id'] = $deal_chat_room_id;
                    $postData['deal_id'] = $deal_id;
                    $postData['created_by_user_id'] = $_SESSION['user_id'];
                    $postData['public_room'] = 1;
                    ///check deal new or old
                    if ($deal_check == 'new') {
                        addNew('deal_chat_room', $postData);
                    }



                    ///create deal_chat_participant 

                    foreach ($invited_members as $key => $value) {
                        $value = (array) $value;
                        $postData = array();
                        $postData['deal_chat_room_id'] = $deal_chat_room_id;
                        $postData['user_id'] = $value['user_id']; 
                        addNew('deal_chat_participant', $postData);
                    }


                    $_SESSION['invite_list'] = array();
                    ///Success
                    $data = array('code' => 'success', 'message' =>  $response);
                    echo json_encode($data);
                    die;
                }
            } else {

                ///validation errors
                $error_array = array();
                foreach ($_POST as $key => $value) {
                    if (form_error($key)) {
                        $error_array[] = array($key, form_error($key, null, null));
                    }
                }
                $data = array('code' => 'error', 'message' => $error_array,);
                echo json_encode($data);
                die;
            }
        } else {
            $title = 'Dashboard';
            $data = array();
            ///Get User Active Deals
            $user_active_deals = array();
            $user_active_deals = getByWhere('deal', '*', array('user_id' => $_SESSION['user_id'], 'status' => 'active'), array('deal_id', 'DESC'));
            ///Get invited active Deals
            $user_invited_active_deals = array();
            $user_invited_active_deals = getByWhere('deal_invite_members', '*', array('invited_user_id' => $_SESSION['user_id']));
            if (isset($user_invited_active_deals) && !empty($user_invited_active_deals)) {
                $user_invited_deal_list = array();
                for ($i = 0; $i < count($user_invited_active_deals); $i++) {
                    $deal_id = $user_invited_active_deals[$i]->deal_id;
                    $get_deal = getByWhere('deal', '*', array('deal_id' => $deal_id, 'status' => 'active'));
                    if (!empty($get_deal)) {
                        $user_invited_deal_list[] = $get_deal[0];
                        $user_active_deals[] = $get_deal[0];
                    }
                }
            }
            ///set uniqe active deals array
            if (isset($user_active_deals) && !empty($user_active_deals)) {
                $data['active_deals'] = array();
                $deal_ids = array();
                for ($i = 0; $i < count($user_active_deals); $i++) {
                    if (!in_array($user_active_deals[$i]->deal_id, $deal_ids)) {
                        $data['active_deals'][] = $user_active_deals[$i];
                    }
                    $deal_ids[] = $user_active_deals[$i]->deal_id;
                }
            }
            ///Get User inActive Deals
            $user_inactive_deals = array();
            $user_inactive_deals = getByWhere('deal', '*', array('user_id' => $_SESSION['user_id'], 'status' => 'inactive'), array('deal_id', 'DESC'));
            ///Get invited inactive Deals
            $user_invited_inactive_deals = array();
            $user_invited_inactive_deals = getByWhere('deal_invite_members', '*', array('invited_user_id' => $_SESSION['user_id']));
            if (isset($user_invited_inactive_deals) && !empty($user_invited_inactive_deals)) {
                $user_invited_deal_list = array();
                for ($i = 0; $i < count($user_invited_inactive_deals); $i++) {
                    $deal_id = $user_invited_inactive_deals[$i]->deal_id;
                    $get_deal = getByWhere('deal', '*', array('deal_id' => $deal_id, 'status' => 'inactive'));
                    if (!empty($get_deal)) {
                        $user_invited_deal_list[] = $get_deal[0];
                        $user_inactive_deals[] = $get_deal[0];
                    }
                }
            }
            ///set uniqe inactive deals array
            if (isset($user_inactive_deals) && !empty($user_inactive_deals)) {
                $data['inactive_deals'] = array();
                $deal_ids = array();
                for ($i = 0; $i < count($user_inactive_deals); $i++) {
                    if (!in_array($user_inactive_deals[$i]->deal_id, $deal_ids)) {
                        $data['inactive_deals'][] = $user_inactive_deals[$i];
                    }
                    $deal_ids[] = $user_inactive_deals[$i]->deal_id;
                }
            }
            ////invite list
            $_SESSION['invite_list'] = array();
            $_SESSION['new_invited_user'] = array();
            $page = 'admin/deals';
            AdminView($page, $data, $title);
        }
    }
    ///DealDetails
    public function DealDetails()
    {
        $title = 'Deal Details';
        $data = array();
        $deal_id =  urldecode(base64_decode($_GET['id']));
        $active_deal = getByWhere('deal_invite_members', '*', array('deal_id' => $deal_id, 'invited_user_id' => $_SESSION['user_id']));
        // $data['deal_members'] = getByWhere('deal_invite_members', '*', array('deal_id' => $deal_id, 'invited_user_id !=' => $_SESSION['user_id']));
        $data['deal_members'] = getByWhere('deal_invite_members', '*', array('deal_id' => $deal_id));
        $data['deal_chat'] = getByWhere('deal_chat_room', '*', array('deal_id' => $deal_id));
        $flag = false;
        if ($active_deal) {
            $flag = true;
            $data['deal'] = getByWhere('deal', '*', array('deal_id' => $deal_id));
        } else {
            $data['deal'] = getByWhere('deal', '*', array('deal_id' => $deal_id, 'user_id' => $_SESSION['user_id']));
            if ($data['deal']) {
                $flag = true;
            }
        }
        if ($flag == true) {
            $page = 'admin/deal_detail';
            ////invite list
            $_SESSION['invite_list'] = array();
            AdminView($page, $data, $title);
        } else {
            redirect(base_url('deals'));
        }
        
    }

    public function socket()
    {
        $this->load->view('socket');
    }

    ////Logout
    public function Logout()
    {
        session_destroy();
        redirect(base_url());
    }
}
