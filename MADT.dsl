[000h 0000   4]                    Signature : "APIC"
[004h 0004   4]                 Table Length : 00000108
[008h 0008   1]                     Revision : 03
[009h 0009   1]                     Checksum : 00
[00Ah 0010   6]                       Oem ID : "QCOM  "
[010h 0016   8]                 Oem Table ID : "SDM710  "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20200110

// GIC Distributor Entry
[024h 0036   1]                Subtable Type : 0C [GIC Distributor]
[025h 0037   1]                       Length : 18
[028h 0040   4]              GIC Distributor ID : 00000000
[02Ch 0044   8]              Base Address : 0000000017A00000
[034h 0052   4]                Interrupt Base : 00000000
[038h 0056   1]                  GIC Version : 03

// GIC Redistributor Entry (Maps the range for all 8 cores)
[039h 0057   1]                Subtable Type : 0E [GIC Redistributor]
[03Ah 0058   1]                       Length : 12
[03Ch 0060   8]     Discovery Range Base Address : 0000000017A60000
[044h 0068   4]           Discovery Range Length : 00100000 

// Note: You must also include 8 "GIC CPU Interface" (Type 0x0B) subtables 
// here, one for each core (0-7), using their respective MPIDRs.
