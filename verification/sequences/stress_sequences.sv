`timescale 1ns/1ps

module stress_sequences;

    integer i;

    initial begin

        for (i = 0; i < 1000; i = i + 1)

            $display("Stress Cycle = %0d", i);

    end

endmodule