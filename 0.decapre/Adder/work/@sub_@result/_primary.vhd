library verilog;
use verilog.vl_types.all;
entity Sub_Result is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        \B\             : in     vl_logic_vector(7 downto 0);
        \Out\           : out    vl_logic_vector(7 downto 0);
        b               : out    vl_logic
    );
end Sub_Result;
