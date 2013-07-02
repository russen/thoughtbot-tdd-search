class SearchesController < ApplicationController

  def new
    @search = search
  end

  def show
    @search = search params[:id]
    @results = results
  end

  def create
    redirect_to search_path(search(params[:search][:hash_tag]).hash_tag)
  end


  private
  def search id = nil
    Search.new hash_tag: id
  end

  def results
    search.results
  end

end