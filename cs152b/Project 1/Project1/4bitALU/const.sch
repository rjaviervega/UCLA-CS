VERSION 5
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName virtex
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    End ATTR
    BEGIN NETLIST
        SIGNAL one3
        SIGNAL one2
        SIGNAL one1
        SIGNAL one0
        PORT Input one3
        PORT Input one2
        PORT Input one1
        PORT Input one0
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2001 2 2 12 24 11
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCK XLXI_4 vcc
            PIN P one3
        END BLOCK
        BEGIN BLOCK XLXI_5 vcc
            PIN P one2
        END BLOCK
        BEGIN BLOCK XLXI_6 vcc
            PIN P one1
        END BLOCK
        BEGIN BLOCK XLXI_7 vcc
            PIN P one0
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 5440 3520
        INSTANCE XLXI_4 3536 1792 R270
        INSTANCE XLXI_5 3536 1872 R270
        INSTANCE XLXI_6 3536 1936 R270
        INSTANCE XLXI_7 3536 2016 R270
        BEGIN BRANCH one3
            WIRE 3536 1728 3600 1728
        END BRANCH
        BEGIN BRANCH one2
            WIRE 3536 1808 3600 1808
        END BRANCH
        BEGIN BRANCH one1
            WIRE 3536 1872 3600 1872
        END BRANCH
        BEGIN BRANCH one0
            WIRE 3536 1952 3600 1952
        END BRANCH
        IOMARKER 3600 1728 one3
        IOMARKER 3600 1808 one2
        IOMARKER 3600 1872 one1
        IOMARKER 3600 1952 one0
    END SHEET
END SCHEMATIC
