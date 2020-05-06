require "rails_helper"
describe "Get /" do
  it "shows home page" do
    get "/"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Order of the Laurel')
  end
  it "for logged in pelican does not show browse pelican candidates by specialties" do
      pelican = create(:pelican_user)
      sign_in(pelican)
      get "/"
      expect(response.body).not_to include('chambers/pelican/specialties')  
  end
  it "for logged in laurel shows browse laurel candidates by specialties" do
      laurel = create(:laurel_user)
      sign_in(laurel)
      get "/"
      expect(response.body).to include('chambers/laurel/specialties')  
  end
end
