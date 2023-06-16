module Counter0to15TestBench;

reg Clk;
wire [3:0] Count;

reg [3:0] Expected_Output;
reg [0:0] Fault_Indicator;
reg [15:0] Fault_Counter;
logic [3:0] Testvectors[0:33];
logic [7:0] vectornum;

Counter0to15 Counter (Count,Clk);

initial begin
	$dumpfile("The_output.vcd");
	$dumpvars(0,Count);
	$dumpvars(0,Clk);
	$dumpvars(0,Expected_Output);
	$dumpvars(0,Fault_Indicator);
	$dumpvars(0,Fault_Counter);
	$readmemb("memory_binary.txt", Testvectors);
	Fault_Counter = 0;
	vectornum = 0;
end

initial begin 
Clk=0;
repeat(65) #5 Clk=~Clk;
$finish;

end

always @(posedge Clk) begin
	{Expected_Output[3:0]} = Testvectors[vectornum];
end
always @(negedge Clk)begin
	if (Count==Expected_Output) begin
		$display ("Test Passed - (Expected Result ->%d) - (And ALU Result is ->%d) ", Expected_Output, Count);
		Fault_Indicator = 0;
	end
	else begin
		$display ("Test FAILED!! - (Expected Result->%d) - (But ALU Result is->%d) ", Expected_Output,Count);
		Fault_Indicator = 1;
		Fault_Counter = Fault_Counter + 1;
	end
	vectornum = vectornum + 1;
end
endmodule 
