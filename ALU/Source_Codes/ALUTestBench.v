module ALUTestBench ();

reg [3:0] A;
reg [3:0] B;
reg [1:0] Op;
reg [0:0] Fault_Indicator;
wire [3:0] C;

parameter Add = 2'b00;
parameter Sub = 2'b01;
parameter Mul = 2'b10;
parameter Div = 2'b11;


ALU SimpleALU (C,A,B,Op);


initial begin

$dumpfile("The_output.vcd");
$dumpvars(0,A);
$dumpvars(0,B);
$dumpvars(0,Op);
$dumpvars(0,C);
$dumpvars(0,Fault_Indicator);

end

initial begin 

$finish;
end

endmodule 
