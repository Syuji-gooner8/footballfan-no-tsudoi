require "test_helper"

class Public::PostsLikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_posts_likes_index_url
    assert_response :success
  end

  test "should get create" do
    get public_posts_likes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_posts_likes_destroy_url
    assert_response :success
  end
end
