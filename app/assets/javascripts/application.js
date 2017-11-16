// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
$(document).ready(function(){
	$('.create_gift').click(function(e){
		e.preventDefault();
		$.ajax({
			url: '/search',
			type: 'POST',
			data: {
				'authenticity_token': $('input[name=authenticity_token]').val(),
				'gift': {
					keyword: $('input#gift_name').val()
				}
			}
		})


	})

	$('#carousel').carousel({
		interval: 2000,
		slidesToShow: 3,
		autoplay: true
	});

	// $('.show-participant').click(function(event){
	// 	event.preventDefault();
	// 	$(this).parent().parent().toggle();
	// })
	// $(".hide-participant").click(function(){
	// 	$(this).parent().parent().toggle();
	// })

	// $("#secret-santa").on("submit", function(event){
	// 	$('#secret').show();
	// })

	$("#add-participants").on("submit", function(event) {
    event.preventDefault();

    var $obj = $(this);
    var url = $obj.attr("action");
    var method = $obj.attr("method");
    var data = $obj.serialize();

    $.ajax({
      url: url,
      method: method,
      data: data
    })

    .done(function(response) {
      $("#participant-list").append("<li>" + response.first_name + " " + response.last_name + "</li>");
    })
  })

})
