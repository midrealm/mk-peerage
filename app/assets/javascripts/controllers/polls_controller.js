App.createController("Polls", {
  actions: [{
    edit: 'form', 
    new: 'form',
  }],
  form: function(){
    $('#poll_start_date').datepicker({
      startDate: '0d',
      format: 'dd-M-yyyy',
    }).on('changeDate',function(e){
      $('#poll_end_date').datepicker('setStartDate',e.date)
    });  

    $('#poll_end_date').datepicker({
      startDate: '0d',
      format: 'dd-M-yyyy',
    })
  },
});

App.PollsController
