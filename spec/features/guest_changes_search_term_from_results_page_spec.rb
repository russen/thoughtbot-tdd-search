require 'spec_helper'

describe "as a guest, I should see a form and be able to change my search term from the search results page" do
  it "should show me my search term" do
    visit root_path
    expect(page).to have_css 'header', text: 'Search'

    search_page = SearchesOnPage.new('#coffee')
    search_page.create

    expect(page).to have_field('Hash tag', with: 'coffee')
  end
end