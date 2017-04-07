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
    byebug
    new_params = candidate_params
    image = Paperclip.io_adapters.for(new_params[:profile_pic])
    image.original_filename = params[:not_included]
    new_params[:profile_pic] = image
    @candidate = Candidate.new(new_params)
    if @candidate.save
      redirect_to candidate_path(@candidate)
    else
      render :new
    end
    
  end
  private
  def candidate_params
    params.require(:candidate).permit(:sca_name, :profile_pic)
  end
end
