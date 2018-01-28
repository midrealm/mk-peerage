require 'rails_helper'
require "paperclip/matchers"

RSpec.describe Document, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_attachment_presence(:document) }
end
