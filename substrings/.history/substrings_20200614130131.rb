require 'pry'
#definire un metodo che prende una stringa String e un array Substring di stringhe.
#ritornare un hash le cui key sono stringhe dell'array contenuto nella stringa ed il valore il numero di volte che sono contenute
def substrings(string, dictionary)
  substrings_hash = {}
  arr_of_strings = string.downcase.split
  dictionary.each |substring| do
    p substring
  end

end

p substrings("ciao a tutti belli e brutti", ["ciao", "b", "br"])
#definisco un hash di ritorno substrings_hash
#definisco un array arr_of_strings che contiente String.downcase.split
#per ogni stringa in Substring
  #definisco variabile counter uguale a 0
  #per ogni string in arr_of_strings
   #se substring e' contenuta in string
   #incremento counter
  #se counter > 0
    #aggiungo una key corrispondente in substring_hash e la valorizzo a counter
#ritorno substrings_hash
