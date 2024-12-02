--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity somadorSubtrator is
	port(
		A,B: in std_logic_vector(3 downto 0);
		SOMA_SUB: in std_logic;
		S: out std_logic_vector(3 downto 0);
		COUT: out std_logic
	);
end somadorSubtrator;

--arquitetura
architecture comportamento of somadorSubtrator is
	component somador4bits is
		port(
			A,B: in std_logic_vector(3 downto 0);
			CIN: in std_logic;
			S: out std_logic_vector(3 downto 0);
			COUT: out std_logic
		);
	end component;


	component Mux2x1_4bit is
		port(
			in1,in0: in std_logic_vector(3 downto 0);
			s0: in std_logic;
			d: out std_logic_vector(3 downto 0)
		);
	end component;

	signal b2: std_logic_vector(3 downto 0);
	
	signal nB: std_logic_vector(3 downto 0);
begin
	nB <= NOT B;
	mux1: Mux2x1_4bit port map(nB,B,SOMA_SUB,b2);
	
	somador1: somador4bits port map(A,b2,SOMA_SUB,S,COUT);

end comportamento;