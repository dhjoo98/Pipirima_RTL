library verilog;
use verilog.vl_types.all;
entity Mux is
    port(
        In0             : in     vl_logic;
        In1             : in     vl_logic;
        S               : in     vl_logic;
        \Out\           : out    vl_logic
    );
end Mux;
