`timescale 1ns/1ps

module ddr_controller
(
    input  logic clk,
    input  logic rst,

    input  logic        req,
    input  logic        write_en,

    input  logic [31:0] addr,
    input  logic [63:0] wdata,

    output logic [63:0] rdata,
    output logic        ready
);

    typedef enum logic [1:0]
    {
        IDLE,
        ACTIVATE,
        ACCESS,
        COMPLETE
    } state_t;

    state_t state;

    always_ff @(posedge clk) begin

        if (rst) begin

            state <= IDLE;

            ready <= 0;

        end

        else begin

            ready <= 0;

            case(state)

                IDLE:

                    if (req)

                        state <= ACTIVATE;

                ACTIVATE:

                    state <= ACCESS;

                ACCESS: begin

                    if (write_en)

                        rdata <= wdata;

                    state <= COMPLETE;

                end

                COMPLETE: begin

                    ready <= 1;

                    state <= IDLE;

                end

            endcase

        end

    end

endmodule