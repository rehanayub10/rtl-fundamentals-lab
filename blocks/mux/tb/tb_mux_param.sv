`timescale 1ns/1ps

module tb_mux_param;

    localparam int WIDTH = 32;
    localparam int INPUTS = 8;
    localparam int SEL_W = $clog2(INPUTS);

    //Signal declarations
    logic [WIDTH-1:0] in [INPUTS];
    logic [SEL_W-1:0] sel;
    logic [WIDTH-1:0] out;

    //Instantiate DUT
    mux #(.WIDTH(WIDTH),.INPUTS(INPUTS)) dut (
        .in (in),
        .sel (sel),
        .out (out)
    );

    
    int fail = 0;

    task automatic check(
        input logic [WIDTH-1:0] exp,
        input string label
    );

        #10;
        if(out != exp) begin
            $error("FAIL [%s]: sel [%0d] | expected [%0d] got [%0d]", 
            label, sel, exp, out);
            fail++;
        end else begin
            $display("PASS [%s]: sel [%0d] | out=[%0d]", 
            label, sel, out);
        end
    endtask


    initial begin

        logic [WIDTH-1:0] expected_val;

        $dumpfile("blocks/mux/sim/mux_param.vcd");
        $dumpvars(0, tb_mux_param);

        //Load each input with a unique random value
        foreach(in[i]) in[i] = $urandom();

        for(int s = 0; s < INPUTS; s++) begin
            //Recall that we aren't using the default 32-bit width; need to cast
            sel = SEL_W'(s);
            expected_val = in[s]; //expected value from Verilog code
            check(expected_val, $sformatf("sel=%0d", sel));
        end

        if(fail == 0) begin
            $display("All tests passed.");
        end else begin
            $display("%0d test(s) failed", fail);
        end

        $finish;

    end

endmodule
