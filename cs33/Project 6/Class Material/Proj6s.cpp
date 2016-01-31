// UCLA Spring, 2003
// CS 33 Project 6
// John A. Rohr
// December 6, 2002
//
//
//	This program implements a construction project.  The project consists of
//	a construction area and a supply area.  The supplies are bricks and girders.
//	Supplies are provided at various times during the construction project.
//	The CUSP screen is divided into three sections:  The top section is the
//	program title and status information.  The bottom sections are the
//	construction area and the supply area.  The construction area is on
//	the left and the supply area is on the right.  Everything to the left
//	of the supply area is in the construction area.  The solution to the
//	project is the building which must be constructed.  The solution is
//	contained within the boundaries of the construction area.  A crane
//	is provided which can lift 1 to n bricks stacked vertically (n is
//	a parameter of the program) or 1 girder.  The crane can move right,
//	left, up, and down in the construction area and in the supply area
//	with the restriction that it and its load, if any, cannot bump into
//	stationary bricks or girders and a girder may not move left or right
//	without being lifted up.  A girder may only be lifted in the middle.
//	The project is complete when the building constructed matches the
//	solution and the crane has been removed from the construction area.
//	Complete specifications follow.
//
//	
//		              11111111112222222222333333333
//		R/C  12345678901234567890123456789012345678
//		    +--------------------------------------+
//		 1  |- - - CS 33 CONSTRUCTION PROJECT - - -|
//		 2  |M Time:xxxx Bricks:xxx/xxx Girders:x/x|
//		 3  |======================================|
//		 4  |                                      |
//		 5  |                                      |
//		 6  |                                      |
//		 7  |                                      |
//		 8  |  CONSTRUCTION AND       SUPPLY AREA  |
//		 9  |   SOLUTION AREA                      |
//		10  |                                      |
//		11  |                                      |
//		12  |                                      |
//		13  |                                      |
//		14  |                                      |
//		    +--------------------------------------+
//
//
//	1. The object of the program is to construct a building which matches the solution.
// 
//	2. The project is completed when the building matches the solution and the crane is removed from the construction area.
// 
//	3. The building supplies are bricks and girders.
// 
//	4. An input file read by the tape drive specifies the solution followed by the supplies.
// 
//	5. A crane is provided to move the bricks and girders.
//
//	6. The top three lines of the CUSP screen consist of the program title, the status line, and a separator line.
//
//	7. The rest of the CUSP screen consists of the construction area and the supply area.
//
//	8. The construction area is on the left side of the screen.
//
//	9. The supply area is on the right side of the screen.
//
//	10. The time of the construction project is displayed in the status line.
// 
//	11.  The total number of bricks in the completed project is displayed in the status line.
// 
//	12. The number of bricks in the project at each step of construction is displayed in the status line.
// 
//	13. The total number of girders in the completed project is displayed in the status line.
// 
//	14. The number of girders in the project at each step of construction is displayed in the status line.
//
//	15. The construction area is used to display either the construction project or the solution but not both at the same time.
//
//	16. The building is constructed in the construction area.
//
//	17. Bricks and girders are stored in the supply area.
//
//	18. Bricks may be set on top of the ground, on top of another brick, or on top of a girder.
// 
//	19. Girders must be at least three units long.
// 
//	20. Only one girder can be stored in each supply row.
// 
//	21. Girders are stored on the right end of each row.
// 
//	22. When not being lifted, girders must be on the ground or have each end anchored on a brick or another girder.
// 
//	23. The crane can move right, left, up, and down.
// 
//	24. The crane can lift from 1 to n bricks stacked vertically or one girder at a time.  The number n is a parameter of the program.
// 
//	25. Neither the crane or its load, if any, can move past a position which is blocked by a wall, a brick, or a girder.
// 
//	26. A crane load of bricks cannot be released unless it is directly on top of the base of the supply or construction area or on top of another brick or a girder.
// 
//	27. A girder must be lifted in the middle.
// 
//	28. A girder cannot be moved sideways without being lifted up.
// 
//	29. Two girders may not be set next to each other without a space or brick between them.
// 
//	30. The project solution can be displayed at any time during the construction.
// 
//	31. The construction project can be displayed at any time during the construction.
// 
//	32. No construction actions may occur while the project solution is displayed.
// 
//	33. If the crane and/or any part of its load is in the construction area when the solution is displayed, they are hidden during the display of the solution.
// 
//	34. If the crane is in the supply area when supplies arrive, it must not be in use.
// 
//	35. If in the supply area, the crane is be left in the initial position after supplies are provided.
// 
//	36. If the crane is lifting bricks or a girder when supplies arrive, none of the load can protrude into the supply area.
// 
//	37. The solution precedes the supplies on the input tape file.
// 
//	38. Each supply record has a time, which may be null, a slash character following the time (required even if the time is null), a supply item count and type, and, for girders, a length.
// 
//	39. The time may be omitted.  A time of zero is used if no time is specified.
// 
//	40. The item count may be omitted.  A count of one is used if no item count is specified.
// 
//	41. Bricks are specified by  ‘B’ or ‘b’ item type.
//
//	42. Girders are specified by a ‘G’ or ‘g’ item type.
//
//	43. Supply items on the tape must be in time order.
//
//	44. When the crane has no load, it is displayed as ‘c’.
//
//	45. When the crane is carrying bricks, it is displayed as a digit indicating the number of bricks.
//
//	46. When the crane is carrying a girder, it is displayed as a ‘C’.
//
//	47. Operator errors cause a bell ring.
//
//	48. Serious errors cause program termination.
//
//	49. The game is terminated by a completed correct building or by a ‘Q’ input.
// 
//	50. The following inputs are allowed (either upper or lower case):
//			Q:	Quit
//			S:	Show the Solution
//			C:	Show the Construction Project
//			1:	Grab 1 brick
//			  	. . . . . . .
//			n:	Grab n bricks
//			G:	Grab a girder
//			R:	Release a load
//			d:	Move crane right  (Right arrow in CUSP)
//			a:	Move crane left   (Left  arrow in CUSP)
//			w:	Move crane up     (Up    arrow in CUSP)
//			x:	Move crane down   (Down  arrow in CUSP)
//
//
//		EXAMPLE CONSTRUCTION SCREEN
//
//		              11111111112222222222333333333
//		R/C  12345678901234567890123456789012345678
//	        +--------------------------------------+
//		 1  |- - - CS 33 CONSTRUCTION PROJECT - - -|
//		 2  |C Time: 650 Bricks: 28/ 43 Girders:1/1|
//		 3  |======================================|
//		 4  |                                      |
//		 5  |                                      |
//		 6  |                                      |
//		 7  |  c                                   |
//		 8  |                             BBBBB    |
//		 9  |BGGGG                        BBBBBGGGG|
//		10  |BB  B                        BBBBBGGGG|
//		11  |BB  B                        BBBBGGGGG|
//		12  |BBBBBBB                      BBBBGGGGG|
//		13  |BBBBBBB                     BBBBBGGGGG|
//		14  |BBBBBBB                     BBBBGGGGGG|
//	        +--------------------------------------+
//
//
//		EXAMPLE SOLUTION SCREEN
//
//		              11111111112222222222333333333
//		R/C  12345678901234567890123456789012345678
//	       +--------------------------------------+
//		 1  |- - - CS 33 CONSTRUCTION PROJECT - - -|
//		 2  |S Time: 650 Bricks: 28/ 43 Girders:1/1|
//		 3  |======================================|
//		 4  |                                      |
//		 5  |                                      |
//		 6  |   B                                  |
//		 7  |  BBB                                 |
//		 8  | BBBBB                       BBBBB    |
//		 9  |BGGGGBB                      BBBBBGGGG|
//		10  |BB  BBB                      BBBBBGGGG|
//		11  |BB  BBB                      BBBBGGGGG|
//		12  |BBBBBBB                      BBBBGGGGG|
//		13  |BBBBBBB                     BBBBBGGGGG|
//		14  |BBBBBBB                     BBBBGGGGGG|
//		    +--------------------------------------+
//
//
//		EXAMPLE INPUT FILE
//
//		   B
//		  BBB
//		 BBBBB
//		BGGGGBB
//		BB  BBB
//		BB  BBB
//		BBBBBBB
//		BBBBBBB
//		BBBBBBB
//		/50B
//		/g6
//		/2G4
//		/10b
//		30/3G5
//		40/G4


