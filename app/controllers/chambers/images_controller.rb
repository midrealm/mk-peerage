module Chambers
  class ImagesController < ApplicationController
    before_action :authenticate_user!
    def create
      @image = Image.new(image_params)
      
      if @image.save
        flash[:notice] = "Image Upload Successful"
        candidate = Candidate.find(params['image']['candidate_id'])
        redirect_to chambers_candidate_path(candidate.order,candidate)
      else
        flash[:notice] = "Image Upload Unsuccessful"
      end
    end
    private
    def image_params
      params.require(:image).permit(:candidate_id, :image)
    end
  end
end
