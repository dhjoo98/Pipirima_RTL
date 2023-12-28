library verilog;
use verilog.vl_types.all;
entity Mux24 is
    port(
        A               : in     vl_logic_vector(22 downto 0);
        B               : in     vl_logic_vector(22 downto 0);
        S               : in     vl_logic;
        \Out\           : out    vl_logic_vector(23 downto 0)
    );
end Mux24;
