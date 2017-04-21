class CandidatesController < ApplicationController
  before_action :authenticate_user!
  def index
    @vote_candidates = Candidate.where(vote: true)
    @watch_candidates = Candidate.where(vote: false)
  end
  def new
    @candidate = Candidate.new
    authorize! :manage, :all
  end
  def show
    @candidate = Candidate.find(params[:id])
    @comment = Comment.new
  end
  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to candidate_path(@candidate)
    else
      render :new
    end
    
  end
  private
  def candidate_params
    params.require(:candidate).permit(:sca_name, :profile_pic, :group_id)
  end
end
