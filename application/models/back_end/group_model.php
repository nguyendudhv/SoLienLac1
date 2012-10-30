<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Group_model extends CI_Model{
    public function __construct()
    {
        parent::__construct();
    }
   
    public function GetAll()
    {
        $this->db->select('GroupId,GroupName');
        $this->db->from('Groups');
        $this->db->limit('30');
        $query=$this->db->get();
        if($query->num_rows()>0)
         return $query->result();
        return FALSE;
    }
   
}
?>