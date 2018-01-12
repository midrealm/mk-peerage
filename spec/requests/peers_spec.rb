require "rails_helper"

describe "peers requests" do
  it_behaves_like "a peerage", :laurel, :pelican
  it_behaves_like "a peerage", :pelican, :laurel
end
