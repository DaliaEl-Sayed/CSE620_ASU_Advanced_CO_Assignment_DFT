module t_ff(t, clear, clk, q);

    input t, clear, clk;
    output reg q;

    always @(posedge clk, clear)begin
        case(clear)
            1: q <= 0;
            default: 
                case(t)
                    0: q <= q;
                    1: q <= ~q;
                endcase
        endcase
    end

endmodule