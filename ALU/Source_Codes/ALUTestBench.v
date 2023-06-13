module ALUTestBench ();

reg [3:0] A;
reg [3:0] B;
reg [1:0] Op;
reg [0:0] Fault_Indicator;
reg [15:0] Fault_Counter;
reg clk = 0;
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
$dumpvars(0,Fault_Indicator);
$dumpvars(0,Fault_Counter);
$dumpvars(0,clk);

end

initial begin 
	repeat(30) #2 clk = ~clk;
end 

always @(posedge clk) begin
	A = 1;
	B = 4;
	Op = Add;
end
always @(negedge clk)begin
	if (C==A+B) begin
		$display ("Test Passed - Expected Result -> %d", A+B);
		Fault_Indicator = 1;
	end
	else begin
		$display ("Test Failed Expected Result -> %d", A+B);
		Fault_Indicator = 0;
	end
	
end


	


endmodule 
