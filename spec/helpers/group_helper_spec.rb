require 'rails_helper'
describe GroupHelper do

  describe "candidate_region_link(group, peerage)" do
    before(:each) do
      kingdom_type = create(:group_type, name: 'Kingdom')      
      region_type = create(:group_type, name: 'Region')      
      barony_type = create(:group_type, name: 'Barony')      
      canton_type = create(:group_type, name: 'Canton')      
      @kingdom = create(:group, name: 'the Middle', slug: 'the_middle', group_type: kingdom_type)
      @region = create(:group, name: 'North Oaken', slug: 'north_oaken', group_type: region_type, parent_id: @kingdom.id)
      @barony = create(:group, name: 'High Haven', slug: 'high_haven', group_type: barony_type, parent_id: @region.id)
      @canton = create(:group, name: 'The Barrows', slug: 'the_barrows', group_type: canton_type, parent_id: @barony.id)
    end 

    it "handles a region" do
      expect(helper.candidate_region_link(@region, :laurel)).to eq('<a href="/chambers/laurel/groups/north_oaken">North Oaken</a>')
    end
    it "handles a barony" do
      expect(helper.candidate_region_link(@barony, :laurel)).to eq('<a href="/chambers/laurel/groups/north_oaken">North Oaken</a>')
    end
    it "handles a canton" do
      expect(helper.candidate_region_link(@canton, :laurel)).to eq('<a href="/chambers/laurel/groups/north_oaken">North Oaken</a>')
    end
  end
  describe "full_group_link(group, group_path, peerage)" do
    before(:each) do
      kingdom_type = create(:group_type, name: 'Kingdom')      
      region_type = create(:group_type, name: 'Region')      
      barony_type = create(:group_type, name: 'Barony')      
      canton_type = create(:group_type, name: 'Canton')      
      @kingdom = create(:group, name: 'the Middle', slug: 'the_middle', group_type: kingdom_type)
      @region = create(:group, name: 'North Oaken', slug: 'north_oaken', group_type: region_type, parent_id: @kingdom.id)
      @barony = create(:group, name: 'High Haven', slug: 'high_haven', group_type: barony_type, parent_id: @region.id)
      @canton = create(:group, name: 'The Barrows', slug: 'the_barrows', group_type: canton_type, parent_id: @barony.id)
    end 
    it "handles a Kingdom" do
      expect(helper.full_group_link(@kingdom,'group_path','laurel')).to eq('<a href="/laurel/groups/the_middle">Kingdom of the Middle</a>')
    end
    it "handles a Region" do
      expect(helper.full_group_link(@region,'group_path','laurel')).to eq('<a href="/laurel/groups/north_oaken">Region of North Oaken</a>')
    end
    it "handles a Barony" do
      expect(helper.full_group_link(@barony,'group_path','laurel')).to eq('<a href="/laurel/groups/high_haven">Barony of High Haven</a>, <a href="/laurel/groups/north_oaken">Region of North Oaken</a>')
    end
    it "handles a Canton" do
      expect(helper.full_group_link(@canton,'group_path','laurel')).to eq('<a href="/laurel/groups/the_barrows">The Barrows</a>, <a href="/laurel/groups/high_haven">Canton of High Haven</a>, <a href="/laurel/groups/north_oaken">Region of North Oaken</a>')
    end
  end
end
