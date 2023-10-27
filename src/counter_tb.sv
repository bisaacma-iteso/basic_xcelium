module counter_tb ();

    bit clk;
    bit rst     = '1;
    bit enable  = '0;

    parameter MAX_COUNT = 8;

    initial forever
        #1 clk = ~clk;

    initial
        #4 {rst, enable} = {1'b0, 1'b1};

    //End test after some cycles
    initial begin
        $display("{ %4d } Starting sim",
            $time
        );
        #50;
        $display("{ %4d } Finishing sim",
            $time
        );
        $finish();
    end

    //Modules
    counter #(
        .MAX_COUNT(MAX_COUNT)
    ) DUT (
        .clk    (clk),
        .rst    (rst),
        .enable (enable)
    );

endmodule : counter_tb
