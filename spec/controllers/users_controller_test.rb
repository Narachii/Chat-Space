class UsersControllerTest < ActionController::TestCase
  include Devise::ControllerHelpers
  def setup
    sign_in FactoryGirl.create(:admin)
  end
end
