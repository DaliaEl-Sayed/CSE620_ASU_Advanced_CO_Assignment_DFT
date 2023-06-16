module Counter0to15TestBench;

reg Clk;
wire [3:0] Count;
logic [13:0] Testvectors[0:99];

Counter0to15 Counter (Count,Clk);
initial begin
	$dumpfile("The_output.vcd");
	$dumpvars(0,Count);
	$dumpvars(0,Clk);
	$readmemb("memory_binary.txt", Testvectors);
end

initial begin 
Clk=0;
repeat(40) #5 Clk=~Clk;
$finish;

end

endmodule 
