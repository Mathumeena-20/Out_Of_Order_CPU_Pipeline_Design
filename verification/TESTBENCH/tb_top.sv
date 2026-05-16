`timescale 1ns/1ps

module tb_top;

    // -----------------------------------------
    // Clock and Reset
    // -----------------------------------------

    logic clk;
    logic rst;

    // -----------------------------------------
    // DUT
    // -----------------------------------------

    cpu_top dut (

        .clk(clk),
        .rst(rst)

    );

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

        #20;

        rst = 0;

    end

    // -----------------------------------------
    // Simulation Control
    // -----------------------------------------

    initial begin

        #500;

        $display("Simulation Finished");

        $finish;

    end

endmodule