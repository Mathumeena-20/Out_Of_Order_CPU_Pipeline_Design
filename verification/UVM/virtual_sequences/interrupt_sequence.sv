`timescale 1ns/1ps

class interrupt_sequence extends
      cpu_virtual_sequence;

    `uvm_object_utils
    (interrupt_sequence)

    // -------------------------------------------------
    // Interrupt Variables
    // -------------------------------------------------

    rand bit timer_interrupt;

    rand bit external_interrupt;

    // -------------------------------------------------
    // Constraints
    // -------------------------------------------------

    constraint interrupt_constraint {

        timer_interrupt ||
        external_interrupt;

    }

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "interrupt_sequence"
    );

        super.new(name);

    endfunction

    // -------------------------------------------------
    // Body Task
    // -------------------------------------------------

    task body();

        `uvm_info("INTERRUPT_SEQ",
                  "Starting Interrupt Sequence",
                  UVM_LOW)

        repeat(50) begin

            assert(this.randomize());

            `uvm_info("INTERRUPT_SEQ",
                      $sformatf
                      (
                        "TIMER_INT=%b EXT_INT=%b",
                        timer_interrupt,
                        external_interrupt
                      ),
                      UVM_HIGH)

            #20;

        end

        `uvm_info("INTERRUPT_SEQ",
                  "Interrupt Sequence Completed",
                  UVM_LOW)

    endtask

endclass