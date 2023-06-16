`timescale 1ns/10ps

module half_adder_tb;

    reg a,b;
    wire s,c;

    localparam period = 15;

    half_adder DUT(a,b,s,c);

    initial begin
        $dumpfile("The_output.vcd");
        $dumpvars(0,a);
        $dumpvars(0,b);
        $dumpvars(0,s);
        $dumpvars(0,c);
        

    end
    initial begin
        a = 0;
        b = 0;
        #period;
        if(s != 0 || c != 0)
            $display("test failed for combination 00")

        a = 0;
        b = 1;
        #period;
        if(s != 1 || c != 0)
            $display("test failed for combination 01")

        a = 1;
        b = 0;
        #period;
        if(s != 1 || c != 0)
            $display("test failed for combination 10")

        a = 1;
        b = 1;
        #period;
        if(s != 0 || c != 1)
            $display("test failed for combination 11")
    end

endmodule