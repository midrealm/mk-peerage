module Admin
  class RoyaltyController < ApplicationController
    before_action :authenticate_user!
    def new
      authorize! :manage, :all
      @royal = User.new
    end
    def index
      authorize! :manage, :all
      @users = User.where(active: true)
    end
  def create
    @royal = User.new(royal_params)
    pwd = Devise.friendly_token.first(8)  
    @royal.password = pwd
    @royal.active = true
    @royal.royalty = true 
    @royal.laurel = false
    if @royal.save
      redirect_to admin_royalty_index_path
      @royal.send_reset_password_instructions
    else
      render :new
    end
  end
  def edit
    @royal = User.find(params[:id])
  end
  def update
    @royal = User.find(params[:id])
    if @royal.update(update_royal_params)
      redirect_to admin_royalty_index_path  
    else
      render :edit
    end
  end
    private
    def royal_params
      params.require(:royal).permit(:sca_name, :email)
    end
    def update_royal_params
      params.require(:royal).permit(:royalty)
    end
  end
end

