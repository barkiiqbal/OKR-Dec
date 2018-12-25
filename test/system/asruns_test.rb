require "application_system_test_case"

class AsrunsTest < ApplicationSystemTestCase
  setup do
    @asrun = asruns(:one)
  end

  test "visiting the index" do
    visit asruns_url
    assert_selector "h1", text: "Asruns"
  end

  test "creating a Asrun" do
    visit asruns_url
    click_on "New Asrun"

    fill_in "Name", with: @asrun.name
    click_on "Create Asrun"

    assert_text "Asrun was successfully created"
    click_on "Back"
  end

  test "updating a Asrun" do
    visit asruns_url
    click_on "Edit", match: :first

    fill_in "Name", with: @asrun.name
    click_on "Update Asrun"

    assert_text "Asrun was successfully updated"
    click_on "Back"
  end

  test "destroying a Asrun" do
    visit asruns_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Asrun was successfully destroyed"
  end
end
