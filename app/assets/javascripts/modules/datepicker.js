import 'bootstrap-datepicker'
export default (() => {
  var datepickers = $("input[data-behavior='datepicker']")
  datepickers.each((index, dpicker) => {
    switch(dpicker.id){
      case 'poll_start_date':
        $('#poll_start_date').datepicker({
          startDate: '0d',
          format: 'dd-M-yyyy',
        }).on('changeDate',function(e){
          $('#poll_end_date').datepicker('setStartDate',e.date)
        });  
        break;
      case 'poll_end_date':
        $('#poll_end_date').datepicker({
          startDate: '0d',
          format: 'dd-M-yyyy',
        })
        break;
      case 'default':
    };
        
  })
})()
