`timescale 1ns/1ps

module tb_mux;

    localparam int WIDTH  = 32;
    localparam int INPUTS = 11;
    localparam int SEL_W  = $clog2(INPUTS);

    logic [WIDTH-1:0] in  [INPUTS];
    logic [SEL_W-1:0] sel;
    logic [WIDTH-1:0] out;

    // Instantiate DUT
    mux #(.WIDTH(WIDTH), .INPUTS(INPUTS)) dut (
        .in  (in),
        .sel (sel),
        .out (out)
    );

    int fail = 0;

    task automatic check(
        input logic [WIDTH-1:0] exp,
        input string            label
    );
        #10;
        if (out !== exp) begin
            $error("FAIL [%s]: sel=%0d | expected %0h got %0h",
                    label, sel, exp, out);
            fail++;
        end else begin
            $display("PASS [%s]: sel=%0d | out=%0h", label, sel, out);
        end
    endtask

    initial begin
        // Load each input with a unique random value
        foreach (in[i]) in[i] = $urandom();

        // Sweep through every select value
        for (int s = 0; s < INPUTS; s++) begin
            //' is cast operator - by default "int" would be 32 bits. Same idea as 4'b1010
            sel = SEL_W'(s);
            //recall that expected value of a parameterized mux is in[s]
            check(in[s], $sformatf("sel=%0d", s));
        end

        if (fail == 0)
            $display("All tests passed.");
        else
            $display("%0d test(s) failed.", fail);

        $finish;
    end

endmodule