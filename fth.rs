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

fn to_hash(input: &str) -> usize
{
    let letters = "acdegilmnoprstuw";
    let mut h = 7;
    let len = input.len();
    for i in 0..len
    {
        let icn = input.chars().nth(i).unwrap();
        h = h * 37 + letters.find(icn).unwrap();
    }

    return h;
}

fn from_hash(input: usize, length: i32) -> String
{
    let letters = "acdegilmnoprstuw";
    let mut output = String::new();
    let mut ipt = input;

    for _ in 0..length
    {
        let mut index = 0;
        let mut h = (ipt - index) % 37;
        while h != 0
        {
            index = index + 1;
            h = (ipt - index) % 37;
        }
        ipt = (ipt - index)/37;
        let ltr = letters.chars().nth(index).unwrap().to_string();
        output = ltr + &output;
    }

    return output;
}

fn main()
{
    let test_th = to_hash("leepadg");
    println!("{}", test_th);
    let test_fh = from_hash(910897038977002, 9);
    println!("{}", test_fh);
}
