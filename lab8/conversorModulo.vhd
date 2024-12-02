--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity conversorModulo is
	port(
		a3, a2, a1, a0: in std_logic;
		s3, s2, s1, s0: out std_logic
	);

end conversorModulo;

--arquitetura
architecture Hardware of conversorModulo is
begin
	s3 <= a3 OR (a2 AND a0) OR (a2 AND a1);
	s2 <= (a3 AND a0) OR (a2 AND (NOT a1) AND (NOT a0));
	s1 <= (a1 AND a0) OR (a3 AND (NOT a0)) OR ((NOT a2) AND a1);
	s0 <= (a3 AND (NOT a0)) OR ((NOT a3) AND (NOT a2) AND a0) OR (a2 AND a1 AND (NOT a0));
end Hardware;