
#ifndef AXILITE_DETECTOR_H
#define AXILITE_DETECTOR_H


/****************** Include Files ********************/
#include "xil_types.h"
#include "xstatus.h"

#define AXILITE_DETECTOR_S00_AXI_SLV_REG0_OFFSET 0
#define AXILITE_DETECTOR_S00_AXI_SLV_REG1_OFFSET 4
#define AXILITE_DETECTOR_S00_AXI_SLV_REG2_OFFSET 8
#define AXILITE_DETECTOR_S00_AXI_SLV_REG3_OFFSET 12
#define AXILITE_DETECTOR_S00_AXI_SLV_REG4_OFFSET 16
#define AXILITE_DETECTOR_S00_AXI_SLV_REG5_OFFSET 20
#define AXILITE_DETECTOR_S00_AXI_SLV_REG6_OFFSET 24
#define AXILITE_DETECTOR_S00_AXI_SLV_REG7_OFFSET 28
#define AXILITE_DETECTOR_S00_AXI_SLV_REG8_OFFSET 32
#define AXILITE_DETECTOR_S00_AXI_SLV_REG9_OFFSET 36
#define AXILITE_DETECTOR_S00_AXI_SLV_REG10_OFFSET 40
#define AXILITE_DETECTOR_S00_AXI_SLV_REG11_OFFSET 44
#define AXILITE_DETECTOR_S00_AXI_SLV_REG12_OFFSET 48
#define AXILITE_DETECTOR_S00_AXI_SLV_REG13_OFFSET 52
#define AXILITE_DETECTOR_S00_AXI_SLV_REG14_OFFSET 56
#define AXILITE_DETECTOR_S00_AXI_SLV_REG15_OFFSET 60
#define AXILITE_DETECTOR_S00_AXI_SLV_REG16_OFFSET 64
#define AXILITE_DETECTOR_S00_AXI_SLV_REG17_OFFSET 68
#define AXILITE_DETECTOR_S00_AXI_SLV_REG18_OFFSET 72
#define AXILITE_DETECTOR_S00_AXI_SLV_REG19_OFFSET 76


/**************************** Type Definitions *****************************/
/**
 *
 * Write a value to a AXILITE_DETECTOR register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the AXILITE_DETECTORdevice.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void AXILITE_DETECTOR_mWriteReg(u32 BaseAddress, unsigned RegOffset, u32 Data)
 *
 */
#define AXILITE_DETECTOR_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))

/**
 *
 * Read a value from a AXILITE_DETECTOR register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the AXILITE_DETECTOR device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 AXILITE_DETECTOR_mReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define AXILITE_DETECTOR_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

/************************** Function Prototypes ****************************/
/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the AXILITE_DETECTOR instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus AXILITE_DETECTOR_Reg_SelfTest(void * baseaddr_p);

#endif // AXILITE_DETECTOR_H
