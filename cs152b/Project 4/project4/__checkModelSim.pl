Creating TCL Process
Cleaning Up Project
deleting file(s): __projnav.log
deleting file(s): __filesAllClean_exewrap.rsp
The tcl interpreter reported the following error when executing the script C:/Xilinx/data/projnav/_filesAllClean.tcl
called "processFiles" with too many arguments
    while executing
"processFiles $_schematicFiles $_edifFiles"
    ("foreach" body line 48)
    invoked from within
"foreach _File [split $_Files] {
               set _RootName  [file rootname $_File]
               set _Extension [file extension $_File]
           ..."
    ("cleanup" arm line 6)
    invoked from within
"switch -exact $_Type {
         cleanup {
            if [regexp {\*} $_Files junk] {
               catch {glob -nocomplain $_Files} _FileList
      ..."
    ("foreach" body line 4)
    invoked from within
"foreach _line [split [read $_RspFileHandle] \n] {
      set _Type  [lindex 