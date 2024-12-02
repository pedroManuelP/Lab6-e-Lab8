--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity somador4bits is
	port(
		A,B: in std_logic_vector(3 downto 0);
		CIN: in std_logic;
		S: out std_logic_vector(3 downto 0);
		COUT: out std_logic
	);

end somador4bits;

--arquitetura
architecture comportamento of somador4bits is
	
	--somador completo
	component somadorCompleto is
		port(
			a,b: in std_logic;
			cin: in std_logic;
			s: out std_logic;
			cout: out std_logic
		);

	end component;
	
	signal cout4: std_logic;
	signal cout3: std_logic;
	signal cout2: std_logic;
begin
	ENTRADA4: somadorCompleto port map(A(0),B(0),CIN,S(0),cout4);
	ENTRADA3: somadorCompleto port map(A(1),B(1),cout4,S(1),cout3);
	ENTRADA2: somadorCompleto port map(A(2),B(2),cout3,S(2),cout2);
	ENTRADA1: somadorCompleto port map(A(3),B(3),cout2,S(3),COUT);

end comportamento;