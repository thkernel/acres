$(document).on('turbolinks:load', function(){
	setTimeout(function(){
		$('#notice_wrapper').fadeOut("slow",function(){
			$(this).remove();
		})
	},4500)

	setTimeout(function(){
		$('#alert_wrapper').fadeOut("slow",function(){
			$(this).remove();
		})
	},4500)
})

