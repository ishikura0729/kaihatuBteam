require "test_helper"

class ShihutoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shihuto_index_url
    assert_response :success
  end

  test "should get new" do
    get shihuto_new_url
    assert_response :success
  end

  test "should get form" do
    get shihuto_form_url
    assert_response :success
  end
end
