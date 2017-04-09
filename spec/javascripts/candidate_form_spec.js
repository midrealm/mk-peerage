describe("Candidate Form", function() {
  beforeEach(function() {
    MagicLamp.load("candidates/form");
  });
  it("loads the form", function() {
    expect($('#candidate_sca_name').val()).to.equal('')
  });
});
