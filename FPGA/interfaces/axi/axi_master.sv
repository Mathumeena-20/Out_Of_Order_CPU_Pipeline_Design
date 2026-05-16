`timescale 1ns/1ps

module axi_master
(
    input  logic clk,
    input  logic rst,

    axi_interface axi_if
);

    typedef enum logic [1:0]
    {
        IDLE,
        WRITE,
        READ
    } state_t;

    state_t state;

    always_ff @(posedge clk) begin

        if (rst) begin

            state <= IDLE;

            axi_if.awvalid <= 0;
            axi_if.wvalid  <= 0;
            axi_if.arvalid <= 0;

        end

        else begin

            case(state)

                IDLE: begin

                    axi_if.awaddr  <= 32'h1000;
                    axi_if.wdata   <= 64'hDEADBEEF;

                    axi_if.awvalid <= 1;
                    axi_if.wvalid  <= 1;

                    state <= WRITE;

                end

                WRITE: begin

                    if (axi_if.awready &&
                        axi_if.wready) begin

                        axi_if.awvalid <= 0;
                        axi_if.wvalid  <= 0;

                        state <= READ;

                    end

                end

                READ: begin

                    axi_if.araddr  <= 32'h1000;
                    axi_if.arvalid <= 1;

                    if (axi_if.rvalid) begin

                        axi_if.arvalid <= 0;

                        state <= IDLE;

                    end

                end

            endcase

        end

    end

endmodule