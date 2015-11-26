require 'test_helper'

class PaymentDetailsControllerTest < ActionController::TestCase
  test "should get express" do
    get :express
    assert_response :success
  end

end
