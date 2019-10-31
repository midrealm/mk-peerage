class Chambers::Admin::NewsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  def edit
    @news = News.find_or_create_by(peerage_type: peerage)
  end
  def update
    @news = News.find_by(peerage_type: params[:peerage])
    if @news.update(news_params)
      redirect_to chambers_path
    else
      render :edit
    end

  end
  private
  def news_params
    params.require(:news).permit(:id, :body) 
  end
  def authorize_admin
    authorize! :manage, peerage
  end
  def self.controller_path
    'chambers/peerage/admin/news'
  end
end
