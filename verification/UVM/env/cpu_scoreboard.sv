`timescale 1ns/1ps

class cpu_scoreboard extends
      uvm_scoreboard;

    `uvm_component_utils
    (cpu_scoreboard)

    // -------------------------------------------------
    // Analysis Ports
    // -------------------------------------------------

    uvm_analysis_imp #(cpu_transaction,
                       cpu_scoreboard)
                       cpu_port;

    // -------------------------------------------------
    // Reference Variables
    // -------------------------------------------------

    int total_transactions;

    int passed_transactions;

    int failed_transactions;

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new(string name,
                 uvm_component parent);

        super.new(name, parent);

        cpu_port =
        new("cpu_port", this);

    endfunction

    // -------------------------------------------------
    // Build Phase
    // -------------------------------------------------

    function void build_phase
    (uvm_phase phase);

        super.build_phase(phase);

        total_transactions  = 0;
        passed_transactions = 0;
        failed_transactions = 0;

    endfunction

    // -------------------------------------------------
    // Write Function
    // -------------------------------------------------

    function void write
    (cpu_transaction tr);

        total_transactions++;

        `uvm_info("SCOREBOARD",
                  $sformatf
                  ("Instruction=%h",
                   tr.instruction),
                  UVM_LOW)

        // ---------------------------------------------
        // Example Reference Check
        // ---------------------------------------------

        if (tr.result == (tr.src1 + tr.src2)) begin

            passed_transactions++;

            `uvm_info("SCOREBOARD",
                      "CHECK PASSED",
                      UVM_LOW)

        end

        else begin

            failed_transactions++;

            `uvm_error("SCOREBOARD",
                       "CHECK FAILED")

        end

    endfunction

    // -------------------------------------------------
    // Report Phase
    // -------------------------------------------------

    function void report_phase
    (uvm_phase phase);

        `uvm_info("SCOREBOARD",
                  $sformatf
                  ("TOTAL=%0d PASS=%0d FAIL=%0d",
                   total_transactions,
                   passed_transactions,
                   failed_transactions),
                  UVM_NONE)

    endfunction

endclass