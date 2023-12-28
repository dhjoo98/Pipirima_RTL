library verilog;
use verilog.vl_types.all;
entity BarrelShifter is
    port(
        \In\            : in     vl_logic_vector(23 downto 0);
        \Out\           : out    vl_logic_vector(23 downto 0);
        Shift           : in     vl_logic_vector(4 downto 0)
    );
end BarrelShifter;
