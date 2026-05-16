`timescale 1ns/1ps

class interface_config extends
      uvm_object;

    `uvm_object_utils(interface_config)

    // -------------------------------------------------
    // Virtual Interfaces
    // -------------------------------------------------

    virtual cpu_if     cpu_vif;

    virtual fetch_if   fetch_vif;

    virtual decode_if  decode_vif;

    virtual execute_if execute_vif;

    virtual memory_if  memory_vif;

    virtual branch_if  branch_vif;

    // -------------------------------------------------
    // Clock and Reset
    // -------------------------------------------------

    bit has_clock;

    bit has_reset;

    // -------------------------------------------------
    // Interface Widths
    // -------------------------------------------------

    int unsigned addr_width;

    int unsigned data_width;

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "interface_config"
    );

        super.new(name);

        has_clock = 1;

        has_reset = 1;

        addr_width = 64;

        data_width = 64;

    endfunction

    // -------------------------------------------------
    // Display Function
    // -------------------------------------------------

    function void display();

        `uvm_info("INTERFACE_CONFIG",
                  $sformatf
                  (
                    "ADDR_WIDTH=%0d DATA_WIDTH=%0d",
                    addr_width,
                    data_width
                  ),
                  UVM_LOW)

    endfunction

endclass