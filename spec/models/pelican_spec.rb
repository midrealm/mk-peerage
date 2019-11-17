require 'rails_helper'
RSpec.describe Pelican, "self.order_secretary" do
    it "returns first admin of a given order" do
      admin = create(:pelican_admin)
      expect(Pelican.order_secretary).to eq(admin.pelican)
    end
end
