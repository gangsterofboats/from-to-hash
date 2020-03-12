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
package main

import (
	"fmt"
	"strings"
)

func to_hash(input string) int {
	letters := "acdegilmnoprstuw"
	h := 7
	for i := 0; i < len(input); i = i + 1 {
		h = (h * 37 + strings.Index(letters, string(input[i])))
	}

	return h
}

func from_hash(input int, length int) string {
	letters := "acdegilmnoprstuw"
	output := ""
	for i := length; i > 0; i = i - 1 {
		index := 0
		h := (input - index) % 37
		for h != 0 {
			index = index + 1
			h = (input - index) % 37
		}
		input = (input - index) / 37
		output = string(letters[index]) + output
	}

	return output
}

func main() {
	test_th := to_hash("leepadg")
	fmt.Printf("%v\n", test_th)
	test_fh := from_hash(910897038977002, 9)
	fmt.Printf("%v\n", test_fh)
}
