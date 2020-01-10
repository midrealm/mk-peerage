class Chambers::DocumentsController < ApplicationController
  before_action :authenticate_user!

  def create
    document = Document.new(candidate_id: document_params[:candidate_id], document: document_params[:document],
       name: document_params[:name], description: document_params[:description], peer_id: peer.id)
    if document.save
      flash[:success] = "Document Upload Successful"
      candidate = Candidate.find(params['document']['candidate_id'])
      redirect_to "#{chambers_candidate_path(candidate.order,candidate)}#documents"
    else
      flash[:error] = "Document Upload Unsuccessful: #{document.errors.full_messages.to_sentence}"
    end
  end
  private
  def document_params
    params.require(:document).permit(:candidate_id, :document, :name, :description)
  end 
  def peer
    peerage = Candidate.find(params['document']['candidate_id']).peerage_type 
    current_user.peer(peerage)
  end
  def self.controller_path
    'chambers/peerage/documents'
  end
end
