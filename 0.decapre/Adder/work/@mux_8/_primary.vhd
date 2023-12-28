library verilog;
use verilog.vl_types.all;
entity Mux_8 is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        C               : in     vl_logic;
        \Out\           : out    vl_logic_vector(7 downto 0)
    );
end Mux_8;
