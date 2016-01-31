// UCLA Spring, 2003
// CS 33 Project 3
// John A. Rohr
// July 14, 2002
//
//
// This program reads an m x n matrix into memory in row-major order,
// displays the memory cells holding the matrix elements in consecutive
// order, calculates and stores the sum of each row and each column,
// and then displays the matrix one row per line with the row sum after
// each row and the column sum at the bottom of each column.  The program
// then converts the matrix storage to column-major order, again displays  
// the memory cells holding the matrix elements in consecutive order,
// recalculates and stores the sum of each row and each column, again
// displays the matrix one row per line with the row sum after each row
// and the column sum at the bottom of each column, and finally displays
// the sum of all the elements in the matrix.

//
// Project Programming #3
// UCLA Spring 2003 CS 33 Class
//
// R. Javier Vega
// SID: 003-110-717
// 
// Completed functions requiered to work the program with the specs.
//
//

#include <iostream>
#include <string>   // used only by get_num
#include <iomanip>

using namespace std;

// Function prototypes

void getrm(int* pmat,  int rows, int cols);
void rmtocm(int* pmat, int rows, int cols);
void linear(int* pmat, int rows, int cols, int ind);
void matrix(int* pmat, int rows, int cols, int ind, int* prs, int* pcs, int sum);
int  calsum(int* pmat, int rows, int cols, int ind, int* prs, int* pcs);
long get_num();

// Main Program

int main()
{
    int  m;                         // Matrix dimension m:  Rows
    int  n;                         // Matrix dimension n:  Cols
    int  rm;                        // Row major indicator
    int  sum1;                      // First  sum of all matrix elements
    int  sum2;                      // Second sum of all matrix elements
    int *pmatrix;                   // Matrix array pointer
    int *prsums;                    // Row sums vector pointer
    int *pcsums;                    // Col sums vector pointer
    
    // Get the row dimension
    cout << "Enter the number of rows   :";
    m = get_num();
    
    // Check for a valid value;
    while (m < 2)
    {
        // Display an error message
        cout << "Invalid dimension:  Try again!" << endl;
        cout << "Enter the number of rows   :";
        m = get_num();
    }

    // Get the column dimension
    cout << "Enter the number of columns:";
    n = get_num();
    
    // Check for a valid value;
    while (n < 2)
    {
        // Display an error message
        cout << "Invalid dimension:  Try again!" << endl;
        cout << "Enter the number of columns:";
        n = get_num();
    }

    // Allocate the matrix storage
    pmatrix = new int[m*n];
    
    // Allocate the row sum storage
    prsums = new int[m];
    
    // Allocate the column sum storage
    pcsums = new int[n];
    
    // Read the matrix elements
    getrm(pmatrix, m, n);
    
    // Display a blank line
    cout << endl;
    
    // Set the indicator to row major
    rm = 1;
    
    // Display the matrix storage
    linear(pmatrix, m, n, rm);
    
    // Calculate the row and column sums
	sum1 = calsum(pmatrix, m, n, rm, prsums, pcsums);

	// Display the matrix and the sums
    matrix(pmatrix, m, n, rm, prsums, pcsums, sum1);

    // Convert the matrix storage to column major
    rmtocm(pmatrix, m, n);
    
    // Set the indicator to column major
    rm = 0;
    
    // Display the matrix storage
    linear(pmatrix, m, n, rm);
    
    // Calculate the row and column sums
    sum2 = calsum(pmatrix, m, n, rm, prsums, pcsums);

    // Display the matrix and the sums
    matrix(pmatrix, m, n, rm, prsums, pcsums, sum2);
    
    // If the elements sums are the same
    if (sum1 == sum2)
    {
        // Display the sum message
        cout << "The sum of the elements is ";

        // Display the first sum
        cout << sum1 << endl;
    }

    //Else
    else
    {
        // Display an error message,
        cout << "ERROR:  The matrix sums are different!" << endl;
        
        // Display the first sum message
        cout << "The first  sum of the elements is ";

        // Display the first sum
        cout << sum1 << endl;

        // Display the second sum message
        cout << "The second sum of the elements is ";

        // Display the second sum
        cout << sum2 << endl;
    }
    
    // Display a blank line
    cout << endl;

    // Free the column sum storage
    delete [] pcsums;

    // Free the row sum storage
    delete [] prsums;
    
    // Free the matrix storage
    delete [] pmatrix;

    // Return
    return 0;
}


// Input Function
//  This fucntiosn prompts the user for the inputs 
//  requiered to fill the matrix with row major form.
//
void getrm(int* pmat,               // Matrix pointer
           int  rows,               // Number of matrix rows
           int  cols)               // Number of matrix columns
{
	//Prompt for values
	cout << "Enter matrix element values" << endl;

	//Read each value into the matrix and store the
	//value into the matrix array with row-major order.
	for ( int i=0; i < (rows * cols); i++)
	{
		//store number into array
		pmat[i] = get_num();
	}
}


// Row-major to column-major conversion function
//  This function convers the storage of a matrix
//  into an array from row major order form to 
//  column order form.
//
void rmtocm(int* pmat,              // Matrix pointer
            int  rows,              // Number of matrix rows
            int  cols)              // Number of matrix columns
{
    // Allocate the new matrix storage
    int *pmatcol = new int[rows*cols];

	//copy the elements from the row-order matrix
	for ( int c = 0; c < cols; c++ )
	{
		// copy the elements reading the values
		// from the array and storing them into
		// column major order.
		for ( int r = 0; r < rows; r++ )
			pmatcol[ r + c * rows ] = pmat[ r * cols + c ];
	}

	//Copy the new matrix into the original
	for ( int i = 0; i < (rows*cols); i++ )
	{
		pmat[i] = pmatcol[i];
	}
    
	//Release memory used by temporary matrix
	delete [] pmatcol;
}


