class Potter

  BOOK_UNIT_PRICE = 8

  PRICES = {
    1 => 1 * BOOK_UNIT_PRICE ,
    2 => 2 * BOOK_UNIT_PRICE * 0.95,
    3 => 3 * BOOK_UNIT_PRICE * 0.90,
    4 => 4 * BOOK_UNIT_PRICE * 0.8,
    5 => 5 * BOOK_UNIT_PRICE * 0.75
  }
  
  def set_of_uniq_books(basket)
    basket.uniq
  end
  
  def rest_of_basket(basket, set)
    set.each do |val|
      index = basket.index(val)
      basket.delete_at(index) unless index.nil?
    end
    basket
  end
  
  def sort_basket_to_sets(basket, result=[])
    other_set = Array.new
    other_set = set_of_uniq_books(basket)
    result.push(other_set)
    unless basket == other_set
      new_basket = rest_of_basket(basket, other_set)
      sort_basket_to_sets(new_basket,result)
    else
      result
    end
  end

  def get_pair_of_3_and_5(result)
    result.chunk_while { |i,j|
      i.size == 5 && j.size == 3
    }.to_a
  end
  
  def swap_to_be_clever(result)
    pairs = get_pair_of_3_and_5(result)
    pair = pairs.select{ |n| n.size == 2 }
    first = result.find_index(pair[0].first)
    second = result.find_index(pair[0].last)
    substract = result[first] - result[second]
    result[second].push(substract.last)
    result[first].pop
    return result
  end
  
  def calculate(basket)
    sub_total = 0
    price = 0
    unless basket==[]
      final_basket = if basket.size >= 8 then
                      swap_to_be_clever(sort_basket_to_sets(basket))
                    else
                      sort_basket_to_sets(basket)
                    end
      final_basket.each do |fb|
        sub_total = PRICES[fb.size]
        price += sub_total
      end
    end
    price
  end


end
