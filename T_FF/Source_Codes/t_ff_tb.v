`timescale 1ns/10ps

module half_adder_tb;

    reg t, clear, clk;
    wire q;

    localparam period = 15;

    t_ff DUT(t,clear,clk,q);

    initial begin
        t = 0;
        clear = 1;
        clk = 0;
        #period;

        clear = 0;
        clk = 1;
        #period
        if(q != 0)
            $display("test failed for q=0, t=0")

        clk = 0;
        #period

        t = 1;
        clk = 1;
        #period
        if(q != 1)
            $display("test failed for q=0, t=1")

        clk = 0;
        #period

        t = 0;
        clk = 1;
        #period
        if(q != 1)
            $display("test failed for q=1, t=0")

        clk = 0;
        #period

        t=1;
        clk = 1;
        #period
        if(q != 0)
            $display("test failed for q=1, t=1")

        clk = 0;
        #period

        clear = 1;
        clk = 1;
        #period
        if(q != 0)
            $display("test failed for clear=1")

    end

endmodule