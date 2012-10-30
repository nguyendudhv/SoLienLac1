<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Menu extends CI_Controller{
    
    public function __construct()
    {
        parent::__construct();
        $this->load->model('back_end/menu_model');
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
            $data['LoadController']='menu';
            $data['LoadAction']='index';
            $this->load->view('back_end/layouts/default/layout.tpl',$data);
        }
        
    }
    
    
    public function list_accout_ajax()
    {
        echo $this->menu_model->get_All();
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