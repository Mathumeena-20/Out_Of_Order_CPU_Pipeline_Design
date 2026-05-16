`timescale 1ns/1ps

module cache_fsm
(
    input  logic         clk,
    input  logic         rst,

    input  logic         cache_miss,
    input  logic         memory_ready,

    output logic         memory_request,
    output logic         refill
);

typedef enum logic [1:0] {

    IDLE,
    MISS,
    REFILL

} state_t;

state_t state, next_state;

always_ff @(posedge clk) begin

    if (rst)
        state <= IDLE;

    else
        state <= next_state;

end

always_comb begin

    next_state    = state;

    memory_request = 0;
    refill         = 0;

    case(state)

        IDLE: begin

            if (cache_miss)
                next_state = MISS;

        end

        MISS: begin

            memory_request = 1;

            if (memory_ready)
                next_state = REFILL;

        end

        REFILL: begin

            refill = 1;
            next_state = IDLE;

        end

    endcase
end

endmodule