#include <iostream.h>
#include <fstream.h>
#include <iomanip.h>
#include <stdlib.h>
#include <string.h>

// Global Constants

	const unsigned int SHOWALL =  0;	// Print stop  control
	const unsigned int DEBUG   =  0;	// Print debug control

	const char  filename[] = "BUILD";	// Input file name

	const unsigned int ROWS    = 14;	// Number of display cols
	const unsigned int COLS    = 38;	// Number of display rows

	const unsigned int drows   =  3;	// Number of data rows
	
	const unsigned int brows   = 10;	// Number of building rows
	const unsigned int bcols   = 24;	// Number of building cols
	const unsigned int srows   = 10;	// Number of supply   rows
	const unsigned int scols   = 12;	// Number of supply   cols
	const unsigned int maxgrd  =  8;	// Maximum number of girders
	const unsigned int rsize   = 80;	// Input record size

	const unsigned int burpos  = 14;	// Initial building row
	const unsigned int bucpos  =  1;	// Initial building column
	const unsigned int surpos  = 14;	// Initial supply   row
	const unsigned int sucpos  = 27;	// Initial supply   column

	const unsigned int crrpos  =  4;	// Initial crane    row
	const unsigned int crcpos  = 27;	// Initial crane    column 

	const unsigned int n       =  6;	// Crane block lift limit 

	char               crichr  = 'c';	// Initial   crane character
	char               crgchr  = 'C';   // Grid hold crane character

	const unsigned int tick    =  1;	// Time increment
	const unsigned int trylmt  = 10;    // Blocked moves limit

	const char movert          = 'D';	// Move right character
	const char movelt          = 'A';	// Move left  character
	const char moveup          = 'W';	// Move up    character
	const char movedn          = 'X';	// Move down  character

	const char endprg          = 'Q';	// Quit                character
	const char shocon          = 'C';	// Show construction   character
	const char shosol          = 'S';	// Show solution       character
	const char grab1           = '1';	// Grab one   brick    character
	const char grabg           = 'G';	// Grab girder input   character
	const char grabgc          = 'C';   // Grab girder display character
	const char releas          = 'R';	// Release load        character

	const unsigned int tittpos = 0;				// Title     text position
	const unsigned int statpos = tittpos+1*COLS;// Status    text position
	const unsigned int septpos = tittpos+2*COLS;// Separator text position

	const unsigned int modpos  = statpos;		// Mode           position
	const unsigned int timpos  = statpos+10;	// Time           position
	const unsigned int brkpos  = statpos+21;	// Bricks         position
	const unsigned int brtpos  = statpos+25;	// Total bricks   position
	const unsigned int grdpos  = statpos+35;	// Girders        position
	const unsigned int grtpos  = statpos+37;	// Total girders  position
	
	const unsigned int errpos  = statpos+9;		// Terminal error position
	const unsigned int trypos  = statpos+16;	// Too many tries position

	const char topbot[39]      = "--------------------------------------";
	const char title[39]       = "- - - CS 33 CONSTRUCTION PROJECT - - -";
	const char status[39]      = "M Time:xxxx Bricks:xxx/xxx Girders:x/x";
	const char seplin[39]      = "======================================";
	const char again[39]       = "PROJECT COMPLETED!  Build again? (Y/N)";
	const char errmsg[39]      = "Error xxxx        Project Terminated!!";
	const char trymsg[39]      = "Too Many Tries:xx Project Terminated!!";
	const char inperr[39]      = "Invalid Input:    Project Terminated!!";
	const char brkerr[39]      = "Too Many Bricks:  Project Terminated!!";
	const char grderr[39]      = "Too Many Girders: Project Terminated!!";


// The Cuspcrt class provides a simulation of the CUSP CRT.
// All CUSP CRT, write, and control function are included.
// Some additional helper functions are provided to simplify
// the use of the simulation by a C++ program.
//
// This simulation tracks the cursor position but does not show
// a visible cursor.  However, the cursor position coordinates
// are displayed whenever the screen is displayed.
	
class Cuspcrt
{
public:
//	Cuspcrt();							// Constructor
//	void write  (int a, char ch);		// Write character
//	char read   (int a);				// Read  character
//	void put    (char ch);				// Put character at cursor
//	void setrow (int r);				// Set row position
//	void setcol (int c);				// Set col psoition
//	int  getrow ();						// Get row position
//	int  getcol ();						// Get vol position
//	void clear  ();						// Clear screen
//	void down   ();						// Scroll down one line
//	void up     ();						// Scroll up one line
//	void home   ();						// Move cursor to home
//	void next   ();						// Move cursor to next line
//	void bell   ();						// Ring bell
//	void off    ();						// Trun off the cursor
//	void print  ();						// Print the display

private:
	char          screen[ROWS*COLS];	// Display screen
	unsigned int  row;					// Row position
	unsigned int  col;					// Col position

public:
	// Constructor
	Cuspcrt():row(0), col(0)
	{
		// Clear screen
		clear();
	}

	// Write one character at a specified address	
	void write (unsigned int a, char ch)
	{
		// Test for within buffer
		if (a < ROWS*COLS)
		{
			// Write the character to the screen
			screen[a] = ch;
		}
	}

	// Read one character from a specified address	
	char read (unsigned int a)
	{		
		// Test for within buffer
		if (a < ROWS*COLS)
		{
			// Write the character to the screen
			return screen[a];
		}

		// Else
		else
		{
			// Return NULL
			return '\0';
		}
	}

