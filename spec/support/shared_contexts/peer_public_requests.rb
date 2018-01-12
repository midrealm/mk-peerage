require "rails_helper"

shared_examples_for "the outside world's view of a peerage" do |peerage|

    let(:factory) { peerage.to_sym }

    describe "Get /#{peerage}/#{peerage.upcase}_NAME/contact" do
        it "shows contact page for given #{peerage}" do
            peer = create(factory, sca_name: "Mundungus Smith")
            get "/#{peerage}/mundungus_smith/contact"
            expect(response).to have_http_status(:success)
            expect(response.body).to include("Contact Mundungus Smith")
        end
    end

    describe "Get /#{peerage}/groups" do
        it "shows list of groups and link to specific group" do
            group = create(:group, name: "High Haven", slug: "high_haven")
            create(factory, group: group)
            get "/#{peerage}/groups"
            expect(response).to have_http_status(:success)
            expect(response.body).to include("/groups/high_haven")
        end
        it "renders tree of groups" do
            group = create(:group, name: "High Haven", slug: "high_haven")
            child = create(:group, name: "The Barrows", slug: "the_barrows", parent_id: group.id)
            grand_child = create(:group, name: "Poopland", slug: "poopland", parent_id: child.id)
            create(factory, group: grand_child)
            get "/#{peerage}/groups"
            expect(response.body).to include("/groups/high_haven")
            expect(response.body).to include("/groups/the_barrows")
            expect(response.body).to include("/groups/poopland")
        end
    end

    describe "Get /#{peerage}/groups" do
        it "shows list of groups and link to specific group" do
            group = create(:group, name: "High Haven", slug: "high_haven")
            peer = create(factory, group: group)
            get "/#{peerage}/groups/high_haven"
            expect(response).to have_http_status(:success)
            expect(response.body).to include(peer.sca_name)
        end
        it "does not show non-#{peerage}s" do
            group = create(:group, name: "High Haven", slug: "high_haven")
            royal = create(:royal, group: group)
            get "/#{peerage}/groups/high_haven"
            expect(response).to have_http_status(:success)
            expect(response.body).not_to include(royal.sca_name)
        end
        it "shows list of child groups" do
            group = create(:group, name: "High Haven", slug: "high_haven")
            child = create(:group, name: "The Barrows", slug: "the_barrows", parent_id: group.id)
            grand_child = create(:group, name: "Poopland", slug: "poopland", parent_id: child.id)
            create(factory, group: grand_child)
            get "/#{peerage}/groups/high_haven"
            expect(response.body).not_to include("/#{peerage}/groups/high_haven")
            expect(response.body).to include("/#{peerage}/groups/the_barrows")
            expect(response.body).to include("/#{peerage}/groups/poopland")
        end
    end

    describe "Get /#{peerage}/roll_of_honor" do
        it "shows list of #{peerage}" do
            get "/#{peerage}/roll_of_honor"
            expect(response).to have_http_status(:success)
            expect(response.body).to include("Roll of Honor")
        end
        it "only shows #{peerage} (not royalty)" do
            create(factory, sca_name: "Mistress Mindy")
            create(:royal, sca_name: "Duke Ducky")
            get "/#{peerage}/roll_of_honor"
            expect(response.body).to include("Mistress Mindy")
            expect(response.body).not_to include("Duke Ducky")
        end
    end

    describe "Get /#{peerage}/#{peerage.upcase}_NAME" do
        it "shows #{peerage} page" do
            create(factory, sca_name: "Mundungus Smith")
            get "/#{peerage}/mundungus_smith"
            expect(response).to have_http_status(:success)
            expect(response.body).to include("Mundungus Smith")
        end
    end
end
