shared_examples_for "put /chambers/PEERAGE/admin/poll" do |peerage, other_peerage|
  describe "put /chambers/#{peerage}/admin/poll" do
    it "updates poll, and redirects to dashboard" do
      admin = create("#{peerage}_admin".to_sym)
      sign_in(admin)
      poll = create(:future_poll, peerage_type: peerage)
      start_date = (DateTime.now + 3.days).strftime('%d-%b-%Y')
      end_date = (DateTime.now + 4.days).strftime('%d-%b-%Y')
      put "/chambers/#{peerage}/admin/poll", params: { :poll => {start_date: start_date, end_date: end_date} }
      expect(response).to redirect_to "/chambers"
    end
    it "updates poll for current poll" do
      admin = create("#{peerage}_admin".to_sym)
      sign_in(admin)
      poll = create(:current_poll, peerage_type: peerage)
      end_date = (DateTime.now + 4.days).strftime('%d-%b-%Y')
      put "/chambers/#{peerage}/admin/poll", params: { :poll => { end_date: end_date} }
      expect(response).to redirect_to "/chambers"
      expect(Poll.last.end_date.strftime('%d-%b-%Y')).to eq(end_date)
    end
  
    it "redirects if not logged in" do
      poll = create(:poll, peerage_type: peerage)
      put "/chambers/#{peerage}/admin/poll", params: { :poll => {start_date: '', end_date:''} }
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
    end
  end
end
