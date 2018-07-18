def draw_letters
  letter_pool_array = [
    "A", "A", "A", "A", "A", "A", "A", "A", "A",
    "B", "B",
    "C", "C",
    "D", "D", "D", "D",
    "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E",
    "F", "F",
    "G", "G", "G",
    "H", "H",
    "I", "I", "I", "I", "I", "I", "I", "I", "I",
    "J", "K",
    "L", "L", "L", "L",
    "M", "M",
    "N", "N", "N", "N", "N", "N",
    "O", "O", "O", "O", "O", "O", "O", "O",
    "P", "P", "Q",
    "R", "R", "R", "R", "R", "R",
    "S", "S", "S", "S",
    "T", "T", "T", "T", "T", "T",
    "U", "U", "U", "U",
    "V", "V",
    "W", "W",
    "X", "Y", "Y", "Z"
  ]
  drawn_letters = []
  10.times do |letter|
    drawn_letters << letter_pool_array.shuffle.pop
  end
  drawn_letters
end

def uses_available_letters? input, letter_bank
  input_array = input.upcase.split('')
  letter_hash = {}

  letter_bank.each do |letter|
    letter_hash[letter] = letter_hash[letter] ? letter_hash[letter] + 1 : 1
  end

  input_array.each do |letter|
    if letter_hash[letter]
      if letter_hash[letter] < 1
        return false
      else
        letter_hash[letter] -= 1
      end
    else
      return false
    end
  end

  true
end

def is_alpha? input
  is_alpha = true
  input.split('').each do |letter|
    if !letter.match(/[a-zA-Z]+/)
      is_alpha = false
    end
  end
  is_alpha
end

def score_word input
  letter_scores = {
      "A"=>1,
      "E"=>1,
      "I"=>1,
      "O"=>1,
      "U"=>1,
      "L"=>1,
      "N"=>1,
      "R"=>1,
      "S"=>1,
      "T"=>1,
      "D"=>2,
      "G"=>2,
      "B"=>3,
      "C"=>3,
      "M"=>3,
      "P"=>3,
      "F"=>4,
      "H"=>4,
      "V"=>4,
      "W"=>4,
      "Y"=>4,
      "K"=>5,
      "J"=>8,
      "X"=>8,
      "Q"=>10,
      "Z"=>10
    }

  total_score = 0

  letters = input.upcase.split('')

  letters.each do |letter|
    total_score += letter_scores[letter]
  end

  total_score
end