`timescale 1ns/1ps

class boot_sequence extends
      cpu_virtual_sequence;

    `uvm_object_utils
    (boot_sequence)

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "boot_sequence"
    );

        super.new(name);

    endfunction

    // -------------------------------------------------
    // Body Task
    // -------------------------------------------------

    task body();

        `uvm_info("BOOT_SEQUENCE",
                  "CPU Boot Sequence Started",
                  UVM_LOW)

        // ---------------------------------------------
        // Reset Initialization
        // ---------------------------------------------

        #20;

        `uvm_info("BOOT_SEQUENCE",
                  "Reset Released",
                  UVM_LOW)

        // ---------------------------------------------
        // Instruction Fetch Startup
        // ---------------------------------------------

        repeat(10) begin

            #10;

            `uvm_info("BOOT_SEQUENCE",
                      "Boot Fetch Running",
                      UVM_HIGH)

        end

        `uvm_info("BOOT_SEQUENCE",
                  "CPU Boot Completed",
                  UVM_LOW)

    endtask

endclass