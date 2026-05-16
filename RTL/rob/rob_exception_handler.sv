module rob_exception_handler
(
    input  logic             exception_valid,
    input  logic [63:0]      exception_pc,

    output logic             trap_taken,
    output logic [63:0]      trap_pc
);

always_comb begin

    trap_taken = 0;
    trap_pc    = 0;

    if (exception_valid) begin

        trap_taken = 1;
        trap_pc    = exception_pc;

    end
end

endmodule