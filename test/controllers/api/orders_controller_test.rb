require 'test_helper'

class Api::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_orders_index_url
    assert_response :success
  end

end
