/**  
 * CourseWeb specific javascript functions
 **/

/**
 * Popup Window Script
 * By JavaScript Kit (http://javascriptkit.com)
 * JavaScript tutorials and over 400+ free scripts
 *
 * Also look at:
 * http://javascript.internet.com/generators/popup-window.html
 *
 * @version 05/18/2004 - changed function to accept variables for width/height
 * @version 07/19/2004 - added regularWindow parameter
 **/
function openpopup(popurl, pwidth, pheight, regularWindow)
{
	if (pwidth == null || pwidth == 0)
		pwidth = 500;
		
	if (pheight == null || pheight == 0)
		pheight = 500;	

	// if regularWindow is set, then don't hide anything,
	if (regularWindow) {
		var parameterString = "width=" + pwidth + 
							  ",height=" + pheight +
							  "toolbar=1,scrollbars=1,location=1," + 
							  "statusbar=1,menubar=1,resizable=1";
	} else {
		var parameterString = "width=" + pwidth + 
							  ",height=" + pheight + 
							  ",scrollbars=1,resizable=1";
	}

	winpops=window.open(popurl, "", parameterString);
}

function confirmPrompt(msg, url) 
{
    if (confirm(msg)) {
        location.href = url;
    }
}
    
function redirectUrl(url) 
{
	location.href = url;
}
