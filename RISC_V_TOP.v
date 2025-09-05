`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2025 03:38:11 AM
// Design Name: 
// Module Name: RISC_V_TOP
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


module RISC_V_TOP(
input clk 

    );

    wire [31:0] PC , PCPlus4, PCTarget,ImmExt,SrcA,SrcB,ALUResult,read_data,Result;
    wire [31:0] instruction;  
    wire [6:0] opcode= instruction[6:0];
    wire [3:0] funct3 = instruction[14:12];
    wire funct7_5 = instruction[30];
    wire [4:0] A1 = instruction[19:15];
    wire [4:0] A2 = instruction[24:20];
    wire [4:0] A3 = instruction[11:7];
    wire zero,Branch;
    
    wire [31:0] RD1, RD2;

    wire PCSrc ,ResultSrc ,MemWrite,ALUSrc,RegWrite;
    wire [2:0] ALUControl;
    wire [1:0]ImmSrc,ALUOp;
    
    

    PC_TOP pci(
        .clk(clk),
        .PC(PC),
        .PCSrc( PCSrc ),
        .PCPlus4(PCPlus4),
        .PCTarget(PCTarget)
    );
    
    Instruction_Memory IM(
        .address(PC),
        .instruction(instruction)
    );
    
    register_file_32x32bit rf (
    .clk(clk),
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .WE3(RegWrite),
    .WD3(Result),
    .RD1(RD1),
    .RD2(RD2)

    );
    
    control_unit cu(
    .Op(opcode),
    .funct3(funct3),
    .funct7_5(funct7_5),
    .zero(zero),
    .PCSrc(PCSrc),
    .RegWrite(RegWrite),
    .ImmSrc(ImmSrc),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .ResultSrc(ResultSrc),
    .Branch(Branch),
    .ALUOp(ALUOp)
    );
    
    
    
    
    
    immediate_generator ig (
    .instruction(instruction),
    .ImmSrc(ImmSrc),
    .imm_out(ImmExt)
    );
    
    
    multiplexer_2x1_32bit mux (
    .A(RD2),
    .B(ImmExt),
    .selector(ALUSrc),
    .out(SrcB)
    );
    assign SrcA =RD1;
    
    
    
    ALU alu (
    .SrcA(SrcA),
    .SrcB(SrcB),
    .ALUControl(ALUControl),
    .ALUResult(ALUResult)
    );
    
    
    memory_module_32bit data_memory (
    .write_data(RD2),
    .A(ALUResult),
    .WE(MemWrite),
    .clk(clk),
    .read_data(read_data)
    );
    
    multiplexer_2x1_32bit mux2 (
    .A(ALUResult),
    .B(read_data),
    .selector(ResultSrc),
    .out(Result)
    );
    
    assign PCTarget = PC + ImmExt ;
    
endmodule