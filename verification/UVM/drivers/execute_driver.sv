`timescale 1ns/1ps

class execute_driver extends
      uvm_driver #(execute_transaction);

    `uvm_component_utils(execute_driver)

    virtual execute_if vif;

    function new(string name,
                 uvm_component parent);

        super.new(name, parent);

    endfunction

    function void build_phase
    (
        uvm_phase phase
    );

        super.build_phase(phase);

        if (!uvm_config_db #(virtual execute_if)::
             get(this,
                 "",
                 "vif",
                 vif))

        begin

            `uvm_fatal("EXECUTE_DRIVER",
                       "No Virtual Interface")

        end

    endfunction

    task run_phase
    (
        uvm_phase phase
    );

        execute_transaction tr;

        forever begin

            seq_item_port.get_next_item(tr);

            @(posedge vif.clk);

            vif.execute_valid <= 1;

            vif.src1   <= tr.src1;
            vif.src2   <= tr.src2;

            vif.alu_op <= tr.alu_op;

            `uvm_info("EXECUTE_DRIVER",
                      $sformatf
                      ("SRC1=%h SRC2=%h ALU_OP=%0d",
                       tr.src1,
                       tr.src2,
                       tr.alu_op),
                      UVM_LOW)

            @(posedge vif.clk);

            vif.execute_valid <= 0;

            seq_item_port.item_done();

        end

    endtask

endclass