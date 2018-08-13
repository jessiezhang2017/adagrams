def draw_letters
  bag_of_letters = ["a", "a", "a", "a", "a", "a", "a", "a", "a", "b",
    "b", "c", "c", "d", "d", "d", "d", "e", "e", "e", "e", "e", "e", "e",
    "e", "e", "e", "e", "e", "f", "f", "g", "g", "h", "h", "i", "i", "i",
    "i", "i", "i", "i", "i", "i", "j", "k", "l", "l", "l", "l", "m", "m",
    "n", "n", "n", "n", "n", "n", "o", "o", "o", "o", "o", "o", "o", "o",
    "p", "p", "q", "r", "r", "r", "r", "r", "r", "s", "s", "s", "s", "t",
    "t", "t", "t", "t", "t", "u", "u", "u", "u", "v", "v", "w", "w", "x",
    "y", "y", "z"]

    individual_hand = Array.new

    10.times do |x|
      bag_of_letters = bag_of_letters.shuffle
      letter = bag_of_letters.pop
      individual_hand[x] = letter
    end
    return individual_hand
end

print draw_letters
