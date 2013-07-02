class FakeTwitter
  @tweet_dictionary = Hash.new([])

  def self.reset
    @tweet_dictionary = Hash.new([])
  end

  def self.searching_for(term)
    Searcher.backend = FakeTwitter
    Search.backend = FakeTwitter
    SearchResults.new(term, @tweet_dictionary)
  end

  def self.search(term)
    statuses = @tweet_dictionary[term].map { |tweet|
      Twitter::Status.new(tweet.merge(id: 12345))
     }
    OpenStruct.new(results: statuses)
  end

  class SearchResults
    def initialize(term, tweet_dictionary)
      @term = term
      @tweet_dictionary = tweet_dictionary
    end

    def returns(value)
      @tweet_dictionary[@term] = value
    end
  end
end