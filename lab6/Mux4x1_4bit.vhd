--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity Mux4x1_4bit is
	port(
		in3,in2,in1,in0: in std_logic_vector(3 downto 0);
		s1,s0: in std_logic;
		d: out std_logic_vector(3 downto 0)
	);

end Mux4x1_4bit;

--arquitetura
architecture Hardware of Mux4x1_4bit is
	component Mux4x1 is
		port(
			in3,in2,in1,in0: in std_logic;
			s1,s0: in std_logic;
			d: out std_logic
		);
	end component;

begin
	mux0: Mux4x1 port map(in3(0),in2(0),in1(0),in0(0),s1,s0,d(0));
	mux1: Mux4x1 port map(in3(1),in2(1),in1(1),in0(1),s1,s0,d(1));
	mux2: Mux4x1 port map(in3(2),in2(2),in1(2),in0(2),s1,s0,d(2));
	mux3: Mux4x1 port map(in3(3),in2(3),in1(3),in0(3),s1,s0,d(3));
	
end Hardware;