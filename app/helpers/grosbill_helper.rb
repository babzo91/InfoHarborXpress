module GrosbillHelper
  require 'csv'

  def scanurl(input)
    result = scrap(input)
    result.css('li a').map {|item| "https://www.grosbill.com#{item.attribute('href').to_s}"}
  end

  def grosbill(input)
    kiwi = []
    result = scrap(input)
    result.css('div.listing_dispo').each do |item|
      name = item.css('h2').text.strip
      price = item.at_css('div.grb__liste-produit__liste__produit__achat__prix span').text.strip
      img = "https://www.grosbill.com/#{item.at_css('div.grb__liste-produit__liste__produit__image img').attribute('src').text}"
      link = item.at_css('a').attribute('href').text
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
