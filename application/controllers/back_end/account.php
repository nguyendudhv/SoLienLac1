<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Account extends CI_Controller{
    
    public function __construct()
    {
        parent::__construct();
        $this->load->model('back_end/account_model');
        $this->load->library("form_validation");
    }
    public function Index()
    {
        if($this->session->userdata('Session_User_Login')==null)
        {
          //header('location:../account/login');
          redirect('back_end/account/login');
        }
        else {
            //echo "<div style='display:none'>".$this->account_model->get_All()."</div>";
            $data['LoadController']='account';
            $data['LoadAction']='index';
            $this->load->view('back_end/layouts/default/layout.tpl',$data);
        }
        
    }
    
    
    public function list_accout_ajax()
    {
        echo $this->account_model->get_All();
    }
    
    
    /*
     *Method account/login
     * HttpPost 
     */
    public  function Login()
    {
        if($this->session->userdata('Session_User_Login')!=null)
        {
            redirect('back_end/account');    
        }
        else 
        {
            $this->load->model('back_end/group_model');
            $this->load->helper(array('form','url'));
            $data=array('GroupGetAll'=>$this->group_model->GetAll());
            $this->load->view("back_end/account/login_view.tpl",$data);
        }
        
    }
    
    
    public function DoLogin()
    {
        if($this->session->userdata('Session_User_Login')!=null)
        {
            redirect('back_end/account');    
        }
        else 
        {
            $this->form_validation->set_rules("username", "Username", "trim|required|xss_clean");
            $this->form_validation->set_message('required','Bạn phải nhập tên đăng nhập');//thiet lap tuy chinh thong bao cua validation
            $this->form_validation->set_rules("password","Password","trim|required|xss_clean|callback_check_database");
            $this->form_validation->set_message('required','Bạn phải nhập mật khẩu');
            $this->form_validation->set_error_delimiters('<span style="color:red;">', '</span>');//thiet lap mau chu validation
            //$this->form_validation->set_message('password','Bạn phải nhập mật khẩu');
            if($this->form_validation->run() == FALSE)
            {
                $this->load->model('back_end/group_model');
                $this->load->helper(array('form','url'));
                $data=array('GroupGetAll'=>$this->group_model->GetAll());
                $this->load->view("back_end/account/login_view.tpl",$data);
            }
            else
            {
                redirect('back_end/account');
            }
        }
        
    }
    
    public function Logout()
    {
        $this->session->sess_destroy();
        redirect('back_end/account/login');
    }
    
    public function check_database($password)
    {
        $username=$this->input->post("username");
        if($this->account_model->check_exist_username($username)==TRUE)
        {
            if($this->account_model->check_exist_password($password,$username)==TRUE)
            {
                $sess_login_arr=array(
                'AccountId'=>$username,
                'UserName'=>$username
                );
                $this->session->set_userdata('Session_User_Login',$sess_login_arr);
            }
            else 
            {
                
                $this->form_validation->set_message('username','Người dùng không tồn tại');
            }   
        }
        else {
            $this->form_validation->set_message('password','Bạn nhập sai mật khẩu');
        }
    }
    
    public function DeleteAccountById()
    {
       $Id=$_GET['id'];
       if($this->account_model->check_exist_by_id($Id)==TRUE)
       {
           if($this->account_model->delete_by_id($Id)==1)
           {
               echo "2";
           }
           else {
               echo "1";
           }
       }
       else {
           echo "0";
       }
    }
    
    public function UpdateAccountById()
    {
       $Id=$_GET['id'];
       $username=$_GET['username'];
       $email=$_GET['email'];
       if($this->account_model->check_exist_by_id($Id)==TRUE)
       {
           //$username=$this->input->post('UserName');
           //$email=$this->input->post('Email');
           if($this->account_model->update_by_id($Id,$username,$email)==1)
           {
               echo "1";
           }
           else {
               echo "-1";
           }
       }
       else {
           echo "0";
       }
    }
    
    public function InsertAccount()
    {
       $username=$_GET['username'];
       $email=$_GET['email'];
       if($this->account_model->check_exist_username($username)==TRUE)
       {
           echo "0";//Ton tai username
       }
       else {
           if($this->account_model->check_exist_username($username)==TRUE)
           {
              echo "1";//Ton tai email 
           }
           else {
               if($this->account_model->update_by_id($Id,$username,$email)==1)
               {
                   echo "2";//Thanh cong
               }
               else {
                   echo "-1";//Khong insert duoc
               }
           }
       }
    }
}
?>