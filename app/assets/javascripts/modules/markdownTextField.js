import SimpleMDE  from 'simplemde';
import peerages from '../entities/peerages';
export default (() => {
  if( $("textarea[data-behavior='markdown']").length > 0){
    new SimpleMDE();
  }
  peerages.forEach((peerage) =>{ 
    if($('#user_'+peerage+'_attributes_bio')[0]){
      new SimpleMDE({element: $('#user_'+peerage+'_attributes_bio')[0]});
    }
  });
})()
