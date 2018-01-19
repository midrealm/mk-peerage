require "rails_helper"

shared_examples_for "a peerage" do |peerage, other_peerage|

  it_behaves_like "delete /chambers/PEERAGE/admin/candidates/:id", peerage, other_peerage
  it_behaves_like "get /chambers/PEERAGE/admin/candidates/:id/edit", peerage, other_peerage
  it_behaves_like "get /chambers/PEERAGE/admin/candidates", peerage, other_peerage
  it_behaves_like "put /chambers/PEERAGE/admin/candidates/:id", peerage, other_peerage
  it_behaves_like "get /chambers/PEERAGE/admin/candidates/new", peerage, other_peerage

  it_behaves_like "get /chambers/PEERAGE/admin/peers/new", peerage, other_peerage
  it_behaves_like "post /chambers/PEERAGE/admin/peers", peerage, other_peerage
  it_behaves_like "get /chambers/PEERAGE/admin/peers/:id/edit", peerage, other_peerage
  it_behaves_like "get /chambers/PEERAGE/admin/peers", peerage, other_peerage
  it_behaves_like "put /chambers/PEERAGE/admin/peers/:id", peerage, other_peerage

  it_behaves_like "post /chambers/PEERAGE/admin/poll", peerage, other_peerage
  it_behaves_like "get /chambers/PEERAGE/admin/poll/edit", peerage, other_peerage
  it_behaves_like "get /chambers/PEERAGE/admin/poll/new", peerage, other_peerage
  it_behaves_like "put /chambers/PEERAGE/admin/poll", peerage, other_peerage

  it_behaves_like "get /chambers/PEERAGE/candidates/:id", peerage, other_peerage
  it_behaves_like "get /chambers/PEERAGE/candidates", peerage, other_peerage

  it_behaves_like "get /chambers/PEERAGE/groups/:slug", peerage, other_peerage
  it_behaves_like "get /chambers/PEERAGE/groups", peerage, other_peerage

  it_behaves_like "get /chambers/PEERAGE/poll/candidates/:id", peerage, other_peerage
  it_behaves_like "get /chambers/PEERAGE/poll", peerage, other_peerage

  it_behaves_like "post /chambers/admin/royalty", peerage
  it_behaves_like "get /chambers/admin/royalty/:id/edit", peerage
  it_behaves_like "get /chambers/admin/royalty", peerage
  it_behaves_like "get /chambers/admin/royalty/new", peerage
  it_behaves_like "put /chambers/admin/royalty/:id", peerage
  
end

