require "rails_helper"
describe "post /chambers/pelican/admin/pelicans" do
  context "for signed in admin pelican" do
    before(:each) do
      admin = create(:pelican_admin)
      sign_in(admin)
      @params = { :pelican => {id: '', sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
    end
    it "creates new pelican" do
      expect(User.count).to eq(1)
      expect(Peer.count).to eq(1)
      post '/chambers/pelican/admin/pelicans', params: @params
      expect(User.count).to eq(2)
      expect(Peer.count).to eq(2)
    end
    it "sets defaults for new pelican" do
      post '/chambers/pelican/admin/pelicans', params: @params
      expect(Pelican.last.sca_name).to eq('Dingus McDOOOGLE') 
      expect(Pelican.last.active).to be_truthy 
      expect(Pelican.last.vigilant).to be_truthy 
      expect(User.last.royalty).to be_falsy
    end
    it "handles true for vigilant for new pelican" do
      post '/chambers/pelican/admin/pelicans', params: { :pelican => {id: '', sca_name: 'Dingus McDOOOGLE', vigilant: true, email: 'dingus@doogleson.com'} }
      expect(Pelican.last.vigilant).to be_truthy 
      
    end
    it "handles false for vigilant for new pelican" do
      post '/chambers/pelican/admin/pelicans', params: { :pelican => {id: '', sca_name: 'Dingus McDOOOGLE', vigilant: false, email: 'dingus@doogleson.com'} }
      expect(Pelican.last.sca_name).to eq('Dingus McDOOOGLE') 
      expect(Pelican.last.vigilant).to be_falsey 
    end
    it "shows generates slug for new pelican" do
      post '/chambers/pelican/admin/pelicans', params: { :pelican => {id: '', sca_name: 'Heregyð Ketilsdóttir', email: 'dingus@doogleson.com'} }
      expect(User.last.slug).to eq('heregyd_ketilsdottir')
    end
    it "sends change password email to new pelican" do
      post '/chambers/pelican/admin/pelicans', params: { :pelican => {id: '', sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
      email = ActionMailer::Base.deliveries.last
      expect(email.to[0]).to eq('dingus@doogleson.com')
      expect(email.body).to include('Welcome to the Order of the Laurel')
    end
    context 'for existing laurel,' do
      before(:each) do
        @laurel = create(:user, sca_name: 'Lucy Laurel', email: 'lucy_laurel@example.com')
        @params = { :pelican => {id: @laurel.id, sca_name: '', email: ''} }
      end
      it "adds laurel peerage to existing pelican" do
        expect(@laurel.peers.count).to eq(1)
        post '/chambers/pelican/admin/pelicans', params: @params
        expect(@laurel.peers.count).to eq(2)
      end  

      it "keeps exisitng peer's password when adding new peerage" do 
        old_encrypted_password = User.last.encrypted_password
        post '/chambers/pelican/admin/pelicans', params: @params
        expect(User.last.encrypted_password).to eq(old_encrypted_password)
      end
      it "sends welcome note to new laurel/pelican" do
        post '/chambers/pelican/admin/pelicans', params: @params
        email = ActionMailer::Base.deliveries.last
        expect(email.to[0]).to eq('lucy_laurel@example.com')
        expect(email.body).to include('have access to Pelicanate content.')
      end
    end
  end
  it "doesn't allow non admins to create new users" do
    non_admin = create(:user)
    sign_in(non_admin)    
    expect{post '/chambers/pelican/admin/pelicans', params: { :pelican => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} } }.to raise_error(CanCan::AccessDenied)
  end
end
