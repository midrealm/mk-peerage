App.createController("Candidates", {
  actions: [{
    new: 'form',
    edit: 'form', 
  }],
  elements: {
    edit: {
      profile: '#profile-preview',
      loadNewPic: ['#profile_pic', { change: 'openCroppie' }], 
      cropPicButton: ['#crop', { click: 'cropPicture' }],
      clickSubmitButton: ['#submit', { click: 'validate' }], 
    },
    new: {
      profile: '#profile-preview',
      loadNewPic: ['#profile_pic', { change: 'openCroppie' }], 
      cropPicButton: ['#crop', { click: 'cropPicture' }],
      clickSubmitButton: ['#submit', { click: 'validate' }], 
    }
  },
  validate: function(e){
    $('.has-error').removeClass('has-error')    
    $('.help-block').remove();
    var has_errors = false;
    if($('#candidate_sca_name').val() == ''){
      var msg = $('<span>').addClass('help-block').text('Need SCA Name')
      $('#candidate_sca_name_input').addClass('has-error').append(msg)
      has_errors = true
    } 
    if($('#candidate_group_id').val() == ''){
      var msg = $('<span>').addClass('help-block').text('Need Group')
      $('#candidate_group_input').addClass('has-error').append(msg)
      has_errors = true
    }
    if(this.$profile.is(':empty')){
      var msg = $('<span>').addClass('help-block').text('Need Profile Picture');
      $('#candidate_profile_pic_input').addClass('has-error').append(msg)
      has_errors = true;
    }
    if(has_errors){
      e.preventDefault(); 
    }else if(!$('#crop').hasClass('d-none')){
      var promise = this.cropPicture();
      promise.then(function(){
        console.log('promise success')
      });
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
    $('#crop').removeClass('d-none')
  },
  cropPicture: function(){
    var self = this
    var promise = new Promise(function(resolve, reject){
      self.$profile.croppie('result' , {
        type: 'canvas',
        size: 'viewport'
      }).then(function(resp){
        $('#profile-preview').empty().append($('<img>',{src: resp}));
        $('#crop').addClass('d-none')
        $('#candidate_profile_pic').val(resp)
        $('#crop').trigger('cropped')
        resolve('Success');
      });
    });
    return promise;
  },
  form: function(){ 
    $('#candidate_group_id').select2();
    $('#candidate_specialty_ids').select2();
    $('#candidate_peer_ids').select2();
  },
});

App.CandidatesController;
