--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity Mux2x1_4bit is
	port(
		in1,in0: in std_logic_vector(3 downto 0);
		s0: in std_logic;
		d: out std_logic_vector(3 downto 0)
	);

end Mux2x1_4bit;

--arquitetura
architecture Hardware of Mux2x1_4bit is
	component Mux2x1 is
		port(
			in1,in0: in std_logic;
			s0: in std_logic;
			d: out std_logic
		);
	end component;

begin
	Mux0: Mux2x1 port map(in1(0),in0(0),s0,d(0));
	Mux1: Mux2x1 port map(in1(1),in0(1),s0,d(1));
	Mux2: Mux2x1 port map(in1(2),in0(2),s0,d(2));
	Mux3: Mux2x1 port map(in1(3),in0(3),s0,d(3));
	
end Hardware;