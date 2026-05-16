module fetch_queue
#(
    parameter DEPTH = 16
)
(
    input  logic             clk,
    input  logic             rst,

    input  logic             push,
    input  logic [31:0]      inst_in,
    input  logic [63:0]      pc_in,

    input  logic             pop,

    output logic [31:0]      inst_out,
    output logic [63:0]      pc_out,

    output logic             empty,
    output logic             full
);

typedef struct packed {

    logic [31:0] inst;
    logic [63:0] pc;

} fetch_entry_t;

fetch_entry_t queue [DEPTH-1:0];

logic [$clog2(DEPTH):0] head;
logic [$clog2(DEPTH):0] tail;
logic [$clog2(DEPTH+1)-1:0] count;

assign empty = (count == 0);
assign full  = (count == DEPTH);

always_ff @(posedge clk) begin

    if (rst) begin

        head  <= 0;
        tail  <= 0;
        count <= 0;

    end

    else begin

        // Push
        if (push && !full) begin

            queue[tail].inst <= inst_in;
            queue[tail].pc   <= pc_in;

            tail <= tail + 1;
            count <= count + 1;

        end

        // Pop
        if (pop && !empty) begin

            inst_out <= queue[head].inst;
            pc_out   <= queue[head].pc;

            head <= head + 1;
            count <= count - 1;

        end

    end
end

endmodule