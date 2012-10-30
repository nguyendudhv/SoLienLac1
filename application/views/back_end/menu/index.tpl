<script type="text/javascript" src="../../js/jquery.validate.min.js"></script>
<script type="text/javascript" src="../../js/messages_vi.js"></script>
<script type="text/javascript" >
	$(document).ready(function () {            
            var source ={
				datatype: "json",
				datafields:[{ name: 'UserName' },{ name: 'Email' },{ name: 'AccountId' }],
				url: '<?php echo base_url()."index.php/back_end/account/list_accout_ajax";?>'
			};
			var dataAdapter = new $.jqx.dataAdapter(source, {
                downloadComplete: function (data, status, xhr) { },
                loadComplete: function (data) { },
                loadError: function (xhr, status, error) { }
            });
            $("#popupWindow").jqxWindow({  height:150, width: 300, resizable: false, theme: 'classic', autoOpen: false,isModal: true, modalOpacity: 0.3});
			$("#jqxgrid_account").jqxGrid({
				source: dataAdapter,
				theme: 'classic',
				width: 900,
				height:400,
                selectionmode: 'multiplerowsextended',
                //groupable: true,
                //groups: ['UserName'],
                enablehover:true,
                sortable: true,
                pageable: true,
                //autoheight: true,
                showtoolbar: true,
                 rendertoolbar: function (toolbar) {
                    var me = this;
                    var container = $("<div style='margin: 5px;'></div>");
                    var span = $("<span style='float: left; margin-top: 5px; margin-right: 4px;'>Nhóm người dùng: </span>");
                    var input = $("<div id='jqxGroup' style='height: 23px; float: left; width: 223px;'></div>");
                    toolbar.append(container);
                    container.append(span);
                    container.append(input);
                },
                columnsresize: true,
                showstatusbar: true,
                renderstatusbar: function (statusbar) {
                    // appends buttons to the status bar.
                    var container = $("<div style='overflow: hidden; position: relative; margin: 5px;'></div>");
                    var addButton = $("<div style='float: left; margin-left: 5px;'><img id='addRow' style='position: relative; margin-top: 2px;' src='../../images/add.png'/><span style='margin-left: 4px; position: relative; top: -3px;'>Thêm</span></div>");
                    var deleteButton = $("<div style='float: left; margin-left: 5px;'><img style='position: relative; margin-top: 2px;' src='../../images/close.png'/><span style='margin-left: 4px; position: relative; top: -3px;'>Xóa</span></div>");
                    var reloadButton = $("<div style='float: left; margin-left: 5px;'><img style='position: relative; margin-top: 2px;' src='../../images/refresh.png'/><span style='margin-left: 4px; position: relative; top: -3px;'>Tải lại</span></div>");
                    var searchButton = $("<div style='float: left; margin-left: 5px;'><img style='position: relative; margin-top: 2px;' src='../../images/search.png'/><span style='margin-left: 4px; position: relative; top: -3px;'>Tìm kiếm</span></div>");
                    container.append(addButton);
                    container.append(deleteButton);
                    container.append(reloadButton);
                    container.append(searchButton);
                    statusbar.append(container);
                    addButton.jqxButton({theme: 'classic', width: 90, height: 20 });
                    deleteButton.jqxButton({ theme: 'classic', width: 65, height: 20 });
                    reloadButton.jqxButton({ theme: 'classic', width: 65, height: 20 });
                    searchButton.jqxButton({ theme: 'classic', width: 100, height: 20 });
                    // add new row.
                    addButton.click(function (event) {
                    	$('#popupWindow').jqxWindow('setTitle', 'Thêm tài khoản');
                        $("#popupWindow").jqxWindow('show');
                        $('input[type=text]').val('');
                    });
                    // delete selected row.
                    deleteButton.click(function (event) {
                        var selectedrowindex = $("#jqxgrid_account").jqxGrid('getselectedrowindex');
                        var rowscount = $("#jqxgrid_account").jqxGrid('getdatainformation').rowscount;
                        if (selectedrowindex >= 0 && selectedrowindex < rowscount) {
                            var id = $("#jqxgrid").jqxGrid('getrowid', selectedrowindex);
                            $("#jqxgrid_account").jqxGrid('deleterow', id);
                        }
                    });
                    // reload grid data.
                    reloadButton.click(function (event) {
                        $("#jqxgrid_account").jqxGrid({ source: getAdapter() });
                    });
                    // search for a record.
                    /*searchButton.click(function (event) {
                        var offset = $("#jqxgrid").offset();
                        $("#jqxwindow").jqxWindow('open');
                        $("#jqxwindow").jqxWindow('move', offset.left + 30, offset.top + 30);
                    });*/
                    
                },
				columns: [
					{ text: '', datafield: 'STT', columntype: 'checkbox', width: 40,
                      renderer: function () {
                          return '<div style="margin-left: 10px; margin-top: 5px;"></div>';
                      }},
					{ text: 'Tên đăng nhập', datafield: 'UserName', width: 400 },
					{ text: 'Email', datafield: 'Email', width: 300 },
					{ text: 'Thao tac', datafield: 'AccountId', cellsrenderer: function () {
					return "<img id='editRow' src='../../images/edit.gif'/ style='cursor:pointer;margin:3px 5px' title=\"Sua\"><img id='deleteRow' src='../../images/delete.gif'/ style='cursor:pointer;margin:3px 5px' title=\"Xoa\"/>";
                     //return "<img id='editRow' src='../../images/edit.gif'/ style='cursor:pointer;margin:3px 5px' title=\"Sua\"><img id='deleteRow' src='../../images/delete.gif'/ style='cursor:pointer;margin:3px 5px' title=\"Xoa\" onclick=\"return confirm(\'Ban co chac chan xoa hay khong?')\"/>";
	                }
                 },
				]
			});
			
			$('img#editRow').live('click',function(){
				var offset = $("#jqxgrid_account").offset();
                $("#popupWindow").jqxWindow({ position: { x: parseInt(offset.left) + 300, y: parseInt(offset.top) + 100} });
                $('#popupWindow').jqxWindow('setTitle', 'Cập nhập thông tin tài khoản');
				var selectedRowsCount = $("#jqxgrid_account").jqxGrid('getselectedrowindexes');
                var rowData = $("#jqxgrid_account").jqxGrid('getrowdata',selectedRowsCount);
                $('input#AccountId').val(rowData.AccountId);
                $('input#UserName').val(rowData.UserName);
                $('input#Email').val(rowData.Email);
                $("#popupWindow").jqxWindow('show');
			});
			
			$('img#deleteRow').live('click',function(){
				if(confirm('Bạn có chắc chắn xóa hay không?'))
				{
					var selectedRowsCount = $("#jqxgrid_account").jqxGrid('getselectedrowindexes');
	                var rowData = $("#jqxgrid_account").jqxGrid('getrowdata',selectedRowsCount);
	                $.ajax({
		            url: '<?php echo base_url();?>/index.php/back_end/account/DeleteAccountById?id='+rowData.AccountId,
		            type:'POST',
		            success: function(d){
		            		if(d=="0")
		            		{
		            			alert('Khong ton tai account');
		            		}
		            		else if(d=="2")
		            		{
		            			alert('Xoa thanh cong');
		            			$("#jqxgrid_account").jqxGrid('updatebounddata');
		            		}
		                    else
		                    {
		                    	alert('Khong the xoa');
		                    }
		                } // End of success function of ajax form
		            }); // End of ajax call 
	            }
			});
			 // initialize the popup window and buttons.
            
            $("#Cancel").jqxButton({ theme: 'classic' });
            $("#Save").jqxButton({ theme: 'classic' });
            $("#Cancel").click(function () {
                 $("#popupWindow").jqxWindow('hide');
            });
            
            //Validate form
            $("#frmUpdateAccount").validate({
				errorElement: "span", // Định dạng cho thẻ HTML hiện thông báo lỗi
				submitHandler: function() {
					var selectedRowsCount = $("#jqxgrid_account").jqxGrid('getselectedrowindexes');
		            var rowData = $("#jqxgrid_account").jqxGrid('getrowdata',selectedRowsCount);
	                $.ajax({
			            //url: '<?php echo base_url();?>/index.php/back_end/account/UpdateAccountById/'+rowData.AccountId+'/'+$('#UserName').val()+'/'+$('#Email').val(),
			            url: rowData.AccountId!=0?'<?php echo base_url();?>/index.php/back_end/account/UpdateAccountById?id='+rowData.AccountId+'&username='+$('#UserName').val()+'&email='+$('#Email').val():'<?php echo base_url();?>/index.php/back_end/account/InsertAccount?username='+$('#UserName').val()+'&email='+$('#Email').val(),
			            type:'POST',
			            success: function(d){
			            		if(d=="0")
			            		{
			            			$("#popupWindow").jqxWindow('hide');
			            			alert('Khong ton tai account');
			            		}
			            		else if(d=="1")
			            		{
			            			$("#popupWindow").jqxWindow('hide');
			            			$("#jqxgrid_account").jqxGrid('updatebounddata');
			            			//alert('Cap nhap thanh cong');
			            			
			            		}
			            		else
			            		{
			            			$("#popupWindow").jqxWindow('hide');
			            			alert('Cap nhap khong thanh cong');
			            		}
			                } 
			            }); // End of ajax call
				},
				rules: {
					cpassword: {
						equalTo: "#password" // So sánh trường cpassword với trường có id là password
					},
					min_field: { min: 5 }, //Giá trị tối thiểu
					max_field: { max : 10 }, //Giá trị tối đa
					range_field: { range: [4,10] }, //Giá trị trong khoảng từ 4 - 10
					rangelength_field: { rangelength: [4,10] } //Chiều dài chuỗi trong khoảng từ 4 - 10 ký tự
				}
			});
			//Bind Group data
			var sourceGroup =
                {
                    datatype: "json",
                    datafields: [
                        { name: 'GroupId' },
                        { name: 'GroupName' }
                    ],
                    id: 'id',
                    url: '<?php echo base_url()."index.php/back_end/group/GetAllJson";?>',
                    async: false
                };
                var dataAdapter1 = new $.jqx.dataAdapter(sourceGroup);
                // Create a jqxDropDownList
                $("#jqxGroup").jqxDropDownList({ selectedIndex: 0, source: dataAdapter1, displayMember: "GroupName", valueMember: "GroupId", width: 200, autoDropDownHeight: true, theme: 'classic' });
                $('#jqxGroup').bind('select', function (event) {
			    var args = event.args;
			    if (args) {
			        var index = args.index;
			        var item = args.item;
			        var label = item.label;
			        var value = item.value;
			    }                        
			});
                
                
        });
</script>
<div id="jqxgrid_account">    
</div>
 <div id="pager">
 </div>
 <div id="popupWindow">
            <div>Cập nhập thông tin tài khoản</div>
            <div style="overflow: hidden;">
            <form id='frmUpdateAccount'>
	                <table>
	                    <tr>
	                    	<input type="hidden" id="AccountId" />
	                        <td align="right">Username:</td>
	                        <td align="left"><input id="UserName" type="text" class="required" /></td>
	                    </tr>
	                    <tr>
	                        <td align="right">Email:</td>
	                        <td align="left"><input id="Email" type="text" class="required email" /></td>
	                    </tr>
	                    <tr>
	                        <td align="right"></td>
	                        <td style="padding-top: 10px;" align="right">
	                        <input style="margin-right: 5px;" type="submit" id="Save" value="Save" />
	                        <input id="Cancel" type="button" value="Cancel" />
	                        </td>
	                    </tr>
	                </table>
            	
            </form>
            </div>
       </div>
		