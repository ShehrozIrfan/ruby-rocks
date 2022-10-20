# -- Problem Name: Ransom Note --
# -- Description: --
# Given two strings ransomNote and magazine,
# return true if ransomNote can be constructed from magazine and false otherwise.
# Each letter in magazine can only be used once in ransomNote.
# -- Time/Space Complexity: --
# O(n) Time / O(n) Space

def ransom_note(ransom_note, magazine)
  chars_count = Hash.new(0)
  magazine.each_char { |chr| chars_count[chr] += 1 }
  ransom_note.each_char do |chr|
    return false unless chars_count[chr]&.positive?

    chars_count[chr] -= 1
  end

  true
end
