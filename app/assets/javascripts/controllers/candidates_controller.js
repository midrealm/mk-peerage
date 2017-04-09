App.createController("Candidates", {
  actions: [{
    new: 'form'
  }],
  elements: {
    new: {
      profile: '#profile-preview',
      loadNewPic: ['#profile_pic', { change: 'openCroppie' }], 
      cropPicButton: ['#crop', { click: 'cropPicture' }],
    }
  },
  
  openCroppie: function(e){
    var reader =  new window.FileReader();
    var self = this
    reader.onload = function(e){
      $('#profile-preview').empty();  
      self.$profile.croppie({
        viewport:{
          width: 300,
          height: 400,
        },
        boundary: {
          width: 400,
          height: 400,
        },
      })
      self.$profile.croppie('bind',{
        url: e.target.result,
      })
    }   
    reader.readAsDataURL(e.target.files[0]);
    $('#crop').removeClass('hidden')
  },
  cropPicture: function(){
    this.$profile.croppie('result' , {
      type: 'canvas',
      size: 'viewport'
    }).then(function(resp){
      $('#profile-preview').empty().append($('<img>',{src: resp}));
      $('#crop').addClass('hidden')
      $('#candidate_profile_pic').val(resp)
    });
  },
  form: function(){ },//end form 
});

App.CandidatesController;