	// Write one character at the cursor position
	void put (char ch)
	{
		// Test for on screen
		if ((row > 0) && (col > 0))
		{
			// Write the character
			screen[(row-1) * COLS + col - 1] = ch;
		
			// Test for end of row
			if (col == COLS)
			{
				// Test for end of screen
				if (row == ROWS)
				{
					// Scroll up one line
					up();
				}

				// Else
				{
					// Go to next row
					next();
				}
			}

			// Else
			else
			{
				// Go to the next column
				col++;
			}
		}
	}

	// Set the cursor row position
	void setrow ( unsigned int r)
	{
		// Test for a valid row number
		if ((row > 0) && (row <= ROWS))
		{
			// Set the row to the parameter value
			row = r;
		}

		// Else
		else
		{
			// Set the row to zero
			row = 0;
		}
	}

	// Set the cursor column position
	void setcol (unsigned int c)
	{
		// Test for a valid column number
		if ((col > 0) && (col <= COLS))
		{
			// Set the column to the parameter value
			col = c;
		}

		// Else
		else
		{
			// Set the column to zero
			col = 0;
		}
	}

	// Get the cursor row position
	int  getrow ()
	{
		return row;
	}

	// Get the cursor row position
	int  getcol ()
	{
		return col;
	}

	// Clear the screen
	void clear ()
	{
		// Clear all rows
		for (row = 0; row < ROWS; row++)
		{
			// Clear all columns
			for (col = 0; col < COLS; col++)
			{
				// Clear one position
				screen[(row * COLS) + col] = ' ';
			}
		}

		// Set the cursor at home
		home();
	}

	// Scroll down one line
	void down ()
	{
		// Move 13 lines down one line
		for (int i = (ROWS-1)*COLS-1; i >= 0; i--)
		{
			// Move one character
			screen[i+COLS] = screen[i];
		}

		// Clear the first line
		for (i = 0; i < COLS; i++)
		{
			// Clear one character
			screen[i] = ' ';
		}
	}

	// Scroll up one line
	void up ()
	{
		// Move 13 lines up one line
		for (int i = 0; i < (ROWS-1)*COLS; i++)
		{
			// Move one character
			screen[i] = screen[i+COLS];
		}

		// Clear the last line
		for (i = (ROWS-1)*COLS; i < ROWS*COLS; i++)
		{
			// Clear one character
			screen[i] = ' ';
		}
	}

	// Move the cursor to home (1,1)
	void home ()
	{
		// Put the cursor in the first row and column
		row = 1;
		col = 1;
	}

	// Move the cursor to the beginning of the next line
	void next ()
	{
		// If the cursor is not on the last line
		if (row != ROWS)
		{
			// Set the cursor at the beginning of the next line
			row++;
			col = 1;
		}

		// Else
		else
		{
			// Scroll up one line
			up();

			// Put the cursor at the beginning of the line
			col = 1;
		}
	}

	// Ring the bell
	void bell ()
	{
		// Issue an ASCII ring bell character
		cout << "***** BELL RING *****" << endl;
	}

	// Turn off the cursor:  Move to (0,0)
	void off ()
	{
		// Put the cursor off the screen
		row = 0;
		col = 0;
	}

	// Print the complete display
	void print()
	{
		unsigned int  r;				// Matrix row
		unsigned int  c;				// Matrix col
		int           cont;				// Debug continue
		char          buffer[COLS+1];	// Print buffer

		// Print the top line
		cout << '+' << topbot << "+" << endl;

		// Print each row
		for (r = 0; r < ROWS; r++)
		{
			// Set up one row
			for (c = 0; c < COLS; c++)
			{
				// Set one display character
				buffer[c] = screen[(r * COLS) + c];
			}

			// Terminate the row
			buffer[COLS] = '\0';

			// Print the row
			cout << '|' << buffer << '|' << endl;
		}

		// Print the bottom line
		cout << '+' << topbot << "+" << endl;

		// If stop after each print
		if(SHOWALL)
		{
			// Wait for input
			cont = cin.get();
		}
	}
};


// Global Variables
	unsigned int index;					// General use index
	unsigned int timer;					// Current project time
	unsigned int next;					// Next supply time
	         int ready;					// Next supply ready
	unsigned int intype;				// Input type
	unsigned int intime;				// Input time
	unsigned int incnt;					// Input item   count
	unsigned int inbrik;				// Input brick  count
	unsigned int ingird;				// Input girder count
	unsigned int inlen;					// Input girder length
	         int eof;					// End of file indicator

	char         crane;					// Crane character
	unsigned int crnrow;				// Crane row
	unsigned int crncol;				// Crane col
	unsigned int m;						// Crane block lift count

	unsigned int error;					// Error indicator
	unsigned int tries;                 // Blocked move tries
	unsigned int pickup;				// Load pickup area
	unsigned int girdl;					// Left  side girder segments
	unsigned int girdr;					// Right side girder segments
	unsigned int phase;					// Program phase
	unsigned int sline;					// Solution line
	unsigned int tbrick;				// Total brick  count
	unsigned int tgird;					// Total girder count
	unsigned int cbrick;				// Current brick  count
	unsigned int cgird;					// Current girder count
	unsigned int sbrick;				// Supply  brick  count
	unsigned int sgird;					// Supply  girder count
	unsigned int sgirdl[maxgrd];		// Supply  girder lengths
	
	
	char         action;                // Action input
	char         more;                  // More play answer
	char         sbuf[brows][bcols];	// Solution buffer
	char         cbuf[ROWS-drows]
				     [sucpos-1];		// Construction buffer		
	char         record[rsize+1];		// Input data record
	Cuspcrt      d;						// Display object
	ifstream     infile;				// Input file object
	
	

// Function prototypes
void start ();							// Start the program
void init  ();							// Initialize a project
void setup ();							// Set the solution
void build ();							// Build a project
void finish();							// Finish a project
void stop  ();							// End the program
int  read  ();							// Read an input record
void scan  ();							// Scan an input record
void post  ();							// Post an input record
void scnsol();							// Scan a solution record
void scnsup();							// Scan a supply   record
void pstsol();							// Post a solution record line
void pstsup();							// Post a supply   record line
void pstbrk();							// Post bricks  to the supply
int  pstgrd();							// Post girders to the supply
void restak();							// Restack the supplies
int  right();							// Move right
int  left();							// Move left
int  up();								// Move up
int  down();							// Move down
int  grabmb();							// Grab m brick(s)
int  grab1g();							// Grab a girder
int  drop();							// Release a load
void savcon();							// Check   the project construction
void discon();							// Display the project construction
void dissol();							// Display the project solution
int  cksoln();							// Check   the project solution
void putnum(int a, int n);				// Put number
int  ptoa (int r, int c);				// Screen position to display address
void getstr(char buf[], int max);		// Get an input record

// Main program
int main()
{
	// Initialize the program
	start();

	// While there are projects  to build
	while ((more == 'Y') || (more == 'y'))
	{
		// Initialize a project
		init();

		// Set up the solution and initial project configuration
		setup();

		// Build a project
		build();

		// Finish the project
		finish();
	}

	// Stop the program
	stop();

	// Return
	return 0;
}


