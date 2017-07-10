FactoryGirl.define do
  factory :group do
    id 1
    name {Faker::Internet.name}
  end

  factory :message do
    id               {Faker::Number.digit}
    body             {Faker::Internet.name}
    group_id         1
    user_id          1
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpg'))
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

  factory :user do
    name{Faker::Zelda.character}
    email{Faker::Internet.email}
    password "password"
    password_confirmation "password"
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
