library verilog;
use verilog.vl_types.all;
entity FloatingPointAdder is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        \Out\           : out    vl_logic_vector(31 downto 0)
    );
end FloatingPointAdder;
