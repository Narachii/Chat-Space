FactoryGirl.define do

  factory :message do
    id               "1"
    body             "test test"
    group_id         "1"
    user_id          "1"
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpg'))
  end
end
