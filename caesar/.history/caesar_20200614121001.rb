#data una stringa s ed un numero intero x, ritornare S con ogni lettera shiftata di posizione nell'alfabeto x volte
#####################
def caesar_encrypt(string, shift)
  #dichiarare un array di caratteri per l'alfabeto
  alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
  #trasformare la stringa in array di caratteri
  string = string.chars
  #mappare ogni carattere al corrispondente carattere shiftato
  string = string.map do |char, idx|
  #se e' un simbolo o numero mapparlo direttamente senza cambiarlo
    if !isLetter?(char)
      char
    else
      is_lower_case = char.ord >= 97
      alphabet_index = alphabet.find_index(char.downcase)
      if alphabet_index + shift >= alphabet.length - 1
        char = alphabet.fetch(shift - alphabet.length - idx)
        is_lower_case ? char : char.upcase
      else
        p idx
        alphabet.fetch(idx)
      end
    end
  end

  #costituire una stringa dal nuovo array
  #tornare la stringa
  return string.join
end

def isLetter?(char)
  regex_result = char =~ /[[:alpha:]]/
  return regex_result != nil
end

p caesar_encrypt("This is a Test!", 1)
