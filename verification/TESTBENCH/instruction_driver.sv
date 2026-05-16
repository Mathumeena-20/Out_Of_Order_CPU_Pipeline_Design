`timescale 1ns/1ps

module instruction_driver
(
    input  logic        clk,
    input  logic        rst,

    output logic [31:0] instruction,
    output logic        valid
);

    // ---------------------------------------------
    // Instruction Memory
    // ---------------------------------------------

    logic [31:0] instruction_mem [0:15];

    // ---------------------------------------------
    // Instruction Index
    // ---------------------------------------------

    logic [3:0] instr_index;

    // ---------------------------------------------
    // Initialize Memory
    // ---------------------------------------------

    initial begin

        instruction_mem[0]  = 32'h00500093;
        instruction_mem[1]  = 32'h00A00113;
        instruction_mem[2]  = 32'h002081B3;
        instruction_mem[3]  = 32'h40218233;
        instruction_mem[4]  = 32'h00302023;
        instruction_mem[5]  = 32'h00002283;
        instruction_mem[6]  = 32'h00208463;
        instruction_mem[7]  = 32'h0012C333;

        instruction_mem[8]  = 32'h00000013;
        instruction_mem[9]  = 32'h00000013;
        instruction_mem[10] = 32'h00000013;
        instruction_mem[11] = 32'h00000013;
        instruction_mem[12] = 32'h00000013;
        instruction_mem[13] = 32'h00000013;
        instruction_mem[14] = 32'h00000013;
        instruction_mem[15] = 32'h00000013;

    end

    // ---------------------------------------------
    // Instruction Output
    // ---------------------------------------------

    always_ff @(posedge clk) begin

        if (rst) begin

            instr_index <= 0;

            instruction <= 32'h00000013;

            valid <= 0;

        end

        else begin

            instruction <=
            instruction_mem[instr_index];

            valid <= 1'b1;

            // -------------------------------------
            // Wrap Around
            // -------------------------------------

            if (instr_index == 15)

                instr_index <= 0;

            else

                instr_index <=
                instr_index + 1'b1;

        end

    end

endmodule