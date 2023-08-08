require "test_helper"

class Admin::SoccerteamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_soccerteams_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_soccerteams_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_soccerteams_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_soccerteams_update_url
    assert_response :success
  end
end
