`timescale 1ns/1ps
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
    parameter WIDTH = 8,
    parameter INPUTS = 4
) (
    //input logic [WIDTH-1:0] in [INPUTS],
    input logic [INPUTS-1:0][WIDTH-1:0] in, //packed array structure to get yosys to work
    input logic [$clog2(INPUTS)-1:0] sel,
    output logic [WIDTH-1:0] out
);

    assign out = in[sel];

endmodule
