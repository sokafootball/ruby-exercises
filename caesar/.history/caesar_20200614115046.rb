#data una stringa s ed un numero intero x, ritornare S con ogni lettera shiftata di posizione nell'alfabeto x volte
#####################
def caesar_encrypt(string, shift)
  #dichiarare un array di caratteri per l'alfabeto
  array = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
  #trasformare la stringa in array di caratteri
  string = string.chars
  #mappare ogni carattere al corrispondente carattere shiftato
  string = string.map do |char, idx|
  #se e' un simbolo o numero mapparlo direttamente senza cambiarlo
    if !isLetter?(char)
      char
    else

    end
    #altrimenti
      #salvare su un boolean se la lettera e' maiuscola o minuscola
    is_lower_case = char.ord >= 97
    char.downCase!

      #trovare la lettera ridotta a minuscolo nell'alfabeto e salvare l'indice in IDX
      #se IDX + X vanno oltre la lunghezza dell'array-1
        #trovare la lettera che all'indice (x - (lunghezza - 1 - idx) - 1)
        #convertirla a maiuscola se necessario e mapparla
      #altrimenti
        #mappare la lettera all'indice idx + x convertendola a maiuscolo se necessario
  end
  #costituire una stringa dal nuovo array
  #tornare la stringa
  return string
end

def isLetter?(char)
  regex_result = char =~ /[[:alpha:]]/
  return regex_result != nil
end

p caesar_encrypt("This is a Test!", 1)
