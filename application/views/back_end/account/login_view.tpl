<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../../css/loginStyle.css" rel="stylesheet" type="text/css" />
<title>Đăng nhập</title>
</head>

<body>
<div id="wrap">
	<div id="top_main">
		<div id="top_left"></div>
        <div id="top_center"></div>
    	<div id="top_right"></div>
    </div><!-- end top main -->
	<div id="main">
    	
    	<div id="left">
        	<div id="logo">
            	<a href="#"><img src="../../../images/logo.jpg" width="170" height="31" /></a>
            </div>
            <div id="intro">
            	<p>Sổ liên lạc điện tử <a href="#">neoSchool</a> là giải pháp được thiết kế riêng biệt nhằm giúp các trường học số hóa thông tin học tập, điểm số, cũng như các tin tức khác và gửi đến phụ huynh học sinh một cách nhanh chóng và dễ dàng thông qua tin nhắn <a href="#">SMS</a></p>
            </div><!-- end intro -->
        </div><!-- end left -->
        
        <div id="right">
        	<h3>Đăng nhập</h3>
        	<!---<?php echo validation_errors();  ?>-->
        	<?php echo form_open('back_end/account/DoLogin')?>
       	  	  	<p>Tài Khoản:</p>
       	  	  	<input name="username" class="text_field" type="text" />
       	  	  	<?php echo form_error('username');?>
                <p>Mật Khẩu:</p><input name="password" class="text_field" type="password" />
                <?php echo form_error('password');?>
				<?php $this->load->view('back_end/group/group_login_view.tpl')?>
                <input name="remember" type="checkbox" id="checkbox" value="Ghi nh&#7899; &#273;&#259;ng nh&#7853;p" />Ghi nhớ đăng nhập
                <input name="login" id="btn_login" type="submit" value="&#272;&#259;ng nh&#7853;p" />
                
            </form>
            <a href="#">Quên mật khẩu?</a>
        </div><!-- end right -->
        <div style="clear:both"></div>
        
    </div><!-- end main -->
    
    <div id="bot_main">
		<div id="bot_left"></div>
       	<div id="bot_center"></div>
    	<div id="bot_right"></div>
        <div id="shadow">
    		<img src="../../../images/shadow.png" width="1001" height="21" />
    	</div><!--- end shadow -->
   	</div><!-- end top main -->
    
    <div id="copy_right">
		Copyright © Neoschool
    </div>
    <div style="clear:both"></div>
</div><!-- end wrap -->
</body>
</html>
