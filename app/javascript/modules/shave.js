import 'datatables.net-bs4'
import 'datatables.net-buttons-bs4'
export default (() => {
  
  
  var show_less = $("<span> (Show Less)</span>").addClass('my-link').addClass('text-primary').click(function(){
    var parent = $(this).parent();
    parent.addClass('d-none')
    parent.prev().removeClass('d-none')
  });
  var show_more = $("<span>(Show More)</span>").addClass('my-link').addClass('text-primary').click(function(){
    $(this).parent().addClass('d-none')
    $(this).parent().next().removeClass('d-none')
  });
  $("[data-behavior='shave']").children(".short").append(show_more)
  $("[data-behavior='shave']").children(".long").append(show_less)

  $("table[data-behavior='dtable-shave']").DataTable({
        pageLength: 50, 
        saveState: true,
        dom: 'Bfrtip',
        buttons: [
           {
             text: 'Expand all Comments',
             action: function(){
               $(".short").addClass('d-none')
               $(".long").removeClass('d-none')
             }
           },
           {
             text: 'Collapse all Comments',
             action: function(){
               $(".long").addClass('d-none')
               $(".short").removeClass('d-none')
             }
           }
     ],
 }); 
    
})()
