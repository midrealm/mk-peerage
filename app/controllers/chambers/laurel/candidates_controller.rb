module Chambers
  module Laurel
    class CandidatesController < ApplicationController
      before_action :authenticate_user!
      def index
         @vote_candidates = Candidate.where("peerage_type = ? AND vote = ?",'laurel',true)
         @watch_candidates = Candidate.where("peerage_type = ? AND vote = ?",'laurel',false)
      end

      def show
        @candidate = Candidate.find(params[:id])
        @pr = @candidate.poll_results.last
        @comment = Comment.new
        @image = Image.new
      end

      def poll_comments
        authorize! :read, PollResult
        @candidate = Candidate.find(params[:id])
        @pr = @candidate.poll_results.last
        unless @pr.nil?
          @advisings = Advising.where("candidate_id = ? AND poll_id = ? AND submitted = true", @candidate.id, @pr.poll_id)
        else
          redirect_to chambers_laurel_candidates_path
        end
      end
#      
#      private
#      def candidate_params
#        params.require(:candidate).permit(:sca_name, :profile_pic, :group_id, :vote, :specialty_detail, {:specialty_ids => [] }, {:user_ids => [] })
#      end
    end
  end
end
