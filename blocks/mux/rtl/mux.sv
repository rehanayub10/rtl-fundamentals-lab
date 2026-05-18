
module mux (
    input  logic a,    // Input 0
    input  logic b,    // Input 1
    input  logic sel,   // Select line
    output logic out    // Output
);

    // If sel is 0, out = a; if sel is 1, out = b
    assign out = sel ? b : a;

endmodule