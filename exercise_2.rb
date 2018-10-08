=begin
#before
def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  ciphertext_chars = plaintext.chars.map do |char|
    (65 + cipher.find_index(char)).chr
  end
  ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[65 - char.ord]
  end
  plaintext_chars.join
end
=end
#after
def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars) # needs to be 2 dots and not 3 to go from 'a' to 'z'
  ciphertext_chars = plaintext.chars.map do |char|
    (65 + cipher.find_index(char).to_i).chr  # added to to_i as it needs to be an integer to work with +.
  end
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars) # needs to be 2 dots and not 3 to go from 'a' to 'z'
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[char.ord - 65] # moved the 65 and char.ord around to get the correct output
  end
  puts plaintext_chars 
  plaintext_chars.join
end
# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
#decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"
