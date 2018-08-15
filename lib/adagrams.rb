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

def is_in_english_dict?(input)
  File.foreach("assets/dictionary-english.csv") do |line|
    if line.chomp == input.downcase
      return true
    end
  end
  return false
end

def score_word(word)
  letter_values = {"a" => 1, "b" => 3,"c" => 3, "d" => 2,"e" => 1, "f" => 4,
    "g" => 2, "h" => 4,"i" => 1, "j" => 8,"k" => 5, "l" => 1,"m" => 3,
    "n" => 1,"o" => 1, "p" => 3,"q" => 10, "r" => 1,"s" => 1, "t" => 1,
    "u" => 1, "v" => 4,"w" => 4, "x"=>8, "y" => 4,"z" => 10}
    word_divided = word.downcase.chars
    values = word_divided.map {|letter| letter_values[letter]}

    total_score = values.sum

    total_score += 8 if word.length >= 7 && word.length <= 10

    return total_score
end

def highest_score_from(words)
  word_scores = words.map do |word|
    {word: word.upcase, score: score_word(word)}
  end

  max_score = word_scores.max_by {|x| x[:score]}[:score]
  all_max_scores = word_scores.select do |word|
    word[:score] == max_score
  end

  shortest_word_length = all_max_scores.min_by { |word| word[:word].length}[:word].length

  shortest_words = all_max_scores.select do |word|
    word[:word].length == shortest_word_length
  end

  max_equals_ten = all_max_scores.select do |x|
    x[:word].length == 10
  end

  return max_equals_ten.length == 0? shortest_words.first : max_equals_ten.first
    # same as above^:
    # if max_equals_ten.length == 0
    #   return shortest_words.first
    # else
    #   return max_equals_ten.first
    # end

end
