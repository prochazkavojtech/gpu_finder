require "test_helper"

class GraphicCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @graphic_card = graphic_cards(:one)
  end

  test "should get index" do
    get graphic_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_graphic_card_url
    assert_response :success
  end

  test "should create graphic_card" do
    assert_difference('GraphicCard.count') do
      post graphic_cards_url, params: { graphic_card: {  } }
    end

    assert_redirected_to graphic_card_url(GraphicCard.last)
  end

  test "should show graphic_card" do
    get graphic_card_url(@graphic_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_graphic_card_url(@graphic_card)
    assert_response :success
  end

  test "should update graphic_card" do
    patch graphic_card_url(@graphic_card), params: { graphic_card: {  } }
    assert_redirected_to graphic_card_url(@graphic_card)
  end

  test "should destroy graphic_card" do
    assert_difference('GraphicCard.count', -1) do
      delete graphic_card_url(@graphic_card)
    end

    assert_redirected_to graphic_cards_url
  end
end
