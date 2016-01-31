VERSION 5
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName virtex
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    End ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL XLXN_2
        PORT Input XLXN_1
        PORT Input XLXN_2
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH XLXN_1
            WIRE 848 688 1264 688
        END BRANCH
        BEGIN BRANCH XLXN_2
            WIRE 848 944 1168 944
        END BRANCH
        IOMARKER 848 688 XLXN_1
        IOMARKER 848 944 XLXN_2
    END SHEET
END SCHEMATIC
