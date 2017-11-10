require 'test_helper'

class GiftExchangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gift_exchange = gift_exchanges(:one)
  end

  test "should get index" do
    get gift_exchanges_url
    assert_response :success
  end

  test "should get new" do
    get new_gift_exchange_url
    assert_response :success
  end

  test "should create gift_exchange" do
    assert_difference('GiftExchange.count') do
      post gift_exchanges_url, params: { gift_exchange: { event_id: @gift_exchange.event_id, recipient_id: @gift_exchange.recipient_id, sender_id: @gift_exchange.sender_id, wishlist_item_id: @gift_exchange.wishlist_item_id } }
    end

    assert_redirected_to gift_exchange_url(GiftExchange.last)
  end

  test "should show gift_exchange" do
    get gift_exchange_url(@gift_exchange)
    assert_response :success
  end

  test "should get edit" do
    get edit_gift_exchange_url(@gift_exchange)
    assert_response :success
  end

  test "should update gift_exchange" do
    patch gift_exchange_url(@gift_exchange), params: { gift_exchange: { event_id: @gift_exchange.event_id, recipient_id: @gift_exchange.recipient_id, sender_id: @gift_exchange.sender_id, wishlist_item_id: @gift_exchange.wishlist_item_id } }
    assert_redirected_to gift_exchange_url(@gift_exchange)
  end

  test "should destroy gift_exchange" do
    assert_difference('GiftExchange.count', -1) do
      delete gift_exchange_url(@gift_exchange)
    end

    assert_redirected_to gift_exchanges_url
  end
end
