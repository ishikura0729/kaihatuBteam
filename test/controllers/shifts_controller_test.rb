require "test_helper"

class ShiftsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shifts_new_url
    assert_response :success
  end

  test "should get create" do
    get shifts_create_url
    assert_response :success
  end
end
