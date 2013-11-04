var count = 0;
var items = 6;

jQuery(document).ready(function() {
    jQuery('a.left').click(function(event) {
    	event.preventDefault();
    	if (count > 0){
			jQuery('.stream').animate({
           		left: '+=10%'
        	}, 400);
        	count--;
        }
    });

    jQuery('a.right').click(function(event) {
    	event.preventDefault();
    	if (count < items){
			jQuery('.stream').animate({
           		left: '-=10%'
        	}, 400);
        	count++;
        }
    });
});

console.log('Slider Loaded!');