require 'test_helper'

class CookiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cooky = cookies(:one)
  end

  test "should get index" do
    get cookies_url
    assert_response :success
  end

  test "should get new" do
    get new_cooky_url
    assert_response :success
  end

  test "should create cooky" do
    assert_difference('Cookie.count') do
      post cookies_url, params: { cooky: {  } }
    end

    assert_redirected_to cooky_url(Cookie.last)
  end

  test "should show cooky" do
    get cooky_url(@cooky)
    assert_response :success
  end

  test "should get edit" do
    get edit_cooky_url(@cooky)
    assert_response :success
  end

  test "should update cooky" do
    patch cooky_url(@cooky), params: { cooky: {  } }
    assert_redirected_to cooky_url(@cooky)
  end

  test "should destroy cooky" do
    assert_difference('Cookie.count', -1) do
      delete cooky_url(@cooky)
    end

    assert_redirected_to cookies_url
  end
end
