`timescale 1ns/1ps

class memory_transaction extends
      uvm_sequence_item;

    // -------------------------------------------------
    // Random Fields
    // -------------------------------------------------

    rand bit [63:0] addr;

    rand bit [63:0] data;

    rand bit        read_en;

    rand bit        write_en;

    // -------------------------------------------------
    // Response Fields
    // -------------------------------------------------

    bit [63:0] read_data;

    bit        cache_hit;

    // -------------------------------------------------
    // Constraints
    // -------------------------------------------------

    constraint mem_constraint {

        !(read_en && write_en);

    }

    // -------------------------------------------------
    // UVM Registration
    // -------------------------------------------------

    `uvm_object_utils_begin
    (memory_transaction)

        `uvm_field_int(addr,
                       UVM_ALL_ON)

        `uvm_field_int(data,
                       UVM_ALL_ON)

        `uvm_field_int(read_en,
                       UVM_ALL_ON)

        `uvm_field_int(write_en,
                       UVM_ALL_ON)

        `uvm_field_int(read_data,
                       UVM_ALL_ON)

        `uvm_field_int(cache_hit,
                       UVM_ALL_ON)

    `uvm_object_utils_end

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "memory_transaction"
    );

        super.new(name);

    endfunction

endclass