library verilog;
use verilog.vl_types.all;
entity Subtractor_8Bit is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        D               : out    vl_logic_vector(7 downto 0);
        Bout            : out    vl_logic
    );
end Subtractor_8Bit;
