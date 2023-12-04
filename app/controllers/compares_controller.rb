class ComparesController < ApplicationController
  def new
    @compare = Compare.new
  end

  def create
    @compare = Compare.new(compare_params)
    if @compare.save
      redirect_to compare_path(@compare)
    else
      redirect_to new_compare_path, status: :unprocessable_entity
    end
  end

  def show
    @compare = Compare.find(params[:id])

    if @compare.url1.include?("auchan")
      @url1 = helpers.auchan(@compare.url1)
    elsif @compare.url1.include?("lidl")
      @url1 = helpers.search_one_lidl(@compare.url1)
    elsif @compare.url1.include?("grosbill")
      @url1 = helpers.search_one_grosbill(@compare.url1)
    end

    if @compare.url2.include?("auchan")
      @url2 = helpers.auchan(@compare.url2)
    elsif @compare.url2.include?("lidl")
      @url2 = helpers.search_one_lidl(@compare.url2)
    elsif @compare.url2.include?("grosbill")
      @url2 = helpers.search_one_grosbill(@compare.url2)
    end

  end

  private

  def compare_params
    params.require(:compare).permit(:url1, :url2)
  end
end
