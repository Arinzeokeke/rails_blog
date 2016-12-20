class CommentsController < ApplicationController
	#before_action :get_post
	before_action :get_comment, only: [:destroy]
	before_action :find_commentable
  before_action :authenticate_admin!, only: [:destroy]
	def create
    @comment = @commentable.comments.new comment_params

    if @comment.save
      respond_to do |format|
        format.html do
          	flash[:success] = 'Comment posted.'
          	redirect_to :back
        end
        format.js # JavaScript response
      end      
    else
      redirect_to :back, notice: "Your comment wasn't posted!"
    end
  end

	def destroy
		@comment.destroy
		respond_to do |format|
      		format.html do
        		flash[:success] = 'Comment deleted.'
        		redirect_to :back
      		end
      		format.js # JavaScript response
    	end
	end

	private
	def get_post
		@post = Post.friendly.find(params[:post_id])
	end

	def get_comment
		@comment = Comment.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:name, :body)
	end
	def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.friendly.find(params[:post_id]) if params[:post_id]
    end
end
