module half_adder_tb;

    reg a,b;
    wire s,c;

    reg [0:0] Fault_Indicator;

    half_adder DUT(a,b,s,c);

    initial begin
        $dumpfile("The_output.vcd");
        $dumpvars(0,a);
        $dumpvars(0,b);
        $dumpvars(0,s);
        $dumpvars(0,c);
        $dumpvars(0,Fault_Indicator);
        Fault_Indicator = 0;
    end
    initial begin
        a = 0;
        b = 0;

        #5;
        if(s != 0 || c != 0) begin
            $display("Test FAILED For (00)!! (a->%d) (b->%d) - (Expected Result: s->0)  (Expected Result: c>0) - (But ALU Result is: s->%d) (But ALU Result is: c->%d) ", a, b, s, c);
            Fault_Indicator = 1;
        end
        else begin
            $display("Test Passed For (00)!! (a->%d) (b->%d) - (Expected Result: s->0)  (Expected Result: c>0) - (And ALU Result is: s->%d) (And ALU Result is: c->%d) ", a, b, s, c);
            Fault_Indicator = 0;
        end
        a = 0;
        b = 1;
        #5;
        if(s != 1 || c != 0) begin
            $display("Test FAILED For (01)!! (a->%d) (b->%d) - (Expected Result: s->0)  (Expected Result: c>1) - (But ALU Result is: s->%d) (But ALU Result is: c->%d) ", a, b, s, c);
            Fault_Indicator = 1;
        end
        else begin
            $display("Test Passed For (01)!! (a->%d) (b->%d) - (Expected Result: s->0)  (Expected Result: c>1) - (And ALU Result is: s->%d) (And ALU Result is: c->%d) ", a, b, s, c);
            Fault_Indicator = 0;
        end
        a = 1;
        b = 0;
        #5;
        if(s != 1 || c != 0) begin
            $display("Test FAILED For (10)!! (a->%d) (b->%d) - (Expected Result: s->1)  (Expected Result: c>0) - (But ALU Result is: s->%d) (But ALU Result is: c->%d) ", a, b, s, c);
            Fault_Indicator = 1;
        end
        else begin
            $display("Test Passed For (10)!! (a->%d) (b->%d) - (Expected Result: s->1)  (Expected Result: c>0) - (And ALU Result is: s->%d) (And ALU Result is: c->%d) ", a, b, s, c);
            Fault_Indicator = 0;
        end
        a = 1;
        b = 1;
        #5;
        if(s != 0 || c != 1)  begin
            $display("Test FAILED For (11)!! (a->%d) (b->%d) - (Expected Result: s->1)  (Expected Result: c>1) - (But ALU Result is: s->%d) (But ALU Result is: c->%d) ", a, b, s, c);
            Fault_Indicator = 1;
        end
        else begin
            $display("Test Passed For (11)!! (a->%d) (b->%d) - (Expected Result: s->1)  (Expected Result: c>1) - (And ALU Result is: s->%d) (And ALU Result is: c->%d) ", a, b, s, c);
            Fault_Indicator = 0;
        end
    end

endmodule