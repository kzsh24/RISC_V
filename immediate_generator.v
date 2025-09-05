`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/28/2025 01:47:40 AM
// Design Name: 
// Module Name: immediate_generator
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


module immediate_generator(
    input  [31:0] instruction,
    input  [1:0]  ImmSrc, 
    output reg [31:0] imm_out
);

always @(*) begin
    case (ImmSrc)
        2'b00: // I-type
            imm_out = {{20{instruction[31]}}, instruction[31:20]};
        2'b01: // S-type
            imm_out = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
        2'b10: // B-type
            imm_out = {{19{instruction[31]}},instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};
                    
        default:
            imm_out = 32'b0;
    endcase
end

endmodule
