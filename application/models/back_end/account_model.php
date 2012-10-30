<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Account_model extends CI_Model{
    public function __construct()
    {
        parent::__construct();
    }
    
    public function get_All()
    {
        //$this->db->select('AccountId,UserName,Email');
        //$this->db->from('Accounts');
       $sql = "SELECT `AccountId`,`UserName`,`Email` FROM Accounts";
       $query=$this->db->query($sql);
       //$result=array();
       return json_encode($query->result());
       //return json_encode($result);
    }
   
   public function get_all_by_group($groupId='')
   {
        //$this->db->select('AccountId,UserName,Email');
        //$this->db->from('Accounts');
       $sql = "SELECT `AccountId`,`UserName`,`Email` FROM Accounts";
       $query=$this->db->query($sql);
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
   public function check_exist_password($password,$username)
   {
       $sql = "SELECT * FROM Accounts WHERE Password = ? AND UserName = ?"; 
       $query=$this->db->query($sql,array(md5($password),$username));
       return $query->num_rows()>0?TRUE:FALSE;
   }
   
   public function delete_by_id($Id)
   { 
       //echo $sql;
       //$query=$this->db->query($sql,array($Id));
       //$sql = "DELETE FROM Accounts WHERE AccountId = ?"; 
       //$query=$this->db->query($sql,array($Id));
       return $this->db->delete('Accounts', array('AccountId' => $Id));
   }
   
   public function update_by_id($Id='',$UserName,$Email)
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