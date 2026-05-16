module issue_queue_dispatch
(
    input  logic             clk,
    input  logic             rst,

    input  logic             dispatch_en,

    input  logic [5:0]       src1_tag,
    input  logic [5:0]       src2_tag,
    input  logic [5:0]       dest_tag,

    input  logic             src1_ready,
    input  logic             src2_ready,

    input  logic [31:0]      instruction,

    output logic             rs_valid
);

always_ff @(posedge clk) begin

    if (rst) begin

        rs_valid <= 0;

    end

    else if (dispatch_en) begin

        rs_valid <= 1;

        $display("Dispatch to RS:");
        $display("SRC1=%0d SRC2=%0d DEST=%0d",
                  src1_tag,
                  src2_tag,
                  dest_tag);

    end

    else begin

        rs_valid <= 0;

    end
end

endmodule