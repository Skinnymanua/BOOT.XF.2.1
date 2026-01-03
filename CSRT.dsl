[000h 0000 004]                    Signature : "CSRT"
[004h 0004 004]                 Table Length : 000000CC
[008h 0008 001]                     Revision : 00
[009h 0009 001]                     Checksum : 00
[00Ah 0010 006]                        OEMID : "QCOM  "
[010h 0016 008]                 OEM Table ID : "SDM710  "
[018h 0024 004]                 OEM Revision : 00000001
[01Ch 0028 004]                   Creator ID : "MSFT"
[020h 0032 004]             Creator Revision : 00000001

// --- Resource Group 0: SMP2P Modem ---
[024h 0036 004]                 Group Length : 00000034
[028h 0040 004]                    Vendor ID : 00001022
[02Ch 0044 004]                 Subvendor ID : 00000000
[030h 0048 002]                    Device ID : 0670
[032h 0050 002]                 Subdevice ID : 0000
[034h 0052 002]                  Revision ID : 0001
[036h 0054 002]                     Reserved : 0000
[038h 0056 004]           Shared Info Length : 00000000
// Resource Descriptor: Interrupt (Modem)
[03Ch 0060 004]            Descriptor Length : 00000018
[040h 0064 002]              Descriptor Type : 0001
[042h 0066 002]           Descriptor Subtype : 0001
[044h 0068 004]                  Resource ID : 00000001
[048h 0072 004]                Register Base : 1799000C
[04Ch 0076 004]             Interrupt Vector : 000001C3

// --- Resource Group 1: GENI UART 0 ---
[058h 0088 004]                 Group Length : 00000034
[05Ch 0092 004]                    Vendor ID : 00001022
[060h 0096 004]                 Subvendor ID : 00000000
[064h 0100 002]                    Device ID : 0670
[066h 0102 002]                 Subdevice ID : 0000
[068h 0104 002]                  Revision ID : 0001
[06Ah 0106 002]                     Reserved : 0000
[06Ch 0108 004]           Shared Info Length : 00000000
// Resource Descriptor: MMIO/Interrupt (UART)
[070h 0112 004]            Descriptor Length : 00000018
[074h 0116 002]              Descriptor Type : 0002
[076h 0118 002]           Descriptor Subtype : 0001
[078h 0120 004]                  Resource ID : 00000001
[07Ch 0124 004]                Register Base : 00898000
[080h 0128 004]             Interrupt Vector : 0000025F

// --- Resource Group 2: GENI I2C 0 ---
[08Ch 0140 004]                 Group Length : 00000034
[090h 0144 004]                    Vendor ID : 00001022
[094h 0148 004]                 Subvendor ID : 00000000
[098h 0152 002]                    Device ID : 0670
[09Ah 0154 002]                 Subdevice ID : 0000
[09Ch 0156 002]                  Revision ID : 0001
[09Eh 0158 002]                     Reserved : 0000
[0A0h 0160 004]           Shared Info Length : 00000000
// Resource Descriptor: MMIO/Interrupt (I2C)
[0A4h 0164 004]            Descriptor Length : 00000018
[0A8h 0168 002]              Descriptor Type : 0002
[0AAh 0170 002]           Descriptor Subtype : 0001
[0ACh 0172 004]                  Resource ID : 00000001
[0B0h 0176 004]                Register Base : 00880000
[0B4h 0180 004]             Interrupt Vector : 00000259
