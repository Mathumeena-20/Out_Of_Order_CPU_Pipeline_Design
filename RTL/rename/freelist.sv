module freelist
#(
    parameter PHYS_REGS = 64
)
(
    input  logic             clk,
    input  logic             rst,

    input  logic             allocate,
    input  logic             free_en,

    input  logic [5:0]       free_reg,

    output logic [5:0]       allocated_reg,
    output logic             free_available
);

logic [5:0] free_list [PHYS_REGS-1:0];

logic [6:0] head;
logic [6:0] tail;
logic [6:0] count;

integer i;

assign free_available = (count != 0);

always_ff @(posedge clk) begin

    if (rst) begin

        head  <= 0;
        tail  <= 32;
        count <= PHYS_REGS - 32;

        for (i = 32; i < PHYS_REGS; i = i + 1)
            free_list[i-32] <= i;

    end

    else begin

        // Allocate Physical Register
        if (allocate && free_available) begin

            allocated_reg <= free_list[head];

            head  <= head + 1;
            count <= count - 1;

        end

        // Free Physical Register
        if (free_en) begin

            free_list[tail] <= free_reg;

            tail  <= tail + 1;
            count <= count + 1;

        end
    end
end

endmodule