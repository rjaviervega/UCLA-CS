if (!(-e "c:/Modeltech_xe/win32xoem/modelsim.exe")) {
if ($^O eq 'MSWin32')   {
print "\n\nERROR:\n";
print "  Model Technology\'s ModelSim executable cannot be found by Project Navigator.\n";
print "  Please go to the 'Edit' menu, select 'Preferences' and then select the 'Partner Tools'\n";
print "  tab. Using this dialog select the ModelSim executable that you wish to use for\n";
print "  simulation. Then re-start Project Navigator and try this process again.\n\n";
} else {
print "\n\nERROR:\n";
print "  Model Technology\'s vsim executable cannot be found by Project Navigator.\n";
print "  The PATH environment variable should include the directory that contains\n";
print "  the vsim executable to be used for simulation. Please add this directory to\n";
print "  your PATH environment variable. Then re-start Project Navigator and try\n";
print "  this process again.