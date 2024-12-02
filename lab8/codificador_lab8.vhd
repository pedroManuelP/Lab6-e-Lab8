library ieee;
use ieee.std_logic_1164.all;

entity codificador_lab8 is
   port (
		s_cod: in std_logic_vector(1 downto 0);
		en_cod: in std_logic;
		s0,s1,s2,s3: out std_logic
	);
end codificador_lab8;

architecture logica of codificador_lab8 is
begin
	s0 <= en_cod AND (NOT s_cod(1) AND NOT s_cod(0));
	s1 <= en_cod AND (NOT s_cod(1) AND s_cod(0));
	s2 <= en_cod AND (s_cod(1) AND NOT s_cod(0));
	s3 <= en_cod AND (s_cod(1) AND s_cod(0));
end logica;