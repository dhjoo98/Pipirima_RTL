library verilog;
use verilog.vl_types.all;
entity Adder_24Bit is
    port(
        A               : in     vl_logic_vector(23 downto 0);
        B               : in     vl_logic_vector(23 downto 0);
        \Out\           : out    vl_logic_vector(23 downto 0);
        Cout            : out    vl_logic
    );
end Adder_24Bit;
