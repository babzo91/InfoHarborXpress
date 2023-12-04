require "test_helper"

class ComparesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get compares_new_url
    assert_response :success
  end
end
