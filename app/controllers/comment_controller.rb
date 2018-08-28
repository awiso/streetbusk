class CommentController < ApplicationController
  def create
    @performance = Performance.find(params_comment[:performance_id])
    @comment = Comment.new(params_comment)
    @comment.user = current_user
    @comment.save

    respond_to do |format|
      format.html { redirect_to performance_path(@performance) }
      format.js
    end

    authorize @comment

  end

  private

  def params_comment
    params.require(:comment).permit(:comment_text, :performance_id)
  end
end
