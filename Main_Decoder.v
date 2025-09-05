`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2025 02:10:27 AM
// Design Name: 
// Module Name: Main_Decoder
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

module Main_Decoder(
    input [6:0] Op,
    output reg RegWrite,
    output reg [1:0] ImmSrc,
    output reg ALUSrc,
    output reg MemWrite,
    output reg [1:0] ResultSrc,
    output reg Branch,
    output reg [1:0] ALUOp
);

always @(*) begin
    RegWrite = 0;
    ImmSrc = 2'b00;
    ALUSrc = 0;
    MemWrite = 0;
    ResultSrc = 2'b00;
    Branch = 0;
    ALUOp = 2'b00;
    
    case (Op)
        7'b0000011: begin
            RegWrite = 1;
            ImmSrc = 2'b00;
            ALUSrc = 1;
            MemWrite = 0;
            ResultSrc = 2'b01;
            Branch = 0;
            ALUOp = 2'b00;
        end
        
        7'b0100011: begin
            RegWrite = 0;
            ImmSrc = 2'b01;
            ALUSrc = 1;
            MemWrite = 1;
            ResultSrc = 2'b00;
            Branch = 0;
            ALUOp = 2'b00;
        end
        
        7'b0110011: begin
            RegWrite = 1;
            ImmSrc = 2'b00;
            ALUSrc = 0;
            MemWrite = 0;
            ResultSrc = 2'b00;
            Branch = 0;
            ALUOp = 2'b10;
        end
        
        7'b1100011: begin
            RegWrite = 0;
            ImmSrc = 2'b10;
            ALUSrc = 0;
            MemWrite = 0;
            ResultSrc = 2'b00;
            Branch = 1;
            ALUOp = 2'b01;
        end
        
        default: begin
            RegWrite = 0;
            ImmSrc = 2'b00;
            ALUSrc = 0;
            MemWrite = 0;
            ResultSrc = 2'b00;
            Branch = 0;
            ALUOp = 2'b00;
        end
    endcase
end

endmodule
