//
// gray.cpp : Defines the entry point for the console application.
//
//
// Author: Roberto Javier Vega
// UCLA ID: 003-110-717
// Date: 04/07/2003
//
// CS 33 Programming Project 1
// ---------------------------
//
// This program accepts values from the user input and it converts
// the binary result into its binary gray reflected code.
//
// The program obtains the width to be copied from the gray code
// into a 24 bits word value.
//
// This value is then printer out to the user into its hexadecimal
// form.
//
// The program only accepts values that are possitives and widths 
// no grather than 20 and no smaller than 2.
//
// The program uses bassically 3 functions for processing the information.
// The main part of the program runs a loop until the width input is equal
// zero. All the accepted values will be taken into the formating. 
//
// The program uses global variables to store the word value and the possition
// where the added gray code value is added into the word. All the functions
// accept a maximun of 1 parameter to be easily converted into assembly code.
//
//

// References: 
// ----------
// 
// Gray code convertion algorithm from WORLFRAM RESEARCH
// Discrete Mathematics - Coding Theory - Gray Code (Encoding)
//
// URL: http://mathworld.wolfram.com/GrayCode.html
// Author: Eric W. Weisstein
// © 1999 CRC Press LLC, © 1999-2003 Wolfram Research, Inc.
//
//

//
// Compiled under MS Visual Studio .NET C++ Compiler
//


#include <string>
#include <iostream>

using namespace std;

// Constants related to specs from program 

const int WORD_SIZE = 24; // Size of the word in bits
const int MAX_WIDTH = 20; // Const defined for Max Width Input
const int MIN_WIDTH = 2;  // Const defined for Min Width Input



// Global variables
unsigned int GlobalWord = 0;		// Word value stored
unsigned int GlobalShifted = 0;		// Position of Added Gray Codes
unsigned int GlobalWidth = 0;		// Width pass per value entered



// Functions Declaration
void AddToWord ( unsigned int nValue ); // Adds int value in gray code to GlobalWord
void PrintWord ( unsigned int nWord );  // Outputs the GlobalWord value to screen in hexadecimal ( first 24 bits only) 
unsigned int BinaryToGrayCode ( unsigned int in_binary ); // Converts a binary value into its binary reflected gray code representation
long get_num(); // Provided by Class Guide to similate the input used in CUPS






// Main loop that accepts user inputs and call requiered functions.
int main ( int argc, char* argv[] )
{
	int inValue;

	GlobalShifted = WORD_SIZE; // Initialize possition for shifting
							   // Starting from possition 24 (= Size of Word)

	cout << "GRAY-CODE ENCODER" << endl;
	cout << endl;

	cout << "Width:";
	GlobalWidth = get_num(); 

	while ( ( GlobalWidth != 0 ) ) 	// Start input loop until width equal zero
	{
		// Check for width boundries
		if ( ( GlobalWidth <= MAX_WIDTH ) && ( GlobalWidth >= MIN_WIDTH ) )
		{

			cout << "Value:";
			inValue = get_num();

			while ( inValue < 0 )
			{
				cout << "Invalid value" << endl;
				cout << "Value:";
				inValue = get_num();
			}


			// Once the value is properly accepted 
			// add the value into the global word for storage.
			AddToWord ( inValue );
		}
		else
		{
			cout << "Invalid width." << endl << endl;
		}

		// Continued loop
		cout << "Width:";
		GlobalWidth = get_num();
	}

	// Output the value of the stored word once the program exits.
	PrintWord ( GlobalWord );

	cout << "Good Bye!" << endl;

	return 0;
}









// fucntion AddToWord ( unsiged int nValue )
//
// This function first converts the entered value
// into its binary reflected gray code. Then it copies 
// bitwisely the new value into a Gloval integer variable.
// This function uses bitwise operatiors to copy the bits from
// the gray code value to the integer.
//

void AddToWord ( unsigned int nValue )
{
	int nShiftLeft, nShiftRight;

	unsigned nGrayCodeValue = BinaryToGrayCode ( nValue );	// Store value as gray code in the 32 bit number

	nShiftLeft = GlobalShifted - GlobalWidth; 	// Set the initial possition for shifting

	// In case the shifting is possitive, we just shift the values to the left 
	// where they will be copied with |= into the GlobaWord.
	if ( nShiftLeft >= 0 )
	{
		nGrayCodeValue = ( nGrayCodeValue << nShiftLeft ); // Shift gray code value to possition next to GlobalWord index

		GlobalWord |= nGrayCodeValue; // Set the bits from the GrayCodeValue into the Word variable
	}
	// In case the shifting is negative, we first must shift to right to get rid
	// of the extra bits that are not needed to be copied into the GlobalWord.
	else
	{
		nShiftRight = ( nShiftLeft * -1); // Amount needed to be shifted to right

		GlobalWord |= ( nGrayCodeValue >> nShiftRight ); // Shift gray code to right and parse it onto Word

		PrintWord ( GlobalWord ); // Out put the word

		// Once the word has been completed and print out for user 
		// the program sets the values to its zero possition

		// Restart Variables and continue with possitive rest shifting
		GlobalWord = 0;
		GlobalShifted = WORD_SIZE;
		nShiftLeft = GlobalShifted - nShiftRight;

		// Shift gray code value to possition next to GlobalWord index
		nGrayCodeValue = ( nGrayCodeValue << nShiftLeft );

		// Set the bits from the GrayCodeValue into the Word variable
		GlobalWord |= nGrayCodeValue;
	}
	// Set shifting possition to new value
	GlobalShifted = nShiftLeft;
	return;
}







