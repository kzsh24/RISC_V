`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2025 01:51:25 PM
// Design Name: 
// Module Name: RISC_V_TOP_TB
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


module RISC_V_TOP_TB();


    // Clock signal
    reg clk;

    // Instantiate the DUT (Device Under Test)
    RISC_V_TOP uut (
        .clk(clk)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize clock
        clk = 0;

        // Optionally, display info
        $display("Starting RISC-V TOP module simulation...");


        // Run simulation for 200ns
        #200;

        $display("Simulation finished.");
        $finish;
    end

endmodule

