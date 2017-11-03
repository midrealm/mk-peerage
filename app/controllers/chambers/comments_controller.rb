module Chambers
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    def create
      @comment = Comment.new(comment_params)
      @comment.peer = current_user.peer
      if @comment.save
        LaurelMailer.comment(current_user,Candidate.find(@comment.candidate_id),@comment.text).deliver
        flash[:notice] = "Successfully Submitted Comment"
        redirect_to "/chambers/candidates/#{params['comment']['candidate_id']}"
      else
        flash[:notice] = "Comment Submission Unsuccessful"
      end
    end
    private
    def comment_params
      params.require(:comment).permit(:candidate_id, :text)
    end
  end
end
