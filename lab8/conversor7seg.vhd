--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity conversor7seg is
	port(
		A: in std_logic_vector(3 downto 0);
		LED_7seg: out std_logic_vector(6 downto 0)
	);
end conversor7seg;

--arquitetura
architecture Hardware of conversor7seg is
begin
	LED_7seg(0) <= A(1) OR A(3) OR (A(2) XNOR A(0));--C + A + BD + B'D'
	LED_7seg(1) <= (NOT A(2)) OR (A(1) XNOR A(0));--B' + C D + C' D' 
	LED_7seg(2) <= (NOT A(1)) OR A(0) OR A(2);--c' + D + B
	LED_7seg(3) <= A(3) OR ( A(1) AND (NOT A(0) OR NOT A(2) )) OR (NOT A(2) AND NOT A(0)) OR (A(2) AND NOT A(1) AND A(0));--A + C(D' + B') + B'D' + BC'D
	LED_7seg(4) <= NOT A(0) AND (A(1) OR NOT A(2));-- CD' + B'D'
	LED_7seg(5) <= A(3) OR (NOT A(1) AND NOT A(0)) OR ( A(2) AND (NOT A(1) OR NOT A(0)) );-- A + C'D' + BC' + BD'
	LED_7seg(6) <= A(3) OR (A(1) AND NOT A(0)) OR (A(2) XOR A(1));-- A + CD' + BC' + B'C
end Hardware;