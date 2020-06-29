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
      profit = prices[i] - value > profit ? prices[i] - value : profit
    end
    profits_per_day[profit] = [index, i]
  end
  return profits_per_day.max_by{|k,v| k}[1]
end
p stock_picker([17,3,6,9,15,8,6,1,10])
#definisci hash PROFITS_PER_DAY
#per ogni VALORE di prices
  #se e' l'ultimo valore esci
  #definisci variabile PROFIT uguale a nextValue - VALORE
  #se INDEX di VALORE + 2 = length - 1
    #salva in PROFITS_PER_DAY la key corrispondente a VALORE e value a PROFIT
    #esci
  #per ogni PRICE in prices a partire da index di VALORE + 2
    #PROFIT = PRICE - VALUE > PROFIT ? PRICE - VALUE : PROFIT
  #salva in PROFITS_PER_DAY la key corrispondente a VALORE e value a PROFIT
#ritorna un array due elementi dove il primo e' la key con valore piu' alto ed il secondo il valore della key
