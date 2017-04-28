require "capybara/rspec"
require "./app"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the definition creation path", {:type => :feature}) do
  it("processes the user input and adds definitions to a word") do
    @word = Word.new({:spelling => 'frazzles'})
    visit("/#{@word.id}/definition/new")
    fill_in("meaning", :with => "terrible phrase")
    click_button("Add Definition")
    expect(page).to have_content("Stupendously Awesome")
  end
end
