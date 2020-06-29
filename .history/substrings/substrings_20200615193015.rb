require 'pry'
#definire un metodo che prende una stringa String e un array Substring di stringhe.
#ritornare un hash le cui key sono stringhe dell'array contenuto nella stringa ed il valore il numero di volte che sono contenute
def substrings(string, dictionary)
  substrings_hash = {}
  p substrings_hash
  arr_of_strings = string.downcase.split
  dictionary.each do |substring|
    occurrences = 0
    arr_of_strings.each do |string|
      occurrences+=1 if string.include? substring
    end
    substrings_hash[substring] = occurrences if occurrences > 0
  end
  return substring_hash
end
p substrings("ciao a tutti belli e brutti", ["ciao", "b", "br"])
