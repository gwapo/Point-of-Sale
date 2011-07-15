// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
   // bof sale --------------------------------------------------------
   		//bof autocomplete for first column
   		$("#salediv1").children().val('');
		create_autocomplete(0);

		function create_autocomplete(a){
		  $( "#item_name" + a ).autocomplete({
				source: function(request, response) {
					$.ajax({
						url: "/items/itemlist.js",
						dataType: "json",
						data: {term: request.term},
						success: function( data ) {
						    response( data );
						}
				});
				},
				minLength: 2,
			  	focus: function( event, ui ) {
						$( "#item_name" + a ).val( ui.item.label );
						return false;
					},

					select: function( event, ui ) {
						$( "#item_name" + a ).val( ui.item.label );
						$( "#sale_sale_items_attributes_" + a + "_item_id").val( ui.item.id );
						$( "#sale_sale_items_attributes_" + a + "_item_unit_price").val( ui.item.unit_cost );
						$( "#sale_sale_items_attributes_" + a + "_quantity_purchased").val( 1 );
						$( "#sale_sale_items_attributes_" + a + "_quantity_purchased").val( 1 );
						$( "#amount" + a ).val( ui.item.unit_cost );
						$(".cancelsale").show();
						return false;
					}

				});
		}

   		//eof autocomplete for first column


   //bof of cloning
   $("#add_item").click(function(){

     var num  = $('#append div').length;
     var newNum  = new Number(num + 1);
     var newDiv = $('#salediv' + num ).clone().attr('id','salediv' + newNum);

	 var sale_attributes = 'sale_sale_items_attributes_';
	 var name_attributes = 'sale[sale_items_attributes][';

	 var item_name = newDiv.children('.item_name').attr('id', 'item_name' + newNum).attr('name','item_name' + newNum)
     var item_id = newDiv.children('.item_id').attr('id', sale_attributes + newNum + '_item_id').attr('name', name_attributes + newNum +'][item_id]');
     var quantity_purchased = newDiv.children('.quantity_purchased').attr('id', sale_attributes + newNum + '_quantity_purchased').attr('name', name_attributes + newNum +'][quantity_purchased]');
     var item_unit_price = newDiv.children('.item_unit_price').attr('id', sale_attributes + newNum +'_item_unit_price').attr('name', name_attributes + newNum +'][item_unit_price]');
     var discount_percent = newDiv.children('.discount_percent').attr('id', sale_attributes + newNum +'_discount_percent').attr('name', name_attributes + newNum +'][discount_percent]');
	var amount = newDiv.children('#amount0').attr('id', 'amount' + newNum)


		//autocomplete
		item_name.focus(function(){
			create_autocomplete(newNum);
		});

		//calculate on client side the total amount

		quantity_purchased.keyup(function(){
			var price = parseFloat($(amount).val());
			var unit = parseFloat($(quantity_purchased).val());
			//alert('gg');
			//amount.val(price*unit);
		});


	//set all clone fields to blank
	newDiv.children().val('');

     //add box
     $("#append").append(newDiv);
	 return false;
   });

	//bof customers search
		$( "#customer_name" ).autocomplete({
				source: function(request, response) {
					$.ajax({
						url: "/customers/searchcustomer.js",
						dataType: "json",
						data: {term: request.term},
						success: function( data ) {
						    response( data );
						}
				});
				},
				focus: function( event, ui ) {
					$( this).val( ui.item.label );
					return false;
				},
				minLength: 2,
			  	select: function( event, ui ) {
						$( "#fullname" ).html( ui.item.label );
						$( "#sale_customer_id" ).val( ui.item.id );
						$( this ).hide();
						$("#deletecustomer").show();
						return false;
					}

		});

	//delete customer
	$("#deletecustomer").hide();
	$("#deletecustomer").click(function(){
		$( "#sale_customer_id" ).val('');
		$("#fullname").hide();
		$( "#customer_name" ).show().val('');
		$(this).hide();
		return false;
	});

	//cancel payment
	$(".cancelsale").hide();

	//add payment
	$(".addpayment").click(function(){
		$("#sale_submit").show().removeAttr('disabled');
	});
	$("#sale_submit").hide().attr('disabled','disabled');



   //eof of cloning

   // eof sale --------------------------------------------------------
 });

