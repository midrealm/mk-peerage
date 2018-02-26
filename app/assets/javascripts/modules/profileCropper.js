/*
  Need the following div ids
  .profile-pic
  #crop_button
  #croppie
  #profile_preview
*/
import 'croppie'
export default (() => {
  class ProfileCropper{
    constructor(){
    }

    start(){
      $('.profile-pic').change(this.openCroppie)
      $('#crop_button').click(this.cropPicture)
      this.initializeCroppie();
    } 

    initializeCroppie(){
      $('#croppie').croppie({
        viewport:{
          width: 300,
          height: 400,
        },
        boundary: {
          width: 400,
          height: 400,
        },
      })
    }
    openCroppie(e){
      var reader =  new window.FileReader();
      reader.onload = function(e){
        $('#profile_preview').addClass('d-none');
        $('#croppie').removeClass('d-none');
        $('#croppie').croppie('bind',{
          url: e.target.result,
        })
      }   
      reader.readAsDataURL(e.target.files[0]);
      $('#crop_button').removeClass('d-none')
    } 
    cropPicture(){
      var promise = new Promise(function(resolve, reject){
        $('#croppie').croppie('result' , {
          type: 'canvas',
          size: 'viewport'
        }).then(function(resp){
          //add image to profile_preview div
          $('#profile_preview').empty().append($('<img>',{src: resp})).removeClass('d-none');
         
          //hide croppie and crop divs
          $('#croppie').addClass('d-none')
          $('#crop_button').addClass('d-none')

          //add data to correct input
          $('input[data-behavior="profile-data"].active').val(resp)
          //$('#crop_button').trigger('cropped') //not using this trigger??
          resolve('Success');
        });
      });
      return promise;
    }
  }


  if($('#croppie').length > 0){
    new ProfileCropper().start();
  }
})()
