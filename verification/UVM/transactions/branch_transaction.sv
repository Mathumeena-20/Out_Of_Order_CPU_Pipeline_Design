`timescale 1ns/1ps

class branch_transaction extends
      uvm_sequence_item;

    // -------------------------------------------------
    // Random Fields
    // -------------------------------------------------

    rand bit [63:0] pc;

    rand bit        prediction;

    rand bit        actual_taken;

    rand bit [63:0] target_pc;

    // -------------------------------------------------
    // Response Fields
    // -------------------------------------------------

    bit mispredict;

    // -------------------------------------------------
    // Constraints
    // -------------------------------------------------

    constraint pc_align {

        pc[1:0] == 2'b00;

    }

    // -------------------------------------------------
    // UVM Registration
    // -------------------------------------------------

    `uvm_object_utils_begin
    (branch_transaction)

        `uvm_field_int(pc,
                       UVM_ALL_ON)

        `uvm_field_int(prediction,
                       UVM_ALL_ON)

        `uvm_field_int(actual_taken,
                       UVM_ALL_ON)

        `uvm_field_int(target_pc,
                       UVM_ALL_ON)

        `uvm_field_int(mispredict,
                       UVM_ALL_ON)

    `uvm_object_utils_end

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "branch_transaction"
    );

        super.new(name);

    endfunction

    // -------------------------------------------------
    // Post Randomize
    // -------------------------------------------------

    function void post_randomize();

        mispredict =
        (prediction != actual_taken);

    endfunction

endclass