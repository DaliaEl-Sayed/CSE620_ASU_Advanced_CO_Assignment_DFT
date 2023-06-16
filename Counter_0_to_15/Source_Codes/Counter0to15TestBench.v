module Counter0to15TestBench;

reg Clk;
wire [3:0] Count;

Counter0to15 Counter (Count,Clk);

initial begin 
Clk=0;

initial begin
	$dumpfile("The_output.vcd");
	$dumpvars(0,Count);
	$dumpvars(0,Clk);
end

forever #5 Clk=~Clk;

end

endmodule 
