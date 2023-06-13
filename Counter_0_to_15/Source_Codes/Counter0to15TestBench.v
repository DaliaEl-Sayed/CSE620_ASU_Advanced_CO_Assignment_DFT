module Counter0to15TestBench;

reg Clk;
wire [3:0] Count;

Counter0to15 Counter (Count,Clk);

initial begin 
Clk=0;

forever #5 Clk=~Clk;

end

endmodule 
