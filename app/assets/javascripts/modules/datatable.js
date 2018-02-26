import 'datatables.net-bs4'
export default (() => {
  $("table[data-behavior='dtable']").DataTable(
      {
        "pageLength": 25, 
        "saveState": true,
      });

})()
