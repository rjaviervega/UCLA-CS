/*

CS M152B

HingKei Ho
Javier Vega
Wei Jun Yu

*/
import java.lang.*;
import java.io.*;
import java.util.*;

public class asm2hex
{
	static StreamTokenizer in;
	static BufferedWriter  out;
	static InputStreamReader r;

	static boolean debug;

	static ArrayList instrs;
    static ArrayList labelLookup;

	final static int word 	= StreamTokenizer.TT_WORD;
	final static int number = StreamTokenizer.TT_NUMBER;
	final static int eol 	= StreamTokenizer.TT_EOL;
	final static int eof 	= StreamTokenizer.TT_EOF;

	static int numDefs;

	static int currentByte;	// keep track of the byte address of the current instruction

	public static void main( String [] args )
	{
		numDefs 	= 0;
		currentByte = -2;

		if ( args.length != 2 && args.length != 3 )
		{
			System.out.println("Error: invalid command line usage");
			System.out.println("The correct usage is: java asm2hex input_file output_file [-debug]");
			System.exit(1);
		}

		if ( args.length == 3 && args[2].equals("-debug") )
			debug = true;

		try
		{
			String inFile  = args[0];
			String outFile = args[1];

			r   = new InputStreamReader( new FileInputStream(inFile) );
			in  = new StreamTokenizer( r );
			out = new BufferedWriter( new OutputStreamWriter( new FileOutputStream(outFile) ) );
			in.parseNumbers();
			in.lowerCaseMode(true);
			in.ordinaryChar(',');
			in.ordinaryChar(':');
			in.ordinaryChar('(');
			in.ordinaryChar(')');
			in.ordinaryChar(':');
			in.commentChar(';');
			in.eolIsSignificant(false);
		}
		catch(IOException IOE)
		{
			System.out.print("\nError:  IO Exception.  ");
			System.out.println("Check I/O file permissions and file existence.");
			System.exit(1);
		}

		Program p = new Program();
		p.translate();

		try
		{
			out.flush();
		}
		catch(IOException IOE)
		{
		}

		System.exit(0);
	}

	// Define class contains name-value pairs
	// It is used for both Defines and Labels
	private static class Define
	{
		public String name;
		public int value;

		public Define( String n, int v )
		{
			name = n;
			value = v;
		}
	}

	// Given a
	private static class TypeLookup
	{
		public char type;
		public String opCode;
		public String funcField;
		public String rs;
		public String rt;
		public String rd;

		public TypeLookup ( String instruction )
		{
			funcField = "";
			opCode    = "";
			rs  	  = "";
			rt		  = "";
			rd		  = "";

			if ( instruction.equals("add") ||
				 instruction.equals("sub") ||
				 instruction.equals("inc") ||
				 instruction.equals("dec") ||
				 instruction.equals("sla") ||
				 instruction.equals("sra") ||
				 instruction.equals("and") ||
				 instruction.equals("or")  ||
				 instruction.equals("comp")||
				 instruction.equals("sll") ||
				 instruction.equals("srl") ||
				 instruction.equals("push")||
				 instruction.equals("pop") ||
				 instruction.equals("slt")
			   )
			 	opCode = "000";


			else if ( instruction.equals("lw") )
				opCode = "001";


			else if ( instruction.equals("sw") )
				opCode = "010";


			else if ( instruction.equals("addi") )
				opCode = "011";


			else if ( instruction.equals("beq") )
				opCode = "100";


			else if ( instruction.equals("j") )
				opCode = "101";


			else if ( instruction.equals("jal") )
				opCode = "110";


			else if ( instruction.equals("jr") || instruction.equals("hlt") )
				opCode = "111";

			else
				opCode = "label";

			if ( opCode.equals("000") )
				type = 'r';

			else if ( opCode.equals("001") || opCode.equals("010") || opCode.equals("011") || opCode.equals("100") )
				type = 'i';

			else if ( opCode.equals("101") || opCode.equals("110") || opCode.equals("111") )
				type = 'j';

			if ( instruction.equals("add") )
				funcField = "0000";

			else if ( instruction.equals("sub") )
				funcField = "0001";

			else if ( instruction.equals("inc") )
			{
				rt = "000";
				funcField = "0100";
			}

			else if ( instruction.equals("dec") )
			{
				rt = "000";
				funcField = "0101";
			}

			else if ( instruction.equals("sla") )
				funcField = "1000";

			else if ( instruction.equals("sra") )
				funcField = "1010";

			else if ( instruction.equals("and") )
				funcField = "0010";

			else if ( instruction.equals("or")  )
				funcField = "0011";

			else if ( instruction.equals("comp") )
			{
				funcField = "0110";
				rt = "000";
			}

			else if ( instruction.equals("sll") )
				funcField = "1100";

			else if ( instruction.equals("srl") )
				funcField = "1110";

			else if ( instruction.equals("push") )
			{
				funcField = "1101";
				rt = "000";
				rd = "000";
			}

			else if ( instruction.equals("pop") )
			{
				funcField = "1111";
				rt = "000";
				rs = "000";
			}

			else if ( instruction.equals("slt") )
				funcField = "1001";
		}
	}

