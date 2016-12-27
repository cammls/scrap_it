require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get test" do
    get product_test_url
    assert_response :success
  end

end
