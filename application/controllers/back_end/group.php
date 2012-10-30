<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Group extends CI_Controller{
    public function __contruct()
    {
        parent::__contruct();
        $this->load->model('back_end/group_model');
        //$this->load->model('back_end/group_model');
    }
    
    public function GetAll()
    {
        
        //$data["GroupGetAll"]=$this->group_model->GetAll();
        $data=array('GroupGetAll'=>$this->group_model->GetAll());
        $this->load->view('back_end/group/group_login_view.tpl',$data);
    }
    
    
    public function GetAllJson()
    {
        $this->load->model('back_end/group_model');
        echo json_encode($this->group_model->GetAll());
    }
    
}