// Program initialization function
void start()
{
	// Turn the cursor off
	d.off();

	// Set the input file not opened
	ready = -2;

	// Set program phase to not started
	phase = 0;

	// Set more play to 'Y'
	more  = 'Y';
}


// Project initialization function
void init()
{
	unsigned int a;						// Video buffer address
	unsigned int i;						// Loop index

	// Open the input file
 	infile.open(filename, ios::in);

	// If  error
	if (!infile)
	{
		// display error message
		cout << "File \"" << filename << "\" could not be opened!" << endl;
		
		// Exit
		exit(1);
	}

	// Else
	else
	{
		// Clear the end-of-file indicator
		eof = 0;
	}

	// Set ready to read
	ready = 2;

	// Clear  the screen
	d.clear();

	// Clear the error indicator
	error = 0;
	
	// Clear the total brick and girder counts
	tbrick = 0;
	tgird  = 0;

	// Clear the current brick and girder counts
	cbrick = 0;
	cgird  = 0;

	// Clear the supply brick and girder counts
	sbrick = 0;
	sgird  = 0;

	// Set the solution line to 1
	sline = 0;

	// Set initial time to zero
	timer = 0;

	// Set next time to zero
	next = 0;

	// Set the initial crane position
	crnrow = crrpos;
	crncol = crcpos;

	// Set the initial crane character
	crane = crichr;

	// Display the crane
	d.write(ptoa(crnrow, crncol), crane);

	// Clear the input action
	action = ' ';
	
	// Set tries to zero
	tries = 0;

	// Set program phase to solution read
	phase = 1;

	// Set the title
	for (a = tittpos, i = 0; a < tittpos+strlen(title); a++, i++)
	{
		// Set one title character
		d.write(a, title[i]);
	}

	// Set the status line
	for (a = statpos, i = 0; a < statpos+strlen(status); a++, i++)
	{
		// Set one title character
		d.write(a, status[i]);
	}

	// Set the separator line
	for (a = septpos, i = 0; a < septpos+strlen(seplin); a++, i++)
	{
		// Set one title character
		d.write(a, seplin[i]);
	}

	// Set the mode to construction
	d.write(modpos,   'C');

	// Set the time display to zero
	d.write(timpos,   '0');
	d.write(timpos-1, ' ');
	d.write(timpos-2, ' ');
	d.write(timpos-3, ' ');


	// Set the current brick count to zero
	d.write(brkpos,   '0');
	d.write(brkpos-1, ' ');
	d.write(brkpos-2, ' ');

	// Set the total brick count to zero
	d.write(brtpos,   '0');
	d.write(brtpos-1, ' ');
	d.write(brtpos-2, ' ');

	// Set the current girder count to zero
	d.write(grdpos,   '0');

	// Set the total girder count to zero
	d.write(grtpos,   '0');

	// Save the construction project
	savcon();

	// Read and scan first input record
	read();
}


// Set the project solution
void setup()
{
	int r;								// Row index
	int c;								// Column index
	
	// While there is solution data
	while ((ready > 0) && (phase == 1))
	{
		// Post the input record
		post();
		
		// Read and scan the next input record
		read();
	}

	// If there are unused rows in the solution
	if (sline < brows)
	{
		// Move the solution to the bottom
		for (r = brows-1; r >= 0; r--)
		{
			for (c = 0; c < bcols; c++)
			{
				if (sline > 0)
				{
					sbuf[r][c] = sbuf[sline-1][c];
				}
				else
				{
					sbuf[r][c] = ' ';
				}
			}

			if (sline > 0)
			{
				sline--;
			}
		}
	}
}


// Build a project
void build()
{
             int success;				// Success indicator
	unsigned int i;						// Loop index
	unsigned int a;						// Video buffer address

	// Build while the project is not complete
	while ((!cksoln()) && (error == 0) && (tries < trylmt) && (action != 'Q'))
	{
		// While it is time to do the supply operation
		while ((next <= timer) && (ready > 0))
		{
			// Do the supply operation
			post();

			// Read and scan the next input record
			read();
		}

		// Print the display
		d.print();
		
		// Process all keyboard input
		do
		{
			// Prompt for an action
			cout << ":";
		
			// Get an action
			cin >> action;

			// If the action character is lower case
			if ((action >= 'a') && (action <= 'z'))
			{
				// Convert the character to upper case
				action -= 'a' - 'A';
			}

			// Initialize the success indicator
			success = -1;

			// If the action is move is right
			if (action == movert)
			{
				// Move right if possible
				success = right();			
			}

			// Else if the action is move is left
			else if (action == movelt)
			{
				// Move left if possible
				success = left();			
			}

			// Else if the action is move is up
			else if (action == moveup)
			{
				// Move up if possible
				success = up();			
			}

			// Else if the action is move is down
			else if (action == movedn)
			{
				// Move down if possible
				success = down();			
			}

			// Else if the action is grab one to n bricks
			else if ((action >= grab1) && (action < grab1+n))
			{
				// Set m
				m = action - '0';
				
				// Grab m bricks if possible
				success = grabmb();			
			}

			// Else if the action is grab a girder
			else if (action == grabg)
			{
				// Grab a girder if possible
				success = grab1g();			
			}

			// Else if the action is release the load
			else if (action == releas)
			{
				// Grab the load if possible
				success = drop();			
			}

			// Else if the action is show the solution
			else if (action == shosol)
			{
				// If the solution is not currently displayed
				if (d.read(modpos) != 'S')
				{
					// If the project is currently displayed
					if (d.read(modpos) == 'C')
					{
						// Save the construction project
						savcon();
				
						// Display the solution
						dissol();

						// Set the success indicator
						success = 1;
					}
			
					// Else
					else
					{
						// Clear the success indicator
						success = 0;
					
						// Set the error indicator
						// ***** INVALID DISPLAY TYPE *****
						error = 1;
					}
				}
			}

			// Else if the action is show the construction project
			else if (action == shocon)
			{
				// If the project is not currently displayed
				if (d.read(modpos) != 'C')
				{
					// Display the construction project
					discon();

					// Set the success indicator
					success = 1;
				}	
			}

			// Else if the action is quit
			else if (action == endprg)
			{
				// Set the success indicator
				success = 1;
			}
		}
		// While the input is invalid
		while (success < 0);

		// If the operation was successful
		if (success > 0)
		{
			// Clear block moves count
			tries = 0;
		}
	
		// Else
		else
		{
			// Increment block moves count
			tries++;

			// Ring the bell
			d.bell();
		}

		// Increment the time
		timer += tick;

		// Set the time in the display
		putnum (timpos, timer);
	}

	// If there is an error
	if (error != 0)
	{
		// Display the error message
		for (a = statpos, i = 0; a < statpos+strlen(errmsg); a++, i++)
		{
			// Set one message character
			d.write(a, errmsg[i]);
		}

		// Set the error number
		putnum (errpos, error);

		// Print the display
		d.print();
	}

	// Else if there were too many tries
	else if (tries > trylmt)
	{
		// Display the excess tries message
		for (a = statpos, i = 0; a < statpos+strlen(trymsg); a++, i++)
		{
			// Set one message character
			d.write(a, trymsg[i]);
		}

		// Set the number of tries
		putnum (trypos, tries);

			// Print the display
		d.print();
	}
}


