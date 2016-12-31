class PostsController < ApplicationController

  #TODOs

  #search box
  #popular posts

  #end

  #impressionist :actions=>[:show,:index]
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  #before_action :get_popular, only: [:index, :show]
  before_action :authenticate_admin!, only: [:edit, :update, :new, :destroy]

  def index
  	@posts = Post.all.order("created_at DESC").page params[:page]
  end

  def admin
  end

  def edit
  end

  def search
    #@posts = 
  end

  def update
  	if @post.update_attributes(post_params)
   		flash[:notice] = "Successfully updated post!"
    	redirect_to post_path(@post)
    else
     	flash[:alert] = "Error updating post!"
    	render :edit
    end
  end

  def show
    #impressionist(@post)
    @related_posts = Post.tagged_with(@post.tag_list, any: true).where.not(:id => @post.id ).order("created_at DESC").limit(5)
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Successfully created post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error creating new post!"
      render :new
    end
  end


  def destroy
  	if @post.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to posts_path
    else
      flash[:alert] = "Error updating post!"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :subtitle, :avatar, :tag_list)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end
end
