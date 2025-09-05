`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2025 08:40:41 PM
// Design Name: 
// Module Name: memory_module_32bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module memory_module_32bit(
    input [31:0] write_data,
    input [31:0] A,
    input WE,clk,
    output [31:0]read_data
    );
   
    
   reg [7:0]memory[0:255]; 
   wire [7:0]address = {A[7:2], 2'b00};
   
   assign read_data={
    memory[address+3], 
    memory[address+2], 
    memory[address+1], 
    memory[address+0]
   };
   
   
   always @(posedge  clk) 
    if(WE) begin
    memory[address+0]<=write_data[7:0]  ;
    memory[address+1]<=write_data[15:8] ;
    memory[address+2]<=write_data[23:16];
    memory[address+3]<=write_data[31:24];
    
    end
endmodule
