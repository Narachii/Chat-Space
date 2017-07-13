$(document).on('turbolinks:load',function(){
  function appendUser(user){
    var html = `  <div class="wrap">
                    <div class="chat-group-user clearfix">
                      <p class="chat-group-user__name">${user.name}</p>
                      <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</a>
                     </div>
                   </div>`
   $('#user-search-result').append(html)
  };


  function appendMember(name,id){
    var name = name
    var id = id
    var html = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-${id}' user_id="${id}" user_name="${name}">
                  <input name='group[user_ids][]' type='hidden' value='${id}'>
                  <p class='chat-group-user__name'>${name}</p>
                  <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`
    $('#users_wrap').append(html)
  };

  $("#user-search-field").on("keyup",function(e){
    e.preventDefault();
    var input = $(this).val();

  $.ajax({
    url: '/users/search',
    type: 'GET',
    data: ("keyword=" + input ),
    processData: false,
    contentType: false,
    dataType: 'json'
  })
  .done(function(data){
    $("#user-search-result").empty();
    if(input.length !== 0){
        data.forEach(function(user){
          appendUser(user);
        });
      }
    $('.wrap').on('click',".chat-group-user__btn",function(e){
    $(this).parent().remove();
    console.log(e.target);
    var name = $(this).attr('data-user-name')
    var id = $(this).attr('data-user-id')
    appendMember(name,id);
    })
    $('#users_wrap').on('click',".chat-group-user__btn",function(e){
      console.log(this);
    $(this).parent().remove();
    })
    })
    .fail(function(){
    alert('error');
    });
  });
});
