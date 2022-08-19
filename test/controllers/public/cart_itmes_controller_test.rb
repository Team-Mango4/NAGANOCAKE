require "test_helper"

class Public::CartItmesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_cart_itmes_index_url
    assert_response :success
  end
end
