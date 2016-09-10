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
					<form method='post' action='/answer_votes'>\
						<input type='hidden' value=  "+ response.user.id + "  name='answer_vote[user_id]'>\
						<input type='hidden' value=  "+ response.answer.id+ "  name='answer_vote[answer_id]'>\
						<input type='hidden' value= 1 name='answer_vote[vote]'>\
						<input type='submit' class='btn btn-xs btn-success' value='Upvote'>\
					</form>\
					<form method='post' action='/answer_votes'>\
						<input type='hidden' value=  "+ response.user.id + "  name='answer_vote[user_id]'>\
						<input type='hidden' value=  "+ response.answer.id+ "  name='answer_vote[answer_id]'>\
						<input type='hidden' value= -1 name='answer_vote[vote]'>\
						<input type='submit' class='btn btn-xs btn-warning' value='Downvote'>\
					</form>\
						ID: " + response.answer.id + "<br>\
						Votecount: 0 <br>" +
						response.answer.answer +"<br>"+
						response.user.id +" "+response.user.name+
						"<a href='/answers/"+response.answer.id+"/edit'> EDIT ANSWER</a>"
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
