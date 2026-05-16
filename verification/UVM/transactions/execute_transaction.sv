`timescale 1ns/1ps

class execute_transaction extends
      uvm_sequence_item;

    // -------------------------------------------------
    // Random Fields
    // -------------------------------------------------

    rand bit [63:0] src1;

    rand bit [63:0] src2;

    rand bit [3:0]  alu_op;

    // -------------------------------------------------
    // Response Fields
    // -------------------------------------------------

    bit [63:0] result;

    bit        overflow;

    // -------------------------------------------------
    // Constraints
    // -------------------------------------------------

    constraint alu_constraint {

        alu_op inside {[0:9]};

    }

    // -------------------------------------------------
    // UVM Registration
    // -------------------------------------------------

    `uvm_object_utils_begin
    (execute_transaction)

        `uvm_field_int(src1,
                       UVM_ALL_ON)

        `uvm_field_int(src2,
                       UVM_ALL_ON)

        `uvm_field_int(alu_op,
                       UVM_ALL_ON)

        `uvm_field_int(result,
                       UVM_ALL_ON)

        `uvm_field_int(overflow,
                       UVM_ALL_ON)

    `uvm_object_utils_end

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "execute_transaction"
    );

        super.new(name);

    endfunction

endclass