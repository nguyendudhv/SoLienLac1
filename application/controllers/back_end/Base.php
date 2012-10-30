<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Base extends CI_Controller{
    public function __construct()
    {
        parent::__construct();
    }
    public static $access=FALSE;
    public static $view=FALSE;
    public static $delete=FALSE;
    public static $edit=FALSE;
    public static $download=FALSE;
    public static $upload=FALSE;
}
?>