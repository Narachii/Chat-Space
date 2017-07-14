json.id       @message.id
json.body     @message.body
json.image    @message.image
json.group_id @message.group.id
json.user_id  @message.user.id
json.data     @message.created_at.strftime('%Y/%m/%d %H:%M')

json.user do
  json.name @message.user.name
end
