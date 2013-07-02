require 'spec_helper'

describe FakeTwitter do
  it 'responds to searching_for' do

    FakeTwitter.searching_for('#rails').returns([
      {text: 'I love #rails'}
    ])

    statuses = FakeTwitter.search('#rails').results

    expect(statuses.first.text).to eq 'I love #rails'
  end


end