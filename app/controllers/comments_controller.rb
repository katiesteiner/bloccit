class CommentsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    authorize @comment
    if @comment.save
      redirect_to [@topic, @post], notice: "Comment was saved"
    else
      redirect_to [@topic, @post], notice: "There was an error saving the comment. Please try again."
    end
  end

private

def comment_params
  params.require(:comment).permit(:body)
end
