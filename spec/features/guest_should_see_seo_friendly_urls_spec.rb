require 'spec_helper'

describe "as a guest, I should see SEO-friendly URLs when viewing search results" do
  it "should show me /searches/coffee" do
    search_page = SearchesOnPage.new('#coffee')
    search_page.create

    expect(current_path).to eq "/searches/coffee"
  end
end