module ALUTestBench ();

reg [3:0] A;
reg [3:0] B;
reg [1:0] Op;
reg [3:0] Expected_Output;
reg [0:0] Fault_Indicator;
reg [15:0] Fault_Counter;
logic [13:0] Testvectors[0:5];
logic [7:0] vectornum;
reg clk;
wire [3:0] C;


parameter Add = 2'b00;
parameter Sub = 2'b01;
parameter Mul = 2'b10;
parameter Div = 2'b11;

ALU CUT (C,A,B,Op);

initial begin
	$dumpfile("The_output.vcd");
	$dumpvars(0,A);
	$dumpvars(0,B);
	$dumpvars(0,Op);
	$dumpvars(0,C);
	$dumpvars(0,Expected_Output);
	$dumpvars(0,Fault_Indicator);
	$dumpvars(0,Fault_Counter);
	$dumpvars(0,clk);
	Fault_Counter = 0;
	clk = 0;
	vectornum = 0;
	$readmemb("memory_binary.txt", Testvectors);
end

initial begin 
	repeat(60) #2 clk = ~clk;
end 

always @(posedge clk) begin
	/*A = 0;
	B = 1;
	Op = Mul;*/
	{A[3:0], B[3:0], Op[1:0], Expected_Output[3:0] } = Testvectors[vectornum];
end
always @(negedge clk)begin
	if (C==Expected_Output) begin
		$display ("Test Passed - Expected Result -> %b - And ALU Result is -> %b ", Expected_Output, C);
		Fault_Indicator = 0;
	end
	else begin
		$display ("Test FAILED!! - Expected Result -> %b - But ALU Result is -> %b ", Expected_Output,C);
		Fault_Indicator = 1;
		Fault_Counter = Fault_Counter + 1;
	end
	vectornum = vectornum + 1;
end

endmodule 
