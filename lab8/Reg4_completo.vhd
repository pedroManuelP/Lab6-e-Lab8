--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity Reg4_completo is
	port(
		D: in std_logic_vector(3 downto 0);
		ENABLE: in std_logic;
		CLK: in std_logic;
		CLEAR: in std_logic;
		Q: out std_logic_vector(3 downto 0)
	);

end Reg4_completo;

--arquitetura
architecture Hardware of Reg4_completo is
	component ffd is
		port (ck, clr, set, d : in  std_logic;
								  q : out std_logic);
	end component;
	
	component Mux2x1_4bit is
		port(
			in1,in0: in std_logic_vector(3 downto 0);
			s0: in std_logic;
			d: out std_logic_vector(3 downto 0)
		);
	end component;

	signal q1,d1: std_logic_vector(3 downto 0);
begin
	muxEnable: Mux2x1_4bit port map(D,q1,ENABLE,d1);
	
	bit0: ffd port map(CLK, CLEAR, '1',d1(0),q1(0));
	bit1: ffd port map(CLK, CLEAR, '1',d1(1),q1(1));
	bit2: ffd port map(CLK, CLEAR, '1',d1(2),q1(2));
	bit3: ffd port map(CLK, CLEAR, '1',d1(3),q1(3));
	
	Q <= q1;
end Hardware;