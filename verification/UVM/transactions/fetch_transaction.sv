`timescale 1ns/1ps

class fetch_transaction extends
      uvm_sequence_item;

    // -------------------------------------------------
    // Random Fields
    // -------------------------------------------------

    rand bit [63:0] pc;

    rand bit [31:0] instruction;

    rand bit        branch_taken;

    // -------------------------------------------------
    // UVM Registration
    // -------------------------------------------------

    `uvm_object_utils_begin
    (fetch_transaction)

        `uvm_field_int(pc,
                       UVM_ALL_ON)

        `uvm_field_int(instruction,
                       UVM_ALL_ON)

        `uvm_field_int(branch_taken,
                       UVM_ALL_ON)

    `uvm_object_utils_end

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "fetch_transaction"
    );

        super.new(name);

    endfunction

    // -------------------------------------------------
    // String Conversion
    // -------------------------------------------------

    function string convert2string();

        return $sformatf
        (
            "PC=%h INST=%h BRANCH=%b",
            pc,
            instruction,
            branch_taken
        );

    endfunction

endclass