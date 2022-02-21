require "application_system_test_case"

class AppmapsTest < ApplicationSystemTestCase
  setup do
    @appmap = appmaps(:one)
  end

  test "visiting the index" do
    visit appmaps_url
    assert_selector "h1", text: "Appmaps"
  end

  test "should create appmap" do
    visit appmaps_url
    click_on "New appmap"

    fill_in "Path", with: @appmap.path
    click_on "Create Appmap"

    assert_text "Appmap was successfully created"
    click_on "Back"
  end

  test "should update Appmap" do
    visit appmap_url(@appmap)
    click_on "Edit this appmap", match: :first

    fill_in "Path", with: @appmap.path
    click_on "Update Appmap"

    assert_text "Appmap was successfully updated"
    click_on "Back"
  end

  test "should destroy Appmap" do
    visit appmap_url(@appmap)
    click_on "Destroy this appmap", match: :first

    assert_text "Appmap was successfully destroyed"
  end
end
