require "rails_helper"
describe "patch /users/edit_password" do
  it "edits password for signed in laurel, and redirects to profile page" do
    laurel = create(:laurel_user)
    expect(User.first.valid_password?(laurel.password)).to be_truthy
    sign_in(laurel)
    patch "/users/edit/password", params: { :user => {current_password: laurel.password, password: 'blahblah', password_confirmation: 'blahblah'} }
    expect(response).to redirect_to '/chambers'
    expect(User.first.valid_password?('blahblah')).to be_truthy
  end

  it "does not change password for not matching new_password confirmation" do
    laurel = create(:laurel_user)
    password = laurel.password
    expect(User.first.valid_password?(password)).to be_truthy
    sign_in(laurel)
    patch "/users/edit/password", params: { :user => {current_password: password, password: 'blahblah', password_confirmation: 'not_the_same'} }
    expect(User.first.valid_password?(password)).to be_truthy
    expect(response.body).to include('Change your password')
  end

  it "does not change password with not matching current password" do
    laurel = create(:laurel_user)
    password = laurel.password
    expect(User.first.valid_password?(password)).to be_truthy
    sign_in(laurel)
    patch "/users/edit/password", params: { :user => {current_password: 'incorrect', password: 'blahblah', password_confirmation: 'blahblah'} }
    expect(User.first.valid_password?(password)).to be_truthy
    expect(response.body).to include('Change your password')
  end

  it "redirects if not logged in" do
    get "/users/edit/password"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