// Finish a game
void finish()
{
	unsigned int a;						// Video buffer address
	unsigned int i;						// Loop index

	// Close the input file
	infile.close();
	

	// Ask about another game
	for (a = tittpos, i = 0; a < tittpos+strlen(again); a++, i++)
	{
		// Set one question character
		d.write(a, again[i]);
	}

	// Print the final display
	d.print();

	// Get the answer
	cin >> more;
}


// End the program
void stop()
{
	// Display a termination message
	cout << endl << "The construction project program is done!"
		 << endl << endl;
}


// Read an input record
int read()
{
	// If file is open
	if (ready >= 0)
	{
		// If input device is not ready
		if (ready == 0)
		{
			// Display wailing message
			cout << "Waiting for input device" << endl;

			// Exit
			exit(1);
		}

		// Else if invalid state
		else if (ready > 2)
		{
			// Display invalid state message
			cout << "Invalid ready state in read" << endl;

			// Exit
			exit(1);
		}

		// Else
		else
		{
			// Set read in progress
			ready = 0;

			// Read an input record
			getstr(record, rsize);

			// Test for record present
			if (eof == 0)
			{
				// Set ready to process
				ready = 1;

				// Scan the record
				scan();
			}

			// Else
			else
			{
				// Indicate end of input
				ready = -1;
			}
		}
	}

	// Else
	else
	{
		// Display file not open message
		cout << "File not open:  Unable to read" << endl;

		// Exit
		exit(1);
	}
	
	// Return
	return ready;
}


// Scan and parse an input record
void scan()
{
	// If there is no input ready
	if (ready < 1)
	{
		// Display an error message
		cout << "No input to scan!" << endl;
	
		// Exit
		exit(1);
	}

	// Else if scanning
	else if (ready == 2)
	{
		// Display processed message
		cout << "Input already processed" << endl;

		// Exit
		exit(1);
	}

	// Else if invalid state
	else if (ready > 2)
	{
		// Display invalid state message
		cout << "Invalid ready state in scan" << endl;

		// Exit
		exit(1);
	}

	// Else
	else
	{
		// If the record is a solution record
		if (( record[0] == 'B')  ||
		    ( record[0] == 'G')  ||
		    ( record[0] == '*')  ||
		    ( record[0] == ' '))
		{
			// Set the type to solution (intype = 1)
			intype = 1;
		}

		// Else if the record is a supply record
		else if (( record[0] == '/')   || 
				 ((record[0] >= '0')   &&
				  (record[0] <= '9')))
		{
			// Set the type to supply (type = 2)
			intype = 2;
		}

		// Else
		else
		{
			// Set the type to invalid (intype = 0)
			intype = 0;
		}
				
		// If in the solution read phase
		if (phase == 1)
		{
			// If the record is a solution record
			if (intype  == 1)
			{
				// Scan the solution record
				scnsol();
			}
			
			// Else if the record is a supply record
			else if (intype == 2)
			{
				// Set the construction phase
				phase = 2;
			}

			// Else
			else
			{
				// Set the error indicator
				// ***** INVALID SOLUTION PHASE RECORD TYPE *****
				error = 101;
			}
		}
		
		// If in the construction phase
		if (phase == 2)
		{
			// If the record is a solution record
			if (intype  == 1)
			{
				// Set the error indicator
				// ***** INVALID CONSTRUCTION PHASE RECORD *****
				error = 102;
			}

			// Else if the record is a supply record
			else if (intype == 2)
			{
				// Scan the supply record
				scnsup();

			}
			// Else
			else
			{
				// Set the error indicator
				// ***** INVALID CONSTRUCTION PHASE RECORD TYPE *****
				error = 103;
			}
}

		// If not in the solution or construction phase
		if ((phase != 1) && (phase != 2))
		{
			// Set the error indicator
			// ***** PHASE ERROR *****
			error = 104;
		}

		// Set ready to read again
		ready = 2;
	}

	// If debugging
	if (DEBUG)
	{
		// Print record data
		cout << "Type    = " << intype << endl;
		cout << "Time    = " << intime << endl;
		cout << "Count   = " << incnt  << endl;
		cout << "Bricks  = " << inbrik << endl;
		cout << "Girders = " << ingird << endl;
		cout << "Length  = " << inlen  << endl;
		cout << "Error   = " << error  << endl;
	}
}


// Post input record data
void post()
{
	// If in the solution read phase
	if ((phase == 1) && (sline <= srows))
	{
		// If the record is a solution record
		if (intype == 1)
		{
			// If there are more solution lines to post
			if (sline <= srows)
			{
				// Post the solution record
				pstsol();
			}

			// Else
			else
			{
				// Set the error indicator
				// ***** MISPLACED SOLUTION RECORD *****
				error = 201;
			}
		}

		// Else
		else
		{
			// Set the error indicator
			// ***** EXCESS SOLUTION RECORD *****
			error = 202;
		}
	}

	// Else if in the build phase
	else if (phase == 2)
	{
		// If the record is a supply record
		if (intype == 2)
		{
			// Post the supplies in the record
			pstsup();
		}

		// Else
		else
		{
			// Set the error indicator
			// ***** INCORRECT CONSTRUCTION RECORD *****
			error = 203;
		}
	}

	// If debugging
	if (DEBUG)
	{
		// Print the project
		cout << "Post:" << record << endl;
		d.print();
	}
}


// Scan a solution record
void scnsol()
{
	unsigned int i;						// Scan index

	// Initialize the index
	i = 0;
	
	// Check each input record character
	while ((i < bcols) && (record[i] != '\0'))
	{
		// If the character is a brick
		if (record[i] == 'B')
		{
			// Count the brick
			tbrick++;
		}

		// Else if the character is a brick
		else if (record[i] == 'b')
		{
			// Change to upper case
			record[i] = 'B';
				
			// Count the brick
			tbrick++;
		}

		// Else if the character is a girder
		else if (record[i] == 'G')
		{
			// If the character is the first section of the girder
			if ((i == 0) || (record[i-1] != 'G'))
			
			// Count the girder
			tgird++;
		}
		
		// Else if the character is a girder
		else if (record[i] == 'g')
		{
			// Change to upper case
			record[i] = 'G';
				
			// If the character is the first section of the girder
			if ((i == 0) || (record[i-1] != 'G'))
			
			// Count the girder
			tgird++;
		}
		
		// Else if the character is not valid
		else if (!((record[i] == '*')   ||
		           (record[i] == ' ')))
		{
			// Set the error indicator
			// ***** INVALID SOLUTION RECORD CHARACTER *****
			error = 111;
		}

		// Increment the index
		i++;
	}

	// If the terminator is invalid
	if (record[i] != '\0')
	{
		// Set the error indicator
		// ***** INVALID SOLUTION RECORD TERMINATOR *****
		error = 112;
	}
}


