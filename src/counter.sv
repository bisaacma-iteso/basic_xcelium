module counter #(
    parameter MAX_COUNT = 256
)
(
    input   logic   clk,
    input   logic   rst,
    
    input   logic   enable,

    output  logic   max_hit,
    output  logic   [$clog2(MAX_COUNT):0]   count
);

    assign max_hit = count == MAX_COUNT;

    always @(posedge clk, posedge rst)
        if (rst)
            count   <=  '0;
        else
            if (enable)
                count   <=  max_hit ?
                                '0
                            :
                                ($clog2(MAX_COUNT)+1)'(count + 1'b1)
                            ;
            else
                count   <=  count;

endmodule : counter
