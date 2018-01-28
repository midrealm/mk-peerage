class Chambers::DocumentsController < ApplicationController
  before_action :authenticate_user!
  def create
    document = Document.new(document_params)
    if document.save
      flash[:notice] = "Document Upload Successful"
      candidate = Candidate.find(params['document']['candidate_id'])
      redirect_to chambers_candidate_path(candidate.order,candidate)
    else
      flash[:notice] = "Document Upload Unsuccessful"
    end
  end
  private
  def document_params
    peerage = Candidate.find(params['document']['candidate_id']).peerage_type 
    peer = current_user.peer(peerage)
    params.require(:document).permit(:candidate_id, :document).merge(peer_id: peer.id)
  end
end