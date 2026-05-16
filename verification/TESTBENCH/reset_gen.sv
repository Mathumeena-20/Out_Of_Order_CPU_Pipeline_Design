`timescale 1ns/1ps

module reset_gen;

    logic rst;

    // -------------------------------------------------
    // Reset Generation
    // -------------------------------------------------

    initial begin

        rst = 1;

        #20;

        rst = 0;

    end

endmodule