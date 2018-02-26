require 'rails_helper'
include ActionDispatch::TestProcess

describe DataUriGenerator, 'initialize' do
  it "initializes with nil data_uri" do
    expect(DataUriGenerator.new().data_uri).to be_nil
  end
  it "initializes with nil :image" do
    expect(DataUriGenerator.new().image).to be_nil
  end
  it "returns nil data_uri for non paperclip attachment image" do
    expect(DataUriGenerator.new('not an image').data_uri).to be_nil     
  end
  it "returns nil image for non paperclip attachment image" do
    expect(DataUriGenerator.new('not an image').image).to be_nil     
  end

  context('valid present paperclip attachment') do
    before(:each) do
      fixture_img = fixture_file_upload("#{fixture_path}/images/portrait.jpg", 'image/jpg')
      peer = create(:peer, profile_pic: fixture_img) 
      image = peer.profile_pic
      @dataUriGenerator = DataUriGenerator.new(image)
    end
    it "returns paperclip attachment for image" do
      expect(@dataUriGenerator.image.class.to_s).to eq('Paperclip::Attachment')
    end
    it "returns valid data_uri for data_uri" do
      expect(@dataUriGenerator.data_uri).to include('base64')
    end
  end
  it "returns nil data_uri when image is not-present paperclip attachment" do
      peer = create(:peer, profile_pic: nil) 
      image = peer.profile_pic
      expect(DataUriGenerator.new(image).data_uri).to be_nil
  end
end
    
