require "rails_helper"
describe "post /chambers/admin/candidates" do
  it "creates new candidate" do
    laurel = create(:user, sca_name: 'Mundugus Jones', role: 'admin')
    sign_in(laurel)
    expect(Candidate.count).to eq(0)
    post '/chambers/admin/candidates', params: { :candidate => {sca_name: 'Dingus McDOOOGLE'} }
    expect(Candidate.count).to eq(1)
  end
  it "sets new candidate vote to false" do
    laurel = create(:user, sca_name: 'Mundugus Jones', role: 'admin')
    sign_in(laurel)
    post '/chambers/admin/candidates', params: { :candidate => {sca_name: 'Dingus McDOOOGLE'} }
    expect(Candidate.first.vote).to be_falsey 
  end
end
