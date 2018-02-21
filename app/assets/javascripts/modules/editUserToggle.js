export default (() => {
  function toggleImages(e){
    $('#croppie').addClass('d-none')
    $('input[data-behavior="profile-data"]').removeClass('active')
    switch(e.target.hash){
      case '#personal':
          var input = $('#arms_cache')
          var img = $('<img>', {src: input.val(), width: '100px'})
          $('#profile_preview').html(img) 
        break
      case '#laurel':
        peerImagePreview('#laurel')
        break
      case '#pelican':
        peerImagePreview('#pelican')
        break
      default:
    }
    $('#profile_preview').removeClass('d-none')
      
  }; 
  function peerImagePreview(peer){
    var input = $(peer + ' input[data-behavior="profile-data"]')
    input.addClass('active')
    var img = $('<img>').attr('src', input.val())
    $('#profile_preview').html(img) 
  };

  $('#myTabs a').click(toggleImages);
})()
