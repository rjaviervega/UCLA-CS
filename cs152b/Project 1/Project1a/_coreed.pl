my $_CoregenFin = 'coregen.fin';
if ( -e "$_CoregenFin" ) {
print "Deleting fin file\n";
unlink $_CoregenFin;
}
my $_CoregenCrp = "_coregen.crp";
open  CRP, ">$_CoregenCrp";
if ( ! -e "coregen.prj" ) {
print CRP "NEWPROJECT e:/hingkei/152bs04/project1a\n";
}
print CRP "SETPROJECT e:/hingkei/152bs04/project1a\n";
print CRP "SET BusFormat = BusFormatAngleBracket\n";
print CRP "SET XilinxFamily = Virtex\n";
print CRP "SET FlowVendor = Foundation_iSE\n";
print CRP "SET DesignFlow = Vhdl\n";
print CRP "SET SimulationOutputProducts = Verilog VHDL\n";
print CRP "SET LockProjectProps = false\n";
close CRP;
if ( $^O eq 'MSWin32' ) {
my $_CoregenExe = 'wincoregen.exe coregen.bat';
my $_CoregenCmd = "C:/Xilinx/bin/nt/$_CoregenExe -b e:/hingkei/152bs04/project1a/$_CoregenCrp";
$_CoregenCmd =~ s/\//\\/g;
system $_CoregenCmd;
$_CoregenCmd = "C:/Xilinx/bin/nt/$_CoregenExe -p e:/hingkei/152bs04/project1a -q e:/hingkei/152bs04/project1a";
$_CoregenCmd =~ s/\//\\/g;
system $_CoregenCmd;
} else {
my $_CoregenExe = 'coregen';
system "C:/Xilinx/bin/nt/$_CoregenExe -b e:/hingkei/152bs04/project1a/$_CoregenCrp";
system "C:/Xilinx/bin/nt/$_CoregenExe -p e:/hingkei/152bs04/project1a -q e:/hingkei/152bs04/project1a";
}
