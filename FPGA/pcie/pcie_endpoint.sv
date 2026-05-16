`timescale 1ns/1ps

module pcie_endpoint
#(
    parameter DATA_WIDTH = 64
)
(
    input  logic clk,
    input  logic rst,

    input  logic rx_valid,
    input  logic [DATA_WIDTH-1:0] rx_data,

    output logic tx_valid,
    output logic [DATA_WIDTH-1:0] tx_data
);

    typedef enum logic [1:0]
    {
        IDLE,
        RECEIVE,
        TRANSMIT
    } state_t;

    state_t state;

    always_ff @(posedge clk) begin

        if (rst) begin

            state <= IDLE;

            tx_valid <= 0;

            tx_data <= 0;

        end

        else begin

            case(state)

                IDLE: begin

                    tx_valid <= 0;

                    if (rx_valid)

                        state <= RECEIVE;

                end

                RECEIVE: begin

                    tx_data <= rx_data;

                    tx_valid <= 1;

                    state <= TRANSMIT;

                end

                TRANSMIT: begin

                    tx_valid <= 0;

                    state <= IDLE;

                end

            endcase

        end

    end

endmodule