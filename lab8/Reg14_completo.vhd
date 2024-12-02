--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity Reg14_completo is
	port(
		D: in std_logic_vector(13 downto 0);
		ENABLE: in std_logic;
		CLK: in std_logic;
		CLEAR: in std_logic;
		Q: out std_logic_vector(13 downto 0)
	);

end Reg14_completo;

--arquitetura
architecture Hardware of Reg14_completo is
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
	
	component Mux2x1 is
		port(
			in1,in0: in std_logic;
			s0: in std_logic;
			d: out std_logic
		);
	end component;

	signal d1,q1: std_logic_vector(13 downto 0);
begin
	muxEnablea: Mux2x1 port map(D(13),q1(13),ENABLE,d1(13));
	muxEnableb: Mux2x1 port map(D(12),q1(12),ENABLE,d1(12));
	
	muxEnable1: Mux2x1_4bit port map(D(11 downto 8),q1(11 downto 8),ENABLE,d1(11 downto 8));
	muxEnable2: Mux2x1_4bit port map(D(7 downto 4),q1(7 downto 4),ENABLE,d1(7 downto 4));
	muxEnable3: Mux2x1_4bit port map(D(3 downto 0),q1(3 downto 0),ENABLE,d1(3 downto 0));
	
	bit0: ffd port map(CLK, CLEAR, '1',d1(0),q1(0));
	bit1: ffd port map(CLK, CLEAR, '1',d1(1),q1(1));
	bit2: ffd port map(CLK, CLEAR, '1',d1(2),q1(2));
	bit3: ffd port map(CLK, CLEAR, '1',d1(3),q1(3));
	
	bit4: ffd port map(CLK, CLEAR, '1',d1(4),q1(4));
	bit5: ffd port map(CLK, CLEAR, '1',d1(5),q1(5));
	bit6: ffd port map(CLK, CLEAR, '1',d1(6),q1(6));
	bit7: ffd port map(CLK, CLEAR, '1',d1(7),q1(7));
	
	bit8: ffd port map(CLK, CLEAR, '1',d1(8),q1(8));
	bit9: ffd port map(CLK, CLEAR, '1',d1(9),q1(9));
	bit10: ffd port map(CLK, CLEAR, '1',d1(10),q1(10));
	bit11: ffd port map(CLK, CLEAR, '1',d1(11),q1(11));
	
	bit12: ffd port map(CLK, CLEAR, '1',d1(12),q1(12));
	bit13: ffd port map(CLK, CLEAR, '1',d1(13),q1(13));
	
	Q <= q1;
	
end Hardware;