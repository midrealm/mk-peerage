require "rails_helper"
describe "post /chambers/add_new_laurel" do
  it "shows edit page for laurel" do
    laurel = create(:user, sca_name: 'Mundugus Jones', role: 'admin')
    sign_in(laurel)
    expect(User.count).to eq(1)
    post '/users', params: { :user => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
    expect(User.count).to eq(2)
  end
  it "sends change password email to new laurel" do
    laurel = create(:user, sca_name: 'Mundugus Jones', role: 'admin')
    sign_in(laurel)
    post '/users', params: { :user => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
    email = ActionMailer::Base.deliveries.last
    expect(email.to[0]).to eq('dingus@doogleson.com')
    expect(email.body).to include('Welcome to the Order of the Laurel')
  end
end
