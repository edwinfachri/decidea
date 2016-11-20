require 'test_helper'

class JobPostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should get job post form" do
    get new_job_post_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should get job posts list" do
    get job_posts_path
    assert_response :success
  end

  test "should redirect log in form when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end
end
