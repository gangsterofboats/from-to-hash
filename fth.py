#!/usr/bin/env python
#############################################################################
# FromToHash - Solve a job interview puzzle                                 #
# Copyright (C) 2020 Michael Wiseman                                        #
#                                                                           #
# This program is free software: you can redistribute it and/or modify      #
# it under the terms of the GNU Affero General Public License as            #
# published by the Free Software Foundation, either version 3 of the        #
# License, or (at your option) any later version.                           #
#                                                                           #
# This program is distributed in the hope that it will be useful,           #
# but WITHOUT ANY WARRANTY; without even the implied warranty of            #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             #
# GNU Affero General Public License for more details.                       #
#                                                                           #
# You should have received a copy of the GNU Affero General Public License  #
# along with this program.  If not, see <https://www.gnu.org/licenses/>.    #
#############################################################################

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
