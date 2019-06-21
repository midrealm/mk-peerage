module Chambers
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    def edit
      @comment = Comment.find(params[:id]) 
      raise "Access Denied" if @comment.peer.user != current_user
    end
    def update
      comment = Comment.find(params[:id]) 
      candidate = comment.candidate
      raise "Access Denied" if comment.peer.user != current_user
      if comment.update(update_comment_params)
        flash[:success] = 'Comment updated' 
      else
        flash[:error] = 'Cannot edit comment'
      end
      redirect_to chambers_candidate_path(candidate.order,candidate)
    end
    def create
      @comment = Comment.new(comment_params)
      candidate = Candidate.find(@comment.candidate_id)
      @comment.peer = current_user.peer(candidate.peerage_type)
      if @comment.save
        PeerageMailer.comment(current_user,candidate,@comment.text).deliver
        flash[:success] = "Successfully Submitted Comment"
        redirect_to chambers_candidate_path(candidate.order,candidate)
      else
        flash[:error] = "Comment Submission Unsuccessful"
      end
    end
    private
    def comment_params
      params.require(:comment).permit(:candidate_id, :text)
    end
    def update_comment_params
      params.require(:comment).permit(:id, :text)
    end
  end
end
