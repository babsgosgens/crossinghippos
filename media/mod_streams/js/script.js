var count = 0;
var items = 6;

$(document).ready(function() {
    $('a.left').click(function(event) {
    	event.preventDefault();
    	if (count > 0){
			$('.stream').animate({
           		left: '+=10%'
        	}, 400);
        	count--;
        }
    });

    $('a.right').click(function(event) {
    	event.preventDefault();
    	if (count < items){
			$('.stream').animate({
           		left: '-=10%'
        	}, 400);
        	count++;
        }
    });
});