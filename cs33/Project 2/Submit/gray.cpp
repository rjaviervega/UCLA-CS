// UCLA Spring, 2003
// CS 33 Project 1
// John A. Rohr
// July 14, 2002
//
//
// This program generates data words with multiple fields where each
// field is encoded with the Gray code.  Each data word is a single,
// packed, 24-bit word.  Each data field may consist of 2 to 20 bits
// which are Gray-coded. Multiple words are generated if required to
// encode all the input data.  Data which will not completely fit in
// word being generated is split between the current word & the next
// word.  Unused bits in the last data word are filled with trailing
// zero bits.
//
// The program prompts for and accepts pairs of integer inputs.  The
// first value of each pair is the number of bits in the field & the
// second value is the uncoded integer data for the field.  Input is
// terminated by a value of zero  for the number of bits in a field.
// Whenever a complete 24-bit word is generated,  it is displayed as
// a 6-digit hexadecimal number.

// Modified on 04/14/2004 to print the hexout function depending of the
// value of the digit.
//


#include <iostream>

using namespace std;

const      int LO        = 2;           // Minimum field width
const      int HI        = 20;          // Maximum field width
const      int MAXBITS   = 24;          // Maximum number of bits per word
const long int WORDMASK  = 0x00FFFFFF;  // Mask for 24-bit word
const long int DIGITMASK = 0x0000000F;  // Mask for hexadecimal digit bits

int main()
{
    long int codeit (long int uncoded); // Encode a field
    void     hexout (long int num);     // Hexadecimal output function
    long     get_num();

    int width;              // Field width
    int value;              // Field value:  uncoded
    int coded;              // Field value:  coded
    int hold;               // Bit holder
    int part;               // Partial word bit count
    int used;               // Data word bit count 
    long int data;          // Data word
    

    // Initialize the data word
    data = 0;
    
    // Initialize the data word bit count
    used = 0;
    
    // Initialize the field width
    width = -1;
    
    // Display title
    cout << "GRAY-CODE ENCODER" << endl;

    // Display blank line
    cout << endl;

    // Do
    do
    {
        // If the width is less than zero
        if (width < 0)
        {
            // Prompt for a field width
            cout << "Width:";

            // Read a field width
            width = get_num();

            // While the width is not valid
            while ((width != 0) && (width < LO ) || (width > HI))
            {
                // Display an error message
                cout << "Invalid width";

                // Display a blank line
                cout << endl;

                // Prompt for the width again
                cout << "Width:";

                // Read the width again
                width = get_num();
            }

            // If the width is nonzero
            if (width > 0)
            {
                // Prompt for a field value
                cout << "Value:";

                // Read a field value
                value = get_num();

                // While the value is not valid
                while ((value < 0) || (value >= (1 << width)))
                {
                    // Display an error message
                    cout << "Invalid value";

                    // Display a blank line
                    cout << endl;

                    // Prompt for the value again
                    cout << "Value:";

                    // Read a value again
                    value = get_num();
                }

                // Encode the value
                coded = codeit(value);
            }
        }

        // If the width is greater than zero
        if (width > 0)
        {
            // If the data word has room for all the bits
            if ((24 - used) >= width)
            {
                // Make room for the bits
                data = data << width;

                // Insert the bits
                data |= coded;

                // Accumulate the used bits count
                used += width;

                // Clear the width
                width = -1;
            }

            // Else
            else
            {
                // Calculate the number of bits to be inserted
                part = MAXBITS - used;
                
                // Get the bits to be inserted
                hold = coded >> (width - part);

                // Make room for the bits
                data = data << part;

                // Insert the bits
                data |= hold;

                // Accumulate the used bits count
                used += part;

                // Remove the used bits
                coded = coded & ((1 << (width - part)) - 1);

                // Set the residual width
                width -= part;
            }

            // If the data word is complete
            if (used == MAXBITS)
            {
                // Display the data word
                hexout (data);

                // Clear the used count
                used = 0;
            }
        }
    // While the width is nonzero
    } while (width != 0);

    // If there is a partial word
    if (used != 0)
    {
        // Insert zero-bits for fill
        data = data << (MAXBITS - used);

        // Dislpay the last data word
        hexout (data);
    }

    // Display an ending message
    cout << "Good Bye!";

    // Terminate the line
    cout << endl;

    // Return
    return 0;
}


long int codeit (long int uncoded)      // Encode a field
{
//  cout << "Input:   " << uncoded << endl;
//  cout << "Output:  " << ((uncoded >> 1) ^ uncoded) << endl << endl;

    // Return the coded value
    return (uncoded >> 1) ^ uncoded;
}

        
void hexout (long int num)              // Hexadecimal output function
{
    char ch;                            // Output digit character
    int  digit;                         // Output digit value
    int  count;                         // Loop counter

    // Output text
    cout << "Word = ";

    // Output 6 hex digits
    for (count = 6; count > 0; count--)
    {
        // Rotate left 4 bits
        num = num << 4;
        num = num | ((num >> MAXBITS) & DIGITMASK);
        num = num & WORDMASK;
    
        // Set hex digit value
        digit = num & DIGITMASK;
    
        // If hex digit > 9
        if (digit > 9)
        {
			if ( digit == 10) { cout << 'A'; }
			if ( digit == 11) { cout << 'B'; }
			if ( digit == 12) { cout << 'C'; }
			if ( digit == 13) { cout << 'D'; }
			if ( digit == 14) { cout << 'E'; }
			if ( digit == 15) { cout << 'F'; }
        }
		else
		{
			cout << digit;
		}
    }

    // Output base  
    cout << "(16)" << endl;
    
    // Put out blank line
    cout << endl;
    
    // Return
    return;
}

// get_num - get an integer from the standard input
//  get_num mimics the GET_NUM function of the CUSP MINI_OS.  It reads
//  a line of input and returns the integer at the beginning of that line.
//  An integer is an optional sequence of blanks, followed by an optional
//  plus or minus sign, followed by a sequence of one or more digits.
//  Characters after the last digit are discarded.  If the input is not
//  an integer in the range -2^23 to 2^23-1 (-8388608 to 8388607), the
//  user is reprompted until it is.

#include <iostream>
#include <string>

long get_num()
{
    static const long CUSP_INT_LIMIT = 1 << (24-1);

    for (std::string s; std::getline(std::cin,s) || !s.empty();
                         std::cout << "Bad Value\n:")
    {
    bool isPositive = true;
    size_t pos = 0;

      // skip leading blanks
    for ( ; pos != s.size()  &&  s[pos] == ' '; pos++)
        ;

      // if blank line, go reprompt
    if (pos == s.size())
        continue;

      // consume optional sign
    if (s[pos] == '-')
    {
        isPositive = false;
        pos++;
    }
    else if (s[pos] == '+')
        pos++;

      // process sequence of digits
    long value = 0;
    bool good = false;
    for ( ; pos != s.size()  &&  s[pos] >= '0'  &&  s[pos] <= '9'; pos++)
    {
        value = 10 * value + (s[pos] - '0');
          // To reliably detect an out of range integer, the worst case
          // 10 * CUSP_INT_LIMIT + 9  must not overflow a long int.  It
          // doesn't, since  10 * 2^23 + 9  <  2^31 - 1.
        if (value > CUSP_INT_LIMIT  ||
                    (isPositive  &&  value == CUSP_INT_LIMIT))
        {
          // integer out of range
        good = false;
        break;
        }
          // integer has at least one digit
        good = true;
    }

      // must be at least one digit, within range
    if ( good )
        return isPositive ? value : -value;
    }

      // return 0 for end of file; this will never happen with CUSP
    return 0;
}
