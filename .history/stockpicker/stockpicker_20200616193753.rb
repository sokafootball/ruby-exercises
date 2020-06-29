#Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
#It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
#NOTE:You need to buy before you can sell
#EXAMPLE
#  > stock_picker([17,3,6,9,15,8,6,1,10])
#=> [1,4]  # for a profit of $15 - $3 == $12

def stock_picker(prices)
  profits_per_day = {}
  prices.each_with_index do |value, index|
    break if index == prices.length - 1
    profit = prices[index + 1] - value
    if (index + 1 == prices.length - 1)
      profits_per_day[profit] = [index, index + 1]
      break
    end

    for i in (index + 2..prices.length - 1)
      if (prices[i] - value > profit)
        profit = prices[i] - value
        profits_per_day[profit] = [index, i]
      end
    end
  end
  return profits_per_day.max_by{|k,v| k}[1]
end
p stock_picker([17,3,6,9,15,8,6,1,10])
