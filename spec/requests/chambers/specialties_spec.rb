require "rails_helper"
#specialties index
  describe "Get chambers/laurel/specialties" do
    it "shows list of specialties for given peerage where candidate with specialty" do
      laurel_user = create(:laurel_user)
      sign_in(laurel_user)
      specialty = create(:specialty, name: 'Earwax Studies', peerage_type: :laurel)
      create(:specialty, name: 'Music', peerage_type: :laurel)
      candidate = create(:candidate, sca_name: 'Candy Candidate', peerage_type: :laurel)
      create(:specialization, candidate: candidate, specialty: specialty)
      get "/chambers/laurel/specialties"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Earwax studies')
      expect(response.body).not_to include('Music')
      expect(response.body).not_to include('Sleeping')
    end
  end

#specialties show
  describe "get chambers/laurel/specialties/:slug" do
    it "shows list of users with given specialty" do
      spec = create(:specialty, name: 'Earwax Studies', peerage_type: :laurel)
      laurel_user = create(:laurel_user)
      sign_in(laurel_user)
      candidate = create(:laurel_candidate, sca_name: 'Candy Candidate')
      create(:specialization, candidate: candidate, specialty: spec)
      get "/chambers/laurel/specialties/earwax_studies"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Earwax studies')
      expect(response.body).to include('Candy Candidate')
    end
  end
