module alu_tb;

    reg a,b,c,d;
    reg [1:0] selc;
    wire out;
    reg Fault_Indicator;


    mux DUT(a,b,c,d, selc, out);

    initial begin
        $dumpfile("The_output.vcd");
        $dumpvars(0,a);
        $dumpvars(0,b);
        $dumpvars(0,c);
        $dumpvars(0,d);
        $dumpvars(0,sel);
        $dumpvars(0,out);
        $dumpvars(0,Fault_Indicator);

        Fault_Indicator = 0;
    end

    initial begin
        a = 0;
        b = 1;
        c = 0;
        d = 1;
        selc = b00;

        #5;
        if(out != 0) begin
            $display("Test FAILED For (%b %b %b %b and selc=%b) (Expected Result: out->0) (But ALU Result is: s->%b)!!  ", a, b, c, d, selc, out);
            Fault_Indicator = 1;
        end
        else begin
            $display("Test Passed For (%b %b %b %b and selc=%b) (Expected Result: out->0) (And ALU Result is: c->%d) ", a, b, c, d, selc, out);
            Fault_Indicator = 0;
        end

        a = 0;
        b = 1;
        c = 0;
        d = 1;
        selc = b01;
        #5;

        if(out != 1) begin
            $display("Test FAILED For (%b %b %b %b and selc=%b) (Expected Result: out->1) (But ALU Result is: s->%b)!!  ", a, b, c, d, selc, out);
            Fault_Indicator = 1;
        end
        else begin
            $display("Test Passed For (%b %b %b %b and selc=%b) (Expected Result: out->1) (And ALU Result is: c->%d) ", a, b, c, d, selc, out);
            Fault_Indicator = 0;
        end

        a = 0;
        b = 1;
        c = 0;
        d = 1;
        selc = b10;
        #5;
        if(out != 0) begin
            $display("Test FAILED For (%b %b %b %b and selc=%b) (Expected Result: out->0) (But ALU Result is: s->%b)!!  ", a, b, c, d, selc, out);
            Fault_Indicator = 1;
        end
        else begin
            $display("Test Passed For (%b %b %b %b and selc=%b) (Expected Result: out->0) (And ALU Result is: c->%d) ", a, b, c, d, selc, out);
            Fault_Indicator = 0;
        end
        a = 0;
        b = 1;
        c = 0;
        d = 1;
        selc = b11;

        #5;
        if(out != 1)
            if(out != 1) begin
            $display("Test FAILED For (%b %b %b %b and selc=%b) (Expected Result: out->1) (But ALU Result is: s->%b)!!  ", a, b, c, d, selc, out);
            Fault_Indicator = 1;
        end
        else begin
            $display("Test Passed For (%b %b %b %b and selc=%b) (Expected Result: out->1) (And ALU Result is: c->%d) ", a, b, c, d, selc, out);
            Fault_Indicator = 0; 
        end    
    end

endmodule