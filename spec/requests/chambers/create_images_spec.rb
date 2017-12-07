require "rails_helper"
describe "post /chambers/images" do
  it "creates new image for candidate" do
    laurel = create(:user)
    sign_in(laurel)
    cand = create(:candidate)
    expect(Image.count).to eq(0)
    post '/chambers/images', params: { :image => {candidate_id: cand.id, image: 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7'} }
    expect(Image.count).to eq(1)
  end
end