// Scan a supply record
void scnsup()
{
	char *in;							// Input record pointer

	// Initialize record pointer
	in = record;

	// Clear the time
	intime = 0;

	// Clear the item count
	incnt = 0;

	// Clear the brick count
	inbrik = 0;

	// Clear the girder count
	ingird = 0;

	// Clear the input length
	inlen = 0;

	// While there are decimal digits
	while ((*in >= '0')   &&
		   (*in <= '9')   &&
		   (*in != '\0'))
	{
		// Add the digit to the time value
		intime = 10 * intime + *in - '0';

		// Increment the record pointer
		++in;
	}

	// If there are more input characters
	// and the separator is valid
	if ((*in != '\0') && (*in == '/'))
	{
		// Increment the record pointer
		++in;

		// While there are decimal digits
		while ((*in >= '0')   &&
			   (*in <= '9')   &&
			   (*in != '\0'))
		{
			// Add the digit to the count
			incnt = 10 * incnt + *in - '0';

			// If there are more input characters
			if (*in != '\0')
			{
				// Increment the record pointer
				++in;
			}
		}

		// If there is no count
		if (incnt == 0)
		{
			// Set the count to one
			incnt = 1;
		}

		// If the supply type is bricks
		if ((*in == 'B') || (*in == 'b'))
		{
			// Set the brick count
			inbrik = incnt;
						
			// Increment the record pointer
			++in;
		}

		// Else if the supply type is girders
		else if ((*in == 'G') || (*in == 'g'))
		{
			// Set the girder count
			ingird = incnt;
						
			// Increment the record pointer
			++in;
					
			// While there are decimal digits
			while ((*in >= '0')   &&
				   (*in <= '9')   &&
				   (*in != '\0'))
			{
				// Add the digit to the count
				inlen = 10 * inlen + *in - '0';

				// If there are more input characters
				if (*in != '\0')

				// Increment the record pointer
				++in;
			}

			// If the terminator is not valid
			if (*in != '\0')
			{
				// Set the error indicator
				// ***** INVALID SUPPLY RECORD TERMINATOR *****
				error = 121;
			}

			// Else if the length of the grider is not at least 3
			else if (inlen < 3)
			{
				// Set the error indicator
				// ***** GIRDER TOO SHORT *****
				error = 122;
			}
		}

		// Else
		else
		{
			// Set the error indicator
			// ***** INVALID SUPPLY TYPE *****
			error = 123;
		}
	}

	// Else
	else
	{
		// Set the error indicator
		// ***** INVALID SUPPLY RECORD *****
		error = 124;
	}

	// If the time is not before the previous time
	if (intime >= next)
	{
		// Set the time in next
		next = intime;
	}

	// Else
	else
	{
		// Set the error indicator
		// ***** SUPPLY RECORD OUT OF ORDER *****
		error = 125;
	}

}


// Post a solution record line
void pstsol()
{
	unsigned int i;						// Placement index

	// If there is no error
	if (error == 0)
	{
		// Initialize the column index
		i = 0;
		
		// Copy the line to the solution buffer
		for (; ((i < bcols) && (record[i] != '\0')); i++)
		{
			sbuf[sline][i] = record[i];
		}

		// Fill the line with blanks
		for (; (i < bcols); i++)
		{
			sbuf[sline][i] = ' ';
		}

		// Increment the solution line
		sline++;
	}

	// Update the total brick count
	putnum(brtpos, tbrick);

	// Update the total girder count
	putnum(grtpos, tgird);
}


// Post a supply record line
void pstsup()
{
	// If the crane is in the supply area
	if ((crnrow <= surpos) && (crnrow > surpos - srows)  &&
	    (crncol >= sucpos) && (crncol < sucpos + scols))
	{
		// If the crane is not lifting anything
		if (crane == crichr)
		{
			// Erase the crane at its current position
			d.write(ptoa(crnrow, crncol), ' ');
			
			// Put the crane in its initial position
			crnrow = crrpos;
			crncol = crcpos;

			// Display the crane at the initial position
			d.write(ptoa(crnrow, crncol), crane);
		}

		// Else
		else
		{
			// Set the error indicator
			// ***** CRANE IN USE DURING SUPPLY *****
			error = 211;
		}
	}

	// Else if the crane is lifting brick(s)
	else if ((crane >= grab1) && (crane < grab1+n))
	{
		// If any brick is protruding into the supply area
		if ((crncol   >= sucpos)            &&
			(crncol   <  sucpos+scols)      &&
			(crnrow+m >  surpos-srows))
		{
			// Set the error indicator
			// ***** BRICK(S) INTRUDING DURING SUPPLY *****
			error = 212;
		}
	}

	// Else if the crane is lifting a girder
	else if (crane == grabgc)
	{
		// If the girder is protruding into the supply area
		if ((crnrow+1 >= surpos-srows+1)        &&
		    (crnrow+1 <= surpos)                &&
			(((crncol+girdr >= sucpos)          &&
		 	  (crncol+girdr <  sucpos+scols))   ||
			 ((crncol-girdl >= sucpos)          &&
			  (crncol-girdl <  sucpos+scols))))
		{
			// Set the error indicator
			// ***** GIRDER INTRUDING DURING SUPPLY *****
			error = 213;
		}
	}

	// If there is no error
	if (error == 0)
	{
		// If the supply type is bricks
		if (inbrik != 0)
		{
			// Post the brick supply
			pstbrk();
		}

		// Else if the supply type is girders
		else if (ingird != 0)
		{
			// Post the girder supply
			// If not successful
			if (pstgrd() == 0)
			{				
				// Restack the supplies
				restak();
			}
		}

		// Else
		else
		{
			// Set the error indicator
			// ***** NO SUPPLIES TO POST *****
			error = 214;
		}
	}
}


// Post bricks to the supply
void pstbrk()
{
	unsigned int b;						// Brick count
			 int a;						// Display address
			 int r;						// Row index
			 int c;						// Col index

	// Initialize the brick count
	b = 0;

	// Fill each row
	for (r = surpos; ((r > surpos - srows) && (b < inbrik)); r--)
	{
		// Fill each column
		for (c = sucpos; ((c < sucpos + scols) && (b < inbrik)); c++)
		{
			// Calculate the display address
			a = ptoa(r,c);
			
			// If the position is empty
			if (d.read(a) == ' ')
			{
				// Add a brick to the supply
				d.write(a,'B');
				
				// Increment the brick count
				b++;

				// Increment the supply brick count
				sbrick++;
			}
		}
	}

	// If there are bricks remaining
	if (b < inbrik)
	{
		// Set the error indicator
		// ***** BRICK SUPPLY FULL *****
		error = 221;
	}
}


