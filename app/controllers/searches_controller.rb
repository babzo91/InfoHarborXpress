class SearchesController < ApplicationController

  def show
    @search = Search.find(params[:id])
  end

  def create
    @search = Search.new(search_params)
    @search.user = current_user
    if @search.save
      # redirect_to new_search_result_path(@search)
      redirect_to search_path(@search)
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  private

  def search_params
    params.require(:search).permit(:url, :name)
  end
end
