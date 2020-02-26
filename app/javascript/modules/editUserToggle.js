import peerages from '../entities/peerages';
export default (() => {
  function toggleImages(e){
    $('#croppie').addClass('d-none')
    $('input[data-behavior="profile-data"]').removeClass('active')

    const tab = e.target.hash.substr(1);
    if(tab === 'personal'){
      var input = $('#arms_cache')
      var img = $('<img>', {src: input.val(), width: '100px'})
      $('#profile_preview').html(img) 
    }else if(peerages.includes(tab)){
      peerImagePreview(tab)
    } 

    $('#profile_preview').removeClass('d-none')
      
  }; 
  function peerImagePreview(peer){
    var input = $(`#${peer} input[data-behavior="profile-data"]`)
    input.addClass('active')
    var img = $('<img>').attr('src', input.val())
    $('#profile_preview').html(img) 
  };

  $('#myTabs a').click(toggleImages);
})()
