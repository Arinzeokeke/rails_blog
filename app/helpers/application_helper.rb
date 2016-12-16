module ApplicationHelper
	def get_correct_path(comment)
		if comment.commentable.class == Post 
			post_comment_path(comment.commentable, comment) 
		else 
			comment_comment_path(comment.commentable, comment)
		end
	end
end
