class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    new_comment = current_user.comments.new(post:, text: comments_params)

    if new_comment.valid?
      new_comment.save
      redirect_to user_post_path(post.user, post)
    else
      flash[:error] = 'Error creating comment'
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text)[:text]
  end
end
