module instruction_classifier
(
    input  logic [6:0] opcode,

    output logic       is_alu,
    output logic       is_load,
    output logic       is_store,
    output logic       is_branch,
    output logic       is_jump
);

always_comb begin

    is_alu    = 0;
    is_load   = 0;
    is_store  = 0;
    is_branch = 0;
    is_jump   = 0;

    case(opcode)

        // R-Type / I-Type
        7'b0110011,
        7'b0010011:
            is_alu = 1;

        // Load
        7'b0000011:
            is_load = 1;

        // Store
        7'b0100011:
            is_store = 1;

        // Branch
        7'b1100011:
            is_branch = 1;

        // Jump
        7'b1101111,
        7'b1100111:
            is_jump = 1;

        default: begin
        end

    endcase
end

endmodule