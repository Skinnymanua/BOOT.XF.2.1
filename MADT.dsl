[000h 0000   4]                    Signature : "APIC" [Multiple APIC Description Table]
[004h 0004   4]                 Table Length : 00000204
[008h 0008   1]                     Revision : 03
[009h 0009   1]                     Checksum : 00
[00Ah 0010   6]                       Oem ID : "QCOM  "
[010h 0016   8]                 Oem Table ID : "SDM710  "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "INTL"
[020h 0032   4]        Asl Compiler Revision : 20200110

[024h 0036   4]           Local Interrupt Controller Address : 00000000
[028h 0040   4]                        Flags (decoded below) : 00000000

[02Ch 0044   1]                Subtable Type : 0C [GIC Distributor]
[02Dh 0045   1]                       Length : 18
[02Eh 0046   2]                     Reserved : 0000
[030h 0048   4]                GIC ID : 00000000
[034h 0052   8]         Physical Base Address : 0000000017A00000
[03Ch 0060   4]       System Vector Base : 00000000
[040h 0064   1]                  GIC Version : 03
[041h 0065   3]                     Reserved : 000000

[044h 0068   1]                Subtable Type : 0E [GIC Redistributor]
[045h 0069   1]                       Length : 12
[046h 0070   2]                     Reserved : 0000
[048h 0072   8]        Discovery Range Base Address : 0000000017A60000
[050h 0080   4]               Discovery Range Length : 00100000

// GICC for Core 0 (Silver)
[054h 0084   1]                Subtable Type : 0B [GIC CPU Interface]
[055h 0085   1]                       Length : 50
[057h 0087   4]                 CPU Interface Number : 00000000
[05Bh 0091   4]                        ACPI Processor ID : 00000000
[05Fh 0095   4]                            Flags : 00000001
[063h 0099   4]                         Parking Protocol : 00000000
[067h 0103   4]                      Performance GSI : 00000017
[06Bh 0107   8]                Parked Address : 0000000000000000
[073h 0115   8]              Physical Base Address : 0000000017A00000
[07Bh 0123   8]          GICV Physical Base Address : 0000000000000000
[083h 0131   8]          GICH Physical Base Address : 0000000000000000
[08Bh 0139   4]                 VGIC Maintenance interrupt : 00000019
[08Fh 0143   8]              GICR Base Address : 0000000017A60000
[097h 0151   8]                   MPIDR : 0000000000000000

// ... (Repeat GICC entries for 0x100, 0x200, 0x300, 0x400, 0x500) ...

// GICC for Core 6 (Gold)
[1E4h 0484   1]                Subtable Type : 0B [GIC CPU Interface]
[1E5h 0485   1]                       Length : 50
[1E7h 0487   4]                 CPU Interface Number : 00000006
[1EBh 0491   4]                        ACPI Processor ID : 00000006
[1EFh 0495   4]                            Flags : 00000001
[1F3h 0499   4]                         Parking Protocol : 00000000
[1F7h 0503   4]                      Performance GSI : 00000017
[1FBh 0507   8]                Parked Address : 0000000000000000
[203h 0515   8]              Physical Base Address : 0000000017A00000
[20Bh 0523   8]          GICV Physical Base Address : 0000000000000000
[213h 0531   8]          GICH Physical Base Address : 0000000000000000
[21Bh 0539   4]                 VGIC Maintenance interrupt : 00000019
[21Fh 0543   8]              GICR Base Address : 0000000017A60000
[227h 0551   8]                   MPIDR : 0000000000000600

// GICC for Core 7 (Gold)
[22Fh 0559   1]                Subtable Type : 0B [GIC CPU Interface]
...
[272h 0626   8]                   MPIDR : 0000000000000700
