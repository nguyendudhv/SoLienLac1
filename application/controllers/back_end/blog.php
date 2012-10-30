<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 *  
 */
class Blog extends CI_Controller {
	
	public function Index()
	{
	    $this->load->model("back_end/blog_model");
        $data['blog_data']=$this->blog_model->GetValue();
        //$data=array('blog_data'=>$this->blog_model->GetValue());
        /*$data = array(
               'title' => 'My Title',
               'heading' => 'My Heading',
               'message' => 'My Message'
          );*/
        $this->load->view("back_end/blog_view.tpl",$data);
	}
}

?>