require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { name: 'sam', password: "secret", password_confirmation: "secret" } }
    end

    assert_redirected_to users_url
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { name: 'New name', password: "secret", password_confirmation: "secret" } }
    assert_redirected_to users_url
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end

  test "should destroy last user" do
    while User.count > 1 do
      assert_difference("User.count", -1) do
        login_as User.all.sample
        delete user_url(User.all.sample)
      end
    end
    assert_no_difference('User.count') do
      login_as User.all.sample
      delete user_url(User.all.sample)
    end
    assert_equal "Can't delete last user", flash[:notice]
  end
end
