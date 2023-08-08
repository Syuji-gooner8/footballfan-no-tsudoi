require "test_helper"

class Public::SoccerteamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_soccerteams_index_url
    assert_response :success
  end

  test "should get create" do
    get public_soccerteams_create_url
    assert_response :success
  end
end
