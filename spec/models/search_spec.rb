require 'spec_helper'

describe Search, "a new search" do
  it "should be an instance of search" do
    search = Search.new(hash_tag: "coffee")

    expect(search).to be_an_instance_of(Search)
  end
end

describe Search, "#results" do
  it "should return results from the search" do
    search = Search.new(hash_tag: "coffee")

    expect(search.results).to be_present
  end
end

describe Search, '#hash_tag' do
  it "should return the hash tag w/o the #" do
    search = Search.new(hash_tag: '#coffee')

    expect(search.hash_tag).to eq 'coffee'
  end
end