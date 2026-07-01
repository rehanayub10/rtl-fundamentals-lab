`timescale 1ns/1ps

module priority_encoder_4_2 (
    input logic [3:0] in,
    output logic [1:0] sel,
    output logic valid
);

    assign valid = in[3] || in[2] || in[1] || in[0];

    always_comb begin : encoder_A
        if(in[3] == 1'b1) begin
            sel = 2'b11; 
        end
        else if (in[2] == 1'b1) begin
            sel = 2'b10;
        end
        else if (in[1] == 1'b1) begin
            sel = 2'b01;
        end
        else begin
            sel = 2'b00;
        end
    end
    
endmodule
