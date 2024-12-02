--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity multiplicador8x4 is
	port(
		A: in std_logic_vector(7 downto 0);
		B: in std_logic_vector(3 downto 0);
		CIN: in std_logic;
		S: out std_logic_vector(11 downto 0);
		COUT: out std_logic
	);

end multiplicador8x4;


--arquitetura
architecture Hardware of multiplicador8x4 is
	component somador14bits is
		port(
			A,B: in std_logic_vector(13 downto 0);
			CIN: in std_logic;
			S: out std_logic_vector(13 downto 0);
			COUT: out std_logic
		);
	end component;
	
	
	
	signal soma1: std_logic_vector(13 downto 0);
	signal soma2: std_logic_vector(13 downto 0);
	signal soma3: std_logic_vector(13 downto 0);
	signal soma4: std_logic_vector(13 downto 0);
	
	signal res1,res2: std_logic_vector(13 downto 0);
	signal cout1,cout2: std_logic;
	signal s_out: std_logic_vector(13 downto 0);
begin
	soma1(13 downto 8) <= (others => '0');-- A x B(0)
		soma1(0) <= A(0) AND B(0);
		soma1(1) <= A(1) AND B(0);
		soma1(2) <= A(2) AND B(0);
		soma1(3) <= A(3) AND B(0);
		soma1(4) <= A(4) AND B(0);
		soma1(5) <= A(5) AND B(0);
		soma1(6) <= A(6) AND B(0);
		soma1(7) <= A(7) AND B(0);
	
	soma2(13 downto 9) <= (others => '0');-- A x B(1)
	soma2(0) <= '0';
			soma2(1) <= A(0) AND B(1);
			soma2(2) <= A(1) AND B(1);
			soma2(3) <= A(2) AND B(1);
			soma2(4) <= A(3) AND B(1);
			soma2(5) <= A(4) AND B(1);
			soma2(6) <= A(5) AND B(1);
			soma2(7) <= A(6) AND B(1);
			soma2(8) <= A(7) AND B(1);
	
	soma3(13 downto 10) <= (others => '0');-- A x B(2)
	soma3(1 downto 0) <= (others => '0');
			soma3(2) <= A(0) AND B(2);
			soma3(3) <= A(1) AND B(2);
			soma3(4) <= A(2) AND B(2);
			soma3(5) <= A(3) AND B(2);
			soma3(6) <= A(4) AND B(2);
			soma3(7) <= A(5) AND B(2);
			soma3(8) <= A(6) AND B(2);
			soma3(9) <= A(7) AND B(2);
	
	soma4(13 downto 11) <= (others => '0');-- A x B(3)
	soma4(2 downto 0) <= (others => '0');
			soma4(3) <= A(0) AND B(3);
			soma4(4) <= A(1) AND B(3);
			soma4(5) <= A(2) AND B(3);
			soma4(6) <= A(3) AND B(3);
			soma4(7) <= A(4) AND B(3);
			soma4(8) <= A(5) AND B(3);
			soma4(9) <= A(6) AND B(3);
			soma4(10) <= A(7) AND B(3);
		

	
	somador1: somador14bits port map(soma1,soma2, CIN,res1,cout1);
	somador2: somador14bits port map(res1,soma3,cout1,res2,cout2);
	somador3: somador14bits port map(res2,soma4,cout2, s_out, COUT);
	S <= s_out(11 downto 0);

	
end Hardware;