shared_examples_for "delete /chambers/PEERAGE/admin/candidates/:id" do |peerage, other_peerage| 
  describe "delete /chambers/PEERAGE/admin/candidates/:id" do
    before(:each) do
      @candidate = create(:candidate, sca_name: "Dingus McDOOOOgle", peerage_type: peerage.to_sym)
    end
    context "for signed in admin #{peerage}" do
      before(:each) do
        @admin = create("#{peerage}_admin".to_sym)
        sign_in(@admin)
      end
      it "does not allow deleting of #{other_peerage} candidates via #{peerage} delete path" do
        other_peerage_candidate = create("#{other_peerage}_candidate".to_sym)
        expect(Candidate.count).to eq(2)
        expect{delete "/chambers/#{peerage}/admin/candidates/#{other_peerage_candidate.id}"}.to raise_error("Access Denied")
        expect(Candidate.count).to eq(2)
      end
    end
  end
end
