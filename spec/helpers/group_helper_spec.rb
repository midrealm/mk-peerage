require 'rails_helper'
describe GroupHelper do
  describe "laurel_group_url(group)" do
    it "returns the correct output" do
      expect(helper.laurel_group_url('High Haven')).to eq('/laurel/groups/High_Haven') 
    end
  end

  describe "full_group_link(group, group_path)" do
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
      expect(helper.full_group_link(@kingdom,'laurel_group_path')).to eq('<a href="/laurel/groups/the_middle">Kingdom of the Middle</a>')
    end
    it "handles a Region" do
      expect(helper.full_group_link(@region,'laurel_group_path')).to eq('<a href="/laurel/groups/north_oaken">Region of North Oaken</a>')
    end
    it "handles a Barony" do
      expect(helper.full_group_link(@barony,'laurel_group_path')).to eq('<a href="/laurel/groups/high_haven">Barony of High Haven</a>, <a href="/laurel/groups/north_oaken">Region of North Oaken</a>')
    end
    it "handles a Canton" do
      expect(helper.full_group_link(@canton,'laurel_group_path')).to eq('<a href="/laurel/groups/the_barrows">The Barrows</a>, <a href="/laurel/groups/high_haven">Canton of High Haven</a>, <a href="/laurel/groups/north_oaken">Region of North Oaken</a>')
    end
  end
end
