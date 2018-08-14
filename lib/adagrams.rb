def draw_letters
  bag_of_letters = ["a", "a", "a", "a", "a", "a", "a", "a", "a", "b",
    "b", "c", "c", "d", "d", "d", "d", "e", "e", "e", "e", "e", "e", "e",
    "e", "e", "e", "e", "e", "f", "f", "g", "g", "h", "h", "i", "i", "i",
    "i", "i", "i", "i", "i", "i", "j", "k", "l", "l", "l", "l", "m", "m",
    "n", "n", "n", "n", "n", "n", "o", "o", "o", "o", "o", "o", "o", "o",
    "p", "p", "q", "r", "r", "r", "r", "r", "r", "s", "s", "s", "s", "t",
    "t", "t", "t", "t", "t", "u", "u", "u", "u", "v", "v", "w", "w", "x",
    "y", "y", "z"]

    individual_hand = Array.new(10)

    individual_hand.each.with_index do |letter, x|
      bag_of_letters = bag_of_letters.shuffle
      letter = bag_of_letters.pop
      individual_hand[x] = letter
    end

    return individual_hand
end

def uses_available_letters?(word_input, individual_letters)
  individual_letters = individual_letters.map {|x| x.downcase}
  input_divided = word_input.downcase.scan(/\w/)
  # puts in
  input_divided.each do |letter|
    if individual_letters.include?(letter)
      individual_letters.delete_at(individual_letters.index(letter))
    else
      return false
    end
  end
  return true
end

def score_word(word)
  letter_values = {"a" => 1, "b" => 3,"c" => 3, "d" => 2,"e" => 1, "f" => 4,
    "g" => 2, "h" => 4,"i" => 1, "j" => 8,"k" => 5, "l" => 1,"m" => 3,
    "n" => 1,"o" => 1, "p" => 3,"q" => 10, "r" => 1,"s" => 1, "t" => 1,
    "u" => 1, "v" => 4,"w" => 4, "x"=>8, "y" => 4,"z" => 10}
    word_divided = word.downcase.chars
    values = word_divided.map {|letter| letter_values[letter]}
    total_score = values.sum
    if word.length >= 7 && word.length <= 10
      total_score += 8
    end
    return total_score
end
