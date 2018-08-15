def draw_letters
  letters_to_quantity = {"a" => 9, "b" => 2, "c" => 2, "d" => 4, "e" => 12, "f" => 2, "g" => 3, "h"=> 2, "i" => 9, "j" => 1, "k" => 1,
    "l" => 4, "m" => 2, "n" => 6, "o" => 8, "p" => 2, "q"=> 1, "r" => 6, "s" => 4, "t" => 6, "u"=> 4, "v" => 2,
    "w" => 2, "x" => 1, "y"=> 2, "z" => 1}
  letter_bank= Array.new
  10.times do
    random_letter_picked = letters_to_quantity.keys.sample
    letter_bank << random_letter_picked
    while letter_bank.count(random_letter_picked) > letters_to_quantity[random_letter_picked]
      letter_bank.pop
      random_letter_picked = letters_to_quantity.keys.sample
      letter_bank << random_letter_picked
    end
  end
  return letter_bank
end


def letters_to_hash(letters)
  hash = Hash.new(0)
  letters.each do |letter|
    hash[letter] +=1
    end
 return hash
end

def uses_available_letters?(user_input_word, letter_bank)
  array_of_input_letters = user_input_word.split('')
  letter_bank_hash = letters_to_hash(letter_bank)
  user_input_word_hash = letters_to_hash(array_of_input_letters)
  output = nil
  user_input_word_hash.each do |key,value|
    if !letter_bank_hash.keys.include?(key)
      output = false
    elsif user_input_word_hash[key] > letter_bank_hash[key]
      output= false
    else
      output = true
    end
  end
  return output
end

def score_word(user_input_word) #String
  if user_input_word.length == 0
    total_score = 0
  else
  array_of_input_letters = user_input_word.downcase.split("")
  user_input_word_hash = letters_to_hash(array_of_input_letters)
  score_to_letters = {1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"], 2 => ["d", "g"], 3 => ["b", "c", "m", "p"],
                       4 => ["f", "h", "v", "w", "y"], 5 => ["k"], 8 => ["j", "x"], 10 => ["q", "z"]}
  array_of_letter_scores = []
  user_input_word_hash.each do |word_key, word_value|
    score_to_letters.each do |score_key, score_value|
        if score_value.include?(word_key)
          score = score_key*word_value
          array_of_letter_scores.push(score)
        end
    end
  end
  total_score=  array_of_letter_scores.reduce(:+)
  if user_input_word.length >= 7 && user_input_word.length < 11
  total_score += 8
  end
  return total_score
end
end

  # letter_bank = %w(w a s u p c o w)
# user_input_word = 'cat'
# p uses_available_letters?(user_input_word, letter_bank)
