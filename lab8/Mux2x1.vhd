--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity Mux2x1 is
	port(
		in1,in0: in std_logic;
		s0: in std_logic;
		d: out std_logic
	);

end Mux2x1;

--arquitetura
architecture Hardware of Mux2x1 is
begin
	d <= (in1 AND s0) OR (in0 AND NOT s0);
	
end Hardware;