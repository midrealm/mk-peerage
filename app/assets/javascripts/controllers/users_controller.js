App.createController("Users", {
  elements: {
    edit: {
      profile: '#profile_preview',
      clickTab: ["#myTabs a", { click: 'toggleImagePreview' }],
      loadNewPic: ['.profile-pic', { change: 'openCroppie' }], 
      loadNewArms: ['#user_arms', {change: 'previewArms' }],
      cropPicButton: ['#crop', { click: 'cropPicture' }],
      clickSubmitButton: ['#submit', { click: 'validate' }], 
    },
  },
  toggleImagePreview: function(e){
    $('.image-preview-container').addClass('d-none')
    $('.profile-pic-cache').removeClass('active')
    $('.profile-pic-actual').removeClass('active')
    switch(e.target.hash){
      case '#personal':
        $('#arms_preview_container').removeClass('d-none')
        break
      case '#laurel':
        this.peerImagePreview('#laurel')
        break
      case '#pelican':
        this.peerImagePreview('#pelican')
        break
      default:
    }
  },
  peerImagePreview: function(peer){
    $(peer + ' .profile-pic-cache').addClass('active')
    $(peer + ' .profile-pic-actual').addClass('active')
    var $img = $(peer +' .profile-pic-cache').clone().removeClass('d-none')
    $('#profile_preview').html($img) 
    $('#profile_pic_preview_container').removeClass('d-none')
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
    if(has_errors){
      e.preventDefault(); 
    }else if(!$('#crop').hasClass('d-none')){
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
    $('#crop').removeClass('d-none')
  },
  cropPicture: function(){
    var self = this
    var promise = new Promise(function(resolve, reject){
      self.$profile.croppie('result' , {
        type: 'canvas',
        size: 'viewport'
      }).then(function(resp){
        $('#profile_preview').empty().append($('<img>',{src: resp}));
        $('#crop').addClass('d-none')
        $('.tab-pane.active').find('.profile-pic-actual').val(resp)
        $('.tab-pane.active').find('.profile-pic-cache').attr('src',resp)
        $('#crop').trigger('cropped')
        resolve('Success');
      });
    });
    return promise;
  },
});

App.UsersController;
