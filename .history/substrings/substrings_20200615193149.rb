#a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument.
#It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.

def substrings(string, dictionary)
  substrings_hash = {}
  arr_of_strings = string.downcase.split
  dictionary.each do |substring|
    occurrences = 0
    arr_of_strings.each do |string|
      occurrences+=1 if string.include? substring
    end
    substrings_hash[substring] = occurrences if occurrences > 0
  end
  return substrings_hash
end
