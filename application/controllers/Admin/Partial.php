<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Partial extends CI_Controller
{

    ///Load Helper
    function __construct()
    {
        parent::__construct();
        $this->load->helper('security');
        $this->load->library('ObjectIdFactory');
    }

    ///invite members add process
    public function invited_member_add()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);




            ///check email formate
            if (!empty($value) && !isset($id)) {
                if (!filter_var($value, FILTER_VALIDATE_EMAIL)) {
                    $html = '';
                    if (!empty($_SESSION['invite_list'])) {
                        ///create html 
                        $html = $this->createHtml();

                        ///credential not correct  
                        $data = array('code' => 'warning', 'message' => 'Email address is invalid', 'html' => $html);
                        echo json_encode($data);
                        die;
                    }
                }
            }

            ///if value is empty
            $value1 = $value;
            if (empty($value1) && !isset($id)) {

                $html = '';
                if (!empty($_SESSION['invite_list'])) {
                    ///create html 
                    $html = $this->createHtml();
                }

                ///credential not correct  
                $data = array('code' => 'warning', 'message' => 'Please enter some missing information', 'html' => $html);
                echo json_encode($data);
                die;
            }

            ///if id is set
            if (isset($id) && !empty($id)) {
                $findData = getByWhere($table, '*', array('user_id' => $id));
                if ($findData) {
                    $_SESSION['invite_list'] = array_merge($_SESSION['invite_list'], $findData);
                    ///create html 
                    $html = $this->createHtml();
                    ///Success
                    $data = array('code' => 'success', 'html' => $html,);
                    echo json_encode($data);
                    die;
                }
            }

            ///value is not empty
            $findData = getByWhere($table, '*', array('email' => $value1));
            if (empty($findData)) {
                $findData = getByWhere($table, '*', array('contact' => $value1));
                if (empty($findData)) {
                    if (empty($address) || empty($deal)) {
                        $html = $this->createHtml();
                        ///Success
                        $data = array('code' => 'warning', 'html' => $html, 'message' => 'Please enter deal name and address');
                        echo json_encode($data);
                        die;
                    } else {

                        $this->invite_user_by_email($value1, $deal, $address);
                    }
                }
            }




            ///run code
            $search_flag = false;
            foreach ($_SESSION['invite_list'] as $key => $value) {
                $value = (array) $value;
                if (in_array($findData[0]->email, $value)) {
                    $search_flag = true;
                    break;
                }
            }

            if ($search_flag == false) {
                $_SESSION['invite_list'] = array_merge($_SESSION['invite_list'], $findData);
            }


            ///create html
            $html = $this->createHtml();

            ///Success
            $data = array('code' => 'success', 'html' => $html,);
            echo json_encode($data);
            die;
        }
    }


    ///invite member remove process
    public function invited_member_remove()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);
            for ($i = 0; $i < count($_SESSION['invite_list']); $i++) {
                if ($_SESSION['invite_list'][$i]->user_id == $user_id) {
                    unset($_SESSION['invite_list'][$i]);
                    $html = $this->createHtml();
                    ///Success
                    $data = array('code' => 'success', 'html' => $html,);
                    echo json_encode($data);
                    die;
                }
            }
        }
    }

    ///createHtml
    public function createHtml()
    {
        ///create html
        $html = '';
        foreach ($_SESSION['invite_list'] as $key => $value) {
            $value = (array) $value;
            if ($value['profile'] == 'No Profile') {
                $prfile = NoProfile($value['user_id']);
                //  $prfile = '<div class="circle-x"><span>8</span></div>';
                $html .= '<div class="col-sm-2 col-xs-6">' .
                    '<div class = "img-wrap">' .
                    '<a href="javascript:void(0)" onclick="removeitem(\'' . $value['user_id'] . '\')" ><i class="fa fa-minus-circle"></i></a>' .
                    $prfile .
                    '<p>' . $value['name'] . '<br>' . '<span>(' . GetRoleName($value['role_id']) . ')</span>' . '</p>' .

                    '</div>' .
                    '</div>';
            } else {
                $prfile = '<img src=" ' . base_url($value['profile']) . ' " alt="' . $value['name'] . '">';
                $html .= '<div class="col-sm-2 col-xs-6">' .
                    '<div class = "img-wrap">' .
                    '<a href="javascript:void(0)" onclick="removeitem(\'' . $value['user_id'] . '\')" ><i class="fa fa-minus-circle"></i></a>' .
                    $prfile .
                    '<p>' . $value['name'] . '<br>' . '<span>(' . GetRoleName($value['role_id']) . ')</span>' . '</p>' .

                    '</div>' .
                    '</div>';
            }
        }

        return $html;
    }

    ///image_upload_process
    public function image_upload_process()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);
            $postData = array();
            ///image 
            if (isset($_FILES['image_upload_file']) && $_FILES['image_upload_file']['name'] != "") {
                $path = 'assets/profiles/' . $user_id . '/';
                if (!is_dir($path)) {
                    mkdir($path, 0777, true);
                }

                $config['upload_path'] = FCPATH . $path;
                $config['allowed_types'] = 'jpg|png|jpeg';
                $config['max_size']             = 15000;
                $this->load->library('upload', $config);
                ///before uploading check file extention
                $filename = $_FILES["image_upload_file"]["name"];
                $file_allow = CheckFileExtention($filename);


                if ($file_allow == 0) {
                    ///credential not correct
                    $data = array('code' => 'warning-img', 'message' => 'Only PNG/JPG/JPEG file allowed');
                    echo json_encode($data);
                    die;
                }

                if (!$this->upload->do_upload('image_upload_file')) {
                    // $error = array('error' => $this->upload->display_errors());
                    ///credential not correct
                    $data = array('code' => 'warning-img', 'message' => 'Only file size less than 15 MB allowed');
                    echo json_encode($data);
                    die;
                } else {

                    $uploadedImage = $this->upload->data();
                    $response = resizeImage($uploadedImage['file_name'], $user_id);
                    if ($response == true) {
                        $postData['profile'] = $path . $uploadedImage['file_name'];
                        updateByWhere('users', $postData, array('user_id' => $user_id));
                        if (is_readable(FCPATH . $_SESSION['profile']) && unlink(FCPATH . $_SESSION['profile'])) {
                            $_SESSION['profile'] = $postData['profile'];
                            $output = base_url() . $postData['profile'];
                        } else {
                            error_reporting(0);
                            $_SESSION['profile'] = $postData['profile'];
                            $output = base_url() .  $postData['profile'];
                        }
                        ///Success
                        $data = array('status' => TRUE, 'output' => $output);
                        echo json_encode($data);
                        die;
                    } else {

                        $data = array('code' => 'warning-img', 'message' => 'Your Profile Has Been Created But Image Not Uploaded!');
                        echo json_encode($data);
                        die;
                    }
                }
            }
        }
    }

    /// Manage get_invited_user_list process
    public function get_invited_user_list()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);

            ////invite list 
            $_SESSION['invite_list'] = array();

            $findData = array();
            $findData = getByWhere($table, '*', array('deal_id' => $deal_id));

            if ($findData) {
                for ($i = 0; $i < count($findData); $i++) {
                    $findUser = array();
                    $findUser = getByWhere('users', '*', array('user_id' => $findData[$i]->invited_user_id));
                    if ($findUser) {
                        $_SESSION['invite_list'] = array_merge($_SESSION['invite_list'], $findUser);
                    }
                }
            }

            ///create html 
            $html = $this->createHtml();

            ///Success
            $data = array('code' => 'success', 'html' => $html,);
            echo json_encode($data);
            die;
        }
    }

    /// Manage delete process
    public function delete_member()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);


            $findData = getByWhere('deal', '*', array('deal_id' => $deal_id, 'user_id' => $user_id));

            if ($findData) {
                if ($user_id == $invited_user_id) {
                    deleteRecordWhere('deal', array('deal_id' => $deal_id, 'user_id' => $user_id));
                    deleteRecordWhere('deal_invite_members', array('deal_id' => $deal_id));
                } else {
                    deleteRecordWhere('deal_invite_members', array('deal_id' => $deal_id, 'invited_user_id' => $invited_user_id));
                }
                ///Success
                $data = array('code' => 'success', 'message' => 'Deal deleted successfully');
                echo json_encode($data);
                die;
            } else {
                if ($user_id == $invited_user_id) {
                    deleteRecordWhere('deal_invite_members', array('deal_id' => $deal_id, 'invited_user_id' => $invited_user_id));
                    ///Success
                    $data = array('code' => 'success', 'message' => 'Deal deleted successfully');
                    echo json_encode($data);
                    die;
                }
            }


            ///credential not correct
            $data = array('code' => 'warning', 'message' => 'You are not original creator of this deal');
            echo json_encode($data);
            die;
        }
    }

    /// Manage delete_deal process
    public function delete_deal()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);

            $findData = getByWhere('deal', '*', array('deal_id' => $deal_id, 'user_id' => $user_id));

            if ($findData) {
                deleteRecordWhere('deal', array('deal_id' => $deal_id, 'user_id' => $user_id));
                deleteRecordWhere('deal_invite_members', array('deal_id' => $deal_id));
                ///Success
                $data = array('code' => 'success', 'message' => 'Deal deleted successfully');
                echo json_encode($data);
                die;
            } else {
                $findData = getByWhere('deal_invite_members', '*', array('deal_id' => $deal_id, 'invited_user_id' => $user_id));
                if ($findData) {
                    deleteRecordWhere('deal_invite_members', array('deal_id' => $deal_id, 'invited_user_id' => $user_id));
                    ///Success
                    $data = array('code' => 'success', 'message' => 'Deal deleted successfully');
                    echo json_encode($data);
                    die;
                }
            }


            ///credential not correct
            $data = array('code' => 'warning', 'message' => 'You are not original creator of this deal');
            echo json_encode($data);
            die;
        }
    }

    /// Manage get_autocomplete_user process
    public function get_autocomplete_user()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);
            $findUsers = getByWhere($table, '*', array('user_id !=' => $_SESSION['user_id']));
            $email = array();
            $img = array();
            if ($findUsers) {
                foreach ($findUsers as $key => $value) {


                    array_push($email, $value->email);
                    // if ($value->profile == 'No Profile') {
                    //     $profile = NoProfile($value->user_id);
                    //     //  $prfile = '<div class="circle-x"><span>8</span></div>';
                    // } else {
                    //     $profile = '<img src=" ' . base_url($value->profile) . ' " alt="' . $value->name . '">';
                    // } 
                    // array_push($img, $profile);

                }
            }




            ///Success
            $data = array('code' => 'success', 'data' => $email);
            echo json_encode($data);
            die;
        }
    }

    /// Manage invite_user_by_email process
    public function invite_user_by_email($email, $deal, $address)
    {

        $email = strtolower($email);

        //store email data
        if (isset($_SESSION['new_invited_user']) && !empty($_SESSION['new_invited_user'])) {
            foreach ($_SESSION['new_invited_user'] as $key => $value) {
                if ($value == $email) {
                    $html = $this->createHtml();
                    ///credential not correct
                    $data = array('code' => 'warning', 'message' => 'You already sent an invitation to this user', 'html' => $html);
                    echo json_encode($data);
                    die;
                }
            }
        }

        $to_email = $email;
        $link = base_url('register?email=' . base64_encode($email) . '');
        $from_email = $_SESSION['email'];
        $res = NewUserInvetaionEmail($link, $to_email, $from_email, $deal, $address);

        if ($res == 1) {
            array_push($_SESSION['new_invited_user'], $email);
            ///check email from users
            $findData = getByWhere('users', '*', array('email' => $email));
            if (!$findData) {
                $email = strtolower($email);

                $invited_user_id = addNew('users', array('email' => $email, 'user_status' => 'inactive', 'name' => GetNameFromEmail($email), 'created_at' => IntegerDate()));
                $findData = getByWhere('users', '*', array('user_id' => $invited_user_id));

                ///run code
                $search_flag = false;
                foreach ($_SESSION['invite_list'] as $key => $value) {
                    $value = (array) $value;
                    if (in_array($email, $value)) {
                        $search_flag = true;
                        break;
                    }
                }

                if ($search_flag == false) {
                    $_SESSION['invite_list'] = array_merge($_SESSION['invite_list'], $findData);
                }

                $html = $this->createHtml();
            }

            ///Success
            $data = array('code' => 'success-email', 'message' => 'User has been invited successfully', 'html' => $html);
            echo json_encode($data);
            die;
        } else {
            $html = $this->createHtml();
            ///credential not correct
            $data = array('code' => 'warning', 'message' => 'Email not sent', 'html' => $html);
            echo json_encode($data);
            die;
        }
    }


    ///invite chat add process
    public function invite_chat_user()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);
            ///Email Validation
            $this->form_validation->set_rules('email', 'Email', 'required|valid_email');
            if ($this->form_validation->run() == FALSE) {

                ///create html
                $html = $this->createHtml();
                ///credential not correct
                $data = array('code' => 'warning', 'html' => $html, 'message' => 'Please Enter Correct Email');
                echo json_encode($data);
                die;
            }

            ///check user inviting his own email
            if ($_SESSION['email'] == $email) {

                ///create html
                $html = $this->createHtml();
                ///credential not correct
                $data = array('code' => 'warning', 'html' => $html, 'message' => 'You can not invite yourself');
                echo json_encode($data);
                die;
            }

            //check user already exists in this chat
            $findData = array();
            $findData = getByWhere('deal_chat', '*', array('deal_id' => $deal_id, 'chat_invited_email' => $email));
            if ($findData) {
                ///Response if user already exists in system 
                ///create html
                $html = $this->createHtml();
                ///Success
                $data = array('code' => 'warning', 'html' => $html, 'message' => 'Sorry this user already exists in this chat');
                echo json_encode($data);
                die;
            }

            ///Check User In System
            $findData = array();
            $findData = getByWhere('users', '*', array('email' => $email));

            if ($findData) {

                ///Response if user found in system

                ///Search User From invite List
                $search_flag = false;
                foreach ($_SESSION['invite_list'] as $key => $value) {
                    $value = (array) $value;
                    if (in_array($findData[0]->email, $value)) {
                        $search_flag = true;
                        break;
                    }
                }

                if ($search_flag == false) {
                    $_SESSION['invite_list'] = array_merge($_SESSION['invite_list'], $findData);
                }
                ///create html
                $html = $this->createHtml();

                if ($search_flag == true) {
                    ///Already User Invited
                    ///Success
                    $data = array('code' => 'warning', 'html' => $html, 'message' => 'You have already invited this user!');
                    echo json_encode($data);
                    die;
                }

                ///Invited Successfully 
                ///Success
                $data = array('code' => 'success', 'html' => $html, 'message' => 'This User Has Been Successfully Invited!');
                echo json_encode($data);
                die;
            } else {
                ///Response if user not exists in system 
                ///create html
                $html = $this->createHtml();
                ///Success
                $data = array('code' => 'warning', 'html' => $html, 'message' => 'Sorry this user not found in system');
                echo json_encode($data);
                die;
            }
        }
    }

    /// session clear process
    public function session_clear()
    {
        extract($_POST);

        ///session clear for chat_invited_list
        if ($section == 'chat_invited_list') {
            ////invite list
            $_SESSION['invite_list'] = array();
            $html = $this->createHtml();
            ///Success
            $data = array('code' => 'session-clear', 'html' => $html);
            echo json_encode($data);
            die;
        }


        ///Success
        $data = array('code' => 'success', 'message' => 'Session Clear');
        echo json_encode($data);
        die;
    }


    /// Manage add_chat_member_to_system process
    public function add_chat_member_to_system()
    {
        if ($this->input->is_ajax_request()) {

            extract($_POST);




            ///members greater than one
            if (isset($members) && !empty($members)) {

                ///check deal block
                $findData = array();
                $findData = getByWhere('deal_chat_room', '*', array('deal_id' => $deal_id));
                if ($findData) {


                    for ($i = 0; $i < count($findData); $i++) {
                        $deal_chat_room_id = $findData[$i]->deal_chat_room_id;

                        ///check user in every room
                        $findSubData = array();
                        $findSubData = getByWhere('deal_chat_participant', '*', array('deal_chat_room_id' => $deal_chat_room_id));

                        if ($findSubData) {
                            ///check room members count
                            if (count($members) == count($findSubData)) {

                                ///check room members
                                $same_mem = 0;
                                for ($j = 0; $j < count($findSubData); $j++) {

                                    if (in_array($findSubData[$j]->user_id, $members)) {

                                        $same_mem = 1;
                                        continue;
                                    } else {
                                        $same_mem = 0;
                                    }
                                }

                                ///if same chat 
                                if ($same_mem == 1) {
                                    ///Success
                                    $data = array('code' => 'warning', 'deal_chat_room_id' => $deal_chat_room_id, 'message' => 'sorry chat exists already!');
                                    echo json_encode($data);
                                    die;
                                }
                            }
                        }
                    }
                }



                ///create deal_chat_room
                $deal_chat_room_id = $this->objectidfactory->getNewId(rand());
                $postData = array();
                $postData['deal_chat_room_id'] = $deal_chat_room_id;
                $postData['deal_id'] = $deal_id;
                $postData['created_by_user_id'] = $inviting_by;
                addNew('deal_chat_room', $postData);


                ///add users to participant 
                for ($i = 0; $i < count($members); $i++) {
                    $postData = array();
                    $postData['deal_chat_room_id'] = $deal_chat_room_id;
                    $postData['user_id'] = $members[$i];
                    addNew('deal_chat_participant', $postData);
                }

                ///Success
                $data = array('code' => 'success', 'room' => $deal_chat_room_id, 'message' => 'New chat group added successfully');
                echo json_encode($data);
                die;
            }


            $data = array('code' => 'warning', 'message' => 'Please add chat member first');
            echo json_encode($data);
            die;
        }
    }


    function get_chat()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);
            $findData = array();
            $findData = getByWhere('deal_room_msg', '*', array('deal_chat_room_id' => $deal_chat_room_id));

            $html = '';
            if ($findData) {
                for ($i = 0; $i < count($findData); $i++) {
                    if ($findData[$i]->sender_user_id == $_SESSION['user_id']) {
                        $html .= ' <div class="container-fluid chat-recieve">' .
                            '<div class="row content-1">' .
                            ' <div class="col-lg-4 col-md-4 col-xs-12 offset-md-8 offset-lg-8 content-1-1">' .
                            '<p>' . $findData[$i]->message_content . '</p>' .
                            '<span>' . date('m/d/Y', strtotime($findData[$i]->created_date)) .' at ' . date('h:i A', strtotime($findData[$i]->created_date)) . '</span>' .
                            '</div>' .
                            '</div>' .
                            '</div>';
                    } else {
                        $html .= ' <div class="container-fluid chat-send">' .
                            '<div class="row content-1">' .
                            ' <div class="col-lg-6 col-md-6 col-xs-12 content-1-1">' .
                            '<p>' . $findData[$i]->message_content . '</p>' .
                            '<span>' . date('m/d/Y', strtotime($findData[$i]->created_date)) .' at ' . date('h:i A', strtotime($findData[$i]->created_date)) .  '</span>' .
                            '</div>' .
                            '<div class="col-lg-12 col-md-12 col-xs-12 content-1-2">' .
                            '' . GetMessageUserProfile($findData[$i]->sender_user_id) . '<p>' . GetUserName($findData[$i]->sender_user_id) . '<span>(' . GetUserRolesById($findData[$i]->sender_user_id) . ')</span></p>' . '' .
                            '</div>' .
                            '</div>' .
                            '</div>';
                    }
                }
            }
            $getdeal = getByWhere('deal_chat_room', '*', array('deal_chat_room_id' => $deal_chat_room_id));

            ///Success
            $data = array('code' => 'success', 'html' => $html, 'deal_id' => $getdeal[0]->deal_id, 'room_id' => $deal_chat_room_id);
            echo json_encode($data);
            die;
        }
    }

    function send_chat_to_socket()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);

            ///check only new line
            $message_content1 = preg_replace( "/\r|\n/", "", $message_content); 
            if (isset($message_content1) && empty($message_content1)) {
                ///credential not correct
                $data = array('code' => 'warning', 'message' => 'message is empty');
                echo json_encode($data);
                die;
            }


            ///check only space 
            $message_content1 = preg_replace('/\s+/', '', $message_content);
            if (isset($message_content1) && empty($message_content1)) {
                ///credential not correct
                $data = array('code' => 'warning', 'message' => 'message is empty');
                echo json_encode($data);
                die;
            }
            
            ///Success
            $data = array('code' => 'success', 'message' => 'Message send successfully ', 'data' => $_POST);
            echo json_encode($data);
            die;
        }
    }
}
