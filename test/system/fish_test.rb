require "application_system_test_case"

class FishTest < ApplicationSystemTestCase
  setup do
    @fish = fish(:one)
  end

  test "visiting the index" do
    visit fish_url
    assert_selector "h1", text: "Fish"
  end

  test "should create fish" do
    visit fish_url
    click_on "New fish"

    fill_in "Name", with: @fish.name
    fill_in "Price", with: @fish.price
    click_on "Create Fish"

    assert_text "Fish was successfully created"
    click_on "Back"
  end

  test "should update Fish" do
    visit fish_url(@fish)
    click_on "Edit this fish", match: :first

    fill_in "Name", with: @fish.name
    fill_in "Price", with: @fish.price
    click_on "Update Fish"

    assert_text "Fish was successfully updated"
    click_on "Back"
  end

  test "should destroy Fish" do
    visit fish_url(@fish)
    click_on "Destroy this fish", match: :first

    assert_text "Fish was successfully destroyed"
  end
end
