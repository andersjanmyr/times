require 'test_helper'

class TimesheetControllerTest < ActionController::TestCase
  before do
    @user = User.create!({email: 'tapir@email.com', password: 'pwd12345'})
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
