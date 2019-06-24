import 'datatables.net-bs4'
export default (() => {
  $("table[data-behavior='dtable']").DataTable(
      {
        "pageLength": 50, 
        "saveState": true,
      });

})()
