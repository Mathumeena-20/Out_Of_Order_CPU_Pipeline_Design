`timescale 1ns/1ps

module ethernet_mac
#(
    parameter DATA_WIDTH = 8
)
(
    input  logic clk,
    input  logic rst,

    input  logic tx_valid,
    input  logic [DATA_WIDTH-1:0] tx_data,

    output logic tx_ready,

    output logic phy_tx_en,
    output logic [DATA_WIDTH-1:0] phy_txd
);

    typedef enum logic [1:0]
    {
        IDLE,
        SEND
    } state_t;

    state_t state;

    always_ff @(posedge clk) begin

        if (rst) begin

            state     <= IDLE;

            phy_tx_en <= 0;

            tx_ready  <= 1;

        end

        else begin

            case(state)

                IDLE: begin

                    phy_tx_en <= 0;

                    if (tx_valid) begin

                        phy_txd   <= tx_data;

                        phy_tx_en <= 1;

                        state     <= SEND;

                    end

                end

                SEND: begin

                    phy_tx_en <= 0;

                    state <= IDLE;

                end

            endcase

        end

    end

endmodule