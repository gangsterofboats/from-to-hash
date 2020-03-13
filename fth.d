///////////////////////////////////////////////////////////////////////////////
// FromToHash - Solve a job interview puzzle                                 //
// Copyright (C) 2020 Michael Wiseman                                        //
//                                                                           //
// This program is free software: you can redistribute it and/or modify      //
// it under the terms of the GNU Affero General Public License as            //
// published by the Free Software Foundation, either version 3 of the        //
// License, or (at your option) any later version.                           //
//                                                                           //
// This program is distributed in the hope that it will be useful,           //
// but WITHOUT ANY WARRANTY; without even the implied warranty of            //
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             //
// GNU Affero General Public License for more details.                       //
//                                                                           //
// You should have received a copy of the GNU Affero General Public License  //
// along with this program.  If not, see <https://www.gnu.org/licenses/>.    //
///////////////////////////////////////////////////////////////////////////////

import std.stdio;
import std.string;

long toHash(string input)
{
    string letters = "acdegilmnoprstuw";
    long h = 7;

    for (int i = 0; i < input.length; i++)
    {
        h = h * 37 + indexOf(letters, input[i]);
    }

    return h;
}

string fromHash(long input, int length)
{
    string letters = "acdegilmnoprstuw";
    string output = "";

    for (int i = length; i > 0; i--)
    {
        int index = 0;
        auto h = (input - index) % 37;
        while (h != 0)
        {
            index++;
            h = (input - index) % 37;
        }
        input = (input - index)/37;
        output = letters[index] ~ output;
    }

    return output;
}

void main(string[] args)
{
    long test_th = toHash("leepadg");
    writeln(test_th);
    string test_fh = fromHash(910897038977002, 9);
    writeln(test_fh);
}
