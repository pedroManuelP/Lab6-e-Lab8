--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity Reg4 is
	port(
		D: in std_logic_vector(3 downto 0);
		CLK: in std_logic;
		Q: out std_logic_vector(3 downto 0)
	);

end Reg4;

--arquitetura
architecture Hardware of Reg4 is
	component ffd is
		port (ck, clr, set, d : in  std_logic;
								  q : out std_logic);
	end component;
	
begin
	bit0: ffd port map(CLK, '1', '1',D(0),Q(0));
	bit1: ffd port map(CLK, '1', '1',D(1),Q(1));
	bit2: ffd port map(CLK, '1', '1',D(2),Q(2));
	bit3: ffd port map(CLK, '1', '1',D(3),Q(3));
	
end Hardware;