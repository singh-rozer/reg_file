`include "regfile.sv"

module pio_regs(clk,reset,sel,RW,addr,wdata,rdata,busy);
input clk, reset, sel, RW;
input [11:0] addr;
input [31:0] wdata;
output busy;
output reg [31:0] rdata;

reg [31:0] regs[0:323]; //size of array taken based on the last register address (0x140) mentioned in the list of registers in chapter 3 of rp2040 datasheet

    always_ff@(posedge clk or posedge reset) begin
	    if(reset) begin
		   // for(int ix = 0; ix < 41; ix++) begin
		   //         regs[resetx[ix].addr] <= resetx[ix].edata;
		   // end
		   regs[CTRL_OFF] <= CTRL_RESET;
		   regs[FSTAT_OFF] <= FSTAT_RESET;
    		   regs[FDEBUG_OFF] <= FDEBUG_RESET;
    		   regs[FLEVEL_OFF] <= FLEVEL_RESET;
		   regs[TXF0_OFF] <= 32'h0;
		   regs[TXF1_OFF] <= 32'h0;
    		   regs[TXF2_OFF] <= 32'h0;
		   regs[TXF3_OFF] <= 32'h0;
		   regs[IRQ_OFF] <= 32'h0;
		   regs[IRQ_FORCE_OFF] <= 32'h0;
		   regs[INPUT_SYNC_BYPASS_OFF] <= 32'h0;
		   regs[DBG_PADOUT_OFF] <= 32'h0;
		   regs[DBG_PADOE_OFF] <= 32'h0;
		   regs[DBG_CFGINFO_OFF] <= 32'h0020_4010;
		   regs[SM0_CLKDIV_OFF] <= 32'h0001_0000;
    		   regs[SM1_CLKDIV_OFF] <= 32'h0001_0000;
		   regs[SM2_CLKDIV_OFF] <= 32'h0001_0000;
		   regs[SM3_CLKDIV_OFF] <= 32'h0001_0000;
   		   regs[SM0_EXECCTRL_OFF] <= 32'h0001f000;
		   regs[SM1_EXECCTRL_OFF] <= 32'h0001f000;
   		   regs[SM2_EXECCTRL_OFF] <= 32'h0001f000;
		   regs[SM3_EXECCTRL_OFF] <= 32'h0001f000;
   		   regs[SM0_SHIFTCTRL_OFF] <= 32'h000c_0000;
		   regs[SM1_SHIFTCTRL_OFF] <= 32'h000c_0000;
   		   regs[SM2_SHIFTCTRL_OFF] <= 32'h000c_0000;
		   regs[SM3_SHIFTCTRL_OFF] <= 32'h000c_0000;
   		   regs[SM0_ADDR_OFF] <= 32'h0;
		   regs[SM1_ADDR_OFF] <= 32'h0;
		   regs[SM2_ADDR_OFF] <= 32'h0;
        	   regs[SM3_ADDR_OFF] <= 32'h0;
   		   regs[SM0_PINCTRL_OFF] <= 32'h1400_0000;
		   regs[SM1_PINCTRL_OFF] <= 32'h1400_0000;
   		   regs[SM2_PINCTRL_OFF] <= 32'h1400_0000;
		   regs[SM3_PINCTRL_OFF] <= 32'h1400_0000;
   		   regs[INTR_OFF] <= 32'h0;
		   regs[IRQ0_INTE_OFF] <= 32'h0;
		   regs[IRQ0_INTF_OFF] <= 32'h0;
   		   regs[IRQ0_INTS_OFF] <= 32'h0;
 		   regs[IRQ1_INTE_OFF] <= 32'h0;
 		   regs[IRQ1_INTF_OFF] <= 32'h0;
   		   regs[IRQ1_INTS_OFF] <= 32'h0;
	    end
	    else if(RW & sel) begin
		   // for(int it = 0; it < 26; it++) begin
		   //         if (rwt[it].addr == addr) begin
		   //     	    regs[rwt[it].addr] <= wdata & rwt[it].edata;
		   //         end
		   // end
		   case(addr)
			CTRL_OFF: regs[addr] <= wdata & CTRL_MASK;
    			INPUT_SYNC_BYPASS_OFF: regs[addr] <= wdata & INPUT_SYNC_BYPASS_MASK;
    			SM0_CLKDIV_OFF: regs[addr] <= wdata & SM_CLKDIV_MASK;
    			SM1_CLKDIV_OFF: regs[addr] <= wdata & SM_CLKDIV_MASK;
    			SM2_CLKDIV_OFF: regs[addr] <= wdata & SM_CLKDIV_MASK;
   			SM3_CLKDIV_OFF: regs[addr] <= wdata & SM_CLKDIV_MASK;
   			SM0_EXECCTRL_OFF:regs[addr] <= wdata & SM_EXECCTRL_MASK;
   			SM1_EXECCTRL_OFF:regs[addr] <= wdata & SM_EXECCTRL_MASK;
   			SM2_EXECCTRL_OFF:regs[addr] <= wdata & SM_EXECCTRL_MASK;
   			SM3_EXECCTRL_OFF:regs[addr] <= wdata & SM_EXECCTRL_MASK;
   			SM0_SHIFTCTRL_OFF:regs[addr] <= wdata & SM_SHIFTCTRL_MASK;
   			SM1_SHIFTCTRL_OFF:regs[addr] <= wdata & SM_SHIFTCTRL_MASK;
   			SM2_SHIFTCTRL_OFF:regs[addr] <= wdata & SM_SHIFTCTRL_MASK;
   			SM3_SHIFTCTRL_OFF:regs[addr] <= wdata & SM_SHIFTCTRL_MASK;
   			SM0_INSTR_OFF:regs[addr] <= wdata & SM_INSTR_MASK;
   			SM1_INSTR_OFF:regs[addr] <= wdata & SM_INSTR_MASK;
   			SM2_INSTR_OFF:regs[addr] <= wdata & SM_INSTR_MASK;
   			SM3_INSTR_OFF:regs[addr] <= wdata & SM_INSTR_MASK;
   			SM0_PINCTRL_OFF:regs[addr] <= wdata & SM_PINCTRL_MASK;
   			SM1_PINCTRL_OFF:regs[addr] <= wdata & SM_PINCTRL_MASK;
   			SM2_PINCTRL_OFF:regs[addr] <= wdata & SM_PINCTRL_MASK;
   			SM3_PINCTRL_OFF:regs[addr] <= wdata & SM_PINCTRL_MASK;
   			IRQ0_INTE_OFF:regs[addr] <= wdata & IRQ0_INTE_MASK;
   			IRQ0_INTF_OFF:regs[addr] <= wdata & IRQ0_INTF_MASK;
   			IRQ1_INTE_OFF:regs[addr] <= wdata & IRQ1_INTE_MASK;
   			IRQ1_INTF_OFF:regs[addr] <= wdata & IRQ1_INTF_MASK;
		   endcase
		end
	    else if(!RW & sel)
		    rdata <= regs[addr];
    end

    assign busy = 'b0;

endmodule
