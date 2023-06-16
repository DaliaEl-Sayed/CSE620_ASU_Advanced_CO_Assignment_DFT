module Counter0to15 (Count,Clk);

input Clk;
output [3:0] Count;

reg [3:0] Count;

initial begin

Count <= 0;
 
end

always @ (posedge Clk) begin

	Count <= Count + 1;

end 

endmodule 