	private static class Program
	{
		public Program()
		{
			int type;
			int tempVal = 0;
			char tempChar;
			String r1 = "000";
			String r2 = "000";
			String r3 = "000";
			String tempStr = "";

			try
			{
				instrs 		= new ArrayList();
				labelLookup = new ArrayList();
				String currentToken = "";

				while ( ( type = in.nextToken() ) != eof )
				{
					if ( type != word )
					{
						System.out.println("Error - invalid instruction in line " + in.lineno() );
						System.exit(1);
					}

					else
					{
						currentToken = in.sval;

						TypeLookup tl = new TypeLookup(currentToken);

						String rs = "";
						String rt = "";
						String rd = "";

						if ( currentToken.equals( "define" ) )
						{
							// have a define directive

							numDefs++;

							if ( (type = in.nextToken()) == word )
								tempStr = in.sval;

							else
							{
								System.out.print("Error - syntax error in Define directive in line ");
								System.out.println(in.lineno() + ".");
								System.exit(1);
							}

							if ( (type = in.nextToken()) == number )
								tempVal = (int) in.nval;

							else
							{
								System.out.print("Error - syntax error in Define directive in line ");
								System.out.println(in.lineno() + ".");
								System.exit(1);
							}

							Define define = new Define( tempStr, tempVal);
							labelLookup.add(define);
						}

						else if ( tl.type == 'r' )
						{
							currentByte += 2;

							type = in.nextToken();
							r1 = regLookup( in.sval );

							if ( tl.funcField.equals("1101") )
							{
								// push

								rs = r1;
								rt = "000";
								rd = "000";
							}


							else if ( tl.funcField.equals("1111") )
							{
								// pop

								rs = "000";
								rt = "000";
								rd = r1;
							}

							if ( !(tl.funcField.equals("1101")) && !(tl.funcField.equals("1111")) )
							{
								// 2 or 3 registers
								type = in.nextToken();
								tempChar = (char) type;

								if ( tempChar != ',' )
								{
									System.out.print("Error - syntax error in line " + in.lineno() + ".");
									System.out.println("Missing \',\'");
									System.exit(1);
								}

								type = in.nextToken();
								r2 = regLookup( in.sval );

								rs = r2;
								rt = "000";
								rd = r1;
							}

							if ( !(tl.funcField.equals("0100")) &&
							     !(tl.funcField.equals("0101")) &&
							     !(tl.funcField.equals("0110")) &&
							     !(tl.funcField.equals("1101")) &&
							     !(tl.funcField.equals("1111"))
							   )
							{
								// 3 registers
								type = in.nextToken();
								tempChar = (char) type;

								if ( tempChar != ',' )
								{
									System.out.print("Error - syntax error in line " + in.lineno() + ".");
									System.out.println("Missing \',\'");
									System.exit(1);
								}

								type = in.nextToken();
								r3 = regLookup( in.sval );

								//Rtype rtype = new Rtype(tl.opCode, r2, r3, r1, tl.funcField);
								rs = r2;
								rt = r3;
								rd = r1;
							}

							Rtype rtype = new Rtype(tl.opCode, rs, rt, rd, tl.funcField, in.lineno() - numDefs -1);
							instrs.add(rtype);
						}

						else if ( tl.opCode.equals("001") || tl.opCode.equals("010") )
						{
							// 001 = lw
							// 010 = sw

							currentByte += 2;

							boolean negative = false;

							int imm;
							String immediate = "";

							type = in.nextToken();
							r1 = regLookup( in.sval );

							type = in.nextToken();
							tempChar = (char) type;

							if ( tempChar != ',' )
							{
								System.out.print("Error - syntax error in line " + in.lineno() + ".");
								System.out.println("Missing \',\'");
								System.exit(1);
							}

							type = in.nextToken();

							if ( type == number )
							{
								imm = (int) in.nval;
								immediate = "" + imm;
							}

							else
								immediate = in.sval;

							type = in.nextToken();
							tempChar = (char) type;

							if ( tempChar != '(' )
							{
								System.out.print("Error - syntax error in line " + in.lineno() + ".");
								System.out.println("Missing \'(\'");
								System.exit(1);
							}

							type = in.nextToken();
							r2 = regLookup( in.sval );

							type = in.nextToken();
							tempChar = (char) type;

							if ( tempChar != ')' )
							{
								System.out.print("Error - syntax error in line " + in.lineno() + ".");
								System.out.println("Missing \')\'");
								System.exit(1);
							}

							Itype itype = new Itype( tl.opCode, r2, r1, immediate, in.lineno(), currentByte );

							instrs.add(itype);
						}

						else if ( tl.opCode.equals("011") || tl.opCode.equals("100") )
						{
							currentByte += 2;

							int immediate;
							String imm = "";

							// addi or beq
							type = in.nextToken();
							r1 = regLookup( in.sval );

							type = in.nextToken();
							tempChar = (char) type;

							if ( tempChar != ',' )
							{
								System.out.print("Error - syntax error in line " + in.lineno() + ".");
								System.out.println("Missing \',\'");
								System.exit(1);
							}

							type = in.nextToken();
							r2 = regLookup( in.sval );

							type = in.nextToken();

							if ( tempChar != ',' )
							{
								System.out.println("Error - syntax error in line " + in.lineno() + ".");
								System.out.println("Missing \',\'");
								System.exit(1);
							}

							type = in.nextToken();
							if ( type == number )
							{
								immediate = (int) in.nval;
								imm = "" + immediate;
							}

							else
								imm = in.sval;

							if( tl.opCode.equals("011") )
							{
								rs = r2;
								rt = r1;
							}

							else
							{
								rs = r1;
								rt = r2;

								//System.out.println("line no is " + in.lineno());
							}

							Itype itype = new Itype( tl.opCode, rs, rt, imm, in.lineno() - numDefs - 1, currentByte);
							instrs.add(itype);
						}

						else if ( tl.type == 'j' )
						{
							currentByte += 2;

							// j-type
							String target = "";

							if( currentToken.equals("jr") )
								target = "0000000000001";

							else if( currentToken.equals("hlt") )
								target = "0000000000000";

							else if( currentToken.equals("j") || currentToken.equals("jal") )
							{
								int targetNum;

								type = in.nextToken();

								if ( type == number )
								{
									targetNum = (int) in.nval;
									target = targetNum + "";
								}

								else
									target = in.sval;

							}

							Jtype jtype = new Jtype( tl.opCode, target, in.lineno() - numDefs - 1 );
							instrs.add(jtype);
						}

						else if ( tl.opCode.equals("label") )
						{
							int labelLocation = currentByte + 2;

							// we better have a label, if it was not a directive nor an instruction

							type = in.nextToken();
							tempChar = (char) type;

							if( tempChar != ':' )
							{
								System.out.println("Error - invalid token in line " + in.lineno() );
								System.out.println("\':\' expected after label");
								System.exit(1);
							}

							Define label = new Define( currentToken, labelLocation);
							labelLookup.add(label);


						}// end else if ( tl.opCode.equals("label") )

					}// end else

				}// end while

			}// end try

			catch( IOException IOE )
			{

			}

		}

