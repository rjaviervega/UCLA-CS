import sys
import string
import urllib

#Compare the RURLs and return an html page with raw RURLs
def doCompare(old, new):

	page = ""
	oldrurls = []
	newrurls = []
	bothrurls = []

	#Get RURLs lists
	oldrurls = GetRawRURLs (old)
	newrurls = GetRawRURLs (new)

	#Check if there has been no error codes
	error = 0
	try:
	  error_c = int(oldrurls[0])
	  error_c = int(newrurls[0])
	  error = 1
	except:
	  if ( len(oldrurls) > 0 ) and ( len(newrurls) > 0 ):
	    if ( oldrurls[0] != "ERROR" ) or ( newrurls[0] != "ERROR" ):
	      #Create RURLs that are in both
	      for allrurl in oldrurls: 
	        if ( allrurl in newrurls ): bothrurls.insert(0, allrurl)

        #Sort output   
        oldrurls.sort()
        newrurls.sort()
	bothrurls.sort()	

	#start html format
	for rurl in oldrurls: 
	  if (rurl not in newrurls) or (rurl == "ERROR") or (error == 1): page = page + rurl + "\n"

	page = page + "\n"

	for rurl in newrurls: 
	  if (rurl not in oldrurls) or (rurl == "ERROR") or (error == 1): page = page + rurl + "\n"

	page = page + "\n"

	for rurl in bothrurls: 
	  page = page + rurl +"\n"

	#To get rid of last new line char
	page = page[:-1]

	return  page 




#Get RURLs from a URL resource interpreted as test/plain
def GetRawRURLs ( url ):

	#Set of characters that split an URL from a RURL
	sepchar = ("\t", "\n", "\r", "\"", ">", "#", "\'", "^", "~", ";", "`",\
		   "<", " ", "%", "&", "+", "?", "=", "@", ")", "]", "(", "," )
	#List of RURLS found
	RURLs = [] 	

	strURL = url
	
	try:
	  opener = urllib.URLopener()
	  htmlfile = opener.open(strURL)
	  textSource = htmlfile.read()
	  textLower = textSource.lower()
	  htmlfile.close()
          
	  #Search for the RURLS in the textSource
	  index = string.find(textLower, "http://")
	  while ( index != -1 ):
	    remaining = textSource[index:]
               
            #Scan until end of string for sep chars
            scan = 0
            while (scan < len(remaining)):
              if (remaining[scan] in sepchar): break
              scan = scan + 1
	    #Store the link
            strLink = remaining[:scan]

            #Add to RURLS List
            if (strLink not in RURLs):
              if ( strLink[-1] == "/" ) and ( strLink[:-1] in RURLs ): 
		RURLS.remove( strLink[:-1] )

              if ( len(strLink) >= 18 ):
                if ( strLink[-10:] == "index.html"  ) and ( strLink[:-10] in RURLs ):
                  RURLs.remove( strLink[:-10] )
                if ( strLink[-11:] == "/index.html" ) and ( strLink[:-11] in RURLs ):
                  RURLs.remove( strLink[:-11] )
        
              Link1 = strLink + "/"
              Link2 = strLink + "/index.html"
              Link3 = strLink + "index.html"
        
              if ( Link1 not in RURLs ) and ( Link2 not in RURLs ) and\
                 ( Link3 not in RURLs ) and ( strLink not in RURLs ):
                RURLs.insert(0, strLink)
      
            itemp = string.find(textLower[index+scan:], "http://")
            if ( itemp != -1 ): index = string.find(textLower[index+scan:], "http://") + index + scan
            else: index = -1
        except IOError, error_code:
	  try:
	    error_c = int(error_code[1])
	    RURLs.insert(0, str(error_c))
	  except:
            RURLs.insert(0, "ERROR" )
	  return RURLs
        except:
          RURLs.insert(0, strURL + " ERROR -> " + str(Exception) )
             
	return RURLs
