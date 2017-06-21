$(function(){
  $('.text_field').on('keyup', function(e){
    e.preventDefault();
    var textField = $('.text_field')
    var input = textField.val()
    $.ajax({
      type: 'GET',
      url: '/tag_search',
      data:('keyword=' + input),
      dataType: 'json'
    })
    .done(function(data){
    })
    .fail(function(error){
      console.log("hoge")

    })
  })
});
