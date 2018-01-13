shared_examples_for "post /chambers/admin/royalty" do |peerage|
  describe "post /chambers/admin/royalty" do
    context "for logged in #{peerage} admin" do
      before(:each) do
        admin = create("#{peerage}_admin".to_sym)
        sign_in(admin)
      end
      it "creates new royal" do
        expect(User.count).to eq(1)
        post '/chambers/admin/royalty', params: { :royal => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
        expect(User.count).to eq(2)
      end
      it "sets defaults for new royal" do
        post '/chambers/admin/royalty', params: { :royal => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
        expect(User.last.royalty).to be_truthy
      end
      it "shows generates slug for new royal" do
        post '/chambers/admin/royalty', params: { :royal => {sca_name: 'Heregyð Ketilsdóttir', email: 'dingus@doogleson.com'} }
        expect(User.last.slug).to eq('heregyd_ketilsdottir')
      end
      it "sends change password email to new royal" do
        post '/chambers/admin/royalty', params: { :royal => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
        email = ActionMailer::Base.deliveries.last
        expect(email.to[0]).to eq('dingus@doogleson.com')
        expect(email.body).to include('Welcome to the Middle Kingdom Peerage Website')
      end
    end
  end
end
