require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:apprenticeships) }
  it { should have_many(:laurels).through(:apprenticeships) }
  
  it { should have_many(:advocacies) }
  it { should have_many(:candidates).through(:advocacies) }
  it { should have_many(:specializations) }
  it { should have_many(:specialties).through(:specializations) }
end
RSpec.describe User, "slug" do
  it "returns appropriate slug link" do
    user = create(:user, sca_name: 'John Doe')
    expect(user.slug).to eq('John_Doe')
  end
end
