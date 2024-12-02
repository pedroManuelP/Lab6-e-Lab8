--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity BINBCD_14bits is
	port(
		SW: in std_logic_vector(13 downto 0);
		BCD: out std_logic_vector(15 downto 0)
	);
end BINBCD_14bits;

--arquitetura
architecture Hardware of BINBCD_14bits is
	component conversorModulo is
		port(
			a3, a2, a1, a0: in std_logic;
			s3, s2, s1, s0: out std_logic
		);
	end component;

	signal s_c1: std_logic_vector(3 downto 0);
	signal s_c2: std_logic_vector(3 downto 0);
	signal s_c3: std_logic_vector(3 downto 0);
	
	signal s_c4: std_logic_vector(3 downto 0);
	signal s_c5: std_logic_vector(3 downto 0);
	signal s_c6: std_logic_vector(3 downto 0);
	
	signal s_c7: std_logic_vector(3 downto 0);
	signal s_c8: std_logic_vector(3 downto 0);
	signal s_c9: std_logic_vector(3 downto 0);
	
	signal s_c10: std_logic_vector(3 downto 0);
	signal s_c11: std_logic_vector(3 downto 0);
	------------------------------------------------
	signal s_c13: std_logic_vector(3 downto 0);
	signal s_c14: std_logic_vector(3 downto 0);
	signal s_c15: std_logic_vector(3 downto 0);
	signal s_c16: std_logic_vector(3 downto 0);
	
	signal s_c17: std_logic_vector(3 downto 0);
	signal s_c18: std_logic_vector(3 downto 0);
	signal s_c19: std_logic_vector(3 downto 0);
	------------------------------------------------
	signal s_c21: std_logic_vector(2 downto 0);
	signal s_c22: std_logic_vector(2 downto 0);
	signal s_c23: std_logic_vector(2 downto 0);
begin
	conversor1: conversorModulo port map('0','0',SW(13),SW(12), s_c1(3), s_c1(2), s_c1(1), s_c1(0));
	conversor2: conversorModulo port map(s_c1(2), s_c1(1), s_c1(0), SW(11), s_c2(3),s_c2(2),s_c2(1),s_c2(0));
	conversor3: conversorModulo port map(s_c2(2), s_c2(1), s_c2(0), SW(10), s_c3(3), s_c3(2), s_c3(1), s_c3(0));
	
	conversor4: conversorModulo port map(s_c3(2), s_c3(1), s_c3(0), SW(9), s_c4(3), s_c4(2), s_c4(1), s_c4(0));
	conversor5: conversorModulo port map(s_c4(2), s_c4(1), s_c4(0), SW(8), s_c5(3),s_c5(2),s_c5(1),s_c5(0));
	conversor6: conversorModulo port map(s_c5(2), s_c5(1), s_c5(0), SW(7), s_c6(3),s_c6(2),s_c6(1),s_c6(0));
	
	conversor7: conversorModulo port map(s_c6(2),s_c6(1),s_c6(0),SW(6), s_c7(3), s_c7(2), s_c7(1), s_c7(0));
	conversor8: conversorModulo port map(s_c7(2), s_c7(1), s_c7(0), SW(5), s_c8(3),s_c8(2),s_c8(1),s_c8(0));
	conversor9: conversorModulo port map(s_c8(2), s_c8(1), s_c8(0), SW(4), s_c9(3), s_c9(2), s_c9(1), s_c9(0));
	
	conversor10: conversorModulo port map(s_c9(2), s_c9(1), s_c9(0), SW(3), s_c10(3), s_c10(2), s_c10(1), s_c10(0));
	conversor11: conversorModulo port map(s_c10(2), s_c10(1), s_c10(0), SW(2), s_c11(3),s_c11(2),s_c11(1),s_c11(0));
	conversor12: conversorModulo port map(s_c11(2), s_c11(1), s_c11(0), SW(1), BCD(4),BCD(3),BCD(2),BCD(1));
	BCD(0) <= SW(0);
	
	------------------------------------------------------------------------------------------------------------------
	conversor13: conversorModulo port map(s_c1(3),s_c2(3),s_c3(3),s_c4(3),s_c13(3),s_c13(2),s_c13(1),s_c13(0));
	conversor14: conversorModulo port map(s_c13(2),s_c13(1),s_c13(0),s_c5(3),s_c14(3),s_c14(2),s_c14(1),s_c14(0));
	conversor15: conversorModulo port map(s_c14(2),s_c14(1),s_c14(0),s_c6(3),s_c15(3),s_c15(2),s_c15(1),s_c15(0));
	conversor16: conversorModulo port map(s_c15(2),s_c15(1),s_c15(0),s_c7(3),s_c16(3),s_c16(2),s_c16(1),s_c16(0));
	
	conversor17: conversorModulo port map(s_c16(2),s_c16(1),s_c16(0),s_c8(3),s_c17(3),s_c17(2),s_c17(1),s_c17(0));
	conversor18: conversorModulo port map(s_c17(2),s_c17(1),s_c17(0),s_c9(3),s_c18(3),s_c18(2),s_c18(1),s_c18(0));
	conversor19: conversorModulo port map(s_c18(2),s_c18(1),s_c18(0),s_c10(3),s_c19(3),s_c19(2),s_c19(1),s_c19(0));
	conversor20: conversorModulo port map(s_c19(2),s_c19(1),s_c19(0),s_c11(3),BCD(8),BCD(7),BCD(6),BCD(5));
	-------------------------------------------------------------------------------------------------------------------
	
	conversor21: conversorModulo port map(s_c13(3),s_c14(3),s_c15(3),s_c16(3),BCD(15),s_c21(2),s_c21(1),s_c21(0));
	conversor22: conversorModulo port map(s_c21(2),s_c21(1),s_c21(0),s_c17(3),BCD(14),s_c22(2),s_c22(1),s_c22(0));
	conversor23: conversorModulo port map(s_c22(2),s_c22(1),s_c22(0),s_c18(3),BCD(13),s_c23(2),s_c23(1),s_c23(0));
	conversor24: conversorModulo port map(s_c23(2),s_c23(1),s_c23(0),s_c19(3),BCD(12),BCD(11),BCD(10),BCD(9));
	
	
	
end Hardware;