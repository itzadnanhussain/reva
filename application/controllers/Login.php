<?php defined('BASEPATH') or exit('No direct script access allowed');

class Login extends CI_Controller
{

    ///Load Helper
    function __construct()
    {
        parent::__construct();
        $this->load->helper('security');
        $this->load->library('ObjectIdFactory');


        ///check cookie
        if (isset($_COOKIE['remember_me'])) {
            CheckCookieData();
        }

        ///check session 
        if ($this->session->userdata('logged_in')) {
            redirect(base_url('deals'));
        }
    }

    ///UserLogin
    public function index()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);
            ///check validation 
            $this->form_validation->set_rules('email', 'email', 'trim|required|valid_email', array('valid_email' => 'Please Enter Valid Email Address'));
            $this->form_validation->set_rules('password', 'Password', 'trim|required');
            //run validation 
            if ($this->form_validation->run()) {

                $email = strtolower($email);
                $findData = getByWhere('users', '*', array('email' => $email));
                if ($findData) {
                    $db_email = decryptData($findData[0]->email_encrypt, $findData[0]->salt_email);
                    if ($db_email == $email) {
                        $db_password = decryptData($findData[0]->password, $findData[0]->salt_pass);
                        if ($password == $db_password) {
                            // echo 'logged in';
                            // die; 

                            ///set cookies
                            if (isset($remember_me)) {
                                $token = rand();
                                updateByWhere('users', array('remember_token' => $token), array('user_id' => $findData[0]->user_id));
                                $this->load->helper('cookie');
                                $findData = getByWhere('users', '*', array('email' => $email));
                                $cookie = array(
                                    'name'   => 'remember_me',
                                    'value'  => $findData[0]->remember_token,
                                    'expire' => '3600',
                                    'secure' => TRUE
                                );
                                $this->input->set_cookie($cookie);
                                $remember_me = $findData[0]->remember_token;
                            }


                            ///set session 
                            $session_data = array(
                                'user_id'  => $findData[0]->user_id,
                                'user_name'  => $findData[0]->name,
                                'email'     => $findData[0]->email,
                                'role_id'      => $findData[0]->role_id,
                                'name'      => $findData[0]->name,
                                'contact'  => $findData[0]->contact,
                                'email_encrypt'  => $findData[0]->email_encrypt,
                                'profile'      => $findData[0]->profile,
                                'logged_in' => TRUE,
                            );

                            $this->session->set_userdata($session_data);
                            $_SESSION['new_invited_user'] = array();

                            ///Success
                            $data = array('code' => 'success', 'message' => 'Login successful');
                            echo json_encode($data);
                            die;
                        } else {

                            // echo 'password not match';
                            // die;
                            ///credential not correct
                            $data = array('code' => 'warning', 'message' => 'Sorry password does not match');
                            echo json_encode($data);
                            die;
                        }
                    } else {
                        ///credential not correct
                        $data = array('code' => 'warning', 'message' => 'Sorry email does not match');
                        echo json_encode($data);
                        die;
                    }
                } else {

                    // echo 'user not register';
                    // die;
                    ///credential not correct
                    $data = array('code' => 'warning', 'message' => 'Record not found');
                    echo json_encode($data);
                    die;
                }
            } else {
                // echo 'fields validation error';
                // die;

                ///validation errors
                $error_array = array();
                foreach ($_POST as $key => $value) {
                    if (form_error($key)) {
                        $error_array[] = array($key, form_error($key, null, null));
                    }
                }
                $data = array('code' => 'error', 'message' => $error_array);
                echo json_encode($data);
                die;
            }
        } else {
            $data = array();
            $data['title'] = 'Login Page';
            $page = 'login';
            $this->load->view($page, $data);
        }
    }

    ///RegisterNewUser
    public function RegisterNewUser()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);
            ///check validation 
            $this->form_validation->set_rules('name', 'name', 'trim|required');
            $this->form_validation->set_rules('email', 'email', 'trim|required|valid_email', array('valid_email' => 'Please Enter Valid Email Address'));
            // $this->form_validation->set_rules('contact', 'contact', 'trim|required');
            // $this->form_validation->set_rules('company', 'company', 'trim|required');
            $this->form_validation->set_rules('password', 'password', 'trim|required|min_length[8]|max_length[25]|xss_clean|callback_is_password_strong', array(
                'is_password_strong' => 'Please Add atleast one number and one special character',
                'min_length' => 'Your password must be at least 8 characters in length'

            ));

            if (isset($_FILES['profile']['name']) && (!empty($_FILES['profile']['name']))) {
                $file_allow = CheckFileExtention($_FILES['profile']['name']);
                if ($file_allow == 0) {
                    ///credential not correct
                    $data = array('code' => 'warning', 'message' => 'Only PNG/JPG/JPEG file allowed');
                    echo json_encode($data);
                    die;
                }
            }

            if ($this->form_validation->run() == TRUE) {

                $email = strtolower($email);
                $findData = getByWhere('users', '*', array('email' => $email));
                ///new users
                if (empty($findData)) {

                    $postData['role_id'] = $role_id;
                    $postData['name'] = $name;
                    $postData['email'] = $email;
                    $postData['company'] = $company;
                    $postData['contact'] = $contact;

                    ///Password and Salt
                    $res = encryptData($password);
                    $postData['salt_pass'] = $res['salt'];
                    $postData['password'] = $res['enc_text'];

                    ///Email and Salt
                    $res = encryptData($email);
                    $postData['salt_email'] = $res['salt'];
                    $postData['email_encrypt'] = $res['enc_text'];

                    ///set data
                    $postData['created_at'] = IntegerDate();
                    $user_id = $this->objectidfactory->getNewId(rand());
                    $postData['user_id'] = $user_id;




                    $last_id = addNew('users', $postData);



                    if ($last_id) {

                        ///check remember me
                        if (!isset($remember)) {
                            $remember = 'of';
                        }

                        ///set session
                        $findData = getByWhere('users', '*', array('user_id' => $user_id));
                        $session_data = array(
                            'user_id'  => $findData[0]->user_id,
                            'user_name'  => $findData[0]->name,
                            'email'     => $findData[0]->email,
                            'role_id'      => $findData[0]->role_id,
                            'name'      => $findData[0]->name,
                            'contact'  => $findData[0]->contact,
                            'email_encrypt'  => $findData[0]->email_encrypt,
                            'profile'      => $findData[0]->profile,
                            'logged_in' => TRUE,
                        );
                        $this->session->set_userdata($session_data);
                        $_SESSION['new_invited_user'] = array();


                        $postData = array();
                        ///image 
                        if (isset($_FILES['profile']) && $_FILES['profile']['name'] != "") {
                            $path = 'assets/profiles/' . $user_id . '/';
                            if (!is_dir($path)) {
                                mkdir($path, 0777, true);
                            }

                            $config['upload_path'] = FCPATH . $path;
                            // $config['upload_path'] = $path;
                            $config['allowed_types'] = 'jpg|png|jpeg';
                            $config['max_size']             = 15000;
                            $this->load->library('upload', $config);


                            // ///before uploading check file extention
                            // $filename = $_FILES["profile"]["name"];
                            // $file_allow = CheckFileExtention($filename);
                            // if ($file_allow == 0) {
                            //     ///credential not correct
                            //     $data = array('code' => 'warning-img', 'message' => 'Your profile has been created but image was not uploaded');
                            //     echo json_encode($data);
                            //     die;
                            // }




                            if (!$this->upload->do_upload('profile')) {
                                // $error = array('error' => $this->upload->display_errors());
                                ///credential not correct
                                $data = array('code' => 'warning-img', 'message' => 'Your profile has been created but image was not uploaded');
                                echo json_encode($data);
                                die;
                            } else {
                                $uploadedImage = $this->upload->data();
                                $response = resizeImage($uploadedImage['file_name'], $user_id);

                                if ($response == true) {

                                    $postData['profile'] = $path . $uploadedImage['file_name'];
                                    updateByWhere('users', $postData, array('user_id' => $user_id));
                                    $_SESSION['profile'] = $postData['profile'];
                                } else {

                                    $data = array('code' => 'warning-img', 'message' => 'Your profile has been created but image was not uploaded');
                                    echo json_encode($data);
                                    die;
                                }
                            }
                        }
                    }


                    ///Success
                    $data = array('code' => 'success', 'message' => 'User registered successfully');
                    echo json_encode($data);
                    die;
                } else {
                    if ($findData[0]->user_status == 'inactive') {

                        $postData['role_id'] = $role_id;
                        $postData['name'] = $name;
                        $postData['email'] = $email;
                        $postData['company'] = $company;
                        $postData['contact'] = $contact;
                        $postData['user_status'] = 'active';

                        ///Password and Salt
                        $res = encryptData($password);
                        $postData['salt_pass'] = $res['salt'];
                        $postData['password'] = $res['enc_text'];

                        ///Email and Salt
                        $res = encryptData($email);
                        $postData['salt_email'] = $res['salt'];
                        $postData['email_encrypt'] = $res['enc_text'];

                        $user_id = $this->objectidfactory->getNewId(rand());
                        $postData['user_id'] = $user_id;




                        ///set data
                        $postData['created_at'] = IntegerDate();
                        $update = updateByWhere('users', $postData, array('email' => $email));

                        if ($update) {
                            $user_id = $findData[0]->user_id;


                            ///check remember me
                            if (!isset($remember)) {
                                $remember = 'of';
                            }

                            ///set session
                            $findData = getByWhere('users', '*', array('user_id' => $user_id));
                            $session_data = array(
                                'user_id'  => $findData[0]->user_id,
                                'email'     => $findData[0]->email,
                                'name'     => $findData[0]->name,
                                'contact'  => $findData[0]->contact,
                                'role_id'      => $findData[0]->role_id,
                                'profile'      => $findData[0]->profile,
                                'logged_in' => TRUE,
                                'remember_me' => $remember
                            );
                            $this->session->set_userdata($session_data);
                            $_SESSION['new_invited_user'] = array();


                            $postData = array();
                            ///image 
                            if (isset($_FILES['profile']) && $_FILES['profile']['name'] != "") {
                                $path = 'assets/profiles/' . $user_id . '/';
                                if (!is_dir($path)) {
                                    mkdir($path, 0777, true);
                                }

                                $config['upload_path'] = FCPATH . $path;
                                // $config['upload_path'] = $path;
                                $config['allowed_types'] = 'jpg|png|jpeg';
                                $config['max_size']             = 15000;
                                $this->load->library('upload', $config);

                                ///before uploading check file extention
                                $filename = $_FILES["profile"]["name"];
                                $file_allow = CheckFileExtention($filename);
                                if ($file_allow == 0) {
                                    ///credential not correct
                                    $data = array('code' => 'warning-img', 'message' => 'Your profile has been created but image was not uploaded');
                                    echo json_encode($data);
                                    die;
                                }


                                if (!$this->upload->do_upload('profile')) {
                                    // $error = array('error' => $this->upload->display_errors());
                                    ///credential not correct
                                    $data = array('code' => 'warning-img', 'message' => 'Your profile has been created but image was not uploaded');
                                    echo json_encode($data);
                                    die;
                                } else {
                                    $uploadedImage = $this->upload->data();
                                    $response = resizeImage($uploadedImage['file_name'], $user_id);

                                    if ($response == true) {

                                        $postData['profile'] = $path . $uploadedImage['file_name'];
                                        updateByWhere('users', $postData, array('user_id' => $user_id));
                                        $_SESSION['profile'] = $postData['profile'];
                                    } else {

                                        $data = array('code' => 'warning-img', 'message' => 'Your profile has been created but image was not uploaded');
                                        echo json_encode($data);
                                        die;
                                    }
                                }
                            }
                        }


                        ///Success
                        $data = array('code' => 'success', 'message' => 'User registered successfully');
                        echo json_encode($data);
                        die;
                    }

                    ///credential not correct
                    $data = array('code' => 'warning', 'message' => 'User already exists');
                    echo json_encode($data);
                    die;
                }
            } else {
                ///validation errors
                $error_array = array();
                foreach (array_merge($_POST, $_FILES) as $key => $value) {
                    if (form_error($key)) {
                        $error_array[] = array($key, form_error($key, null, null));
                    }
                }
                $data = array('code' => 'error', 'message' => $error_array);
                echo json_encode($data);
                die;
            }
        } else {
            $data = array();
            $email = $this->input->get('email');
            $email = base64_decode($email);
            $data['email'] = $email;
            $data['user_roles'] = getByWhere('user_roles');
            $data['title'] = 'User Registration';

            $page = 'register';
            $this->load->view($page, $data);
        }
    }

    ///forgot-password
    public function forgot_password()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);
            $this->form_validation->set_rules('email', 'email', 'required');
            if ($this->form_validation->run() == TRUE) {
                $email = strtolower($email);
                ///check email in database
                $findData = getByWhere('users', '*', array('email' => $email));
                if ($findData) {
                    $to_email = $email;
                    $link = base_url('reset_password?email=' . base64_encode($email) . '');
                    // $res = HelloMail();
                    $res = PasswordResetEmail($link, $to_email);
                    if ($res == 1) {
                        ///Success
                        $data = array('code' => 'success1', 'message' => 'Please check your inbox');
                        echo json_encode($data);
                        die;
                    } else {
                        ///credential not correct
                        $data = array('code' => 'warning', 'message' => 'Something went wrong.');
                        echo json_encode($data);
                        die;
                    }
                } else {
                    ///credential not correct
                    $data = array('code' => 'warning', 'message' => 'This email does not exist in our system');
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
                $data = array('code' => 'error', 'message' => $error_array);
                echo json_encode($data);
                die;
            }
        } else {
            $data = array();
            $data['title'] = 'Forgot Password';
            $page = 'forgot_pass';
            $this->load->view($page, $data);
        }
    }

    ///User response
    public function user_verification_get()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);
            $this->form_validation->set_rules('password', 'password', 'trim|required|matches[password]|min_length[8]|max_length[25]|xss_clean|callback_is_password_strong', array(
                'is_password_strong' => 'Please Add atleast one number and one special character',
                'min_length' => 'Your password must be at least 8 characters in length'
            ));
            $this->form_validation->set_rules('cpassword', 'confirm password', 'required|matches[password]');
            if ($this->form_validation->run() == TRUE) {
                $email = strtolower($email);
                $findData = getByWhere('users', '*', array('email' => $email));
                if ($findData) {
                    $db_email = decryptData($findData[0]->email_encrypt, $findData[0]->salt_email);

                    if ($db_email == $email) {
                        ///Password and Salt
                        $res = encryptData($password);
                        $postData['salt_pass'] = $res['salt'];
                        $postData['password'] = $res['enc_text'];

                        $update = updateByWhere('users', $postData, array('email' => $email));
                        if ($update) {

                            ///Success
                            $data = array('code' => 'success', 'message' => 'Password reset successfully');
                            echo json_encode($data);
                            die;
                        } else {
                            ///credential not correct
                            $data = array('code' => 'warning', 'message' => 'something went Wrong');
                            echo json_encode($data);
                            die;
                        }
                    } else {
                        ///credential not correct
                        $data = array('code' => 'warning', 'message' => 'This email does not exist in our system');
                        echo json_encode($data);
                        die;
                    }
                } else {
                    ///credential not correct
                    $data = array('code' => 'warning', 'message' => 'This email does not exist in our system');
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
                $data = array('code' => 'error', 'message' => $error_array);
                echo json_encode($data);
                die;
            }
        } else {
            $email = $this->input->get('email');
            $email = base64_decode($email);
            $data = array();
            $data['title'] = 'User Registration';
            $data['email'] = $email;
            $page = 'reset_pass';
            $this->load->view($page, $data);
        }
    }

    ///password verify 
    public function is_password_strong($password)
    {

        if (preg_match('#[0-9]#', $password) && preg_match('#[a-zA-Z]#', $password) && preg_match('/[\'^£$%&*()}{@#~?><>,!|=_+¬-]/', $password)) {
            $flag = TRUE;
        } else {
            $flag = FALSE;
        }

        return $flag;
    }

    /// Manage email-template process
    public function email()
    {
        $data = array();
        $data['title'] = 'Email Template';
        $page = 'email_template';
        $this->load->view($page, $data);
    }
}
