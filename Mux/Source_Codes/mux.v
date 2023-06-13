module mux(a,b,c,d, sel, out);

    input a,b,c,d;
    input[1:0] sel;
    output reg out;

    always @(a,b,c,d,sel)
        case(sel)
            0: out <= a;
            1: out <= b;
            2: out <= c;
            default: out <= d;
        endcase

endmodule