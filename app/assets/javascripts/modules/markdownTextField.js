//import SimpleMDE  from 'simplemde';
import EasyMDE  from 'easymde';
import peerages from '../entities/peerages';
export default (() => {
  if( $("textarea[data-behavior='markdown']").length > 0){
    new EasyMDE();
  }
  peerages.forEach((peerage) =>{ 
    if($('#user_'+peerage+'_attributes_bio')[0]){
      new EasyMDE({element: $('#user_'+peerage+'_attributes_bio')[0]});
    }
  });
})()
