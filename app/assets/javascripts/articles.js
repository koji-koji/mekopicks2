$(function(){
  function buildHTML(data) {
    $.each(data, function(i, tags){
      $('.tag_search').append(
        `<li class = "add_tag" data-id="${tags.id}">
          ${tags.name}
        </li>
        `
      )
    })
  }

  $('.text_field').on('keyup', function(e){
    e.preventDefault();
    var textField = $('.text_field')
    var input = textField.val()
    $('.tag_search').empty()
    $.ajax({
      type: 'GET',
      url: '/tag_search',
      data: ('keyword=' + input),
      dataType: 'json'
    })
    .done(function(data){
      $('.tag_search').append('<li>').append(data.name)
      buildHTML(data)
    })
    .fail(function(error){
      console.log("hoge")
    })
  })
});
