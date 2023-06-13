module ALU (C,A,B,OP);

input [3:0] A;
input [3:0] B;
input [1:0] OP;

parameter Add = 2'b00;
parameter Sub = 2'b01;
parameter Mul = 2'b10;
parameter Div = 2'b11;

output [3:0] C;

reg [3:0] C;
reg [7:0] Temp;

always @ (OP,A,B) begin

case(OP)

 Add :  C <= A + B;
 Sub :  C <= A - B;
 Mul : begin
       Temp <= A * B;
       C    <= Temp;      
       end
 Div : C <= A / B ;  


endcase

end

endmodule
