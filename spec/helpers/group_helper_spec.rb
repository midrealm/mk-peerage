require 'rails_helper'
describe GroupHelper do
  describe "laurel_group_url(group)" do
    it "returns the correct output" do
      expect(helper.laurel_group_url('High Haven')).to eq('/laurel/groups/High_Haven') 
    end
  end

  describe "laurel_link(group)" do
    before(:each) do
      kingdom_type = create(:group_type, name: 'Kingdom')      
      region_type = create(:group_type, name: 'Region')      
      barony_type = create(:group_type, name: 'Barony')      
      canton_type = create(:group_type, name: 'Canton')      
      @kingdom = create(:group, name: 'the Middle', group_type: kingdom_type)
      @region = create(:group, name: 'North Oaken', group_type: region_type, parent_id: @kingdom.id)
      @barony = create(:group, name: 'High Haven', group_type: barony_type, parent_id: @region.id)
      @canton = create(:group, name: 'The Barrows', group_type: canton_type, parent_id: @barony.id)
    end 
    it "handles a Kingdom" do
      expect(helper.laurel_link(@kingdom)).to eq('<a href="/laurel/groups/the_Middle">Kingdom of the Middle</a>')
    end
    it "handles a Region" do
      expect(helper.laurel_link(@region)).to eq('<a href="/laurel/groups/North_Oaken">Region of North Oaken</a>')
    end
    it "handles a Barony" do
      expect(helper.laurel_link(@barony)).to eq('<a href="/laurel/groups/High_Haven">Barony of High Haven</a>, <a href="/laurel/groups/North_Oaken">Region of North Oaken</a>')
    end
    it "handles a Canton" do
      expect(helper.laurel_link(@canton)).to eq('<a href="/laurel/groups/The_Barrows">The Barrows</a>, <a href="/laurel/groups/High_Haven">Canton of High Haven</a>, <a href="/laurel/groups/North_Oaken">Region of North Oaken</a>')
    end
  end
end
