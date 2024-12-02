--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity somador14bits is
	port(
		A,B: in std_logic_vector (13 downto 0);
		CIN: in std_logic;
		S: out std_logic_vector (13 downto 0);
		COUT: out std_logic
	);

end somador14bits;

--arquitetura
architecture estrutura of somador14bits is
	signal vai_um : std_logic_vector (0 to 12);
	
	component somadorCompleto is
		port(
			a,b: in std_logic;
			cin: in std_logic;
			s: out std_logic;
			cout: out std_logic
		);
	end component;
	
begin
	S0: somadorCompleto port map(A(0),B(0),CIN,S(0),vai_um(0));
	S1: somadorCompleto port map(A(1),B(1),vai_um(0),S(1),vai_um(1));
	S2: somadorCompleto port map(A(2),B(2),vai_um(1),S(2),vai_um(2));
	S3: somadorCompleto port map(A(3),B(3),vai_um(2),S(3),vai_um(3));
	
	S4: somadorCompleto port map(A(4),B(4),vai_um(3),S(4),vai_um(4));
	S5: somadorCompleto port map(A(5),B(5),vai_um(4),S(5),vai_um(5));
	S6: somadorCompleto port map(A(6),B(6),vai_um(5),S(6),vai_um(6));
	S7: somadorCompleto port map(A(7),B(7),vai_um(6),S(7),vai_um(7));
	
	s8: somadorCompleto port map(A(8),B(8),vai_um(7),S(8),vai_um(8));
	s9: somadorCompleto port map(A(9),B(9),vai_um(8),S(9),vai_um(9));
	s10: somadorCompleto port map(A(10),B(10),vai_um(9),S(10),vai_um(10));
	s11: somadorCompleto port map(A(11),B(11),vai_um(10),S(11),vai_um(11));
	
	s12: somadorCompleto port map(A(12),B(12),vai_um(11),S(12),vai_um(12));
	s13: somadorCompleto port map(A(13),B(13),vai_um(12),S(13),COUT);

end estrutura;