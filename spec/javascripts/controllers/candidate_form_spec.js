fixture.preload('profile_pic.html')
function dataURLtoBlob(dataurl) {
    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
        bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
    while(n--){
        u8arr[n] = bstr.charCodeAt(n);
    }
    return new Blob([u8arr], {type:mime});
}

describe("Candidate Form", function() {
  beforeEach(function() {
    this.fixtures = fixture.load('profile_pic.html', true)
    MagicLamp.load("candidates/form");
    subject = App.CandidatesController.create();
    subject.registerEvents('new')
    $('#submit').click(function(e){
      e.preventDefault();
    });
    $('#candidate_sca_name').val('Smarty Pants') 
    $('#candidate_group_id').val($('#candidate_group_id option:eq(2)').val())
    $('#profile-preview').empty().append($('<img>',{src: $('#fixture_pic').attr('src')}))
  });

  afterEach(function(){
    MagicLamp.clean();
  });

  it("puts image data in #candidate_profile_pic on form submit if img loaded but not cropped", function(done) {
    $('#profile-preview').empty().croppie({url: $('#fixture_pic').attr('src')}),
    $('#crop').removeClass('hidden');

    $('#crop').on('cropped',function(e){
      expect($('#candidate_profile_pic').val()).not.to.equal('')
      done();
    });

    expect($('#candidate_profile_pic').val()).to.equal('')
    $('#submit').click();
  });

  it("does not accept empty name", function(){
    $('#candidate_sca_name').val('') 
    $('#submit').click();
    expect($('#candidate_sca_name_input').hasClass('has-error')).to.be.true
    expect($('#candidate_sca_name_input').children().last().hasClass('help-block')).to.be.true
    
  });
  it("does not accept empty name", function(){
    $('#candidate_group_id').val('') 
    $('#submit').click();
    expect($('#candidate_group_input').hasClass('has-error')).to.be.true
    expect($('#candidate_group_input').children().last().hasClass('help-block')).to.be.true
    
  });

  it('does not accept empty profile picture', function(){
    $('#profile-preview').empty();
    $('#submit').click();
    expect($('#candidate_profile_pic_input').hasClass('has-error')).to.be.true
    expect($('#candidate_profile_pic_input').children().last().hasClass('help-block')).to.be.true
  });
});
