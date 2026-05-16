`timescale 1ns/1ps

class coverage_collector extends
      uvm_component;

    `uvm_component_utils
    (coverage_collector)

    // -------------------------------------------------
    // Coverage Variables
    // -------------------------------------------------

    bit [3:0] alu_op;

    bit branch_taken;

    bit cache_hit;

    // -------------------------------------------------
    // Covergroups
    // -------------------------------------------------

    covergroup alu_cg;

        coverpoint alu_op {

            bins add_op = {0};
            bins sub_op = {1};
            bins and_op = {2};
            bins or_op  = {3};
            bins xor_op = {4};
            bins slt_op = {5};

        }

    endgroup

    covergroup branch_cg;

        coverpoint branch_taken {

            bins taken     = {1};
            bins not_taken = {0};

        }

    endgroup

    covergroup cache_cg;

        coverpoint cache_hit {

            bins hit  = {1};
            bins miss = {0};

        }

    endgroup

    // -------------------------------------------------
    // Constructor
    // -------------------------------------------------

    function new(string name,
                 uvm_component parent);

        super.new(name, parent);

        alu_cg    = new();
        branch_cg = new();
        cache_cg  = new();

    endfunction

    // -------------------------------------------------
    // Sample Function
    // -------------------------------------------------

    function void sample_alu
    (
        bit [3:0] op
    );

        alu_op = op;

        alu_cg.sample();

    endfunction

    function void sample_branch
    (
        bit taken
    );

        branch_taken = taken;

        branch_cg.sample();

    endfunction

    function void sample_cache
    (
        bit hit
    );

        cache_hit = hit;

        cache_cg.sample();

    endfunction

endclass