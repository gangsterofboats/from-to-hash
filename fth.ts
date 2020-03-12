#!/usr/bin/env deno
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

function to_hash(input: string): number
{
    let letters: string = 'acdegilmnoprstuw';
    let h: number = 7
    for (let i: number = 0; i < input.length; i++)
    {
        h = (h * 37 + letters.indexOf(input[i]));
    }

    return h;
}

function from_hash(input: number, length: number): string
{
    let letters: string = 'acdegilmnoprstuw';
    let output: string = '';

    for (let i: number = length; i >= 1; i--)
    {
        let index: number = 0;
        let h: number = (input - index) % 37;
        while (h != 0)
        {
            index++;
            h = (input - index) % 37;
        }
        input = (input - index)/37;
        output += letters[index];
    }

    return output.split('').reverse().join('');
}

let test_th = to_hash('leepadg');
let test_fh = from_hash(910897038977002, 9);
console.log(test_th);
console.log(test_fh);
