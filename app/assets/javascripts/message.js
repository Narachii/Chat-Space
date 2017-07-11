$(document).on('turbolinks:load',function(){
  function buildHTML(message){

    var html = `<div class=chank>
                <li class=message>${message.user.name}</li>
                <li class=data>${message.data}</li>
                <li class=chat>${message.body}</li>
                </div>   `
    if (message.image.url != null){
      var image = `
              <img src= ${message.image.url}>`
    var html = html + image
    return html;
    };

    return html;
  }
  $('#new_message').on('submit',function(e){
        e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat-main').append(html)
      $('#submit').attr('disabled',false)
      $('.chat__middle').animate({scrollTop: $('.chat__middle')[0].scrollHeight});
    })
    .fail(function(){
      alert('error');
    });
  });
});
