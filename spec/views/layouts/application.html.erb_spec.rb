require 'rails_helper'
RSpec.describe "layouts/application.html.erb" do
  it "renders flash success and alert" do
    flash[:success]  = "You were successful"
    flash[:alert]  = "Actually you failed"
    render template: 'layouts/application', locals: { jskit: ''}
    expect(rendered).to have_content("You were successful")
    expect(rendered).to have_content("Actually you failed")
  end
end
