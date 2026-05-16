`timescale 1ns/1ps

module random_sequences;

    logic [31:0] rand_inst;

    initial begin

        repeat(20) begin

            rand_inst = $random;

            $display("Random Instruction = %h",
                      rand_inst);

        end
    end

endmodule