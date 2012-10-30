<div class="wrapper">
            <div id="header">
                <div class="content">
                    <div class="logo">
                        <a href="#" title="">
                            <img src="../../images/logo.png" alt="logo"/>
                        </a>
                    </div>
                    
                    <ul class="main-nav">
                        <li>
                            <a class="active" href="" title="">Trang Chủ</a>
                        </li>
                        <li>
                            <a href="" title="">Trường & Lớp</a>
                        </li>
                        <li>
                            <a href="" title="">Học Sinh/Sinh Viên</a>
                        </li>
                        <li>
                            <a href="" title="">Nội Dung</a>
                        </li>
                        <li>
                            <a href="" title="">Cấu Hình</a>
                        </li>
                    </ul>
                    
                    <div class="welcome">
                        <a href="#" title="ads">Xin chào:  <span>Nguyễn Xuân Minh</span></a>
                        <a class="out" href="<?php echo base_url();?>index.php/back_end/account/logout" title="Thoát" onclick="return confirm('Bạn có chắc chắn thoát?')">Đăng Xuất</a>
                    </div>
                    
                    <div class="cl"></div>
                </div>
            </div>
            
            <div id="toobar">
                <div class="content">
                    
                    <div class="filter">
                        <select id="truong" name="truong">
                            <option value="">Trường</option>
                            <option value="KHTN">KHTN</option>
                            <option value="BK">BK</option>
                        </select>
                        <select id="namhoc" name="namhoc">
                            <option value="">Năm học</option>
                            <option value="KHTN">KHTN</option>
                            <option value="BK">BK</option>
                        </select>
                    </div>
                    
                    <div class="tool">
                        <span>Quản lý Học sinh / Sinh viên</span>
                        
                        <div class="button">
                            <a id="import" href="" title=""><span>Import</span></a>
                            <a id="themmoi" href="" title=""><span>Thêm</span></a>
                            <a id="suadoi" href="" title=""><span>Sừa đổi</span></a>
                            <a class="last" id="xoa" href="" title=""><span>Xóa</span></a>
                        </div>
                        <div class="cl"></div>
                    </div>
                    
                    <div class="cl"></div>
                </div>
            </div>
            
            <div id="container">
                
                <div class="content">
                    
                    <div id="sidebar" class="col-4 left sidebar">
                        <a href="JavaScript:void(0);" id="clslider">close</a>
                        <div class="filter-sort">
                            <select id="dslop" name="dslop">
                                <option value="">Danh sách lớp</option>
                                <option value="KHTN">KHTN</option>
                                <option value="BK">BK</option>
                            </select>
                            <select id="theongay" class="vlast" name="theongay">
                                <option value="">Năm học</option>
                                <option value="KHTN">KHTN</option>
                                <option value="BK">BK</option>
                            </select>
                            <div class="cl"></div>
                        </div>
                        
                        <div class="danhsach-scroll">
                            <h2>Danh sách sinh viên</h2>
                            <ul class="scrollbar_wp">
                                <li><a href="" title="">Võ văn tèo</a></li>
                                <li><a href="" title="">trần kim phụng</a></li>
                                <li><a href="" title="">Trần Minh Trí</a></li>
                                <li><a href="" title="">Dương khang</a></li>
                                <li><a href="" title="">Trương vô kị</a></li>
                                <li><a href="" title="">Châu bá thông</a></li>
                                <li><a href="" title="">Dương quá</a></li>
                                <li><a href="" title="">tiểu long nữ</a></li>
                                <li><a href="" title="">nhạc mất quần</a></li>
                                <li><a href="" title="">Độc cô cầu bại</a></li>
                                <li><a href="" title="">Thánh Cô Cô</a></li>
                                <li><a href="" title="">Lệnh Hồ Xung</a></li>
                            </ul>
                            
                            <div class="cl"></div>
                        </div>
                        
                        
                        <div class="cl"></div>
                    </div>
                    
                    
                    <div id="noidungchinh" class="noidungchinh">
                        
                        <div class="tabbar">
                            <h5>Điểm và thông tin</h5>
                            
                            <div class="bottom">
                                <a href="" title="">Gửi tin nhắn theo danh sách</a>
                                <a href="" title="">Gửi tin nhắn SMS</a>
                            </div>
                            
                            <div class="cl"></div>
                        </div>
                        
                        <div class="gird">
                            <?php $this->load->view('back_end/'.$LoadController.'/'.$LoadAction.'.tpl')?>
                            <div class="cl"></div>
                        </div>
                            
                        
                        <div class="tabbar f-tabbar">
                            
                        </div>
                        
                        <div class="cl"></div>
                    </div>
                    
                    <div class="cl"></div>
                </div>
                
            </div>
            
            
        </div>