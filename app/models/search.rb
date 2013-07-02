class Search
  include ActiveModel::Model
  class_attribute :backend
  self.backend = Twitter

  attr_accessor :hash_tag

  def results
    search ? search.results : []
  end

  def search
    @search ||= backend.search(formatted_hash_tag) if hash_tag
  end

  def hash_tag= (text)
    @hash_tag = text.gsub('#','') if text
  end

  def formatted_hash_tag
    '#' + hash_tag
  end


end