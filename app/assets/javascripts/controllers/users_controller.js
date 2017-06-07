App.createController("Users", {
  actions: [{
    edit: 'form', 
  }],
  elements: {
    edit: {
      profile: '#profile_preview',
      clickTab: ["#myTabs a", { click: 'toggleImagePreview' }],
      loadNewPic: ['#profile_pic', { change: 'openCroppie' }], 
      loadNewArms: ['#user_arms', {change: 'previewArms' }],
      cropPicButton: ['#crop', { click: 'cropPicture' }],
      clickSubmitButton: ['#submit', { click: 'validate' }], 
    },
  },
  toggleImagePreview: function(e){
    if(e.target.hash == '#images'){
      $('#image_preview').removeClass('hidden')
    }else{
      $('#image_preview').addClass('hidden')
    }
  },
  validate: function(e){
    $('.has-error').removeClass('has-error')    
    $('.help-block').remove();
    var has_errors = false;
    if($('#user_sca_name').val() == ''){
      var msg = $('<span>').addClass('help-block').text('Need SCA Name')
      $('#user_sca_name_input').addClass('has-error').append(msg)
      has_errors = true
    } 
  //  if($('#candidate_group_id').val() == ''){
  //    var msg = $('<span>').addClass('help-block').text('Need Group')
  //    $('#candidate_group_input').addClass('has-error').append(msg)
  //    has_errors = true
  //  }
  //  if(this.$profile.is(':empty')){
  //    var msg = $('<span>').addClass('help-block').text('Need Profile Picture');
  //    $('#candidate_profile_pic_input').addClass('has-error').append(msg)
  //    has_errors = true;
  //  }
    if(has_errors){
      e.preventDefault(); 
    }else if(!$('#crop').hasClass('hidden')){
      var promise = this.cropPicture();
      promise.then(function(){
        console.log('promise success')
      });
    }   
  },
  previewArms: function(e){
    var reader =  new window.FileReader();
    var self = this
    $("#arms_status").text(e.target.files[0].name)
    reader.onload = function(e){
      $('#arms_preview').empty();  
      var img = $('<img />',{ 
          src: e.target.result,
          width: '100px'
      })
      img.appendTo('#arms_preview')
    }
    reader.readAsDataURL(e.target.files[0]);
  },
  openCroppie: function(e){
    var reader =  new window.FileReader();
    var self = this
    $("#profile_pic_status").text(e.target.files[0].name)
    reader.onload = function(e){
      $('#profile_preview').empty();  
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
    var self = this
    var promise = new Promise(function(resolve, reject){
      self.$profile.croppie('result' , {
        type: 'canvas',
        size: 'viewport'
      }).then(function(resp){
        $('#profile_preview').empty().append($('<img>',{src: resp}));
        $('#crop').addClass('hidden')
        $('#user_profile_pic').val(resp)
        $('#crop').trigger('cropped')
        resolve('Success');
      });
    });
    return promise;
  },
  form: function(){ 
    $('#user_group_id').select2();
    $('#user_specialty_ids').select2();
    $('#user_laurel_ids').select2();
    var simplemde = new SimpleMDE();
  },
});

App.UsersController;