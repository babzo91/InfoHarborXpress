class ComparesController < ApplicationController
  def new
    @compare = Compare.new
  end

  def create
    @compare = Compare.new(compare_params)
    if @compare.save
      redirect_to compare_path(@compare)
    else
      redirect_to root_path, :unprocessable_entity
    end
  end

  def show
    @compare = Compare.find(params[:id])
    if @compare.url1.include?("auchan")
      @url1 = helpers.search_one_lidl(@compare.url2)
      @url2 = helpers.auchan(@compare.url1)
    elsif @compare.url2.include?("auchan")
      @url1 = helpers.search_one_lidl(@compare.url1)
      @url2 = helpers.auchan(@compare.url2)
    else
      redirect_to root_path, :unprocessable_entity
    end
    puts '-' * 50
    puts @url1
  end

  private

  def compare_params
    params.require(:compare).permit(:url1, :url2)
  end
end
