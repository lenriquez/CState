

document.addEventListener('DOMContentLoaded',function(){
  $('#authentication').on('shown.bs.modal', function () {
    $.auth.configure({apiUrl: '/api'});
    $('#myInput').focus()
  })
})
