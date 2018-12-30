require "application_system_test_case"

class LogsTest < ApplicationSystemTestCase
  setup do
    @log = logs(:one)
  end

  test "visiting the index" do
    visit logs_url
    assert_selector "h1", text: "Logs"
  end

  test "creating a Log" do
    visit logs_url
    click_on "New Log"

    fill_in "C1", with: @log.c1
    fill_in "C10", with: @log.c10
    fill_in "C11", with: @log.c11
    fill_in "C12", with: @log.c12
    fill_in "C13", with: @log.c13
    fill_in "C2", with: @log.c2
    fill_in "C3", with: @log.c3
    fill_in "C4", with: @log.c4
    fill_in "C5", with: @log.c5
    fill_in "C6", with: @log.c6
    fill_in "C7", with: @log.c7
    fill_in "C8", with: @log.c8
    fill_in "C9", with: @log.c9
    click_on "Create Log"

    assert_text "Log was successfully created"
    click_on "Back"
  end

  test "updating a Log" do
    visit logs_url
    click_on "Edit", match: :first

    fill_in "C1", with: @log.c1
    fill_in "C10", with: @log.c10
    fill_in "C11", with: @log.c11
    fill_in "C12", with: @log.c12
    fill_in "C13", with: @log.c13
    fill_in "C2", with: @log.c2
    fill_in "C3", with: @log.c3
    fill_in "C4", with: @log.c4
    fill_in "C5", with: @log.c5
    fill_in "C6", with: @log.c6
    fill_in "C7", with: @log.c7
    fill_in "C8", with: @log.c8
    fill_in "C9", with: @log.c9
    click_on "Update Log"

    assert_text "Log was successfully updated"
    click_on "Back"
  end

  test "destroying a Log" do
    visit logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Log was successfully destroyed"
  end
end
