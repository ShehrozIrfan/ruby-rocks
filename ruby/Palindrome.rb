require 'rspec'

# function for checking palindrome
def palindrome? word
    word.downcase == word.downcase.reverse
end

# print if it's palindrome
p palindrome?('KitOtik')

# test the code
describe 'Check if a word is a palindrome' do
  it 'returns true if the word is a palindrome, false if not' do
    expect(palindrome?('tacocat')).to be(true)
    expect(palindrome?('Tacocat')).to be(true)
    expect(palindrome?('baseball')).to be(false)
    expect(palindrome?('kitikat')).to be(false)
  end
end
