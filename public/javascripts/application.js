// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){


   //all initalizer functions
   var app = {
		autocompletefor: function(){

		  $( "#history_item_name" ).autocomplete({
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
						$( "#history_item_name").val( ui.item.label );
						$( "#history_item_id").val( ui.item.id );
					return false;
					}

				});
		}

   }; //close var app

   //load functions
   app.autocompletefor();



   // bof sale --------------------------------------------------------


   //bof of cloning
   $("#sale_add_item").click(function(){

     var original_data  = $("#append div:last-child input[type='text']:first").attr('id');
     	original_data = original_data.substring(27);
     var num = parseInt(original_data.slice(0,original_data.indexOf("_")));
     var newNum  = new Number(num + 1);
     var newDiv = $('#salediv' ).clone();

	 var sale_attributes = 'sale_sale_items_attributes_';
	 var name_attributes = 'sale[sale_items_attributes][';

	 var r_item_delete = newDiv.children('.receiving_deleteitem').attr('id','sale_deleteitem' + newNum)
	 var item_name = newDiv.children('.item_name').attr('id', sale_attributes + newNum + '_name').attr('name', name_attributes + newNum +'][name]');
	 var item_id = newDiv.children('.item_id').attr('id', sale_attributes + newNum + '_item_id').attr('name', name_attributes + newNum +'][item_id]');
     var quantity_purchased = newDiv.children('.quantity_purchased').attr('id', sale_attributes + newNum + '_quantity_purchased').attr('name', name_attributes + newNum +'][quantity_purchased]');
     var item_unit_price = newDiv.children('.item_unit_price').attr('id', sale_attributes + newNum +'_item_unit_price').attr('name', name_attributes + newNum +'][item_unit_price]');
     var discount_percent = newDiv.children('.discount_percent').attr('id', sale_attributes + newNum +'_discount_percent').attr('name', name_attributes + newNum +'][discount_percent]');
	var amount = newDiv.children('#amount0_').attr('id', 'amount' + newNum + "_")



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

	//click add payment
	$(".addpayment").click(function(){
		$("#sale_submit").show().removeAttr('disabled');
	});
	//sale submit disable
	$("#sale_submit").hide().attr('disabled','disabled');



   //eof of cloning

   // eof sale --------------------------------------------------------

	//bof receiving
   $("a#receive_add_item").click(function(){

     var original_data  = $("#receive_append div:last-child input[type='text']:first").attr('id');
     	original_data = original_data.substring(37);
     var rlength = parseInt(original_data.slice(0,original_data.indexOf("_")));
     var rlength  = new Number(rlength + 1);

     var receive = $('#receive_append div:last-child').clone();
	 var r_attributes = 'receiving_receiving_items_attributes_';
	 var r_name_attr = 'receiving[receiving_items_attributes][';

	 var r_item_delete = receive.children('.receiving_deleteitem').attr('id','receiving_deleteitem' + rlength)
	 var r_name = receive.children('.r_name').attr('id', r_attributes + rlength + '_name').attr('name', r_name_attr + rlength +'][name]').val("");
	 var r_item_id = receive.children('.r_item_id').attr('id', r_attributes + rlength + '_item_id').attr('name', r_name_attr + rlength +'][item_id]').val("");
	 var r_cost_price = receive.children('.r_cost_price').attr('id', r_attributes + rlength + '_cost_price').attr('name', r_name_attr + rlength +'][cost_price]').val( 0 );
	 var r_quantity = receive.children('.r_quantity').attr('id', r_attributes + rlength + '_quantity').attr('name', r_name_attr + rlength +'][quantity]').val( 0 );
     var r_discount = receive.children('.r_discount').attr('id', r_attributes + rlength + '_discount').attr('name', r_name_attr + rlength +'][discount]').val( 0 );
	 var r_amount = receive.children('.r_amount').attr('id', r_attributes + rlength + '_amount').attr('name', r_name_attr + rlength +'][amount]').val( 0 );


    //clone receiving
    $("#receive_append").append(receive);

	return false;
    }); //close receiving cloning




	//bof autocomplete for suppliers
	$( "#receiving_deletecustomer" ).hide();
	$( "#receiving_supplier_id" ).hide();
	$( "#supplier_name" ).autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "/suppliers/searchsupplier.js",
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
			$( "#receiving_supplier_fullname" ).html( ui.item.label );
			$( "#receiving_supplier_id" ).val( ui.item.id );
			$( "#receiving_deletecustomer" ).show();
			$( this ).hide();
			return false;
		}

	});
	//eof autocomplete for suppliers

	//bof link to delete supplier
	$("#receiving_deletecustomer").click(function(){
		$("#receiving_supplier_id" ).val('');
		$("#receiving_supplier_fullname").hide();
		$("#supplier_name" ).show().val('');
		$(this).hide();
		return false;
	});
	//eof link to delete supplier


 });
   		//bof autocomplete for first column


		function create_autocomplete(id){
		var temp_name = id.substring(27);
		var current_id = temp_name.slice(0,temp_name.indexOf("_"));

		var sale_attr = "#sale_sale_items_attributes_";
		  $( sale_attr + current_id + "_name").autocomplete({
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
						$( sale_attr + current_id + "_name").val( ui.item.label );
						return false;
					},

					select: function( event, ui ) {
						$( sale_attr + current_id + "_name").val( ui.item.label );
						$( sale_attr + current_id + "_item_id").val( ui.item.id );
						$( sale_attr + current_id + "_item_unit_price").val( ui.item.unit_cost );
						$( sale_attr + current_id + "_quantity_purchased").val( 1 );
						$(".cancelsale").show();
						return false;
					}

				});

		}

   		//eof autocomplete for first column


 	//autocomplete for first row on receiving items
	function create_autocomplete2(id){
		var temp_name = id.substring(37);
		var current_id = temp_name.slice(0,temp_name.indexOf("_"));
		var receiving_attributes = "#receiving_receiving_items_attributes_";
		var temp_id = receiving_attributes + current_id;

		$( temp_id + "_name").autocomplete({
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
					$( temp_id + "_name").val( ui.item.label );
						return false;
				},

				select: function( event, ui ) {
					$( temp_id + "_name" ).val( ui.item.label );
					$( temp_id + "_item_id" ).val( ui.item.id );
					$( temp_id + "_unit_price" ).val( ui.item.unit_cost );
					$( temp_id + "_quantity" ).val(1);
					$( temp_id + "_cost_price" ).val( ui.item.cost_price );
					$( temp_id + "_amount" ).val( ui.item.unit_cost );
					return false;
				}

			});
	}//close autocomplete function 2



 function getthefield(id){
 	var c = id.substring(37);
 	var current_id = c.slice(0,c.indexOf("_"));
 	var returndata = "#" + id.substring(0,37);
	var cost_price = parseFloat($(returndata + current_id + "_cost_price").val());
	var quantity =  $(returndata + current_id + "_quantity").val();
	$(returndata + current_id + "_amount").val(quantity * cost_price);
 }

 function getthefield2(id){
 	var c = id.substring(27);
 	var current_id = c.slice(0,c.indexOf("_"));
 	var returndata = "#" + id.substring(0,27);
	var cost_price = parseFloat($(returndata + current_id + "_item_unit_price").val());
	var quantity =  $(returndata + current_id + "_quantity_purchased").val();
	var discount_percent = parseFloat($(returndata + current_id + "_discount_percent").val());
	if (discount_percent < 0)	 discount_percent = 0 ;
	total  =  (cost_price * quantity) - ((cost_price * quantity) * (discount_percent/100))
	$(returndata + current_id + "_amount").val(total);
 }

 function removediv(link){
 	var size = $("#receive_append #receive").size();
 	if (size == 1) return false;
 	 $(link).closest(".receive").remove();
 }

 function removediv2(link){
 	var size = $("#append div#salediv").size();
 	 if ( size == 1 ) return false;
 	$(link).closest("#salediv").remove();
 }