// Linear memory display function
//  This fucntion outputs the matrix elements to the
//  screen in the order that they are stored.
void linear(int* pmat,              // Matrix pointer
            int  rows,              // Number of matrix rows
            int  cols,              // Number of matrix columns
            int  ind)               // Row-major indicator (!=0 for rm)
{
	// output greating
	cout << "Matrix element storage:" << endl;

	// if row-major order
	if ( ind != 0 ) 
	{
		// output title
		cout << "Row major order" << endl;
	}
	else // column major order
	{
		// output title
		cout << "Column major order" << endl;
	}

	// output each element in the array
	for ( int i=0; i < (rows * cols); i++)
	{
		cout << pmat[i] << endl;
	}

	// new line
	cout << endl;
}


// Matrix display function
//  This fucntion displays the matrix to the screen
//  with the sums of the columns and the rows, also
//  the sum of both of them.
//
void matrix(int* pmat,              // Matrix pointer
            int  rows,              // Number of matrix rows
            int  cols,              // Number of matrix columns
            int  ind,               // Row-major indicator (!=0 for rm)
            int* prs,               // Row sums pointer
            int* pcs,               // Columns sums pointer
            int  sum)               // Sum of all elements
{
	// if row-major order
	if ( ind != 0 )
	{
		// display title
		cout << "Matrix (Row major order):" << endl;

		// print the rows
		for ( int i  = 0; i  < rows; i++ )
		{
			// print each one of the the colums
			for ( int i2 = 0; i2 < cols; i2++ ) 
			{
				cout << setw(7) << pmat[i2 + cols * i] << " ";
			}
			// print the sum of the rows
			cout << setw(7) << prs[i] << endl ;
		}

		// print the sum of colums
		for ( int i = 0; i < cols; i++ )
			cout << setw(7) << pcs[i] << " ";

		// print the total sum
		cout << setw(7) << sum << endl;

		cout << endl;
	}
	else  // if column-major order storage
	{
		// output title
		cout << "Matrix (Column major order):" << endl;

		// Print the rows
		for ( int i  = 0; i  < rows; i++ )
		{
			// Print the columns
			for ( int i2 = 0; i2 < cols; i2++ )
			{
				cout << setw(7) << pmat[i + rows * i2] << " ";
			}
			cout << setw(7) << prs[i] << endl ;
		}

		// print the sum of colums
		for ( int i = 0; i < cols; i++ )
			cout << setw(7) << pcs[i] << " ";

		// print the sum
		cout << setw(7) << sum << endl;

		// new line
		cout << endl;

	}
}


// Sum calculation function
//  This fucntion calculates the sum of the columns and 
//  rows of the matrix and stores the results into new 
//  arrays of column sums and rows sums.
//
int calsum(int* pmat,               // Matrix pointer
           int  rows,               // Number of matrix rows
           int  cols,               // Number of matrix columns
           int  ind,                // Row-major indicator (!=0 for rm)
           int* prs,                // Row sums pointer
           int* pcs)                // Columns sums pointer
{
	int result = 0;

	if ( ind != 0 )
	{
		// operation with Row major order

		// add rows
		for ( int i = 0; i < rows; i++ )
		{
			// set memory to 0
			prs[i] = 0;

			// add each of the rows 
			for ( int i2 = 0; i2 < cols; i2++)
			{
				// store them into the array
				prs[i] = prs[i] + pmat[cols*i+i2];
			}
			// store the total sum into temp variable result
			result = result + prs[i];
		}

		// add cols
		for ( int i = 0; i < cols; i++ )
		{
			// set starting memory to 0
			pcs[i] = 0;

			// add each one of the colums
			for ( int i2 = 0; i2 < rows; i2++)
			{
				// store the value
				pcs[i] = pcs[i] + pmat[i+cols*i2];
			}
			// save the results into temp var
			result = result + pcs[i];
		}

		// since result holds the sum of the cols and the rows
		// it is a factor of 2 of the sum
		// so it needs to be divided into 2 to express 
		// the final sum
		result = (result / 2);
	}
	else
	{
		// operation with Column major order

		// add rows
		for ( int i = 0; i < rows; i++ )
		{
			prs[i] = 0;
			for ( int i2 = 0; i2 < cols; i2++)
			{
				prs[i] = prs[i] + pmat[rows*i2+i];
			}
			result = result + prs[i];
		}

		// add cols
		for ( int i = 0; i < cols; i++ )
		{
			pcs[i] = 0;
			// add each one of the colums
			for ( int i2 = 0; i2 < rows; i2++)
			{
				// store the value
				pcs[i] = pcs[i] + pmat[i2+rows*i];
			}
			// save the results into temp var
			result = result + pcs[i];
		}

		// since result holds the sum of the cols and the rows
		// it is a factor of 2 of the sum
		// so it needs to be divided into 2 to express 
		// the final sum
		result = (result / 2);
	}
	return result;
}

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

// If you are using the library that ships with Visual C++ 6.0, you should
// know about the notorious getline bug. To get around it, replace the call
// to std::getline in the above code with a call to getline_fixed, where
// getline_fixed is
// 
// std::istream& getline_fixed(std::istream& is, std::string& s) {
//	s.erase();
//	char ch;
//	while (is.get(ch)  &&  ch != '\n')
//		s += ch;
//	return is;
// }
