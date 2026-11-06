/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20251212 (64-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt18.dat
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00007AF2 (31474)
 *     Revision         0x02
 *     Checksum         0xC1
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "CB-01   "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200717 (538969879)
 */
DefinitionBlock ("", "SSDT", 2, "LENOVO", "CB-01   ", 0x00000001)
{
    External (_SB_.AAC0, FieldUnitObj)
    External (_SB_.ACRT, FieldUnitObj)
    External (_SB_.APSV, FieldUnitObj)
    External (_SB_.CBMI, FieldUnitObj)
    External (_SB_.CFGD, FieldUnitObj)
    External (_SB_.CLVL, FieldUnitObj)
    External (_SB_.CPPC, FieldUnitObj)
    External (_SB_.CTC0, FieldUnitObj)
    External (_SB_.CTC1, FieldUnitObj)
    External (_SB_.CTC2, FieldUnitObj)
    External (_SB_.OSCP, IntObj)
    External (_SB_.PAGD, DeviceObj)
    External (_SB_.PAGD._PUR, PkgObj)
    External (_SB_.PAGD._STA, MethodObj)    // 0 Arguments
    External (_SB_.PC00, DeviceObj)
    External (_SB_.PC00.LPCB.H_EC.DPTF.BMAX, MethodObj)    // 0 Arguments
    External (_SB_.PC00.LPCB.H_EC.DPTF.CMPP, MethodObj)    // 0 Arguments
    External (_SB_.PC00.LPCB.H_EC.DPTF.CTYP, MethodObj)    // 0 Arguments
    External (_SB_.PC00.LPCB.H_EC.DPTF.FCHG, MethodObj)    // 0 Arguments
    External (_SB_.PC00.LPCB.H_EC.DPTF.PBSS, MethodObj)    // 0 Arguments
    External (_SB_.PC00.LPCB.H_EC.DPTF.RBHF, MethodObj)    // 0 Arguments
    External (_SB_.PC00.LPCB.H_EC.DPTF.SCHG, MethodObj)    // 1 Arguments
    External (_SB_.PC00.LPCB.H_EC.DPTF.UPPM, MethodObj)    // 1 Arguments
    External (_SB_.PC00.LPCB.H_EC.DPTF.UVTH, MethodObj)    // 1 Arguments
    External (_SB_.PC00.LPCB.H_EC.DPTF.VBNL, MethodObj)    // 0 Arguments
    External (_SB_.PC00.LPCB.Q_EC, DeviceObj)
    External (_SB_.PC00.LPCB.Q_EC.ACIN, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.ADPW, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.BPFG, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.BPPL, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.BTDC, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.BTTM, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.CHGR, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.ECAV, IntObj)
    External (_SB_.PC00.LPCB.Q_EC.ECF2, OpRegionObj)
    External (_SB_.PC00.LPCB.Q_EC.FCHG, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.GKMF, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.TSR1, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.TSR2, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.TSR3, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.TSR4, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.TSR5, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.TSR6, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.TSR7, FieldUnitObj)
    External (_SB_.PC00.LPCB.Q_EC.TSR8, FieldUnitObj)
    External (_SB_.PC00.MC__.MHBR, FieldUnitObj)
    External (_SB_.PC00.TCPU, DeviceObj)
    External (_SB_.PL10, FieldUnitObj)
    External (_SB_.PL11, FieldUnitObj)
    External (_SB_.PL12, FieldUnitObj)
    External (_SB_.PL20, FieldUnitObj)
    External (_SB_.PL21, FieldUnitObj)
    External (_SB_.PL22, FieldUnitObj)
    External (_SB_.PLDT.ART0, PkgObj)
    External (_SB_.PLDT.ART1, PkgObj)
    External (_SB_.PLDT.GHID, MethodObj)    // 1 Arguments
    External (_SB_.PLDT.PSVT, PkgObj)
    External (_SB_.PLDT.PTRT, MethodObj)    // 0 Arguments
    External (_SB_.PLW0, FieldUnitObj)
    External (_SB_.PLW1, FieldUnitObj)
    External (_SB_.PLW2, FieldUnitObj)
    External (_SB_.PR00, ProcessorObj)
    External (_SB_.PR00._PSS, MethodObj)    // 0 Arguments
    External (_SB_.PR00._TPC, IntObj)
    External (_SB_.PR00._TSD, MethodObj)    // 0 Arguments
    External (_SB_.PR00._TSS, MethodObj)    // 0 Arguments
    External (_SB_.PR00.LPSS, PkgObj)
    External (_SB_.PR00.TPSS, PkgObj)
    External (_SB_.PR00.TSMC, PkgObj)
    External (_SB_.PR00.TSMF, PkgObj)
    External (_SB_.PR01, ProcessorObj)
    External (_SB_.PR02, ProcessorObj)
    External (_SB_.PR03, ProcessorObj)
    External (_SB_.PR04, ProcessorObj)
    External (_SB_.PR05, ProcessorObj)
    External (_SB_.PR06, ProcessorObj)
    External (_SB_.PR07, ProcessorObj)
    External (_SB_.PR08, ProcessorObj)
    External (_SB_.PR09, ProcessorObj)
    External (_SB_.PR10, ProcessorObj)
    External (_SB_.PR11, ProcessorObj)
    External (_SB_.PR12, ProcessorObj)
    External (_SB_.PR13, ProcessorObj)
    External (_SB_.PR14, ProcessorObj)
    External (_SB_.PR15, ProcessorObj)
    External (_SB_.PR16, ProcessorObj)
    External (_SB_.PR17, ProcessorObj)
    External (_SB_.PR18, ProcessorObj)
    External (_SB_.PR19, ProcessorObj)
    External (_SB_.PR20, ProcessorObj)
    External (_SB_.PR21, ProcessorObj)
    External (_SB_.PR22, ProcessorObj)
    External (_SB_.PR23, ProcessorObj)
    External (_SB_.PR24, ProcessorObj)
    External (_SB_.PR25, ProcessorObj)
    External (_SB_.PR26, ProcessorObj)
    External (_SB_.PR27, ProcessorObj)
    External (_SB_.PR28, ProcessorObj)
    External (_SB_.PR29, ProcessorObj)
    External (_SB_.PR30, ProcessorObj)
    External (_SB_.PR31, ProcessorObj)
    External (_SB_.PR32, ProcessorObj)
    External (_SB_.PR33, ProcessorObj)
    External (_SB_.PR34, ProcessorObj)
    External (_SB_.PR35, ProcessorObj)
    External (_SB_.PR36, ProcessorObj)
    External (_SB_.PR37, ProcessorObj)
    External (_SB_.PR38, ProcessorObj)
    External (_SB_.PR39, ProcessorObj)
    External (_SB_.PR40, ProcessorObj)
    External (_SB_.PR41, ProcessorObj)
    External (_SB_.PR42, ProcessorObj)
    External (_SB_.PR43, ProcessorObj)
    External (_SB_.PR44, ProcessorObj)
    External (_SB_.PR45, ProcessorObj)
    External (_SB_.PR46, ProcessorObj)
    External (_SB_.PR47, ProcessorObj)
    External (_SB_.SLPB, DeviceObj)
    External (_SB_.TAR0, FieldUnitObj)
    External (_SB_.TAR1, FieldUnitObj)
    External (_SB_.TAR2, FieldUnitObj)
    External (_TZ_.ETMD, IntObj)
    External (_TZ_.TZ00, ThermalZoneObj)
    External (ACTT, IntObj)
    External (ADBG, MethodObj)    // 1 Arguments
    External (ATPC, IntObj)
    External (CPUF, UnknownObj)
    External (CRTT, IntObj)
    External (DGFG, UnknownObj)
    External (ECON, IntObj)
    External (HIDW, MethodObj)    // 4 Arguments
    External (HIWC, MethodObj)    // 1 Arguments
    External (OLFG, UnknownObj)
    External (PF00, IntObj)
    External (PJID, UnknownObj)
    External (PNHM, IntObj)
    External (PSVT, IntObj)
    External (PTPC, IntObj)
    External (PWRS, IntObj)
    External (PWWT, UnknownObj)
    External (TCNT, IntObj)
    External (TSOD, IntObj)

    Debug = "[Dptf DptfTabl SSDT][AcpiTableEntry]"
    Debug = Timer
    ADBG ("[Dptf DptfTabl SSDT][AcpiTableEntry]")
    Scope (\_SB)
    {
        OperationRegion (DNVS, SystemMemory, 0x67E05000, 0x003D)
        Field (DNVS, AnyAcc, Lock, Preserve)
        {
            DPTF,   8, 
            DCFE,   32, 
            SADE,   8, 
            FND1,   8, 
            FND2,   8, 
            FND3,   8, 
            CHGE,   8, 
            BATR,   8, 
            IN34,   8, 
            S1DE,   8, 
            S2DE,   8, 
            S3DE,   8, 
            S4DE,   8, 
            S5DE,   8, 
            PCHE,   8, 
            PPSZ,   32, 
            PWRE,   8, 
            PPPR,   16, 
            ODV0,   8, 
            ODV1,   8, 
            ODV2,   8, 
            ODV3,   8, 
            ODV4,   8, 
            ODV5,   8, 
            FNSH,   8, 
            OD06,   8, 
            OD07,   8, 
            OD08,   8, 
            OD09,   8, 
            OD10,   8, 
            OD11,   8, 
            OD12,   8, 
            OD13,   8, 
            OD14,   8, 
            OD15,   8, 
            OD16,   8, 
            OD17,   8, 
            OD18,   8, 
            OD19,   8, 
            OD20,   8, 
            OD21,   8, 
            OD22,   8, 
            OD23,   8, 
            OD24,   8, 
            OD25,   8, 
            VSTD,   1, 
            VMYH,   1, 
            VAAA,   1, 
            VMMC,   1, 
            VAPM,   1, 
            VSTP,   1, 
            VFBC,   1, 
            VAQM,   1, 
            CICF,   4, 
            CICM,   4, 
            SMYH,   4, 
            SMMC,   4, 
            IEPM,   1, 
            IBSM,   1, 
            VMSC,   1, 
            VCQL,   1, 
            VDCC,   1, 
            Offset (0x38), 
            PNIT,   8, 
            OD26,   8, 
            OD27,   8, 
            OD28,   8, 
            OD29,   8
        }

        Device (IETM)
        {
            Name (_UID, "IETM")  // _UID: Unique ID
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return (\_SB.PLDT.GHID (_UID))
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (CondRefOf (HIWC))
                {
                    If (HIWC (Arg0))
                    {
                        If (CondRefOf (HIDW))
                        {
                            Return (HIDW (Arg0, Arg1, Arg2, Arg3))
                        }
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((\_SB.DPTF == One) && (\_SB.IN34 == One)))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (PTRP, Zero)
            Name (PSEM, Zero)
            Name (ATRP, Zero)
            Name (ASEM, Zero)
            Name (YTRP, Zero)
            Name (YSEM, Zero)
            Name (DPTE, Zero)
            Method (_OSC, 4, Serialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, Zero, STS1)
                CreateDWordField (Arg3, 0x04, CAP1)
                If ((CAP1 & One))
                {
                    DPTE = One
                }

                If ((Arg1 != One))
                {
                    STS1 &= 0xFFFFFF00
                    STS1 |= 0x0A
                    Return (Arg3)
                }

                If ((Arg2 != 0x02))
                {
                    STS1 &= 0xFFFFFF00
                    STS1 |= 0x02
                    Return (Arg3)
                }

                If (CondRefOf (\_SB.APSV))
                {
                    If ((PSEM == Zero))
                    {
                        PSEM = One
                        PTRP = \_SB.APSV /* External reference */
                    }
                }

                If (CondRefOf (\_SB.AAC0))
                {
                    If ((ASEM == Zero))
                    {
                        ASEM = One
                        ATRP = \_SB.AAC0 /* External reference */
                    }
                }

                If (CondRefOf (\_SB.ACRT))
                {
                    If ((YSEM == Zero))
                    {
                        YSEM = One
                        YTRP = \_SB.ACRT /* External reference */
                    }
                }

                If ((Arg0 == ToUUID ("b23ba85d-c8b7-3542-88de-8de2ffcfd698") /* Unknown UUID */))
                {
                    If (~(STS1 & One))
                    {
                        If ((CAP1 & One))
                        {
                            If ((CAP1 & 0x02))
                            {
                                \_SB.AAC0 = 0x6E
                                \_TZ.ETMD = Zero
                            }
                            Else
                            {
                                \_SB.AAC0 = ATRP /* \_SB_.IETM.ATRP */
                                \_TZ.ETMD = One
                            }

                            If ((CAP1 & 0x04))
                            {
                                \_SB.APSV = 0x6E
                            }
                            Else
                            {
                                \_SB.APSV = PTRP /* \_SB_.IETM.PTRP */
                            }

                            If ((CAP1 & 0x08))
                            {
                                \_SB.ACRT = 0xD2
                            }
                            Else
                            {
                                \_SB.ACRT = YTRP /* \_SB_.IETM.YTRP */
                            }

                            If (CondRefOf (\_TZ.TZ00))
                            {
                                Notify (\_TZ.TZ00, 0x81) // Information Change
                            }
                        }
                        Else
                        {
                            \_SB.ACRT = YTRP /* \_SB_.IETM.YTRP */
                            \_SB.APSV = PTRP /* \_SB_.IETM.PTRP */
                            \_SB.AAC0 = ATRP /* \_SB_.IETM.ATRP */
                            \_TZ.ETMD = One
                        }

                        If (CondRefOf (\_TZ.TZ00))
                        {
                            Notify (\_TZ.TZ00, 0x81) // Information Change
                        }
                    }

                    Return (Arg3)
                }

                Return (Arg3)
            }

            Method (DCFG, 0, NotSerialized)
            {
                Return (\_SB.DCFE)
            }

            Name (ODVX, Package (0x1E)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Name (BTMM, Zero)
            Method (ODVP, 0, Serialized)
            {
                ODVX [Zero] = \_SB.ODV0
                ODVX [One] = \_SB.ODV1
                ODVX [0x02] = \_SB.ODV2
                ODVX [0x03] = \_SB.ODV3
                ODVX [0x04] = \_SB.ODV4
                ODVX [0x05] = \_SB.ODV5
                ODVX [0x06] = \_SB.OD06
                ODVX [0x07] = \_SB.OD07
                ODVX [0x08] = \_SB.OD08
                ODVX [0x09] = \_SB.OD09
                ODVX [0x0A] = \_SB.OD10
                ODVX [0x0B] = \_SB.OD11
                ODVX [0x0C] = \_SB.OD12
                ODVX [0x0D] = \_SB.OD13
                ODVX [0x0E] = \_SB.OD14
                ODVX [0x0F] = \_SB.OD15
                ODVX [0x10] = \_SB.OD16
                ODVX [0x11] = \_SB.OD17
                ODVX [0x12] = \_SB.OD18
                ODVX [0x13] = \_SB.OD19
                ODVX [0x14] = \_SB.OD20
                BTMM = \_SB.PC00.LPCB.Q_EC.BTTM /* External reference */
                If ((BTMM > 0x0AAA))
                {
                    BTMM = ((BTMM - 0x0AAA) / 0x0A)
                }
                Else
                {
                    BTMM = Zero
                }

                If (((BTMM <= 0x32) && (BTMM >= 0x0A)))
                {
                    \_SB.OD26 = Zero
                }
                Else
                {
                    \_SB.OD26 = One
                }

                If (((\_SB.PC00.LPCB.Q_EC.ADPW <= 0x2C) && (\_SB.PC00.LPCB.Q_EC.ACIN & One)))
                {
                    \_SB.OD22 = 0x02
                    ODVX [0x16] = \_SB.OD22
                }
                ElseIf (((\_SB.PC00.LPCB.Q_EC.ADPW <= 0x40) && (\_SB.PC00.LPCB.Q_EC.ACIN & One)))
                {
                    \_SB.OD22 = One
                    ODVX [0x16] = \_SB.OD22
                }
                Else
                {
                    \_SB.OD22 = Zero
                    ODVX [0x16] = \_SB.OD22
                }

                If (((\_SB.PC00.LPCB.Q_EC.BTDC > Zero) && (\_SB.PC00.LPCB.Q_EC.BTDC <= 0x1B58)))
                {
                    \_SB.OD27 = Zero
                    ODVX [0x1B] = \_SB.OD27
                }
                Else
                {
                    \_SB.OD27 = One
                    ODVX [0x1B] = \_SB.OD27
                }

                If ((\_SB.PC00.LPCB.Q_EC.BPFG == One))
                {
                    If ((\_SB.PC00.LPCB.Q_EC.GKMF == Zero))
                    {
                        \_SB.OD28 = One
                        ODVX [0x1C] = \_SB.OD28
                    }
                    Else
                    {
                        \_SB.OD28 = 0x03
                        ODVX [0x1C] = \_SB.OD28
                    }
                }
                ElseIf ((\_SB.PC00.LPCB.Q_EC.BPPL == One))
                {
                    If ((\_SB.PC00.LPCB.Q_EC.GKMF == Zero))
                    {
                        \_SB.OD28 = 0x02
                        ODVX [0x1C] = \_SB.OD28
                    }
                    Else
                    {
                        \_SB.OD28 = 0x04
                        ODVX [0x1C] = \_SB.OD28
                    }
                }
                Else
                {
                    \_SB.OD28 = Zero
                    ODVX [0x1C] = \_SB.OD28
                }

                If ((\_SB.PC00.LPCB.Q_EC.ACIN & Zero))
                {
                    \_SB.OD28 = Zero
                    ODVX [0x1C] = \_SB.OD28
                }

                If ((\OLFG == 0x02))
                {
                    \_SB.OD29 = One
                    ODVX [0x1D] = \_SB.OD29
                }
                Else
                {
                    \_SB.OD29 = Zero
                    ODVX [0x1D] = \_SB.OD29
                }

                ODVX [0x17] = \_SB.OD23
                ODVX [0x18] = \_SB.OD24
                ODVX [0x19] = \_SB.OD25
                ODVX [0x1A] = \_SB.OD26
                Return (ODVX) /* \_SB_.IETM.ODVX */
            }

            Name (PTTL, 0x14)
            Name (DTXX, Package (0x01)
            {
                Package (0x08)
                {
                    \_SB.IETM, 
                    \_SB.IETM, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                }
            })
            Name (DAXX, Package (0x02)
            {
                Zero, 
                Package (0x0D)
                {
                    \_SB.IETM, 
                    \_SB.IETM, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF
                }
            })
            Name (DPXX, Package (0x02)
            {
                Zero, 
                Package (0x0C)
                {
                    \_SB.IETM, 
                    \_SB.IETM, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                }
            })
            Method (_TRT, 0, NotSerialized)  // _TRT: Thermal Relationship Table
            {
                If (CondRefOf (\_SB.PLDT.PTRT))
                {
                    Return (\_SB.PLDT.PTRT ())
                }
                Else
                {
                    Return (DTXX) /* \_SB_.IETM.DTXX */
                }
            }

            Method (PSVT, 0, NotSerialized)
            {
                If (CondRefOf (\_SB.PLDT.PSVT))
                {
                    Return (\_SB.PLDT.PSVT) /* External reference */
                }
                Else
                {
                    Return (DPXX) /* \_SB_.IETM.DPXX */
                }
            }

            Method (_ART, 0, NotSerialized)  // _ART: Active Cooling Relationship Table
            {
                If (\_SB.IETM.SEN3.CTYP)
                {
                    If (CondRefOf (\_SB.PLDT.ART1))
                    {
                        Return (\_SB.PLDT.ART1) /* External reference */
                    }
                    Else
                    {
                        Return (DAXX) /* \_SB_.IETM.DAXX */
                    }
                }
                ElseIf (CondRefOf (\_SB.PLDT.ART0))
                {
                    Return (\_SB.PLDT.ART0) /* External reference */
                }
                Else
                {
                    Return (DAXX) /* \_SB_.IETM.DAXX */
                }
            }

            Method (GDDV, 0, Serialized)
            {
                If ((\PJID == Zero))
                {
                    Return (Package (0x01)
                    {
                        Buffer (0x0967)
                        {
                            /* 0000 */  0xE5, 0x1F, 0x94, 0x00, 0x00, 0x00, 0x00, 0x02,  // ........
                            /* 0008 */  0x00, 0x00, 0x00, 0x40, 0x67, 0x64, 0x64, 0x76,  // ...@gddv
                            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x4F, 0x45, 0x4D, 0x20,  // ....OEM 
                            /* 0030 */  0x45, 0x78, 0x70, 0x6F, 0x72, 0x74, 0x65, 0x64,  // Exported
                            /* 0038 */  0x20, 0x44, 0x61, 0x74, 0x61, 0x56, 0x61, 0x75,  //  DataVau
                            /* 0040 */  0x6C, 0x74, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // lt......
                            /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0068 */  0x00, 0x00, 0x00, 0x00, 0x64, 0x05, 0x69, 0xF6,  // ....d.i.
                            /* 0070 */  0x08, 0xE3, 0xF8, 0xC2, 0xA9, 0xF1, 0x72, 0xA6,  // ......r.
                            /* 0078 */  0x2F, 0x2B, 0xA8, 0x74, 0xE7, 0x9A, 0xDE, 0x55,  // /+.t...U
                            /* 0080 */  0x26, 0x45, 0xCB, 0x75, 0x2F, 0xA2, 0x60, 0x3C,  // &E.u/.`<
                            /* 0088 */  0xFD, 0x9F, 0xD7, 0xD4, 0xD3, 0x08, 0x00, 0x00,  // ........
                            /* 0090 */  0x52, 0x45, 0x50, 0x4F, 0x5D, 0x00, 0x00, 0x00,  // REPO]...
                            /* 0098 */  0x01, 0xC2, 0xCF, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 00A0 */  0x00, 0x00, 0x72, 0x87, 0xCD, 0xFF, 0x6D, 0x24,  // ..r...m$
                            /* 00A8 */  0x47, 0xDB, 0x3D, 0x24, 0x92, 0xB4, 0x16, 0x6F,  // G.=$...o
                            /* 00B0 */  0x45, 0xD8, 0xC3, 0xF5, 0x66, 0x14, 0x9F, 0x22,  // E...f.."
                            /* 00B8 */  0xD7, 0xF7, 0xDE, 0x67, 0x90, 0x9A, 0xA2, 0x0D,  // ...g....
                            /* 00C0 */  0x39, 0x25, 0xAD, 0xC3, 0x1A, 0xAD, 0x52, 0x0B,  // 9%....R.
                            /* 00C8 */  0x75, 0x38, 0xE1, 0xA4, 0x14, 0x42, 0xB8, 0x06,  // u8...B..
                            /* 00D0 */  0x9B, 0x1B, 0x4C, 0xC9, 0xB7, 0x9B, 0x5A, 0x14,  // ..L...Z.
                            /* 00D8 */  0xE9, 0xF4, 0x62, 0x18, 0xE7, 0x00, 0x71, 0x04,  // ..b...q.
                            /* 00E0 */  0x99, 0x5C, 0xEF, 0x94, 0x47, 0x0E, 0xF8, 0xB6,  // .\..G...
                            /* 00E8 */  0x52, 0xBE, 0x20, 0x64, 0xE6, 0xF7, 0x99, 0x2F,  // R. d.../
                            /* 00F0 */  0xCD, 0x34, 0x71, 0xEC, 0x9D, 0xDA, 0x57, 0xA7,  // .4q...W.
                            /* 00F8 */  0xB7, 0xF1, 0x97, 0x55, 0xD6, 0x6B, 0xE4, 0xA1,  // ...U.k..
                            /* 0100 */  0xEF, 0x6E, 0x53, 0xCC, 0xE8, 0xCD, 0x3C, 0xFC,  // .nS...<.
                            /* 0108 */  0xC1, 0x6C, 0x75, 0xC8, 0x38, 0x9A, 0x8B, 0xAA,  // .lu.8...
                            /* 0110 */  0x6A, 0x3B, 0x55, 0x16, 0xA8, 0xE4, 0xC6, 0xE4,  // j;U.....
                            /* 0118 */  0x3A, 0xF1, 0xAF, 0x9B, 0x1D, 0x9D, 0x56, 0xD1,  // :.....V.
                            /* 0120 */  0xAC, 0xB6, 0x4C, 0x22, 0xA7, 0x41, 0xBC, 0x9A,  // ..L".A..
                            /* 0128 */  0x88, 0xE8, 0xB0, 0x75, 0xF3, 0x70, 0x1D, 0xD7,  // ...u.p..
                            /* 0130 */  0x5E, 0x11, 0xFD, 0x97, 0xB4, 0xB5, 0x13, 0x1A,  // ^.......
                            /* 0138 */  0x0D, 0x0F, 0x5B, 0x72, 0x53, 0x41, 0x88, 0xD8,  // ..[rSA..
                            /* 0140 */  0xE8, 0x41, 0x6B, 0x9E, 0x0C, 0xB9, 0xD0, 0x44,  // .Ak....D
                            /* 0148 */  0x5C, 0x32, 0xA0, 0xA1, 0xEE, 0xB6, 0x16, 0x8A,  // \2......
                            /* 0150 */  0x0E, 0xDC, 0xAE, 0x82, 0x91, 0x4F, 0x97, 0x33,  // .....O.3
                            /* 0158 */  0x4F, 0x0E, 0x97, 0xD4, 0x77, 0xF3, 0xE3, 0xD8,  // O...w...
                            /* 0160 */  0xE0, 0x99, 0x2C, 0xEF, 0x26, 0x2C, 0x0C, 0x89,  // ..,.&,..
                            /* 0168 */  0x70, 0x58, 0xD9, 0xFC, 0x83, 0x73, 0x14, 0x2B,  // pX...s.+
                            /* 0170 */  0x41, 0xE3, 0xBF, 0xAA, 0x1F, 0x31, 0x61, 0x01,  // A....1a.
                            /* 0178 */  0x6B, 0xCA, 0xB2, 0xB8, 0x9E, 0x28, 0x25, 0xEB,  // k....(%.
                            /* 0180 */  0x56, 0x51, 0x42, 0xA0, 0x60, 0xF2, 0x0E, 0x8C,  // VQB.`...
                            /* 0188 */  0xBB, 0x95, 0x9A, 0xFC, 0xB7, 0xDE, 0xDC, 0x48,  // .......H
                            /* 0190 */  0x7A, 0x3A, 0x64, 0x02, 0x11, 0xB8, 0x01, 0xA1,  // z:d.....
                            /* 0198 */  0x3A, 0x87, 0xD5, 0x1C, 0x6F, 0xCC, 0x5F, 0xF1,  // :...o._.
                            /* 01A0 */  0x23, 0xE2, 0xF8, 0xB3, 0x8B, 0x9D, 0x5A, 0x84,  // #.....Z.
                            /* 01A8 */  0x17, 0x85, 0xB4, 0x80, 0x75, 0x9B, 0x37, 0x78,  // ....u.7x
                            /* 01B0 */  0xED, 0x2F, 0x2F, 0x08, 0x8A, 0x1A, 0xCD, 0x6E,  // .//....n
                            /* 01B8 */  0x5B, 0x50, 0x0C, 0x95, 0x8E, 0xEE, 0xBE, 0x6B,  // [P.....k
                            /* 01C0 */  0x8C, 0x32, 0xD0, 0x91, 0xC0, 0xD7, 0x24, 0xCD,  // .2....$.
                            /* 01C8 */  0x99, 0x1C, 0x74, 0x40, 0xB6, 0x3C, 0x8B, 0x79,  // ..t@.<.y
                            /* 01D0 */  0xB9, 0x1F, 0x58, 0x54, 0x32, 0xB0, 0xF6, 0xD3,  // ..XT2...
                            /* 01D8 */  0xA4, 0xDF, 0x5C, 0x12, 0xE7, 0xCD, 0x83, 0x94,  // ..\.....
                            /* 01E0 */  0xF6, 0xEB, 0x8F, 0x5C, 0x26, 0xA5, 0x1B, 0xC5,  // ...\&...
                            /* 01E8 */  0x29, 0xB0, 0x4B, 0x91, 0x8A, 0xD9, 0x43, 0x20,  // ).K...C 
                            /* 01F0 */  0x4C, 0xE8, 0x62, 0x1A, 0x45, 0xE7, 0xAC, 0x8E,  // L.b.E...
                            /* 01F8 */  0x33, 0xC6, 0x81, 0xD3, 0x8E, 0x2F, 0x69, 0xCA,  // 3..../i.
                            /* 0200 */  0x08, 0x54, 0xF2, 0xC5, 0xC2, 0x48, 0x73, 0xF5,  // .T...Hs.
                            /* 0208 */  0x5E, 0xE6, 0xD8, 0x41, 0x89, 0xCA, 0xD9, 0x5E,  // ^..A...^
                            /* 0210 */  0x6E, 0x6D, 0xEE, 0x9B, 0xBB, 0xAC, 0x60, 0x02,  // nm....`.
                            /* 0218 */  0xB5, 0x92, 0xCC, 0xA2, 0xD6, 0xEE, 0x90, 0xFF,  // ........
                            /* 0220 */  0x1F, 0xA8, 0x20, 0xD9, 0xED, 0x22, 0x61, 0x40,  // .. .."a@
                            /* 0228 */  0xE6, 0x87, 0xA8, 0xA4, 0x35, 0xF5, 0xDE, 0x1F,  // ....5...
                            /* 0230 */  0xC7, 0x87, 0xD9, 0x11, 0xE9, 0x72, 0xA3, 0xC9,  // .....r..
                            /* 0238 */  0xC4, 0x51, 0x33, 0x7E, 0xB8, 0xDE, 0xBE, 0x7B,  // .Q3~...{
                            /* 0240 */  0xE4, 0x8E, 0x53, 0x3C, 0x64, 0x0F, 0x79, 0xDB,  // ..S<d.y.
                            /* 0248 */  0xC4, 0x1C, 0xE0, 0xF2, 0xE0, 0x4D, 0x62, 0x6B,  // .....Mbk
                            /* 0250 */  0x62, 0x66, 0x0E, 0xCE, 0x73, 0x33, 0x41, 0xB6,  // bf..s3A.
                            /* 0258 */  0x2D, 0xB3, 0x97, 0x72, 0xCD, 0x75, 0x19, 0xEE,  // -..r.u..
                            /* 0260 */  0x85, 0xE3, 0x0F, 0x69, 0xB2, 0x91, 0x2E, 0xBE,  // ...i....
                            /* 0268 */  0x6B, 0xF2, 0x36, 0xD1, 0x90, 0x6B, 0xE7, 0x67,  // k.6..k.g
                            /* 0270 */  0x69, 0x94, 0xF9, 0x63, 0xEB, 0x19, 0x2D, 0x65,  // i..c..-e
                            /* 0278 */  0x69, 0x07, 0xF8, 0x11, 0x46, 0xAD, 0x30, 0x75,  // i...F.0u
                            /* 0280 */  0x63, 0x02, 0xF8, 0x1A, 0x61, 0x18, 0x22, 0x0E,  // c...a.".
                            /* 0288 */  0x44, 0x58, 0xB7, 0xD6, 0x31, 0xE0, 0x60, 0x57,  // DX..1.`W
                            /* 0290 */  0xEF, 0x50, 0x52, 0x69, 0xB1, 0x61, 0x1E, 0xE2,  // .PRi.a..
                            /* 0298 */  0x7B, 0x6A, 0x74, 0xDF, 0xC5, 0x94, 0x4E, 0xB3,  // {jt...N.
                            /* 02A0 */  0xFA, 0x43, 0x8B, 0x31, 0x24, 0x6C, 0x43, 0xF5,  // .C.1$lC.
                            /* 02A8 */  0x65, 0x9A, 0x83, 0xBE, 0x28, 0x9F, 0x39, 0x03,  // e...(.9.
                            /* 02B0 */  0xB4, 0xC4, 0xF7, 0xA5, 0x3F, 0xA8, 0xEC, 0xF3,  // ....?...
                            /* 02B8 */  0x79, 0xB3, 0xC1, 0xAD, 0x4A, 0xFB, 0x02, 0x65,  // y...J..e
                            /* 02C0 */  0xC3, 0x6F, 0x0B, 0x84, 0x56, 0xE9, 0xDB, 0x35,  // .o..V..5
                            /* 02C8 */  0x8A, 0x06, 0xA7, 0x15, 0xF0, 0x7E, 0x7A, 0x52,  // .....~zR
                            /* 02D0 */  0x16, 0x11, 0xE5, 0x98, 0x08, 0x65, 0x90, 0x7C,  // .....e.|
                            /* 02D8 */  0x48, 0x1B, 0xBB, 0xCD, 0xC2, 0x12, 0x7D, 0x04,  // H.....}.
                            /* 02E0 */  0x4A, 0x01, 0x48, 0x6F, 0xAA, 0x3F, 0x73, 0x26,  // J.Ho.?s&
                            /* 02E8 */  0x19, 0xF5, 0x0E, 0xA7, 0x8A, 0xF0, 0xCC, 0x6D,  // .......m
                            /* 02F0 */  0xA4, 0xE1, 0xC3, 0x36, 0x83, 0xAC, 0xAE, 0x16,  // ...6....
                            /* 02F8 */  0xAE, 0xAD, 0x7C, 0xE0, 0x0C, 0x32, 0x42, 0x8C,  // ..|..2B.
                            /* 0300 */  0xC5, 0x3C, 0x06, 0x33, 0x61, 0x04, 0xA8, 0xCF,  // .<.3a...
                            /* 0308 */  0x8A, 0xC5, 0x5E, 0xED, 0x91, 0xCE, 0xE4, 0x86,  // ..^.....
                            /* 0310 */  0x62, 0xA6, 0x82, 0x9B, 0x84, 0x53, 0xD4, 0x89,  // b....S..
                            /* 0318 */  0xAC, 0xBC, 0x41, 0xA2, 0x2E, 0xF8, 0x12, 0x7E,  // ..A....~
                            /* 0320 */  0xD1, 0x88, 0x0C, 0xA8, 0x3D, 0x5C, 0x06, 0x02,  // ....=\..
                            /* 0328 */  0xDF, 0x24, 0x96, 0x26, 0x81, 0x55, 0x29, 0x56,  // .$.&.U)V
                            /* 0330 */  0xAD, 0x7F, 0xB9, 0xBC, 0x18, 0xAF, 0xFA, 0x7B,  // .......{
                            /* 0338 */  0x70, 0x93, 0x46, 0x99, 0xE4, 0x5B, 0xFE, 0x72,  // p.F..[.r
                            /* 0340 */  0xA8, 0x02, 0xC2, 0x3A, 0x9C, 0x2F, 0x2E, 0x0C,  // ...:./..
                            /* 0348 */  0x9B, 0x15, 0x03, 0x2B, 0x03, 0x21, 0x9F, 0x5E,  // ...+.!.^
                            /* 0350 */  0xAD, 0x9C, 0xE2, 0x31, 0xBE, 0x33, 0x2C, 0x92,  // ...1.3,.
                            /* 0358 */  0xC5, 0x30, 0x8B, 0xDA, 0xA9, 0x28, 0x43, 0x72,  // .0...(Cr
                            /* 0360 */  0xC5, 0xEC, 0x63, 0x58, 0x7A, 0x94, 0x25, 0x5C,  // ..cXz.%\
                            /* 0368 */  0x57, 0xF3, 0x1A, 0x2E, 0xC6, 0xFC, 0x8A, 0x16,  // W.......
                            /* 0370 */  0x91, 0x6E, 0x5E, 0x81, 0xA4, 0x8A, 0x1E, 0x7D,  // .n^....}
                            /* 0378 */  0x49, 0x9D, 0x28, 0xE5, 0x3F, 0x30, 0xA7, 0xC9,  // I.(.?0..
                            /* 0380 */  0x9D, 0xCD, 0x85, 0x7A, 0x4E, 0x4C, 0x11, 0xB2,  // ...zNL..
                            /* 0388 */  0x4B, 0x08, 0xBC, 0xE3, 0xB6, 0x37, 0x18, 0xB1,  // K....7..
                            /* 0390 */  0xAB, 0xF8, 0x5F, 0x72, 0x5F, 0x5F, 0xF1, 0xF7,  // .._r__..
                            /* 0398 */  0x8D, 0xD6, 0xCB, 0x7F, 0x33, 0x27, 0xEE, 0x72,  // ....3'.r
                            /* 03A0 */  0xF9, 0xEA, 0x10, 0x56, 0xFC, 0x43, 0x86, 0x34,  // ...V.C.4
                            /* 03A8 */  0xE3, 0x8D, 0x54, 0x36, 0x1B, 0x17, 0xB6, 0x1F,  // ..T6....
                            /* 03B0 */  0xAB, 0x3B, 0xA3, 0x91, 0xB3, 0x35, 0x14, 0x51,  // .;...5.Q
                            /* 03B8 */  0x09, 0xF2, 0x85, 0x47, 0xE3, 0x98, 0xA1, 0xDD,  // ...G....
                            /* 03C0 */  0x64, 0xBD, 0xFF, 0x57, 0xA0, 0xD5, 0x97, 0x4E,  // d..W...N
                            /* 03C8 */  0x75, 0xAF, 0xCC, 0x12, 0x0C, 0x58, 0xC6, 0x74,  // u....X.t
                            /* 03D0 */  0xE1, 0x55, 0xA4, 0x04, 0x84, 0xF6, 0xE5, 0xDA,  // .U......
                            /* 03D8 */  0x32, 0xFF, 0x59, 0xEE, 0xCF, 0x79, 0xCC, 0x2C,  // 2.Y..y.,
                            /* 03E0 */  0x6A, 0x57, 0xF8, 0x91, 0xF5, 0x07, 0xDA, 0xAD,  // jW......
                            /* 03E8 */  0xCD, 0x1C, 0x4F, 0x41, 0x70, 0x3C, 0x46, 0xA5,  // ..OAp<F.
                            /* 03F0 */  0xFF, 0x8A, 0xE5, 0x6A, 0x8F, 0x66, 0x42, 0xFA,  // ...j.fB.
                            /* 03F8 */  0xC9, 0x4F, 0x3C, 0xE0, 0x3A, 0xBD, 0x6B, 0xE3,  // .O<.:.k.
                            /* 0400 */  0x01, 0xA8, 0xCF, 0x01, 0x60, 0xDE, 0xB9, 0x8C,  // ....`...
                            /* 0408 */  0xFD, 0xC9, 0xA3, 0x02, 0x73, 0xCB, 0x5C, 0x35,  // ....s.\5
                            /* 0410 */  0x66, 0x4B, 0xE0, 0x90, 0xB9, 0x3A, 0x9C, 0x70,  // fK...:.p
                            /* 0418 */  0xFB, 0x50, 0xF3, 0x82, 0xA9, 0xF6, 0x1F, 0x31,  // .P.....1
                            /* 0420 */  0x4C, 0x70, 0x4B, 0xC7, 0x94, 0x92, 0x72, 0xCE,  // LpK...r.
                            /* 0428 */  0x20, 0x2F, 0x9F, 0xD1, 0x25, 0x66, 0xA7, 0xD3,  //  /..%f..
                            /* 0430 */  0x9E, 0x29, 0xDE, 0x00, 0x80, 0x85, 0x13, 0xD0,  // .)......
                            /* 0438 */  0xED, 0xE2, 0x4E, 0x9E, 0x33, 0xD2, 0x24, 0x3D,  // ..N.3.$=
                            /* 0440 */  0x13, 0xAC, 0x73, 0x40, 0x57, 0xC5, 0x3D, 0x7F,  // ..s@W.=.
                            /* 0448 */  0xD0, 0xA9, 0x36, 0x1E, 0xEB, 0x4A, 0x46, 0x3B,  // ..6..JF;
                            /* 0450 */  0x17, 0x6F, 0x38, 0x22, 0xA3, 0xF6, 0x4B, 0xDA,  // .o8"..K.
                            /* 0458 */  0x0F, 0x1A, 0x01, 0xB8, 0x01, 0x29, 0xEA, 0x33,  // .....).3
                            /* 0460 */  0x9D, 0x07, 0xD7, 0x4F, 0xAF, 0xAE, 0x1B, 0xF6,  // ...O....
                            /* 0468 */  0x6E, 0xE6, 0xDC, 0x1C, 0x3D, 0xEC, 0x12, 0x3A,  // n...=..:
                            /* 0470 */  0x4B, 0xF3, 0x6D, 0xD7, 0x4D, 0x66, 0x4B, 0x10,  // K.m.MfK.
                            /* 0478 */  0x2A, 0x52, 0x18, 0xBE, 0x5B, 0x02, 0x77, 0xDC,  // *R..[.w.
                            /* 0480 */  0xF4, 0x6B, 0x80, 0x53, 0xA7, 0x55, 0x04, 0xE8,  // .k.S.U..
                            /* 0488 */  0x86, 0x9C, 0xC5, 0xAE, 0x2F, 0xDF, 0xD2, 0x82,  // ..../...
                            /* 0490 */  0xC4, 0x07, 0xCC, 0x29, 0xFA, 0xD7, 0xC2, 0xBD,  // ...)....
                            /* 0498 */  0x7E, 0x73, 0xBD, 0x27, 0x38, 0x30, 0x25, 0x7D,  // ~s.'80%}
                            /* 04A0 */  0x76, 0xBC, 0x03, 0xD4, 0x49, 0x62, 0x15, 0x88,  // v...Ib..
                            /* 04A8 */  0x94, 0xBD, 0x79, 0x72, 0xDE, 0x7A, 0xED, 0x7D,  // ..yr.z.}
                            /* 04B0 */  0x8B, 0x7A, 0xC4, 0x35, 0x00, 0xFA, 0x39, 0x10,  // .z.5..9.
                            /* 04B8 */  0x13, 0x0F, 0xC2, 0xBB, 0x3C, 0xF4, 0x70, 0x04,  // ....<.p.
                            /* 04C0 */  0x54, 0x12, 0x03, 0x34, 0x08, 0x7E, 0x8B, 0x80,  // T..4.~..
                            /* 04C8 */  0x3B, 0x3E, 0xA8, 0x00, 0x4E, 0x8F, 0x9E, 0x60,  // ;>..N..`
                            /* 04D0 */  0xEC, 0x48, 0xB2, 0x43, 0xE2, 0xFD, 0x63, 0x7D,  // .H.C..c}
                            /* 04D8 */  0xB9, 0xF1, 0xD3, 0x5C, 0x02, 0x61, 0x22, 0x3B,  // ...\.a";
                            /* 04E0 */  0x4E, 0x21, 0x48, 0x27, 0xFE, 0xB3, 0x11, 0xAA,  // N!H'....
                            /* 04E8 */  0xFE, 0xD7, 0xE4, 0x4F, 0x60, 0x2D, 0x48, 0x40,  // ...O`-H@
                            /* 04F0 */  0xDE, 0x23, 0xE5, 0xA3, 0x47, 0xDC, 0x1A, 0x8C,  // .#..G...
                            /* 04F8 */  0xE5, 0x6B, 0x66, 0x08, 0xA6, 0x7C, 0x45, 0x0E,  // .kf..|E.
                            /* 0500 */  0x21, 0x2F, 0x60, 0x2D, 0xBF, 0x69, 0xD9, 0x02,  // !/`-.i..
                            /* 0508 */  0x3B, 0xD6, 0xD9, 0xDE, 0x03, 0xB1, 0xF0, 0xDB,  // ;.......
                            /* 0510 */  0x52, 0x6A, 0xCB, 0x51, 0x38, 0x8E, 0x11, 0xF1,  // Rj.Q8...
                            /* 0518 */  0x76, 0xB2, 0x00, 0xE3, 0xAF, 0xC0, 0x2C, 0xB4,  // v.....,.
                            /* 0520 */  0xF9, 0x88, 0x60, 0xB9, 0x63, 0x3C, 0x3A, 0xE3,  // ..`.c<:.
                            /* 0528 */  0xA4, 0x3A, 0xCC, 0x8F, 0x19, 0x73, 0x60, 0x4D,  // .:...s`M
                            /* 0530 */  0x92, 0xF7, 0x73, 0x64, 0xB0, 0x76, 0xC5, 0x6B,  // ..sd.v.k
                            /* 0538 */  0xE5, 0xC3, 0xAB, 0x2C, 0x1A, 0x48, 0x82, 0xAD,  // ...,.H..
                            /* 0540 */  0xC5, 0x66, 0xB0, 0x98, 0x93, 0xC5, 0xCA, 0xC0,  // .f......
                            /* 0548 */  0xA8, 0xD2, 0xF7, 0x24, 0x3B, 0xFB, 0x30, 0x76,  // ...$;.0v
                            /* 0550 */  0x46, 0x3C, 0x47, 0xE6, 0x0B, 0xD2, 0x04, 0x01,  // F<G.....
                            /* 0558 */  0xF0, 0x4A, 0x98, 0xB7, 0xBD, 0x99, 0x82, 0x90,  // .J......
                            /* 0560 */  0xE0, 0x7B, 0xBC, 0x21, 0x60, 0x67, 0x29, 0x2E,  // .{.!`g).
                            /* 0568 */  0xE5, 0x6B, 0x6A, 0x64, 0x01, 0xD3, 0xAE, 0xA5,  // .kjd....
                            /* 0570 */  0xA7, 0x03, 0xEA, 0xB4, 0x21, 0x84, 0x0F, 0xAF,  // ....!...
                            /* 0578 */  0xE9, 0x29, 0xF7, 0x82, 0xEE, 0xDE, 0xD3, 0xDB,  // .)......
                            /* 0580 */  0xDE, 0x28, 0xE4, 0x5C, 0x57, 0x90, 0xF9, 0x55,  // .(.\W..U
                            /* 0588 */  0x86, 0xD0, 0x45, 0x2C, 0x85, 0x44, 0x51, 0x33,  // ..E,.DQ3
                            /* 0590 */  0x21, 0x24, 0x47, 0x3A, 0x14, 0x02, 0xE1, 0xE3,  // !$G:....
                            /* 0598 */  0x00, 0xEE, 0xA8, 0x27, 0x07, 0x1F, 0x9B, 0x98,  // ...'....
                            /* 05A0 */  0x7B, 0x12, 0x80, 0xCB, 0xE8, 0x31, 0x52, 0x80,  // {....1R.
                            /* 05A8 */  0x21, 0x57, 0xD8, 0xE8, 0xD3, 0x84, 0x81, 0xDD,  // !W......
                            /* 05B0 */  0x03, 0x10, 0xE3, 0xC6, 0x83, 0xDA, 0xE1, 0x5E,  // .......^
                            /* 05B8 */  0x03, 0xBC, 0x3C, 0xE2, 0xCF, 0x95, 0xD0, 0xF9,  // ..<.....
                            /* 05C0 */  0x91, 0x76, 0x43, 0xA7, 0x80, 0x41, 0x0E, 0x90,  // .vC..A..
                            /* 05C8 */  0x3C, 0x97, 0x3A, 0x12, 0x51, 0x01, 0x5E, 0x74,  // <.:.Q.^t
                            /* 05D0 */  0xDC, 0x26, 0xB5, 0xE9, 0x2C, 0xFA, 0x42, 0x6C,  // .&..,.Bl
                            /* 05D8 */  0xFD, 0x68, 0x0C, 0x3B, 0xAF, 0xE3, 0x43, 0xF1,  // .h.;..C.
                            /* 05E0 */  0x2F, 0x6A, 0x93, 0x68, 0x19, 0x1F, 0xCF, 0x0C,  // /j.h....
                            /* 05E8 */  0x60, 0x42, 0x34, 0x88, 0xF5, 0xD6, 0x89, 0x5C,  // `B4....\
                            /* 05F0 */  0x76, 0x58, 0xC3, 0x83, 0x7A, 0xEF, 0xAE, 0x9B,  // vX..z...
                            /* 05F8 */  0x4E, 0xD1, 0x36, 0x0D, 0x19, 0xC5, 0xC2, 0x24,  // N.6....$
                            /* 0600 */  0xF2, 0x37, 0x3C, 0xEB, 0xA2, 0x5A, 0x5F, 0x4B,  // .7<..Z_K
                            /* 0608 */  0x6A, 0xF3, 0xE6, 0x10, 0xBE, 0x5D, 0x3F, 0xC5,  // j....]?.
                            /* 0610 */  0x1A, 0x41, 0xDC, 0xD9, 0x75, 0x96, 0x38, 0x6F,  // .A..u.8o
                            /* 0618 */  0x6C, 0x06, 0x5B, 0x51, 0xE2, 0x98, 0xE2, 0xE5,  // l.[Q....
                            /* 0620 */  0xB1, 0x2C, 0x3C, 0xB4, 0x03, 0x17, 0xCC, 0x67,  // .,<....g
                            /* 0628 */  0x59, 0xC2, 0xD6, 0xBE, 0x3C, 0xFE, 0xE9, 0x78,  // Y...<..x
                            /* 0630 */  0xEF, 0xD3, 0x95, 0x6C, 0xF6, 0xFC, 0x3A, 0x5F,  // ...l..:_
                            /* 0638 */  0xA3, 0x4D, 0x5E, 0x68, 0x2D, 0x27, 0x58, 0xA6,  // .M^h-'X.
                            /* 0640 */  0xEE, 0x37, 0x3F, 0x4A, 0x9B, 0xAC, 0x5D, 0x3F,  // .7?J..]?
                            /* 0648 */  0xD0, 0x15, 0x89, 0x99, 0xC0, 0x54, 0x98, 0x0C,  // .....T..
                            /* 0650 */  0x4D, 0x5E, 0x7D, 0xA8, 0xE6, 0x4E, 0x13, 0x70,  // M^}..N.p
                            /* 0658 */  0x6C, 0x4B, 0x2B, 0xFE, 0xE3, 0x11, 0xAE, 0xB7,  // lK+.....
                            /* 0660 */  0xFD, 0xFF, 0x88, 0xB8, 0x7A, 0x3E, 0x53, 0x93,  // ....z>S.
                            /* 0668 */  0x12, 0xF3, 0x59, 0x35, 0x0C, 0xD8, 0x1E, 0x7E,  // ..Y5...~
                            /* 0670 */  0x6B, 0x6B, 0x3A, 0x34, 0x71, 0x4D, 0x3C, 0x49,  // kk:4qM<I
                            /* 0678 */  0x58, 0x43, 0x93, 0xA5, 0xF9, 0x25, 0xCC, 0xBF,  // XC...%..
                            /* 0680 */  0xD9, 0x6A, 0x7F, 0x95, 0x29, 0xB9, 0x21, 0x52,  // .j..).!R
                            /* 0688 */  0x16, 0xCF, 0x09, 0x1F, 0xD1, 0x43, 0x80, 0x24,  // .....C.$
                            /* 0690 */  0x23, 0x60, 0xA0, 0x79, 0x0C, 0x3D, 0x75, 0x41,  // #`.y.=uA
                            /* 0698 */  0xB6, 0x1B, 0x3B, 0x56, 0xB5, 0x11, 0xB3, 0x42,  // ..;V...B
                            /* 06A0 */  0x92, 0xC8, 0xBC, 0x73, 0xFA, 0xC5, 0xAA, 0x77,  // ...s...w
                            /* 06A8 */  0x72, 0xB8, 0x16, 0x21, 0x94, 0x6F, 0x4F, 0xC5,  // r..!.oO.
                            /* 06B0 */  0x08, 0x16, 0xDA, 0x4A, 0x59, 0x93, 0x12, 0xA0,  // ...JY...
                            /* 06B8 */  0xFF, 0xA5, 0xD0, 0x2A, 0x87, 0x59, 0xF6, 0x45,  // ...*.Y.E
                            /* 06C0 */  0x9A, 0xD9, 0x74, 0x7D, 0x93, 0xC5, 0x14, 0xDD,  // ..t}....
                            /* 06C8 */  0x1B, 0xB0, 0x58, 0xB9, 0x16, 0xFB, 0x37, 0x12,  // ..X...7.
                            /* 06D0 */  0xF6, 0x90, 0xB9, 0xF0, 0x65, 0x36, 0xF3, 0xEA,  // ....e6..
                            /* 06D8 */  0x0C, 0x8B, 0xF9, 0x36, 0x78, 0xBE, 0xD7, 0x19,  // ...6x...
                            /* 06E0 */  0xC3, 0x4C, 0x98, 0x7C, 0x0C, 0x99, 0x36, 0xD2,  // .L.|..6.
                            /* 06E8 */  0x77, 0xC0, 0xAA, 0x75, 0x4E, 0xCE, 0xB1, 0xDD,  // w..uN...
                            /* 06F0 */  0x08, 0x1A, 0x43, 0xE7, 0x81, 0xB4, 0xD0, 0xF8,  // ..C.....
                            /* 06F8 */  0x5E, 0x85, 0x67, 0x79, 0x56, 0xAB, 0xC7, 0x05,  // ^.gyV...
                            /* 0700 */  0x47, 0x4D, 0xDC, 0xAA, 0xFF, 0x7E, 0x46, 0xC9,  // GM...~F.
                            /* 0708 */  0x5E, 0x73, 0x32, 0xF1, 0x29, 0x7D, 0xC3, 0xEA,  // ^s2.)}..
                            /* 0710 */  0xDD, 0x51, 0xD2, 0xF5, 0xCF, 0xF8, 0x4C, 0x5D,  // .Q....L]
                            /* 0718 */  0x65, 0x50, 0x1B, 0x20, 0xA6, 0x7A, 0xED, 0x5E,  // eP. .z.^
                            /* 0720 */  0x5C, 0xF6, 0x98, 0x51, 0x65, 0xDB, 0xD9, 0x36,  // \..Qe..6
                            /* 0728 */  0x65, 0x45, 0x6C, 0xF9, 0xBB, 0x5C, 0x5C, 0x1E,  // eEl..\\.
                            /* 0730 */  0x98, 0x58, 0x0D, 0x03, 0x71, 0xC4, 0xB4, 0x9E,  // .X..q...
                            /* 0738 */  0xB9, 0x44, 0x12, 0x39, 0x54, 0xCC, 0x68, 0xDC,  // .D.9T.h.
                            /* 0740 */  0x40, 0x8B, 0x40, 0x48, 0xC2, 0xC6, 0xC3, 0x65,  // @.@H...e
                            /* 0748 */  0x7A, 0xA1, 0x15, 0xEC, 0xCB, 0x28, 0xE5, 0xD1,  // z....(..
                            /* 0750 */  0x01, 0xD6, 0x2A, 0x47, 0xB5, 0x7C, 0x11, 0xF3,  // ..*G.|..
                            /* 0758 */  0xEA, 0xE0, 0xB1, 0xA7, 0xA1, 0x5B, 0xBA, 0x6D,  // .....[.m
                            /* 0760 */  0xE3, 0xAF, 0xED, 0x5C, 0x0C, 0xD2, 0x05, 0x23,  // ...\...#
                            /* 0768 */  0x36, 0x2F, 0x59, 0x9B, 0x02, 0xC9, 0x8D, 0x61,  // 6/Y....a
                            /* 0770 */  0x04, 0x2C, 0x63, 0xAF, 0xE0, 0x58, 0xB7, 0x0A,  // .,c..X..
                            /* 0778 */  0x80, 0xAE, 0x50, 0xA0, 0xD8, 0x6C, 0xAC, 0x5C,  // ..P..l.\
                            /* 0780 */  0xC2, 0xE4, 0x19, 0x4D, 0x03, 0x9A, 0x4D, 0x1A,  // ...M..M.
                            /* 0788 */  0xA4, 0xED, 0x54, 0xD8, 0xF8, 0x85, 0xB9, 0xC3,  // ..T.....
                            /* 0790 */  0xD6, 0xC2, 0x68, 0xEA, 0x39, 0x4C, 0xDD, 0xB6,  // ..h.9L..
                            /* 0798 */  0x29, 0x3D, 0x3D, 0xBF, 0x21, 0xBD, 0xE7, 0xBF,  // )==.!...
                            /* 07A0 */  0x1B, 0x46, 0xD4, 0x86, 0x7E, 0x27, 0xBA, 0x42,  // .F..~'.B
                            /* 07A8 */  0xA2, 0x88, 0xF1, 0xC7, 0x77, 0x0B, 0xDB, 0xF5,  // ....w...
                            /* 07B0 */  0x2D, 0xF2, 0xE7, 0x91, 0x7A, 0xC8, 0xC4, 0x3B,  // -...z..;
                            /* 07B8 */  0x5C, 0x7E, 0xC1, 0x9A, 0x44, 0xDD, 0x8B, 0x05,  // \~..D...
                            /* 07C0 */  0xE9, 0xD1, 0x00, 0x31, 0x09, 0xF8, 0x2B, 0x07,  // ...1..+.
                            /* 07C8 */  0x56, 0x5C, 0xFB, 0x8C, 0x30, 0xC7, 0xCF, 0xD2,  // V\..0...
                            /* 07D0 */  0xD1, 0xE8, 0xB0, 0x0D, 0xF4, 0x41, 0xFB, 0xD0,  // .....A..
                            /* 07D8 */  0x64, 0xE5, 0x13, 0xB2, 0x13, 0x66, 0x4A, 0xF9,  // d....fJ.
                            /* 07E0 */  0x6C, 0x4C, 0x94, 0x3A, 0x9C, 0xD4, 0xE4, 0x29,  // lL.:...)
                            /* 07E8 */  0x42, 0x74, 0x33, 0xB7, 0xB6, 0x76, 0x85, 0x0E,  // Bt3..v..
                            /* 07F0 */  0x8C, 0x44, 0xBE, 0x60, 0xE6, 0x5C, 0xC7, 0x51,  // .D.`.\.Q
                            /* 07F8 */  0xCF, 0x94, 0xA3, 0x49, 0x2E, 0xBA, 0x6E, 0x3C,  // ...I..n<
                            /* 0800 */  0x29, 0x08, 0x30, 0x7F, 0xFA, 0xE3, 0x41, 0x17,  // ).0...A.
                            /* 0808 */  0x36, 0x07, 0x5B, 0xDF, 0x96, 0xA7, 0x39, 0x68,  // 6.[...9h
                            /* 0810 */  0x31, 0x26, 0x23, 0x29, 0x38, 0x03, 0x67, 0xB3,  // 1&#)8.g.
                            /* 0818 */  0xFF, 0xE7, 0xF6, 0xD0, 0x25, 0x96, 0xB7, 0x2F,  // ....%../
                            /* 0820 */  0xE8, 0x3E, 0x84, 0xB3, 0xAB, 0x1C, 0xED, 0x99,  // .>......
                            /* 0828 */  0x85, 0xBB, 0xBE, 0x80, 0x88, 0x6B, 0xCB, 0xAD,  // .....k..
                            /* 0830 */  0x7F, 0x3D, 0xAD, 0x54, 0xB4, 0xFD, 0xAB, 0x43,  // .=.T...C
                            /* 0838 */  0x54, 0x5D, 0xA6, 0x8B, 0x43, 0x1D, 0xC4, 0x19,  // T]..C...
                            /* 0840 */  0x07, 0xC9, 0xD8, 0x66, 0x25, 0xF1, 0x88, 0xA1,  // ...f%...
                            /* 0848 */  0x84, 0xA7, 0xCD, 0xE9, 0xB5, 0xA3, 0x62, 0x5E,  // ......b^
                            /* 0850 */  0x0B, 0xB8, 0x9F, 0x0D, 0x2E, 0x5E, 0x1F, 0x14,  // .....^..
                            /* 0858 */  0xC9, 0x63, 0xC7, 0x1B, 0xC3, 0x4E, 0x10, 0xA7,  // .c...N..
                            /* 0860 */  0x84, 0x05, 0xFF, 0x79, 0x0F, 0x6C, 0x85, 0x99,  // ...y.l..
                            /* 0868 */  0x77, 0x6B, 0xA5, 0xD8, 0x5B, 0xC5, 0x9C, 0x5C,  // wk..[..\
                            /* 0870 */  0xF8, 0x3F, 0xD1, 0x3E, 0xBF, 0xD6, 0x25, 0x1A,  // .?.>..%.
                            /* 0878 */  0x35, 0xB9, 0x75, 0xD9, 0x2D, 0xF1, 0x0B, 0x8B,  // 5.u.-...
                            /* 0880 */  0x7C, 0x6C, 0xF6, 0x31, 0x3A, 0x59, 0xD3, 0xA2,  // |l.1:Y..
                            /* 0888 */  0x65, 0x8E, 0xA9, 0x03, 0x46, 0x6A, 0x49, 0xE0,  // e...FjI.
                            /* 0890 */  0xFA, 0x0D, 0x18, 0x45, 0x00, 0xF6, 0xF0, 0x43,  // ...E...C
                            /* 0898 */  0xDC, 0xCF, 0xE5, 0x2D, 0x3B, 0x60, 0x29, 0x25,  // ...-;`)%
                            /* 08A0 */  0x24, 0x3B, 0xDE, 0xBC, 0xA2, 0x16, 0x9E, 0x6A,  // $;.....j
                            /* 08A8 */  0x03, 0x37, 0x70, 0x23, 0x84, 0x18, 0x03, 0xE3,  // .7p#....
                            /* 08B0 */  0x38, 0x4B, 0xCA, 0x24, 0xF5, 0x14, 0x65, 0x12,  // 8K.$..e.
                            /* 08B8 */  0x7E, 0xB0, 0xFF, 0x8D, 0xFD, 0xA1, 0x09, 0xBD,  // ~.......
                            /* 08C0 */  0xBF, 0xE2, 0x88, 0xAE, 0x83, 0xCB, 0x27, 0x5B,  // ......'[
                            /* 08C8 */  0x30, 0xAB, 0xFA, 0x4A, 0xA4, 0x5A, 0xBD, 0xF6,  // 0..J.Z..
                            /* 08D0 */  0x7A, 0x21, 0x5A, 0x76, 0xFE, 0xD5, 0x67, 0xA3,  // z!Zv..g.
                            /* 08D8 */  0x67, 0xB8, 0x08, 0x47, 0x2F, 0x31, 0xDE, 0x45,  // g..G/1.E
                            /* 08E0 */  0x40, 0xA4, 0xF8, 0xBF, 0xB0, 0x83, 0x30, 0x86,  // @.....0.
                            /* 08E8 */  0x89, 0xC6, 0x0B, 0x5F, 0xEC, 0x97, 0x9C, 0x20,  // ..._... 
                            /* 08F0 */  0x35, 0x68, 0xB6, 0x8D, 0x5A, 0xD6, 0x74, 0x6C,  // 5h..Z.tl
                            /* 08F8 */  0x5E, 0x11, 0x06, 0x4C, 0x8D, 0x85, 0x86, 0x51,  // ^..L...Q
                            /* 0900 */  0xC8, 0xF2, 0x24, 0x1C, 0x75, 0x40, 0x8E, 0x7D,  // ..$.u@.}
                            /* 0908 */  0xAA, 0xD4, 0x40, 0x9E, 0xDE, 0xD5, 0x81, 0xD0,  // ..@.....
                            /* 0910 */  0x06, 0x74, 0x3F, 0xC4, 0xF9, 0x37, 0x8F, 0x7B,  // .t?..7.{
                            /* 0918 */  0x07, 0x28, 0xC2, 0x0B, 0x46, 0x51, 0xD5, 0x02,  // .(..FQ..
                            /* 0920 */  0x6E, 0xF5, 0xAA, 0x9D, 0xB6, 0x98, 0xFE, 0x8D,  // n.......
                            /* 0928 */  0xA6, 0xDC, 0x38, 0x82, 0x38, 0x61, 0xF4, 0x57,  // ..8.8a.W
                            /* 0930 */  0xAA, 0x35, 0x3B, 0xBA, 0x63, 0x52, 0x4A, 0xAE,  // .5;.cRJ.
                            /* 0938 */  0x72, 0xD1, 0xAE, 0x4D, 0xBD, 0x8B, 0xDA, 0x3C,  // r..M...<
                            /* 0940 */  0x93, 0x0B, 0x79, 0x30, 0xC5, 0x5C, 0x4F, 0x71,  // ..y0.\Oq
                            /* 0948 */  0xB2, 0x9C, 0xE0, 0xAA, 0x4D, 0x22, 0xDA, 0xB2,  // ....M"..
                            /* 0950 */  0x34, 0x33, 0x83, 0x7B, 0xE5, 0x48, 0x6F, 0xC6,  // 43.{.Ho.
                            /* 0958 */  0x3C, 0x48, 0xB2, 0x40, 0x58, 0x36, 0x95, 0xB1,  // <H.@X6..
                            /* 0960 */  0xF9, 0x0A, 0x8D, 0x01, 0x2E, 0xEF, 0x00         // .......
                        }
                    })
                }
                ElseIf ((\PJID == One))
                {
                    Return (Package (0x01)
                    {
                        Buffer (0x0956)
                        {
                            /* 0000 */  0xE5, 0x1F, 0x94, 0x00, 0x00, 0x00, 0x00, 0x02,  // ........
                            /* 0008 */  0x00, 0x00, 0x00, 0x40, 0x67, 0x64, 0x64, 0x76,  // ...@gddv
                            /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x4F, 0x45, 0x4D, 0x20,  // ....OEM 
                            /* 0030 */  0x45, 0x78, 0x70, 0x6F, 0x72, 0x74, 0x65, 0x64,  // Exported
                            /* 0038 */  0x20, 0x44, 0x61, 0x74, 0x61, 0x56, 0x61, 0x75,  //  DataVau
                            /* 0040 */  0x6C, 0x74, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // lt......
                            /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0068 */  0x00, 0x00, 0x00, 0x00, 0x47, 0xDE, 0xDF, 0x2C,  // ....G..,
                            /* 0070 */  0xBB, 0x12, 0xB5, 0x70, 0x29, 0x5E, 0x2A, 0x49,  // ...p)^*I
                            /* 0078 */  0xEA, 0x28, 0x39, 0xE9, 0x33, 0x8E, 0x85, 0x55,  // .(9.3..U
                            /* 0080 */  0x64, 0xA9, 0xCB, 0x09, 0xFC, 0x72, 0x01, 0x5D,  // d....r.]
                            /* 0088 */  0x0E, 0x8E, 0xF4, 0x13, 0xC2, 0x08, 0x00, 0x00,  // ........
                            /* 0090 */  0x52, 0x45, 0x50, 0x4F, 0x5D, 0x00, 0x00, 0x00,  // REPO]...
                            /* 0098 */  0x01, 0xA6, 0xCF, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 00A0 */  0x00, 0x00, 0x72, 0x87, 0xCD, 0xFF, 0x6D, 0x24,  // ..r...m$
                            /* 00A8 */  0x47, 0xDB, 0x3D, 0x24, 0x92, 0xB4, 0x16, 0x6F,  // G.=$...o
                            /* 00B0 */  0x45, 0xD8, 0xC3, 0xF5, 0x66, 0x14, 0x9F, 0x22,  // E...f.."
                            /* 00B8 */  0xD7, 0xF7, 0xDE, 0x67, 0x90, 0x9A, 0xA2, 0x0D,  // ...g....
                            /* 00C0 */  0x39, 0x25, 0xAD, 0xC3, 0x1A, 0xAD, 0x52, 0x0B,  // 9%....R.
                            /* 00C8 */  0x75, 0x38, 0xE1, 0xA4, 0x14, 0x40, 0xE0, 0x15,  // u8...@..
                            /* 00D0 */  0x10, 0xA7, 0xE7, 0x1E, 0xDE, 0xC4, 0x8F, 0xBE,  // ........
                            /* 00D8 */  0x2F, 0xCB, 0xE8, 0xDE, 0x5F, 0x6D, 0x02, 0x1D,  // /..._m..
                            /* 00E0 */  0x56, 0xF3, 0x57, 0xDB, 0xD4, 0xBA, 0xBD, 0x67,  // V.W....g
                            /* 00E8 */  0x18, 0x94, 0x40, 0x85, 0xF8, 0x38, 0x67, 0x00,  // ..@..8g.
                            /* 00F0 */  0x1E, 0x4C, 0xF0, 0x8D, 0xBD, 0x00, 0x18, 0x4B,  // .L.....K
                            /* 00F8 */  0x68, 0x71, 0x37, 0x2D, 0x4E, 0x48, 0x28, 0x6D,  // hq7-NH(m
                            /* 0100 */  0x66, 0x26, 0x44, 0x00, 0x56, 0x94, 0x3B, 0xEF,  // f&D.V.;.
                            /* 0108 */  0x13, 0x1B, 0x45, 0x46, 0xC3, 0x56, 0xCE, 0xC3,  // ..EF.V..
                            /* 0110 */  0xDE, 0xC8, 0x08, 0x66, 0xD3, 0xDA, 0x6D, 0xCE,  // ...f..m.
                            /* 0118 */  0x52, 0xFF, 0x54, 0x15, 0xCC, 0x48, 0x8D, 0xFE,  // R.T..H..
                            /* 0120 */  0x68, 0xA3, 0x33, 0xC4, 0x98, 0x01, 0x81, 0x67,  // h.3....g
                            /* 0128 */  0x09, 0xCF, 0x43, 0xFE, 0xA5, 0x01, 0x3B, 0xD9,  // ..C...;.
                            /* 0130 */  0x9C, 0x89, 0x93, 0xF5, 0x83, 0xEB, 0x11, 0x9C,  // ........
                            /* 0138 */  0x4C, 0xE9, 0xEC, 0x48, 0x95, 0x5D, 0x84, 0xA8,  // L..H.]..
                            /* 0140 */  0x2D, 0x7C, 0xAF, 0x39, 0x85, 0xA3, 0x03, 0xEA,  // -|.9....
                            /* 0148 */  0xE9, 0x29, 0x27, 0x94, 0x36, 0xC9, 0x05, 0x1F,  // .)'.6...
                            /* 0150 */  0x03, 0x23, 0xAA, 0x69, 0x52, 0x41, 0xD4, 0xB4,  // .#.iRA..
                            /* 0158 */  0xC5, 0xF5, 0xCB, 0x18, 0x11, 0xC1, 0x1E, 0xFA,  // ........
                            /* 0160 */  0x8E, 0xA3, 0x19, 0x2D, 0x19, 0x62, 0x6C, 0x4D,  // ...-.blM
                            /* 0168 */  0x1C, 0x5C, 0xA8, 0x9B, 0x3E, 0xFE, 0xBC, 0x6C,  // .\..>..l
                            /* 0170 */  0x51, 0xBF, 0x62, 0x01, 0x36, 0x78, 0xE4, 0x75,  // Q.b.6x.u
                            /* 0178 */  0x13, 0x82, 0x93, 0xB7, 0xEA, 0x9A, 0x12, 0x40,  // .......@
                            /* 0180 */  0x2D, 0x04, 0x8F, 0xA2, 0x1F, 0x39, 0xA1, 0x54,  // -....9.T
                            /* 0188 */  0xFC, 0x62, 0xD1, 0x37, 0xDE, 0x54, 0xD1, 0x7A,  // .b.7.T.z
                            /* 0190 */  0x99, 0xEB, 0xE7, 0x13, 0x42, 0x61, 0xD7, 0x27,  // ....Ba.'
                            /* 0198 */  0xBC, 0x4B, 0x1C, 0xF1, 0xFC, 0xF0, 0xAE, 0x64,  // .K.....d
                            /* 01A0 */  0xD1, 0xFB, 0x5C, 0xEC, 0x55, 0x01, 0xE5, 0xAE,  // ..\.U...
                            /* 01A8 */  0x3B, 0x15, 0x53, 0xD2, 0x5C, 0x5C, 0xAF, 0x90,  // ;.S.\\..
                            /* 01B0 */  0x35, 0xE6, 0x9C, 0x6F, 0x73, 0x60, 0x15, 0x99,  // 5..os`..
                            /* 01B8 */  0xAF, 0x8C, 0x81, 0x13, 0xA9, 0x61, 0x50, 0x9D,  // .....aP.
                            /* 01C0 */  0x22, 0x3D, 0x23, 0xE8, 0x2A, 0x61, 0x33, 0x06,  // "=#.*a3.
                            /* 01C8 */  0x1B, 0xF7, 0x84, 0x0F, 0xDF, 0xB2, 0xE4, 0xE3,  // ........
                            /* 01D0 */  0x78, 0x61, 0xF5, 0x1A, 0xD5, 0xF2, 0x52, 0x47,  // xa....RG
                            /* 01D8 */  0x44, 0xBA, 0x6D, 0x41, 0xBC, 0xED, 0xE6, 0x29,  // D.mA...)
                            /* 01E0 */  0x27, 0xDD, 0x1F, 0x06, 0x22, 0x75, 0xF1, 0x4C,  // '..."u.L
                            /* 01E8 */  0xD5, 0x67, 0x56, 0x21, 0xEA, 0xAE, 0x80, 0xF5,  // .gV!....
                            /* 01F0 */  0x89, 0x7D, 0x1F, 0xC3, 0x41, 0x9D, 0x4B, 0xD5,  // .}..A.K.
                            /* 01F8 */  0xFF, 0xED, 0xE9, 0x3A, 0x4B, 0xF1, 0xA3, 0xF1,  // ...:K...
                            /* 0200 */  0xC4, 0x3A, 0xFB, 0xD2, 0x52, 0x5A, 0x3C, 0x1B,  // .:..RZ<.
                            /* 0208 */  0x81, 0x9A, 0x6C, 0xFE, 0xC9, 0x06, 0x8C, 0xED,  // ..l.....
                            /* 0210 */  0x60, 0x0D, 0x84, 0x8C, 0x96, 0xCA, 0x57, 0xAF,  // `.....W.
                            /* 0218 */  0x8D, 0xA0, 0x8C, 0xDB, 0xA1, 0xB2, 0xC4, 0xA8,  // ........
                            /* 0220 */  0x7D, 0x6E, 0xDE, 0x8E, 0xFB, 0x13, 0xE2, 0x3B,  // }n.....;
                            /* 0228 */  0xAD, 0x49, 0x00, 0x91, 0x50, 0x65, 0xDC, 0x9A,  // .I..Pe..
                            /* 0230 */  0xFF, 0x76, 0x57, 0xEE, 0xAD, 0x71, 0x86, 0xE6,  // .vW..q..
                            /* 0238 */  0x7E, 0x82, 0xE1, 0x8C, 0x16, 0xB8, 0xB1, 0x48,  // ~......H
                            /* 0240 */  0x25, 0x16, 0x93, 0x5A, 0x05, 0x46, 0xE1, 0xA9,  // %..Z.F..
                            /* 0248 */  0x1F, 0x02, 0x61, 0x33, 0x91, 0x0F, 0x2E, 0x75,  // ..a3...u
                            /* 0250 */  0x77, 0x49, 0x54, 0xB1, 0x8B, 0xDD, 0x45, 0xBD,  // wIT...E.
                            /* 0258 */  0x7F, 0x54, 0xD7, 0xB2, 0x63, 0x92, 0x68, 0xA0,  // .T..c.h.
                            /* 0260 */  0x0D, 0x81, 0x88, 0x8F, 0xC2, 0x77, 0xB9, 0x64,  // .....w.d
                            /* 0268 */  0xA4, 0x04, 0x22, 0x6B, 0xAF, 0x05, 0xFA, 0x44,  // .."k...D
                            /* 0270 */  0xA7, 0x3D, 0xBD, 0x58, 0x72, 0x9F, 0xB5, 0x77,  // .=.Xr..w
                            /* 0278 */  0x5D, 0x56, 0x74, 0xAD, 0xC3, 0x13, 0x5C, 0xA1,  // ]Vt...\.
                            /* 0280 */  0x60, 0xBD, 0x99, 0xE2, 0x65, 0x25, 0x49, 0xAA,  // `...e%I.
                            /* 0288 */  0x36, 0x18, 0x6B, 0x5A, 0x0B, 0x76, 0x09, 0x3B,  // 6.kZ.v.;
                            /* 0290 */  0x94, 0xE3, 0x70, 0x17, 0xDE, 0x10, 0x0B, 0x2B,  // ..p....+
                            /* 0298 */  0xF4, 0x58, 0x39, 0x61, 0x3D, 0x2C, 0xD7, 0x03,  // .X9a=,..
                            /* 02A0 */  0x5C, 0x48, 0x6B, 0x0C, 0xE2, 0xDB, 0x07, 0x40,  // \Hk....@
                            /* 02A8 */  0xF3, 0xD6, 0xE8, 0x05, 0xD9, 0xD3, 0xC5, 0x24,  // .......$
                            /* 02B0 */  0x45, 0x82, 0xD2, 0xE6, 0xF9, 0x31, 0xB3, 0xC5,  // E....1..
                            /* 02B8 */  0x7D, 0x63, 0x68, 0x3C, 0x22, 0xFD, 0xF3, 0xD7,  // }ch<"...
                            /* 02C0 */  0xBD, 0xAF, 0x90, 0xAE, 0x43, 0x93, 0x4A, 0xD9,  // ....C.J.
                            /* 02C8 */  0xE0, 0x35, 0x02, 0x63, 0xE3, 0x05, 0xAB, 0x49,  // .5.c...I
                            /* 02D0 */  0x00, 0xFB, 0x83, 0x0F, 0xA8, 0xC1, 0xE8, 0xF7,  // ........
                            /* 02D8 */  0x62, 0xED, 0x76, 0xF1, 0x68, 0xB5, 0xCE, 0xE9,  // b.v.h...
                            /* 02E0 */  0xD5, 0x25, 0x50, 0x95, 0xD1, 0xE1, 0x6A, 0xAB,  // .%P...j.
                            /* 02E8 */  0xCA, 0x51, 0xF7, 0x68, 0x09, 0x2D, 0xB9, 0x6B,  // .Q.h.-.k
                            /* 02F0 */  0xCC, 0x13, 0xC0, 0xA9, 0x7A, 0x6C, 0xA0, 0x1B,  // ....zl..
                            /* 02F8 */  0xFD, 0xFE, 0x97, 0x4A, 0xE0, 0x41, 0x7E, 0x58,  // ...J.A~X
                            /* 0300 */  0x80, 0x28, 0x6C, 0x50, 0x19, 0xF1, 0xD5, 0xEF,  // .(lP....
                            /* 0308 */  0xCC, 0x30, 0xC6, 0x0F, 0x6D, 0x22, 0x6E, 0x64,  // .0..m"nd
                            /* 0310 */  0x50, 0x9B, 0x78, 0xBA, 0xE9, 0xBF, 0x5A, 0xDA,  // P.x...Z.
                            /* 0318 */  0x6F, 0x09, 0x66, 0xE4, 0xBC, 0xE8, 0xDB, 0xDC,  // o.f.....
                            /* 0320 */  0x50, 0x57, 0x9D, 0x82, 0xEF, 0x19, 0x3A, 0xE8,  // PW....:.
                            /* 0328 */  0xA1, 0xA0, 0xC4, 0x77, 0x37, 0x9D, 0x73, 0xB3,  // ...w7.s.
                            /* 0330 */  0x44, 0x7E, 0x91, 0xB1, 0x14, 0x6B, 0x8C, 0x87,  // D~...k..
                            /* 0338 */  0x86, 0x0B, 0x39, 0x93, 0x42, 0x23, 0xF4, 0x50,  // ..9.B#.P
                            /* 0340 */  0xEC, 0x7B, 0x75, 0x39, 0x04, 0xF1, 0x48, 0x74,  // .{u9..Ht
                            /* 0348 */  0x07, 0x09, 0x4C, 0x9B, 0x09, 0xCF, 0x8B, 0x9F,  // ..L.....
                            /* 0350 */  0x62, 0x40, 0xEA, 0x27, 0x2F, 0xCD, 0x6F, 0xF2,  // b@.'/.o.
                            /* 0358 */  0x61, 0xFD, 0xCF, 0xEF, 0x2E, 0xE9, 0x07, 0x4C,  // a......L
                            /* 0360 */  0xD3, 0x41, 0x88, 0xC7, 0x30, 0x77, 0x84, 0xD9,  // .A..0w..
                            /* 0368 */  0x41, 0x0F, 0x9A, 0x2F, 0x24, 0x5D, 0x0E, 0x69,  // A../$].i
                            /* 0370 */  0xEF, 0x73, 0x39, 0xD8, 0x01, 0xE5, 0x02, 0x28,  // .s9....(
                            /* 0378 */  0x95, 0x6B, 0x58, 0x97, 0x24, 0x25, 0x7C, 0x94,  // .kX.$%|.
                            /* 0380 */  0x4F, 0xA2, 0x30, 0x9A, 0x01, 0x31, 0xFF, 0x67,  // O.0..1.g
                            /* 0388 */  0x87, 0xD5, 0x20, 0x51, 0x75, 0x60, 0x43, 0x49,  // .. Qu`CI
                            /* 0390 */  0x8B, 0x0B, 0xDF, 0x6F, 0xFF, 0x35, 0x61, 0x6A,  // ...o.5aj
                            /* 0398 */  0x26, 0x7B, 0x1E, 0x4B, 0x97, 0x24, 0xD9, 0xA6,  // &{.K.$..
                            /* 03A0 */  0x8E, 0xE8, 0x90, 0xFA, 0x47, 0x27, 0xA4, 0x09,  // ....G'..
                            /* 03A8 */  0x64, 0x6E, 0xBB, 0x40, 0xF2, 0x55, 0xDE, 0x15,  // dn.@.U..
                            /* 03B0 */  0x86, 0xFB, 0x9B, 0xD8, 0x8C, 0x6A, 0xCA, 0x0A,  // .....j..
                            /* 03B8 */  0x20, 0x42, 0xD3, 0xBD, 0xAD, 0xAC, 0x31, 0xA8,  //  B....1.
                            /* 03C0 */  0xB5, 0xCF, 0xE4, 0xE6, 0x03, 0xB7, 0x47, 0x53,  // ......GS
                            /* 03C8 */  0x8B, 0x5B, 0x38, 0x5D, 0xF6, 0x1F, 0x16, 0xCA,  // .[8]....
                            /* 03D0 */  0xE3, 0xEC, 0x23, 0x64, 0x32, 0x22, 0xC7, 0x29,  // ..#d2".)
                            /* 03D8 */  0xB7, 0x3E, 0x71, 0xB7, 0x4F, 0x35, 0xDE, 0xF8,  // .>q.O5..
                            /* 03E0 */  0x96, 0xE3, 0xA5, 0xA9, 0xD6, 0x1F, 0x73, 0x99,  // ......s.
                            /* 03E8 */  0xB8, 0xE5, 0xA9, 0xAB, 0x21, 0xD9, 0x3C, 0xE9,  // ....!.<.
                            /* 03F0 */  0xB2, 0x74, 0x30, 0xA9, 0xCD, 0x0E, 0xAB, 0xB5,  // .t0.....
                            /* 03F8 */  0x21, 0x4C, 0x67, 0x0B, 0x0E, 0x87, 0x69, 0x72,  // !Lg...ir
                            /* 0400 */  0xB3, 0xB8, 0x2F, 0x6C, 0x22, 0xC8, 0xD5, 0x10,  // ../l"...
                            /* 0408 */  0x18, 0x29, 0xE0, 0x06, 0x9B, 0xA4, 0xD8, 0xC0,  // .)......
                            /* 0410 */  0x95, 0xB7, 0x78, 0x2A, 0x59, 0x9D, 0x6F, 0x96,  // ..x*Y.o.
                            /* 0418 */  0x79, 0x1B, 0x5A, 0xDA, 0xD6, 0x94, 0xD0, 0xB8,  // y.Z.....
                            /* 0420 */  0x04, 0x50, 0x09, 0xFC, 0xC2, 0x96, 0xF8, 0x47,  // .P.....G
                            /* 0428 */  0xC3, 0xDB, 0x47, 0x42, 0x04, 0x70, 0x5E, 0x55,  // ..GB.p^U
                            /* 0430 */  0x3C, 0x37, 0x20, 0x7D, 0xAF, 0x24, 0x8E, 0x04,  // <7 }.$..
                            /* 0438 */  0xF0, 0xEE, 0xD6, 0xE4, 0xE4, 0x08, 0x40, 0xAF,  // ......@.
                            /* 0440 */  0xEE, 0xB7, 0x3C, 0xDE, 0x90, 0xEC, 0x88, 0xBD,  // ..<.....
                            /* 0448 */  0x00, 0x59, 0x38, 0xF2, 0xFA, 0x81, 0xB7, 0xD4,  // .Y8.....
                            /* 0450 */  0x08, 0x56, 0xA3, 0xA9, 0x66, 0xD9, 0x6D, 0x54,  // .V..f.mT
                            /* 0458 */  0xC3, 0x44, 0x20, 0x69, 0xE8, 0x5F, 0x85, 0xBD,  // .D i._..
                            /* 0460 */  0x48, 0xB7, 0xA1, 0xE1, 0xA4, 0x33, 0x1A, 0xBA,  // H....3..
                            /* 0468 */  0x1C, 0x92, 0x6C, 0x59, 0x91, 0x9F, 0x20, 0xFA,  // ..lY.. .
                            /* 0470 */  0x9E, 0x43, 0x11, 0xF5, 0x86, 0x49, 0x73, 0x6B,  // .C...Isk
                            /* 0478 */  0xBC, 0x81, 0x8C, 0x82, 0x29, 0x1F, 0xC4, 0xB7,  // ....)...
                            /* 0480 */  0x51, 0xF1, 0xBF, 0x2E, 0xAB, 0x61, 0x2E, 0xFB,  // Q....a..
                            /* 0488 */  0xA6, 0x18, 0xFD, 0x5D, 0x3F, 0xCC, 0x85, 0x73,  // ...]?..s
                            /* 0490 */  0x2D, 0x5C, 0xE7, 0x6F, 0x50, 0x3F, 0x20, 0xCC,  // -\.oP? .
                            /* 0498 */  0x67, 0x10, 0xD5, 0x73, 0xCB, 0xFC, 0xA6, 0xA3,  // g..s....
                            /* 04A0 */  0x3A, 0xC2, 0x16, 0xE2, 0x8B, 0xFB, 0xF0, 0xA5,  // :.......
                            /* 04A8 */  0xD7, 0x62, 0x95, 0x4E, 0x08, 0x14, 0x76, 0xB5,  // .b.N..v.
                            /* 04B0 */  0xCF, 0xC5, 0x45, 0xB5, 0xC0, 0x52, 0x18, 0x73,  // ..E..R.s
                            /* 04B8 */  0xF4, 0x00, 0xB3, 0xE9, 0xFC, 0x75, 0x48, 0xB7,  // .....uH.
                            /* 04C0 */  0x4C, 0xD5, 0x98, 0xFE, 0x67, 0x58, 0x66, 0xC1,  // L...gXf.
                            /* 04C8 */  0x87, 0x9B, 0xC1, 0x4A, 0xCE, 0xD8, 0x47, 0xDC,  // ...J..G.
                            /* 04D0 */  0x6F, 0x56, 0xB9, 0x90, 0x95, 0xA6, 0xE8, 0xF1,  // oV......
                            /* 04D8 */  0xAE, 0x21, 0xF6, 0xBC, 0x81, 0xBE, 0x6E, 0xCB,  // .!....n.
                            /* 04E0 */  0x3C, 0xF5, 0xBB, 0x81, 0x76, 0xBF, 0x8F, 0xD6,  // <...v...
                            /* 04E8 */  0x13, 0xF2, 0xAD, 0x7D, 0x31, 0xDA, 0xE7, 0x71,  // ...}1..q
                            /* 04F0 */  0xC2, 0x17, 0xDC, 0xA0, 0xA8, 0xDE, 0x80, 0x83,  // ........
                            /* 04F8 */  0x49, 0x65, 0xE3, 0xEC, 0x2B, 0x65, 0x72, 0x1D,  // Ie..+er.
                            /* 0500 */  0x99, 0x2D, 0x2F, 0x18, 0x97, 0xBE, 0x81, 0x34,  // .-/....4
                            /* 0508 */  0x88, 0x19, 0xA4, 0xF5, 0x3A, 0xA4, 0x59, 0x67,  // ....:.Yg
                            /* 0510 */  0x5A, 0xF6, 0x87, 0xE4, 0x76, 0xC8, 0x75, 0xAD,  // Z...v.u.
                            /* 0518 */  0xDC, 0xB6, 0xA8, 0xB1, 0x23, 0x8F, 0xA6, 0x4B,  // ....#..K
                            /* 0520 */  0x94, 0xD5, 0x30, 0x91, 0xFE, 0xE5, 0xA7, 0x05,  // ..0.....
                            /* 0528 */  0x1F, 0x74, 0x00, 0x28, 0x04, 0xAE, 0xB8, 0x5C,  // .t.(...\
                            /* 0530 */  0xC4, 0x53, 0xC8, 0x12, 0x5F, 0x5C, 0x4C, 0x82,  // .S.._\L.
                            /* 0538 */  0x01, 0x13, 0x3A, 0x83, 0x1C, 0x73, 0xEA, 0x91,  // ..:..s..
                            /* 0540 */  0x91, 0x81, 0x48, 0x96, 0xB1, 0x90, 0x71, 0x53,  // ..H...qS
                            /* 0548 */  0x5B, 0xB1, 0x04, 0x4F, 0xE5, 0x9B, 0xDD, 0x77,  // [..O...w
                            /* 0550 */  0x31, 0x9F, 0x56, 0x14, 0x6C, 0x22, 0xA3, 0xD2,  // 1.V.l"..
                            /* 0558 */  0x33, 0x7D, 0x22, 0x09, 0x58, 0x9E, 0x0B, 0x99,  // 3}".X...
                            /* 0560 */  0xDB, 0x4C, 0xDD, 0x9F, 0x7E, 0x5E, 0xA7, 0x72,  // .L..~^.r
                            /* 0568 */  0x53, 0x13, 0xFB, 0x68, 0xEC, 0xD9, 0xE6, 0x03,  // S..h....
                            /* 0570 */  0xA0, 0x28, 0x6B, 0xC5, 0x22, 0x1F, 0xAF, 0x65,  // .(k."..e
                            /* 0578 */  0xFC, 0x21, 0x5D, 0x1C, 0x09, 0x1E, 0x0A, 0x61,  // .!]....a
                            /* 0580 */  0x34, 0xCD, 0xD0, 0x64, 0xA6, 0xCD, 0x1D, 0x82,  // 4..d....
                            /* 0588 */  0x4A, 0x50, 0xCD, 0xA5, 0xF3, 0xE8, 0x3C, 0x84,  // JP....<.
                            /* 0590 */  0xD4, 0x60, 0x7B, 0xE1, 0x0E, 0x04, 0x55, 0x74,  // .`{...Ut
                            /* 0598 */  0xB7, 0x42, 0x3E, 0xC6, 0xD5, 0x00, 0xB2, 0x86,  // .B>.....
                            /* 05A0 */  0x3D, 0xC0, 0xFD, 0x05, 0x22, 0x67, 0x6C, 0xEE,  // =..."gl.
                            /* 05A8 */  0xC3, 0x13, 0x71, 0xB8, 0x7E, 0xC9, 0xB0, 0xBE,  // ..q.~...
                            /* 05B0 */  0xF6, 0x97, 0xBA, 0x24, 0x12, 0x8C, 0x49, 0xE0,  // ...$..I.
                            /* 05B8 */  0xFD, 0x67, 0x41, 0x49, 0xA1, 0x0B, 0x7E, 0x78,  // .gAI..~x
                            /* 05C0 */  0xFF, 0x79, 0x4D, 0xE0, 0xD6, 0xFB, 0xA6, 0xAE,  // .yM.....
                            /* 05C8 */  0xF3, 0x64, 0x45, 0x39, 0x85, 0xDD, 0x1B, 0xD5,  // .dE9....
                            /* 05D0 */  0x18, 0xE1, 0x31, 0x7F, 0xED, 0x77, 0x7C, 0x76,  // ..1..w|v
                            /* 05D8 */  0x21, 0x01, 0x59, 0x7A, 0x69, 0x43, 0x24, 0x75,  // !.YziC$u
                            /* 05E0 */  0xDB, 0xA5, 0xAB, 0xE8, 0xCB, 0xCE, 0x8A, 0xC3,  // ........
                            /* 05E8 */  0xF7, 0xEB, 0xB7, 0x60, 0x5D, 0xB7, 0x6C, 0x1D,  // ...`].l.
                            /* 05F0 */  0x90, 0xE5, 0xED, 0xFB, 0x06, 0x13, 0x62, 0xD9,  // ......b.
                            /* 05F8 */  0xA8, 0xA5, 0xDE, 0x67, 0xB9, 0x07, 0x86, 0x75,  // ...g...u
                            /* 0600 */  0xFD, 0x23, 0xEF, 0x64, 0xC5, 0x53, 0x6A, 0xC1,  // .#.d.Sj.
                            /* 0608 */  0xA0, 0x61, 0xF0, 0x0A, 0xA9, 0x98, 0x78, 0x19,  // .a....x.
                            /* 0610 */  0xEB, 0x8C, 0xF5, 0x79, 0xD1, 0x05, 0xB6, 0x74,  // ...y...t
                            /* 0618 */  0x47, 0xFF, 0xDC, 0x46, 0xD5, 0x1B, 0x2D, 0x79,  // G..F..-y
                            /* 0620 */  0x90, 0x9D, 0x92, 0xA1, 0xCF, 0x6E, 0xA8, 0x4F,  // .....n.O
                            /* 0628 */  0x96, 0x25, 0x03, 0xE6, 0x71, 0x0D, 0xA0, 0x24,  // .%..q..$
                            /* 0630 */  0x3F, 0xDF, 0x84, 0x41, 0x0B, 0x79, 0xA5, 0x11,  // ?..A.y..
                            /* 0638 */  0xD0, 0xDC, 0x89, 0x0C, 0xDA, 0x1C, 0x9B, 0x3D,  // .......=
                            /* 0640 */  0x9C, 0xD0, 0x1B, 0x1E, 0xE5, 0xDF, 0xB4, 0x32,  // .......2
                            /* 0648 */  0x60, 0x86, 0xF8, 0x83, 0x0E, 0x5F, 0x55, 0x3E,  // `...._U>
                            /* 0650 */  0x43, 0x49, 0x65, 0x89, 0xDC, 0x1E, 0xB7, 0x18,  // CIe.....
                            /* 0658 */  0x3D, 0x0C, 0xCF, 0xAF, 0x7D, 0x96, 0x7C, 0x71,  // =...}.|q
                            /* 0660 */  0x20, 0xDB, 0xD5, 0xE2, 0x96, 0xB8, 0xFB, 0x7F,  //  .......
                            /* 0668 */  0xA4, 0xAB, 0xFD, 0x6B, 0x49, 0xD8, 0x9C, 0x97,  // ...kI...
                            /* 0670 */  0x9F, 0x08, 0x5A, 0x03, 0x7F, 0x19, 0xF4, 0x7B,  // ..Z....{
                            /* 0678 */  0xA5, 0x8C, 0x96, 0xF6, 0xA1, 0x4C, 0x3E, 0x0D,  // .....L>.
                            /* 0680 */  0xE5, 0x62, 0x25, 0x02, 0x95, 0x91, 0xF2, 0xA2,  // .b%.....
                            /* 0688 */  0x63, 0x34, 0xEC, 0xFB, 0x8E, 0x9E, 0xCC, 0xEC,  // c4......
                            /* 0690 */  0x72, 0xF1, 0x12, 0xB3, 0x9A, 0x8F, 0x76, 0x2D,  // r.....v-
                            /* 0698 */  0xE8, 0x42, 0x7D, 0x22, 0x28, 0xB6, 0x8A, 0x62,  // .B}"(..b
                            /* 06A0 */  0xDA, 0x6B, 0xAF, 0x4A, 0xB1, 0x81, 0x12, 0x1F,  // .k.J....
                            /* 06A8 */  0xE9, 0x5B, 0x19, 0xD0, 0x5C, 0x0D, 0x9E, 0xC9,  // .[..\...
                            /* 06B0 */  0x84, 0x9A, 0xA2, 0xFF, 0x08, 0x5F, 0xE0, 0x05,  // ....._..
                            /* 06B8 */  0xBE, 0xE1, 0xBE, 0x27, 0x0F, 0x0E, 0x59, 0xAC,  // ...'..Y.
                            /* 06C0 */  0xC0, 0x51, 0xF8, 0xEE, 0x56, 0x02, 0x5B, 0x2B,  // .Q..V.[+
                            /* 06C8 */  0x2E, 0xD2, 0x6A, 0xD4, 0x31, 0x1F, 0xE0, 0x2A,  // ..j.1..*
                            /* 06D0 */  0xA7, 0x0E, 0xF2, 0xA9, 0x1C, 0xE5, 0xCA, 0x36,  // .......6
                            /* 06D8 */  0x21, 0xEB, 0x40, 0x94, 0x12, 0x84, 0xDE, 0xDA,  // !.@.....
                            /* 06E0 */  0x3F, 0xE6, 0xF1, 0x4C, 0xF6, 0xBB, 0x9A, 0x0A,  // ?..L....
                            /* 06E8 */  0x2B, 0xAB, 0x34, 0xCA, 0x18, 0x74, 0x28, 0x85,  // +.4..t(.
                            /* 06F0 */  0x59, 0xD6, 0x3A, 0x6C, 0xC9, 0x0C, 0x75, 0x20,  // Y.:l..u 
                            /* 06F8 */  0xBC, 0x2B, 0xD6, 0x7D, 0x9F, 0xBB, 0x29, 0x99,  // .+.}..).
                            /* 0700 */  0x95, 0x15, 0xB3, 0xBC, 0x80, 0x65, 0x14, 0x40,  // .....e.@
                            /* 0708 */  0x4B, 0x2B, 0xD9, 0x2D, 0xD8, 0xF9, 0x54, 0xBA,  // K+.-..T.
                            /* 0710 */  0x46, 0x5D, 0x9E, 0x60, 0x8E, 0x51, 0x6D, 0x3B,  // F].`.Qm;
                            /* 0718 */  0x6F, 0x4F, 0x67, 0x42, 0x71, 0xC9, 0xC9, 0x66,  // oOgBq..f
                            /* 0720 */  0x58, 0xD4, 0xBD, 0x7B, 0x08, 0x76, 0x0A, 0xC2,  // X..{.v..
                            /* 0728 */  0x5B, 0x74, 0xB8, 0x79, 0xB0, 0xE3, 0x5B, 0x5B,  // [t.y..[[
                            /* 0730 */  0xB4, 0xD5, 0xFD, 0xEB, 0x41, 0xDB, 0xB4, 0x0B,  // ....A...
                            /* 0738 */  0x1C, 0x7D, 0xF5, 0xE6, 0xD9, 0x3F, 0xEA, 0x67,  // .}...?.g
                            /* 0740 */  0x2C, 0x5A, 0xBB, 0x32, 0x7E, 0x1B, 0xC4, 0x86,  // ,Z.2~...
                            /* 0748 */  0x4E, 0xAA, 0x6F, 0xF8, 0xA1, 0x2F, 0x2D, 0x92,  // N.o../-.
                            /* 0750 */  0x48, 0xF0, 0xCB, 0x12, 0x80, 0x49, 0x84, 0xFB,  // H....I..
                            /* 0758 */  0x9D, 0x9A, 0x95, 0x41, 0x4D, 0x20, 0x4F, 0x5A,  // ...AM OZ
                            /* 0760 */  0xAE, 0x29, 0xAE, 0x40, 0x76, 0x99, 0x1E, 0x87,  // .).@v...
                            /* 0768 */  0x9D, 0x83, 0x5A, 0x91, 0xB0, 0x76, 0x52, 0x92,  // ..Z..vR.
                            /* 0770 */  0x5B, 0xB5, 0xF5, 0x53, 0xA1, 0x88, 0x91, 0x5F,  // [..S..._
                            /* 0778 */  0x5B, 0xD6, 0xED, 0x80, 0x70, 0x0C, 0x50, 0xA1,  // [...p.P.
                            /* 0780 */  0xB5, 0x93, 0xD1, 0xB8, 0xC9, 0x6D, 0xA4, 0xC2,  // .....m..
                            /* 0788 */  0x1E, 0x9E, 0xD9, 0x62, 0x30, 0x5E, 0x02, 0xC9,  // ...b0^..
                            /* 0790 */  0xDE, 0xB9, 0xEB, 0x91, 0xFB, 0xA6, 0xD5, 0x2C,  // .......,
                            /* 0798 */  0xEC, 0xBC, 0x17, 0xA0, 0x0B, 0xB7, 0x9D, 0xCA,  // ........
                            /* 07A0 */  0x0D, 0x7C, 0x95, 0xCE, 0xE0, 0x2D, 0xCF, 0x82,  // .|...-..
                            /* 07A8 */  0x99, 0x1C, 0x33, 0xAF, 0x32, 0xD8, 0xE2, 0xAB,  // ..3.2...
                            /* 07B0 */  0xEF, 0x3E, 0x77, 0x08, 0xE8, 0xD0, 0x28, 0xAE,  // .>w...(.
                            /* 07B8 */  0x36, 0x4D, 0x17, 0x61, 0xDB, 0xDC, 0x2D, 0x03,  // 6M.a..-.
                            /* 07C0 */  0x05, 0x3A, 0xC3, 0x44, 0xBF, 0x5D, 0x5B, 0x75,  // .:.D.][u
                            /* 07C8 */  0xDC, 0xB3, 0x5D, 0xED, 0x61, 0xB0, 0x2A, 0xED,  // ..].a.*.
                            /* 07D0 */  0xA6, 0x11, 0xE2, 0x24, 0xF7, 0x7D, 0xCB, 0xC9,  // ...$.}..
                            /* 07D8 */  0x5B, 0xBF, 0x91, 0x0C, 0xAF, 0xD5, 0xDD, 0x96,  // [.......
                            /* 07E0 */  0x13, 0x89, 0xE2, 0x40, 0x57, 0x7D, 0x69, 0x22,  // ...@W}i"
                            /* 07E8 */  0x87, 0x4B, 0x12, 0x77, 0x12, 0x0E, 0xE6, 0xC0,  // .K.w....
                            /* 07F0 */  0x7A, 0x56, 0x2A, 0xCE, 0x0D, 0x95, 0xFB, 0x17,  // zV*.....
                            /* 07F8 */  0x37, 0x3F, 0x79, 0x67, 0xAE, 0x17, 0xF2, 0xF2,  // 7?yg....
                            /* 0800 */  0xE9, 0x3A, 0xA5, 0xD9, 0x69, 0x06, 0xA9, 0xEB,  // .:..i...
                            /* 0808 */  0xD1, 0x01, 0x3E, 0x9B, 0x4F, 0x25, 0xE6, 0xA6,  // ..>.O%..
                            /* 0810 */  0x8A, 0x53, 0x60, 0x43, 0xEC, 0x4E, 0x98, 0xBB,  // .S`C.N..
                            /* 0818 */  0xCA, 0x20, 0x25, 0x23, 0x03, 0xEA, 0xCC, 0xA0,  // . %#....
                            /* 0820 */  0xEE, 0x01, 0x3D, 0x82, 0x72, 0xC8, 0x27, 0x4F,  // ..=.r.'O
                            /* 0828 */  0x36, 0x0C, 0x59, 0xA8, 0x57, 0xF6, 0xBF, 0xAF,  // 6.Y.W...
                            /* 0830 */  0xA2, 0x00, 0xB4, 0xE3, 0x12, 0xBE, 0x05, 0x7F,  // ........
                            /* 0838 */  0xAF, 0x36, 0x24, 0x03, 0x3D, 0xB9, 0xE4, 0x87,  // .6$.=...
                            /* 0840 */  0x74, 0x4E, 0xFB, 0x2B, 0x7D, 0x85, 0x9A, 0xBF,  // tN.+}...
                            /* 0848 */  0x61, 0x8C, 0x67, 0xD1, 0x34, 0xDA, 0xA0, 0x35,  // a.g.4..5
                            /* 0850 */  0xDD, 0x1F, 0xEE, 0x42, 0x62, 0xA9, 0xD2, 0x7E,  // ...Bb..~
                            /* 0858 */  0x4E, 0xF5, 0xB8, 0x7C, 0x3D, 0xC4, 0xD3, 0x6A,  // N..|=..j
                            /* 0860 */  0x5A, 0xF2, 0x2C, 0x99, 0x56, 0xAE, 0xD6, 0x27,  // Z.,.V..'
                            /* 0868 */  0x60, 0x6F, 0xBC, 0xAE, 0x3D, 0xE3, 0x64, 0x36,  // `o..=.d6
                            /* 0870 */  0x8C, 0xB9, 0xD3, 0x8A, 0xA2, 0xE3, 0x97, 0xD1,  // ........
                            /* 0878 */  0xB5, 0xA6, 0x76, 0xC4, 0x62, 0x71, 0xC8, 0xD2,  // ..v.bq..
                            /* 0880 */  0xEF, 0x61, 0x4D, 0xD8, 0xEF, 0x8A, 0xE6, 0xB8,  // .aM.....
                            /* 0888 */  0x07, 0xA7, 0x12, 0xE0, 0x75, 0xC0, 0x81, 0xC0,  // ....u...
                            /* 0890 */  0x9D, 0xE2, 0x88, 0x73, 0xA5, 0x96, 0xA8, 0xC7,  // ...s....
                            /* 0898 */  0xE5, 0xDD, 0xE9, 0x47, 0xD1, 0xB0, 0xD7, 0x8A,  // ...G....
                            /* 08A0 */  0x8E, 0x4C, 0x43, 0xEC, 0xB6, 0x07, 0xA3, 0x4A,  // .LC....J
                            /* 08A8 */  0xF0, 0xD6, 0x08, 0xAD, 0x8C, 0x63, 0x63, 0x59,  // .....ccY
                            /* 08B0 */  0xD3, 0xB5, 0xFC, 0x46, 0x08, 0xF6, 0x36, 0x04,  // ...F..6.
                            /* 08B8 */  0xE3, 0x8C, 0xA7, 0xD7, 0xC4, 0x64, 0x26, 0xBC,  // .....d&.
                            /* 08C0 */  0xF6, 0x0A, 0xFD, 0xD8, 0xCA, 0xAD, 0x1D, 0xB2,  // ........
                            /* 08C8 */  0xAE, 0x04, 0xD3, 0x47, 0xD4, 0x59, 0xF5, 0xFC,  // ...G.Y..
                            /* 08D0 */  0xCE, 0xD1, 0x6C, 0x51, 0x48, 0xB2, 0x52, 0xF5,  // ..lQH.R.
                            /* 08D8 */  0xF1, 0x65, 0x38, 0x1A, 0xF2, 0x27, 0x68, 0xA7,  // .e8..'h.
                            /* 08E0 */  0x49, 0xEE, 0xB7, 0x70, 0x6F, 0x4F, 0xB7, 0x62,  // I..poO.b
                            /* 08E8 */  0xEF, 0x4D, 0xC4, 0x6C, 0xA4, 0x80, 0x76, 0x6F,  // .M.l..vo
                            /* 08F0 */  0x44, 0x3C, 0x19, 0xDA, 0xA3, 0x23, 0xC2, 0x63,  // D<...#.c
                            /* 08F8 */  0x46, 0x28, 0x92, 0x2E, 0xEF, 0x16, 0x4B, 0xF2,  // F(....K.
                            /* 0900 */  0x56, 0x44, 0x8C, 0xEF, 0x32, 0xBC, 0x9A, 0x82,  // VD..2...
                            /* 0908 */  0xF1, 0xEE, 0x63, 0x25, 0x28, 0x56, 0x1E, 0x55,  // ..c%(V.U
                            /* 0910 */  0x18, 0xC4, 0x6D, 0x2D, 0x66, 0x16, 0x11, 0x0C,  // ..m-f...
                            /* 0918 */  0x7F, 0x0B, 0x30, 0xAE, 0xB2, 0xA8, 0x9A, 0x6B,  // ..0....k
                            /* 0920 */  0x64, 0xAF, 0x5D, 0x26, 0xDF, 0x72, 0x07, 0x50,  // d.]&.r.P
                            /* 0928 */  0x98, 0xA5, 0xF9, 0xC2, 0x48, 0x86, 0xA5, 0x26,  // ....H..&
                            /* 0930 */  0x24, 0xCF, 0xAE, 0x5D, 0x80, 0x2A, 0x48, 0x21,  // $..].*H!
                            /* 0938 */  0x92, 0xC3, 0xE9, 0xFE, 0x46, 0x93, 0xCD, 0x2E,  // ....F...
                            /* 0940 */  0x68, 0xCA, 0x03, 0x47, 0xBB, 0x61, 0x70, 0xEB,  // h..G.ap.
                            /* 0948 */  0x10, 0x99, 0x98, 0xA0, 0xCA, 0x7C, 0xDF, 0xC0,  // .....|..
                            /* 0950 */  0xFF, 0xF4, 0x85, 0xB0, 0x23, 0x62               // ....#b
                        }
                    })
                }

                If ((\PJID == 0x04))
                {
                    If ((\CPUF == 0x05))
                    {
                        Return (Package (0x01)
                        {
                            Buffer (0x0C61)
                            {
                                /* 0000 */  0xE5, 0x1F, 0x94, 0x00, 0x00, 0x00, 0x00, 0x02,  // ........
                                /* 0008 */  0x00, 0x00, 0x00, 0x40, 0x67, 0x64, 0x64, 0x76,  // ...@gddv
                                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x4F, 0x45, 0x4D, 0x20,  // ....OEM 
                                /* 0030 */  0x45, 0x78, 0x70, 0x6F, 0x72, 0x74, 0x65, 0x64,  // Exported
                                /* 0038 */  0x20, 0x44, 0x61, 0x74, 0x61, 0x56, 0x61, 0x75,  //  DataVau
                                /* 0040 */  0x6C, 0x74, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // lt......
                                /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0068 */  0x00, 0x00, 0x00, 0x00, 0x55, 0x03, 0xF5, 0x7B,  // ....U..{
                                /* 0070 */  0x9A, 0x80, 0xDE, 0x2F, 0x84, 0xA1, 0x1A, 0x92,  // .../....
                                /* 0078 */  0xB8, 0xA4, 0xC8, 0xC9, 0x97, 0x4B, 0x6B, 0xC3,  // .....Kk.
                                /* 0080 */  0xDE, 0x96, 0x2B, 0xCB, 0x7D, 0x70, 0xEF, 0x7E,  // ..+.}p.~
                                /* 0088 */  0x6D, 0x5E, 0xA2, 0xD2, 0xCD, 0x0B, 0x00, 0x00,  // m^......
                                /* 0090 */  0x52, 0x45, 0x50, 0x4F, 0x5D, 0x00, 0x00, 0x00,  // REPO]...
                                /* 0098 */  0x01, 0xCD, 0x1B, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 00A0 */  0x00, 0x00, 0x72, 0x87, 0xCD, 0xFF, 0x6D, 0x24,  // ..r...m$
                                /* 00A8 */  0x47, 0xDB, 0x3D, 0x24, 0x92, 0xB4, 0x16, 0x6F,  // G.=$...o
                                /* 00B0 */  0x45, 0xD8, 0xC3, 0xF5, 0x66, 0x14, 0x9F, 0x22,  // E...f.."
                                /* 00B8 */  0xD7, 0xF7, 0xDE, 0x67, 0x90, 0x9A, 0xA2, 0x0D,  // ...g....
                                /* 00C0 */  0x39, 0x25, 0xAD, 0xC3, 0x1A, 0xAD, 0x52, 0x0B,  // 9%....R.
                                /* 00C8 */  0x75, 0x38, 0xE1, 0xA4, 0x14, 0x42, 0xB9, 0x8C,  // u8...B..
                                /* 00D0 */  0x2A, 0x27, 0x78, 0xCE, 0x5C, 0xD4, 0x2E, 0x50,  // *'x.\..P
                                /* 00D8 */  0xD4, 0x37, 0xD4, 0x20, 0x17, 0x72, 0xA6, 0x67,  // .7. .r.g
                                /* 00E0 */  0x10, 0x4F, 0xD4, 0xBA, 0x12, 0x65, 0x58, 0x14,  // .O...eX.
                                /* 00E8 */  0xC0, 0x54, 0xA9, 0x61, 0x77, 0x8B, 0xBB, 0x39,  // .T.aw..9
                                /* 00F0 */  0x91, 0x7A, 0xA4, 0xEF, 0x9D, 0x9B, 0xD7, 0x0F,  // .z......
                                /* 00F8 */  0xDA, 0x9B, 0x32, 0xE8, 0x94, 0x12, 0x44, 0x38,  // ..2...D8
                                /* 0100 */  0x08, 0xC7, 0x84, 0xEA, 0x75, 0x68, 0x0D, 0xD3,  // ....uh..
                                /* 0108 */  0x72, 0x0B, 0xAD, 0xD4, 0x9A, 0xCE, 0x44, 0xB3,  // r.....D.
                                /* 0110 */  0x70, 0x33, 0x1C, 0x53, 0x2F, 0x1C, 0x9D, 0x3B,  // p3.S/..;
                                /* 0118 */  0xAA, 0x74, 0x3C, 0xB7, 0x57, 0x0A, 0x68, 0xEB,  // .t<.W.h.
                                /* 0120 */  0x50, 0x2F, 0x76, 0xDE, 0xA5, 0x19, 0x33, 0xC8,  // P/v...3.
                                /* 0128 */  0x43, 0x62, 0x56, 0x5F, 0x09, 0xCE, 0xC1, 0xD0,  // CbV_....
                                /* 0130 */  0x48, 0x09, 0x6D, 0xD6, 0x74, 0xEB, 0x87, 0x24,  // H.m.t..$
                                /* 0138 */  0x28, 0x09, 0xEC, 0x74, 0x1D, 0x4E, 0x66, 0x58,  // (..t.NfX
                                /* 0140 */  0x09, 0x99, 0xB4, 0xF8, 0xA2, 0xF6, 0x0D, 0xA8,  // ........
                                /* 0148 */  0x32, 0x15, 0x96, 0xB8, 0x33, 0x7B, 0xA7, 0x6B,  // 2...3{.k
                                /* 0150 */  0xCB, 0x9B, 0x80, 0x21, 0xD4, 0x42, 0xD1, 0x53,  // ...!.B.S
                                /* 0158 */  0x65, 0x13, 0x81, 0x04, 0x36, 0x7B, 0xC3, 0x6B,  // e...6{.k
                                /* 0160 */  0xBC, 0xC8, 0xBC, 0xE4, 0x99, 0xFE, 0x7B, 0xE9,  // ......{.
                                /* 0168 */  0x6D, 0xD0, 0x11, 0x00, 0x34, 0x9D, 0xCB, 0xE1,  // m...4...
                                /* 0170 */  0xB2, 0x54, 0x84, 0x08, 0x72, 0x4F, 0x81, 0xA3,  // .T..rO..
                                /* 0178 */  0xBE, 0xB4, 0x4E, 0x65, 0x31, 0x30, 0x16, 0x65,  // ..Ne10.e
                                /* 0180 */  0x2F, 0x79, 0x68, 0x4E, 0x2C, 0x3D, 0xFE, 0x6E,  // /yhN,=.n
                                /* 0188 */  0x45, 0x94, 0x8A, 0xC8, 0x7E, 0x7A, 0x6F, 0x20,  // E...~zo 
                                /* 0190 */  0x98, 0x29, 0x2F, 0xA0, 0xB1, 0xCC, 0x1A, 0xFB,  // .)/.....
                                /* 0198 */  0x19, 0x13, 0xD3, 0xDE, 0x0F, 0xC3, 0x6D, 0x39,  // ......m9
                                /* 01A0 */  0x2B, 0xCD, 0x48, 0xC8, 0xD3, 0x6F, 0x79, 0x52,  // +.H..oyR
                                /* 01A8 */  0x42, 0xB9, 0x86, 0xCC, 0x2D, 0x42, 0x14, 0xF2,  // B...-B..
                                /* 01B0 */  0x88, 0x13, 0x2D, 0x81, 0xE4, 0x46, 0xB0, 0x45,  // ..-..F.E
                                /* 01B8 */  0x83, 0xE6, 0xB2, 0xA4, 0x22, 0xF2, 0x77, 0xC9,  // ....".w.
                                /* 01C0 */  0xF7, 0xBF, 0xD6, 0x7F, 0xF2, 0x70, 0xC5, 0x72,  // .....p.r
                                /* 01C8 */  0x6E, 0x3B, 0xD5, 0x83, 0x96, 0xDC, 0x46, 0xD4,  // n;....F.
                                /* 01D0 */  0x25, 0x78, 0xE0, 0xD4, 0xA3, 0x82, 0x67, 0xE2,  // %x....g.
                                /* 01D8 */  0xD6, 0x17, 0x8F, 0x4D, 0xB8, 0x4E, 0xD0, 0x4B,  // ...M.N.K
                                /* 01E0 */  0x78, 0xA5, 0x26, 0xC4, 0x90, 0xCE, 0x32, 0x30,  // x.&...20
                                /* 01E8 */  0x75, 0xFE, 0xE5, 0xA4, 0xCB, 0x3D, 0x34, 0xF6,  // u....=4.
                                /* 01F0 */  0x8C, 0x30, 0x6B, 0xFF, 0xE5, 0xD9, 0xF1, 0x18,  // .0k.....
                                /* 01F8 */  0x73, 0xC6, 0x06, 0xA0, 0x7E, 0x97, 0xF9, 0xFC,  // s...~...
                                /* 0200 */  0x43, 0x58, 0xA3, 0x3F, 0x7B, 0x11, 0xCC, 0x0A,  // CX.?{...
                                /* 0208 */  0xB8, 0x08, 0x1A, 0xAB, 0x6A, 0x9C, 0x64, 0xDB,  // ....j.d.
                                /* 0210 */  0xF4, 0xDE, 0xE9, 0x36, 0x7F, 0x44, 0x86, 0x6C,  // ...6.D.l
                                /* 0218 */  0x67, 0x6E, 0x89, 0xD4, 0x1E, 0x33, 0x06, 0xD4,  // gn...3..
                                /* 0220 */  0xC4, 0x48, 0xBA, 0xA8, 0x22, 0x99, 0xAA, 0xE3,  // .H.."...
                                /* 0228 */  0x2D, 0x81, 0x79, 0xC6, 0xB2, 0xA1, 0x3B, 0xA3,  // -.y...;.
                                /* 0230 */  0x9E, 0xE0, 0xA5, 0x38, 0x1A, 0x2F, 0xC8, 0x51,  // ...8./.Q
                                /* 0238 */  0x6B, 0x36, 0xE9, 0x83, 0x44, 0x75, 0x33, 0xC6,  // k6..Du3.
                                /* 0240 */  0x98, 0xF5, 0x7D, 0x6E, 0xDC, 0x2B, 0x7A, 0x8B,  // ..}n.+z.
                                /* 0248 */  0x8B, 0xAA, 0xB5, 0x48, 0xAF, 0x39, 0xA5, 0xB9,  // ...H.9..
                                /* 0250 */  0x1E, 0x79, 0xC7, 0xC7, 0xC5, 0xCD, 0x6D, 0xC5,  // .y....m.
                                /* 0258 */  0x93, 0x8D, 0x2A, 0xA2, 0x27, 0xBD, 0xB3, 0x72,  // ..*.'..r
                                /* 0260 */  0x2D, 0xE1, 0xB8, 0x9D, 0x30, 0x9C, 0x80, 0xC2,  // -...0...
                                /* 0268 */  0x9F, 0xD3, 0xA0, 0x05, 0xFF, 0x2B, 0xDD, 0x84,  // .....+..
                                /* 0270 */  0xC1, 0xAC, 0xB4, 0xCC, 0x0F, 0x9F, 0x20, 0x11,  // ...... .
                                /* 0278 */  0xE1, 0x11, 0x4D, 0x9A, 0xF7, 0xD3, 0x93, 0xC2,  // ..M.....
                                /* 0280 */  0x72, 0x72, 0xCC, 0x54, 0x26, 0x08, 0x1D, 0xF4,  // rr.T&...
                                /* 0288 */  0x9C, 0x71, 0x80, 0xA8, 0xD5, 0x80, 0x23, 0x0F,  // .q....#.
                                /* 0290 */  0x56, 0x50, 0xBF, 0x43, 0x4C, 0x8A, 0x8F, 0xA9,  // VP.CL...
                                /* 0298 */  0x6B, 0xA9, 0xC9, 0x19, 0x4D, 0xFB, 0xED, 0xD6,  // k...M...
                                /* 02A0 */  0x77, 0x69, 0xCE, 0x85, 0xC1, 0x4F, 0x44, 0xCB,  // wi...OD.
                                /* 02A8 */  0xE9, 0xE3, 0x4D, 0xA6, 0x0B, 0xA2, 0xB9, 0x7C,  // ..M....|
                                /* 02B0 */  0x5A, 0x50, 0x77, 0x4D, 0x75, 0x64, 0x5A, 0xF7,  // ZPwMudZ.
                                /* 02B8 */  0xDC, 0x8E, 0xEE, 0xB8, 0xEF, 0x1C, 0xEF, 0x27,  // .......'
                                /* 02C0 */  0xD2, 0x9D, 0xD3, 0x1E, 0x24, 0xDA, 0xE0, 0x02,  // ....$...
                                /* 02C8 */  0x30, 0xE0, 0x4A, 0xA5, 0xDC, 0x3F, 0x4B, 0xC8,  // 0.J..?K.
                                /* 02D0 */  0xED, 0x27, 0x68, 0xF9, 0x8E, 0x60, 0xD7, 0x2A,  // .'h..`.*
                                /* 02D8 */  0xED, 0x2A, 0xB9, 0x7D, 0x89, 0xD3, 0x2D, 0x6F,  // .*.}..-o
                                /* 02E0 */  0x45, 0xBC, 0x4F, 0xEE, 0x25, 0x6B, 0xE9, 0x0E,  // E.O.%k..
                                /* 02E8 */  0xD2, 0x20, 0x4A, 0x07, 0xA7, 0x4B, 0x3A, 0x74,  // . J..K:t
                                /* 02F0 */  0xAE, 0x09, 0x27, 0x48, 0x83, 0x63, 0x40, 0xD3,  // ..'H.c@.
                                /* 02F8 */  0xA8, 0x06, 0x1B, 0x10, 0x13, 0x7A, 0xB9, 0x61,  // .....z.a
                                /* 0300 */  0x4D, 0x00, 0x17, 0xEC, 0x42, 0xAF, 0x25, 0x25,  // M...B.%%
                                /* 0308 */  0xAD, 0xF1, 0x8E, 0x2E, 0x0A, 0x9C, 0x10, 0xC1,  // ........
                                /* 0310 */  0x23, 0xE3, 0xE8, 0x45, 0x29, 0x58, 0xC3, 0x46,  // #..E)X.F
                                /* 0318 */  0x2C, 0xE9, 0xD0, 0x2C, 0x84, 0x42, 0xB4, 0x46,  // ,..,.B.F
                                /* 0320 */  0x97, 0xEF, 0x16, 0x6D, 0x35, 0x4B, 0x92, 0xA1,  // ...m5K..
                                /* 0328 */  0xED, 0x2B, 0x76, 0x72, 0x74, 0x55, 0x1C, 0xB7,  // .+vrtU..
                                /* 0330 */  0x21, 0x0D, 0xCA, 0xF3, 0xC5, 0x4A, 0x2C, 0x5B,  // !....J,[
                                /* 0338 */  0x4B, 0x2B, 0x28, 0x10, 0xBA, 0xE6, 0x32, 0x89,  // K+(...2.
                                /* 0340 */  0xAE, 0x3E, 0x6A, 0x02, 0xE0, 0xCA, 0x5D, 0xE1,  // .>j...].
                                /* 0348 */  0x56, 0xE7, 0x1E, 0xDE, 0xF7, 0xEC, 0x13, 0x3F,  // V......?
                                /* 0350 */  0xD6, 0x77, 0x6B, 0x1C, 0x2F, 0xF3, 0x79, 0xC7,  // .wk./.y.
                                /* 0358 */  0x4C, 0x6B, 0x86, 0x26, 0xC2, 0x5B, 0xE2, 0xB8,  // Lk.&.[..
                                /* 0360 */  0xAF, 0xF8, 0x0E, 0x33, 0x4C, 0x13, 0x79, 0x46,  // ...3L.yF
                                /* 0368 */  0x10, 0x4E, 0x7C, 0xFA, 0x15, 0xDB, 0xE5, 0x1C,  // .N|.....
                                /* 0370 */  0x57, 0xEE, 0xC6, 0x43, 0x48, 0xFE, 0x4B, 0xDC,  // W..CH.K.
                                /* 0378 */  0x4A, 0x16, 0x9A, 0x92, 0x66, 0x78, 0x6D, 0x91,  // J...fxm.
                                /* 0380 */  0xD9, 0x5B, 0x3C, 0x7E, 0x3E, 0xCD, 0xEF, 0x90,  // .[<~>...
                                /* 0388 */  0x7A, 0x43, 0x65, 0x05, 0xA3, 0xCD, 0x6F, 0x7B,  // zCe...o{
                                /* 0390 */  0x7C, 0xF9, 0xEF, 0xAF, 0xBF, 0x50, 0xD1, 0x28,  // |....P.(
                                /* 0398 */  0x75, 0x10, 0x7E, 0x48, 0x98, 0x6D, 0x81, 0xC9,  // u.~H.m..
                                /* 03A0 */  0x1F, 0xDE, 0x7D, 0xBD, 0xFE, 0xD9, 0x8F, 0x1E,  // ..}.....
                                /* 03A8 */  0x5B, 0x21, 0x9D, 0x81, 0x6B, 0x0F, 0x2D, 0xA2,  // [!..k.-.
                                /* 03B0 */  0x54, 0x02, 0x5E, 0x1B, 0x26, 0x2D, 0x73, 0x44,  // T.^.&-sD
                                /* 03B8 */  0x52, 0x67, 0xAE, 0xA9, 0x1C, 0x67, 0x56, 0xBF,  // Rg...gV.
                                /* 03C0 */  0xA9, 0x78, 0xF1, 0xF9, 0x2E, 0xC3, 0x7E, 0x82,  // .x....~.
                                /* 03C8 */  0xB8, 0x62, 0x53, 0x6B, 0x90, 0x7C, 0x38, 0x34,  // .bSk.|84
                                /* 03D0 */  0x09, 0x11, 0x45, 0x2B, 0xBF, 0x9C, 0xA5, 0x7E,  // ..E+...~
                                /* 03D8 */  0xD7, 0x9B, 0x7E, 0x3D, 0x92, 0x07, 0xCF, 0x67,  // ..~=...g
                                /* 03E0 */  0xFB, 0xC8, 0xC2, 0xD9, 0x95, 0xA0, 0xFD, 0x71,  // .......q
                                /* 03E8 */  0x67, 0xB3, 0x7F, 0x4C, 0x94, 0x69, 0x9B, 0xBF,  // g..L.i..
                                /* 03F0 */  0x60, 0x90, 0x01, 0x31, 0x6F, 0xF6, 0x1F, 0xDF,  // `..1o...
                                /* 03F8 */  0xA8, 0xB8, 0xCE, 0xC8, 0xFD, 0x3C, 0xDA, 0xD0,  // .....<..
                                /* 0400 */  0x6D, 0xC6, 0x0C, 0xBE, 0x03, 0xAE, 0x0C, 0xF6,  // m.......
                                /* 0408 */  0x25, 0xCE, 0x32, 0xDD, 0xFF, 0x7D, 0x46, 0x9E,  // %.2..}F.
                                /* 0410 */  0x86, 0x88, 0xCA, 0x00, 0xA8, 0x89, 0x21, 0x66,  // ......!f
                                /* 0418 */  0xD3, 0x81, 0xB1, 0xFB, 0x35, 0x8F, 0xBC, 0xC6,  // ....5...
                                /* 0420 */  0xEC, 0xF8, 0x6C, 0xA2, 0xDC, 0xB7, 0x65, 0xA9,  // ..l...e.
                                /* 0428 */  0x54, 0xC8, 0xA7, 0x38, 0x76, 0x98, 0x38, 0xE0,  // T..8v.8.
                                /* 0430 */  0xF2, 0xF0, 0x73, 0x4B, 0xAD, 0x13, 0x2B, 0x1D,  // ..sK..+.
                                /* 0438 */  0x94, 0xF1, 0x3B, 0xA7, 0xCB, 0xB0, 0xF9, 0x45,  // ..;....E
                                /* 0440 */  0x08, 0xED, 0xFE, 0x92, 0x1F, 0x1B, 0xFF, 0x8D,  // ........
                                /* 0448 */  0xCD, 0x8B, 0xE0, 0x68, 0x8D, 0xAD, 0x83, 0xC1,  // ...h....
                                /* 0450 */  0x74, 0x8D, 0x3A, 0x7B, 0x56, 0x14, 0x33, 0x51,  // t.:{V.3Q
                                /* 0458 */  0xD9, 0xA2, 0x5C, 0xB8, 0x25, 0xA3, 0x2C, 0x8A,  // ..\.%.,.
                                /* 0460 */  0x28, 0x72, 0xC7, 0x1B, 0x0B, 0xCB, 0x03, 0x45,  // (r.....E
                                /* 0468 */  0x5F, 0x49, 0xB8, 0x2C, 0xD3, 0x6C, 0x38, 0x53,  // _I.,.l8S
                                /* 0470 */  0x92, 0xCA, 0xE8, 0x21, 0xF7, 0x7F, 0xDB, 0x7D,  // ...!...}
                                /* 0478 */  0x65, 0x6F, 0x13, 0x12, 0xA5, 0xF8, 0x69, 0x80,  // eo....i.
                                /* 0480 */  0x0C, 0x48, 0xEE, 0x26, 0x17, 0xCC, 0x55, 0x5A,  // .H.&..UZ
                                /* 0488 */  0x3F, 0xC8, 0x9B, 0xA2, 0x49, 0x11, 0xB2, 0x77,  // ?...I..w
                                /* 0490 */  0xC6, 0x38, 0xCC, 0x68, 0xB6, 0xEC, 0x69, 0x9A,  // .8.h..i.
                                /* 0498 */  0x15, 0x74, 0x50, 0xDB, 0x1A, 0xC5, 0x65, 0xBD,  // .tP...e.
                                /* 04A0 */  0xD4, 0x76, 0x63, 0x20, 0x9F, 0x1B, 0x70, 0x2E,  // .vc ..p.
                                /* 04A8 */  0xF8, 0xE6, 0x83, 0xAF, 0x77, 0x48, 0x92, 0x51,  // ....wH.Q
                                /* 04B0 */  0x00, 0x65, 0x0A, 0xE4, 0xA8, 0x4E, 0x98, 0xC1,  // .e...N..
                                /* 04B8 */  0x57, 0xA1, 0x3C, 0xCF, 0xE1, 0x79, 0x46, 0x75,  // W.<..yFu
                                /* 04C0 */  0x15, 0x12, 0x41, 0xA4, 0x50, 0xC7, 0x6D, 0x77,  // ..A.P.mw
                                /* 04C8 */  0xCA, 0x3B, 0x33, 0x2C, 0x21, 0xE2, 0x87, 0xC8,  // .;3,!...
                                /* 04D0 */  0x15, 0xA8, 0xBD, 0x43, 0x14, 0x22, 0xD7, 0x6D,  // ...C.".m
                                /* 04D8 */  0x86, 0xF0, 0xB9, 0x0D, 0xBF, 0x65, 0xA7, 0x6C,  // .....e.l
                                /* 04E0 */  0xB8, 0xAF, 0xB7, 0xF1, 0xB6, 0xE2, 0xCF, 0x43,  // .......C
                                /* 04E8 */  0xD3, 0x98, 0xAB, 0xBF, 0x0E, 0x61, 0x4C, 0x6A,  // .....aLj
                                /* 04F0 */  0x0D, 0xA4, 0xFA, 0x94, 0xF3, 0x1A, 0x65, 0xF8,  // ......e.
                                /* 04F8 */  0x3A, 0xAD, 0xA8, 0x36, 0x02, 0x03, 0xD0, 0xF4,  // :..6....
                                /* 0500 */  0xED, 0x91, 0xEC, 0x7E, 0x10, 0xB2, 0x2D, 0x59,  // ...~..-Y
                                /* 0508 */  0xC0, 0x43, 0xA2, 0x5D, 0x48, 0xEC, 0x17, 0x3F,  // .C.]H..?
                                /* 0510 */  0xCB, 0x4B, 0xEA, 0x8D, 0xCD, 0x07, 0x0D, 0xE4,  // .K......
                                /* 0518 */  0x84, 0x1E, 0xCB, 0x93, 0x98, 0x98, 0x27, 0xD0,  // ......'.
                                /* 0520 */  0xC1, 0x88, 0x4F, 0xFF, 0xC1, 0xAA, 0x7B, 0xBB,  // ..O...{.
                                /* 0528 */  0xB4, 0xC1, 0x84, 0x19, 0xDC, 0xBD, 0x25, 0x68,  // ......%h
                                /* 0530 */  0x83, 0x99, 0x51, 0x8D, 0x94, 0x1A, 0x05, 0x06,  // ..Q.....
                                /* 0538 */  0x9B, 0x64, 0x12, 0xDD, 0x9D, 0x4A, 0x92, 0xA6,  // .d...J..
                                /* 0540 */  0xB8, 0x0E, 0x0A, 0x3A, 0x6D, 0xD2, 0xD8, 0x46,  // ...:m..F
                                /* 0548 */  0x60, 0xCD, 0x23, 0x13, 0x96, 0xEA, 0x63, 0xFD,  // `.#...c.
                                /* 0550 */  0x20, 0x79, 0xE1, 0x46, 0xD9, 0x5F, 0xCC, 0xF9,  //  y.F._..
                                /* 0558 */  0xE5, 0x88, 0xC2, 0x71, 0x9E, 0x53, 0x89, 0x8D,  // ...q.S..
                                /* 0560 */  0x9B, 0x02, 0x09, 0x63, 0x56, 0x7B, 0xD3, 0x9B,  // ...cV{..
                                /* 0568 */  0x7C, 0xF1, 0xD7, 0x3C, 0xA8, 0xEF, 0xC1, 0xF6,  // |..<....
                                /* 0570 */  0xEF, 0xAE, 0xEB, 0x58, 0x76, 0x3F, 0xD4, 0xB6,  // ...Xv?..
                                /* 0578 */  0x31, 0x04, 0x76, 0x2A, 0xB8, 0xB4, 0x3F, 0x9E,  // 1.v*..?.
                                /* 0580 */  0xA4, 0xB6, 0x22, 0xB0, 0x88, 0x7C, 0xDE, 0xC5,  // .."..|..
                                /* 0588 */  0x07, 0xB7, 0xB8, 0x9F, 0xC9, 0x83, 0xEE, 0x68,  // .......h
                                /* 0590 */  0x2C, 0xB8, 0x93, 0x0E, 0xFB, 0x09, 0x58, 0xCC,  // ,.....X.
                                /* 0598 */  0x22, 0xD6, 0x08, 0x34, 0x93, 0x54, 0x0D, 0x0F,  // "..4.T..
                                /* 05A0 */  0x6E, 0x33, 0xD5, 0xCE, 0x13, 0xD7, 0x78, 0xA6,  // n3....x.
                                /* 05A8 */  0x21, 0x28, 0x13, 0x84, 0x4D, 0x71, 0xB0, 0xAF,  // !(..Mq..
                                /* 05B0 */  0xEE, 0xB7, 0x5D, 0xD4, 0x2D, 0x34, 0xC0, 0x47,  // ..].-4.G
                                /* 05B8 */  0xBE, 0x3A, 0x55, 0x7C, 0x44, 0x07, 0x57, 0x71,  // .:U|D.Wq
                                /* 05C0 */  0xFB, 0xE6, 0x03, 0x58, 0x94, 0xB1, 0xED, 0xB5,  // ...X....
                                /* 05C8 */  0xF7, 0x40, 0x8D, 0x24, 0x26, 0x58, 0x1A, 0x38,  // .@.$&X.8
                                /* 05D0 */  0xD1, 0xEC, 0x68, 0x61, 0x5E, 0x67, 0xB2, 0x63,  // ..ha^g.c
                                /* 05D8 */  0x3A, 0xE6, 0xAF, 0x13, 0x8A, 0x15, 0x83, 0x03,  // :.......
                                /* 05E0 */  0x5E, 0x01, 0xFA, 0xA1, 0xF1, 0xEC, 0x90, 0xA1,  // ^.......
                                /* 05E8 */  0x2B, 0x0F, 0xF7, 0xE3, 0x7F, 0xDE, 0x27, 0xAD,  // +.....'.
                                /* 05F0 */  0x55, 0xC2, 0x18, 0xCB, 0xFB, 0x20, 0x43, 0x8C,  // U.... C.
                                /* 05F8 */  0xBC, 0x3D, 0xB4, 0x33, 0xBA, 0x2A, 0x99, 0x51,  // .=.3.*.Q
                                /* 0600 */  0x1F, 0x26, 0xDE, 0xC9, 0xE3, 0x5B, 0xC4, 0x74,  // .&...[.t
                                /* 0608 */  0xB9, 0x71, 0xC0, 0x31, 0x4F, 0xB1, 0x51, 0xE2,  // .q.1O.Q.
                                /* 0610 */  0x67, 0x7C, 0xE6, 0x92, 0x53, 0xDC, 0xAF, 0x0B,  // g|..S...
                                /* 0618 */  0xA3, 0x4A, 0x62, 0x41, 0x36, 0xB9, 0x77, 0xAF,  // .JbA6.w.
                                /* 0620 */  0x48, 0x1C, 0xE1, 0xFB, 0x87, 0x47, 0x85, 0x59,  // H....G.Y
                                /* 0628 */  0x14, 0xA0, 0x42, 0x70, 0x06, 0x77, 0x13, 0x43,  // ..Bp.w.C
                                /* 0630 */  0x66, 0xBD, 0x30, 0x2A, 0x62, 0x17, 0xA6, 0xC3,  // f.0*b...
                                /* 0638 */  0x03, 0x97, 0xEE, 0x61, 0x1D, 0x3D, 0xC6, 0xE5,  // ...a.=..
                                /* 0640 */  0x9C, 0x2A, 0xC5, 0xE1, 0xA4, 0x19, 0x83, 0x8F,  // .*......
                                /* 0648 */  0x2E, 0xE6, 0x10, 0xF2, 0x8C, 0x76, 0x8C, 0xBC,  // .....v..
                                /* 0650 */  0x23, 0x4A, 0xF7, 0x14, 0x6C, 0x8C, 0xFB, 0x5D,  // #J..l..]
                                /* 0658 */  0xB4, 0xC4, 0xA3, 0x60, 0xBA, 0xFD, 0x06, 0x87,  // ...`....
                                /* 0660 */  0xB8, 0x8C, 0x03, 0x1F, 0x71, 0x35, 0xD4, 0xB1,  // ....q5..
                                /* 0668 */  0x75, 0xE8, 0x09, 0xE3, 0xC2, 0x06, 0x28, 0x5E,  // u.....(^
                                /* 0670 */  0x42, 0xA7, 0x2D, 0x50, 0x84, 0x30, 0x91, 0x6B,  // B.-P.0.k
                                /* 0678 */  0x44, 0xB4, 0xA2, 0x51, 0x84, 0xE6, 0xCC, 0x22,  // D..Q..."
                                /* 0680 */  0x14, 0x6F, 0x4B, 0x9C, 0x1D, 0xD0, 0x0D, 0x73,  // .oK....s
                                /* 0688 */  0xE1, 0x23, 0x55, 0x10, 0x52, 0x7C, 0xEF, 0x42,  // .#U.R|.B
                                /* 0690 */  0x50, 0x2F, 0xAE, 0xCC, 0xA4, 0xB6, 0xC9, 0xBC,  // P/......
                                /* 0698 */  0x4D, 0x25, 0xAF, 0x9B, 0x16, 0x72, 0x9E, 0x9B,  // M%...r..
                                /* 06A0 */  0x2D, 0x37, 0x3E, 0x8E, 0xFF, 0x63, 0x8C, 0xE9,  // -7>..c..
                                /* 06A8 */  0xDD, 0x59, 0xB3, 0x96, 0x3F, 0x06, 0x3C, 0x51,  // .Y..?.<Q
                                /* 06B0 */  0x60, 0x8C, 0xF0, 0x7A, 0x85, 0xE2, 0xB8, 0x44,  // `..z...D
                                /* 06B8 */  0x0A, 0x43, 0x5C, 0x24, 0x35, 0x0C, 0x42, 0x08,  // .C\$5.B.
                                /* 06C0 */  0x3D, 0x52, 0xE7, 0xD0, 0xB0, 0xEF, 0xD1, 0x1E,  // =R......
                                /* 06C8 */  0x90, 0x59, 0xDD, 0x5B, 0xD6, 0x0C, 0xEC, 0x3F,  // .Y.[...?
                                /* 06D0 */  0xCD, 0x2B, 0xB5, 0x07, 0xD3, 0x68, 0xD6, 0x6B,  // .+...h.k
                                /* 06D8 */  0x2E, 0xE7, 0x8F, 0xE3, 0x31, 0x9F, 0x53, 0x94,  // ....1.S.
                                /* 06E0 */  0x06, 0x8A, 0x5C, 0x08, 0xD0, 0x89, 0x40, 0x1A,  // ..\...@.
                                /* 06E8 */  0x5D, 0x3E, 0xDA, 0x03, 0x93, 0x50, 0x9D, 0xE8,  // ]>...P..
                                /* 06F0 */  0xA9, 0x4D, 0xC0, 0xA0, 0x29, 0xD5, 0x74, 0x4B,  // .M..).tK
                                /* 06F8 */  0x65, 0x82, 0x7B, 0x01, 0xB3, 0x3D, 0x68, 0xB9,  // e.{..=h.
                                /* 0700 */  0xDF, 0xEA, 0x3F, 0x63, 0x73, 0x03, 0x47, 0xD3,  // ..?cs.G.
                                /* 0708 */  0xBC, 0x61, 0x8B, 0xE5, 0x53, 0x6C, 0x9C, 0x27,  // .a..Sl.'
                                /* 0710 */  0xB1, 0x3E, 0xCC, 0x2F, 0x03, 0x39, 0x6E, 0xE3,  // .>./.9n.
                                /* 0718 */  0x26, 0x9F, 0xB3, 0xA3, 0xD5, 0xF5, 0x33, 0x2D,  // &.....3-
                                /* 0720 */  0x78, 0x0C, 0x13, 0x0C, 0x86, 0xCB, 0x60, 0x84,  // x.....`.
                                /* 0728 */  0x4E, 0x06, 0x98, 0xFC, 0x40, 0x57, 0x1A, 0x6D,  // N...@W.m
                                /* 0730 */  0xA0, 0x91, 0x9B, 0x3D, 0x08, 0x27, 0x56, 0xC8,  // ...=.'V.
                                /* 0738 */  0x73, 0x81, 0x57, 0x9A, 0x23, 0xEA, 0x9C, 0x88,  // s.W.#...
                                /* 0740 */  0xE1, 0xFD, 0x18, 0x6B, 0x23, 0x7B, 0x76, 0x96,  // ...k#{v.
                                /* 0748 */  0x5F, 0x57, 0x4E, 0x07, 0xC1, 0xF2, 0xDF, 0x15,  // _WN.....
                                /* 0750 */  0x3E, 0xB8, 0x14, 0xC6, 0x46, 0x86, 0xFA, 0x99,  // >...F...
                                /* 0758 */  0xF9, 0xAD, 0xE0, 0x00, 0x03, 0x88, 0x3D, 0xCB,  // ......=.
                                /* 0760 */  0xDB, 0x30, 0x29, 0xC1, 0x90, 0x57, 0x41, 0x94,  // .0)..WA.
                                /* 0768 */  0x83, 0x5F, 0x09, 0x8A, 0x78, 0x22, 0x6B, 0xA8,  // ._..x"k.
                                /* 0770 */  0x88, 0x5E, 0x01, 0xD1, 0xD7, 0x47, 0x72, 0x12,  // .^...Gr.
                                /* 0778 */  0xB7, 0x19, 0x53, 0x04, 0xFA, 0x81, 0xC2, 0x40,  // ..S....@
                                /* 0780 */  0x11, 0xAD, 0x02, 0x33, 0xA7, 0x6A, 0x35, 0x25,  // ...3.j5%
                                /* 0788 */  0x96, 0x87, 0x27, 0x44, 0xED, 0x3D, 0x75, 0xDD,  // ..'D.=u.
                                /* 0790 */  0xC8, 0x7D, 0xD0, 0xED, 0x64, 0x27, 0x7D, 0x41,  // .}..d'}A
                                /* 0798 */  0x7A, 0x0E, 0x68, 0x11, 0xE6, 0xFB, 0x50, 0x58,  // z.h...PX
                                /* 07A0 */  0x4E, 0xA6, 0xB6, 0xAD, 0xB1, 0xFF, 0x6F, 0xAE,  // N.....o.
                                /* 07A8 */  0x76, 0x23, 0xE0, 0x1C, 0xEF, 0x9C, 0x4F, 0x18,  // v#....O.
                                /* 07B0 */  0x63, 0x87, 0xAA, 0xE0, 0x5B, 0x01, 0x2F, 0xCE,  // c...[./.
                                /* 07B8 */  0xCF, 0x4B, 0xED, 0x59, 0xE3, 0xAD, 0x44, 0xB5,  // .K.Y..D.
                                /* 07C0 */  0x0A, 0x3A, 0x4F, 0xCA, 0xEE, 0x15, 0x15, 0x56,  // .:O....V
                                /* 07C8 */  0xA4, 0xB5, 0xB7, 0x36, 0xE4, 0xCF, 0xD4, 0x61,  // ...6...a
                                /* 07D0 */  0xF9, 0x92, 0xB9, 0xB9, 0x69, 0xD0, 0x64, 0x02,  // ....i.d.
                                /* 07D8 */  0xE0, 0x5D, 0xC3, 0x29, 0xC1, 0x95, 0x59, 0xA7,  // .].)..Y.
                                /* 07E0 */  0x4C, 0x29, 0x2F, 0xA1, 0xED, 0x82, 0x2D, 0x03,  // L)/...-.
                                /* 07E8 */  0x2D, 0xC1, 0xA3, 0xA7, 0x0F, 0x5F, 0x78, 0xB7,  // -...._x.
                                /* 07F0 */  0x44, 0xE5, 0xCA, 0x61, 0x7B, 0x4D, 0x47, 0x38,  // D..a{MG8
                                /* 07F8 */  0x8B, 0xEE, 0x5C, 0x01, 0xF2, 0xA5, 0x4B, 0x76,  // ..\...Kv
                                /* 0800 */  0x5A, 0x51, 0xFE, 0xF4, 0x31, 0xFD, 0x70, 0xF4,  // ZQ..1.p.
                                /* 0808 */  0x21, 0x40, 0xE1, 0x10, 0xA9, 0x48, 0xBA, 0xF3,  // !@...H..
                                /* 0810 */  0x0A, 0x9C, 0xFB, 0x72, 0xB2, 0xEF, 0x99, 0xE2,  // ...r....
                                /* 0818 */  0xA7, 0x92, 0x5A, 0xB1, 0xDC, 0x4D, 0x03, 0x13,  // ..Z..M..
                                /* 0820 */  0xF4, 0x47, 0x26, 0x53, 0x91, 0x95, 0x42, 0x4D,  // .G&S..BM
                                /* 0828 */  0x55, 0x62, 0x8D, 0x41, 0x48, 0xED, 0xAE, 0x67,  // Ub.AH..g
                                /* 0830 */  0x25, 0xB6, 0x5C, 0xCD, 0x89, 0x2F, 0x24, 0xC6,  // %.\../$.
                                /* 0838 */  0x7C, 0x03, 0xFF, 0xEB, 0x0D, 0x9F, 0xCD, 0x7E,  // |......~
                                /* 0840 */  0xB5, 0x05, 0xB9, 0x19, 0x05, 0x51, 0x5F, 0xD7,  // .....Q_.
                                /* 0848 */  0x3E, 0x9E, 0x0A, 0x68, 0xF1, 0xE3, 0xEB, 0xA7,  // >..h....
                                /* 0850 */  0x7A, 0x82, 0x89, 0x8F, 0x02, 0x4D, 0x15, 0xDA,  // z....M..
                                /* 0858 */  0x6D, 0x84, 0xCF, 0x97, 0x39, 0xB1, 0x25, 0x24,  // m...9.%$
                                /* 0860 */  0x17, 0xBC, 0x9F, 0xFD, 0x35, 0x56, 0xA3, 0xDB,  // ....5V..
                                /* 0868 */  0x8F, 0x30, 0xA5, 0xD3, 0xBC, 0xD1, 0x7F, 0x4D,  // .0.....M
                                /* 0870 */  0x43, 0xBC, 0xF6, 0x2C, 0x87, 0x5E, 0x56, 0x89,  // C..,.^V.
                                /* 0878 */  0xFB, 0xEA, 0xFB, 0xD8, 0x31, 0x9F, 0x36, 0x54,  // ....1.6T
                                /* 0880 */  0x6A, 0x3F, 0x0F, 0xB9, 0xB2, 0xF8, 0x1F, 0x08,  // j?......
                                /* 0888 */  0x32, 0x7E, 0x99, 0x56, 0x65, 0x1C, 0x21, 0xE4,  // 2~.Ve.!.
                                /* 0890 */  0x14, 0x6D, 0x15, 0xDC, 0x27, 0x09, 0x86, 0x80,  // .m..'...
                                /* 0898 */  0xC5, 0x9C, 0xE5, 0xAD, 0x25, 0x4F, 0x94, 0x85,  // ....%O..
                                /* 08A0 */  0xCF, 0xAC, 0xDA, 0x9C, 0x64, 0x0E, 0xA4, 0xF0,  // ....d...
                                /* 08A8 */  0x8D, 0x65, 0xF1, 0x1C, 0x4C, 0xD9, 0xD2, 0xD4,  // .e..L...
                                /* 08B0 */  0x5A, 0xEF, 0x83, 0x2A, 0xBA, 0x79, 0xD9, 0x32,  // Z..*.y.2
                                /* 08B8 */  0x39, 0xAC, 0x92, 0x46, 0xCB, 0xAD, 0xB3, 0xBA,  // 9..F....
                                /* 08C0 */  0xF8, 0x03, 0x97, 0x2A, 0x60, 0x75, 0x1B, 0x4B,  // ...*`u.K
                                /* 08C8 */  0x6E, 0x38, 0x34, 0xD2, 0x07, 0x7A, 0x5B, 0xF9,  // n84..z[.
                                /* 08D0 */  0x0F, 0x40, 0xBA, 0x9F, 0xAC, 0xAB, 0x73, 0xF1,  // .@....s.
                                /* 08D8 */  0x24, 0x56, 0x43, 0x71, 0x19, 0xF6, 0x27, 0x01,  // $VCq..'.
                                /* 08E0 */  0x54, 0x38, 0xDE, 0x11, 0x84, 0xF8, 0xBE, 0x22,  // T8....."
                                /* 08E8 */  0x27, 0xF8, 0x84, 0xC1, 0xCC, 0x11, 0x1B, 0xDD,  // '.......
                                /* 08F0 */  0xA7, 0xB4, 0x35, 0x41, 0x4D, 0x16, 0xC7, 0xB1,  // ..5AM...
                                /* 08F8 */  0x91, 0xA6, 0xC1, 0x6F, 0x13, 0x0D, 0x4F, 0x6A,  // ...o..Oj
                                /* 0900 */  0x81, 0xC9, 0x1C, 0x5E, 0x4A, 0xC3, 0x93, 0x23,  // ...^J..#
                                /* 0908 */  0xA9, 0x17, 0x32, 0x18, 0x16, 0x87, 0xAD, 0x3C,  // ..2....<
                                /* 0910 */  0x27, 0x59, 0x3A, 0xED, 0xD0, 0x10, 0x82, 0x9A,  // 'Y:.....
                                /* 0918 */  0x72, 0x21, 0xA2, 0x76, 0xC9, 0x85, 0xDB, 0x95,  // r!.v....
                                /* 0920 */  0xD5, 0x61, 0x62, 0x1F, 0x8B, 0x62, 0x09, 0xC8,  // .ab..b..
                                /* 0928 */  0x56, 0x04, 0x3C, 0x1B, 0x08, 0x87, 0xFE, 0x62,  // V.<....b
                                /* 0930 */  0x2D, 0x7D, 0xF3, 0x16, 0x78, 0xAE, 0xC3, 0x53,  // -}..x..S
                                /* 0938 */  0x19, 0xD3, 0x2C, 0x9B, 0x82, 0x48, 0xE9, 0xEF,  // ..,..H..
                                /* 0940 */  0x2F, 0xB3, 0x53, 0x52, 0xD6, 0x8F, 0x23, 0x05,  // /.SR..#.
                                /* 0948 */  0x7A, 0x6A, 0x67, 0x7D, 0xFA, 0x19, 0x2D, 0x73,  // zjg}..-s
                                /* 0950 */  0xA0, 0x73, 0x2C, 0xAE, 0x49, 0xB5, 0x00, 0xCC,  // .s,.I...
                                /* 0958 */  0x8B, 0x4E, 0xF4, 0x14, 0x77, 0x0D, 0x5B, 0x4B,  // .N..w.[K
                                /* 0960 */  0xA8, 0x2D, 0xFB, 0x88, 0x4D, 0xA5, 0x7D, 0xA1,  // .-..M.}.
                                /* 0968 */  0xE1, 0x10, 0x98, 0x01, 0x22, 0x31, 0x1D, 0x1A,  // ...."1..
                                /* 0970 */  0xCF, 0x40, 0xEF, 0x2D, 0xF1, 0xF1, 0x0F, 0x97,  // .@.-....
                                /* 0978 */  0xB0, 0xF0, 0x2F, 0x0D, 0x1F, 0x2A, 0xAD, 0xD1,  // ../..*..
                                /* 0980 */  0x42, 0xDE, 0xFA, 0xDA, 0x73, 0xE8, 0xE4, 0xF9,  // B...s...
                                /* 0988 */  0x05, 0x48, 0xED, 0x0C, 0x48, 0xCC, 0x1A, 0x87,  // .H..H...
                                /* 0990 */  0xD6, 0x7F, 0xBA, 0x9D, 0x06, 0xBF, 0x88, 0xBE,  // ........
                                /* 0998 */  0x21, 0xDC, 0xBB, 0x3D, 0x5C, 0x76, 0x86, 0x20,  // !..=\v. 
                                /* 09A0 */  0x26, 0xE6, 0x64, 0xE4, 0xEC, 0x91, 0xCC, 0x8F,  // &.d.....
                                /* 09A8 */  0x3A, 0x35, 0xDA, 0x94, 0xB7, 0xBD, 0x03, 0xFD,  // :5......
                                /* 09B0 */  0x2E, 0x5D, 0x09, 0x22, 0x4D, 0x61, 0x97, 0x01,  // .]."Ma..
                                /* 09B8 */  0x8D, 0xC9, 0xF7, 0xC3, 0x03, 0x76, 0x42, 0x26,  // .....vB&
                                /* 09C0 */  0xF2, 0xF2, 0x3C, 0x2F, 0x5B, 0xCF, 0x22, 0x2F,  // ..</[."/
                                /* 09C8 */  0x80, 0xF6, 0x9E, 0x73, 0xB6, 0x69, 0xDC, 0x26,  // ...s.i.&
                                /* 09D0 */  0x32, 0x0A, 0xD8, 0x03, 0xF3, 0xD6, 0x1F, 0x62,  // 2......b
                                /* 09D8 */  0xAA, 0x05, 0xC5, 0x1B, 0xDE, 0xE7, 0x22, 0x29,  // ......")
                                /* 09E0 */  0xB2, 0x7B, 0x54, 0xBA, 0xC8, 0xD7, 0x31, 0x5E,  // .{T...1^
                                /* 09E8 */  0xB5, 0xE2, 0x5E, 0xCD, 0x46, 0x51, 0x07, 0xCB,  // ..^.FQ..
                                /* 09F0 */  0x32, 0x16, 0x84, 0x3B, 0x78, 0xAD, 0xD2, 0x59,  // 2..;x..Y
                                /* 09F8 */  0xCF, 0x55, 0xF5, 0x41, 0xE5, 0xA2, 0xD7, 0xED,  // .U.A....
                                /* 0A00 */  0x34, 0xA9, 0xD1, 0x0B, 0x8B, 0xF1, 0x2F, 0xD8,  // 4...../.
                                /* 0A08 */  0x7F, 0x7E, 0x2D, 0xB4, 0x86, 0xFF, 0xA1, 0xDA,  // .~-.....
                                /* 0A10 */  0x6D, 0xC5, 0xF3, 0x38, 0x6E, 0x1D, 0x8F, 0xBF,  // m..8n...
                                /* 0A18 */  0xDD, 0xE0, 0x47, 0xA8, 0xC3, 0xEF, 0x75, 0x1A,  // ..G...u.
                                /* 0A20 */  0x6B, 0xD1, 0xB3, 0xEC, 0xBD, 0xC3, 0xDB, 0x18,  // k.......
                                /* 0A28 */  0xAF, 0x52, 0x81, 0xCE, 0x77, 0xB0, 0x66, 0xD5,  // .R..w.f.
                                /* 0A30 */  0x77, 0xD1, 0x7A, 0x6F, 0xEE, 0xE7, 0x10, 0x5F,  // w.zo..._
                                /* 0A38 */  0xC7, 0xEE, 0xC8, 0x7D, 0xA6, 0xC8, 0xEA, 0x30,  // ...}...0
                                /* 0A40 */  0xC0, 0xBC, 0xE1, 0x1D, 0x42, 0x48, 0x39, 0x63,  // ....BH9c
                                /* 0A48 */  0x1C, 0xFB, 0x15, 0xD2, 0xD9, 0x14, 0x04, 0x27,  // .......'
                                /* 0A50 */  0xCD, 0xC4, 0x20, 0xAC, 0x87, 0xAD, 0xB4, 0x63,  // .. ....c
                                /* 0A58 */  0x4B, 0x93, 0x3F, 0xB1, 0xFC, 0x9E, 0x74, 0x80,  // K.?...t.
                                /* 0A60 */  0x69, 0x95, 0x44, 0x2A, 0x1A, 0x9D, 0xA2, 0xEE,  // i.D*....
                                /* 0A68 */  0xE3, 0xD2, 0x29, 0xF2, 0xDE, 0x1F, 0xC2, 0x82,  // ..).....
                                /* 0A70 */  0x74, 0x97, 0x14, 0x89, 0x2F, 0x1E, 0x9F, 0xEA,  // t.../...
                                /* 0A78 */  0x1D, 0xD0, 0x05, 0x09, 0x1F, 0xA0, 0xC7, 0xD2,  // ........
                                /* 0A80 */  0x05, 0x03, 0xDD, 0x01, 0x27, 0xAF, 0x34, 0xD0,  // ....'.4.
                                /* 0A88 */  0xE3, 0xA3, 0xFC, 0x21, 0xBB, 0x83, 0x93, 0x07,  // ...!....
                                /* 0A90 */  0xE4, 0xAF, 0xBC, 0xD2, 0x17, 0x5B, 0x28, 0x13,  // .....[(.
                                /* 0A98 */  0x46, 0x42, 0x81, 0x76, 0xDD, 0xE1, 0x75, 0x87,  // FB.v..u.
                                /* 0AA0 */  0xB9, 0x10, 0x7C, 0xD0, 0xA5, 0x44, 0x74, 0xB6,  // ..|..Dt.
                                /* 0AA8 */  0xE5, 0x93, 0x9B, 0xCD, 0xC2, 0xF5, 0xD6, 0xFD,  // ........
                                /* 0AB0 */  0x5D, 0x50, 0xF9, 0xCB, 0x95, 0x5C, 0xAC, 0xF1,  // ]P...\..
                                /* 0AB8 */  0x27, 0xD4, 0xB8, 0x87, 0x87, 0xF5, 0x5C, 0x61,  // '.....\a
                                /* 0AC0 */  0xEF, 0xB0, 0xDE, 0x03, 0x50, 0x00, 0x98, 0x85,  // ....P...
                                /* 0AC8 */  0x5F, 0xAE, 0x60, 0x54, 0x29, 0x34, 0x07, 0xD8,  // _.`T)4..
                                /* 0AD0 */  0x81, 0x2F, 0x70, 0x45, 0x89, 0xF4, 0x6D, 0xD5,  // ./pE..m.
                                /* 0AD8 */  0x7B, 0x03, 0x7B, 0xD0, 0x0D, 0x42, 0x7D, 0x93,  // {.{..B}.
                                /* 0AE0 */  0xB9, 0x24, 0x42, 0x41, 0xA9, 0xC4, 0x42, 0x8F,  // .$BA..B.
                                /* 0AE8 */  0x10, 0xC0, 0x77, 0x7D, 0x6E, 0xD1, 0x7F, 0x6D,  // ..w}n..m
                                /* 0AF0 */  0x18, 0xA9, 0xC8, 0xC9, 0x3C, 0x6E, 0x42, 0x83,  // ....<nB.
                                /* 0AF8 */  0x26, 0x08, 0x0F, 0xD3, 0x18, 0x6B, 0xB3, 0x68,  // &....k.h
                                /* 0B00 */  0x42, 0x36, 0x8E, 0xFA, 0x0F, 0xBB, 0xFC, 0xD3,  // B6......
                                /* 0B08 */  0x77, 0x5C, 0x11, 0xC2, 0xA5, 0x89, 0xF2, 0x32,  // w\.....2
                                /* 0B10 */  0x5C, 0x94, 0xE0, 0x05, 0x0D, 0x92, 0xE6, 0xC7,  // \.......
                                /* 0B18 */  0x3A, 0x23, 0x65, 0xA2, 0x92, 0x87, 0xB9, 0x50,  // :#e....P
                                /* 0B20 */  0x29, 0xCC, 0x62, 0x71, 0x9E, 0xE1, 0x20, 0x29,  // ).bq.. )
                                /* 0B28 */  0xE2, 0xC6, 0xA4, 0x0E, 0x1B, 0x77, 0xC3, 0x04,  // .....w..
                                /* 0B30 */  0xE2, 0x7B, 0xBC, 0x87, 0x25, 0xC4, 0xAD, 0x9D,  // .{..%...
                                /* 0B38 */  0xB1, 0x71, 0x57, 0x1D, 0x92, 0xDB, 0xAA, 0xB3,  // .qW.....
                                /* 0B40 */  0x21, 0x7A, 0x8E, 0x41, 0x23, 0xD1, 0x2C, 0x81,  // !z.A#.,.
                                /* 0B48 */  0xA5, 0x03, 0xF4, 0xAB, 0x33, 0x58, 0xAE, 0x8C,  // ....3X..
                                /* 0B50 */  0xFF, 0x7A, 0xD4, 0x59, 0xF0, 0xFB, 0x8E, 0x27,  // .z.Y...'
                                /* 0B58 */  0xF3, 0xBB, 0x9E, 0xB3, 0xA0, 0x51, 0xD7, 0x87,  // .....Q..
                                /* 0B60 */  0x4E, 0xE2, 0x68, 0x38, 0xCF, 0x23, 0xB7, 0x39,  // N.h8.#.9
                                /* 0B68 */  0xC8, 0x76, 0x36, 0xA5, 0x10, 0xC0, 0x4F, 0x1D,  // .v6...O.
                                /* 0B70 */  0x49, 0xCE, 0x44, 0x6B, 0x21, 0x24, 0x00, 0xA0,  // I.Dk!$..
                                /* 0B78 */  0x55, 0x72, 0x08, 0xAB, 0x82, 0xD1, 0xDA, 0xCA,  // Ur......
                                /* 0B80 */  0x6B, 0xB4, 0x33, 0x3E, 0x46, 0xD5, 0x4A, 0x74,  // k.3>F.Jt
                                /* 0B88 */  0x1F, 0xB4, 0x9A, 0x6E, 0xA9, 0x67, 0x09, 0xEA,  // ...n.g..
                                /* 0B90 */  0xF7, 0x60, 0xC4, 0x56, 0x11, 0x4A, 0x8F, 0x6B,  // .`.V.J.k
                                /* 0B98 */  0x5B, 0xEA, 0xDB, 0x77, 0xBA, 0x01, 0x48, 0xC1,  // [..w..H.
                                /* 0BA0 */  0xAB, 0x2E, 0x75, 0x81, 0x2A, 0x6C, 0x2A, 0x87,  // ..u.*l*.
                                /* 0BA8 */  0xB9, 0x2C, 0x7F, 0xA0, 0x7B, 0xE0, 0x88, 0xCE,  // .,..{...
                                /* 0BB0 */  0x51, 0x28, 0x08, 0x92, 0x4B, 0x4C, 0xCD, 0x98,  // Q(..KL..
                                /* 0BB8 */  0xCD, 0x52, 0xBC, 0x71, 0x85, 0x11, 0x94, 0xC6,  // .R.q....
                                /* 0BC0 */  0x38, 0xA7, 0xF5, 0x82, 0xF7, 0xAD, 0xC5, 0x02,  // 8.......
                                /* 0BC8 */  0x7B, 0x9C, 0xC0, 0x74, 0x95, 0x72, 0x41, 0x20,  // {..t.rA 
                                /* 0BD0 */  0x1B, 0xA0, 0x35, 0x55, 0x54, 0x5F, 0x1B, 0x25,  // ..5UT_.%
                                /* 0BD8 */  0xAD, 0x15, 0x39, 0xB3, 0x56, 0x13, 0xFC, 0x1E,  // ..9.V...
                                /* 0BE0 */  0xB6, 0xCA, 0x0A, 0xD8, 0xF5, 0x4D, 0x22, 0x5B,  // .....M"[
                                /* 0BE8 */  0x11, 0x2B, 0x7B, 0x51, 0x4E, 0x09, 0xBF, 0xF3,  // .+{QN...
                                /* 0BF0 */  0x9B, 0x61, 0x3D, 0xB2, 0xE2, 0xAE, 0x96, 0x70,  // .a=....p
                                /* 0BF8 */  0x1E, 0x4A, 0x18, 0x67, 0x3C, 0x4D, 0x90, 0xD2,  // .J.g<M..
                                /* 0C00 */  0x59, 0xE0, 0xBC, 0xED, 0xD8, 0xB7, 0x61, 0x72,  // Y.....ar
                                /* 0C08 */  0x08, 0x51, 0x62, 0x7D, 0x75, 0x1D, 0x79, 0x95,  // .Qb}u.y.
                                /* 0C10 */  0xC3, 0x35, 0x52, 0x42, 0xE6, 0xCB, 0x5D, 0xBA,  // .5RB..].
                                /* 0C18 */  0xD6, 0x0F, 0x3C, 0x70, 0x7C, 0xB4, 0xD5, 0xE7,  // ..<p|...
                                /* 0C20 */  0x9C, 0x00, 0xF9, 0xC3, 0x59, 0x0D, 0x57, 0x43,  // ....Y.WC
                                /* 0C28 */  0x2C, 0x6D, 0x61, 0x6B, 0xFD, 0x70, 0x7D, 0xE5,  // ,mak.p}.
                                /* 0C30 */  0x84, 0x30, 0xBE, 0xC5, 0xF7, 0x05, 0xAB, 0x80,  // .0......
                                /* 0C38 */  0x20, 0x31, 0xF5, 0xE6, 0x19, 0xF1, 0x46, 0xB2,  //  1....F.
                                /* 0C40 */  0x60, 0x2E, 0x65, 0x1A, 0x1E, 0x89, 0xFB, 0xCA,  // `.e.....
                                /* 0C48 */  0xDB, 0x9E, 0xC1, 0x47, 0xB8, 0xE0, 0xA6, 0x69,  // ...G...i
                                /* 0C50 */  0x7D, 0x95, 0x32, 0x93, 0x13, 0x68, 0xC7, 0x28,  // }.2..h.(
                                /* 0C58 */  0xC0, 0x43, 0x93, 0xA9, 0x82, 0xA7, 0x10, 0xC0,  // .C......
                                /* 0C60 */  0x00                                             // .
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x01)
                        {
                            Buffer (0x0C6C)
                            {
                                /* 0000 */  0xE5, 0x1F, 0x94, 0x00, 0x00, 0x00, 0x00, 0x02,  // ........
                                /* 0008 */  0x00, 0x00, 0x00, 0x40, 0x67, 0x64, 0x64, 0x76,  // ...@gddv
                                /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x4F, 0x45, 0x4D, 0x20,  // ....OEM 
                                /* 0030 */  0x45, 0x78, 0x70, 0x6F, 0x72, 0x74, 0x65, 0x64,  // Exported
                                /* 0038 */  0x20, 0x44, 0x61, 0x74, 0x61, 0x56, 0x61, 0x75,  //  DataVau
                                /* 0040 */  0x6C, 0x74, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // lt......
                                /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0068 */  0x00, 0x00, 0x00, 0x00, 0x6D, 0xF5, 0x23, 0x2C,  // ....m.#,
                                /* 0070 */  0xCE, 0xED, 0xDE, 0xDB, 0x87, 0xF6, 0x69, 0xDB,  // ......i.
                                /* 0078 */  0x00, 0xAD, 0xBC, 0x82, 0xA3, 0xB7, 0x4C, 0x0A,  // ......L.
                                /* 0080 */  0x58, 0x40, 0xFD, 0x98, 0xC6, 0xF0, 0x35, 0x4F,  // X@....5O
                                /* 0088 */  0xFF, 0x74, 0x65, 0x15, 0xD8, 0x0B, 0x00, 0x00,  // .te.....
                                /* 0090 */  0x52, 0x45, 0x50, 0x4F, 0x5D, 0x00, 0x00, 0x00,  // REPO]...
                                /* 0098 */  0x01, 0xCB, 0x1B, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 00A0 */  0x00, 0x00, 0x72, 0x87, 0xCD, 0xFF, 0x6D, 0x24,  // ..r...m$
                                /* 00A8 */  0x47, 0xDB, 0x3D, 0x24, 0x92, 0xB4, 0x16, 0x6F,  // G.=$...o
                                /* 00B0 */  0x45, 0xD8, 0xC3, 0xF5, 0x66, 0x14, 0x9F, 0x22,  // E...f.."
                                /* 00B8 */  0xD7, 0xF7, 0xDE, 0x67, 0x90, 0x9A, 0xA2, 0x0D,  // ...g....
                                /* 00C0 */  0x39, 0x25, 0xAD, 0xC3, 0x1A, 0xAD, 0x52, 0x0B,  // 9%....R.
                                /* 00C8 */  0x75, 0x38, 0xE1, 0xA4, 0x14, 0x40, 0xD2, 0x1B,  // u8...@..
                                /* 00D0 */  0x7B, 0x49, 0x8D, 0xB7, 0x77, 0xD5, 0x95, 0x78,  // {I..w..x
                                /* 00D8 */  0xA6, 0xBA, 0x83, 0xA5, 0xBC, 0x6E, 0x34, 0x5C,  // .....n4\
                                /* 00E0 */  0x91, 0x07, 0x3F, 0x0E, 0x61, 0xA1, 0x19, 0x4A,  // ..?.a..J
                                /* 00E8 */  0x0F, 0xEA, 0xD8, 0xBF, 0xA0, 0xA6, 0xF5, 0x62,  // .......b
                                /* 00F0 */  0xC3, 0x2D, 0x5B, 0x26, 0xDB, 0x47, 0x2B, 0x0A,  // .-[&.G+.
                                /* 00F8 */  0x3B, 0xD9, 0x7A, 0xCD, 0x76, 0xF3, 0xF6, 0x13,  // ;.z.v...
                                /* 0100 */  0x57, 0xA5, 0xFA, 0x15, 0xBD, 0xAA, 0x60, 0x5F,  // W.....`_
                                /* 0108 */  0x38, 0xC8, 0x57, 0x9C, 0x14, 0x1C, 0x73, 0x24,  // 8.W...s$
                                /* 0110 */  0xD2, 0x0E, 0xDF, 0x3C, 0x09, 0x42, 0x1D, 0xC1,  // ...<.B..
                                /* 0118 */  0xCE, 0xF8, 0xF9, 0x4C, 0x5D, 0x71, 0x56, 0xA8,  // ...L]qV.
                                /* 0120 */  0x97, 0x32, 0xFB, 0x1C, 0xEC, 0x37, 0xCA, 0x19,  // .2...7..
                                /* 0128 */  0x69, 0xE4, 0xE5, 0x22, 0x16, 0x54, 0x11, 0xED,  // i..".T..
                                /* 0130 */  0x1D, 0x83, 0x68, 0x4B, 0xDE, 0x67, 0xC9, 0xC2,  // ..hK.g..
                                /* 0138 */  0x23, 0x63, 0x54, 0x0F, 0xB7, 0x68, 0x4F, 0x50,  // #cT..hOP
                                /* 0140 */  0x31, 0xE7, 0xE3, 0xA1, 0x53, 0xC5, 0x37, 0x8E,  // 1...S.7.
                                /* 0148 */  0x28, 0x84, 0xA1, 0x89, 0x49, 0xA4, 0xE2, 0xEF,  // (...I...
                                /* 0150 */  0xA5, 0xA0, 0x8B, 0xFE, 0xFB, 0xA3, 0xFD, 0xAA,  // ........
                                /* 0158 */  0xCA, 0xA3, 0xE0, 0x52, 0x46, 0xC1, 0xC1, 0x77,  // ...RF..w
                                /* 0160 */  0x8E, 0x1E, 0xB8, 0xD2, 0x00, 0xA8, 0x83, 0xA9,  // ........
                                /* 0168 */  0x74, 0x12, 0xC6, 0x8E, 0x08, 0x44, 0xD8, 0x8A,  // t....D..
                                /* 0170 */  0xDB, 0x0A, 0x4F, 0x63, 0x0C, 0xA2, 0xD5, 0x97,  // ..Oc....
                                /* 0178 */  0x79, 0xF1, 0x8A, 0x9B, 0xED, 0xDA, 0x1A, 0x4C,  // y......L
                                /* 0180 */  0x11, 0xC4, 0xA3, 0xEE, 0x0F, 0x38, 0xAE, 0x72,  // .....8.r
                                /* 0188 */  0x22, 0x52, 0x4F, 0xC8, 0x9E, 0x9E, 0xD6, 0x3B,  // "RO....;
                                /* 0190 */  0xED, 0x1D, 0xF1, 0x48, 0x4C, 0x29, 0x07, 0xF4,  // ...HL)..
                                /* 0198 */  0xBB, 0x2A, 0xF9, 0x22, 0xCE, 0x57, 0x91, 0xD5,  // .*.".W..
                                /* 01A0 */  0x4F, 0xE3, 0xD2, 0xC5, 0x0B, 0x82, 0x12, 0x8D,  // O.......
                                /* 01A8 */  0x92, 0xAE, 0x80, 0x33, 0x6B, 0x09, 0x6C, 0x51,  // ...3k.lQ
                                /* 01B0 */  0xAC, 0x3A, 0xEA, 0x62, 0x6C, 0xF2, 0x2D, 0x31,  // .:.bl.-1
                                /* 01B8 */  0x50, 0x27, 0x57, 0xCE, 0x44, 0x2F, 0x07, 0x65,  // P'W.D/.e
                                /* 01C0 */  0x41, 0x02, 0xD1, 0xA8, 0x0A, 0x35, 0xCC, 0xB8,  // A....5..
                                /* 01C8 */  0x1D, 0x29, 0x1C, 0x71, 0xE5, 0xFE, 0xC9, 0x49,  // .).q...I
                                /* 01D0 */  0x0C, 0xF2, 0x89, 0x6E, 0x02, 0xCF, 0xAF, 0x0E,  // ...n....
                                /* 01D8 */  0xCA, 0x4D, 0xF1, 0xB0, 0xA6, 0x01, 0x2E, 0x49,  // .M.....I
                                /* 01E0 */  0x5F, 0xD8, 0xF7, 0xEB, 0x5B, 0x64, 0xC6, 0x07,  // _...[d..
                                /* 01E8 */  0xDE, 0x7F, 0x68, 0xDE, 0x70, 0x8B, 0x92, 0xBE,  // ..h.p...
                                /* 01F0 */  0x1A, 0x58, 0xC8, 0x79, 0xAF, 0x0C, 0xFD, 0x82,  // .X.y....
                                /* 01F8 */  0x94, 0x88, 0x6F, 0x67, 0xEC, 0x1C, 0x55, 0x0B,  // ..og..U.
                                /* 0200 */  0xDC, 0xCB, 0x5F, 0xF6, 0xD4, 0x22, 0x63, 0x20,  // .._.."c 
                                /* 0208 */  0x2F, 0xC0, 0x2F, 0x57, 0x5C, 0xA5, 0x9A, 0x72,  // /./W\..r
                                /* 0210 */  0x00, 0x2F, 0x97, 0xE9, 0xA8, 0x82, 0x79, 0x4A,  // ./....yJ
                                /* 0218 */  0x65, 0x48, 0xFC, 0x99, 0xF8, 0x93, 0xCF, 0x5E,  // eH.....^
                                /* 0220 */  0x86, 0x0E, 0x85, 0x29, 0x70, 0xAC, 0x15, 0xEA,  // ...)p...
                                /* 0228 */  0x98, 0xAD, 0xAF, 0x72, 0x33, 0xE6, 0x86, 0x1E,  // ...r3...
                                /* 0230 */  0x87, 0x54, 0x9D, 0x5B, 0xE7, 0xD7, 0x1A, 0x3F,  // .T.[...?
                                /* 0238 */  0x71, 0x9F, 0x26, 0x75, 0x79, 0xA1, 0x5E, 0xD4,  // q.&uy.^.
                                /* 0240 */  0x24, 0x06, 0x18, 0x80, 0x40, 0x6C, 0xF9, 0xD8,  // $...@l..
                                /* 0248 */  0x4B, 0x49, 0x29, 0xCD, 0xFB, 0xF3, 0x72, 0x43,  // KI)...rC
                                /* 0250 */  0x59, 0xFC, 0xF7, 0x13, 0xB0, 0xF7, 0x2C, 0x88,  // Y.....,.
                                /* 0258 */  0x80, 0x66, 0x3E, 0x0E, 0x2D, 0x2A, 0xFE, 0xE4,  // .f>.-*..
                                /* 0260 */  0x67, 0x2C, 0xC9, 0x80, 0xFB, 0x0B, 0x57, 0x74,  // g,....Wt
                                /* 0268 */  0x43, 0x3C, 0xCE, 0xEF, 0xE0, 0xB3, 0xB1, 0x7F,  // C<......
                                /* 0270 */  0x02, 0xE5, 0x96, 0xC6, 0xBF, 0xDC, 0xF8, 0x9C,  // ........
                                /* 0278 */  0x06, 0x48, 0xAF, 0xD0, 0x69, 0xDE, 0xF2, 0xDF,  // .H..i...
                                /* 0280 */  0xFC, 0x8E, 0xD1, 0xA4, 0x2E, 0x8B, 0x3E, 0xEB,  // ......>.
                                /* 0288 */  0xC1, 0xB2, 0x8A, 0x23, 0x6D, 0x8A, 0x65, 0xB1,  // ...#m.e.
                                /* 0290 */  0xEF, 0x7D, 0x33, 0x1C, 0xB8, 0xBA, 0x17, 0x82,  // .}3.....
                                /* 0298 */  0x1B, 0x8C, 0x27, 0xA4, 0x29, 0x4D, 0xE0, 0x79,  // ..'.)M.y
                                /* 02A0 */  0x7A, 0x2F, 0x92, 0x8E, 0x7E, 0x80, 0x32, 0x7F,  // z/..~.2.
                                /* 02A8 */  0x64, 0x12, 0x82, 0x70, 0x07, 0x89, 0xCF, 0xF7,  // d..p....
                                /* 02B0 */  0xD5, 0x94, 0x4E, 0x15, 0x47, 0x53, 0x42, 0x9A,  // ..N.GSB.
                                /* 02B8 */  0xEB, 0x90, 0x90, 0x69, 0xEF, 0x39, 0xCA, 0x19,  // ...i.9..
                                /* 02C0 */  0x28, 0xB9, 0x39, 0x26, 0x98, 0x06, 0xCE, 0x1C,  // (.9&....
                                /* 02C8 */  0x4C, 0x92, 0x9E, 0xC0, 0x8A, 0xF4, 0x3C, 0x57,  // L.....<W
                                /* 02D0 */  0x1F, 0x9A, 0x49, 0xF9, 0x18, 0x5F, 0x97, 0xC7,  // ..I.._..
                                /* 02D8 */  0x39, 0x83, 0x48, 0x22, 0xFF, 0x79, 0xC6, 0x46,  // 9.H".y.F
                                /* 02E0 */  0x90, 0xDD, 0x7A, 0xE4, 0xF4, 0xE3, 0xB1, 0xC2,  // ..z.....
                                /* 02E8 */  0x9D, 0xD9, 0xF9, 0x64, 0x1A, 0xD7, 0xED, 0xCF,  // ...d....
                                /* 02F0 */  0x7B, 0x5B, 0xE4, 0x02, 0x76, 0x17, 0xAD, 0x12,  // {[..v...
                                /* 02F8 */  0x25, 0x57, 0x24, 0x58, 0x72, 0x2A, 0xB2, 0x32,  // %W$Xr*.2
                                /* 0300 */  0xA3, 0x5B, 0x7D, 0x46, 0x57, 0xF3, 0x71, 0xEB,  // .[}FW.q.
                                /* 0308 */  0xCB, 0xCC, 0xEE, 0xD0, 0x03, 0x06, 0x63, 0x48,  // ......cH
                                /* 0310 */  0x49, 0xC4, 0x26, 0x80, 0xA4, 0x07, 0xC0, 0x4D,  // I.&....M
                                /* 0318 */  0x97, 0xBB, 0x10, 0x76, 0x89, 0xFD, 0x27, 0x30,  // ...v..'0
                                /* 0320 */  0x16, 0xFA, 0x03, 0x01, 0x0F, 0xC5, 0x8E, 0xAE,  // ........
                                /* 0328 */  0x2B, 0xDF, 0xC0, 0x03, 0x9E, 0x53, 0xF0, 0xE9,  // +....S..
                                /* 0330 */  0x93, 0x2F, 0xE4, 0xBA, 0x76, 0x02, 0xB1, 0x94,  // ./..v...
                                /* 0338 */  0xCF, 0x36, 0xA9, 0x6A, 0x8E, 0x7A, 0x29, 0xB7,  // .6.j.z).
                                /* 0340 */  0xE8, 0x72, 0xC7, 0x73, 0xF9, 0x17, 0x14, 0x01,  // .r.s....
                                /* 0348 */  0xF0, 0xAD, 0xCD, 0x35, 0x59, 0x59, 0x8C, 0x4A,  // ...5YY.J
                                /* 0350 */  0x67, 0x1F, 0xBA, 0x97, 0xF5, 0xE0, 0x9A, 0x70,  // g......p
                                /* 0358 */  0x86, 0xC3, 0xB6, 0x5E, 0x08, 0xEA, 0xD2, 0x20,  // ...^... 
                                /* 0360 */  0xCE, 0xB1, 0xEB, 0x46, 0x5F, 0x6C, 0x08, 0xBD,  // ...F_l..
                                /* 0368 */  0xAF, 0xEE, 0xCB, 0x22, 0xFF, 0xF2, 0x2B, 0x30,  // ..."..+0
                                /* 0370 */  0x5A, 0xA2, 0xDE, 0x06, 0xFF, 0x83, 0xB7, 0x58,  // Z......X
                                /* 0378 */  0xF3, 0x00, 0x11, 0x26, 0x7A, 0xD1, 0x02, 0xAE,  // ...&z...
                                /* 0380 */  0xE0, 0x63, 0x94, 0x87, 0x3B, 0x74, 0x34, 0xC9,  // .c..;t4.
                                /* 0388 */  0x32, 0xA1, 0x25, 0xC4, 0xB5, 0xB1, 0xD3, 0x03,  // 2.%.....
                                /* 0390 */  0xED, 0x96, 0xE6, 0xAE, 0x97, 0x15, 0xEE, 0xBB,  // ........
                                /* 0398 */  0x56, 0x90, 0x0A, 0xFD, 0xDF, 0x14, 0x9A, 0x32,  // V......2
                                /* 03A0 */  0xCF, 0xAA, 0xF9, 0xFA, 0xC3, 0x67, 0x76, 0x77,  // .....gvw
                                /* 03A8 */  0x26, 0x30, 0x47, 0x2F, 0x7B, 0xE8, 0x4D, 0xB9,  // &0G/{.M.
                                /* 03B0 */  0x7A, 0x18, 0x80, 0x5A, 0x36, 0x64, 0x96, 0xC9,  // z..Z6d..
                                /* 03B8 */  0x49, 0xCF, 0x27, 0xC0, 0x36, 0x22, 0x16, 0x57,  // I.'.6".W
                                /* 03C0 */  0x6C, 0x92, 0xD3, 0x44, 0x17, 0x1A, 0x17, 0x2E,  // l..D....
                                /* 03C8 */  0x36, 0x19, 0x0F, 0xF3, 0x92, 0x13, 0x8F, 0x45,  // 6......E
                                /* 03D0 */  0xF6, 0x7F, 0x21, 0x6B, 0xB7, 0xF7, 0xD1, 0xFB,  // ..!k....
                                /* 03D8 */  0x57, 0x60, 0x6E, 0x88, 0x82, 0x92, 0xED, 0x10,  // W`n.....
                                /* 03E0 */  0xA8, 0x03, 0x41, 0xFA, 0xD2, 0x4E, 0xE6, 0xBB,  // ..A..N..
                                /* 03E8 */  0xB1, 0x33, 0xA4, 0x9F, 0x55, 0x42, 0x4D, 0x6F,  // .3..UBMo
                                /* 03F0 */  0xC5, 0xD4, 0x43, 0xAA, 0x3F, 0xEC, 0x8C, 0xC1,  // ..C.?...
                                /* 03F8 */  0x67, 0x81, 0x5A, 0xF9, 0x82, 0x47, 0x63, 0xD0,  // g.Z..Gc.
                                /* 0400 */  0xBA, 0xAE, 0x17, 0x97, 0x62, 0x76, 0xDC, 0x72,  // ....bv.r
                                /* 0408 */  0x1D, 0xB3, 0x1C, 0x37, 0x96, 0x0E, 0xDF, 0xD7,  // ...7....
                                /* 0410 */  0xF1, 0x10, 0x1E, 0xBC, 0xB3, 0xB3, 0xF1, 0xF3,  // ........
                                /* 0418 */  0xFD, 0x25, 0x72, 0x4E, 0x60, 0x5D, 0xC9, 0x08,  // .%rN`]..
                                /* 0420 */  0x58, 0x49, 0xFE, 0xB5, 0x22, 0xFB, 0x11, 0x43,  // XI.."..C
                                /* 0428 */  0x29, 0x1F, 0x0D, 0xE5, 0xC6, 0xC8, 0x7B, 0xA9,  // ).....{.
                                /* 0430 */  0x59, 0xBA, 0x1C, 0x87, 0x39, 0xBF, 0x10, 0x64,  // Y...9..d
                                /* 0438 */  0x55, 0x9F, 0x35, 0x33, 0x41, 0x60, 0x09, 0x72,  // U.53A`.r
                                /* 0440 */  0x0B, 0x20, 0xED, 0x40, 0xEC, 0x6A, 0x8F, 0xE0,  // . .@.j..
                                /* 0448 */  0x54, 0x4C, 0x37, 0xB7, 0x78, 0xB4, 0x87, 0x19,  // TL7.x...
                                /* 0450 */  0x27, 0xE6, 0xDD, 0x82, 0x74, 0x03, 0x9E, 0x17,  // '...t...
                                /* 0458 */  0x86, 0x05, 0xCA, 0x64, 0xBE, 0xE6, 0x92, 0x5C,  // ...d...\
                                /* 0460 */  0x14, 0xCE, 0x4B, 0x85, 0x04, 0xD8, 0x5C, 0x4E,  // ..K...\N
                                /* 0468 */  0x05, 0xE6, 0xD7, 0x88, 0x18, 0xAC, 0x7E, 0x75,  // ......~u
                                /* 0470 */  0x7A, 0xCE, 0x2D, 0x41, 0x91, 0x71, 0x9C, 0x7C,  // z.-A.q.|
                                /* 0478 */  0x9A, 0xF9, 0x99, 0xAA, 0x7B, 0x84, 0xA5, 0x88,  // ....{...
                                /* 0480 */  0x6A, 0xF6, 0x44, 0x2F, 0x3A, 0x59, 0xAD, 0x36,  // j.D/:Y.6
                                /* 0488 */  0x5F, 0x86, 0x73, 0xA0, 0xC8, 0xD7, 0x76, 0xAA,  // _.s...v.
                                /* 0490 */  0x4A, 0x4D, 0xFE, 0xEB, 0x6D, 0x6E, 0x84, 0x1A,  // JM..mn..
                                /* 0498 */  0xA4, 0x94, 0xF6, 0xFD, 0x82, 0x10, 0xA3, 0xD4,  // ........
                                /* 04A0 */  0x52, 0x39, 0xB7, 0x0B, 0x55, 0x40, 0x35, 0xBA,  // R9..U@5.
                                /* 04A8 */  0x35, 0x0E, 0x0E, 0xF2, 0xB5, 0x3D, 0x8C, 0xD6,  // 5....=..
                                /* 04B0 */  0xD1, 0x6B, 0x76, 0x85, 0x48, 0x95, 0x9B, 0x26,  // .kv.H..&
                                /* 04B8 */  0x01, 0xD9, 0x60, 0x5B, 0xE2, 0x6F, 0x51, 0xF1,  // ..`[.oQ.
                                /* 04C0 */  0xFD, 0x23, 0x76, 0x17, 0x4B, 0x41, 0x90, 0xC1,  // .#v.KA..
                                /* 04C8 */  0x0C, 0x25, 0x16, 0xAB, 0x3D, 0xCB, 0x48, 0x8D,  // .%..=.H.
                                /* 04D0 */  0x9E, 0x25, 0x0A, 0x31, 0xB0, 0xA0, 0x03, 0xC7,  // .%.1....
                                /* 04D8 */  0x78, 0x19, 0x1D, 0x06, 0x42, 0x1C, 0xC6, 0x88,  // x...B...
                                /* 04E0 */  0x94, 0xD3, 0xFF, 0xD5, 0x94, 0x60, 0xD6, 0xB0,  // .....`..
                                /* 04E8 */  0x34, 0x9E, 0xBA, 0x3E, 0x9F, 0xEF, 0x36, 0xCD,  // 4..>..6.
                                /* 04F0 */  0x1F, 0xA3, 0x7E, 0xC4, 0x19, 0x64, 0xED, 0x72,  // ..~..d.r
                                /* 04F8 */  0xB0, 0xBF, 0x4B, 0xCF, 0x98, 0x28, 0xE2, 0xB4,  // ..K..(..
                                /* 0500 */  0x31, 0x67, 0x04, 0x22, 0x1E, 0x90, 0x76, 0x72,  // 1g."..vr
                                /* 0508 */  0xC7, 0x34, 0x94, 0xD2, 0x67, 0xB8, 0x9F, 0x96,  // .4..g...
                                /* 0510 */  0x11, 0x55, 0x48, 0x64, 0x6C, 0x2E, 0xEA, 0x3A,  // .UHdl..:
                                /* 0518 */  0x0A, 0x02, 0x0B, 0xE9, 0x48, 0x10, 0xD9, 0xB0,  // ....H...
                                /* 0520 */  0x22, 0xD1, 0xE1, 0x16, 0x09, 0x25, 0xCE, 0xDA,  // "....%..
                                /* 0528 */  0x26, 0x68, 0x9D, 0x43, 0xAF, 0x73, 0xBE, 0x3B,  // &h.C.s.;
                                /* 0530 */  0xDE, 0xBB, 0x39, 0xAC, 0xB2, 0xE2, 0x99, 0x21,  // ..9....!
                                /* 0538 */  0x80, 0xDA, 0x34, 0xEB, 0x62, 0xE9, 0xAB, 0x1A,  // ..4.b...
                                /* 0540 */  0x77, 0x5C, 0x6F, 0x81, 0xB1, 0x58, 0x1B, 0xEF,  // w\o..X..
                                /* 0548 */  0x93, 0x6A, 0xF3, 0xC1, 0x66, 0x39, 0xE6, 0xF4,  // .j..f9..
                                /* 0550 */  0xE8, 0x9C, 0x44, 0x56, 0x49, 0xE1, 0x17, 0xFB,  // ..DVI...
                                /* 0558 */  0x84, 0xEE, 0x10, 0x5F, 0x99, 0xD9, 0xC0, 0xF6,  // ..._....
                                /* 0560 */  0x2F, 0x3F, 0x26, 0x76, 0xC8, 0xA7, 0x35, 0x8D,  // /?&v..5.
                                /* 0568 */  0xA6, 0x9F, 0xAF, 0x79, 0x19, 0xC3, 0x94, 0x0B,  // ...y....
                                /* 0570 */  0xBF, 0x70, 0xB9, 0x27, 0xA2, 0x37, 0x6E, 0xF1,  // .p.'.7n.
                                /* 0578 */  0x69, 0x21, 0x79, 0x83, 0x36, 0x1F, 0x62, 0x9C,  // i!y.6.b.
                                /* 0580 */  0x23, 0x32, 0x59, 0xD9, 0xE3, 0x83, 0x18, 0xDA,  // #2Y.....
                                /* 0588 */  0xFC, 0x63, 0xB6, 0x00, 0x7C, 0xA6, 0xF1, 0xE8,  // .c..|...
                                /* 0590 */  0xF5, 0x69, 0xCD, 0x9C, 0xB1, 0x8E, 0x7A, 0xBA,  // .i....z.
                                /* 0598 */  0x20, 0x07, 0xEF, 0xB9, 0x42, 0x3B, 0x77, 0x47,  //  ...B;wG
                                /* 05A0 */  0x3D, 0x5E, 0x18, 0xF9, 0x14, 0xEE, 0x54, 0xCB,  // =^....T.
                                /* 05A8 */  0x26, 0xC2, 0xCF, 0xFD, 0xFB, 0xD5, 0x39, 0x11,  // &.....9.
                                /* 05B0 */  0xA5, 0x43, 0x2B, 0xDD, 0x23, 0x84, 0x5C, 0x73,  // .C+.#.\s
                                /* 05B8 */  0xAC, 0xD5, 0x7F, 0x80, 0x94, 0x4A, 0x1E, 0x3E,  // .....J.>
                                /* 05C0 */  0xF4, 0x8C, 0xA5, 0xBC, 0x64, 0x91, 0x21, 0xBD,  // ....d.!.
                                /* 05C8 */  0xB4, 0x84, 0xB6, 0xB4, 0xE2, 0xFB, 0x48, 0x7C,  // ......H|
                                /* 05D0 */  0x0B, 0x84, 0x10, 0xCE, 0xA0, 0xAE, 0xD7, 0xAE,  // ........
                                /* 05D8 */  0xE8, 0x6B, 0x5D, 0x71, 0xF9, 0x38, 0x4D, 0x24,  // .k]q.8M$
                                /* 05E0 */  0xE4, 0xC5, 0xCF, 0x59, 0xFB, 0xA1, 0x34, 0x7D,  // ...Y..4}
                                /* 05E8 */  0x79, 0x17, 0x21, 0xCA, 0x06, 0x69, 0x2A, 0xA7,  // y.!..i*.
                                /* 05F0 */  0x99, 0x99, 0x59, 0xF1, 0x60, 0x15, 0x3D, 0xEC,  // ..Y.`.=.
                                /* 05F8 */  0x5C, 0x66, 0x91, 0xED, 0x59, 0x07, 0xB6, 0x27,  // \f..Y..'
                                /* 0600 */  0x9D, 0xB8, 0xBF, 0xE6, 0x57, 0x41, 0x78, 0x12,  // ....WAx.
                                /* 0608 */  0xFA, 0x8F, 0x13, 0x26, 0xD8, 0xD9, 0xAB, 0x2B,  // ...&...+
                                /* 0610 */  0x1C, 0x84, 0x60, 0x80, 0x3C, 0xA5, 0x6F, 0x5B,  // ..`.<.o[
                                /* 0618 */  0x8F, 0xC9, 0x26, 0x7B, 0xB3, 0x61, 0x70, 0x92,  // ..&{.ap.
                                /* 0620 */  0x31, 0xBB, 0x81, 0x26, 0x51, 0x8A, 0x6F, 0x24,  // 1..&Q.o$
                                /* 0628 */  0x40, 0x1C, 0x0E, 0x94, 0xA8, 0x53, 0xF3, 0x03,  // @....S..
                                /* 0630 */  0xED, 0x5E, 0xE1, 0x82, 0xC8, 0x0A, 0xF6, 0xCC,  // .^......
                                /* 0638 */  0xB7, 0xF7, 0xF7, 0x32, 0x83, 0xBF, 0xAD, 0xE3,  // ...2....
                                /* 0640 */  0xAF, 0x9D, 0x74, 0xA0, 0xBD, 0x72, 0xAF, 0xA0,  // ..t..r..
                                /* 0648 */  0xBA, 0xF1, 0x0B, 0xC6, 0xF1, 0xDC, 0x8B, 0x69,  // .......i
                                /* 0650 */  0x70, 0x98, 0x2C, 0x0E, 0xD5, 0x7E, 0x5A, 0x8C,  // p.,..~Z.
                                /* 0658 */  0x3F, 0x79, 0x39, 0xDE, 0x60, 0xAB, 0x0D, 0x09,  // ?y9.`...
                                /* 0660 */  0x9B, 0xC5, 0xC2, 0xE8, 0xE5, 0x0B, 0x19, 0xC2,  // ........
                                /* 0668 */  0xE8, 0x18, 0xCE, 0x55, 0x9A, 0xC6, 0xE9, 0x46,  // ...U...F
                                /* 0670 */  0x49, 0xAF, 0x58, 0x14, 0x0B, 0x5E, 0xA7, 0x6B,  // I.X..^.k
                                /* 0678 */  0x76, 0x78, 0xD4, 0x8D, 0xE0, 0x69, 0x86, 0x76,  // vx...i.v
                                /* 0680 */  0xB6, 0x1E, 0xA1, 0xD4, 0x95, 0xE5, 0x3E, 0x12,  // ......>.
                                /* 0688 */  0xAF, 0xCC, 0xF2, 0x37, 0x66, 0xB3, 0xCB, 0x26,  // ...7f..&
                                /* 0690 */  0xD0, 0x94, 0x5E, 0x40, 0xCF, 0x8C, 0x31, 0x96,  // ..^@..1.
                                /* 0698 */  0xDA, 0x76, 0x06, 0x2C, 0xE6, 0x3C, 0x53, 0xF8,  // .v.,.<S.
                                /* 06A0 */  0x19, 0x74, 0x45, 0x3C, 0x7B, 0x6C, 0x90, 0xD9,  // .tE<{l..
                                /* 06A8 */  0x41, 0x98, 0x85, 0x9C, 0x3B, 0x15, 0xD5, 0xC9,  // A...;...
                                /* 06B0 */  0x6D, 0x06, 0x50, 0xCE, 0x13, 0x94, 0x8E, 0xEA,  // m.P.....
                                /* 06B8 */  0x5E, 0x0C, 0x16, 0x55, 0x12, 0x4C, 0xCF, 0xA3,  // ^..U.L..
                                /* 06C0 */  0xC5, 0x13, 0x3E, 0xDC, 0x3A, 0x93, 0xEF, 0x8E,  // ..>.:...
                                /* 06C8 */  0xE9, 0x44, 0xB8, 0x1E, 0xDA, 0x5F, 0x48, 0xDD,  // .D..._H.
                                /* 06D0 */  0xF2, 0x5C, 0xCC, 0xC5, 0x63, 0x94, 0x88, 0x8F,  // .\..c...
                                /* 06D8 */  0x51, 0xC7, 0xC1, 0xD4, 0xA9, 0x1B, 0x18, 0xE8,  // Q.......
                                /* 06E0 */  0x7A, 0xC8, 0x46, 0xBE, 0x41, 0x61, 0x34, 0x2F,  // z.F.Aa4/
                                /* 06E8 */  0xBC, 0x18, 0xDE, 0x35, 0x03, 0xE8, 0x82, 0x57,  // ...5...W
                                /* 06F0 */  0xA2, 0x42, 0xFA, 0x0F, 0xA5, 0x70, 0x2B, 0x4F,  // .B...p+O
                                /* 06F8 */  0xBF, 0x1E, 0x70, 0xDD, 0x68, 0xF6, 0xB2, 0xD8,  // ..p.h...
                                /* 0700 */  0xF6, 0x06, 0x5B, 0x1D, 0xD7, 0x79, 0x37, 0x78,  // ..[..y7x
                                /* 0708 */  0xA4, 0x12, 0x92, 0xE0, 0xEC, 0x4C, 0x40, 0x1A,  // .....L@.
                                /* 0710 */  0x3D, 0xF7, 0x7C, 0xF6, 0xC5, 0xB0, 0x06, 0x6A,  // =.|....j
                                /* 0718 */  0x1F, 0x82, 0x49, 0x07, 0xFE, 0x2C, 0x77, 0xF5,  // ..I..,w.
                                /* 0720 */  0x41, 0x34, 0xCB, 0xA3, 0xBA, 0xEE, 0x3C, 0xFE,  // A4....<.
                                /* 0728 */  0x9B, 0x61, 0x3D, 0xFD, 0xD8, 0x6A, 0x4D, 0xCE,  // .a=..jM.
                                /* 0730 */  0x34, 0xA0, 0x3A, 0x6A, 0x14, 0xDD, 0xA4, 0x5C,  // 4.:j...\
                                /* 0738 */  0x7F, 0x0D, 0xF7, 0x76, 0x2E, 0xDB, 0xD5, 0xF1,  // ...v....
                                /* 0740 */  0x24, 0x53, 0xAC, 0x47, 0xB1, 0x2F, 0xF4, 0xF6,  // $S.G./..
                                /* 0748 */  0xAE, 0x20, 0xF8, 0xEB, 0x68, 0xA6, 0x28, 0xFD,  // . ..h.(.
                                /* 0750 */  0x4A, 0xEC, 0x8E, 0x4E, 0xAD, 0xFF, 0x96, 0x3A,  // J..N...:
                                /* 0758 */  0x6B, 0x74, 0xBC, 0x9E, 0xB7, 0x7E, 0xD7, 0x80,  // kt...~..
                                /* 0760 */  0x96, 0x05, 0x07, 0xA8, 0x6E, 0xBB, 0xC6, 0x4F,  // ....n..O
                                /* 0768 */  0xB5, 0x7A, 0x7C, 0xD6, 0x16, 0x6F, 0x55, 0xB5,  // .z|..oU.
                                /* 0770 */  0x8E, 0x2B, 0xCF, 0xDD, 0x5B, 0x79, 0xFB, 0x09,  // .+..[y..
                                /* 0778 */  0x0F, 0xE1, 0xD1, 0x33, 0x20, 0xD2, 0x84, 0xC7,  // ...3 ...
                                /* 0780 */  0x08, 0x8F, 0x3F, 0xDD, 0x3A, 0x5F, 0x35, 0xFC,  // ..?.:_5.
                                /* 0788 */  0x14, 0x36, 0x5E, 0x34, 0xC3, 0x96, 0x3B, 0x33,  // .6^4..;3
                                /* 0790 */  0xD0, 0xF0, 0xED, 0x4A, 0xD0, 0x90, 0xE1, 0xE3,  // ...J....
                                /* 0798 */  0x64, 0x7B, 0x50, 0x68, 0x7C, 0xFC, 0x77, 0xD7,  // d{Ph|.w.
                                /* 07A0 */  0x78, 0xFC, 0x95, 0xC9, 0xA3, 0xE9, 0x32, 0x28,  // x.....2(
                                /* 07A8 */  0x17, 0x45, 0xCB, 0x47, 0xAE, 0x52, 0x6D, 0xAE,  // .E.G.Rm.
                                /* 07B0 */  0xA6, 0x8C, 0xBD, 0x3C, 0xD0, 0x22, 0x37, 0x9F,  // ...<."7.
                                /* 07B8 */  0x9F, 0x0D, 0xCA, 0xFD, 0x0B, 0x53, 0xE0, 0xDD,  // .....S..
                                /* 07C0 */  0x61, 0x0E, 0x16, 0x52, 0x88, 0xC6, 0x18, 0xFF,  // a..R....
                                /* 07C8 */  0xB6, 0xBA, 0xB3, 0x2C, 0x33, 0xEE, 0x30, 0x77,  // ...,3.0w
                                /* 07D0 */  0xFB, 0x92, 0x6B, 0x7C, 0x34, 0x48, 0x46, 0x96,  // ..k|4HF.
                                /* 07D8 */  0xA2, 0xB2, 0x88, 0x72, 0xF3, 0x80, 0xF1, 0xC2,  // ...r....
                                /* 07E0 */  0x62, 0xA3, 0x94, 0x31, 0x9C, 0xE8, 0x88, 0xBE,  // b..1....
                                /* 07E8 */  0xD1, 0xB8, 0xC0, 0xD1, 0xC5, 0xA6, 0xE0, 0xDC,  // ........
                                /* 07F0 */  0xC7, 0x7D, 0xD8, 0xD5, 0x82, 0x19, 0x1F, 0xE6,  // .}......
                                /* 07F8 */  0x5D, 0xC7, 0xA3, 0x85, 0xC5, 0x08, 0xE5, 0x7B,  // ]......{
                                /* 0800 */  0xD7, 0x3D, 0xC4, 0x81, 0x88, 0xB2, 0x76, 0x0E,  // .=....v.
                                /* 0808 */  0x25, 0xE9, 0x7E, 0x0A, 0x57, 0x93, 0x1F, 0x11,  // %.~.W...
                                /* 0810 */  0x08, 0x12, 0x75, 0x48, 0xC1, 0xBA, 0x56, 0x72,  // ..uH..Vr
                                /* 0818 */  0x1C, 0xFF, 0x57, 0xE9, 0x06, 0x14, 0x11, 0x4B,  // ..W....K
                                /* 0820 */  0x8A, 0x13, 0xA8, 0xF4, 0x44, 0x57, 0xFE, 0x80,  // ....DW..
                                /* 0828 */  0x3C, 0x5A, 0x3F, 0x87, 0x49, 0x68, 0x30, 0x66,  // <Z?.Ih0f
                                /* 0830 */  0x64, 0x0F, 0x84, 0x5F, 0xA0, 0x95, 0x5A, 0xC4,  // d.._..Z.
                                /* 0838 */  0x23, 0xE9, 0x52, 0x79, 0xFD, 0x43, 0x92, 0xC4,  // #.Ry.C..
                                /* 0840 */  0x77, 0x68, 0xC5, 0x5C, 0xD3, 0x68, 0xBA, 0x23,  // wh.\.h.#
                                /* 0848 */  0x9E, 0xE7, 0x1B, 0x50, 0xFD, 0xA8, 0x42, 0xDE,  // ...P..B.
                                /* 0850 */  0xBD, 0xFE, 0x98, 0xEA, 0xB5, 0xC8, 0x65, 0x57,  // ......eW
                                /* 0858 */  0xB1, 0x52, 0x74, 0xD2, 0x54, 0x6F, 0xB3, 0xFC,  // .Rt.To..
                                /* 0860 */  0x0F, 0x34, 0xD3, 0x92, 0x71, 0x61, 0x2F, 0x71,  // .4..qa/q
                                /* 0868 */  0x9F, 0xBA, 0x5E, 0x45, 0x9F, 0xCA, 0xF4, 0xFE,  // ..^E....
                                /* 0870 */  0x59, 0x69, 0xBD, 0x3D, 0xF1, 0xB8, 0xE4, 0xD0,  // Yi.=....
                                /* 0878 */  0x8D, 0x91, 0xE5, 0x00, 0xED, 0xF2, 0xA5, 0x3C,  // .......<
                                /* 0880 */  0x8A, 0x82, 0x25, 0x6A, 0x2C, 0x25, 0x22, 0xBF,  // ..%j,%".
                                /* 0888 */  0xD8, 0xC3, 0xCA, 0xBF, 0xD2, 0x24, 0x22, 0x21,  // .....$"!
                                /* 0890 */  0xD5, 0x5D, 0x68, 0xC4, 0x35, 0x1E, 0xC1, 0xC5,  // .]h.5...
                                /* 0898 */  0x48, 0x5D, 0xAA, 0x9E, 0x4C, 0xA7, 0xBB, 0x37,  // H]..L..7
                                /* 08A0 */  0x5A, 0xEA, 0x24, 0x87, 0x93, 0x08, 0xAA, 0x22,  // Z.$...."
                                /* 08A8 */  0x66, 0xA1, 0xED, 0x56, 0x35, 0x79, 0x72, 0xBF,  // f..V5yr.
                                /* 08B0 */  0x55, 0x62, 0x69, 0xAE, 0x43, 0x7A, 0xED, 0xA0,  // Ubi.Cz..
                                /* 08B8 */  0x60, 0x85, 0xE9, 0x49, 0x58, 0xD6, 0x4D, 0x9D,  // `..IX.M.
                                /* 08C0 */  0x90, 0xF0, 0xB2, 0x29, 0x60, 0x21, 0x6B, 0x75,  // ...)`!ku
                                /* 08C8 */  0x10, 0xBC, 0x7A, 0x35, 0x19, 0xCB, 0xA1, 0x05,  // ..z5....
                                /* 08D0 */  0x9B, 0xE8, 0x57, 0x02, 0x47, 0x2B, 0xA2, 0xB4,  // ..W.G+..
                                /* 08D8 */  0xAE, 0x2A, 0x94, 0x6E, 0xEF, 0xE5, 0xFA, 0xE9,  // .*.n....
                                /* 08E0 */  0x1A, 0x4E, 0xD5, 0x01, 0x7E, 0x8C, 0x34, 0xBD,  // .N..~.4.
                                /* 08E8 */  0x28, 0x0E, 0x5A, 0x35, 0x8D, 0x38, 0x55, 0x47,  // (.Z5.8UG
                                /* 08F0 */  0x37, 0x87, 0x3F, 0xD1, 0x4B, 0xEA, 0x93, 0x70,  // 7.?.K..p
                                /* 08F8 */  0x8E, 0xAA, 0x2F, 0xC5, 0x91, 0x4E, 0x4D, 0x3D,  // ../..NM=
                                /* 0900 */  0x81, 0x47, 0x0E, 0xF6, 0x9C, 0xFA, 0x65, 0x49,  // .G....eI
                                /* 0908 */  0x39, 0x7E, 0x6D, 0xEB, 0x8C, 0xDC, 0xD3, 0x38,  // 9~m....8
                                /* 0910 */  0xE5, 0xA8, 0x80, 0xB8, 0xB7, 0x8D, 0xBF, 0x1F,  // ........
                                /* 0918 */  0xDB, 0x2A, 0x3A, 0xCE, 0x50, 0x7D, 0x39, 0xCC,  // .*:.P}9.
                                /* 0920 */  0x42, 0x21, 0x15, 0x20, 0xD7, 0x24, 0x05, 0xA6,  // B!. .$..
                                /* 0928 */  0x59, 0xBE, 0x25, 0x52, 0x52, 0x35, 0xC1, 0xAF,  // Y.%RR5..
                                /* 0930 */  0x04, 0x24, 0xDD, 0x49, 0x39, 0xB5, 0x6F, 0xCD,  // .$.I9.o.
                                /* 0938 */  0x10, 0x9D, 0xF6, 0x69, 0xD9, 0x29, 0xFB, 0xAB,  // ...i.)..
                                /* 0940 */  0x87, 0x41, 0x97, 0xB0, 0x16, 0x22, 0xE5, 0xFB,  // .A..."..
                                /* 0948 */  0xBD, 0xCB, 0x0C, 0x2A, 0xFA, 0xF2, 0x63, 0xC4,  // ...*..c.
                                /* 0950 */  0xF2, 0x52, 0x7D, 0x51, 0x55, 0xEB, 0x92, 0xC6,  // .R}QU...
                                /* 0958 */  0xEC, 0xFC, 0x44, 0x30, 0xE5, 0xCD, 0x4B, 0x0F,  // ..D0..K.
                                /* 0960 */  0xFB, 0xFC, 0x47, 0x18, 0x88, 0xC8, 0x64, 0x19,  // ..G...d.
                                /* 0968 */  0x2D, 0x72, 0xD6, 0x31, 0x06, 0x9D, 0x19, 0xD9,  // -r.1....
                                /* 0970 */  0xA3, 0xF9, 0xA8, 0xB3, 0x3C, 0x20, 0x03, 0xA6,  // ....< ..
                                /* 0978 */  0x79, 0xB9, 0x35, 0x24, 0xA6, 0x8A, 0xDC, 0x9A,  // y.5$....
                                /* 0980 */  0x68, 0x8A, 0x24, 0x26, 0xEA, 0xEA, 0x0A, 0xAB,  // h.$&....
                                /* 0988 */  0x63, 0x65, 0x38, 0xCA, 0x98, 0x98, 0xA8, 0xC4,  // ce8.....
                                /* 0990 */  0x2B, 0xD5, 0xF4, 0xEF, 0xB8, 0x69, 0x9A, 0x8E,  // +....i..
                                /* 0998 */  0xB8, 0x53, 0x56, 0xA8, 0x97, 0x34, 0x33, 0xF4,  // .SV..43.
                                /* 09A0 */  0xEC, 0xC7, 0x0F, 0x00, 0xDE, 0x51, 0xF7, 0x6C,  // .....Q.l
                                /* 09A8 */  0xAA, 0xB7, 0xA5, 0x25, 0x7C, 0x0B, 0x59, 0xD2,  // ...%|.Y.
                                /* 09B0 */  0xE2, 0x6F, 0xD7, 0x14, 0x5C, 0x22, 0xCC, 0x88,  // .o..\"..
                                /* 09B8 */  0x55, 0xCE, 0x44, 0x51, 0x4E, 0x28, 0xDD, 0x2C,  // U.DQN(.,
                                /* 09C0 */  0x8D, 0x69, 0x34, 0x0B, 0x3A, 0x50, 0x17, 0xEE,  // .i4.:P..
                                /* 09C8 */  0x67, 0x79, 0xD2, 0x95, 0x03, 0xE7, 0x22, 0xDB,  // gy....".
                                /* 09D0 */  0x13, 0x19, 0x5F, 0x4E, 0x34, 0x00, 0x5A, 0xF3,  // .._N4.Z.
                                /* 09D8 */  0x70, 0x4F, 0xBB, 0xED, 0x39, 0xDE, 0xB5, 0xBB,  // pO..9...
                                /* 09E0 */  0x96, 0x5F, 0xE5, 0xCA, 0xE5, 0x59, 0x13, 0x83,  // ._...Y..
                                /* 09E8 */  0x67, 0x05, 0x4A, 0x89, 0x1C, 0x26, 0x4D, 0x34,  // g.J..&M4
                                /* 09F0 */  0x31, 0x06, 0x74, 0xDD, 0xBA, 0xF4, 0x40, 0x53,  // 1.t...@S
                                /* 09F8 */  0x6E, 0x16, 0x3F, 0x67, 0x8C, 0xB6, 0xFF, 0x3E,  // n.?g...>
                                /* 0A00 */  0xB1, 0x87, 0x8B, 0xCB, 0x3D, 0x49, 0xF8, 0xB3,  // ....=I..
                                /* 0A08 */  0xB7, 0xD8, 0x1A, 0x10, 0x07, 0xB3, 0xD1, 0x27,  // .......'
                                /* 0A10 */  0x73, 0x65, 0x01, 0xD5, 0x2A, 0x8F, 0x8D, 0x1E,  // se..*...
                                /* 0A18 */  0xA8, 0x16, 0x35, 0x0E, 0xC8, 0xAC, 0xC8, 0x4B,  // ..5....K
                                /* 0A20 */  0x66, 0xC3, 0x90, 0x8E, 0xEC, 0x1E, 0x92, 0x45,  // f......E
                                /* 0A28 */  0x1A, 0x64, 0x70, 0x45, 0x59, 0x77, 0xDD, 0xDE,  // .dpEYw..
                                /* 0A30 */  0x9A, 0x17, 0x6E, 0x0A, 0x4F, 0xE2, 0xF9, 0x8B,  // ..n.O...
                                /* 0A38 */  0x6D, 0x69, 0x28, 0x21, 0xB5, 0x10, 0xE1, 0xBD,  // mi(!....
                                /* 0A40 */  0x8B, 0xF1, 0x6B, 0x9B, 0x10, 0x20, 0x31, 0x2C,  // ..k.. 1,
                                /* 0A48 */  0xF1, 0x44, 0x23, 0x64, 0xCF, 0x9C, 0xC9, 0x17,  // .D#d....
                                /* 0A50 */  0xF5, 0xA1, 0x66, 0x4A, 0xBA, 0xBF, 0x79, 0x17,  // ..fJ..y.
                                /* 0A58 */  0xD0, 0x35, 0xD1, 0xFD, 0x81, 0x3C, 0x3D, 0xCB,  // .5...<=.
                                /* 0A60 */  0x78, 0x9D, 0xBC, 0x1B, 0xDA, 0xC9, 0xC7, 0xAE,  // x.......
                                /* 0A68 */  0x5D, 0xD5, 0x89, 0x26, 0x0D, 0xBB, 0x73, 0x68,  // ]..&..sh
                                /* 0A70 */  0x86, 0xC8, 0x96, 0x24, 0xD8, 0xEF, 0x72, 0xAA,  // ...$..r.
                                /* 0A78 */  0x6D, 0x42, 0x0E, 0xD1, 0x6B, 0x46, 0x61, 0x77,  // mB..kFaw
                                /* 0A80 */  0x97, 0x11, 0x45, 0x2D, 0x1E, 0x59, 0x21, 0x2D,  // ..E-.Y!-
                                /* 0A88 */  0xE7, 0x78, 0x70, 0xB3, 0xFA, 0x3D, 0x38, 0xF3,  // .xp..=8.
                                /* 0A90 */  0x0A, 0xAF, 0x37, 0x8E, 0xDF, 0x98, 0x50, 0xFB,  // ..7...P.
                                /* 0A98 */  0x54, 0xB9, 0xB9, 0xDF, 0x95, 0xE8, 0x57, 0xD5,  // T.....W.
                                /* 0AA0 */  0xC2, 0xF4, 0x52, 0xBF, 0x1B, 0x8F, 0xC4, 0x8B,  // ..R.....
                                /* 0AA8 */  0xFA, 0xBC, 0x37, 0xE5, 0xCD, 0xE9, 0x15, 0x70,  // ..7....p
                                /* 0AB0 */  0x1E, 0xC5, 0x59, 0x15, 0xA4, 0x17, 0x6C, 0xB2,  // ..Y...l.
                                /* 0AB8 */  0xB8, 0x41, 0xA9, 0x36, 0x49, 0xD5, 0xFE, 0xAE,  // .A.6I...
                                /* 0AC0 */  0x3B, 0xB6, 0x8E, 0xAB, 0x89, 0x49, 0xD8, 0xD4,  // ;....I..
                                /* 0AC8 */  0x1B, 0xA1, 0xC9, 0x8B, 0x8E, 0xD6, 0xE5, 0xAE,  // ........
                                /* 0AD0 */  0x36, 0x3B, 0x51, 0xD6, 0x37, 0x8B, 0xFE, 0x48,  // 6;Q.7..H
                                /* 0AD8 */  0xB6, 0x26, 0xAF, 0x59, 0xE1, 0xBE, 0xCF, 0x70,  // .&.Y...p
                                /* 0AE0 */  0x47, 0x62, 0x1A, 0x42, 0xD0, 0xBF, 0xA4, 0x53,  // Gb.B...S
                                /* 0AE8 */  0x44, 0x8E, 0xAB, 0x51, 0x5A, 0x0D, 0x34, 0x5F,  // D..QZ.4_
                                /* 0AF0 */  0x08, 0xE3, 0xD6, 0xBB, 0x44, 0x3F, 0x78, 0x42,  // ....D?xB
                                /* 0AF8 */  0x1C, 0x62, 0x0A, 0xDE, 0xF8, 0x9C, 0x93, 0xD6,  // .b......
                                /* 0B00 */  0xDA, 0x95, 0xA8, 0x43, 0x76, 0xDB, 0xFB, 0x56,  // ...Cv..V
                                /* 0B08 */  0x0C, 0x20, 0xD0, 0xAE, 0x34, 0x10, 0xD1, 0xA4,  // . ..4...
                                /* 0B10 */  0x6B, 0xB6, 0xB0, 0x12, 0x90, 0x6A, 0x52, 0x67,  // k....jRg
                                /* 0B18 */  0xDE, 0x0B, 0x62, 0xD6, 0x3C, 0x48, 0x43, 0x60,  // ..b.<HC`
                                /* 0B20 */  0x16, 0x2E, 0x93, 0x29, 0x78, 0xE0, 0xD7, 0xA0,  // ...)x...
                                /* 0B28 */  0x3C, 0xFE, 0x66, 0x04, 0x3C, 0x35, 0xC1, 0xF6,  // <.f.<5..
                                /* 0B30 */  0x40, 0x53, 0x6B, 0xE6, 0x2B, 0x4C, 0x97, 0xF7,  // @Sk.+L..
                                /* 0B38 */  0xCF, 0x86, 0x5F, 0x2A, 0xD4, 0xF5, 0x7F, 0xAC,  // .._*....
                                /* 0B40 */  0x8D, 0xA2, 0x94, 0xC2, 0xA4, 0x3B, 0x9F, 0x6E,  // .....;.n
                                /* 0B48 */  0xFB, 0x63, 0x4D, 0x43, 0xCD, 0x04, 0x27, 0xB1,  // .cMC..'.
                                /* 0B50 */  0x9B, 0xA1, 0x43, 0x03, 0xE5, 0x51, 0x29, 0x51,  // ..C..Q)Q
                                /* 0B58 */  0x22, 0x26, 0xA8, 0x4F, 0xCE, 0x49, 0xD2, 0xFC,  // "&.O.I..
                                /* 0B60 */  0x67, 0x4C, 0x91, 0x1B, 0x88, 0x35, 0xCA, 0x59,  // gL...5.Y
                                /* 0B68 */  0x33, 0x3E, 0x26, 0xD6, 0x84, 0x01, 0x38, 0xDC,  // 3>&...8.
                                /* 0B70 */  0x90, 0xE0, 0xBE, 0xF7, 0x2C, 0x65, 0x1D, 0xD7,  // ....,e..
                                /* 0B78 */  0x2D, 0xEB, 0x88, 0xF0, 0x31, 0x28, 0xED, 0x13,  // -...1(..
                                /* 0B80 */  0xB4, 0x73, 0x58, 0xB4, 0x6C, 0x0C, 0x2B, 0x38,  // .sX.l.+8
                                /* 0B88 */  0x2A, 0x13, 0x19, 0xFF, 0x81, 0xB9, 0x38, 0xED,  // *.....8.
                                /* 0B90 */  0x5F, 0xD4, 0x28, 0xBB, 0x5C, 0x80, 0xBC, 0xB3,  // _.(.\...
                                /* 0B98 */  0xAF, 0x18, 0x7B, 0x5A, 0xBA, 0x65, 0xD9, 0x34,  // ..{Z.e.4
                                /* 0BA0 */  0xD3, 0x39, 0x8A, 0x0A, 0xF4, 0xF9, 0xCB, 0x55,  // .9.....U
                                /* 0BA8 */  0xFC, 0x88, 0x62, 0x6E, 0xE8, 0x8E, 0x33, 0x71,  // ..bn..3q
                                /* 0BB0 */  0xB9, 0xA6, 0x17, 0x66, 0x7C, 0x9E, 0x5E, 0xC4,  // ...f|.^.
                                /* 0BB8 */  0xC8, 0x5F, 0x84, 0xFF, 0x56, 0xC9, 0x6C, 0xF6,  // ._..V.l.
                                /* 0BC0 */  0x71, 0x69, 0x52, 0x97, 0x7E, 0xFF, 0xAC, 0x92,  // qiR.~...
                                /* 0BC8 */  0x50, 0x17, 0x50, 0x45, 0xDC, 0xFA, 0xAA, 0xAB,  // P.PE....
                                /* 0BD0 */  0x51, 0xD2, 0xA5, 0x05, 0x98, 0xD0, 0xA3, 0x33,  // Q......3
                                /* 0BD8 */  0x54, 0xD6, 0x52, 0x2E, 0x98, 0x5F, 0xFF, 0xB1,  // T.R.._..
                                /* 0BE0 */  0x81, 0xBE, 0xF5, 0x19, 0x37, 0xF1, 0x37, 0xDD,  // ....7.7.
                                /* 0BE8 */  0x22, 0x0F, 0xE2, 0xB6, 0xDC, 0x8B, 0x6D, 0x56,  // ".....mV
                                /* 0BF0 */  0x0A, 0x30, 0x2F, 0x2F, 0xDA, 0x24, 0xCF, 0x83,  // .0//.$..
                                /* 0BF8 */  0x4B, 0x08, 0x28, 0x42, 0xE4, 0xBB, 0x7F, 0xA3,  // K.(B....
                                /* 0C00 */  0x58, 0x45, 0x63, 0x54, 0xFD, 0xEC, 0x8E, 0x79,  // XEcT...y
                                /* 0C08 */  0xF7, 0x92, 0x26, 0x72, 0x7B, 0xEC, 0xC6, 0x76,  // ..&r{..v
                                /* 0C10 */  0xF4, 0x49, 0x23, 0x60, 0x2D, 0x7A, 0xA7, 0x39,  // .I#`-z.9
                                /* 0C18 */  0x70, 0x90, 0xFD, 0x29, 0x7A, 0xCA, 0xDD, 0xFF,  // p..)z...
                                /* 0C20 */  0x7A, 0x63, 0xF9, 0xD0, 0x51, 0x5D, 0xBC, 0x25,  // zc..Q].%
                                /* 0C28 */  0xF1, 0x9D, 0xDE, 0xF8, 0xCB, 0x86, 0x58, 0x5A,  // ......XZ
                                /* 0C30 */  0x64, 0xAB, 0x10, 0xBC, 0xE8, 0xCC, 0x8F, 0x66,  // d......f
                                /* 0C38 */  0x69, 0x33, 0x26, 0x72, 0x48, 0xE6, 0x59, 0x3F,  // i3&rH.Y?
                                /* 0C40 */  0x2E, 0x39, 0x5C, 0xA9, 0xEA, 0xF0, 0x20, 0x87,  // .9\... .
                                /* 0C48 */  0xA4, 0x6C, 0xD0, 0xF9, 0x18, 0x23, 0x98, 0xED,  // .l...#..
                                /* 0C50 */  0x1B, 0x20, 0xEF, 0x6B, 0x00, 0xFE, 0x98, 0xEB,  // . .k....
                                /* 0C58 */  0x0A, 0xF1, 0x4F, 0x9B, 0x06, 0x74, 0x6E, 0x02,  // ..O..tn.
                                /* 0C60 */  0x63, 0x44, 0x5A, 0xF3, 0x2C, 0x16, 0x3A, 0x66,  // cDZ.,.:f
                                /* 0C68 */  0x4F, 0x18, 0x00, 0x00                           // O...
                            }
                        })
                    }
                }
            }

            Method (IMOK, 1, NotSerialized)
            {
                Return (Arg0)
            }

            Method (DTNS, 1, NotSerialized)
            {
                Local0 = Arg0
                If ((Local0 & 0x10))
                {
                    ADBG ("Notify Sensor 5")
                    Notify (\_SB.IETM.SEN5, 0x90) // Device-Specific
                }

                If ((Local0 & 0x08))
                {
                    ADBG ("Notify Sensor 4")
                    Notify (\_SB.IETM.SEN4, 0x90) // Device-Specific
                }

                If ((Local0 & 0x04))
                {
                    ADBG ("Notify Sensor 3")
                    Notify (\_SB.IETM.SEN3, 0x90) // Device-Specific
                }

                If ((Local0 & 0x02))
                {
                    ADBG ("Notify Sensor 2")
                    Notify (\_SB.IETM.SEN2, 0x90) // Device-Specific
                }
            }
        }
    }

    Scope (\_SB.IETM)
    {
        Method (KTOC, 1, Serialized)
        {
            If ((Arg0 > 0x0AAC))
            {
                Return (((Arg0 - 0x0AAC) / 0x0A))
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (CTOK, 1, Serialized)
        {
            Return (((Arg0 * 0x0A) + 0x0AAC))
        }

        Method (C10K, 1, Serialized)
        {
            Name (TMP1, Buffer (0x10)
            {
                 0x00                                             // .
            })
            CreateByteField (TMP1, Zero, TMPL)
            CreateByteField (TMP1, One, TMPH)
            Local0 = (Arg0 + 0x0AAC)
            TMPL = (Local0 & 0xFF)
            TMPH = ((Local0 & 0xFF00) >> 0x08)
            ToInteger (TMP1, Local1)
            Return (Local1)
        }

        Method (K10C, 1, Serialized)
        {
            If ((Arg0 > 0x0AAC))
            {
                Return ((Arg0 - 0x0AAC))
            }
            Else
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.IETM)
    {
        OperationRegion (ITE8, SystemIO, 0x4E, 0x02)
        Field (ITE8, ByteAcc, Lock, Preserve)
        {
            INDX,   8, 
            DATA,   8
        }

        OperationRegion (ITT8, SystemIO, 0x0295, 0x02)
        Field (ITT8, ByteAcc, Lock, Preserve)
        {
            INDT,   8, 
            DATT,   8
        }

        IndexField (INDX, DATA, ByteAcc, Lock, Preserve)
        {
            Offset (0x07), 
            IT07,   8, 
            Offset (0x20), 
            IT20,   8, 
            IT21,   8, 
            IT22,   8, 
            IT23,   8, 
            IT24,   8, 
            IT25,   8, 
            IT26,   8, 
            IT27,   8, 
            IT28,   8, 
            IT29,   8, 
            IT2A,   8, 
            Offset (0x30), 
            IT30,   8, 
            Offset (0x60), 
            IT60,   8, 
            IT61,   8, 
            Offset (0x70), 
            IT70,   8, 
            IT71,   8, 
            Offset (0x74), 
            IT74,   8, 
            IT75,   8, 
            Offset (0xF0), 
            ITF0,   8, 
            ITF1,   8
        }

        Method (ENFG, 1, NotSerialized)
        {
            INDX = 0x87
            INDX = One
            INDX = 0x55
            INDX = 0xAA
            IT07 = Arg0
        }

        Method (EXFG, 0, NotSerialized)
        {
            INDX = 0x02
            DATA = 0x02
        }
    }

    Scope (\_SB.IETM)
    {
        Device (CHRG)
        {
            Name (_UID, "CHRG")  // _UID: Unique ID
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return (\_SB.PLDT.GHID (_UID))
            }

            Name (_STR, Unicode ("Charger"))  // _STR: Description String
            Name (PTYP, 0x0B)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\_SB.CHGE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (PSSS, Zero)
            Name (PPPS, Zero)
            Name (PPS1, Package (0x08)
            {
                Package (0x08)
                {
                    0x64, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x0DAC, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x55, 
                    Zero, 
                    Zero, 
                    Zero, 
                    One, 
                    0x0BB8, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x47, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x02, 
                    0x09C4, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x39, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x03, 
                    0x07D0, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x2A, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x04, 
                    0x05DC, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x1C, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x05, 
                    0x03E8, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x0E, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x06, 
                    0x01F4, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x07, 
                    Zero, 
                    "MilliAmps", 
                    Zero
                }
            })
            Name (PPS2, Package (0x0A)
            {
                Package (0x08)
                {
                    0x64, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x1194, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x58, 
                    Zero, 
                    Zero, 
                    Zero, 
                    One, 
                    0x0FA0, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x4D, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x02, 
                    0x0DAC, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x42, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x03, 
                    0x0BB8, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x37, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x04, 
                    0x09C4, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x2C, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x05, 
                    0x07D0, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x21, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x06, 
                    0x05DC, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x16, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x07, 
                    0x03E8, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x0B, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x08, 
                    0x01F4, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x09, 
                    Zero, 
                    "MilliAmps", 
                    Zero
                }
            })
            Name (PPS3, Package (0x04)
            {
                Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x3A98, 
                    "MilliVoltage", 
                    Zero
                }, 

                Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    One, 
                    0x2EE0, 
                    "MilliVoltage", 
                    Zero
                }, 

                Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x02, 
                    Zero, 
                    "", 
                    Zero
                }, 

                Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x03, 
                    Zero, 
                    "", 
                    Zero
                }
            })
            Method (PPSS, 0, Serialized)
            {
                ADBG ("DTT calls PPSS")
                If (((ODV0 == One) && (ODV1 == One)))
                {
                    ADBG ("PPSS: selecting PPS")
                    Return (PPS3) /* \_SB_.IETM.CHRG.PPS3 */
                }
                ElseIf ((CondRefOf (\_SB.PC00.LPCB.H_EC.DPTF.FCHG) && (\_SB.PC00.LPCB.H_EC.DPTF.FCHG () == One)))
                {
                    ADBG ("PPSS: selecting FCHG")
                    Return (PPS2) /* \_SB_.IETM.CHRG.PPS2 */
                }
                Else
                {
                    ADBG ("PPSS: FCHG and PPS are not available")
                    Return (PPS1) /* \_SB_.IETM.CHRG.PPS1 */
                }
            }

            Method (PCAL, 0, Serialized)
            {
                ADBG ("PCAL!")
                If (((ODV0 == One) && (ODV1 == One)))
                {
                    ADBG ("Save PPS package size to PSSS!")
                    PSSS = SizeOf (PPS3)
                }
                ElseIf ((CondRefOf (\_SB.PC00.LPCB.H_EC.DPTF.FCHG) && (\_SB.PC00.LPCB.H_EC.DPTF.FCHG () == One)))
                {
                    PSSS = SizeOf (PPS2)
                }
                Else
                {
                    ADBG ("PCAL: FCHG not available")
                    PSSS = SizeOf (PPS1)
                }
            }

            Method (PPPC, 0, NotSerialized)
            {
                ADBG ("PPPC return the present p-state!")
                Return (PPPS) /* \_SB_.IETM.CHRG.PPPS */
            }

            Method (SPPC, 1, Serialized)
            {
                ADBG ("SPPC to transfer the selected power package!")
                ADBG (Concatenate ("Package Index: ", ToHexString (Arg0)))
                If (CondRefOf (\_SB.PC00.LPCB.H_EC.DPTF.SCHG))
                {
                    PCAL ()
                    If ((ToInteger (Arg0) <= (PSSS - One)))
                    {
                        If (((ODV0 == One) && (ODV1 == One)))
                        {
                            Local1 = DerefOf (DerefOf (PPS3 [Arg0]) [0x04])
                            ADBG (Concatenate ("PPS p-state value:", ToHexString (Local1)))
                            PPPS = Local1
                            If (CondRefOf (\_SB.PC00.LPCB.H_EC.DPTF.UPPM))
                            {
                                ADBG (Concatenate ("PPS sets P-state: ", ToHexString (Local1)))
                                \_SB.PC00.LPCB.H_EC.DPTF.UPPM (Local1)
                            }
                        }
                        ElseIf ((CondRefOf (\_SB.PC00.LPCB.H_EC.DPTF.FCHG) && (\_SB.PC00.LPCB.H_EC.DPTF.FCHG () == One)))
                        {
                            Local1 = DerefOf (DerefOf (PPS2 [Arg0]) [0x05])
                            PPPS = DerefOf (DerefOf (PPS2 [Arg0]) [0x04])
                            \_SB.PC00.LPCB.H_EC.DPTF.SCHG (Local1)
                        }
                        Else
                        {
                            Local1 = DerefOf (DerefOf (PPS1 [Arg0]) [0x05])
                            PPPS = DerefOf (DerefOf (PPS1 [Arg0]) [0x04])
                            \_SB.PC00.LPCB.H_EC.DPTF.SCHG (Local1)
                        }
                    }

                    Return (Zero)
                }

                ADBG ("SPPC: SCHG not available")
            }

            Method (PPDL, 0, NotSerialized)
            {
                ADBG ("DTT calls PPDL")
                PCAL ()
                Return ((PSSS - One))
            }
        }
    }

    Scope (\_SB.IETM)
    {
        Device (BAT1)
        {
            Name (_UID, "1")  // _UID: Unique ID
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return (\_SB.PLDT.GHID (_UID))
            }

            Name (_STR, Unicode ("Battery 1 Participant"))  // _STR: Description String
            Name (PTYP, 0x0C)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\_SB.BATR == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (PMAX, 0, Serialized)
            {
                If (CondRefOf (\_SB.PC00.LPCB.H_EC.DPTF.BMAX))
                {
                    Local0 = \_SB.PC00.LPCB.H_EC.DPTF.BMAX ()
                    If ((Local0 != 0xFFFFFFFF))
                    {
                        If (Local0)
                        {
                            Local0 = ~Local0 |= 0xFFFF0000
                            Local0 = (Local0 += One * 0x0A)
                        }

                        Return (Local0)
                    }
                }

                ADBG ("PMAX: EC not available")
                Return (Zero)
            }

            Method (CTYP, 0, NotSerialized)
            {
                If (CondRefOf (\_SB.PC00.LPCB.H_EC.DPTF.CTYP))
                {
                    Local0 = \_SB.PC00.LPCB.H_EC.DPTF.CTYP ()
                    If ((Local0 != 0xFFFFFFFF))
                    {
                        Return (Local0)
                    }
                }

                ADBG ("CTYP: EC not available")
                Return (0x03)
            }

            Method (PBSS, 0, NotSerialized)
            {
                If (CondRefOf (\_SB.PC00.LPCB.H_EC.DPTF.PBSS))
                {
                    Local0 = \_SB.PC00.LPCB.H_EC.DPTF.PBSS ()
                    If ((Local0 != 0xFFFFFFFF))
                    {
                        Return (Local0)
                    }
                }

                ADBG ("PBSS: EC not available")
                Return (0x64)
            }

            Method (DPSP, 0, Serialized)
            {
                Return (\_SB.PPPR)
            }

            Method (RBHF, 0, NotSerialized)
            {
                If (CondRefOf (\_SB.PC00.LPCB.H_EC.DPTF.RBHF))
                {
                    Local0 = \_SB.PC00.LPCB.H_EC.DPTF.RBHF ()
                    If ((Local0 != 0xFFFFFFFF))
                    {
                        Return (Local0)
                    }
                }

                ADBG ("RBHF: EC not available")
                Return (0xFFFFFFFF)
            }

            Method (VBNL, 0, NotSerialized)
            {
                If (CondRefOf (\_SB.PC00.LPCB.H_EC.DPTF.VBNL))
                {
                    Local0 = \_SB.PC00.LPCB.H_EC.DPTF.VBNL ()
                    If ((Local0 != 0xFFFFFFFF))
                    {
                        Return (Local0)
                    }
                }

                ADBG ("VBNL: EC not available")
                Return (0xFFFFFFFF)
            }

            Method (CMPP, 0, NotSerialized)
            {
                If (CondRefOf (\_SB.PC00.LPCB.H_EC.DPTF.CMPP))
                {
                    Local0 = \_SB.PC00.LPCB.H_EC.DPTF.CMPP ()
                    If ((Local0 != 0xFFFFFFFF))
                    {
                        Return (Local0)
                    }
                }

                ADBG ("CMPP: EC not available")
                Return (0xFFFFFFFF)
            }
        }
    }

    Scope (\_SB.IETM)
    {
        Device (SEN1)
        {
            Name (_UID, "SEN1")  // _UID: Unique ID
            Name (_STR, Unicode ("CPU temperature"))  // _STR: Description String
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Name (GTSH, 0x14)
            Name (SNID, Zero)
            Name (SNAC, 0x6E)
            Name (SNA1, 0x6E)
            Name (SNA2, 0x6E)
            Name (SNPV, 0x6E)
            Name (SNCC, 0x6E)
            Name (SNC3, 0x6E)
            Name (SNHP, 0x6E)
            Name (SNSP, 0x0A)
            Name (PTYP, 0x03)
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return (\_SB.PLDT.GHID (_UID))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                Switch (ToInteger (SNID))
                {
                    Case (Zero)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR3))
                    }
                    Case (One)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR4))
                    }
                    Case (0x02)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR6))
                    }
                    Case (0x03)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR8))
                    }
                    Case (0x04)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR7))
                    }
                    Default
                    {
                        Return (0x0BB8)
                    }

                }

                ADBG ("_TMP: SNRD not available")
                Return (Zero)
            }

            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (^, 0x91) // Device-Specific
                ADBG (Concatenate ("DTI SEN ID: ", ToDecimalString ((SNID + One))))
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (SNSP) /* \_SB_.IETM.SEN1.SNSP */
            }

            Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Local1 = \_SB.IETM.CTOK (SNAC)
                If ((LSTM >= Local1))
                {
                    Return ((Local1 - GTSH))
                }
                Else
                {
                    Return (Local1)
                }
            }

            Method (_AC1, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return (\_SB.IETM.CTOK (SNA1))
            }

            Method (_AC2, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return (\_SB.IETM.CTOK (SNA2))
            }

            Method (_PSV, 0, Serialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.IETM.CTOK (SNPV))
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.IETM.CTOK (SNCC))
            }

            Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
            {
                Return (\_SB.IETM.CTOK (SNC3))
            }

            Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
            {
                Return (\_SB.IETM.CTOK (SNHP))
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\_SB.S1DE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (PATC, 0x02)
            Method (PAT0, 1, Serialized)
            {
            }

            Method (PAT1, 1, Serialized)
            {
            }
        }
    }

    Scope (\_SB.IETM)
    {
        Device (SEN2)
        {
            Name (_UID, "SEN2")  // _UID: Unique ID
            Name (_STR, Unicode ("DGPU temperature"))  // _STR: Description String
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Name (GTSH, 0x14)
            Name (SNID, One)
            Name (SNAC, 0x6E)
            Name (SNA1, 0x6E)
            Name (SNA2, 0x6E)
            Name (SNPV, 0x6E)
            Name (SNCC, 0x6E)
            Name (SNC3, 0x6E)
            Name (SNHP, 0x6E)
            Name (SNSP, 0x0A)
            Name (PTYP, 0x03)
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return (\_SB.PLDT.GHID (_UID))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                Switch (ToInteger (SNID))
                {
                    Case (Zero)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR3))
                    }
                    Case (One)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR4))
                    }
                    Case (0x02)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR6))
                    }
                    Case (0x03)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR8))
                    }
                    Case (0x04)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR7))
                    }
                    Default
                    {
                        Return (0x0BB8)
                    }

                }

                ADBG ("_TMP: SNRD not available")
                Return (Zero)
            }

            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (^, 0x91) // Device-Specific
                ADBG (Concatenate ("DTI SEN ID: ", ToDecimalString ((SNID + One))))
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (SNSP) /* \_SB_.IETM.SEN2.SNSP */
            }

            Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Local1 = \_SB.IETM.CTOK (SNAC)
                If ((LSTM >= Local1))
                {
                    Return ((Local1 - GTSH))
                }
                Else
                {
                    Return (Local1)
                }
            }

            Method (_AC1, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return (\_SB.IETM.CTOK (SNA1))
            }

            Method (_AC2, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return (\_SB.IETM.CTOK (SNA2))
            }

            Method (_PSV, 0, Serialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.IETM.CTOK (SNPV))
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.IETM.CTOK (SNCC))
            }

            Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
            {
                Return (\_SB.IETM.CTOK (SNC3))
            }

            Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
            {
                Return (\_SB.IETM.CTOK (SNHP))
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\_SB.S2DE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (PATC, 0x02)
            Method (PAT0, 1, Serialized)
            {
            }

            Method (PAT1, 1, Serialized)
            {
            }
        }
    }

    Scope (\_SB.IETM)
    {
        Device (SEN3)
        {
            Name (_UID, "SEN3")  // _UID: Unique ID
            Name (_STR, Unicode ("Charger temperature"))  // _STR: Description String
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Name (GTSH, 0x14)
            Name (SNID, 0x02)
            Name (SNAC, 0x6E)
            Name (SNA1, 0x6E)
            Name (SNA2, 0x6E)
            Name (SNPV, 0x6E)
            Name (SNCC, 0x6E)
            Name (SNC3, 0x6E)
            Name (SNHP, 0x6E)
            Name (SNSP, 0x0A)
            Name (PTYP, 0x03)
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return (\_SB.PLDT.GHID (_UID))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                Switch (ToInteger (SNID))
                {
                    Case (Zero)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR3))
                    }
                    Case (One)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR4))
                    }
                    Case (0x02)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR6))
                    }
                    Case (0x03)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR8))
                    }
                    Case (0x04)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR7))
                    }
                    Default
                    {
                        Return (0x0BB8)
                    }

                }

                ADBG ("_TMP: SNRD not available")
                Return (Zero)
            }

            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (^, 0x91) // Device-Specific
                ADBG (Concatenate ("DTI SEN ID: ", ToDecimalString ((SNID + One))))
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (SNSP) /* \_SB_.IETM.SEN3.SNSP */
            }

            Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Local1 = \_SB.IETM.CTOK (SNAC)
                If ((LSTM >= Local1))
                {
                    Return ((Local1 - GTSH))
                }
                Else
                {
                    Return (Local1)
                }
            }

            Method (_AC1, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return (\_SB.IETM.CTOK (SNA1))
            }

            Method (_AC2, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return (\_SB.IETM.CTOK (SNA2))
            }

            Method (_PSV, 0, Serialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.IETM.CTOK (SNPV))
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.IETM.CTOK (SNCC))
            }

            Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
            {
                Return (\_SB.IETM.CTOK (SNC3))
            }

            Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
            {
                Return (\_SB.IETM.CTOK (SNHP))
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\_SB.S3DE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (PATC, 0x02)
            Method (PAT0, 1, Serialized)
            {
            }

            Method (PAT1, 1, Serialized)
            {
            }
        }
    }

    Scope (\_SB.IETM)
    {
        Device (SEN4)
        {
            Name (_UID, "SEN4")  // _UID: Unique ID
            Name (_STR, Unicode ("Ambient temperature"))  // _STR: Description String
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Name (GTSH, 0x14)
            Name (SNID, 0x03)
            Name (SNAC, 0x6E)
            Name (SNA1, 0x6E)
            Name (SNA2, 0x6E)
            Name (SNPV, 0x6E)
            Name (SNCC, 0x6E)
            Name (SNC3, 0x6E)
            Name (SNHP, 0x6E)
            Name (SNSP, 0x0A)
            Name (PTYP, 0x03)
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return (\_SB.PLDT.GHID (_UID))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                Switch (ToInteger (SNID))
                {
                    Case (Zero)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR3))
                    }
                    Case (One)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR4))
                    }
                    Case (0x02)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR6))
                    }
                    Case (0x03)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR8))
                    }
                    Case (0x04)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR7))
                    }
                    Default
                    {
                        Return (0x0BB8)
                    }

                }

                ADBG ("_TMP: SNRD not available")
                Return (Zero)
            }

            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (^, 0x91) // Device-Specific
                ADBG (Concatenate ("DTI SEN ID: ", ToDecimalString ((SNID + One))))
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (SNSP) /* \_SB_.IETM.SEN4.SNSP */
            }

            Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Local1 = \_SB.IETM.CTOK (SNAC)
                If ((LSTM >= Local1))
                {
                    Return ((Local1 - GTSH))
                }
                Else
                {
                    Return (Local1)
                }
            }

            Method (_AC1, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return (\_SB.IETM.CTOK (SNA1))
            }

            Method (_AC2, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return (\_SB.IETM.CTOK (SNA2))
            }

            Method (_PSV, 0, Serialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.IETM.CTOK (SNPV))
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.IETM.CTOK (SNCC))
            }

            Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
            {
                Return (\_SB.IETM.CTOK (SNC3))
            }

            Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
            {
                Return (\_SB.IETM.CTOK (SNHP))
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\_SB.S4DE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (PATC, 0x02)
            Method (PAT0, 1, Serialized)
            {
            }

            Method (PAT1, 1, Serialized)
            {
            }
        }
    }

    Scope (\_SB.IETM)
    {
        Device (SEN5)
        {
            Name (_UID, "SEN5")  // _UID: Unique ID
            Name (_STR, Unicode ("Type temperature"))  // _STR: Description String
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Name (GTSH, 0x14)
            Name (SNID, 0x04)
            Name (SNAC, 0x6E)
            Name (SNA1, 0x6E)
            Name (SNA2, 0x6E)
            Name (SNPV, 0x6E)
            Name (SNCC, 0x6E)
            Name (SNC3, 0x6E)
            Name (SNHP, 0x6E)
            Name (SNSP, 0x0A)
            Name (PTYP, 0x03)
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return (\_SB.PLDT.GHID (_UID))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                Switch (ToInteger (SNID))
                {
                    Case (Zero)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR3))
                    }
                    Case (One)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR4))
                    }
                    Case (0x02)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR6))
                    }
                    Case (0x03)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR8))
                    }
                    Case (0x04)
                    {
                        Return (\_SB.IETM.CTOK (\_SB.PC00.LPCB.Q_EC.TSR7))
                    }
                    Default
                    {
                        Return (0x0BB8)
                    }

                }

                ADBG ("_TMP: SNRD not available")
                Return (Zero)
            }

            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (^, 0x91) // Device-Specific
                ADBG (Concatenate ("DTI SEN ID: ", ToDecimalString ((SNID + One))))
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (SNSP) /* \_SB_.IETM.SEN5.SNSP */
            }

            Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Local1 = \_SB.IETM.CTOK (SNAC)
                If ((LSTM >= Local1))
                {
                    Return ((Local1 - GTSH))
                }
                Else
                {
                    Return (Local1)
                }
            }

            Method (_AC1, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return (\_SB.IETM.CTOK (SNA1))
            }

            Method (_AC2, 0, Serialized)  // _ACx: Active Cooling, x=0-9
            {
                Return (\_SB.IETM.CTOK (SNA2))
            }

            Method (_PSV, 0, Serialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.IETM.CTOK (SNPV))
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.IETM.CTOK (SNCC))
            }

            Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
            {
                Return (\_SB.IETM.CTOK (SNC3))
            }

            Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
            {
                Return (\_SB.IETM.CTOK (SNHP))
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\_SB.S5DE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (PATC, 0x02)
            Method (PAT0, 1, Serialized)
            {
            }

            Method (PAT1, 1, Serialized)
            {
            }
        }
    }

    Scope (\_SB.PC00.TCPU)
    {
        Name (PFLG, Zero)
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If ((\_SB.SADE == One))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }

        OperationRegion (CPWR, SystemMemory, ((\_SB.PC00.MC.MHBR << 0x0F) + 0x5000), 0x1000)
        Field (CPWR, ByteAcc, NoLock, Preserve)
        {
            Offset (0x930), 
            PTDP,   15, 
            Offset (0x932), 
            PMIN,   15, 
            Offset (0x934), 
            PMAX,   15, 
            Offset (0x936), 
            TMAX,   7, 
            Offset (0x938), 
            PWRU,   4, 
            Offset (0x939), 
            EGYU,   5, 
            Offset (0x93A), 
            TIMU,   4, 
            Offset (0x958), 
            Offset (0x95C), 
            LPMS,   1, 
            CTNL,   2, 
            Offset (0x978), 
            PCTP,   8, 
            Offset (0x998), 
            RP0C,   8, 
            RP1C,   8, 
            RPNC,   8, 
            Offset (0xF3C), 
            TRAT,   8, 
            Offset (0xF40), 
            PTD1,   15, 
            Offset (0xF42), 
            TRA1,   8, 
            Offset (0xF44), 
            PMX1,   15, 
            Offset (0xF46), 
            PMN1,   15, 
            Offset (0xF48), 
            PTD2,   15, 
            Offset (0xF4A), 
            TRA2,   8, 
            Offset (0xF4C), 
            PMX2,   15, 
            Offset (0xF4E), 
            PMN2,   15, 
            Offset (0xF50), 
            CTCL,   2, 
                ,   29, 
            CLCK,   1, 
            MNTR,   8
        }

        Name (XPCC, Zero)
        Method (PPCC, 0, Serialized)
        {
            If (((XPCC == Zero) && CondRefOf (\_SB.CBMI)))
            {
                Switch (ToInteger (\_SB.CBMI))
                {
                    Case (Zero)
                    {
                        If (((\_SB.CLVL >= One) && (\_SB.CLVL <= 0x03)))
                        {
                            CPL0 ()
                            XPCC = One
                        }
                    }
                    Case (One)
                    {
                        If (((\_SB.CLVL == 0x02) || (\_SB.CLVL == 0x03)))
                        {
                            CPL1 ()
                            XPCC = One
                        }
                    }
                    Case (0x02)
                    {
                        If ((\_SB.CLVL == 0x03))
                        {
                            CPL2 ()
                            XPCC = One
                        }
                    }

                }
            }

            Return (NPCC) /* \_SB_.PC00.TCPU.NPCC */
        }

        Name (NPCC, Package (0x03)
        {
            0x02, 
            Package (0x06)
            {
                Zero, 
                0x88B8, 
                0xAFC8, 
                0x6D60, 
                0x7D00, 
                0x03E8
            }, 

            Package (0x06)
            {
                One, 
                0xDBBA, 
                0xDBBA, 
                Zero, 
                Zero, 
                0x03E8
            }
        })
        Method (CPNU, 2, Serialized)
        {
            Name (CNVT, Zero)
            Name (PPUU, Zero)
            Name (RMDR, Zero)
            If ((PWRU == Zero))
            {
                PPUU = One
            }
            Else
            {
                PPUU = (PWRU-- << 0x02)
            }

            Divide (Arg0, PPUU, RMDR, CNVT) /* \_SB_.PC00.TCPU.CPNU.CNVT */
            If ((Arg1 == Zero))
            {
                Return (CNVT) /* \_SB_.PC00.TCPU.CPNU.CNVT */
            }
            Else
            {
                CNVT *= 0x03E8
                RMDR *= 0x03E8
                RMDR /= PPUU
                CNVT += RMDR /* \_SB_.PC00.TCPU.CPNU.RMDR */
                Return (CNVT) /* \_SB_.PC00.TCPU.CPNU.CNVT */
            }
        }

        Method (CPL0, 0, NotSerialized)
        {
            \_SB.PC00.TCPU.NPCC [Zero] = 0x02
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [Zero] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [One] = 0x7D
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x02] = CPNU (\_SB.PL10, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x03] = (\_SB.PLW0 * 0x03E8)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x04] = ((\_SB.PLW0 * 0x03E8
                ) + 0x0FA0)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x05] = PPSZ /* \_SB_.PPSZ */
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [Zero] = One
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [One] = CPNU (\_SB.PL20, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x02] = CPNU (\_SB.PL20, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x03] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x04] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x05] = PPSZ /* \_SB_.PPSZ */
        }

        Method (CPL1, 0, NotSerialized)
        {
            \_SB.PC00.TCPU.NPCC [Zero] = 0x02
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [Zero] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [One] = 0x7D
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x02] = CPNU (\_SB.PL11, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x03] = (\_SB.PLW1 * 0x03E8)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x04] = ((\_SB.PLW1 * 0x03E8
                ) + 0x0FA0)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x05] = PPSZ /* \_SB_.PPSZ */
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [Zero] = One
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [One] = CPNU (\_SB.PL21, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x02] = CPNU (\_SB.PL21, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x03] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x04] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x05] = PPSZ /* \_SB_.PPSZ */
        }

        Method (CPL2, 0, NotSerialized)
        {
            \_SB.PC00.TCPU.NPCC [Zero] = 0x02
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [Zero] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [One] = 0x7D
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x02] = CPNU (\_SB.PL12, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x03] = (\_SB.PLW2 * 0x03E8)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x04] = ((\_SB.PLW2 * 0x03E8
                ) + 0x0FA0)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x05] = PPSZ /* \_SB_.PPSZ */
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [Zero] = One
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [One] = CPNU (\_SB.PL22, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x02] = CPNU (\_SB.PL22, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x03] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x04] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x05] = PPSZ /* \_SB_.PPSZ */
        }

        Name (LSTM, Zero)
        Name (_PPC, Zero)  // _PPC: Performance Present Capabilities
        Method (SPPC, 1, Serialized)
        {
            If (CondRefOf (\_SB.CPPC))
            {
                \_SB.CPPC = Arg0
            }

            If ((ToInteger (\TCNT) > Zero))
            {
                Notify (\_SB.PR00, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > One))
            {
                Notify (\_SB.PR01, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x02))
            {
                Notify (\_SB.PR02, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x03))
            {
                Notify (\_SB.PR03, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x04))
            {
                Notify (\_SB.PR04, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x05))
            {
                Notify (\_SB.PR05, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x06))
            {
                Notify (\_SB.PR06, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x07))
            {
                Notify (\_SB.PR07, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x08))
            {
                Notify (\_SB.PR08, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x09))
            {
                Notify (\_SB.PR09, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x0A))
            {
                Notify (\_SB.PR10, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x0B))
            {
                Notify (\_SB.PR11, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x0C))
            {
                Notify (\_SB.PR12, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x0D))
            {
                Notify (\_SB.PR13, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x0E))
            {
                Notify (\_SB.PR14, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x0F))
            {
                Notify (\_SB.PR15, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x10))
            {
                Notify (\_SB.PR16, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x11))
            {
                Notify (\_SB.PR17, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x12))
            {
                Notify (\_SB.PR18, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x13))
            {
                Notify (\_SB.PR19, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x14))
            {
                Notify (\_SB.PR20, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x15))
            {
                Notify (\_SB.PR21, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x16))
            {
                Notify (\_SB.PR22, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x17))
            {
                Notify (\_SB.PR23, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x18))
            {
                Notify (\_SB.PR24, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x19))
            {
                Notify (\_SB.PR25, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x1A))
            {
                Notify (\_SB.PR26, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x1B))
            {
                Notify (\_SB.PR27, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x1C))
            {
                Notify (\_SB.PR28, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x1D))
            {
                Notify (\_SB.PR29, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x1E))
            {
                Notify (\_SB.PR30, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x1F))
            {
                Notify (\_SB.PR31, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x20))
            {
                Notify (\_SB.PR32, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x21))
            {
                Notify (\_SB.PR33, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x22))
            {
                Notify (\_SB.PR34, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x23))
            {
                Notify (\_SB.PR35, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x24))
            {
                Notify (\_SB.PR36, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x25))
            {
                Notify (\_SB.PR37, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x26))
            {
                Notify (\_SB.PR38, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x27))
            {
                Notify (\_SB.PR39, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x28))
            {
                Notify (\_SB.PR40, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x29))
            {
                Notify (\_SB.PR41, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x2A))
            {
                Notify (\_SB.PR42, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x2B))
            {
                Notify (\_SB.PR43, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x2C))
            {
                Notify (\_SB.PR44, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x2D))
            {
                Notify (\_SB.PR45, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x2E))
            {
                Notify (\_SB.PR46, 0x80) // Status Change
            }

            If ((ToInteger (\TCNT) > 0x2F))
            {
                Notify (\_SB.PR47, 0x80) // Status Change
            }
        }

        Method (SPUR, 1, NotSerialized)
        {
            ADBG (Concatenate ("SPUR, Arg0=", ToDecimalString (Arg0)))
            If ((Arg0 <= \TCNT))
            {
                If ((\_SB.PAGD._STA () == 0x0F))
                {
                    \_SB.PAGD._PUR [One] = Arg0
                    Notify (\_SB.PAGD, 0x80) // Status Change
                }
            }
        }

        Method (PCCC, 0, Serialized)
        {
            PCCX [Zero] = One
            Switch (ToInteger (CPNU (PTDP, Zero)))
            {
                Case (0x39)
                {
                    DerefOf (PCCX [One]) [Zero] = 0xA7F8
                    DerefOf (PCCX [One]) [One] = 0x00017318
                }
                Case (0x2F)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x9858
                    DerefOf (PCCX [One]) [One] = 0x00014C08
                }
                Case (0x25)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x7148
                    DerefOf (PCCX [One]) [One] = 0xD6D8
                }
                Case (0x19)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x3E80
                    DerefOf (PCCX [One]) [One] = 0x7D00
                }
                Case (0x0F)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x36B0
                    DerefOf (PCCX [One]) [One] = 0x7D00
                }
                Case (0x0B)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x36B0
                    DerefOf (PCCX [One]) [One] = 0x61A8
                }
                Default
                {
                    DerefOf (PCCX [One]) [Zero] = 0xFF
                    DerefOf (PCCX [One]) [One] = 0xFF
                }

            }

            Return (PCCX) /* \_SB_.PC00.TCPU.PCCX */
        }

        Name (PCCX, Package (0x02)
        {
            0x80000000, 
            Package (0x02)
            {
                0x80000000, 
                0x80000000
            }
        })
        Name (KEFF, Package (0x1E)
        {
            Package (0x02)
            {
                0x01BC, 
                Zero
            }, 

            Package (0x02)
            {
                0x01CF, 
                0x27
            }, 

            Package (0x02)
            {
                0x01E1, 
                0x4B
            }, 

            Package (0x02)
            {
                0x01F3, 
                0x6C
            }, 

            Package (0x02)
            {
                0x0206, 
                0x8B
            }, 

            Package (0x02)
            {
                0x0218, 
                0xA8
            }, 

            Package (0x02)
            {
                0x022A, 
                0xC3
            }, 

            Package (0x02)
            {
                0x023D, 
                0xDD
            }, 

            Package (0x02)
            {
                0x024F, 
                0xF4
            }, 

            Package (0x02)
            {
                0x0261, 
                0x010B
            }, 

            Package (0x02)
            {
                0x0274, 
                0x011F
            }, 

            Package (0x02)
            {
                0x032C, 
                0x01BD
            }, 

            Package (0x02)
            {
                0x03D7, 
                0x0227
            }, 

            Package (0x02)
            {
                0x048B, 
                0x026D
            }, 

            Package (0x02)
            {
                0x053E, 
                0x02A1
            }, 

            Package (0x02)
            {
                0x05F7, 
                0x02C6
            }, 

            Package (0x02)
            {
                0x06A8, 
                0x02E6
            }, 

            Package (0x02)
            {
                0x075D, 
                0x02FF
            }, 

            Package (0x02)
            {
                0x0818, 
                0x0311
            }, 

            Package (0x02)
            {
                0x08CF, 
                0x0322
            }, 

            Package (0x02)
            {
                0x179C, 
                0x0381
            }, 

            Package (0x02)
            {
                0x2DDC, 
                0x039C
            }, 

            Package (0x02)
            {
                0x44A8, 
                0x039E
            }, 

            Package (0x02)
            {
                0x5C35, 
                0x0397
            }, 

            Package (0x02)
            {
                0x747D, 
                0x038D
            }, 

            Package (0x02)
            {
                0x8D7F, 
                0x0382
            }, 

            Package (0x02)
            {
                0xA768, 
                0x0376
            }, 

            Package (0x02)
            {
                0xC23B, 
                0x0369
            }, 

            Package (0x02)
            {
                0xDE26, 
                0x035A
            }, 

            Package (0x02)
            {
                0xFB7C, 
                0x034A
            }
        })
        Name (CEUP, Package (0x06)
        {
            0x80000000, 
            0x80000000, 
            0x80000000, 
            0x80000000, 
            0x80000000, 
            0x80000000
        })
        Method (_TMP, 0, Serialized)  // _TMP: Temperature
        {
            Return (\_SB.IETM.CTOK (PCTP))
        }

        Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
        {
            LSTM = Arg0
            Notify (\_SB.PC00.TCPU, 0x91) // Device-Specific
        }

        Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
        {
            Return (0x0ADE)
        }

        Name (PTYP, Zero)
        Method (_PSS, 0, NotSerialized)  // _PSS: Performance Supported States
        {
            If (CondRefOf (\_SB.PR00._PSS))
            {
                Return (\_SB.PR00._PSS ())
            }
            Else
            {
                Return (Package (0x02)
                {
                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                })
            }
        }

        Method (_TSS, 0, NotSerialized)  // _TSS: Throttling Supported States
        {
            If (CondRefOf (\_SB.PR00._TSS))
            {
                Return (\_SB.PR00._TSS ())
            }
            Else
            {
                Return (Package (0x01)
                {
                    Package (0x05)
                    {
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                })
            }
        }

        Method (_TPC, 0, NotSerialized)  // _TPC: Throttling Present Capabilities
        {
            If (CondRefOf (\_SB.PR00._TPC))
            {
                Return (\_SB.PR00._TPC) /* External reference */
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_PTC, 0, NotSerialized)  // _PTC: Processor Throttling Control
        {
            If ((CondRefOf (\PF00) && (\PF00 != 0x80000000)))
            {
                If ((\PF00 & 0x04))
                {
                    Return (Package (0x02)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }
                    })
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        ResourceTemplate ()
                        {
                            Register (SystemIO, 
                                0x05,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000001810, // Address
                                ,)
                        }, 

                        ResourceTemplate ()
                        {
                            Register (SystemIO, 
                                0x05,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000001810, // Address
                                ,)
                        }
                    })
                }
            }
            Else
            {
                Return (Package (0x02)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }
                })
            }
        }

        Method (_TSD, 0, NotSerialized)  // _TSD: Throttling State Dependencies
        {
            If (CondRefOf (\_SB.PR00._TSD))
            {
                Return (\_SB.PR00._TSD ())
            }
            Else
            {
                Return (Package (0x01)
                {
                    Package (0x05)
                    {
                        0x05, 
                        Zero, 
                        Zero, 
                        0xFC, 
                        Zero
                    }
                })
            }
        }

        Method (_TDL, 0, NotSerialized)  // _TDL: T-State Depth Limit
        {
            If ((CondRefOf (\_SB.PR00._TSS) && CondRefOf (\_SB.CFGD)))
            {
                If ((\_SB.CFGD & 0x2000))
                {
                    Return ((SizeOf (\_SB.PR00.TSMF) - One))
                }
                Else
                {
                    Return ((SizeOf (\_SB.PR00.TSMC) - One))
                }
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_PDL, 0, NotSerialized)  // _PDL: P-state Depth Limit
        {
            If (CondRefOf (\_SB.PR00._PSS))
            {
                If ((\_SB.OSCP & 0x0400))
                {
                    Return ((SizeOf (\_SB.PR00.TPSS) - One))
                }
                Else
                {
                    Return ((SizeOf (\_SB.PR00.LPSS) - One))
                }
            }
            Else
            {
                Return (Zero)
            }
        }

        Name (TJMX, 0x6E)
        Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
        {
            Return (Zero)
        }

        Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
        {
            Local1 = \_SB.IETM.CTOK (TJMX)
            Local1 -= 0x0A
            If ((LSTM >= Local1))
            {
                Return ((Local1 - 0x14))
            }
            Else
            {
                Return (Local1)
            }
        }

        Method (_AC1, 0, Serialized)  // _ACx: Active Cooling, x=0-9
        {
            Local1 = \_SB.IETM.CTOK (TJMX)
            Local1 -= 0x1E
            If ((LSTM >= Local1))
            {
                Return ((Local1 - 0x14))
            }
            Else
            {
                Return (Local1)
            }
        }

        Method (_AC2, 0, Serialized)  // _ACx: Active Cooling, x=0-9
        {
            Local1 = \_SB.IETM.CTOK (TJMX)
            Local1 -= 0x28
            If ((LSTM >= Local1))
            {
                Return ((Local1 - 0x14))
            }
            Else
            {
                Return (Local1)
            }
        }

        Method (_AC3, 0, Serialized)  // _ACx: Active Cooling, x=0-9
        {
            Local1 = \_SB.IETM.CTOK (TJMX)
            Local1 -= 0x37
            If ((LSTM >= Local1))
            {
                Return ((Local1 - 0x14))
            }
            Else
            {
                Return (Local1)
            }
        }

        Method (_AC4, 0, Serialized)  // _ACx: Active Cooling, x=0-9
        {
            Local1 = \_SB.IETM.CTOK (TJMX)
            Local1 -= 0x46
            If ((LSTM >= Local1))
            {
                Return ((Local1 - 0x14))
            }
            Else
            {
                Return (Local1)
            }
        }

        Method (_PSV, 0, Serialized)  // _PSV: Passive Temperature
        {
            Return (\_SB.IETM.CTOK (TJMX))
        }

        Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
        {
            Return (\_SB.IETM.CTOK (TJMX))
        }

        Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
        {
            Return (\_SB.IETM.CTOK (TJMX))
        }

        Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
        {
            Return (\_SB.IETM.CTOK (TJMX))
        }

        Method (UVTH, 1, Serialized)
        {
            If (CondRefOf (\_SB.PC00.LPCB.H_EC.DPTF.UVTH))
            {
                \_SB.PC00.LPCB.H_EC.DPTF.UVTH (Arg0)
                Return (Zero)
            }

            ADBG ("UVTH not available")
        }
    }

    Scope (\_SB.IETM)
    {
        Name (CTSP, Package (0x01)
        {
            ToUUID ("e145970a-e4c1-4d73-900e-c9c5a69dd067") /* Unknown UUID */
        })
    }

    Scope (\_SB.PC00.TCPU)
    {
        Method (TDPL, 0, Serialized)
        {
            Name (MPL0, Zero)
            Name (MPL1, Zero)
            Name (MPL2, Zero)
            Local0 = CTNL /* \_SB_.PC00.TCPU.CTNL */
            If (((Local0 == One) || (Local0 == 0x02)))
            {
                Local0 = \_SB.CLVL /* External reference */
            }
            Else
            {
                Return (Package (0x01)
                {
                    Zero
                })
            }

            If ((CLCK == One))
            {
                Local0 = One
            }

            MPL0 = CPNU (\_SB.PL10, One)
            MPL1 = CPNU (\_SB.PL11, One)
            MPL2 = CPNU (\_SB.PL12, One)
            Name (TMP1, Package (0x01)
            {
                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }
            })
            Name (TMP2, Package (0x02)
            {
                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }, 

                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }
            })
            Name (TMP3, Package (0x03)
            {
                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }, 

                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }, 

                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }
            })
            If ((Local0 == 0x03))
            {
                If ((MPL0 > MPL1))
                {
                    If ((MPL0 > MPL2))
                    {
                        If ((MPL1 > MPL2))
                        {
                            Local3 = Zero
                            LEV0 = Zero
                            Local4 = One
                            LEV1 = One
                            Local5 = 0x02
                            LEV2 = 0x02
                        }
                        Else
                        {
                            Local3 = Zero
                            LEV0 = Zero
                            Local5 = One
                            LEV1 = 0x02
                            Local4 = 0x02
                            LEV2 = One
                        }
                    }
                    Else
                    {
                        Local5 = Zero
                        LEV0 = 0x02
                        Local3 = One
                        LEV1 = Zero
                        Local4 = 0x02
                        LEV2 = One
                    }
                }
                ElseIf ((MPL1 > MPL2))
                {
                    If ((MPL0 > MPL2))
                    {
                        Local4 = Zero
                        LEV0 = One
                        Local3 = One
                        LEV1 = Zero
                        Local5 = 0x02
                        LEV2 = 0x02
                    }
                    Else
                    {
                        Local4 = Zero
                        LEV0 = One
                        Local5 = One
                        LEV1 = 0x02
                        Local3 = 0x02
                        LEV2 = Zero
                    }
                }
                Else
                {
                    Local5 = Zero
                    LEV0 = 0x02
                    Local4 = One
                    LEV1 = One
                    Local3 = 0x02
                    LEV2 = Zero
                }

                Local1 = (\_SB.TAR0 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP3 [Local3]) [Zero] = MPL0 /* \_SB_.PC00.TCPU.TDPL.MPL0 */
                DerefOf (TMP3 [Local3]) [One] = Local2
                DerefOf (TMP3 [Local3]) [0x02] = \_SB.CTC0 /* External reference */
                DerefOf (TMP3 [Local3]) [0x03] = Local1
                DerefOf (TMP3 [Local3]) [0x04] = Zero
                Local1 = (\_SB.TAR1 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP3 [Local4]) [Zero] = MPL1 /* \_SB_.PC00.TCPU.TDPL.MPL1 */
                DerefOf (TMP3 [Local4]) [One] = Local2
                DerefOf (TMP3 [Local4]) [0x02] = \_SB.CTC1 /* External reference */
                DerefOf (TMP3 [Local4]) [0x03] = Local1
                DerefOf (TMP3 [Local4]) [0x04] = Zero
                Local1 = (\_SB.TAR2 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP3 [Local5]) [Zero] = MPL2 /* \_SB_.PC00.TCPU.TDPL.MPL2 */
                DerefOf (TMP3 [Local5]) [One] = Local2
                DerefOf (TMP3 [Local5]) [0x02] = \_SB.CTC2 /* External reference */
                DerefOf (TMP3 [Local5]) [0x03] = Local1
                DerefOf (TMP3 [Local5]) [0x04] = Zero
                Return (TMP3) /* \_SB_.PC00.TCPU.TDPL.TMP3 */
            }

            If ((Local0 == 0x02))
            {
                If ((MPL0 > MPL1))
                {
                    Local3 = Zero
                    Local4 = One
                    LEV0 = Zero
                    LEV1 = One
                    LEV2 = Zero
                }
                Else
                {
                    Local4 = Zero
                    Local3 = One
                    LEV0 = One
                    LEV1 = Zero
                    LEV2 = Zero
                }

                Local1 = (\_SB.TAR0 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP2 [Local3]) [Zero] = MPL0 /* \_SB_.PC00.TCPU.TDPL.MPL0 */
                DerefOf (TMP2 [Local3]) [One] = Local2
                DerefOf (TMP2 [Local3]) [0x02] = \_SB.CTC0 /* External reference */
                DerefOf (TMP2 [Local3]) [0x03] = Local1
                DerefOf (TMP2 [Local3]) [0x04] = Zero
                Local1 = (\_SB.TAR1 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP2 [Local4]) [Zero] = MPL1 /* \_SB_.PC00.TCPU.TDPL.MPL1 */
                DerefOf (TMP2 [Local4]) [One] = Local2
                DerefOf (TMP2 [Local4]) [0x02] = \_SB.CTC1 /* External reference */
                DerefOf (TMP2 [Local4]) [0x03] = Local1
                DerefOf (TMP2 [Local4]) [0x04] = Zero
                Return (TMP2) /* \_SB_.PC00.TCPU.TDPL.TMP2 */
            }

            If ((Local0 == One))
            {
                Switch (ToInteger (\_SB.CBMI))
                {
                    Case (Zero)
                    {
                        Local1 = (\_SB.TAR0 + One)
                        Local2 = (Local1 * 0x64)
                        DerefOf (TMP1 [Zero]) [Zero] = MPL0 /* \_SB_.PC00.TCPU.TDPL.MPL0 */
                        DerefOf (TMP1 [Zero]) [One] = Local2
                        DerefOf (TMP1 [Zero]) [0x02] = \_SB.CTC0 /* External reference */
                        DerefOf (TMP1 [Zero]) [0x03] = Local1
                        DerefOf (TMP1 [Zero]) [0x04] = Zero
                        LEV0 = Zero
                        LEV1 = Zero
                        LEV2 = Zero
                    }
                    Case (One)
                    {
                        Local1 = (\_SB.TAR1 + One)
                        Local2 = (Local1 * 0x64)
                        DerefOf (TMP1 [Zero]) [Zero] = MPL1 /* \_SB_.PC00.TCPU.TDPL.MPL1 */
                        DerefOf (TMP1 [Zero]) [One] = Local2
                        DerefOf (TMP1 [Zero]) [0x02] = \_SB.CTC1 /* External reference */
                        DerefOf (TMP1 [Zero]) [0x03] = Local1
                        DerefOf (TMP1 [Zero]) [0x04] = Zero
                        LEV0 = One
                        LEV1 = One
                        LEV2 = One
                    }
                    Case (0x02)
                    {
                        Local1 = (\_SB.TAR2 + One)
                        Local2 = (Local1 * 0x64)
                        DerefOf (TMP1 [Zero]) [Zero] = MPL2 /* \_SB_.PC00.TCPU.TDPL.MPL2 */
                        DerefOf (TMP1 [Zero]) [One] = Local2
                        DerefOf (TMP1 [Zero]) [0x02] = \_SB.CTC2 /* External reference */
                        DerefOf (TMP1 [Zero]) [0x03] = Local1
                        DerefOf (TMP1 [Zero]) [0x04] = Zero
                        LEV0 = 0x02
                        LEV1 = 0x02
                        LEV2 = 0x02
                    }

                }

                Return (TMP1) /* \_SB_.PC00.TCPU.TDPL.TMP1 */
            }

            Return (Zero)
        }

        Name (MAXT, Zero)
        Method (TDPC, 0, NotSerialized)
        {
            Return (MAXT) /* \_SB_.PC00.TCPU.MAXT */
        }

        Name (LEV0, Zero)
        Name (LEV1, Zero)
        Name (LEV2, Zero)
        Method (STDP, 1, Serialized)
        {
            If ((Arg0 >= \_SB.CLVL))
            {
                Return (Zero)
            }

            Switch (ToInteger (Arg0))
            {
                Case (Zero)
                {
                    Local0 = LEV0 /* \_SB_.PC00.TCPU.LEV0 */
                }
                Case (One)
                {
                    Local0 = LEV1 /* \_SB_.PC00.TCPU.LEV1 */
                }
                Case (0x02)
                {
                    Local0 = LEV2 /* \_SB_.PC00.TCPU.LEV2 */
                }

            }

            Switch (ToInteger (Local0))
            {
                Case (Zero)
                {
                    CPL0 ()
                }
                Case (One)
                {
                    CPL1 ()
                }
                Case (0x02)
                {
                    CPL2 ()
                }

            }

            Notify (\_SB.PC00.TCPU, 0x83) // Device-Specific Change
        }
    }

    Scope (\_SB.IETM)
    {
        Name (DP2P, Package (0x01)
        {
            ToUUID ("9e04115a-ae87-4d1c-9500-0f3e340bfe75") /* Unknown UUID */
        })
        Name (DPSP, Package (0x01)
        {
            ToUUID ("42a441d6-ae6a-462b-a84b-4a8ce79027d3") /* Unknown UUID */
        })
        Name (DASP, Package (0x01)
        {
            ToUUID ("3a95c389-e4b8-4629-a526-c52c88626bae") /* Unknown UUID */
        })
        Name (DA2P, Package (0x01)
        {
            ToUUID ("0e56fab6-bdfc-4e8c-8246-40ecfd4d74ea") /* Unknown UUID */
        })
        Name (DCSP, Package (0x01)
        {
            ToUUID ("97c68ae7-15fa-499c-b8c9-5da81d606e0a") /* Unknown UUID */
        })
        Name (RFIP, Package (0x01)
        {
            ToUUID ("c4ce1849-243a-49f3-b8d5-f97002f38e6a") /* Unknown UUID */
        })
        Name (POBP, Package (0x01)
        {
            ToUUID ("f5a35014-c209-46a4-993a-eb56de7530a1") /* Unknown UUID */
        })
        Name (DAPP, Package (0x01)
        {
            ToUUID ("63be270f-1c11-48fd-a6f7-3af253ff3e2d") /* Unknown UUID */
        })
        Name (DVSP, Package (0x01)
        {
            ToUUID ("6ed722a7-9240-48a5-b479-31eef723d7cf") /* Unknown UUID */
        })
        Name (DPID, Package (0x01)
        {
            ToUUID ("42496e14-bc1b-46e8-a798-ca915464426f") /* Unknown UUID */
        })
    }

    Scope (\_SB.IETM)
    {
        Method (TEVT, 2, Serialized)
        {
            Switch (ToString (Arg0, Ones))
            {
                Case ("IETM")
                {
                    Notify (\_SB.IETM, Arg1)
                }
                Case ("TCPU")
                {
                    Notify (\_SB.PC00.TCPU, Arg1)
                }

            }
        }
    }

    ADBG ("[Dptf DptfTabl SSDT][AcpiTableExit]")
    Debug = "[Dptf DptfTabl SSDT][AcpiTableExit]"
    Debug = Timer
}

