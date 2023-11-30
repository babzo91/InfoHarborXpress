module IkeaHelper
  def ikea(input)
    result = scrap(input)
    kiwi = []
    result.css('div.plp-fragment-wrapper').each do |item|
      name = item.css('h3').text
      price = item.css('span.pip-temp-price--medium').text.split("P").first
      image = item.css('img').attribute('src').to_s
      kiwi << { name: name, price: price, image: image }
    end
    return kiwi
  end
end
