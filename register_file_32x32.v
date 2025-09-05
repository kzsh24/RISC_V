`timescale 1ns / 1ps


module register_file_32x32bit(
    input clk,
    input [4:0] A1, A2, A3,
    input [31:0] WD3,
    input WE3,
    output [31:0] RD1, RD2
);
    reg [31:0] reg_file [0:31];

    always @(posedge clk) begin
        if (WE3 && A3 != 0) begin
            reg_file[A3] <= WD3;
        end
    end

    assign RD1 = (A1 != 0) ? reg_file[A1] : 32'b0;
    assign RD2 = (A2 != 0) ? reg_file[A2] : 32'b0;
endmodule
