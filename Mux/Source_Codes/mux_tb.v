`timescale 1ns/10ps

module alu_tb;

    reg a,b,c,d;
    reg[1:0] sel;
    wire out;

    localparam period = 15;

    mux DUT(a,b,c,d sel);

    initial begin
        a = 0;
        b = 1;
        c = 0;
        d = 1;
        sel = 'b00;
        #period;
        if(out != 0)
            $display("test failed for combination 0101 sel=0")

        a = 0;
        b = 1;
        c = 0;
        d = 1;
        sel = 'b00;
        #period;
        if(out != 0)
            $display("test failed for combination 0101 sel=0")

        a = 0;
        b = 1;
        c = 0;
        d = 1;
        sel = 'b01;
        #period;
        if(out != 1)
            $display("test failed for combination 0101 sel=1")

        a = 0;
        b = 1;
        c = 0;
        d = 1;
        sel = 'b10;
        #period;
        if(out != 0)
            $display("test failed for combination 0101 sel=2")

        a = 0;
        b = 1;
        c = 0;
        d = 1;
        sel = 'b11;
        #period;
        if(out != 1)
            $display("test failed for combination 0101 sel=3")
    end

endmodule