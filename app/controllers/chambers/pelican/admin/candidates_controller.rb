class Chambers::Pelican::Admin::CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  helper_method :peerage

  def index
    @candidates = Candidate.where(peerage_type: :pelican)
    render  template: 'chambers/peerage/admin/candidates/index'
  end
  def new
    @candidate = Candidate.new(peerage_type: :pelican)
    render  template: 'chambers/peerage/admin/candidates/new'
  end
  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.vote = false;
    if @candidate.save
      redirect_to chambers_laurel_candidate_path(@candidate)
    else
      render :new
    end
  end
  def edit
    @candidate = Candidate.find(params[:id])
    render  template: 'chambers/peerage/admin/candidates/edit'
  end
  def update
    @candidate = Candidate.find(params[:id])
    if @candidate.update(candidate_params)
      redirect_to chambers_laurel_candidate_path(@candidate)
    else
      render :edit
    end
  end
  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy
    redirect_to chambers_laurel_candidates_path
  end
  
  private
  def candidate_params
    params.require(:candidate).permit(:sca_name, :profile_pic, :group_id, :vote, :peerage_type, :specialty_detail, {:specialty_ids => [] }, {:peer_ids => [] })
  end
  def authorize_admin
    authorize! :manage, :pelican
  end
  def peerage
    'pelican'
  end
end
