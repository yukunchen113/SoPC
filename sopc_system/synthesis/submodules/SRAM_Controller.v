/*****************************************************************************
 *                                                                           *
 * Module:       SRAM_Controller                                             *
 * Description:                                                              *
 *      This module is used for the sram controller for 3TB4 lab 4           *
 *                                                                           *
 *****************************************************************************/

module SRAM_Controller (
input           clk,
input				 reset_n,
input		[17:0]	address,
input				chipselect,
input		[1:0]	byte_enable,
input				read,
input				write,
input		[15:0]	write_data,

// Bidirectionals
inout		[15:0]	SRAM_DQ,

// Outputs
output		[15:0]	read_data,

output		[17:0]	SRAM_ADDR,

output				SRAM_CE_N,
output				SRAM_WE_N,
output				SRAM_OE_N,
output				SRAM_UB_N,
output				SRAM_LB_N
);

// Add your code here
	assign SRAM_ADDR[17:0] = address[17:0];
	assign SRAM_CE_N = !chipselect;
	assign SRAM_OE_N = !read;
	assign SRAM_WE_N = !write;
	assign {SRAM_UB_N,SRAM_LB_N} = !byte_enable;
	assign SRAM_DQ = (write)?write_data:16'bzzzz;
	assign SRAM_DQ = (read)?read_data:16'bzzzz;



endmodule

