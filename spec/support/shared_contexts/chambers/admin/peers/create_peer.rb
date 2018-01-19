shared_examples_for "post /chambers/PEERAGE/admin/peers" do |peerage,other_peerage|
  describe "post /chambers/#{peerage}/admin/peers" do
    context "for signed in admin #{peerage}" do
      before(:each) do
        admin = create("#{peerage}_admin".to_sym)
        sign_in(admin)
        @params = { peerage.to_sym => {id: "", sca_name: "Dingus McDOOOGLE", email: "dingus@doogleson.com"} }
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
  end
end
