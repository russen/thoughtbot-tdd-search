require 'spec_helper'

describe "as a guest, I should see the correct number of results from a Twitter search" do
  it "should show me 15 results" do
    search_page = SearchesOnPage.new('#coffee')
    search_page.create

    expect(search_page.result_count).to eq 15
  end
end