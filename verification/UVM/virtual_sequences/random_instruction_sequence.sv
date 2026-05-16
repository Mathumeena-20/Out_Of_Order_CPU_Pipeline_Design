`timescale 1ns/1ps

class random_instruction_sequence extends
      cpu_virtual_sequence;

    `uvm_object_utils
    (random_instruction_sequence)

    // -------------------------------------------------
    // Random Transaction
    // -------------------------------------------------

    cpu_transaction tr;

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "random_instruction_sequence"
    );

        super.new(name);

    endfunction

    // -------------------------------------------------
    // Body Task
    // -------------------------------------------------

    task body();

        `uvm_info("RANDOM_SEQ",
                  "Starting Random Instruction Sequence",
                  UVM_LOW)

        repeat(100) begin

            tr =
            cpu_transaction::type_id::
            create("tr");

            assert(tr.randomize());

            `uvm_info("RANDOM_SEQ",
                      tr.convert2string(),
                      UVM_HIGH)

            #10;

        end

        `uvm_info("RANDOM_SEQ",
                  "Random Sequence Completed",
                  UVM_LOW)

    endtask

endclass