require "rails_helper"
describe "Get /users/edit" do
  context "for logged in user" do
    before (:each) do
      @user = create(:user, sca_name: 'Mundungus Smith')
      sign_in(@user)
    end
    it "shows edit page for laurel" do
      get "/users/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Edit Profile')
    end
    it "shows only appropriate specialities" do
      create(:specialty, peerage_type: :laurel, name: 'Laurel Specialty')
      create(:specialty, peerage_type: :pelican, name: 'Pelican Specialty')
      get "/users/edit"
      expect(response.body).to include('Laurel Specialty')
      expect(response.body).not_to include('Pelican Specialty')
    end
    it "shows only peers of given peerage as apprenticed to options" do
      create(:pelican, sca_name: 'Peter Pelican')
      create(:user, sca_name: 'Lucy Laurel')
      get "/users/edit"
      expect(response.body).to include('Lucy Laurel')
      expect(response.body).not_to include('Peter Pelican')
    end
  end
  context "for logged in pelican" do
    before (:each) do
      @pelican = create(:pelican)
      sign_in(@pelican)
    end
    it "shows a Pelican tab" do
      get "/users/edit"
      expect(response.body).to include('#pelican')
    end
    it "shows only pelican appropriate specialities" do
      create(:specialty, peerage_type: :laurel, name: 'Laurel Specialty')
      create(:specialty, peerage_type: :pelican, name: 'Pelican Specialty')
      get "/users/edit"
      expect(response.body).to include('Pelican Specialty')
      expect(response.body).not_to include('Laurel Specialty')
    end
  end
  it "redirects if not logged in" do
    get "/users/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
