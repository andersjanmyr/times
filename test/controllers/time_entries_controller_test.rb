require 'test_helper'

class TimeEntriesControllerTest < ActionController::TestCase

  before do
    @user = User.create!({email: 'tapir@email.com', password: 'pwd12345'})
    sign_in @user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, data: ''
    assert_response :success
  end

end
