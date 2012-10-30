<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * CodeIgniter JQuery Class
 *
 * This class enables you to insert JQuery Library, Scripts, Plugins and
 * general javascript functions into your projects.
 * You can load the library and the related plugins from an external source
 * such as Google or include it into your project folder.
 * You can also add personalized functions or scripts.
 * At the end the scripts and the functions can be minimized for better
 * performance (only if you use PHP5)
 *
 *
 * @package             CodeIgniter
 * @subpackage  Libraries
 * @category    Libraries
 * @author              Alberto Sabena
 * @link                http://code.google.com/p/codeigniter-jquery/
 */
class CI_Jquery {
       
        var $config             = array();
        var $libraries          = array();
        var $CI;        
       
        /**
         * JQuery Constructor
         *
         * Loads the config form ./system/application/config/jquery.php
         *
         * @return CI_Jquery
         */
        function CI_Jquery()
        {
                log_message('debug', "Jquery Class Initialized");
               
                // Set the super object to a local variable for use throughout the class
                $this->CI =& get_instance();

                // Loads the jquery config (jquery.php under ./system/application/config/)
                $this->CI->load->config('jquery');
               
                $tmp_config =& get_config();
               
                if (count($tmp_config['jquery'])>0)
                {
                        $this->config = $tmp_config['jquery'];  // stores the jquery class configuration in a class variable
                        unset ($tmp_config);
                }
                else
                        $this->_error('jquery_configuration_error');
                       
                if ($this->config['auto_insert_library'])
                        $this->add_jquery();
       
                return;
        }
       
        // ------------------------------------------------------------------------
       
        /**
         * Loads the main jquery library adding it in the libraries array.
         *
         */
        function add_jquery()
        {
                $this->libraries[] = $this->_get_full_URL($this->config['main_library_path']);
                return;
        }
       
        // ------------------------------------------------------------------------
       
        /**
         * Adds the base_url before the library path if not present
         *
         * @param string $library
         * @return string
         */
        function _get_full_URL($library)
        {
                if (strpos("http",$library) === false)
                        return $this->CI->config->item('base_url') .  $library;
                else
                        return $library;
        }
       
        // ------------------------------------------------------------------------
       
        /**
         * Display error message
         *
         * @access      private
         * @param       string
         * @return      bool
         */    
        function _error($line)
        {
                $CI =& get_instance();
                $CI->lang->load('jquery');
                show_error($CI->lang->line($line));            
        }

}

// END CI_Jquery class

/* End of file Jquery.php */
/* Location: ./system/application/libraries/Jquery.php */

?>