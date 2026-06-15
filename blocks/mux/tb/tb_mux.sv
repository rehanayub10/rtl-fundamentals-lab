`timescale 1ns/1ps
 
module tb_mux;

    //Signal declarations
    logic a, b, sel;
    logic out;

    //Instantiate DUT
    mux dut(
        .a (a),
        .b (b),
        .sel (sel),
        .out (out)
    );

    //Failures tracking
    int fail = 0;

    task automatic check(
        input logic exp,
        input string label
    );
        #10;
        if (out != exp) begin
            $error("FAIL [%s]: a=%b, b=%b, sel=%b | expected %b got %b", label, a, b, sel, exp, out);
            fail++;
        end else begin
            $display("PASS [%s]: a=%b, b=%b, sel=%b | out %b", label, a, b, sel, out);
        end

    endtask

    initial begin

        //sel=0 should output a
        a=0; b=0; sel=0; check(0, "sel0_a0b0");
        a=0; b=1; sel=0; check(0, "sel0_a0b1");
        a=1; b=0; sel=0; check(1, "sel0_a1b0");
        a=1; b=1; sel=0; check(1, "sel0_a1b1");

        //sel=1 should output b
        a=0; b=0; sel=1; check(0, "sel1_a0b0");
        a=0; b=1; sel=1; check(1, "sel1_a0b1");
        a=1; b=0; sel=1; check(0, "sel1_a1b0");
        a=1; b=1; sel=1; check(1, "sel1_a1b1");

        if(fail == 0) begin
            $display("All tests passed!");
        end else begin
            $display("%0d test(s) failed.", fail);
        end

        $finish;
    end

endmodule