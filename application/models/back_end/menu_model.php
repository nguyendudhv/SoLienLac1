_<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Menu_model extends CI_Model{
    public function __construct()
    {
        parent::__construct();
    }
    
    public function get_All()
    {
        //$this->db->select('AccountId,UserName,Email');
        //$this->db->from('Accounts');
       $sql = "SELECT `MenuId`,`Name`,`Url` FROM `Menus`";
       $query=$this->db->query($sql);
       //$result=array();
       return json_encode($query->result());
       //return json_encode($result);
    }
   
   public function get_menu_child_by_parent($parentId)
   {
       //$this->db->select('MenuId,Name,Url');
       //$this->db->from('Menus');
       //$this->db->where(array('MenuId'=>$parentId));
       $sql = "SELECT `MenuId`,`Name`,`Url` FROM Menu WHERE `ParrentId`=?";
       $query=$this->db->query($sql,array($parentId));
       //$result=array();
       return json_encode($query->result());
       //return json_encode($result);
   }
   
   /*
    * Hàm kiểm tra sự tồn tại của username
    * */
   public function check_exist_username($username)
   {
       $sql = "SELECT * FROM Accounts WHERE UserName = ?";
       $query=$this->db->query($sql,array($username));
       return $query->num_rows()>0?TRUE:FALSE;
   }
   
   /*
    * Hàm kiểm tra sự tồn tại của email
    * */
   public function check_exist_email($email)
   {
       $sql = "SELECT * FROM Accounts WHERE Email = ?";
       $query=$this->db->query($sql,array($email));
       return $query->num_rows()>0?TRUE:FALSE;
   }
   
   /*
    * Hàm kiểm tra sự tồn tại của Id
    * */
   public function check_exist_by_id($Id)
   {
       $sql = "SELECT * FROM Accounts WHERE AccountId = ?";
       $query=$this->db->query($sql,array($Id));
       return $query->num_rows()>0?TRUE:FALSE;
   }
   
    /*
    * Hàm kiểm tra sự tồn tại của username
    * */
   public function check_exist_password($MenuId)
   {
       $sql = "SELECT * FROM Menus WHERE MenuId=?"; 
       $query=$this->db->query($sql,array($MenuId));
       return $query->num_rows()>0?TRUE:FALSE;
   }
   
   public function delete_by_id($Id)
   { 
       //echo $sql;
       //$query=$this->db->query($sql,array($Id));
       //$sql = "DELETE FROM Accounts WHERE AccountId = ?"; 
       //$query=$this->db->query($sql,array($Id));
       return $this->db->delete('Menus', array('MenuId' => $Id));
   }
   
   public function update_by_id($Id='',$Name,$Url)
   {
       if(!empty($Id))
       {
           $data=array('UserName'=>$UserName,'Email'=>$Email);
           $where="AccountId=$Id";
           $sql=$this->db->update_string('Accounts', $data, $where); 
           //$sql = "UPDATE  Accounts SET `UserName`=?, `Email`=? WHERE `AccountId` = ?"; 
           $query=$this->db->query($sql);
           //$query=$this->db->query($sql,array($UserName,$Email,$Id));
       }
       else 
       {
           $data = array('UserName' => $UserName, 'Email' => $Email);
           $sql = $this->db->insert_string('Accounts', $data); 
           //$sql = "INSERT INTO  Accounts(`UserName`,`Email`) Values(?,?)"; 
           $query=$this->db->query($sql);
           //$query=$this->db->query($sql,array($UserName,$Email,$Id));
       }
       return $this->db->affected_rows();
   }
   
   
}
?>