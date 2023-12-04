module AuchanHelper
  require 'csv'

  def auchan(input)
    kiwi = []
    result = scrap(input)
    result.css('div.product-thumbnail__content-wrapper').each do |item|
      name = item.css('p.product-thumbnail__description').text.strip
      price = item.at_css('meta[itemprop="price"]')['content']
      img = item.at_css('img')['src']
      link = "https://www.auchan.fr#{item.at_css('a')['href']}"
      kiwi << { name: name, price: price, img: img, link: link }
    end
    kiwi
  end

  def generate_csv_data(data)
    csv_data = CSV.generate(force_quotes: true) do |csv|
      csv << ['URL', 'Produit', 'Prix']
      scraped_data = data[:scraped_data]
      scraped_data.each do |product|
        csv << [product[:link], product[:name], product[:price]]
      end
    end
    return csv_data
  end

  # def write_to_csv(data, file_name)
  #   CSV.open(file_name, 'wb') do |csv|
  #     search_name = data[:search_name]

  #     csv << ['Search URL', 'Product Name', 'Product Price']

  #     scraped_data = data[:scraped_data]
  #     scraped_data.each do |product|
  #       csv << [product[:link], product[:name].gsub(',', ' '), product[:price]]
  #     end
  #   end
  # end
end
