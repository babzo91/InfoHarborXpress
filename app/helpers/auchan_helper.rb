module AuchanHelper
  def auchan(input)
    kiwi = []
    result = scrap(input)
    result.css('div.product-thumbnail__content-wrapper').each do |item|
      name = item.css('p.product-thumbnail__description').text.strip
      price = item.css('div.product-price').text.strip
      image = item.css('img').attribute('src').to_s
      kiwi << { name: name, price: price, image: image }
    end
    return kiwi
  end
end
