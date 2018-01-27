module Chambers
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    def create
      @comment = Comment.new(comment_params)
      candidate = Candidate.find(@comment.candidate_id)
      @comment.peer = current_user.peer(candidate.peerage_type)
      if @comment.save
        PeerageMailer.comment(current_user,candidate,@comment.text).deliver
        flash[:notice] = "Successfully Submitted Comment"
        redirect_to chambers_candidate_path(candidate.order,candidate)
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
