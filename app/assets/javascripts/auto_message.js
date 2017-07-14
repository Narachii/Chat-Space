$(document).on('turbolinks:load',function(){
  function buildHTML(message){
       var html = `<div class=chank  data-message-id="${message.id}">
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
    };

 $(function(){
    setInterval(update,5000);
  });

   function update(){
     if($('.chank')[0]){
    var message_id = $('.chank:last').attr('data-message-id');
    console.log(message_id);
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
                console.log(data)
      $.each(data, function(i,data){
        var html = buildHTML(data);
        $('.chats').append(html);
        $('.chat__middle').animate({scrollTop: $('.chat__middle')[0].scrollHeight});
      });
    });
  };
});
