module AubadeHelper
  def aubade(input)
    result = scrap(input)
    kiwi = []
    result.css('div.content').each do |item|
      puts name = item.css('p.series').text.strip
      puts price = item.css('span.vk').text.strip
      kiwi << { name: name, price: price }
    end
    return kiwi
  end
end
