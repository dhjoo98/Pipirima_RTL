library verilog;
use verilog.vl_types.all;
entity ControlledIncrementor is
    port(
        A               : in     vl_logic;
        Z               : in     vl_logic_vector(7 downto 0);
        \Out\           : out    vl_logic_vector(7 downto 0)
    );
end ControlledIncrementor;
