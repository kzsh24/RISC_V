`timescale 1ns / 1ps


module multiplexer_2x1_32bit(
 input selector,
 input [31:0] A,B,
 output [31:0] out
    );
    
    assign out = (selector) ? B : A;
    
    
endmodule