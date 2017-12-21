require "rails_helper"
describe "post /chambers/laurel/admin/poll" do
  before(:each) do
    admin = create(:admin)
    sign_in(admin)
    @start_date = (Date.today + 1.day).strftime('%d-%b-%Y') 
    @end_date = (Date.today + 2.days).strftime('%d-%b-%Y') 
    @params = { :poll => {start_date: @start_date, end_date: @end_date} }
  end
  it "creates new poll" do
    expect(Poll.count).to eq(0)
    post '/chambers/laurel/admin/poll', params: @params
    expect(Poll.count).to eq(1)
  end
  it "sets start_date time to midnight" do
    post '/chambers/laurel/admin/poll', params: @params
    expect(Poll.first.start_date.strftime('%H:%M:%S')).to eq('00:00:00')
  end
  it "sets end_date time to 23:59:59" do
    post '/chambers/laurel/admin/poll', params: @params
    expect(Poll.first.end_date.strftime('%H:%M:%S')).to eq('23:59:59')
  end
  it 'accepts same date for start and end' do
    post '/chambers/laurel/admin/poll', params: @params
    expect(Poll.count).to eq(1)
    expect(Poll.first.start_date.strftime('%H:%M:%S')).to eq('00:00:00')
    expect(Poll.first.end_date.strftime('%H:%M:%S')).to eq('23:59:59')
  end
  it 'rejects garbage string' do
    expect(Poll.count).to eq(0)
    post '/chambers/laurel/admin/poll', params: { :poll => {start_date: 'aw;eofiajw', end_date: 'awfe;oiawj'} }
    expect(Poll.count).to eq(0)
  end 
end
