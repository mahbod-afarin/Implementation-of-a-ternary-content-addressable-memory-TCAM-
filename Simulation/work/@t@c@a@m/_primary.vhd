library verilog;
use verilog.vl_types.all;
entity TCAM is
    port(
        r_addr0         : out    vl_logic_vector(6 downto 0);
        r_addr1         : out    vl_logic_vector(6 downto 0);
        data            : in     vl_logic_vector(9 downto 0);
        addr            : in     vl_logic_vector(3 downto 0);
        wr              : in     vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic
    );
end TCAM;
