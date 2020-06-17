#Build a method #bubble_sort that takes an array and returns a sorted array.
#It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).

def bubble_sort(array)
  array.length-1.times do
    any_swap = false
    array.length-2.times do |index|
      if (array[index] > array[index+1])
        array[index], array[index+1] = array[index+1], array[index]
        any_swap = true
      end
    end
    break if any_swap == false
  end
  return array
end

bubble_sort([3,1,5,2])

#per un numero di volte uguale a lunghezza array - 1
  #dichiaro any_swap = false
    #per ogni number in array tranne ultimo //(0..array.length-2).each_with_index
      #se array[index] >  array[index + 1]
        #swappa
        #setta any_swap a true
  #se any_swap
    #break
#ritorno array
    # PER SWAPPARE self[a], self[b] = self[b], self[a]
