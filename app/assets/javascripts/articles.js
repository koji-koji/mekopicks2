$(function(){
  function buildHTML(data) {
    $.each(data, function(i, tags){
      var add_tag =  "<li class = add_tag data-id = " + tags.id  + ">" + tags.name + "</li>"
      $('.tag_search').append(add_tag)
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
  $(document).on('click', '.add_tag' , function(){
    var id = $(this).data("id")
    var add = "<input type=hidden name=article[tag_ids][] value=" + id + "></input>"
    $(".add_tag_list").append(this)
    $(this).append(add)
    $(this).addClass('added_tag').removeClass('add_tag')
  })
  $(document).on('click', '.added_tag' , function(){
    $(this).remove()
  })
});
