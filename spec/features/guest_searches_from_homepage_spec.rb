require 'spec_helper'

describe "as a guest, I should be able to search twitter for a hash tag from the hompage" do

  it "should show me the homepage" do
    visit root_path
    expect(page).to have_css 'header', text: 'Search'

    search_page = SearchesOnPage.new('#coffee')
    search_page.create

    expect(search_page).to have_results
  end

end