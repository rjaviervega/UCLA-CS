#Roberto Javier Vega -- SID: 003-110-717

import sys
import string
import urllib

#Get arguments 
if ( (len(sys.argv) == 1) or (len(sys.argv) > 3) ):
  print "Invalid number of arguments: " + str(len(sys.argv))
  sys.exit(1)

#Check for rootURL
if (len(sys.argv) >= 2 ):
  rootURL = sys.argv[1]

#Check valid depth
if (len(sys.argv) == 3 ):
  depth = sys.argv[2]
else:
  depth = 1

#Convert depth to number
try:
  num_depth = int(depth);
  if ( (num_depth > 4) or (num_depth < 0) ):
    print "Error: Value out of range: " + depth
    sys.exit(1)
except ValueError:
  print "Invalid argument: " + depth 
  sys.exit(1)
  
#Arguments are valid
#Check for valid rootURL

#Check for '; invalid characters
badchars = ["\'", "\\", "#", "!", "@", "$", "&", ";", "=", "+", "?", ")"]
rootlen = len(rootURL)
i = 0
while i < rootlen:
  if rootURL[i] in badchars:
    print "Error: root is not an RURL (1)"
    sys.exit(1)
  i = i + 1

#Check for valid protocol prefix
rootLower = rootURL.lower()
try:
  num = string.index (rootLower[0:], "http://")
except ValueError:
  print "Error: root is not an RURL (2)"
  sys.exit(1)

#Get Authname with portnumbers
num = string.find ( rootURL[7:], "/")
if (num == -1):
  authname = rootURL[7:]
else:
  authname = rootURL[7:num+7]

#Check for valid RURL
#Strip port
num = string.find ( authname, ":")
if ( num != -1 ):
  authname = authname[:num]

#Split authname by "."
AuthNames = string.split(authname, ".")

#Check for the first char of the last element in AuthNames
if (AuthNames[len(AuthNames)-1] == ""):
  strTemp = AuthNames[len(AuthNames)-2]
else:
  strTemp = AuthNames[len(AuthNames)-1]

try:
  digit = int(strTemp)
  if ( len(AuthNames) <> 4 ):
    print "Error: root is not an RURL (3)"
    sys.exit(1)
  dig1 = int(AuthNames[0])
  dig2 = int(AuthNames[1])
  dig3 = int(AuthNames[2])
  dig4 = int(AuthNames[3])
except ValueError:
  #The first char of the last item in AuthNames can't be a digit
  if ( strTemp == "" ):
    print "Error: root is not a RURL (4)"
    sys.exit(1)
  elif (strTemp[0] >= "0" and strTemp[0] <= "9"):
    print "Error: root is not a RURL (4)"
    sys.exit(1)



#Assumed RURL is valid

#define container lists
ToSearch = []
Searched = []
Printed = []
NextSearch = []
NoConnect = []

sepchar = ("\t", "\n", "\r", "\"", ">", "#", "\'", "^", "~", ";", "`", "<", " ", "%", "&", "+", "?", "=", "@", ")", "]", "(" )

ToSearch.insert(0, rootURL)
foo = 0 #to avoid abiguties

#Start looping process
Step = 1
while ( Step <= num_depth ):
  while ( len(ToSearch) > 0 ):
    strURL = ToSearch[0]
    if (strURL in Searched):
      ToSearch.remove(strURL) 
      continue 
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

	#Scan until end of string 
	scan = 0
	while (scan < len(remaining)):
	  if (remaining[scan] in sepchar): break
	  scan = scan + 1
	#Store the link
	strLink = remaining[:scan]
	
	#Add link for next level search
	if (strLink not in NextSearch): NextSearch.insert(0, strLink)

	#Add to printed list and output it to screen
	if (strLink not in Printed):
	  if ( strLink[-1] == "/" ) and ( strLink[:-2] in Printed ):
	    Printed.remove( strLink[:-2] )
	  if ( strLink[-11:].lower() == "/index.html" ) and ( strLink[:-12] in Printed ):
	    Printed.remove( strLink[:-12] )
	  if ( strLink+"/" not in Printed ) or ( strLinl+"/index.html" not in Printed ):
	    Printed.insert(0, strLink)

	itemp = string.find(textSource[index+scan:], "http://")
	if ( itemp != -1 ): index = string.find(textLower[index+scan:], "http://") + index + scan
	else: index = -1
    except IOError:
      if ( strURL not in NoConnect ): NoConnect.insert(0, strURL)
    except :
      foo = foo #ignore if other error occur

    ToSearch.remove(strURL) 
    Searched.insert(0,strURL)

  ToSearch = [] #EmptyVector
  # Copy all elements from NextSearch to ToSearch
  for allstr in NextSearch: ToSearch.insert(0, allstr)
  NextSearch = []
  Step = Step + 1

#Print base URL if not printed allready
if (rootURL not in Printed): print rootURL

Printed.sort()
for allstr in Printed  : print allstr
for allstr in NoConnect: print "cannot retrieve " + allstr

sys.exit(0)
