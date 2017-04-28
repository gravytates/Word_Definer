require "capybara/rspec"
require "./app"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the word creation path", {:type => :feature}) do
  it("processes the user input and adds word to words array") do
    visit("/word/new")
    fill_in("spelling", :with => "yolo")
    click_button("Add Word")
    expect(page).to have_content("Stupendously Awesome")
  end
end
