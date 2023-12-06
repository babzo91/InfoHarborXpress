class SearchesController < ApplicationController
  include ScrapHelper

  def show
    @search = Search.find(params[:id])
    if @search.url.include?("auchan")
      @kiwis = helpers.auchan(@search.url)
      Result.create(search: @search, csv_file: @kiwis)

    elsif @search.url.include?("lidl")
      @kiwis = helpers.lidl(@search.url)
      Result.create(search: @search, csv_file: @kiwis)

    elsif @search.url.include?("grosbill")
      @kiwis = helpers.grosbill(@search.url)
      Result.create(search: @search, csv_file: @kiwis)

    elsif @search.name == "aubade"
      @kiwis = helpers.aubade(@search.url)
    elsif @search.name == "ikea"
      @kiwis = helpers.ikea(@search.url)
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def

  def create
    @search = Search.new(search_params)
    @search.user = current_user
    if @search.save
      redirect_to search_path(@search)
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def destroy
    @search = Search.find(params[:id])

    Result.where(search_id: @search.id).destroy_all

    @search.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def search_params
    params.require(:search).permit(:url, :name)
  end
end
