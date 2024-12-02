
library ieee;
use ieee.std_logic_1164.all;

-- entidade
entity lab6 is
	port(
		SW: in std_logic_vector(3 downto 0);
		KEY: in std_logic;
		CLK: in std_logic;
		LEDR, LEDG: out std_logic_vector(7 downto 0) -- R para linhas e G para colunas
	);
end lab6;

-- arquitetura
architecture Hardware of lab6 is
	component Reg4 is
		port(
			D: in std_logic_vector(3 downto 0);
			CLK: in std_logic;
			Q: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component somadorSubtrator is
		port(
			A, B: in std_logic_vector(3 downto 0);
			SOMA_SUB: in std_logic;
			S: out std_logic_vector(3 downto 0);
			COUT: out std_logic
		);
	end component;
	
	component Mux4x1_4bit is
		port(
			in3, in2, in1, in0: in std_logic_vector(3 downto 0);
			s1, s0: in std_logic;
			d: out std_logic_vector(3 downto 0)
		);
	end component;

	signal dlin, dcol: std_logic_vector(3 downto 0); -- entrada dos registradores
	signal qlin, qcol: std_logic_vector(3 downto 0); -- saída dos registradores
	signal nada1, nada2: std_logic;
	
	signal sLin, sCol: std_logic_vector(3 downto 0); -- saída dos somadores
	constant valorPadrao: std_logic_vector(3 downto 0) := "0000";
	signal s1L, s0L: std_logic;
	signal s1C, s0C: std_logic;

	-- Sinais auxiliares para entradas do somadorSubtrator
	signal B_lin, B_col: std_logic_vector(3 downto 0);
	signal SOMA_SUB_lin, SOMA_SUB_col: std_logic;
	
begin
	-- Definindo valores para os sinais auxiliares
	B_lin <= "000" & (SW(2) XOR SW(1));
	SOMA_SUB_lin <= SW(2) AND NOT SW(1);

	B_col <= "000" & (SW(3) XOR SW(0));
	SOMA_SUB_col <= SW(3) AND NOT SW(0);

	-- Instâncias dos componentes
	regLinha: Reg4 port map(dlin, CLK, qlin);
	regColuna: Reg4 port map(dcol, CLK, qcol);

	-- Bloco somador/subtrator que faz A+B quando SOMA_SUB = 0 e faz A - B quando SOMA_SUB = 1
	somsubLin: somadorSubtrator port map(qlin, B_lin, SOMA_SUB_lin, sLin, nada1);
	somsubCol: somadorSubtrator port map(qcol, B_col, SOMA_SUB_col, sCol, nada2);

	-- Multiplexador para escolher o valor a ser guardado no registrador seguindo uma lógica própria
	muxLin: Mux4x1_4bit port map("0000", "0111", sLin, valorPadrao, s1L, s0L, dlin);
	muxCol: Mux4x1_4bit port map("0000", "0111", sCol, valorPadrao, s1C, s0C, dcol);

	-- Lógica do multiplexador 4x1 que manda para a entrada do registrador de linha
	s1L <= KEY AND sLin(3);
	s0L <= KEY AND (NOT sLin(3) OR NOT sLin(2)); -- AB' + AC'

	-- Lógica do multiplexador 4x1 que manda para a entrada do registrador de coluna
	s1C <= KEY AND sCol(3);
	s0C <= KEY AND (NOT sCol(3) OR NOT sCol(2)); -- AB' + AC'

	-- Lógica para os LEDs coloridos
	LEDR(7) <= qlin(2) AND qlin(1) AND qlin(0); -- 111
	LEDG(7) <= qcol(2) AND qcol(1) AND qcol(0);
	
	LEDR(6) <= qlin(2) AND qlin(1) AND NOT qlin(0); -- 110
	LEDG(6) <= qcol(2) AND qcol(1) AND NOT qcol(0);
	
	LEDR(5) <= qlin(2) AND NOT qlin(1) AND qlin(0); -- 101
	LEDG(5) <= qcol(2) AND NOT qcol(1) AND qcol(0);
	
	LEDR(4) <= qlin(2) AND NOT qlin(1) AND NOT qlin(0); -- 100
	LEDG(4) <= qcol(2) AND NOT qcol(1) AND NOT qcol(0);
	
	LEDR(3) <= NOT qlin(2) AND qlin(1) AND qlin(0); -- 011
	LEDG(3) <= NOT qcol(2) AND qcol(1) AND qcol(0);
	
	LEDR(2) <= NOT qlin(2) AND qlin(1) AND NOT qlin(0); -- 010
	LEDG(2) <= NOT qcol(2) AND qcol(1) AND NOT qcol(0);
	
	LEDR(1) <= NOT qlin(2) AND NOT qlin(1) AND qlin(0); -- 001
	LEDG(1) <= NOT qcol(2) AND NOT qcol(1) AND qcol(0);
	
	LEDR(0) <= NOT qlin(2) AND NOT qlin(1) AND NOT qlin(0); -- 000
	LEDG(0) <= NOT qcol(2) AND NOT qcol(1) AND NOT qcol(0);
end Hardware;


