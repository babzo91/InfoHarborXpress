module AuchanHelper
  def auchan(input)
    result = scrap(input)
    kiwi = []
    result.css('div.product-thumbnail__content-wrapper').each do |item|
      name = item.css('p.product-thumbnail__description').text.strip
      price = item.css('div.product-price').text.strip
      kiwi << { name: name, price: price }
    end
    return kiwi
  end
end
