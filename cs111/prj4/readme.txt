Eddie Esquivel SID# 103-016-644
Javier Vega SID#

Description:

This program implements an undelete in either a fat12 or a fat16 
image. It accomplishes this by recursively scanning the root 
directory, any subdirectories and ultimately any free sectors in
the data area. When the recursive function sees either a file or a
directory with 0x05 at its beginning it calls RecoverFunction and 
depending on which flags are set it does the appropriate action.
We created very modular and easy to read code because we had 
a slew of helper functions. For example getClusterValue would 
return the contents of a specified entry into the FAT table. readCluster
and readSector would read either an entire sector or an entire cluster 
into the specified buffer from the file desciptor passed into it. 
GetBootdata and DisplayBootData would read the values from the 
boot sector into a boot struct and would then display the 
values respectively.

What Works:

We tested everything and everything appears to work:

-Recover files scanning all subdirs found in the root dirs.
-Create the appropiate directories
-Recover the long file names
-Create files with exact file sizes from the fat
-Scan all unallocated sectors for possible deleted files
-Options for ussing: --skip, --zero, --nobad, --altfat
-Create file names with N_ if similar file was found
-Not recovering twice same file entries
-...
-pretty much everything described in the project.

We check most of our results directly from the values obtained using 
HexEdit on the fat image file. So with our testing everyting appears
to be working fine.


To Compile the program we provided a Make file:
----------
all: recover

recover: recover.c recover.h
	gcc -o recover recover.c -Wall

clean:
	rm recover
----------
