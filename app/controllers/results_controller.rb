class ResultsController < ApplicationController

  def save_csv
    @search = Search.find(params[:search_id])
    search_name = @search.name
    data = helpers.auchan(@search.url)
    data.each do |product|
      product[:name] = product[:name].delete(',') if product[:name].present?
    end
    combined_data = {
      search_name: search_name,
      scraped_data: data
    }

    csv_data = helpers.generate_csv_data(combined_data)
    send_data csv_data, filename: "#{search_name}_#{Time.zone.now}.csv"
  end

  def download_csv
    # helpers.write_to_csv(combined_data, "#{search_name}.csv")
    # file_name = "#{@search.name}.csv"
    # helpers.download_csv(file_name)
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
