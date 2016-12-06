

@question_upvote =	"<form method='post' action='/question_votes'>\
		<input type='hidden' value= <%= current_user.id %> name='question_vote[user_id]'>\
		<input type='hidden' value= <%= @question.id %> name='question_vote[question_id]'>\
		<input type='hidden' value= 1 name='question_vote[vote]'>\
		<input type='submit' class='btn btn-success' value='Upvote'>\
	</form>"



@question_downvote = "<form method='post' action='/question_votes'>\
		<input type='hidden' value= <%= current_user.id %> name='question_vote[user_id]'>\
		<input type='hidden' value= <%= @question.id %> name='question_vote[question_id]'>\
		<input type='hidden' value= -1 name='question_vote[vote]'>\
		<input type='submit' class='btn btn-warning' value='Downvote'>\
	</form>"