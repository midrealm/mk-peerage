require "rails_helper"
describe "outside world's view of peerage" do

#peerage home page
  describe 'get /laurel' do
    it "shows laurel page" do
      get "/laurel"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Order of the Laurel")
    end 
  end
#contact page for peer
  describe "Get /laurel/LAUREL_NAME/contact" do
      it "shows contact page for given laurel" do
          peer = create(:laurel_user, sca_name: "Mundungus Smith")
          get "/laurel/mundungus_smith/contact"
          expect(response).to have_http_status(:success)
          expect(response.body).to include("Contact Mundungus Smith")
      end
  end

#specialties index
  describe "Get /laurel/specialties" do
    it "shows list of specialties for given peerage where number of peers is greater than 0" do
      peer = create(:laurel_peer)
      spec = create(:specialty, name: 'Earwax Studies', peerage_type: :laurel)
      create(:specialization, peer: peer, specialty: spec) 
      create(:specialty, name: 'Music', peerage_type: :laurel)
      create(:specialty, name: 'Sleeping', peerage_type: :pelican)
      get "/laurel/specialties"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Earwax studies')
      expect(response.body).not_to include('Music')
      expect(response.body).not_to include('Sleeping')
    end
  end

#specialties show
  describe "get /laurel/specialties/:slug" do
    it "shows list of users with given specialty" do
      spec = create(:specialty, name: 'Earwax Studies', peerage_type: :laurel)
      spec2 = create(:specialty, name: 'Music', peerage_type: :laurel)
      laurel_user = create(:laurel_user, sca_name: 'Lucy Laurel')
      create(:specialization, peer: laurel_user.laurel, specialty: spec)
      create(:specialization, peer: laurel_user.laurel, specialty: spec2)
      get "/laurel/specialties/earwax_studies"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Earwax studies')
      expect(response.body).to include('Music')
      expect(response.body).to include('Lucy Laurel')
    end
  end
#groups index
  describe "Get /laurel/groups" do
      it "shows list of groups and link to specific group" do
          group = create(:group, name: "High Haven", slug: "high_haven")
          create(:laurel_user, group: group)
          get "/laurel/groups"
          expect(response).to have_http_status(:success)
          expect(response.body).to include("/groups/high_haven")
      end
      it "renders tree of groups" do
          group = create(:group, name: "High Haven", slug: "high_haven")
          child = create(:group, name: "The Barrows", slug: "the_barrows", parent_id: group.id)
          grand_child = create(:group, name: "Poopland", slug: "poopland", parent_id: child.id)
          create(:laurel_user, group: grand_child)
          get "/laurel/groups"
          expect(response.body).to include("/groups/high_haven")
          expect(response.body).to include("/groups/the_barrows")
          expect(response.body).to include("/groups/poopland")
      end
  end

#groups show
  describe "Get /laurel/groups/:slug" do
      it "shows list of groups and link to specific group" do
          group = create(:group, name: "High Haven", slug: "high_haven")
          peer = create(:laurel_user, group: group)
          get "/laurel/groups/high_haven"
          expect(response).to have_http_status(:success)
          expect(response.body).to include(peer.sca_name)
      end
      it "does not show non-laurels" do
          group = create(:group, name: "High Haven", slug: "high_haven")
          royal = create(:royal, group: group)
          get "/laurel/groups/high_haven"
          expect(response).to have_http_status(:success)
          expect(response.body).not_to include(royal.sca_name)
      end
      it "shows list of child groups" do
          group = create(:group, name: "High Haven", slug: "high_haven")
          child = create(:group, name: "The Barrows", slug: "the_barrows", parent_id: group.id)
          grand_child = create(:group, name: "Poopland", slug: "poopland", parent_id: child.id)
          create(:laurel_user, group: grand_child)
          get "/laurel/groups/high_haven"
          expect(response.body).not_to include("/laurel/groups/high_haven")
          expect(response.body).to include("/laurel/groups/the_barrows")
          expect(response.body).to include("/laurel/groups/poopland")
      end
  end

#peers index
  describe "Get /laurel/roll_of_honor" do
      it "shows list of laurels" do
          get "/laurel/roll_of_honor"
          expect(response).to have_http_status(:success)
          expect(response.body).to include("Roll of Honor")
      end
      it "only shows laurel (not royalty)" do
          create(:laurel_user, sca_name: "Mistress Mindy")
          create(:royal, sca_name: "Duke Ducky")
          get "/laurel/roll_of_honor"
          expect(response.body).to include("Mistress Mindy")
          expect(response.body).not_to include("Duke Ducky")
      end
  end

#peers show
  describe "Get /laurel/LAUREL_NAME" do
      it "shows laurel page; does not show edit link" do
        create(:laurel_user, sca_name: "Mundungus Smith")
        get "/laurel/mundungus_smith"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Mundungus Smith")
        expect(response.body).not_to include('<a href="/users/edit?peerage=laurel">Edit Profile</a>')
      end
      it "shows link to peer edit for logged in peer" do
        laurel_user = create(:laurel_user, sca_name: "Mundungus Smith")
        sign_in(laurel_user)
        get "/laurel/mundungus_smith"
        expect(response.body).to include('<a href="/users/edit?peerage=laurel">Edit Profile</a>')
      end
  end
end
