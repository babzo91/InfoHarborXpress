class SearchesController < ApplicationController

  def create
    @search = Search.new(search_params)
    @search.user = current_user
    if @search.save
      redirect_to search_path(@search)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def search_params
    params.require(:search).permit(:url)
  end
end
