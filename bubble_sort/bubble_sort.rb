#Build a method #bubble_sort that takes an array and returns a sorted array.
#It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).

def bubble_sort(array)
  0.upto(array.length-1) do
    any_swap = false
    0.upto(array.length-2) do |index|
      if (array[index] > array[index+1])
        array[index], array[index+1] = array[index+1], array[index]
        any_swap = true
      end
    end
    break if any_swap == false
  end
  return array
end
