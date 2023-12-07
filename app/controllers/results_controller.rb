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

  def destroy
    @result = Result.find(params[:id])
    @result.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def result_params
    params.require(:result).permit(:search_id)
  end
end
