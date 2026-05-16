`timescale 1ns/1ps

module clock_gen;

    logic clk;

    // -------------------------------------------------
    // Clock Generation
    // -------------------------------------------------

    initial begin

        clk = 0;

        forever #5 clk = ~clk;

    end

endmodule