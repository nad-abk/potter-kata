class Potter

  BOOK_UNIT_PRICE = 8

  PRICES = {
    1 => 1 * BOOK_UNIT_PRICE ,
    2 => 2 * BOOK_UNIT_PRICE * 0.95,
    3 => 3 * BOOK_UNIT_PRICE * 0.90,
    4 => 4 * BOOK_UNIT_PRICE * 0.8,
    5 => 5 * BOOK_UNIT_PRICE * 0.75
  }

  def calculate(basket=[])
    price = 0
    unless basket==[]
      price = PRICES[basket.size]
    end
    price
  end


end
