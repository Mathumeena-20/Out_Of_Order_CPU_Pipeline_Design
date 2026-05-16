`timescale 1ns/1ps

module multiplier
#(
    parameter XLEN = 64
)
(
    input  logic                     clk,
    input  logic                     rst,

    // Control Signals
    input  logic                     valid_in,
    input  logic                     signed_mode,

    // Operands
    input  logic [XLEN-1:0]          multiplicand,
    input  logic [XLEN-1:0]          multiplier,

    // Outputs
    output logic                     valid_out,
    output logic [(2*XLEN)-1:0]      product,

    // Status
    output logic                     busy,
    output logic                     done
);

    // -------------------------------------------------
    // Internal Signals
    // -------------------------------------------------

    logic [(2*XLEN)-1:0] mult_result;

    logic [XLEN-1:0] multiplicand_reg;
    logic [XLEN-1:0] multiplier_reg;

    logic processing;

    // -------------------------------------------------
    // Multiplication Logic
    // -------------------------------------------------

    always_comb begin

        if (signed_mode)

            mult_result =
                $signed(multiplicand_reg) *
                $signed(multiplier_reg);

        else

            mult_result =
                multiplicand_reg *
                multiplier_reg;

    end

    // -------------------------------------------------
    // Sequential Control
    // -------------------------------------------------

    always_ff @(posedge clk) begin

        if (rst) begin

            multiplicand_reg <= '0;
            multiplier_reg   <= '0;

            product          <= '0;

            valid_out        <= 0;

            busy             <= 0;
            done             <= 0;

            processing       <= 0;

        end

        else begin

            // Default Outputs
            valid_out <= 0;
            done      <= 0;

            // -----------------------------------------
            // Start Multiplication
            // -----------------------------------------

            if (valid_in && !processing) begin

                multiplicand_reg <= multiplicand;
                multiplier_reg   <= multiplier;

                processing <= 1;
                busy       <= 1;

            end

            // -----------------------------------------
            // Finish Multiplication
            // -----------------------------------------

            else if (processing) begin

                product    <= mult_result;

                valid_out  <= 1;

                done       <= 1;
                busy       <= 0;

                processing <= 0;

            end
        end
    end

endmodule