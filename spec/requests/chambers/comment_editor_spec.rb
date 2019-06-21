require "rails_helper"
describe "get /chambers/comments/id/edit" do
  it "raises access denied when trying to edit someone else's comment" do
    laurel = create(:laurel_peer)
    sign_in(laurel.user)
    laurel_orig_commenter = create(:laurel_peer)
    candidate = create(:laurel_candidate)
    comment = create(:comment, peer: laurel_orig_commenter, candidate: candidate)
    expect{get "/chambers/comments/#{comment.id}/edit"}.to raise_error('Access Denied')
  end

  it "redirects when not-logged in user tries to edit comment" do
    comment = create(:comment)
    get "/chambers/comments/#{comment.id}/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end

describe "patch /chambers/comments/id" do
  it "raises access denied when trying to edit someone else's comment" do
    laurel = create(:laurel_peer)
    sign_in(laurel.user)
    laurel_orig_commenter = create(:laurel_peer)
    candidate = create(:laurel_candidate)
    comment = create(:comment, peer: laurel_orig_commenter, candidate: candidate)
    expect{put "/chambers/comments/#{comment.id}", params: {:comment => {text: 'new text'} }}.to raise_error("Access Denied")
  end

  it "redirects when not-logged in user tries to edit comment" do
    comment = create(:comment)
    put "/chambers/comments/#{comment.id}", params: {:comment => {text: 'new text'} }
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
