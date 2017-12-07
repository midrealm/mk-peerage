require "rails_helper"
describe "post /chambers/admin/candidates" do
  it "creates new candidate" do
    admin = create(:pelican_admin)
    sign_in(admin)
    expect(Candidate.count).to eq(0)
    post '/chambers/pelican/admin/candidates', params: { :candidate => {sca_name: 'Dingus McDOOOGLE', peerage_type: :pelican} }
    expect(Candidate.count).to eq(1)
    expect(Candidate.last.pelican?).to be_truthy
  end
  it "sets new candidate vote to false" do
    admin = create(:pelican_admin)
    sign_in(admin)
    post '/chambers/pelican/admin/candidates', params: { :candidate => {sca_name: 'Dingus McDOOOGLE', peerage_type: :pelican} }
    expect(Candidate.first.vote).to be_falsey 
  end
end
