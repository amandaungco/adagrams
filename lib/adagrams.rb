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

def uses_available_letters?(user_input_word, letter_bank)

end