		public void translate()
		{
			Type t;

			for ( int i=0; i<instrs.size(); i++)
			{
				( (Type) instrs.get(i) ).toHex();
			}
		}

		public String regLookup( String reg )
		{
			String regNumber = "";

			if ( reg == null || reg.charAt(0) != 'r' )
			{
				System.out.println("Error - invalid register number on line " + in.lineno() + ".");
				System.out.println("Offending token: " + reg);
				System.exit(1);
			}

			if ( reg.equals("r0") )
				regNumber = "000";

			else if ( reg.equals("r1") )
				regNumber = "001";

			else if ( reg.equals("r2") )
				regNumber = "010";

			else if ( reg.equals("r3") )
				regNumber = "011";

			else if ( reg.equals("r4") )
				regNumber = "100";

			else if ( reg.equals("r5") )
				regNumber = "101";

			else if ( reg.equals("r6") )
				regNumber = "110";

			else if ( reg.equals("r7") )
				regNumber = "111";

			else
			{
				System.out.println("Error - invalid register number on line " + in.lineno() + ".");
				System.out.println("Offending token: " + reg);
				System.exit(1);
			}

			return regNumber;
		}
	}

	private static class Type
	{
		public  String target;
		public  String op;
		public 	String rs;
		public 	String rt;
		public 	String imm;
		public	String rd;
		public 	String funct;
		public  int line;

