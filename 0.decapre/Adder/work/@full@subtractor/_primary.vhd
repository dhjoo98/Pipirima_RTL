library verilog;
use verilog.vl_types.all;
entity FullSubtractor is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        Bin             : in     vl_logic;
        D               : out    vl_logic;
        Bout            : out    vl_logic
    );
end FullSubtractor;
