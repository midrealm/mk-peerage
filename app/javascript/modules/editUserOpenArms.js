export default (() => {
  function openArms(e){
    var reader =  new window.FileReader();
    reader.onload = function(e){
      $('#arms_cache').val(e.target.result);
      var img = $('<img />',{ 
          src: e.target.result,
          width: '100px'
      })
      $('#profile_preview').empty().append(img)
    }   
    reader.readAsDataURL(e.target.files[0]);
  }
  $('#user_arms').change(openArms)
})()
