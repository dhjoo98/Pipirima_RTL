library verilog;
use verilog.vl_types.all;
entity Complement2s is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        \Out\           : out    vl_logic_vector(7 downto 0)
    );
end Complement2s;
