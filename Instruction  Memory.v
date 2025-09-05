`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2025 02:59:46 AM
// Design Name: 
// Module Name: Instruction  Memory
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


module Instruction_Memory (
    input [31:0] address,
    output [31:0] instruction
);
    reg [31:0] memory [0:63];

    initial begin
        memory[0]  = 32'h00500113; // addi x2, x0, 5
        memory[1]  = 32'h00C00193; // addi x3, x0, 12
        memory[2]  = 32'hFF718393; // addi x7, x3, -9
        memory[3]  = 32'h0023E233; // or x4, x7, x2
        memory[4]  = 32'h0041F2B3; // and x5, x3, x4
        memory[5]  = 32'h004282B3; // add x5, x5, x4
        memory[6]  = 32'h02728863; // beq x5, x7, end
        memory[7]  = 32'h0041A233; // slt x4, x3, x4
        memory[8]  = 32'h00020463; // beq x4, x0, around
        memory[9]  = 32'h00000293; // addi x5, x0, 0
        memory[10] = 32'h0023A233; // slt x4, x7, x2
        memory[11] = 32'h005203B3; // add x7, x4, x5
        memory[12] = 32'h402383B3; // sub x7, x7, x2
        memory[13] = 32'h0471AA23; // sw x7, 84(x3)
        memory[14] = 32'h06002103; // lw x2, 96(x0)
        memory[15] = 32'h005104B3; // add x9, x2, x5
        memory[16] = 32'h008001EF; // jal x3, end
        memory[17] = 32'h00100113; // addi x2, x0, 1
        memory[18] = 32'h00910133; // add x2, x2, x9
        memory[19] = 32'h0221A023; // sw x2, 0x20(x3)
        memory[20] = 32'h00210063; // beq x2, x2, done
    end

    assign instruction = memory[address[31:2]];

endmodule

