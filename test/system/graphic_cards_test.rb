require "application_system_test_case"

class GraphicCardsTest < ApplicationSystemTestCase
  setup do
    @graphic_card = graphic_cards(:one)
  end

  test "visiting the index" do
    visit graphic_cards_url
    assert_selector "h1", text: "Graphic Cards"
  end

  test "creating a Graphic card" do
    visit graphic_cards_url
    click_on "New Graphic Card"

    click_on "Create Graphic card"

    assert_text "Graphic card was successfully created"
    click_on "Back"
  end

  test "updating a Graphic card" do
    visit graphic_cards_url
    click_on "Edit", match: :first

    click_on "Update Graphic card"

    assert_text "Graphic card was successfully updated"
    click_on "Back"
  end

  test "destroying a Graphic card" do
    visit graphic_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Graphic card was successfully destroyed"
  end
end
