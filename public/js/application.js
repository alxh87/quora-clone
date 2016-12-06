$(document).ready(function(){
	$("#answer-form").on("submit", function(event){
		event.preventDefault();
		$.ajax({
			url: "/answer",
			method: "POST",
			dataType: "JSON",
			data: $(this).serialize(),

			success: function(response){
				$("#answer-box").val("");
				$("#answer-list").prepend(

				"<li> \
				<hr>\
				Vote count: <span class='label label-info' style='font-size: 16px' id='ansvote_status_"+ response.answer.id + "'>0</span><p> "+ response.answer.answer +"</p>\
				<div class='btn-group btn-group-xs' role='group' aria-label='...'>\
					<form class='ansvote-btn' method='post' action='/answer_votes' data-id="+ response.answer.id + ">\
						<input type='hidden' value=  "+ response.user.id + "  name='answer_vote[user_id]'>\
						<input type='hidden' value=  "+ response.answer.id+ "  name='answer_vote[answer_id]'>\
						<input type='hidden' value= 1 name='answer_vote[vote]'>\
						<button type='submit' class='btn btn-xs btn-success glyphicon glyphicon-plus'></button>\
					</form>\
					<form class='ansvote-btn' method='post' action='/answer_votes' data-id="+ response.answer.id + ">\
						<input type='hidden' value=  "+ response.user.id + "  name='answer_vote[user_id]'>\
						<input type='hidden' value=  "+ response.answer.id+ "  name='answer_vote[answer_id]'>\
						<input type='hidden' value= -1 name='answer_vote[vote]'>\
						<button type='submit' class='btn btn-xs btn-warning glyphicon glyphicon-minus'></button>\
					</form>\
					<h4><small><a href='/questions/" + response.user.id + "'>" + response.user.name + "</a></small></h4>\
						<a href='/answers/" + response.answer.id + "/edit'>EDIT ANSWER</a>\
						</div>"
				);
			}
		})
	})

	$(".ansvote-btn").on("click", function(){
		event.preventDefault();
		var ans_id = $(this).data('id')
		$.ajax({
			url: "/answer_votes",
			method: "POST",
			dataType: "JSON",
			data: $(this).serialize(),

			success: function(response){
				$("#ansvote_status_"+response.id).html(response.votecount)
			}
		})
	})



})
