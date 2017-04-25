module Admin 
  class CandidatesController < ApplicationController
    before_action :authenticate_user!
    def index
      authorize! :manage, :all
      @candidates = Candidate.all
    end
    def new
      @candidate = Candidate.new
      authorize! :manage, :all
    end
    def create
      @candidate = Candidate.new(candidate_params)
      @candidate.vote = false;
      if @candidate.save
        redirect_to candidate_path(@candidate)
      else
        render :new
      end
      
    end
    def edit
      authorize! :manage, :all
      @candidate = Candidate.find(params[:id])
    end
    def update
      @candidate = Candidate.find(params[:id])
      if @candidate.update(candidate_params)
        redirect_to candidate_path(@candidate)
      else
        render :edit
      end
    end
    def destroy
      @candidate = Candidate.find(params[:id])
      @candidate.destroy
      redirect_to admin_candidates_path
    end
    
    private
    def candidate_params
      params.require(:candidate).permit(:sca_name, :profile_pic, :group_id, :vote, :specialty_detail, {:specialty_ids => [] }, {:user_ids => [] })
    end
  end
end
