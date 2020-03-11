def to_hash(input):
    letters = 'acdegilmnoprstuw'
    h = 7
    input_ltrs = list(input)
    for i in range(len(input)):
        h = (h * 37 + letters.index(input_ltrs[i]))
    return h

def from_hash(input, length):
    letters = 'acdegilmnoprstuw'
    input = int(input)
    output = ''
    for _ in range(length):
        ltr_index = 0
        for i in range(16):
            ltr_index = i
            if (input - i) % 37 == 0:
                break
        input = (input - ltr_index) / 37
        output += letters[ltr_index]
    return output[::-1]

# print(to_hash('leepadg'))
print(from_hash('910897038977002', 9))
