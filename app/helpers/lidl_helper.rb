module LidlHelper
 require 'csv'

  def lidl(input)
    kiwi = []
    result = scrap(input)
    result.css('li[id^="product_"]').each do |item|
      name = item.at_css('div[data-grid-label="grid-fragment"]').attr('data-grid-data').scan(/"fullTitle":"([^"]*)"/).flatten.first
      img = item.at_css('div[data-grid-label="grid-fragment"]').attr('data-grid-data').scan(/"image":"([^"]*)"/).flatten.first
      price = item.at_css('div[data-grid-label="grid-fragment"]').attr('data-grid-data').scan(/"price":(\d+\.\d+)/).flatten.first
      link = "lidl.fr#{item.at_css('div[data-grid-label="grid-fragment"]').attr('data-grid-data')}"
      kiwi << { name: name, price: price, img: img, link: link }
    end
    kiwi
  end

  def search_one_lidl(input)
    kiwi = []
    result = scrap(input)
    name = result.css('h1.keyfacts__title').text.strip
    img = result.css('img.gallery-image__img').attr('src').value
    price = result.css('div.m-price__price').text.strip
    link = input
    kiwi << { name: name, price: price, img: img, link: link }
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
