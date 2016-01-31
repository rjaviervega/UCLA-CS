/* Roberto Javier Vega -- SID: 003-110-717 */

import java.io.*;
import java.net.*;
import java.util.*; 
import java.util.regex.*;

public class GetRURLs {

	private static String rootURL;
	private static String strURL;
	private static int Depth = 1;
	private static int Step;
	private static int MaxDepth = 5;
	
	static Vector vectorToSearch;
	static Vector vectorSearched;
	static Vector vectorPrinted;
	static Vector vectorNoConnect;
	static Vector vectorNextSearch;
	static Vector vectorLowPrinted;

	public static void main (String argv[]) {

        //Check for valid number or arguments
        if ( ( argv.length == 0 ) || ( argv.length > 2 ) ) {
                System.out.print("usage: GetRURLs RootURL MaxDepth.\n");
                System.exit(1);
        }

		//Get rootURL, set maxDepth = 1
		if ( argv.length == 1 ) rootURL = argv[0];

		//Get rootURL and maxDepth
		if ( argv.length == 2 ) {
			try {
				rootURL = argv[0];
				Depth = Integer.parseInt(argv[1]);
				if ( (Depth > 4) || (Depth < 0) ) {
					System.out.println("Error: depth out of range");
					System.exit(1);
				}
			} 
			catch ( Exception e ) {
				System.out.println("Error: invalid parameter: " + argv[1]);
				System.exit(1);
			}
		}
		
		//Check for valid rootURL
		String rootdomain;
		try {

			for ( int i = 0; i < rootURL.length(); i++ ) 
				if ((rootURL.charAt(i) == '\'')|| (rootURL.charAt(i) == ';') )
					throw new Exception();

			//Check for IPv4 values
                   	String lowerCaseContent = rootURL.toLowerCase();
                        int index = 0;
                        index = lowerCaseContent.indexOf("http://", index);
                        String remaining = rootURL.substring(index);
                        StringTokenizer st2 = new StringTokenizer(remaining, "://");
                        String auth = st2.nextToken();
                        auth = st2.nextToken();                

        		//Create a pattern to match "."
		        Pattern p = Pattern.compile("[.\\s]+");

  		        //Split input with the pattern
    		    	String[] result = p.split(auth);

			//Check for last value
			rootdomain = result[result.length -1];
			
			if (rootdomain.equals("")) 
				rootdomain = result[result.length -2];

                      if (rootdomain.charAt(0) == ':') {
                              rootdomain = result[result.length -2];
                      }


			//Clean rootdomain from :
                        StringTokenizer st = new StringTokenizer(rootdomain, ":");
                        rootdomain = st.nextToken();

			//Test for IPv4
			try {
				//If root domain is of numeric value
				int digit4 =  Integer.valueOf(rootdomain).intValue();

				if ( !(result.length == 4) || ( digit4 > 255) ) {
		                       System.out.println("GetRURLs: Error root is not an RURL (0)");
                		       System.exit(1);
				}

				try {
					int digit1 = Integer.valueOf(result[0]).intValue();
					int digit2 = Integer.valueOf(result[1]).intValue();
					int digit3 = Integer.valueOf(result[2]).intValue();
				
					if ( (digit1 > 255) || (digit2 > 255) || (digit3> 255) ) {
			                       System.out.println("GetRURLs: Error root is not an RURL (1)");
			                       System.exit(1);
					}

                                        if ( (digit1 < 0) || (digit2 < 0) || (digit3 < 0) || (digit4 < 0) ) {
                                               System.out.println("GetRURLs: Error root is not an RURL (2)");
                                               System.exit(1);
                                        }
				} catch (Exception e) {
		                       System.out.println("GetRURLs: Error root is not an RURL (3)");
                		       System.exit(1);
				}


			} catch (Exception e) {

				//In case the rootdomain is not a number
				//it must not contain numbers as characters

				for ( int i = 0; i < rootdomain.length(); i++ ) {
					if ( (rootdomain.charAt(i) >= '0') && (rootdomain.charAt(i) <= '9') ) {
	                                       System.out.println("GetRURLs: Error root is not an RURL (4)");
        	                               System.exit(1);
					}
				}
			}
						
		}
		catch (Exception e) {
                       System.out.println("GetRURLs: Error root is not an RURL (5) ");
                       System.exit(1);
		}

		//Java Tests
		URL url;
		try {
			url = new URL (rootURL);
			
			if ( url.getProtocol().compareTo("http") != 0 ) {
                                System.out.println("GetRURLs: Error root is not an RURL (6)");
                                System.exit(1);
			}
				
			String references = url.getRef();
			String parameters = url.getQuery();
			String userinfo   = url.getUserInfo();
			String auth	  = url.getAuthority();

			if ( (references != null) || (parameters != null) || 
			     (userinfo != null) || (auth == null) ) { 
	                        System.out.println("GetRURLs: Error root is not an RURL (7)");
       		                System.exit(1);
			}
				
		} catch ( Exception e ) { }




		// initialize search data structures
		vectorToSearch = new Vector();
		vectorSearched = new Vector();
		vectorPrinted = new Vector();
		vectorNextSearch  = new Vector();
		vectorLowPrinted  = new Vector();
		vectorNoConnect   = new Vector();

		vectorToSearch.add(rootURL);

		//Read Step number of times the recursive web serach
		Step = 1;
		while ( Step <= Depth ) {

			while ((vectorToSearch.size() > 0)) {
				
				strURL = (String) vectorToSearch.elementAt(0);
				try 
				{		
					url = new URL(strURL);
	        		        InputStream urlStream = url.openStream();            
	           		        InputStreamReader urlSR = new InputStreamReader(urlStream);        

					//Read the file
					byte b[] = new byte[1024];
					int numRead = urlStream.read(b);
					String content = new String(b, 0, numRead);
					while (numRead != -1) {
					    numRead = urlStream.read(b);
					    if (numRead != -1) {
							String newContent = new String(b, 0, numRead);
							content += newContent;
					    }
					}
					urlStream.close();

					//filter from content all the URLS
					String lowerCaseContent = content.toLowerCase();
					int index = 0;
					while ((index = lowerCaseContent.indexOf("http://", index)) != -1)
					{
					    String remaining = content.substring(index);
					    StringTokenizer st = new StringTokenizer(remaining, "\t\n\r\">#\'^~`*<; @%?,[]{}+!&=$");   
					    String strLink = st.nextToken();

					    try { 
					    	URL testRURL = new URL(strLink);
					    } 
					    catch (MalformedURLException e) {
						index++;
						continue;
					    }

					    if ( vectorNextSearch.contains(strLink) == false ) 
					    	 vectorNextSearch.addElement(strLink);
					    	 	
//					    if ( (vectorPrinted.contains(strLink) == false) && !(strLink.equals( "http://")) ) {
//						 && (vectorLowPrinted.contains(strLink.toLowerCase()) == false )  ) {
					    if ( (vectorPrinted.contains(strLink) == false) ){
						System.out.println(strLink);
			   			vectorPrinted.addElement(strLink);
						vectorLowPrinted.addElement(strLink.toLowerCase());
						}
			    		    index++;
					}
			
				} catch (IOException e) {
					//System.out.println("cannot retrieve " + strURL);
					vectorNoConnect.addElement(strURL);
	    			}
	    	
	    		vectorToSearch.removeElementAt(0);
	    		vectorSearched.addElement(strURL);	
	    	} //while into one url at a time
	    	
	    	vectorToSearch.removeAllElements();
	    	for ( int i = 0; i < vectorNextSearch.size(); i++) {
	    		vectorToSearch.addElement(vectorNextSearch.elementAt(i));
	    	}
	    	vectorNextSearch.removeAllElements();
	    	Step++;
	    } //while depth 				

		if  (vectorPrinted.contains(rootURL) == false) 
			System.out.println(rootURL);

		for (int i = 0; i < vectorNoConnect.size(); i++) {

			String temp = (String) vectorNoConnect.elementAt(i);
			System.out.println("cannot retrieve "+ temp);
		}

		System.exit(System.out.checkError()?1:0);
	}
}
