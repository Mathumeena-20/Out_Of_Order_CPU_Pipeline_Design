`timescale 1ns/1ps

module axi_slave
(
    input logic clk,
    input logic rst,

    axi_interface axi_if
);

    logic [63:0] mem [0:255];

    always_ff @(posedge clk) begin

        if (rst) begin

            axi_if.awready <= 0;
            axi_if.wready  <= 0;
            axi_if.rvalid  <= 0;

        end

        else begin

            axi_if.awready <= 1;
            axi_if.wready  <= 1;

            // -----------------------------------------
            // Write
            // -----------------------------------------

            if (axi_if.awvalid &&
                axi_if.wvalid) begin

                mem[axi_if.awaddr]
                <= axi_if.wdata;

            end

            // -----------------------------------------
            // Read
            // -----------------------------------------

            if (axi_if.arvalid) begin

                axi_if.rdata <=
                mem[axi_if.araddr];

                axi_if.rvalid <= 1;

            end

            else

                axi_if.rvalid <= 0;

        end

    end

endmodule