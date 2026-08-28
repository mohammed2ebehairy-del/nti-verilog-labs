# NTI Verilog Labs

Digital Electronics / Analog & Digital IC course labs, National Telecommunication Institute.

## Structure

```
labs/
  day5_fsm/            FSM labs: LFSR, generic adder, sequence detectors,
                        FSM counter, vending machine FSM
  day6_sequential/      Gray counter, Modulo-N counter, serial/parallel
                        converters, register
project_uart/
  rtl/                  UART transmitter design files
  tb/                   Testbenches for each UART block
```

## Note

The earlier combinational labs (full adder, demux, encoder, decoder,
comparator, ALU) were solved separately and should be added here as well
before submission — see `labs/day6_p2_combinational/`.

## Simulation

Each `.sv` / `.v` pair is a design file plus its testbench. Simulate with
Icarus Verilog, ModelSim, or Vivado, e.g.:

```
iverilog -o sim rtl_file.v tb_file.v
vvp sim
```

For the UART project, compile all files in `rtl/` together with the
testbench in `tb/`:

```
iverilog -o uart_sim project_uart/rtl/*.v project_uart/tb/UART_TX_tb.v
vvp uart_sim
```
