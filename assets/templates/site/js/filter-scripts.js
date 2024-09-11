$(document).ready(function() {
	let form = $('#filter-form');
	$(document).on('click', 'input[name="group"]', function(){
		form.submit();
	});
	$(document).on('click', 'input[name="categories[]"]', function(){
		form.submit();
	})

	form.on('submit', function() {

		console.log(form.serialize());


		$.ajax({
            type: 'POST',
            url: '/ajax.html',
            data: form.serialize(),
            //data: ({'amount': amount, 'name': name, 'phone': phone, 'item': item}),
            success: function(data) {
				//console.log(data);
				$('#step-1').html(data);
                
                //var ajax_price = $(data).find('.price_shot_box').html();
                //pg_price.replaceWith(ajax_price);;
            }
            ,error: function(jqXHR, textStatus, errorThrown) {
                    alert(textStatus + ' ' + errorThrown);
            }
        });





		return false;
	});		

});