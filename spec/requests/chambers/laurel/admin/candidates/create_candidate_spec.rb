require "rails_helper"
describe "post /chambers/laurel/admin/candidates" do
  it "creates new candidate" do
    admin = create(:admin)
    sign_in(admin)
    expect(Candidate.count).to eq(0)
    post '/chambers/laurel/admin/candidates', params: { :candidate => {sca_name: 'Dingus McDOOOGLE', peerage_type: :laurel} }
    expect(Candidate.count).to eq(1)
  end
  it "sets new candidate vote to false" do
    admin = create(:admin)
    sign_in(admin)
    post '/chambers/laurel/admin/candidates', params: { :candidate => {sca_name: 'Dingus McDOOOGLE', peerage_type: :laurel} }
    expect(Candidate.first.vote).to be_falsey 
  end
end
