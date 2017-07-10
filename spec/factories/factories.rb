FactoryGirl.define do
  factory :group do
    id 1
    name "group1"
  end

  factory :message do
    id               1
    body             "test test"
    group_id         1
    user_id          1
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpg'))
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

  factory :user do
    name{Faker::Internet.name}
    email{Faker::Internet.email}
    password "password"
    password_confirmation "password"
      after(:build) do |group|
      group.messages << create(:message,id: 4)
      group.messages << create(:message,id: 2)
      group.messages << create(:message,id: 3)
      #groupに配置すると二重に作成されてしまいエラー。　なんでだろ？
    end
  end

    factory :invalid_message ,class: Message do |f|
    f.id               1
    f.body             ""
    f.group_id         1
    f.user_id          1
    f.image            ""
    f.created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
