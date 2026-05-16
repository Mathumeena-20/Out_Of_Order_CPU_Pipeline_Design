`timescale 1ns/1ps

module fpga_tb_top;

    // -----------------------------------------
    // Clock / Reset
    // -----------------------------------------

    logic clk;
    logic rst;

    // -----------------------------------------
    // DUT Signals
    // -----------------------------------------

    logic heartbeat_led;

    // -----------------------------------------
    // Clock Generation
    // -----------------------------------------

    initial begin

        clk = 0;

        forever #5 clk = ~clk;

    end

    // -----------------------------------------
    // Reset Generation
    // -----------------------------------------

    initial begin

        rst = 1;

        #100;

        rst = 0;

    end

    // -----------------------------------------
    // DUT
    // -----------------------------------------

    fpga_bringup dut
    (
        .clk(clk),
        .rst(rst),
        .heartbeat_led(heartbeat_led)
    );

    // -----------------------------------------
    // Simulation Control
    // -----------------------------------------

    initial begin

        #10000;

        $finish;

    end

endmodule