require 'test_helper'

class WishlistItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wishlist_item = wishlist_items(:one)
  end

  test "should get index" do
    get wishlist_items_url
    assert_response :success
  end

  test "should get new" do
    get new_wishlist_item_url
    assert_response :success
  end

  test "should create wishlist_item" do
    assert_difference('WishlistItem.count') do
      post wishlist_items_url, params: { wishlist_item: { gift_id: @wishlist_item.gift_id, wishlist_id: @wishlist_item.wishlist_id } }
    end

    assert_redirected_to wishlist_item_url(WishlistItem.last)
  end

  test "should show wishlist_item" do
    get wishlist_item_url(@wishlist_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_wishlist_item_url(@wishlist_item)
    assert_response :success
  end

  test "should update wishlist_item" do
    patch wishlist_item_url(@wishlist_item), params: { wishlist_item: { gift_id: @wishlist_item.gift_id, wishlist_id: @wishlist_item.wishlist_id } }
    assert_redirected_to wishlist_item_url(@wishlist_item)
  end

  test "should destroy wishlist_item" do
    assert_difference('WishlistItem.count', -1) do
      delete wishlist_item_url(@wishlist_item)
    end

    assert_redirected_to wishlist_items_url
  end
end
