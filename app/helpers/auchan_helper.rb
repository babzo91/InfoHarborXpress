module AuchanHelper
  def auchan(input)
    result = scrap(input)
    kiwi = []
    result.css('div.product-thumbnail__content-wrapper').each do |item|
      name = item.css('p.product-thumbnail__description').text.strip
      price = item.at_css('meta[itemprop="price"]')['content'] + " €"
      puts img = item.at_css('img')['src']
      kiwi << { name: name, price: price, img: img }
    end
    kiwi
  end
end