// Post girders to the supply
int pstgrd()							
{
	unsigned int g;						// Girder  count
	unsigned int s;						// Girder  section
	         int r;						// Row     index
	         int c;						// Col     index
			 int found;					// Found   indicator
			 int result;				// Success indicator

	// Set successful
	result = 1;

	// If there are too many girders
	if ((sgird + ingird > maxgrd)  ||
	    (sgird + ingird > srows))
	{
		// Clear the success indicator
		result = 0;

		// Set the error indicator
		// ***** TOO MANY GIRDERS *****
		error = 231;
	}

	// Else
	else
	{
		// If there are no supplies
		if ((sbrick + sgird) == 0)
		{
			// Start at the bottom row
			r = surpos;
			c = sucpos;
		}

		// Else find the starting row
		else
		{
			// Set starting position not found
			found = 0;
		
			// Start at the top of the supply area
			r = surpos - srows + 1;

			// While there are more rows to check
			// and the starting position is not found
			while ((r <= surpos) && (!found))
			{
				// Start at the right side of the supply area
				c = sucpos + scols - 1;
			
				// While there are more columns to check
				// and the starting position is not found
				while ((c >= sucpos) && (!found))
				{
					// If there is a supply in the position
					if (d.read(ptoa(r,c)) != ' ')
					{
						// Set the found indicator
						found = 1;
					}

					// Else
					else
					{
						// Move to the next position
						c--;
					}
				}

				// If the position was not found
				if (!found)
				{
					// Move to the next row position
					r++;
				}
			}

			// If the position was found
			if (found)
			{
				// Move right one position
				c++;

				// If the row is full
				if (c == sucpos + scols)
				{
					// Move up to the next row
					r--;

					// If the supply area is full
					if (r < surpos - srows + 1)
					{
						// Set the error indicator
						// ***** GIRDER SUPPLY FULL *****
						error = 232;
					}
				}

				// Else check for room for the girder
				else
				{
					// If the girder will not fit in the row
					if (c + inlen > sucpos + scols)
					{
						// Clear the success indicator
						result = 0;
					}

					// Else if there are not enough rows left
					else if (r - ingird < surpos - srows)
					{
						// Clear the success indicator
						result = 0;
					}
				}
			}
		
			// Else
			else
			{
				// Set the error indicator
				// ***** SUPPLY STATUS MISMATCH *****
				error = 233;
			}
		}

		// If there is no error
		if ((error == 0) && (result != 0))
		{
			// Initialize the girder count
			g = 0;

			// Check for adequate support
			c = sucpos + scols -1;
			s = 0;

			// While there are more sections to the girder
			while ((r < surpos) && (s < inlen) && (result != 0))
			{
				// If there is adequate support under the girder
				if (d.read(r*COLS+c-1) != ' ')
				{
					// Increment the grider section count
					s++;

					// Move to the next position
					c--;
				}

				// Else
				else
				{
					// Clear the success indicator
					result = 0;
				}
			}
				
			// Place each girder
			while ((r > surpos - srows) && (g < ingird) && (result != 0))
				{
				// Place one girder
				c = sucpos + scols -1;
				s = 0;
		
				// While there are more sections to the girder
				while ((s < inlen) && (result != 0))
				{
					// Add a girder section to the supply
					d.write((r-1)*COLS+c-1,'G');
				
					// Increment the grider section count
					s++;

					// Move to the next position
					c--;
				}

				// Increment the girder count
				g++;

				// Increment the supply girder count
				sgird++;
		
				// Move to the next row
				r--;
			}

			// If some girder sections are not set
			if ((result != 0) && (s < inlen))
			{
				// Set the error indicator
				// ***** GIRDER SUPPLY FULL *****
				error = 234;
			}
		}
	}

	// Return the success indicator
	return result;
}


// Restack the supplies
void restak()
{
	unsigned int b;						// Brick   count
	         int g;						// Girder  count
	         int s;						// Girder  sections
	         int r;						// Row     index
	         int c;						// Col     index
			 int i;						// Sort    index
			 int j;						// Sort    index
			 int hold;					// Sort    holder

	// Clear the brick count
	b = 0;

	// Clear the girder count
	g = 0;

	// Put the new girders in the stack
	while (unsigned(g) < ingird)
	{
		// Place one girder in the stack
		sgirdl[g] = inlen;

		// Increment the girder count
		g++;

		// Increment the supply girder count
		sgird++;
		
	}

	// Put the girders in the supply in the stack
	for (r = surpos; r > surpos - srows; r--)
	{		
		// If the row has a girder
		if (d.read(ptoa(r,sucpos+scols-1)) == 'G')
		{
			// If there is room in the girder stack
			if (g < maxgrd)
			{
				// Set the column to the end of the girder
				c = sucpos + scols - 1;

				// Clear the section count
				s = 0;

				// While there is a girder section
				while (d.read(ptoa(r,c)) == 'G')
				{
					// Increment the section count
					s++;

					// Move to the next column
					c--;
				}

				// Add the girder to the stack
				sgirdl[g] = s;

				// Increment the girder count
				g++;
			}

			// Else
			else
			{
				// Set the error indicator
				// ***** TOO MANY GIRDERS TO RESTACK *****
				error = 241;
			}
		}
	}

	// Count the bricks by rows
	for (r = surpos - srows + 1; r <= surpos; r++)
	{
		// Check each column
		for (c = sucpos; c < sucpos + scols; c++)
		{
			// If the supply position holds a brick
			if (d.read(ptoa(r,c)) == 'B')
			{
				// Increment the brick count
				b++;
			}
		}
	}

	// If there is more than one girder
	if (g > 1)
	{
		// Sort the girder stack
		for (i = 0; i < g - 1; i++)
		{
			for (j = g - 2; j >= 0; j--)
			{
				// If the items are out of order
				if (sgirdl[j] > sgirdl[j+1])
				{
					// Swap the items
					hold        = sgirdl[j];
					sgirdl[j]   = sgirdl[j+1];
					sgirdl[j+1] = hold;
				}
			}
		}
	}

	// Clear the supply area
	for (r = surpos - srows + 1; r <= surpos; r++)
	{
		for (c = sucpos; c < sucpos + scols; c++)
		{
			// Clear the supply position
			d.write(ptoa(r,c),' ');
		}
	}

	// Start with the first girder
	g--;
	
	// Start on the bottom
	r = surpos;
	
	// Place the girders
	while (g >= 0)
	{
		// Place one girder
		for (c = sucpos + scols - 1;
		     c + sgirdl[g] > sucpos + scols - 1; c--)
		{
			// Place one girder segment	
			d.write(ptoa(r,c), 'G');
		}

		// Decrement the girder count
		g--;

		// Move to the next row
		r--;

	}

	// Place the bricks
	hold = inbrik;
	inbrik = b;
	pstbrk();
	inbrik = hold;
}


// Move right
int right()
{
	         int success;				// Success indicator
	unsigned int i;						// Loop index


//  **********************************************************
//  **********************************************************
//  **                                                      **
//  **      ADD CODE HERE TO MOVE CRANE AND LOAD RIGHT      **
//  **                                                      **
//  **********************************************************
//  **********************************************************


	// Return the success indicator
	return success;
}