		public Type()
		{}

		public void toHex() {}

		public String symbolLookup ( String symbol )
		{
			int val;
			String valString  = "";
			Define d;

			for ( int i=0; i<labelLookup.size(); i++ )
			{
				d = (Define) labelLookup.get(i);

				if( d.name.equals(symbol) )
				{
					val = d.value;
					valString = "" + val;
					break;
				}
			}

			return valString;
		}

		public String adjustLength( String bitStr, int targetSize )
		{
			while ( bitStr.length() < targetSize )
				bitStr = "0" + bitStr;

			if ( bitStr.length() > targetSize )
				bitStr = bitStr.substring( bitStr.length() - targetSize );

			return bitStr;
		}

		public void binToHex( String bin )
		{
			try
			{
				String hexStr = Integer.toHexString( Integer.parseInt(bin, 2) );
				hexStr = adjustLength(hexStr, 4);

				for (int i=hexStr.length()-1; i>=0; i--)
				{
					out.write( hexStr.charAt(i) );
				}

				out.flush();
			}
			catch(IOException IOE)
			{}
		}
	}

	private static class Jtype extends Type
	{
		public Jtype()
		{	}

		public Jtype( String operation, String theTarget, int lineNum )
		{
			target = theTarget;
			op	   = operation;
			line   = lineNum;
		}

		public void toHex()
		{
			try
			{

				String tempStr = "" ;
				char tempChar = target.charAt(0);

				if( ! (Character.isDigit(tempChar)) )
				{
					tempStr = symbolLookup(target);

					if ( tempStr.equals("") )
					{
						System.out.println("Error - unresolved symbol in line " + line);
						System.exit(1);
					}

					target = tempStr;
				}

				int intVal = Integer.valueOf(target).intValue();

				target = Integer.toBinaryString(intVal);
				target = adjustLength(target, 13);

				binToHex(op+target);

				if (debug)
				out.write( "\tJtype: " + op + " " + target + "\n\n");
				out.flush();
			}

			catch ( IOException IOE )
			{

			}
		}
	}

	private static class Itype extends Type
	{
		private int byt;

		public Itype(){}

		public Itype( String operation, String sReg, String tReg, String immediate, int lineNum, int byteNum )
		{
			op 	= operation;
			rs	= sReg;
			rt	= tReg;
			imm	= immediate;
			line= lineNum;
			byt = byteNum;
		}

		public void toHex()
		{
			try
			{
				String tempStr = "" ;
				char tempChar = imm.charAt(0);

				if( ! (Character.isDigit(tempChar)) && tempChar != '-' )
				{
					tempStr = symbolLookup(imm);

					if ( tempStr.equals("") )
					{
						System.out.println("Error - unresolved symbol in line " + line);
						System.exit(1);
					}

					if ( op.equals("100") )
					{
						int theVal = Integer.valueOf(tempStr).intValue();
						theVal = theVal - (byt + 2);
						tempStr = "" + theVal;
					}

					imm = tempStr;
				}

				int intVal = Integer.valueOf(imm).intValue();

				imm = Integer.toBinaryString(intVal);
				imm = adjustLength(imm, 7);

				binToHex( op + rs + rt + imm );

				if (debug)
				out.write( "\tItype: " + op + " " + rs + " " + rt + " " + imm + "\n\n");
				out.flush();
			}

			catch ( IOException IOE )
			{

			}
		}
	}

	private static class Rtype extends Type
	{
		public Rtype(){}

		public Rtype( String operation, String sReg, String tReg, String dReg, String function, int lineNum )
		{
			op 	  = operation;
			rs	  = sReg;
			rt	  = tReg;
			rd	  = dReg;
			funct = function;
			line  = lineNum;
		}

		public void toHex()
		{
			try
			{
				binToHex( op + rs + rt + rd + funct );

				if (debug)
				out.write( "\tRtype: " + op + " " + rs + " " + rt + " " + rd + " " + funct + "\n\n");
				out.flush();
			}

			catch ( IOException IOE )
			{

			}
		}

	}/**/

}