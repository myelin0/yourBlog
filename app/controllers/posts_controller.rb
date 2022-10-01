class PostsController < ApplicationController
  def index
    @user = get_user_id params[:user_id]
    @posts = @user.posts.includes((:comments))
  end

  def show
    @user = get_user_id params[:user_id]
    @post = @user.posts.includes(comments: [:user]).find(params[:id])
    @comment = Comment.new
    @current_user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    new_post = current_user.posts.new(post_params)
    if new_post.save
      redirect_to user_post_path(new_post.user, new_post)
      flash[:success] = 'New post added succesfully.'
    else
      render 'new'
      flash[:error] = 'Error adding a post.'
    end
  end

  def update
    post = Post.find(params[:id])
    new_like = Like.new(user: current_user, post:)
    if new_like.valid?
      new_like.save
      redirect_to user_post_path(post.user, post)
    else
      redirect_to user_post_path(post.user, post)
      flash[:error] = 'Error liking post.'
    end
  end

  private

  def get_user_id(user_id)
    if user_id
      User.find(params[:user_id])
    else
      current_user
    end
  end
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
