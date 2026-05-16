`timescale 1ns/1ps

module uart_top
(
    input  logic clk,
    input  logic rst,

    input  logic uart_rx,
    output logic uart_tx
);

    logic baud_tick;

    logic [7:0] rx_data;
    logic       rx_valid;

    uart_baud_gen baud_gen_inst
    (
        .clk(clk),
        .rst(rst),
        .baud_tick(baud_tick)
    );

    uart_rx uart_rx_inst
    (
        .clk(clk),
        .rst(rst),
        .baud_tick(baud_tick),
        .uart_rx(uart_rx),
        .rx_data(rx_data),
        .rx_valid(rx_valid)
    );

endmodule