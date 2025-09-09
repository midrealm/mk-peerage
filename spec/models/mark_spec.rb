require 'rails_helper'

RSpec.describe Mark, type: :model do
    it "returns first admin of a given order" do
      admin = create(:mark_admin)
      expect(Mark.order_secretary).to eq(admin.mark)
    end

    it "creates a Mark peer" do
      mark_peer = create(:mark_peer)
      expect(mark_peer.type).to eq("Mark")
      expect(mark_peer).to be_valid
    end
end
