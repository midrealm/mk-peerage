class Chambers::Admin::CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def index
    @candidates = Candidate.where(peerage_type: peerage)
  end
  def new
    @candidate = Candidate.new(peerage_type: peerage)
  end
  def create
    @candidate = Candidate.new(candidate_params)
    attach_profile_pic
    @candidate.vote = false;
    if @candidate.save
      redirect_to chambers_candidate_path(peerage,@candidate)
    else
      render :new
    end
    
  end
  def edit
    @candidate = Candidate.find(params[:id])
    check_candidate_order
  end
  def update
    @candidate = Candidate.find(params[:id])
    check_candidate_order
    @candidate.assign_attributes(candidate_params)
    attach_profile_pic
    if @candidate.save
      redirect_to chambers_candidate_path(peerage,@candidate)
    else
      render :edit
    end
  end
  def destroy
    @candidate = Candidate.find(params[:id])
    check_candidate_order 
    @candidate.destroy
    redirect_to chambers_admin_candidates_path(peerage)
  end

  
  private
  def check_candidate_order
    raise "Access Denied" unless @candidate.peerage_type == peerage.to_s
  end

  def candidate_params
    params.require(:candidate).permit(:sca_name, :group_id, :vote, :peerage_type, :specialty_detail, {:specialty_ids => [] }, {:peer_ids => [] })
  end

  def authorize_admin
    authorize! :manage, peerage
  end
  def attach_profile_pic
    if params["candidate"]["profile_pic"].present?
      headers, data = params["candidate"]["profile_pic"].split(',')
      headers =~ /^data:(.*?)$/
      content_type = Regexp.last_match(1).split(';base64').first
      @candidate.profile_pic.attach(io: StringIO.new(Base64.decode64(data)), filename: Time.current.to_i.to_s, content_type: content_type) 
    end
  end

  def self.controller_path
    'chambers/peerage/admin/candidates'
  end
end
