require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  #test "unsuccessful edit" do
  #  log_in_as(@user)
  #  get edit_user_path(@user)
  #  assert_template 'users/edit'
  #  patch user_path(@user), params: { user: { name: "",
  #    email: "foo@invalid", password: "foo", password_confirmation: "bar" } }
  #  assert_template 'users/edit'
  #end

  #test "successful edit with friendly forwarding" do
  #  get edit_user_path(@user)
  #  log_in_as(@user)
  #  assert_redirected_to edit_user_path(@user)
  #  first_name = "Foo"
  #  last_name = "Bar"
  #  username = "foobar"
  #  email = "foo@bar.com"
  #  location = "home"
  #  biography = "hi"
  #  patch user_path(@user), params: { user: { first_name: first_name, last_name: last_name,
  #    email: email, username: username, password: "", password_confirmation: "" } }
  #  assert_not flash.empty?
  #  assert_equal first_name, @user.first_name
  #  assert_equal last_name, @user.last_name
  #  assert_equal email, @user.email
  #end
end
