#Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
#It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
#NOTE:You need to buy before you can sell
#EXAMPLE
#  > stock_picker([17,3,6,9,15,8,6,1,10])
#=> [1,4]  # for a profit of $15 - $3 == $12

def stock_picker(prices)

end
#definisci array PROFITS
#per ogni VALORE di prices
  #se e' l'ultimo valore esci
  #definisci variabile PROFIT uguale a nextValue - VALORE
  #se INDEX di VALORE + 2 = length - 1 esci
  #per ogni PRICE in prices a partire da index di VALORE + 2
    #PROFIT = PRICE - VALUE > PROFIT ? PRICE - VALUE : PROFIT
