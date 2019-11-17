require 'rails_helper'
RSpec.describe Laurel, "self.order_secretary" do
    it "returns first admin of a given order" do
      admin = create(:laurel_admin)
      expect(Laurel.order_secretary).to eq(admin.laurel)
    end
end
