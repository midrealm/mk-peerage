class Chambers::DocumentsController < ApplicationController
  before_action :authenticate_user!

  def create
    document = Document.new(candidate_id: document_params[:candidate_id], document: document_params[:document],
       name: document_params[:name], description: document_params[:description], peer_id: peer.id)
    candidate = Candidate.find(params['document']['candidate_id'])
    if document.save
      flash[:success] = "Your document was uploaded successfully"
    else
      flash[:error] = "Your document was not able to be uploaded: #{document.errors.full_messages.to_sentence}"
    end
      redirect_to "#{chambers_candidate_path(candidate.order,candidate)}#documents"
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
