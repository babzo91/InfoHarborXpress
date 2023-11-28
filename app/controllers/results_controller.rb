class ResultsController < ApplicationController
  def new
    @search = Search.find(params[:search_id])
    @result = Result.new
  end

  def create
    # @search = Search.find(params[:search_id])
    # @result = Result.new(@search)
    # if @result.save!
    #   redirect_to search_result_path(@search, @result)
    # else
    #   render :new, :unprocessable_entity
    # end
  end

  def show
  end

  private

  def result_params
    params.require(:result).permit(:search_id)
  end
end
