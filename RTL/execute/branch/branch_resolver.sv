module branch_resolver
#(
    parameter XLEN = 64
)
(
    input  logic [XLEN-1:0] rs1,
    input  logic [XLEN-1:0] rs2,

    input  logic [2:0]      branch_type,

    output logic            branch_taken
);

always_comb begin

    case(branch_type)

        3'd0: branch_taken = (rs1 == rs2);
        3'd1: branch_taken = (rs1 != rs2);
        3'd2: branch_taken = ($signed(rs1) < $signed(rs2));
        3'd3: branch_taken = ($signed(rs1) >= $signed(rs2));

        default:
            branch_taken = 0;

    endcase
end

endmodule