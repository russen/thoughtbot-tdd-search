require 'spec_helper'

describe "as a guest, I should be able to search without adding a # to my search" do
  it "should show me my search term" do
    search_page = SearchesOnPage.new('#coffee')
    search_page.create

    expect(page).to have_field('Hash tag', with: 'coffee')

    expect(page).to have_css 'li', text: /#{'#coffee'}/i, count: 15
  end
end