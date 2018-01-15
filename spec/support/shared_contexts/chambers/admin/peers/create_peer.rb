shared_examples_for "post /chambers/PEERAGE/admin/peers" do |peerage,other_peerage|
  describe "post /chambers/#{peerage}/admin/peers" do
    context "for signed in admin #{peerage}" do
      before(:each) do
        admin = create("#{peerage}_admin".to_sym)
        sign_in(admin)
        @params = { peerage.to_sym => {id: "", sca_name: "Dingus McDOOOGLE", email: "dingus@doogleson.com"} }
      end
      it "creates new #{peerage}" do
        expect(User.count).to eq(1)
        expect(Peer.count).to eq(1)
        post "/chambers/#{peerage}/admin/peers", params: @params
        expect(User.count).to eq(2)
        expect(Peer.count).to eq(2)
      end
      it "sets defaults for new #{peerage}" do
        post "/chambers/#{peerage}/admin/peers", params: @params
        expect(Peer.last.sca_name).to eq("Dingus McDOOOGLE") 
        expect(Peer.last.active).to be_truthy 
        expect(Peer.last.vigilant).to be_truthy 
        expect(User.last.royalty).to be_falsy
      end
      it "handles true for vigilant for new #{peerage}" do
        post "/chambers/#{peerage}/admin/peers", params: { peerage.to_sym => {id: "", sca_name: "Dingus McDOOOGLE", vigilant: true, email: "dingus@doogleson.com"} }
        expect(Peer.last.vigilant).to be_truthy 
        
      end
      it "handles false for vigilant for new #{peerage}" do
        post "/chambers/#{peerage}/admin/peers", params: { peerage.to_sym => {id: "", sca_name: "Dingus McDOOOGLE", vigilant: false, email: "dingus@doogleson.com"} }
        expect(Peer.last.sca_name).to eq("Dingus McDOOOGLE") 
        expect(Peer.last.vigilant).to be_falsey 
      end
      it "shows generates slug for new #{peerage}" do
        post "/chambers/#{peerage}/admin/peers", params: { peerage.to_sym => {id: "", sca_name: "Heregyð Ketilsdóttir", email: "dingus@doogleson.com"} }
        expect(User.last.slug).to eq("heregyd_ketilsdottir")
      end
      it "sends welcome and change password email to new #{peerage}" do
        post "/chambers/#{peerage}/admin/peers", params: { peerage.to_sym => {id: "", sca_name: "Dingus McDOOOGLE", email: "dingus@doogleson.com"} }
        email = ActionMailer::Base.deliveries.last
        expect(email.to[0]).to eq("dingus@doogleson.com")
        expect(email.body).to include("Welcome to the Order of the #{peerage.capitalize}")
      end
      context "for existing #{other_peerage}," do
        before(:each) do
          @other_peer = create("#{peerage}".to_sym, sca_name: "Octavia OtherPeer", email: "octavia_otherpeer@example.com")
          @params = { peerage.to_sym => {id: @other_peer.id, sca_name: "", email: ""} }
        end
        it "adds #{other_peerage} peerage to existing #{peerage}" do
          expect(@other_peer.peers.count).to eq(1)
          post "/chambers/#{peerage}/admin/peers", params: @params
          expect(@other_peer.peers.count).to eq(2)
        end  
  
        it "keeps exisitng peer;s password when adding new peerage" do 
          old_encrypted_password = User.last.encrypted_password
          post "/chambers/#{peerage}/admin/peers", params: @params
          expect(User.last.encrypted_password).to eq(old_encrypted_password)
        end
        it "sends welcome note to new #{other_peerage}/#{peerage}" do
          post "/chambers/#{peerage}/admin/peers", params: @params
          email = ActionMailer::Base.deliveries.last
          expect(email.to[0]).to eq("octavia_otherpeer@example.com")
          expect(email.body).to include("have access to #{peerage.capitalize}ate content.")
        end
      end
    end
    it "doesn't allow non admins to create new users" do
      non_admin = create("#{peerage}".to_sym)
      sign_in(non_admin)    
      expect{post "/chambers/#{peerage}/admin/peers", params: { peerage.to_sym => {sca_name: "Dingus McDOOOGLE", email: "dingus@doogleson.com"} } }.to raise_error(CanCan::AccessDenied)
    end
  end
end
