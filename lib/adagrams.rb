require "pry"
SCORE_TO_LETTERS = {1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"], 2 => ["d", "g"], 3 => ["b", "c", "m", "p"],
  4 => ["f", "h", "v", "w", "y"], 5 => ["k"], 8 => ["j", "x"], 10 => ["q", "z"]}
LETTERS_TO_QUANTITY = {"a" => 9, "b" => 2, "c" => 2, "d" => 4, "e" => 12, "f" => 2, "g" => 3, "h"=> 2, "i" => 9, "j" => 1, "k" => 1,
    "l" => 4, "m" => 2, "n" => 6, "o" => 8, "p" => 2, "q"=> 1, "r" => 6, "s" => 4, "t" => 6, "u"=> 4, "v" => 2,
    "w" => 2, "x" => 1, "y"=> 2, "z" => 1}
def draw_letters
  letter_bank = Array.new
  10.times do
    random_letter_picked = LETTERS_TO_QUANTITY.keys.sample
    letter_bank << random_letter_picked
    while letter_bank.count(random_letter_picked) > LETTERS_TO_QUANTITY[random_letter_picked]
      letter_bank.pop #what happens if you pop out letter and put back in the same letter from the next line
      random_letter_picked = LETTERS_TO_QUANTITY.keys.sample
      letter_bank << random_letter_picked
    end
  end
  return letter_bank
end


def letters_to_hash(letters)
  letter_to_quantity = Hash.new(0)
  letters.each do |letter|
    letter_to_quantity[letter] +=1
    end
 return letter_to_quantity
end

def uses_available_letters?(user_input_word, letter_bank)
  array_of_input_letters = user_input_word.split('')
  letter_bank_hash = letters_to_hash(letter_bank)
  user_input_letters_hash = letters_to_hash(array_of_input_letters)
  output = true
  user_input_letters_hash.each do |key,value|
    if !letter_bank_hash.keys.include?(key) # look at looping of outputs, see what happens if use
      output = false
    elsif user_input_letters_hash[key] > letter_bank_hash[key]
      output= false
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
      array_of_letter_scores = []
      user_input_word_hash.each do |word_key, word_value|
        SCORE_TO_LETTERS.each do |score_key, score_value|
          if score_value.include?(word_key)
            score = score_key*word_value
            array_of_letter_scores.push(score)
          end
        end
      end
      total_score =  array_of_letter_scores.reduce(:+)
      if user_input_word.length >= 7 && user_input_word.length < 11
        total_score += 8
      end
      return total_score
    end
  end
#played_words = ['BBBBBB', 'AAAAAAAAAA']

def highest_score_from(played_words)
  collection_of_played_words_and_scores = []#array of hashes
  played_words.each do |word|
    played_word_to_score = {} #how to deal with word duplicates
    played_word_to_score[:word] = word
    played_word_to_score[:score] = score_word(word)
    collection_of_played_words_and_scores.push(played_word_to_score)
  end
  top_score = collection_of_played_words_and_scores.reduce(0){ |memo, h| h[:score] > memo ? h[:score] : memo } # ==> {score: n}
  tied_highest_scores = collection_of_played_words_and_scores.select {|h| h[:score].to_i == top_score} #highest_score[:score]} # all the hashes in an array
  highest_score_hash = tied_highest_scores.find {|h| h[:word].length == 10}
  if highest_score_hash == nil
    highest_score_hash = tied_highest_scores.min_by{|h| h[:word].length}
  end
  return highest_score_hash #supposed to be a hash
end
