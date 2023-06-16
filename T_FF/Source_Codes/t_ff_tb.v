module  t_ff_tb;

    reg t;
    reg clear;
    reg clk;
    wire q;

    reg Fault_Indicator;

    t_ff DUT(t,clear,clk,q);

    initial begin
        $dumpfile("The_output.vcd");
        $dumpvars(0,t);
        $dumpvars(0,clear);
        $dumpvars(0,q);
        $dumpvars(0,clk);        
        $dumpvars(0,Fault_Indicator);

        Fault_Indicator = 0;
    end
    initial begin 
        clk=0;
        repeat(100) #5 clk=~clk;
        $finish;
    end
    initial begin
        t = 1;
        repeat(20) #25 t=~t;
        $finish;
    end 
    initial begin 
        clear = 1;
        repeat(25) #20 clear=~clear;
        $finish;
    end

    initial begin
        #10
        t = 0;
        clear = 0;
    end 

    always @ (posedge clk) begin
        if(clear == 0 && t == 0 ) begin
            if(q == 0) begin
                if(q ^ t == 1) begin
                    $display("test failed for t=0");
                    Fault_Indicator = 1;
                end
                else if(q ^ t == 0) begin
                    $display("test succeeded for t=0");
                    Fault_Indicator = 0;
                end
            end
            else if (q == 1) begin 
                if(q ^ t == 0) begin
                    $display("test failed for t=0");
                    Fault_Indicator = 1;
                end
                else if(q ^ t == 1) begin
                    $display("test succeeded for t=0");
                    Fault_Indicator = 0;
                end

            end
        end
        else if(clear == 0 && t == 1 ) begin
            if (q == 1) begin 
                if(q ^ t == 1) begin
                    $display("test failed for t=1");
                    Fault_Indicator = 1;
                end
                else if(q ^ t == 0) begin
                    $display("test succeeded for t=1");
                    Fault_Indicator = 0;
                end
            end
            else if (q == 0) begin
                if(q ^ t == 0) begin
                    $display("test failed for t=1");
                    Fault_Indicator = 1;
                end
                else if(q ^ t == 1) begin
                    $display("test succeeded for t=1");
                    Fault_Indicator = 0;
                end
            end
        end
        else if(clear ==1 && q != 0) begin
            $display("test failed for clear=1");
            Fault_Indicator = 1;
        end
        else if(clear ==1 && q == 0) begin
            $display("test succeeded for clear=1");
            Fault_Indicator = 0;
        end
    end

endmodule