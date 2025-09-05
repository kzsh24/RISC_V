`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2025 03:04:53 AM
// Design Name: 
// Module Name: PC
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
module PC_TOP(
    input  wire        clk,
    input  wire [31:0] PCTarget,
    input  wire        PCSrc,
    output wire [31:0] PC,
    output wire [31:0] PCPlus4
);

    reg [31:0] PCReg = 32'b0;

    assign PC = PCReg;
    assign PCPlus4 = PCReg + 4;

    wire [31:0] PCNext;
    assign PCNext = (PCSrc) ? PCTarget : PCPlus4;

    always @(posedge clk) begin
        PCReg <= PCNext;
    end

endmodule

