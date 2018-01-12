require "rails_helper"

describe "peers requests" do
  it_behaves_like "the outside world's view of a peerage", "laurel"
  it_behaves_like "the outside world's view of a peerage", "pelican"
end
