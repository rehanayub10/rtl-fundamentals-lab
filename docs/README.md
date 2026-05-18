# RTL Fundamentals Lab

Combinational & sequential building blocks in SystemVerilog.

## Blocks
| Block | Type | Status |
|---|---|---|
| mux | Combinational | 🔲 |
| priority_encoder | Combinational | 🔲 |
| barrel_shifter | Combinational | 🔲 |
| cla_adder | Combinational | 🔲 |
| sync_fifo | Sequential | 🔲 |
| fsm_seq_detector | Sequential | 🔲 |

## Per-block layout
```
blocks/<name>/
  rtl/    # .sv source
  tb/     # self-checking testbench
  sim/    # Verilator build artifacts + .vcd
  synth/  # Yosys script + reports
```

## Tools
- **Sim**: Verilator — `scripts/sim_all.sh`
- **Synth**: Yosys — `scripts/synth_all.sh`
- **Waves**: GTKWave — open any `sim/*.vcd`
