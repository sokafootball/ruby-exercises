require 'pry'
#definire un metodo che prende una stringa String e un array Substring di stringhe.
#ritornare un hash le cui key sono stringhe dell'array contenuto nella stringa ed il valore il numero di volte che sono contenute
def substrings(string, dictionary)
  substrings_hash = {}
  arr_of_strings = string.downcase.split
  dictionary.each do |substring|
    binding.pry
    occurrences = 0
    arr_of_strings.each do |string|
      occurrences++ if string.include? substring
        binding.pry
    end
    substring_hash[substring] = occurrences if occurrences > 0
    binding.pry
  end
  return substring_hash
end
end
p substrings("ciao a tutti belli e brutti", ["ciao", "b", "br"])
