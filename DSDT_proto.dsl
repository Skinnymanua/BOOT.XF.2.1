DefinitionBlock ("DSDT.aml", "DSDT", 2, "QCOMM ", "SDM710  ", 0x00000001)
{
    Scope (\_SB)
    {
        // --------------------------------------------------------------------------
        // 1. Platform Global Variables
        // --------------------------------------------------------------------------
        Name (PSUB, "SIRIUS  ")      // Platform Subsystem ID
        Name (SOID, 0x0150)          // SDM710 SoC ID
        Name (STOR, 0x01)            // 1 = UFS, 0 = eMMC
        Name (SIDV, 0x00)            // Soc Revision

        // --------------------------------------------------------------------------
        // 2. CPU Cores (2x Gold, 6x Silver)
        // --------------------------------------------------------------------------
        // Silver Cluster (Efficiency)
        Device (CPU0) { Name (_HID, "ACPI0007") Name (_UID, 0x000) }
        Device (CPU1) { Name (_HID, "ACPI0007") Name (_UID, 0x100) }
        Device (CPU2) { Name (_HID, "ACPI0007") Name (_UID, 0x200) }
        Device (CPU3) { Name (_HID, "ACPI0007") Name (_UID, 0x300) }
        Device (CPU4) { Name (_HID, "ACPI0007") Name (_UID, 0x400) }
        Device (CPU5) { Name (_HID, "ACPI0007") Name (_UID, 0x500) }
        // Gold Cluster (Performance)
        Device (CPU6) { Name (_HID, "ACPI0007") Name (_UID, 0x600) }
        Device (CPU7) { Name (_HID, "ACPI0007") Name (_UID, 0x700) }

        // --------------------------------------------------------------------------
        // 3. TLMM (GPIO / Pin Controller)
        // --------------------------------------------------------------------------
        Device (GIO0)
        {
            Name (_HID, "QCOM2430") // Pin controller HID
            Name (_UID, Zero)
            Method (_CRS, 0, NotSerialized) {
                Name (RBUF, ResourceTemplate () {
                    Memory32Fixed (ReadWrite, 0x03400000, 0x00C00000)
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared) { 0xD0 }
                })
                Return (RBUF)
            }
        }

        // --------------------------------------------------------------------------
        // 4. UFS Storage (Base: 0x1DA4000)
        // --------------------------------------------------------------------------
        Device (UFS0)
        {
            Name (_HID, "QCOM24A5")
     	       Name (_UID, Zero)
            Method (_CRS, 0, NotSerialized) {
                Name (RBUF, ResourceTemplate () {
                    Memory32Fixed (ReadWrite, 0x01DA4000, 0x00010000)
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 0x149 }
                })
                Return (RBUF)
            }
        }

        // --------------------------------------------------------------------------
        // 5. MDSS (Display Subsystem) & Panel XMLs
        // --------------------------------------------------------------------------
	Device (MDSS)
        {
            Name (_HID, "QCOM242C") // MDSS HID for SDM710
            Name (_UID, Zero)
            
            // 1. BOE NT36672C Panel Data
            Device (PAN1) 
            {
                Name (_ADR, 0x01)
                Name (PXML, Buffer() {
                    // This buffer contains the hex-encoded content of Panel_nt36672c_boe_fhd_plus_video.xml
                    0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x22, 0x31, 
                    0x2E, 0x30, 0x22, 0x20, 0x65, 0x6E, 0x63, 0x6F, 0x64, 0x69, 0x6E, 0x67, 0x3D, 0x22, 0x75, 0x74, 
                    0x66, 0x2D, 0x38, 0x22, 0x3F, 0x3E, 0x0A, 0x3C, 0x50, 0x61, 0x6E, 0x65, 0x6C, 0x4E, 0x61, 0x6D, 
                    0x65, 0x3E, 0x4E, 0x54, 0x33, 0x36, 0x36, 0x37, 0x32, 0x43, 0x3C, 0x2F, 0x50, 0x61, 0x6E, 0x65, 
                    0x6C, 0x4E, 0x61, 0x6D, 0x65, 0x3E, 0x0A, /* ... rest of converted XML ... */
                })
            }

            // 2. Visonox RM69299 AMOLED Data
            Device (PAN2)
            {
                Name (_ADR, 0x02)
                Name (PXML, Buffer() {
                    // This buffer contains the hex-encoded content of Panel_rm69299_amoled_fhd_plus_video.xml
                    0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x22, 0x31, 
                    0x2E, 0x30, 0x22, 0x20, 0x65, 0x6E, 0x63, 0x6F, 0x64, 0x69, 0x6E, 0x67, 0x3D, 0x22, 0x75, 0x74, 
                    0x66, 0x2D, 0x38, 0x22, 0x3F, 0x3E, 0x0A, 0x3C, 0x50, 0x61, 0x6E, 0x65, 0x6C, 0x4E, 0x61, 0x6D, 
                    0x65, 0x3E, 0x56, 0x69, 0x73, 0x6F, 0x6E, 0x6F, 0x78, 0x20, 0x41, 0x4D, 0x4F, 0x4C, 0x45, 0x44, 
                    0x3C, 0x2F, 0x50, 0x61, 0x6E, 0x65, 0x6C, 0x4E, 0x61, 0x6D, 0x65, 0x3E, 0x0A, /* ... */
                })
            }

            // 3. Tianma NT36675 Panel Data
            Device (PAN3)
            {
                Name (_ADR, 0x03)
                Name (PXML, Buffer() {
                    // This buffer contains the hex-encoded content of Panel_tianma_nt36675_fhd_vid.xml
                    0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x22, 0x31, 
                    0x2E, 0x30, 0x22, 0x20, 0x65, 0x6E, 0x63, 0x6F, 0x64, 0x69, 0x6E, 0x67, 0x3D, 0x22, 0x75, 0x74, 
                    0x66, 0x2D, 0x38, 0x22, 0x3F, 0x3E, 0x0A, 0x3C, 0x50, 0x61, 0x6E, 0x65, 0x6C, 0x4E, 0x61, 0x6D, 
                    0x65, 0x3E, 0x4E, 0x54, 0x33, 0x36, 0x36, 0x37, 0x35, 0x20, 0x56, 0x69, 0x64, 0x65, 0x6F, 0x3C, 
                    0x2F, 0x50, 0x61, 0x6E, 0x65, 0x6C, 0x4E, 0x61, 0x6D, 0x65, 0x3E, 0x0A, /* ... */
                })
            }

            // 4. Huaxing FT8756 Panel Data
            Device (PAN4)
            {
                Name (_ADR, 0x04)
                Name (PXML, Buffer() {
                    // This buffer contains the hex-encoded content of Panel_huaxing_ft8756_fhd_vid.xml
                    0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x22, 0x31, 
                    0x2E, 0x30, 0x22, 0x20, 0x65, 0x6E, 0x63, 0x6F, 0x64, 0x69, 0x6E, 0x67, 0x3D, 0x22, 0x75, 0x74, 
                    0x66, 0x2D, 0x38, 0x22, 0x3F, 0x3E, 0x0A, 0x3C, 0x50, 0x61, 0x6E, 0x65, 0x6C, 0x4E, 0x61, 0x6D, 
                    0x65, 0x3E, 0x46, 0x54, 0x38, 0x37, 0x35, 0x36, 0x20, 0x56, 0x69, 0x64, 0x65, 0x6F, 0x3C, 0x2F, 
                    0x50, 0x61, 0x6E, 0x65, 0x6C, 0x4E, 0x61, 0x6D, 0x65, 0x3E, 0x0A, /* ... */
                })
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    // MDSS Base Address for SDM710 verified from sirius.txt
                    Memory32Fixed (ReadWrite, 0x0AE00000, 0x00800000)
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 0x53 }
                })
                Return (RBUF)
            }
        }

        // --------------------------------------------------------------------------
        // 6. USB Controller (xHCI)
        // --------------------------------------------------------------------------
        Device (USB0)
        {
            Name (_HID, "QCOM2430")
            Name (_CID, "PNP0D10")
            Method (_CRS, 0, NotSerialized) {
                Name (RBUF, ResourceTemplate () {
                    Memory32Fixed (ReadWrite, 0x0A600000, 0x00100000)
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 0x85 }
                })
                Return (RBUF)
            }
        }

        // --------------------------------------------------------------------------
        // 7. Input Devices (Buttons via GPIO)
        // --------------------------------------------------------------------------
        Device (BTNS)
        {
            Name (_HID, "LNRO0011") // Generic Buttons HID
            Method (_CRS, 0, NotSerialized) {
                Name (RBUF, ResourceTemplate () {
                    // Volume Up (GPIO 91)
                    GpioInt (Edge, ActiveBoth, Exclusive, PullUp, 0, "\\_SB.GIO0") { 91 }
                    // Volume Down (GPIO 92)
                    GpioInt (Edge, ActiveBoth, Exclusive, PullUp, 0, "\\_SB.GIO0") { 92 }
                })
                Return (RBUF)
            }
        }
        Device (I2C2) // Touchscreen
	{
	    Name (_HID, "QCOM240B")
	    Method (_CRS, 0, NotSerialized) {
	        Name (RBUF, ResourceTemplate () {
	            Memory32Fixed (ReadWrite, 0x00894000, 0x00004000)
	            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 0x25E }
	        })
	        Return (RBUF)
   	    }
	}
	// --------------------------------------------------------------------------
        // 8. Processor Container Device
        // --------------------------------------------------------------------------
	Device (SYSM)
	{
	    Name (_HID, "ACPI0010" /* Processor Container Device */)
	    Name (_UID, 0x00100000)
	    
	    // _LPI: Low Power Idle States
	    Name (_LPI, Package (0x04)
	    {
	        0x0000,             // Revision
	        0x01000000,         // Level ID (Platform Level)
	        0x0001,             // Count of states
	        Package (0x0A)      // Platform-Wide DRIPS State
	        {
	            0x251C,         // Min Residency (µs) - Sirius tuned
	            0x1770,         // Wakeup Latency (µs)
	            0x0001,         // Flags (1 = Enabled)
	            0x0001,         // Architecture Specific Context (1 = Retention)
	            0x0000,         // External Latency
	            0x0000,         // Reserved
	            0x0000,         // Internal Latency
	            ResourceTemplate () // Entry Method
	            {
	                Register (SystemMemory, 0, 0, 0, , ) 
	            },
	            ResourceTemplate () // Exit Method
	            {
	                Register (SystemMemory, 0, 0, 0, , )
	            },
	            "platform.DRIPS" // State Name
	        }
	    })
	}
	// --------------------------------------------------------------------------
        // 8. Processor Cluster Device
        // --------------------------------------------------------------------------
	Device (CLUS)
	{
	    Name (_HID, "ACPI0010" /* Processor Container Device */)
	    Name (_UID, 0x10)
    	
	    // _LPI: Low Power Idle States for the CPU Cluster
	    Name (_LPI, Package (0x05)
	    {
	        0x0000,             // Revision
	        0x01000000,         // Level ID
        	0x0002,             // Count of states (D2 and D4)
        	
        	// State 1: L3 Cluster Power Collapse (D2)
        	Package (0x0A)
        	{
        	    0x0BB8,         // Min Residency (µs) - ~3ms
        	    0x03E8,         // Wakeup Latency (µs) - ~1ms
        	    0x0000,         // Flags
        	    0x0001,         // Arch Specific Context (Retention)
        	    0x0000,         // External Latency
        	    0x0000,         // Internal Latency
        	    0x0020,         // Usage Count
        	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) }, // Entry
        	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) }, // Exit
        	    "L3Cluster.D2"  // State Name
        	},
	
        	// State 2: Deep Cluster Power Collapse (D4)
        	Package (0x0A)
        	{
        	    0x1770,         // Min Residency (µs) - ~6ms
        	    0x0CE4,         // Wakeup Latency (µs) - ~3.3ms
        	    0x0001,         // Flags (Enabled)
        	    0x0001,         // Arch Specific Context
        	    0x0000,         // External Latency
        	    0x0001,         // Internal Latency
        	    0x0040,         // Usage Count
        	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) }, // Entry
        	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) }, // Exit
        	    "L3Cluster.D4"  // State Name
        	}
	    })
	}
	Device (CPU0)
	{
	    Name (_HID, "ACPI0007" /* Processor Device */)
	    Name (_UID, Zero)
    	
	    Method (_STA, 0, NotSerialized)
	    {
	        Return (0x0F) // Device is present, enabled, and functioning
    	    }

    	    // _LPI: Low Power Idle States for Kryo 360 Silver
    	    Name (_LPI, Package (0x07)
    	    {
    		0x0000,         // Revision
        	0x0000,         // Level ID
        	0x0004,         // Count of states
        	
        	// C1: WFI (Wait For Interrupt)
        	Package (0x0A)
        	{
        	    Zero, Zero, One, Zero, Zero, Zero, 
        	    ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0xFFFFFFFF, 3) },
        	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
        	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
        	    "KryoSilver.C1"
        	},

        	// C2: Core Power Collapse
        	Package (0x0A)
        	{
        	    0x01F4,         // Min Residency (500us)
        	    0x0096,         // Wakeup Latency (150us)
        	    Zero, Zero, Zero, One, 
        	    ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x00000002, 3) },
        	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
        	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
        	    "KryoSilver.C2"
        	},

	        // C3: Core Rail Retention
	        Package (0x0A)
	        {
	            0x07D0,         // Min Residency (2000us)
	            0x01F4,         // Wakeup Latency (500us)
	            One, One, Zero, One, 
	            ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x40000003, 3) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            "KryoSilver.C3"
	        },

	        // C4: Deep Power Collapse
	        Package (0x0A)
	        {
	            0x1388,         // Min Residency (5000us)
	            0x03E8,         // Wakeup Latency (1000us)
	            One, One, Zero, 0x02, 
	            ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x40000004, 3) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            "KryoSilver.C4"
	        }
	    })
	}
	Device (CPU1)
	{
	    Name (_HID, "ACPI0007" /* Processor Device */)
	    Name (_UID, One) // Unique ID for the second core
    
	    Method (_STA, 0, NotSerialized)
	    {
	        Return (0x0F)
	    }
	
    	    // _LPI: Low Power Idle States for Kryo 360 Silver (Core 1)
	    Name (_LPI, Package (0x07)
	    {
	        0x0000, 
	        0x0000, 
	        0x04,   // 4 Idle States
	        
	        // C1: WFI
	        Package (0x0A)
	        {
	            Zero, Zero, One, Zero, Zero, Zero, 
	            ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0xFFFFFFFF, 3) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            "KryoSilver.C1"
	        },
	
	        // C2: Core Power Collapse
	        Package (0x0A)
	        {
	            0x0190, // Min Residency (400us)
	            0x0064, // Wakeup Latency (100us)
	            Zero, Zero, Zero, One, 
	            ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x00000002, 3) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            "KryoSilver.C2"
	        },
	
	        // C3: Core Rail Retention
	        Package (0x0A)
	        {
	            0x0762, // Min Residency (1890us)
	            0x01CD, // Wakeup Latency (461us)
	            One, One, Zero, One, 
	            ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x40000003, 3) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            "KryoSilver.C3"
	        },
	
		// C4: Deep Power Collapse
 	        Package (0x0A)
     	        {
    	     	    0x0F5E, // Min Residency (3934us)
            	    0x038D, // Wakeup Latency (909us)
            	    One, One, Zero, 0x02, 
            	    ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x40000004, 3) },
            	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
            	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
            	    "KryoSilver.C4"
        	}
    	    })
	}
	Device (CPU2)
	{
	    Name (_HID, "ACPI0007" /* Processor Device */)
	    Name (_UID, 0x02) // Unique ID: 2
	    
	    Method (_STA, 0, NotSerialized)
	    {
	        Return (0x0F)
	    }
	
	    Name (_LPI, Package (0x07)
	    {
	        0x0000, 0x0000, 0x04,
	        
	        // C1: WFI
	        Package (0x0A)
	        {
	            Zero, Zero, One, Zero, Zero, Zero, 
	            ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0xFFFFFFFF, 3) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            "KryoSilver.C1"
	        },
	
	        // C2: Core Power Collapse
	        Package (0x0A)
	        {
	            0x0190, 0x0064, Zero, Zero, Zero, One, 
	            ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x00000002, 3) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            "KryoSilver.C2"
	        },
	
	        // C3: Core Rail Retention
	        Package (0x0A)
	        {
	            0x0762, 0x01CD, One, One, Zero, One, 
	            ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x40000003, 3) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            "KryoSilver.C3"
	        },
	
	        // C4: Deep Power Collapse
	        Package (0x0A)
	        {
	            0x0F5E, 0x038D, One, One, Zero, 0x02, 
	            ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x40000004, 3) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	            "KryoSilver.C4"
	        }
	    })
	}
	Device (CPU3)
	{
	    Name (_HID, "ACPI0007" /* Processor Device */)
    	    Name (_UID, 0x03) // Unique ID for the fourth core
    	
    	    Method (_STA, 0, NotSerialized)
    	    {
        	Return (0x0F)
    	    }

    	  // _LPI: Low Power Idle States for Kryo 360 Silver (Core 3)
	    Name (_LPI, Package (0x07)
    	    {
    	        0x0000, 
    	        0x0000, 
    	        0x04,   // 4 Idle States
    	    
    	    // C1: WFI (Wait For Interrupt)
    	    	Package (0x0A)
    	    	{
			Zero, Zero, One, Zero, Zero, Zero, 
	    	        ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0xFFFFFFFF, 3) },
	    	        ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	    	        ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	    	        "KryoSilver.C1"
		},
	
    	    // C2: Core Power Collapse
	    	Package (0x0A)
    	    	{
    	        	0x0190, // Min Residency (400us)
    	        	0x0064, // Wakeup Latency (100us)
    	        	Zero, Zero, Zero, One, 
    	        	ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x00000002, 3) },
    	        	ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	        	ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	        	"KryoSilver.C2"
    	   	 },
	
    	    // C3: Core Rail Retention
    	    	Package (0x0A)
    	    	{
    	        	0x0762, // Min Residency (1890us)
    	        	0x01CD, // Wakeup Latency (461us)
    	        	One, One, Zero, One, 
    	        	ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x40000003, 3) },
    	        	ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	        	ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	        	"KryoSilver.C3"
    	    	},
	
    	    // C4: Deep Power Collapse
    	    	Package (0x0A)
    	    	{
    	    	    0x0F5E, // Min Residency (3934us)
    	    	    0x038D, // Wakeup Latency (909us)
    	    	    One, One, Zero, 0x02, 
    	    	    ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x40000004, 3) },
    	    	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	    	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	    	    "KryoSilver.C4"
    	    	}
    	     })
	 }

	 Device (CPU4)
	{
	    Name (_HID, "ACPI0007" /* Processor Device */)
	    Name (_UID, 0x04) // Unique ID: 4
    
	    Method (_STA, 0, NotSerialized)
    	{
        	Return (0x0F)
    	}

	    Name (_LPI, Package (0x07)
    	    {
    	        0x0000, 
    	        0x0000, 
    	        0x04,   // 4 Idle States
    	    
    	    // C1: WFI (Wait For Interrupt)
    	    	Package (0x0A)
    	    	{
			Zero, Zero, One, Zero, Zero, Zero, 
	    	        ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0xFFFFFFFF, 3) },
	    	        ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	    	        ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	    	        "KryoSilver.C1"
		},
	
    	    // C2: Core Power Collapse
	    	Package (0x0A)
    	    	{
    	        	0x0190, // Min Residency (400us)
    	        	0x0064, // Wakeup Latency (100us)
    	        	Zero, Zero, Zero, One, 
    	        	ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x00000002, 3) },
    	        	ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	        	ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	        	"KryoSilver.C2"
    	   	 },
	
    	    // C3: Core Rail Retention
    	    	Package (0x0A)
    	    	{
    	        	0x0762, // Min Residency (1890us)
    	        	0x01CD, // Wakeup Latency (461us)
    	        	One, One, Zero, One, 
    	        	ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x40000003, 3) },
    	        	ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	        	ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	        	"KryoSilver.C3"
    	    	},
	
    	    // C4: Deep Power Collapse
    	    	Package (0x0A)
    	    	{
    	    	    0x0F5E, // Min Residency (3934us)
    	    	    0x038D, // Wakeup Latency (909us)
    	    	    One, One, Zero, 0x02, 
    	    	    ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x40000004, 3) },
    	    	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	    	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	    	    "KryoSilver.C4"
    	    	}
    	     })
	 }

	// CPU5 - Sixth Silver Core
	Device (CPU5)
	{
	    Name (_HID, "ACPI0007")
	    Name (_UID, 0x05)
	    Method (_STA, 0, NotSerialized) { Return (0x0F) }

	    Name (_LPI, Package (0x07)
    	    {
    	        0x0000, 
    	        0x0000, 
    	        0x04,   // 4 Idle States
    	    
    	    // C1: WFI (Wait For Interrupt)
    	    	Package (0x0A)
    	    	{
			Zero, Zero, One, Zero, Zero, Zero, 
	    	        ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0xFFFFFFFF, 3) },
	    	        ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	    	        ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
	    	        "KryoSilver.C1"
		},
	
    	    // C2: Core Power Collapse
	    	Package (0x0A)
    	    	{
    	        	0x0190, // Min Residency (400us)
    	        	0x0064, // Wakeup Latency (100us)
    	        	Zero, Zero, Zero, One, 
    	        	ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x00000002, 3) },
    	        	ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	        	ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	        	"KryoSilver.C2"
    	   	 },
	
    	    // C3: Core Rail Retention
    	    	Package (0x0A)
    	    	{
    	        	0x0762, // Min Residency (1890us)
    	        	0x01CD, // Wakeup Latency (461us)
    	        	One, One, Zero, One, 
    	        	ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x40000003, 3) },
    	        	ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	        	ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	        	"KryoSilver.C3"
    	    	},
	
    	    // C4: Deep Power Collapse
    	    	Package (0x0A)
    	    	{
    	    	    0x0F5E, // Min Residency (3934us)
    	    	    0x038D, // Wakeup Latency (909us)
    	    	    One, One, Zero, 0x02, 
    	    	    ResourceTemplate () { Register (FFixedHW, 0x20, 0, 0x40000004, 3) },
    	    	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	    	    ResourceTemplate () { Register (SystemMemory, 0, 0, 0, ,) },
    	    	    "KryoSilver.C4"
    	    	}
    	     })
	 }
	Device (CPU6)
	{
	    Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
	    Name (_UID, 0x06)  // _UID: Unique ID
	    Method (_STA, 0, NotSerialized)  // _STA: Status
	    {
	        Return (0x0F)
	    }
	
	    Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
	    {
	        0x0000, 
	        0x0000, 
	        0x04, 
	        Package (0x0A)
	        {
	            Zero, 
	            Zero, 
	            One, 
	            Zero, 
	            Zero, 
	            Zero, 
	            ResourceTemplate ()
	            {
	                Register (FFixedHW, 0x20, 0x00, 0xFFFFFFFF, 0x03)
	            }, 
	
	            ResourceTemplate ()
	            {
	                Register (SystemMemory, 0x00, 0x00, 0x0000000000000000, ,)
	            }, 
	
	            ResourceTemplate ()
	            {
	                Register (SystemMemory, 0x00, 0x00, 0x0000000000000000, ,)
	            }, 
	
	            "KryoGold.C1"
	        }, 
	
	        Package (0x0A)
	        {
	            0x0258, 
	            0x00C8, 
	            Zero, 
	            Zero, 
	            Zero, 
	            One, 
	            ResourceTemplate ()
	            {
	                Register (FFixedHW, 0x20, 0x00, 0x0000000000000002, 0x03)
	            }, 
	
	            ResourceTemplate ()
	            {
	                Register (SystemMemory, 0x00, 0x00, 0x0000000000000000, ,)
	            }, 
	
	            ResourceTemplate ()
	            {
	                Register (SystemMemory, 0x00, 0x00, 0x0000000000000000, ,)
	            }, 
	
	            "KryoGold.C2"
	        }, 
	
	        Package (0x0A)
	        {
	            0x09C4, 
	            0x0258, 
	            One, 
	            One, 
	            Zero, 
	            One, 
	            ResourceTemplate ()
	            {
	                Register (FFixedHW, 0x20, 0x00, 0x0000000040000003, 0x03)
	            }, 

	            ResourceTemplate ()
	            {
	                Register (SystemMemory, 0x00, 0x00, 0x0000000000000000, ,)
	            }, 
	
	            ResourceTemplate ()
	            {
	                Register (SystemMemory, 0x00, 0x00, 0x0000000000000000, ,)
	            }, 
	
	            "KryoGold.C3"
	        }, 
	
	        Package (0x0A)
	        {
	            0x1388, 
	            0x04B0, 
	            One, 
	            One, 
	            Zero, 
	            0x02, 
	            ResourceTemplate ()
	            {
	                Register (FFixedHW, 0x20, 0x00, 0x0000000040000004, 0x03)
	            }, 
	
	            ResourceTemplate ()
	            {
	                Register (SystemMemory, 0x00, 0x00, 0x0000000000000000, ,)
	            }, 
	
	            ResourceTemplate ()
	            {
	                Register (SystemMemory, 0x00, 0x00, 0x0000000000000000, ,)
	            }, 
	
	            "KryoGold.C4"
	        }
	    })
	}

    }
}
