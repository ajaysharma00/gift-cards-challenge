require 'test_helper'

class GiftCardsControllerTest < ActionController::TestCase

  # Clear all gift cards in the test database
  GiftCard.delete_all

  # called before every single test
  setup do
    @gift_card = GiftCard.new( { :sender => "Igor", :receiver => "Paulo", :descripion => "Presente de aniversario", :value => 3.00 } )
  end

  # called after every single test
  def teardown

  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gift_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gift_card" do
    assert_difference('GiftCard.count') do
      post :create, gift_card: { description: @gift_card.description, receiver: @gift_card.receiver, sender: @gift_card.sender, value: @gift_card.value }
    end

    assert_redirected_to gift_card_path(assigns(:gift_card))
  end

  test "should show gift_card" do
    @gift_card.save
    get :show, id: @gift_card
    assert_response :success
  end

  test "should get edit" do
    @gift_card.save
    get :edit, id: @gift_card
    assert_response :success
  end

  test "should update gift_card" do
    @gift_card.save
    put :update, id: @gift_card, gift_card: { description: @gift_card.description, receiver: @gift_card.receiver, sender: @gift_card.sender, value: @gift_card.value }
    assert_redirected_to gift_card_path(assigns(:gift_card))
  end

  test "should destroy gift_card" do

    @gift_card.save
    assert_difference('GiftCard.count', -1) do
      delete :destroy, id: @gift_card
    end

    assert_redirected_to gift_cards_path
  end
end
