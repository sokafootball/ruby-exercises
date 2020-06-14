def caesar_encrypt(string, shift)
  alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
  string = string.chars
  string = string.map.with_index do |char, idx|
    if !isLetter?(char)
      char
    else
      is_lower_case = char.ord >= 97
      alphabet_index = alphabet.find_index(char.downcase)
      if alphabet_index + shift >= alphabet.length - 1
        char = alphabet.fetch(shift - alphabet.length - idx)
        is_lower_case ? char : char.upcase
      else
        char = alphabet.fetch(alphabet_index + shift)
        is_lower_case ? char : char.upcase
      end
    end
  end
  return string.join
end
def isLetter?(char)
  regex_result = char =~ /[[:alpha:]]/
  return regex_result != nil
end
p caesar_encrypt("This is a Test!", 5)
