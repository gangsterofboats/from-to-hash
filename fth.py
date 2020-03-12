def to_hash(input: str) -> int:
    letters: str = 'acdegilmnoprstuw'
    h: int = 7

    i: int
    for i in range(len(input)):
        h = (h * 37 + letters.index(input[i]))
    return h

def from_hash(input: int, length: int) -> str:
    letters: str = 'acdegilmnoprstuw'
    output: str = ''
    for _ in range(length):
        index: int = 0
        h: int
        while ((h := (input - index) % 37) != 0):
            index += 1
        input = (input - index) // 37
        output += letters[index]
    return output[::-1]

print(to_hash('leepadg'))
print(from_hash(910897038977002, 9))
