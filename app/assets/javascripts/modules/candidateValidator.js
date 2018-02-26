export default (() => {
  function setup_error_divs(){
      create_error_div('#candidate_sca_name', 'Need SCA Name')
      create_error_div('#candidate_group_id', 'Need Group')
      create_error_div('#profile_pic_input', 'Need Profile Picture')
  }
  function create_error_div(id, message){
    var msg = $('<div>').addClass('invalid-feedback').text(message)
    $(id).after(msg)
    $(id).attr('require','')
  }
  function validate(e){
    $('.is-invalid').removeClass('is-invalid');
    if($('#candidate_sca_name').val() == ''){
      $('#candidate_sca_name').addClass('is-invalid')
    } 
    if($('#candidate_group_id').val() == ''){
      $('#candidate_group_id').addClass('is-invalid')
    }
    if($.trim($('#profile_preview').html()).length === 0){
      $('#profile_pic_input').addClass('is-invalid')
    }
    if($('.is-invalid').length > 0){
      e.preventDefault(); 
    }
  }

  if($('#candidate_submit').length){
    setup_error_divs();
    $('#candidate_submit').click(validate);
  }
})()
