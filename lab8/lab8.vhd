--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity lab8 is
	port(
		Y: in std_logic_vector(7 downto 0);
		C: in std_logic_vector(3 downto 0);
		clk: in std_logic;
		ld_r: in std_logic;
		clr_r: in std_logic;
		ld_out: in std_logic;
		s_cod: in std_logic_vector(1 downto 0);
		en_cod: in std_logic;
		F_UNIDADE: out std_logic_vector(6 downto 0);
		F_DEZENA: out std_logic_vector(6 downto 0);
		F_CENTENA: out std_logic_vector(6 downto 0);
		F_UNIDADE_MILHAR: out std_logic_vector(6 downto 0)
	);

end lab8;

--arquitetura
architecture Hardware of lab8 is
	component Reg14_completo is
		port(
			D: in std_logic_vector(13 downto 0);
			ENABLE: in std_logic;
			CLK: in std_logic;
			CLEAR: in std_logic;
			Q: out std_logic_vector(13 downto 0)
		);
	end component;
	
	component bloco_RxC is
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
	end component;
	
	component somador14bits is
		port(
			A,B: in std_logic_vector (13 downto 0);
			CIN: in std_logic;
			S: out std_logic_vector (13 downto 0);
			COUT: out std_logic
		);
   end component;
	
	component codificador_lab8 is
		port (
			s_cod: in std_logic_vector(1 downto 0);
			en_cod: in std_logic;
			s0,s1,s2,s3: out std_logic
		);
	end component;
	
	component BINBCD_14bits is
		port(
			SW: in std_logic_vector(13 downto 0);
			BCD: out std_logic_vector(15 downto 0)
		);
	end component;
	
	component conversor7seg is
		port(
			A: in std_logic_vector(3 downto 0);
			LED_7seg: out std_logic_vector(6 downto 0)
		);
	end component;
	
	signal s0,s1,s2,s3: std_logic;
	
	signal y_menos1,y_menos2,y_menos3: std_logic_vector(7 downto 0);
	signal prod0,prod1,prod2: std_logic_vector(11 downto 0);
	signal prod_0,prod_1,prod_2: std_logic_vector(13 downto 0);
	
	signal resultado0, resultado1: std_logic_vector(13 downto 0);
	signal cout0, cout1: std_logic;
	signal F_BIN: std_logic_vector(13 downto 0);
	signal F_BCD: std_logic_vector(15 downto 0);
begin
	bloco1: bloco_RxC port map(Y, C, s0, ld_r, clr_r, clk, y_menos1, prod0);
	bloco2: bloco_RxC port map(y_menos1, C, s1, ld_r, clr_r, clk, y_menos2, prod1);
	bloco3: bloco_RxC port map(y_menos2, C, s2, ld_r, clr_r, clk, y_menos3, prod2);
	
	
	prod_0(13 downto 12) <= (others => '0');
	prod_1(13 downto 12) <= (others => '0');
	prod_2(13 downto 12) <= (others => '0');
	
	prod_0(11 downto 0) <= prod0;
	prod_1(11 downto 0) <= prod1;
	prod_2(11 downto 0) <= prod2;
	somador1: somador14bits port map(prod_0,prod_1,'0', resultado0,cout0);
	somador2: somador14bits port map(resultado0, prod_2, cout0, resultado1, cout1);
	
	RegOut: Reg14_completo port map(resultado1, ld_out, clk, '1', F_BIN);
	
	Codificador: codificador_lab8 port map(s_cod, en_cod, s0,s1,s2,s3);

	BINBCD: BINBCD_14bits port map(F_BIN,F_BCD);
	
	Decod7seg1: conversor7seg port map(F_BCD(3 downto 0), F_UNIDADE);
	Decod7seg2: conversor7seg port map(F_BCD(7 downto 4), F_DEZENA);
	Decod7seg3: conversor7seg port map(F_BCD(11 downto 8), F_CENTENA);
	Decod7seg4: conversor7seg port map(F_BCD(15 downto 12), F_UNIDADE_MILHAR);
end Hardware;



