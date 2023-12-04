module AubadeHelper
  def aubade(input)
    result = scrap(input)
    kiwi = []
    result.css('div.content').each do |item|
      name = item.css('p.series').text.strip
      price = item.css('span.vk').text.strip
      image = item.css('img.model-image').attribute('data-src').to_s
      kiwi << { name: name, price: price, image: image }
      end
    return kiwi
  end
end
