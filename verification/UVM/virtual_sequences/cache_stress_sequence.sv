`timescale 1ns/1ps

class cache_stress_sequence extends
      cpu_virtual_sequence;

    `uvm_object_utils
    (cache_stress_sequence)

    // -------------------------------------------------
    // Memory Transaction
    // -------------------------------------------------

    memory_transaction tr;

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new
    (
        string name =
        "cache_stress_sequence"
    );

        super.new(name);

    endfunction

    // -------------------------------------------------
    // Body Task
    // -------------------------------------------------

    task body();

        `uvm_info("CACHE_STRESS",
                  "Starting Cache Stress Test",
                  UVM_LOW)

        repeat(1000) begin

            tr =
            memory_transaction::
            type_id::
            create("tr");

            assert(tr.randomize());

            `uvm_info("CACHE_STRESS",
                      $sformatf
                      (
                        "ADDR=%h DATA=%h READ=%b WRITE=%b",
                        tr.addr,
                        tr.data,
                        tr.read_en,
                        tr.write_en
                      ),
                      UVM_HIGH)

            #2;

        end

        `uvm_info("CACHE_STRESS",
                  "Cache Stress Completed",
                  UVM_LOW)

    endtask

endclass