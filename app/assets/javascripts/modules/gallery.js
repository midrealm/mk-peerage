export default (() => {
  $('#galleryModal').on('show.bs.modal', function(e){
    $('#galleryTitle').text($(e.relatedTarget).parent().next().text())
    $('#galleryImage').attr("src",$(e.relatedTarget).data("largesrc"));
  });
})();
