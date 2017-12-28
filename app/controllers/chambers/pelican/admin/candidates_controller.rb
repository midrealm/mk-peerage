class Chambers::Pelican::Admin::CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  helper_method :peerage

  def index
    @candidates = Candidate.where(peerage_type: :pelican)
  end
  def new
    @candidate = Candidate.new(peerage_type: :pelican)
  end
  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.vote = false;
    if @candidate.save
      redirect_to chambers_pelican_candidate_path(@candidate)
    else
      render :new
    end
  end
  def edit
    @candidate = Candidate.find(params[:id])
    raise "Access Denied" unless @candidate.pelican?
  end
  def update
    @candidate = Candidate.find(params[:id])
    raise "Access Denied" unless @candidate.pelican?
    if @candidate.update(candidate_params)
      redirect_to chambers_pelican_candidate_path(@candidate)
    else
      render :edit
    end
  end
  def destroy
    @candidate = Candidate.find(params[:id])
    raise "Access Denied" unless @candidate.pelican?
    @candidate.destroy
    redirect_to chambers_pelican_admin_candidates_path
  end
  
  private
  def candidate_params
    params.require(:candidate).permit(:sca_name, :profile_pic, :group_id, :vote, :peerage_type, :specialty_detail, {:specialty_ids => [] }, {:peer_ids => [] })
  end
  def authorize_admin
    authorize! :manage, :pelican
  end
  def peerage
    :pelican
  end
  def self.controller_path
    'chambers/peerage/admin/candidates'
  end
end
