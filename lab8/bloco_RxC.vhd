--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity bloco_RxC is
	port(
		Y: in std_logic_vector (7 downto 0);
		C: in std_logic_vector(3 downto 0);
		ld_c: in std_logic;
		ld_r: in std_logic;
		clr_r: in std_logic;
		clk: in std_logic;
		Y_OUT: out std_logic_vector(7 downto 0);
		PRODUTO: out std_logic_vector(11 downto 0)
	);

end bloco_RxC;

--arquitetura
architecture estrutura of bloco_RxC is
	component Reg4_completo is
		port(
			D: in std_logic_vector(3 downto 0);
			ENABLE: in std_logic;
			CLK: in std_logic;
			CLEAR: in std_logic;
			Q: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component Reg8_completo is
		port(
			D: in std_logic_vector(7 downto 0);
			ENABLE: in std_logic;
			CLK: in std_logic;
			CLEAR: in std_logic;
			Q: out std_logic_vector(7 downto 0)
		);
	end component;
	
	component multiplicador8x4 is
		port(
			A: in std_logic_vector(7 downto 0);
			B: in std_logic_vector(3 downto 0);
			CIN: in std_logic;
			S: out std_logic_vector(11 downto 0);
			COUT: out std_logic
		);
	end component;
	
	signal y_reg: std_logic_vector(7 downto 0);
	signal c_reg: std_logic_vector(3 downto 0);
	signal cout: std_logic;
begin
	RegY: Reg8_completo port map(Y,ld_r,clk,clr_r,y_reg);
	RegC: Reg4_completo port map(C,ld_c,clk,'1',c_reg);
	
	Y_OUT <= y_reg;
	RxC: multiplicador8x4 port map(y_reg,c_reg,'0',PRODUTO,cout);
end estrutura;