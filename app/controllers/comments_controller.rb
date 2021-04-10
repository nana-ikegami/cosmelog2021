class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to cosme_path(@comment.cosme)
    else
      @cosme = @comment.cosme
      @comments = @cosme.comments
      render 'cosmes/show'
    end
  end

  def show
    @comments = @cosme.comments
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, cosme_id: params[:cosme_id])
  end
end
