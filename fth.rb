def to_hash(input)
  letters = 'acdegilmnoprstuw'
  h = 7
  0.upto(input.length - 1) do |i|
    h = (h * 37 + letters.index(input[i]))
  end
  return h
end

def from_hash(input, length)
  letters = 'acdegilmnoprstuw'
  output = ''
  length.downto(1) do |i|
    ltr_index = 0
    0.upto(15) do |j|
      ltr_index = j
      break if (input - j) % 37 == 0
    end
    input = (input - ltr_index) / 37
    output += letters[ltr_index]
  end
  return output.reverse
end

puts to_hash('leepadg')
puts from_hash(910897038977002, 9)
