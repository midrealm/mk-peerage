require 'rails_helper'
describe PeerageParamHandler, 'initialize' do
  it "default initializes with nil peerage" do
    expect(PeerageParamHandler.new().peerage).to be_nil
  end
  context 'for param sent' do
    before(:each) do
      allow(Peer).to receive(:orders).and_return([:laurel])
    end
    it "for valid param, sets peerage to value of new argument" do
      expect(PeerageParamHandler.new('laurel').peerage).to eq(:laurel)
    end
    it "for invalid param, sets peerage to nil" do
      expect(PeerageParamHandler.new('populace').peerage).to be_nil
    end
  end
end
