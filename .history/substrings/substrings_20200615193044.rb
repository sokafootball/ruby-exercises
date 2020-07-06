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
p substrings("ciao a tutti belli e brutti", ["ciao", "b", "br"])
