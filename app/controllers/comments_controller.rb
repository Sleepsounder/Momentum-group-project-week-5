class CommentsController < ApplicationController
  before_action :find_commentable
  def new
    @comment = Comment.new
  end

  def create
    if !current_user then 
      redirect_to new_session_path, notice: 'You must be logged in to add a comment'
    else
    @comment= @commentable.comments.new comment_params
    @comment.save 
    redirect_to @comment
    end
  end

  def destroy
  end

  def show
    
    find_comment_parent
    redirect_to "/stories/#{@commentable.story_id}"
  end

  def edit
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :username, :story_id)
  end

  def find_comment_parent
    @commentable = Comment.find_by_id(params[:id])
  end
  def find_commentable
    
    @commentable= Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Story.find_by_id(params[:story_id]) if params[:story_id]
  end
end