// void PrintWord ( unsiged int nWord )
//
// This function outputs the first 24 bits of an integer variable
// in the form of hexadecimal values.
// This function uses bitwise operators to shift values into the right
// then it modes to 16 and prints out the proper hexadecimal value.
//
void PrintWord ( unsigned int nWord )
{
	cout << "Word = ";

	//Output Word in hexadecimal numbers
	if ( ( ( nWord >> 20 ) % 16 ) <= 9 ) // Start shifting the value to its left most significant 4 bits
										 // then mode the value and compare its results to 9
	{ 
		cout << ( ( nWord >> 20 ) % 16 ); } // If result is less or equal than 9 print the number
	else 
	{ 
		cout << char ( 'A' + ( ( nWord >> 20 ) % 16 ) - 10 );  // print the character starting with the value of A pluse the difference
	}

	// The same logic is applied for each sequence of 4 bits numbers
	// but progresebly decreasing by 4 so the most significan sigs are print out first.

	// Second number
	if ( ( ( nWord >> 16 ) % 16 ) <= 9 ) { cout << ( ( nWord >> 16 ) % 16 ); }
	else { cout << char ( 'A' + ( ( nWord >> 16 ) % 16 ) - 10 ); }

	// Thirdh 
	if ( ( ( nWord >> 12 ) % 16 ) <= 9 ) { cout << ( ( nWord >> 12 ) % 16 ); }
	else { cout << char ( 'A' + ( ( nWord >> 12 ) % 16 ) - 10 ); }

	// Fourth
	if ( ( ( nWord >> 8 ) % 16 ) <= 9 ) { cout << ( ( nWord >> 8 ) % 16 ); }
	else { cout << char ( 'A' + ( ( nWord >> 8 ) % 16 ) - 10 ); }

	// Fidth
	if ( ( ( nWord >> 4 ) % 16 ) <= 9 ) { cout << ( ( nWord >> 4 ) % 16 ); }
	else { cout << char ( 'A' + ( ( nWord >> 4 ) % 16 ) - 10 ); }

	// Sixdth
	if ( ( ( nWord ) % 16 ) <= 9 ) { cout << ( ( nWord ) % 16 ); }
	else { cout << char ( 'A' + ( ( nWord ) % 16 ) - 10 ); }

	// Finish printing with hex representation 
	cout << "(16)" << endl << endl;
}



// function unsigned int BinaryToGrayCode ( unsigned int in_binary )
//
// This function converts a unsiged int value into its 
// binary reflected gray code value.
// The algorithm used was from MathWord (see references).
// This function used XOR to modify the values of a binary number
// into its gray code reflected value.
// The function first compared the second value and depending
// of it s value (0 or 1) it XOR the previous one.
//
//
// References: 
// ----------
// 
// Gray code convertion algorithm from WORLFRAM RESEARCH
// Discrete Mathematics - Coding Theory - Gray Code (Encoding)
//
// URL: http://mathworld.wolfram.com/GrayCode.html
// Author: Eric W. Weisstein
// © 1999 CRC Press LLC, © 1999-2003 Wolfram Research, Inc.
//
//
unsigned int BinaryToGrayCode ( unsigned int in_binary )
{
	int SizeofInt = sizeof(unsigned int) * 8;
	unsigned int GrayCodeValue = in_binary;
	unsigned int Runner = 1;
	
	// Start from first value until the last bit
	for ( int i = 0; i < SizeofInt; i++)
	{
		Runner = ( Runner << 1 ); // Set possition of value to be compared

		if ( (in_binary & Runner) == Runner ) // In case the bit is on (equal to 1)
		{
			GrayCodeValue ^= ( Runner >> 1); // Flip the previous value
		}

		// else do nothing
	}
	// return the converted value
	return GrayCodeValue;
}





// Code provided from Class Guide

// get_num - get an integer from the standard input
//  get_num mimics the GET_NUM function of the CUSP MINI_OS.  It reads
//  a line of input and returns the integer at the beginning of that line.
//  An integer is an optional sequence of blanks, followed by an optional
//  plus or minus sign, followed by a sequence of one or more digits.
//  Characters after the last digit are discarded.  If the input is not
//  an integer in the range -2^23 to 2^23-1 (-8388608 to 8388607), the
//  user is reprompted until it is.

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
