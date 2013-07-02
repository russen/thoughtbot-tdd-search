require 'spec_helper'
feature "display results of a fake search" do

  scenario 'displays tweets I control' do
    FakeTwitter.searching_for('#rails').returns([
      {text: "I like #rails"},
      {text: "We can rock on #rails"}
    ])

    visit root_path

    fill_in 'Hash tag', with: '#rails'
    click_on 'Go'

    within 'ul' do
      expect(page).to have_css 'li', text: "I like #rails"
      expect(page).to have_css 'li', text: "We can rock on #rails"
    end

  end

end