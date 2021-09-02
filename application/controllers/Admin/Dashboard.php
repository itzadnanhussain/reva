<?php defined('BASEPATH') or exit('No direct script access allowed');
class Dashboard extends CI_Controller
{
    ///Load Helper
    function __construct()
    {
        parent::__construct(); 
        
        ///check login
        if (!$this->session->userdata('logged_in'))
        { 
            redirect(base_url());
        }
    } 

    ///profile
    public function profile()
    {

        if ($this->input->is_ajax_request()) { 
            extract($_POST); 
            ///check validation 
            $this->form_validation->set_rules('name', 'name', 'trim|required');
            $this->form_validation->set_rules('email', 'email', 'trim|required|valid_email', array('valid_email' => 'Please Enter Valid Email Address'));
            // $this->form_validation->set_rules('contact', 'contact', 'trim|required');
            // $this->form_validation->set_rules('company', 'company', 'trim|required');

            // if (empty($_FILES['profile']['name'])) {
            //     $this->form_validation->set_rules('profile', 'Profile', 'required');
            // }

            if ($this->form_validation->run() == TRUE) { 
                $email = strtolower($email);
                $findData = getByWhere('users', '*', array('user_id' => $user_id));
                if ($findData) {
                    $postData['role_id'] = $role_id;
                    $postData['name'] = $name;
                    $postData['email'] = $email;
                    $postData['company'] = $company;
                    $postData['contact'] = $contact;

                    ///Password and Salt
                    // $res = encryptData($password);
                    // $postData['salt_pass'] = $res['salt'];
                    // $postData['password'] = $res['enc_text'];

                    ///Email and Salt
                    $res = encryptData($email);
                    $postData['salt_email'] = $res['salt'];
                    $postData['email_encrypt'] = $res['enc_text'];

                    ///set data
                    $postData['created_at'] = IntegerDate();

                    ///update record
                    updateByWhere('users', $postData, array('user_id' => $user_id));

                    $postData = array();
                    ///image 
                    if (isset($_FILES['profile']) && $_FILES['profile']['name'] != "") {
                        $path = 'assets/profiles/' . $user_id . '/';
                        if (!is_dir($path)) {
                            mkdir($path, 0777, true);
                        }

                        $config['upload_path'] = FCPATH . $path;
                        $config['allowed_types'] = 'gif|jpg|png|jpeg';


                        $this->load->library('upload', $config);
                        if (!$this->upload->do_upload('profile')) {
                            $error = array('error' => $this->upload->display_errors());
                            echo $error;
                            die;
                        } else {
                            $data1 = $this->upload->data();
                            $postData['profile'] = $path . $data1['file_name'];
                            updateByWhere('users', $postData, array('user_id' => $user_id));
                        }
                    } 

                    ///set session
                    $session_data = array(
                        'user_id'  => $findData[0]->user_id,
                        'email'     => $findData[0]->email,
                        'name'     => $findData[0]->name,
                        'contact'  => $findData[0]->contact,
                        'role_id'      => $findData[0]->role_id,
                        'profile'      => $findData[0]->profile,
                        'logged_in' => TRUE,
                         
                    );
                    $this->session->set_userdata($session_data);  

                    ///Success
                    $data = array('code' => 'success', 'message' => 'User record updated successfully');
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

            $user_id = $_SESSION['user_id']; 
            $title = 'User Profile';
            $data = array();
            $data['user_roles'] = getByWhere('user_roles');
            $data['user'] = getByWhere('users', '*', array('user_id' => $user_id));
            $page = 'admin/profile';
            AdminView($page, $data, $title);
        }
    }

    ///ChangePassword
    public function ChangePassword()
    {
        if ($this->input->is_ajax_request()) {
            extract($_POST);
            // echo '<pre>';
            // print_r($_POST);
            // echo '</pre>';
            // die;

            ///check validation 
            $this->form_validation->set_rules('old_password', 'Current Password', 'trim|required');
            $this->form_validation->set_rules('new_password', 'new password', 'trim|required');
            $this->form_validation->set_rules('confirm_password', 'confirm password', 'required|matches[new_password]');

            //run validation 
            if ($this->form_validation->run()) {

                $email = strtolower($email);
                $findData = getByWhere('users', '*', array('email' => $email));
                if ($findData) {
                    $db_password = decryptData($findData[0]->password, $findData[0]->salt_pass);

                    if ($old_password == $db_password) {
                        ///Password and Salt
                        $res = encryptData($new_password);
                        $postData['salt_pass'] = $res['salt'];
                        $postData['password'] = $res['enc_text'];
                        updateByWhere('users', $postData, array('email' => $email));
                        ///Success
                        $data = array('code' => 'success', 'message' => 'Password has been changed!');
                        echo json_encode($data);
                        die;
                    } else {
                        $data = array('code' => 'warning', 'message' => 'Sorry current password is incorrect');
                        echo json_encode($data);
                        die;
                    }
                } else {
                    ///credential not correct
                    $data = array('code' => 'warning', 'message' => 'Record Not Found!');
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
            $user_id = $_SESSION['user_id'];
            $title = 'Change Password';
            $data = array();
            $page = 'admin/change_pass';
            AdminView($page, $data, $title);
        }
    }

    ////Logout
    public function Logout()
    {
        session_destroy();
        delete_cookie("remember_me");
        redirect(base_url());
    }


}
