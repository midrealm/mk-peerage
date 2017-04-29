require "rails_helper"
describe "post /chambers/admin/poll" do
  before(:each) do
    laurel = create(:user, role: 'admin')
    sign_in(laurel)
  end
  it "creates new poll" do
    expect(Poll.count).to eq(0)
    post '/chambers/admin/poll', params: { :poll => {start_date: '20-Apr-2017', end_date: '25-Apr-2017'} }
    expect(Poll.count).to eq(1)
  end
  it "sets start_date time to midnight" do
    post '/chambers/admin/poll', params: { :poll => {start_date: '20-Apr-2017', end_date: '25-Apr-2017'} }
    expect(Poll.first.start_date.strftime('%H:%M:%S')).to eq('00:00:00')
  end
  it "sets end_date time to 23:59:59" do
    post '/chambers/admin/poll', params: { :poll => {start_date: '20-Apr-2017', end_date: '25-Apr-2017'} }
    expect(Poll.first.end_date.strftime('%H:%M:%S')).to eq('23:59:59')
  end
  it 'rejects garbage string' do
    expect(Poll.count).to eq(0)
    post '/chambers/admin/poll', params: { :poll => {start_date: 'aw;eofiajw', end_date: 'awfe;oiawj'} }
    expect(Poll.count).to eq(0)
  end 
end
