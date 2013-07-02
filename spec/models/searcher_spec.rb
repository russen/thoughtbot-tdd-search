require 'spec_helper'

describe Searcher, '#statuses' do
  it 'returns returns from Twitter for the correct' do
    results = stub('results', results: [])
    Twitter.stubs(search: results)

    Searcher.new('foo').statuses

    expect(Twitter).to have_received(:search).with('foo')
    expect(results).to have_received(:results)
  end
end