`timescale 1ns/1ps

`include "../common/defines.svh"
`include "../common/macros.svh"

import parameters_pkg::*;
import typedefs_pkg::*;
import enums_pkg::*;

module decoder
(
    input  logic [31:0] instruction,

    output logic [6:0]  opcode,
    output logic [4:0]  rd,
    output logic [2:0]  funct3,
    output logic [4:0]  rs1,
    output logic [4:0]  rs2,
    output logic [6:0]  funct7
);

always_comb begin

    // =====================================================
    // DEFAULT VALUES
    // =====================================================

    opcode = 7'd0;

    rd     = 5'd0;

    funct3 = 3'd0;

    rs1    = 5'd0;

    rs2    = 5'd0;

    funct7 = 7'd0;

    // =====================================================
    // X-PROTECTION
    // Prevent unknown instruction propagation
    // =====================================================

    if (^instruction === 1'bX) begin

        opcode = 7'd0;

        rd     = 5'd0;

        funct3 = 3'd0;

        rs1    = 5'd0;

        rs2    = 5'd0;

        funct7 = 7'd0;

    end

    else begin

        // =================================================
        // COMMON FIELD EXTRACTION
        // =================================================

        opcode = instruction[6:0];

        rd     = instruction[11:7];

        funct3 = instruction[14:12];

        rs1    = instruction[19:15];

        // =================================================
        // OPCODE-BASED DECODE
        // =================================================

        case(opcode)

            // ---------------------------------------------
            // R-TYPE
            // ---------------------------------------------

            7'b0110011 : begin

                rs2    = instruction[24:20];

                funct7 = instruction[31:25];

            end

            // ---------------------------------------------
            // I-TYPE
            // ---------------------------------------------

            7'b0010011 : begin

                rs2    = 5'd0;

                funct7 = 7'd0;

            end

            // ---------------------------------------------
            // LOAD
            // ---------------------------------------------

            7'b0000011 : begin

                rs2    = 5'd0;

                funct7 = 7'd0;

            end

            // ---------------------------------------------
            // STORE
            // ---------------------------------------------

            7'b0100011 : begin

                rs2    = instruction[24:20];

                funct7 = 7'd0;

            end

            // ---------------------------------------------
            // BRANCH
            // ---------------------------------------------

            7'b1100011 : begin

                rs2    = instruction[24:20];

                funct7 = 7'd0;

            end

            // ---------------------------------------------
            // DEFAULT
            // ---------------------------------------------

            default : begin

                rs2    = 5'd0;

                funct7 = 7'd0;

            end

        endcase

    end

end

endmodule