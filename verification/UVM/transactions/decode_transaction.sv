`timescale 1ns/1ps

class decode_transaction extends
      uvm_sequence_item;

    // -------------------------------------------------
    // Random Fields
    // -------------------------------------------------

    rand bit [31:0] instruction;

    rand bit [4:0] rs1;
    rand bit [4:0] rs2;

    rand bit [4:0] rd;

    rand bit [6:0] opcode;

    // -------------------------------------------------
    // Constraints
    // -------------------------------------------------

    constraint reg_constraint {

        rs1 inside {[0:31]};
        rs2 inside {[0:31]};
        rd  inside {[0:31]};

    }

    // -------------------------------------------------
    // UVM Registration
    // -------------------------------------------------

    `uvm_object_utils_begin
    (decode_transaction)

        `uvm_field_int(instruction,
                       UVM_ALL_ON)

        `uvm_field_int(rs1,
                       UVM_ALL_ON)

        `uvm_field_int(rs2,
                       UVM_ALL_ON)

        `uvm_field_int(rd,
                       UVM_ALL_ON)

        `uvm_field_int(opcode,
                       UVM_ALL_ON)

    `uvm_object_utils_end

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "decode_transaction"
    );

        super.new(name);

    endfunction

endclass