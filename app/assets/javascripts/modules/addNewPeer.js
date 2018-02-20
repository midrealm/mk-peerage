import peerages from '../entities/peerages';
export default (() => {
  var div = $("div[data-behavior='addNewPeer']")
  if( div.length > 0){
    const peerage = div.data('peerage')
    const existing_peers_field = $(`#${peerage}_id`)
    const email_field = $(`#${peerage}_email`) 
    const sca_name_field = $(`#${peerage}_sca_name`)
    existing_peers_field.change(function(){
       var selected = this.selectedOptions[0].innerText
       if (selected == ''){
         sca_name_field.prop('disabled',false);
         email_field.prop('disabled',false);
       }else{
         sca_name_field.val('').prop('disabled',true);
         email_field.val('').prop('disabled',true);
       }
    }).select2();
  }
})()
