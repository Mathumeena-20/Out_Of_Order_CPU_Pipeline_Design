`timescale 1ns/1ps

class cpu_transaction extends
      uvm_sequence_item;

    // -------------------------------------------------
    // Randomized Fields
    // -------------------------------------------------

    rand bit [31:0] instruction;

    rand bit [63:0] src1;
    rand bit [63:0] src2;

    rand bit [4:0]  rd;

    rand bit [3:0]  alu_op;

    // -------------------------------------------------
    // Response Fields
    // -------------------------------------------------

    bit [63:0] result;

    bit        valid;

    // -------------------------------------------------
    // Constraints
    // -------------------------------------------------

    constraint valid_instr {

        instruction inside
        {
            32'h003100B3,
            32'h40628233,
            32'h009473B3,
            32'h00C5E533
        };

    }

    // -------------------------------------------------
    // UVM Registration
    // -------------------------------------------------

    `uvm_object_utils_begin
    (cpu_transaction)

        `uvm_field_int(instruction,
                       UVM_ALL_ON)

        `uvm_field_int(src1,
                       UVM_ALL_ON)

        `uvm_field_int(src2,
                       UVM_ALL_ON)

        `uvm_field_int(rd,
                       UVM_ALL_ON)

        `uvm_field_int(alu_op,
                       UVM_ALL_ON)

        `uvm_field_int(result,
                       UVM_ALL_ON)

        `uvm_field_int(valid,
                       UVM_ALL_ON)

    `uvm_object_utils_end

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "cpu_transaction"
    );

        super.new(name);

    endfunction

    // -------------------------------------------------
    // Convert to String
    // -------------------------------------------------

    function string convert2string();

        return $sformatf
        (
            "INST=%h SRC1=%h SRC2=%h RD=%0d ALU_OP=%0d RESULT=%h",
            instruction,
            src1,
            src2,
            rd,
            alu_op,
            result
        );

    endfunction

endclass