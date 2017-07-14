json.array! @new_message do |message|
  json.data     message.created_at.strftime('%Y/%m/%d %H:%M')
  json.body     message.body
  json.image    message.image.url
  json.user_id     message.user.id
  json.group_id    message.group_id
  json.id       message.id
  json.user do
    json.name message.user.name
  end
end
