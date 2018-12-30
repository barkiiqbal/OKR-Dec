require "application_system_test_case"

class AsRunsTest < ApplicationSystemTestCase
  setup do
    @as_run = as_runs(:one)
  end

  test "visiting the index" do
    visit as_runs_url
    assert_selector "h1", text: "As Runs"
  end

  test "creating a As run" do
    visit as_runs_url
    click_on "New As Run"

    fill_in "Attachment", with: @as_run.attachment
    fill_in "Name", with: @as_run.name
    click_on "Create As run"

    assert_text "As run was successfully created"
    click_on "Back"
  end

  test "updating a As run" do
    visit as_runs_url
    click_on "Edit", match: :first

    fill_in "Attachment", with: @as_run.attachment
    fill_in "Name", with: @as_run.name
    click_on "Update As run"

    assert_text "As run was successfully updated"
    click_on "Back"
  end

  test "destroying a As run" do
    visit as_runs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "As run was successfully destroyed"
  end
end
