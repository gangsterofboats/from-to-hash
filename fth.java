//////////////////////////////////////////////////////////////////////////////
// FromToHash - Solve a job interview puzzle                                //
// Copyright (C) 2020 Michael Wiseman                                       //
//                                                                          //
// This program is free software: you can redistribute it and/or modify     //
// it under the terms of the GNU Affero General Public License as           //
// published by the Free Software Foundation, either version 3 of the       //
// License, or (at your option) any later version.                          //
//                                                                          //
// This program is distributed in the hope that it will be useful,          //
// but WITHOUT ANY WARRANTY; without even the implied warranty of           //
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            //
// GNU Affero General Public License for more details.                      //
//                                                                          //
// You should have received a copy of the GNU Affero General Public License //
// along with this program.  If not, see <https://www.gnu.org/licenses/>.   //
//////////////////////////////////////////////////////////////////////////////

public class FromToHash
{
    public static long to_hash(String input)
    {
        String letters = "acdegilmnoprstuw";
        long h = 7;
        int ipt_len = input.length();
        for (int i = 0; i < ipt_len; i++)
        {
            h = ((h * 37) + letters.indexOf(input.charAt(i)));
        }
        return h;
    }

    public static StringBuilder from_hash(long input, int length)
    {
        String letters = "acdegilmnoprstuw";
        String output = "";
        StringBuilder sb = new StringBuilder();

        for (int i = length; i >= 1; i--)
        {
            int index = 0;
            long h = (input - index) % 37;
            while (h != 0)
            {
                index++;
                h = (input - index) % 37;
            }
            input = (input - index)/37;
            output += letters.charAt(index);
        }
        sb.append(output);

        return sb.reverse();
    }

    public static void main(String[] args)
    {
        long test_th = to_hash("leepadg");
        StringBuilder test_fh = from_hash(910897038977002L, 9);
        System.out.println(test_th);
        System.out.println(test_fh);
    }
}
