module  t_ff_tb;

    reg t, clear, clk;
    wire q;

    t_ff DUT(t,clear,clk,q);

    initial begin
        t = 0;
        clear = 1;
        clk = 0;
        #5;

        clear = 0;
        clk = 1;
        #5
        if(q != 0)
            $display("test failed for q=0, t=0")

        clk = 0;
        #5

        t = 1;
        clk = 1;
        #5
        if(q != 1)
            $display("test failed for q=0, t=1")

        clk = 0;
        #5

        t = 0;
        clk = 1;
        #5
        if(q != 1)
            $display("test failed for q=1, t=0")

        clk = 0;
        #5

        t=1;
        clk = 1;
        #5
        if(q != 0)
            $display("test failed for q=1, t=1")

        clk = 0;
        #5

        clear = 1;
        clk = 1;
        #5
        if(q != 0)
            $display("test failed for clear=1")

    end

endmodule