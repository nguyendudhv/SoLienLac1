

(function($) {
	$.fn.validationEngineLanguage = function() {};
	$.validationEngineLanguage = {
		newLang: function() {
			$.validationEngineLanguage.allRules = 	{"required":{    			// Add your regex rules here, you can take telephone as an example
						"regex":"none",
						"alertText":"* Bạn chưa nhập thông tin",
						"alertTextCheckboxMultiple":"* Please select an option",
						"alertTextCheckboxe":"* Bạn chưa đồng ý quy định của Muốn Rao Vặt"},
					"length":{
						"regex":"none",
						"alertText":"*Giữa ",
						"alertText2":" Và ",
						"alertText3": " ký tự cho phép"},
					"maxCheckbox":{
						"regex":"none",
						"alertText":"* Checks allowed Exceeded"},
						"yahoo":{
            "regex":"none",
            "alertText":"*Bạn chưa nhập địa chỉ yahoo "},	
					"minCheckbox":{
						"regex":"none",
						"alertText":"* Please select ",
						"alertText2":" options"},	
					"confirm":{
						"regex":"none",
						"alertText":"* Mật khẩu không chính xác"},		
					"telephone":{
						"regex":"/^[0-9\-\(\)\ ]+$/",
						"alertText":"* Số phone không chính xác"},	
					"email":{
						"regex":"/^[a-zA-Z0-9_\.\-]+\@([a-zA-Z0-9\-]+\.)+[a-zA-Z0-9]{2,4}$/",
						"alertText":"* Email không chính xác"},	
					"date":{
                         "regex":"/^[0-9]{4}\-\[0-9]{1,2}\-\[0-9]{1,2}$/",
                         "alertText":"* Invalid date, must be in YYYY-MM-DD format"},
					"onlyNumber":{
						"regex":"/^[0-9\ ]+$/",
						"alertText":"* Chỉ được nhập số"},	
					"noSpecialCaracters":{
						"regex":"/^[0-9a-zA-Z]+$/",
						"alertText":"* Không được sử dụng ký tự đạc biệt"},	
					"ajaxUser":{
						"file":"validateUser.php",
						"extraData":"name=eric",
						"alertTextOk":"* This user is available",	
						"alertTextLoad":"* Loading, please wait",
						"alertText":"* This user is already taken"},	
					"ajaxName":{
						"file":"validateUser.php",
						"alertText":"* This name is already taken",
						"alertTextOk":"* This name is available",	
						"alertTextLoad":"* Loading, please wait"},		
					"onlyLetter":{
						"regex":"/^[a-zA-Z\ \']+$/",
						"alertText":"* Chỉ được nhập ký tự"}
					}	
		}
	}
})(jQuery);

$(document).ready(function() {	
	$.validationEngineLanguage.newLang()
});