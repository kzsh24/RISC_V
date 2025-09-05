module ALU_Decoder(
    input [1:0] ALUOp,
    input [2:0] funct3,
    input  funct7_5,
    output reg [2:0] ALUControl
);

always @(*) begin
    case (ALUOp)
        2'b00:  ALUControl = 3'b000;
        2'b01:  ALUControl = 3'b001;
        2'b10: begin
            case (funct3)
                3'b000: 
                    ALUControl = (funct7_5 == 1'b1) ? 3'b001 : 3'b000;
                3'b010: ALUControl = 3'b101;
                3'b110: ALUControl = 3'b011;
                3'b111: ALUControl = 3'b010;
                default: ALUControl = 3'b000;
            endcase
        end
        default: ALUControl = 3'b000;
    endcase
end

endmodule