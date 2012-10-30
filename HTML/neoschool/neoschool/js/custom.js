function togglesidebar() {
	// Toggle the sidebar visibility
	$('#clslider').toggle(function() {

		$(this).animate({
			"right" : "-=5px"
		}, "2000");
		
		$('#sidebar').animate({
			"right" : "-=0px"
		}, "2000");
		
		$(this).animate({
			"right" : "-=40px"
		}, "4000");
		
		$('#sidebar').animate({
			"left" : "-=190px"
		}, "4000");
		
		$('#noidungchinh').animate({
			"marginLeft" : "-=180px"
		}, "10000");

	}, function() {
		
		$('#noidungchinh').animate({
			"marginLeft" : "+=180px"
		}, "10000");
		
		$('#sidebar').animate({
			"left" : "+=190px"
		}, "4000");
		
		$(this).animate({
			"right" : "+=40px"
		}, "4000").animate({
			"right" : "+=5px"
		}, "2000");
		

	});

}





$(document).ready(function(){
	$('.scrollbar_wp').jScrollPane(
        {
            verticalDragMinHeight: 40,
			verticalDragMaxHeight: 50,
			horizontalDragMinWidth: 10,
			horizontalDragMaxWidth: 10,
            showArrows: false
            //verticalGutter: 10
            
        }
    );
    
    togglesidebar();
    
    $('ul li:first-child').addClass('first');
	$('ul li:last-child').addClass('last');
    
	
});

 