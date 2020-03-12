#!/usr/bin/env deno
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
