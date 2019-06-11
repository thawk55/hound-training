defmodule HoundTrainingTest do
  use ExUnit.Case
  doctest HoundTraining
  use Hound.Helpers

  hound_session()

  test "click example" do
    navigate_to("https://www.ultimateqa.com/automation/")
    Process.sleep(1000)
    link = find_element(:css, "a[href='../complicated-page']")
    click(link)
    assert page_title() == "Complicated Page - Ultimate QA"
    assert current_url() == "https://www.ultimateqa.com/complicated-page/"
    Process.sleep(1000)
  end

  test "text field input example" do
    navigate_to("https://www.ultimateqa.com/filling-out-forms/")
    Process.sleep(1000)
    name = find_element(:id, "et_pb_contact_name_0")
    fill_field(name, "Bob Builder")
    assert attribute_value(name, "value") == "Bob Builder"
    Process.sleep(1000)
  end

  test "dropdown example" do
    navigate_to("http://jpstyle.us/contact")
    Process.sleep(1000)
    dropdown = find_element(:id, "edit-submitted-subject")
    option = find_within_element(dropdown, :css, "option[value='support']")
    click(option)
    assert selected?(option)
    Process.sleep(1000)
  end

  test "radio buttons example" do
    navigate_to("http://jpstyle.us/contact")
    Process.sleep(1000)
    reply = find_element(:id, "edit-submitted-no-reply-1")
    click(reply)
    assert selected?(reply)
    Process.sleep(1000)
  end

  test "multiple" do
    navigate_to("http://jpstyle.us/contact")
    Process.sleep(1000)
    countries = find_element(:name, "countries")
    usa = find_within_element(countries, :css, "option[value='US']")
    click(usa)

    Process.sleep(1000)
    email = find_element(:id, "edit-submitted-email")
    fill_field(email, "bobthebuilder@construction.com")
    assert attribute_value(email, "value") == "bobthebuilder@construction.com"

    Process.sleep(1000)
    name = find_element(:id, "edit-submitted-name")
    fill_field(name, "Bob the Builder")
    assert attribute_value(name, "value") == "Bob the Builder"

    Process.sleep(1000)
    dropdown = find_element(:id, "edit-submitted-subject")
    option = find_within_element(dropdown, :css, "option[value='complaint']")
    click(option)

    Process.sleep(1000)
    no_reply = find_element(:id, "edit-submitted-no-reply-2")
    click(no_reply)
    assert selected?(no_reply)
    Process.sleep(1000)
    fill_field({:id, "edit-submitted-message"}, "This is a very serious issue.")
    Process.sleep(1000)
  end

  test "radio selections again" do
    navigate_to("https://www.ultimateqa.com/simple-html-elements-for-automation/")
    Process.sleep(2000)
    click({:css, ".et_pb_blurb_description > form > input[value='male']"})
    Process.sleep(2000)
    click({:css, "input[value='female']"})
    Process.sleep(2000)
  end
end
