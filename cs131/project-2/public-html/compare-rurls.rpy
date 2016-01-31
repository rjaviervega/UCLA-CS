#Implementation of Project #2
#R. Javier Vega 003-110-717	

import cmpurls
from twisted.web import resource

#Class to connect twisted
class CompareRURLs(resource.Resource):
    def render(self, request):
	try:
	  old = request.args['old'][0]
	  new = request.args['new'][0]
	except:
	  old = ""
	  new = ""
	page = cmpurls.doCompare(old, new)
	request.setHeader('Content-Type','text/plain')
        return page

#Connection with twisted class
resource = CompareRURLs()
