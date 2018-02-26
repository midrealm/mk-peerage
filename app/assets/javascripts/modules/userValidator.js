export default (() => {
  function setup_error_divs(){
      create_error_div('#user_sca_name', 'Need SCA Name')
  }
  function create_error_div(id, message){
    var msg = $('<div>').addClass('invalid-feedback').text(message)
    $(id).after(msg)
    $(id).attr('require','')
  }
  function validate(e){
    $('.is-invalid').removeClass('is-invalid');
    if($('#user_sca_name').val() == ''){
      $('#user_sca_name').addClass('is-invalid')
    } 
    if($('.is-invalid').length > 0){
      e.preventDefault(); 
    }
  }

  if($('#user_submit').length){
    setup_error_divs();
    $('#user_submit').click(validate);
  }
})()
