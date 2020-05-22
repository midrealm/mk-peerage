import 'datatables.net-bs4'
import 'datatables.net-buttons-bs4'
import 'datatables.net-buttons/js/buttons.colVis.min'
export default (() => {
 $(document).ready(function(){
    $("table[data-behavior='dtable-hidepics']").DataTable({
          pageLength: 100, 
          order: [],
          stateSave: true,
          dom: '<"mb-2"B><"float-left"l>frtip',
          buttons: [
            {
              text: '<span id="showhide">Hide</span> Profile Pictures',
              action: function(){
                $(".profile_pic").toggleClass('d-none')
                if( $('#showhide').text() === "Hide" ){
                  $('#showhide').text('Show')
                }else{
                  $('#showhide').text('Hide')
                }
              }
            },
            'colvis',
          ]
    });
  });
})()
