require 'test_helper'

class GiftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gift = gifts(:one)
  end

  test "should get index" do
    get gifts_url
    assert_response :success
  end

  test "should get new" do
    get new_gift_url
    assert_response :success
  end

  test "should create gift" do
    assert_difference('Gift.count') do
      post gifts_url, params: { gift: { category: @gift.category, name: @gift.name, price: @gift.price, url: @gift.url } }
    end

    assert_redirected_to gift_url(Gift.last)
  end

  test "should show gift" do
    get gift_url(@gift)
    assert_response :success
  end

  test "should get edit" do
    get edit_gift_url(@gift)
    assert_response :success
  end

  test "should update gift" do
    patch gift_url(@gift), params: { gift: { category: @gift.category, name: @gift.name, price: @gift.price, url: @gift.url } }
    assert_redirected_to gift_url(@gift)
  end

  test "should destroy gift" do
    assert_difference('Gift.count', -1) do
      delete gift_url(@gift)
    end

    assert_redirected_to gifts_url
  end
end
