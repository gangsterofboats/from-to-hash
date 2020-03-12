#!/usr/bin/env ruby
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
  length.downto(1) do
    index = 0
    h = (input - index) % 37
    while (h != 0)
      index += 1
      h = (input - index) % 37
    end
    input = (input - index) / 37
    output += letters[index]
  end
  return output.reverse
end

puts to_hash('leepadg')
puts from_hash(910897038977002, 9)
