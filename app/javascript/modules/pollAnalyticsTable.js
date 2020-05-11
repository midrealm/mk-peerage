import 'datatables.net-bs4'
import 'datatables.net-buttons-bs4'
import 'datatables.net-buttons/js/buttons.colVis.min'
export default (() => {

  $("table[data-behavior='dtable-pollanalytics']").DataTable({
        paging: false, 
        saveState: true,
        dom: '<"mb-2"B><"float-left"l>frtip',
        order: [[ 1, 'desc' ],[0,'asc']],
        buttons: [
          {
            text: '<span id="showhide">Show</span> Blank Polls',
            action: function(){
              $(".not-started").toggleClass('d-none')
              if( $('#showhide').text() === "Hide" ){
                $('#showhide').text('Show')
              }else{
                $('#showhide').text('Hide')
              }
            }
          }
        ]
  });
})()
