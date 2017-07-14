$(document).on('turbolinks:load',function(){
  function buildHTML(message){
    var html = `<div class=chank data-message-id="${message.id}">
                <li class=message>${message.user.name}</li>
                <li class=data>${message.data}</li>
                <li class=chat>${message.body}</li>
                </div>   `

    if (message.image != null){
    var image = `
              <img src= ${message.image}>`

    var html = html + image
  };
    return html;
};

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
      $('.chats').append(html)
      $('#submit').attr('disabled',false)
      $('.chat__middle').animate({scrollTop: $('.chat__middle')[0].scrollHeight});
    })
    .fail(function(){
      alert('error');
    });
  });

$(function(){
  setInterval(function(){
     if($('.chank')[0]){
    var message_id = $('.chank:last').attr('data-message-id');
    // console.log(message_id);
  } else {
      var message_id = 0
  }
    $.ajax({
      url: location.href,
      type: 'GET',
      data:{
        message:{id: message_id}
      },
      dataType: 'json'
    })
    .always(function(data){
      // console.log(data)
      $.each(data, function(i,data){
        var html = buildHTML(data);
        $('.chats').append(html);
        $('.chat__middle').animate({scrollTop: $('.chat__middle')[0].scrollHeight});
      });
    });
  },5000);
});
});
