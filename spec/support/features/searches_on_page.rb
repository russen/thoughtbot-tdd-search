class SearchesOnPage
  include Capybara::DSL
  include Rails.application.routes.url_helpers
  def initialize(hash_tag)
    @hash_tag = hash_tag
  end

  def create
    create_search @hash_tag
  end

  def has_results?
    search_scope.any?
  end

  def result_count
    search_scope.count
  end

  private

  def search_scope
    all('li', text: /#{@hash_tag}/i)
  end

  def create_search hash_tag
    visit new_search_path
    fill_in 'Hash tag', with: hash_tag
    click_on 'Go'
  end
end