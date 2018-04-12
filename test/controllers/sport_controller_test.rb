require 'test_helper'

class SportControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sport_index_url
    assert_response :success
  end

end
