`timescale 1ns/1ps

module uart_loader
(
    input  logic clk,
    input  logic rst,

    input  logic [7:0] rx_data,
    input  logic       rx_valid,

    output logic [31:0] mem_addr,
    output logic [31:0] mem_data,
    output logic        mem_write
);

    logic [1:0] byte_count;

    always_ff @(posedge clk) begin

        if (rst) begin

            byte_count <= 0;
            mem_write  <= 0;

        end

        else begin

            mem_write <= 0;

            if (rx_valid) begin

                mem_data <=
                {mem_data[23:0], rx_data};

                byte_count <=
                byte_count + 1;

                if (byte_count == 3) begin

                    mem_write <= 1;
                    mem_addr <= mem_addr + 4;

                end

            end

        end

    end

endmodule