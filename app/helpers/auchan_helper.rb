module AuchanHelper
  require 'csv'

  def auchan(input)
    kiwi = []
    result = scrap(input)
    result.css('div.product-thumbnail__content-wrapper').each do |item|
      name = item.css('p.product-thumbnail__description').text.strip
      price = item.at_css('meta[itemprop="price"]')['content']
      img = item.at_css('meta[itemprop="image"]')['content']
      link = "https://www.auchan.fr#{item.at_css('a')['href']}"
      kiwi << { name: name, price: price, img: img, link: link }
    end
    kiwi
  end

  def search_one_auchan(input)
    kiwi = []
    result = scrap(input)
    name = result.at_css('meta[property="og:title"]')['content']
    price = result.at_css('meta[itemprop="price"]')['content']
    img = result.at_css('meta[property="og:image"]')['content']
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
end
