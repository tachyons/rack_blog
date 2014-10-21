$(document).ready(function(){
    $(".close_button").css("visibility", "hidden");
    function linkify(inputText) {
        var replacedText, replacePattern1, replacePattern2, replacePattern3;

        //URLs starting with http://, https://, or ftp://
        replacePattern1 = /(\b(https?|ftp):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/gim;
        replacedText = inputText.replace(replacePattern1, '<a href="$1" target="_blank">$1</a>');

        //URLs starting with "www." (without // before it, or it'd re-link the ones done above).
        replacePattern2 = /(^|[^\/])(www\.[\S]+(\b|$))/gim;
        replacedText = replacedText.replace(replacePattern2, '$1<a href="http://$2" target="_blank">$2</a>');

        //Change email addresses to mailto:: links.
        replacePattern3 = /(([a-zA-Z0-9\-\_\.])+@[a-zA-Z\_]+?(\.[a-zA-Z]{2,6})+)/gim;
        replacedText = replacedText.replace(replacePattern3, '<a href="mailto:$1">$1</a>');

        return replacedText;
    }
	$("#post_input").keyup(function(){
  		var input = $('#post_input'), count = 0, limit = 120;
    	count = $.trim(input.val()).length;
  		remaining = limit - count;
  		if(remaining>=0){
            $("#success_message").text(remaining+" character remaining");
            $("#error_status").empty();
            $('#send_button').removeAttr('disabled');
  		} else {
      		$('#send_button').attr('disabled','disabled');
      		$("#success_message").empty();
      		$("#error_status").text(remaining +" character limt exceeds");
  		}	
  	});
    $(document).on({
        mouseenter: function () {
             $(this).find(".close_button").css("visibility", "visible");
        },
        mouseleave: function () {
             $(this).find(".close_button").css("visibility", "hidden");
        }
    }, ".post");

    $(document).on('click','.close_button',function(){
        $(this).parent().fadeTo(300,0,function(){
          $(this).remove();
    });
});
});