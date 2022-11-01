def sort_by_capital_word(text)
  text
    .split
    .sort_by { |w| w[0].match?(/[A-Z]/) ? 0 : 1 }
    .join(" ")
end

sort_by_capital_word("is The very  Hacktober fun  ")

# "The Hacktober is very fun"