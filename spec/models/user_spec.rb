require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
RSpec.describe User, "slug" do
  it "returns appropriate slug link" do
    user = create(:user, sca_name: 'John Doe')
    expect(user.slug).to eq('John_Doe')
  end
end
