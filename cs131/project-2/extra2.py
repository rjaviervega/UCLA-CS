#Written by: R. Javier Vega

import sys
import string
import urllib

#Compare the URLs and return an html page with the URLs found in old, new and both by parsing href tags.
def CompareLinks(old, new):

	page = ""
	oldrurls = []
	newrurls = []
	bothrurls = []

	#Get RURLs lists
	oldrurls = GetLinks (old)
	newrurls = GetLinks (new)

        #Check if there has been no error codes
        try:
          error_c = int(oldrurls[0])
          error_c = int(newrurls[0])
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
	page = "<html><head><title>CS131 Project #2 Compare URLs Extra Creadit #2</title></head>"
	page = page + "<h2>CS131 Project #2 Compare Href Results</h2>"

	page = page + "<p><b>(20 points)</b> -Parse any HTML resources as HTML "+ \
	"instead of as text, and report URIs" + \
	"found, not RURLs. For example, if an HTML resource contains an A element that has an "+ \
	"HREF attribute, report the" + \
 	"contents of that attribute.\n<br><b>(10 points)</b> -Return the urls as hyperlinks."+ \
	"</p>"

	page = page + "<b>Old URI Resource:</b><br>" + old + "<br>"
	page = page + "<table border=1><th>Num</th><th>Old URIs Found</th>"
	count = 0
	for rurl in oldrurls: 
	  if (rurl not in newrurls) or (rurl == "ERROR"):
	    count = count + 1
	    page = page + "<tr>"+ "<td align=center>"+ str(count) + "</td>" + "<td><a href='"+rurl+"'>"+rurl + "</td></tr>"
	page = page + "</table><br>"

        page = page + "<b>New URI Resource:</b><br> " + new+ "<br>"
	count = 0
        page = page + "<table border=1><th>Num</th><th>New URIs Found</th>"
	for rurl in newrurls: 
	  if (rurl not in oldrurls) or (rurl == "ERROR"):
	    count = count + 1
	    page = page + "<tr>" +"<td align=center>" + str(count) +"</td>" +"<td><a href="+rurl+">" + rurl +"</a></td></tr>"
	page = page + "</table><br>"

        page = page + "<b>Shared URL Resources:</b><br>"
        page = page + "<table border=1><th>Num</th><th>Href URIs Found</th>"
	count = 0
	for rurl in bothrurls: 
	  count = count + 1
	  page = page + "<tr>"+"<td align=center>"+str(count)+"</td><td><a href='" + rurl + "'>"+ rurl + "</a></td></tr>"
        page = page + "</table>"

	return  page + "</body></html>"




#Get RURLs from a URL resource interpreted as test/plain
def GetLinks ( url ):

	sepchar = ("'", '"', "<", ">")

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
#	  index = string.find(textLower, "<a href=") # for old version only displaying links
#	  remember that changes need to be done at the end of this while loop too

	  index = string.find(textLower, "href=")

	  while ( index != -1 ):

	    index = index + 4

	    if ( textLower[index+1] == "'") or (textLower[index+1] == '"'):
	      index = index + 2
	
	    remaining = textSource[index:]
               
            #Get end of link
#	    end = string.find(remaining, "</a>")
#	    end = end + 4
#	    scan = end

            #Scan until end of string for sep chars
            scan = 0
            while (scan < len(remaining)):
              if (remaining[scan] in sepchar): break
              scan = scan + 1
	    #Store the link
            strLink = remaining[:scan]

            #Add to HREFs List
            if ( strLink not in RURLs ):
              RURLs.insert(0, strLink)
      
            itemp = string.find(textLower[index+scan:], "href=")
            if ( itemp != -1 ): index = string.find(textLower[index+scan:], "href=") + index + scan
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
          strURL = strURL
            
             
	return RURLs

        

