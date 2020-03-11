////////////////
// UNFINISHED //
////////////////

public class osu
{
    public static int to_hash(String input)
    {
        char[] letters = {'a', 'c', 'd', 'e', 'g', 'i', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'w'};
        int h = 7;
        int ipt_len = input.length();
        char[] input_ltrs = input.toCharArray();
        for (int i = 0; i < ipt_len; i++)
        {
            h = ((h * 37) + letters.indexOf(input_ltrs[i]));
        }
        return h;
    }

    public static String from_hash(int input)
    {
    }
}

// def to_hash(input)
  // letters = 'acdegilmnoprstuw'
  // h = 7
  // input_ltrs = input.chars
  // 0.upto(input.length - 1) do |i|
    // h = (h * 37 + letters.index(input_ltrs[i]))
  // end
  // return h
// end

// def from_hash(input, length)
  // letters = 'acdegilmnoprstuw'
  // input = input.to_i
  // output = ''
  // length.downto(1) do |i|
    // ltr_index = 0
    // 0.upto(15) do |j|
      // ltr_index = j
      // break if (input - j) % 37 == 0
    // end
    // input = (input - ltr_index) / 37
    // output += letters[ltr_index]
  // end
  // return output.reverse
// end

// puts to_hash('leepadg')
// puts from_hash('910897038977002', 9)
