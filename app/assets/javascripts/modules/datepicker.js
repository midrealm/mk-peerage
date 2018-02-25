import 'bootstrap-datepicker'
export default (() => {
  $("input[data-behavior='startdatepicker']").datepicker({
    startDate: '0d',
    format: 'dd-M-yyyy',
  }).on('changeDate',function(e){
    $('#poll_end_date').datepicker('setStartDate',e.date)
  });  

  $("input[data-behavior='enddatepicker']").datepicker({
    startDate: '0d',
    format: 'dd-M-yyyy',
  })

})()