// Move left
int left()
{
	         int success;				// Success indicator
	unsigned int i;						// Loop index


//  *********************************************************
//  *********************************************************
//  **                                                     **
//  **      ADD CODE HERE TO MOVE CRANE AND LOAD LEFT      **
//  **                                                     **
//  *********************************************************
//  *********************************************************


	// Return the success indicator
	return success;
}


// Move up
int up()
{
	         int success;				// Success indicator
	unsigned int i;						// Loop index


//  *******************************************************
//  *******************************************************
//  **                                                   **
//  **      ADD CODE HERE TO MOVE CRANE AND LOAD UP      **
//  **                                                   **
//  *******************************************************
//  *******************************************************


	// Return the success indicator
	return success;
}


// Move down
int down()
{
	         int success;				// Success indicator
	unsigned int i;						// Loop index


//  *********************************************************
//  *********************************************************
//  **                                                     **
//  **      ADD CODE HERE TO MOVE CRANE AND LOAD DOWN      **
//  **                                                     **
//  *********************************************************
//  *********************************************************


	// Return the success indicator
	return success;
}


// Grab m brick(s)
int grabmb()
{
	         int success;				// Success indicator
	unsigned int i;						// Loop index


//  *************************************************
//  *************************************************
//  **                                             **
//  **      ADD CODE HERE TO PICK UP M BRICKS      **
//  **                                             **
//  *************************************************
//  *************************************************


	// Return the success indicator
	return success;
}


// Grab a girder
int grab1g()
{
	         int success;				// Success indicator
	unsigned int i;						// Loop index

	// Set the success indicator
	success = 1;


//  ***************************************************
//  ***************************************************
//  **                                               **
//  **      ADD CODE HERE TO PICK UP ONE GIRDER      **
//  **                                               **
//  ***************************************************
//  ***************************************************


	// Return the success indicator
	return success;
}


// Release a load
int drop()
{
	int success;						// Success indicator


//  ***********************************************
//  ***********************************************
//  **                                           **
//  **      ADD CODE HERE TO RELEASE A LOAD      **
//  **                                           **
//  ***********************************************
//  ***********************************************


	// Return the success indicator
	return success;
}


// Save the project construction
void savcon()
{
    int r;								// Row     index
    int c;								// Column  index

	// If the construction project is displayed
	if (d.read(modpos) == 'C')
	{
		// Save each row
		for (r = 0; r < ROWS-drows; r++)
		{
			// Save each column
			for (c = 0; c < sucpos-1; c++)
			{
				// Save one project element
				cbuf[r][c] = d.read(ptoa(drows+1+r,c+1));
			}
		}
	}

	// Else
	else
	{
		// Set the error indicator
		// ***** CONSTRUCTION PROJECT NOT DISPLAYED *****
		error = 11;
	}
}


// Display the project construction
void discon()
{
    int r;								// Row     index
    int c;								// Column  index

	// Display each row
	for (r = 0; r < ROWS-drows; r++)
	{
		// Display each column
		for (c = 0; c < sucpos-1; c++)
		{
			// Display one project element
			d.write(ptoa(drows+1+r,c+1), cbuf[r][c]);
		}
	}

	// Set the mode to construction
	d.write(modpos, 'C');
}


// Display the project solution
void dissol()
{
    int r;								// Row     index
    int c;								// Column  index

	// Clear each row above the solution
	for (r = drows+1; r <= burpos-brows; r++)
	{
		// Clear each column position
		for (c = 1; c < sucpos; c++)
		{
			// Clear one position
			d.write(ptoa(r,c), ' ');
		}
	}

	// Display each row of the solution
	for (r = 0; r < brows; r++)
	{
		// Clear each column to the left of the solution
		for (c = 1; c < bucpos; c++)
		{
			// Clear one position
			d.write(ptoa(burpos-brows+1+r,c), ' ');
		}

		// Display each column of the solution
		for (c = 0; c < bcols; c++)
		{
			// Display one solution element
			d.write(ptoa(burpos-brows+1+r,bucpos+c), sbuf[r][c]);
		}

		// Clear each column to the right of the solution
		for (c = bucpos+bcols; c < sucpos; c++)
		{
			// Clear one position
			d.write(ptoa(burpos-brows+1+r,c), ' ');
		}
	}

	// Clear each row below the solution
	for (r = burpos+1; r <= ROWS; r++)
	{
		// Clear each column position
		for (c = 1; c < sucpos; c++);
		{
			// Clear one position
			d.write(ptoa(r,c), ' ');
		}
	}

	// Set the mode to construction
	d.write(modpos, 'S');
}


// Check the project solution
int  cksoln()
{
    int i;								// Row     index
    int j;								// Column  index
	int result;							// Success indicator
	
	// If the construction project is displayed
	if (d.read(modpos) == 'C')
	{
		// Set success
		result = 1;
	
		// Check each row
		for (i = 0; ((i < brows) && result); i++)
		{
			// Check each column
			for (j = 0; ((j < bcols) && result); j++)
			{
				// If the solution is not a wild card
				if (sbuf[i][j] != '*')
				{
					// If the construction does not match the solution
					if (d.read(ptoa(burpos-brows+1+i,bucpos+j)) != sbuf[i][j])
					{				
						// Clear the success indicator
						result = 0;
					}
				}
			}
		}
	}

	// Else
	else
	{
		// Clear success
		result = 0;
	}

	// Return result
	return result;
}


// Put a number on the screen
void putnum(int a, int n)
{
	int digit;							// Digit value

	// If the number is zero
	if (n == 0)
	{
		// Set the zero
		d.write(a, '0');

		// Decrement the address
		a--;
	}
	
	while ( (d.read(a) != '/') && 
	        (d.read(a) != ':') &&
		   ((d.read(a) != ' ') || (n > 0)))
	{
		// Get the digit value
		digit = n % 10;

		// If there are digits to set
		if (n != 0)
		{
			// Set the digit
			d.write(a, digit+'0');
		}

		// Else
		else
		{
			// Set a blank
			d.write(a, ' ');
		}

		// Decrement the location
		a--;

		// Set up next digit
		n = n / 10;
	}
}


// Convert a screen position to the display address
int ptoa(int r, int c)
{
	return ((r-1)*COLS+c-1);
}


// Get a string from the keyboard
void getstr(char buf[], int max)
{
	// Local data
	int ch;					// Input character]
	int pos;				// Buffer pointer

	// Start at the  beginning of the buffer
	pos = 0;
	
	// Do
	do
	{
		// Get one character
		ch = infile.get();

		// If the character is EOF
		if (ch == EOF)
		{
			// Terminate the line
			buf[pos] = '\0';

			// Set the End-of-file indicator
			eof = 1;
		}

		// Else if the character is a newline
		else if (ch == '\n')
		{
			// Terminate the line
			buf[pos] = '\0';
		}

		// Else
		else
		{
			// Place the character in the buffer
			buf[pos] = ch;

			// Increment the buffer position
			pos++;
		}
	}

	// While the line is not complete
	while ((ch != '\n') && (pos < max) && (eof == 0));
}
