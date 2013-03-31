require 'test_helper'

class ReportsControllerTest < ActionController::TestCase

  test "should get gift_cards" do
    get :gift_cards
    assert_response :success
  end

end
