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
    redirect_to manage_candidates_path
  end
  def manage
    authorize! :manage, :all
    @candidates = Candidate.all
  end
  
  private
  def candidate_params
    params.require(:candidate).permit(:sca_name, :profile_pic, :group_id, :vote)
  end
end
