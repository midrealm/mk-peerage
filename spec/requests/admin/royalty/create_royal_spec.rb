require "rails_helper"
describe "post /chambers/admin/royalty" do
  it "creates new royal" do
    laurel = create(:user, sca_name: 'Mundugus Jones', role: 'admin')
    sign_in(laurel)
    expect(User.count).to eq(1)
    post '/chambers/admin/royalty', params: { :royal => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
    expect(User.count).to eq(2)
  end
  it "sets defaults for new royal" do
    royal = create(:user, sca_name: 'Mundugus Jones', role: 'admin')
    sign_in(royal)
    post '/chambers/admin/royalty', params: { :royal => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
    expect(User.last.royalty).to be_truthy
  end
  it "shows generates slug for new royal" do
    laurel = create(:user, sca_name: 'Mundugus Jones', role: 'admin')
    sign_in(laurel)
    post '/chambers/admin/royalty', params: { :royal => {sca_name: 'Heregyð Ketilsdóttir', email: 'dingus@doogleson.com'} }
    expect(User.last.slug).to eq('heregyd_ketilsdottir')
  end
  it "sends change password email to new royal" do
    laurel = create(:user, sca_name: 'Mundugus Jones', role: 'admin')
    sign_in(laurel)
    post '/chambers/admin/royalty', params: { :royal => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
    email = ActionMailer::Base.deliveries.last
    expect(email.to[0]).to eq('dingus@doogleson.com')
    expect(email.body).to include('Welcome to the Order of the Laurel Website')
  end
end
