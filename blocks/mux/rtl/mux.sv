
//module mux (
//    input  logic a,    // Input 0
//    input  logic b,    // Input 1
//    input  logic sel,   // Select line
//    output logic out    // Output
//);
//
//    // If sel is 0, out = a; if sel is 1, out = b
//    assign out = sel ? b : a;
//
//endmodule

module mux #(
    parameter int WIDTH  = 8,
    parameter int INPUTS = 4
) (
    input  logic [WIDTH-1:0]          in  [INPUTS],
    output logic [WIDTH-1:0]          out,
    input  logic [$clog2(INPUTS)-1:0] sel
);

    assign out = in[sel];
    // Below is if you wanted to account for unused values (i.e. 3 inputs, some select values unused)
    //assign out = (sel < INPUTS) ? in[sel] : '0;

endmodule