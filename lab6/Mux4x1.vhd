--biblioteca
library ieee;
use ieee.std_logic_1164.all;

--entidade
entity Mux4x1 is
	port(
		in3,in2,in1,in0: in std_logic;
		s1,s0: in std_logic;
		d: out std_logic
	);

end Mux4x1;

--arquitetura
architecture Hardware of Mux4x1 is
begin
	d <= (s1 AND s0 AND in3) OR 
		  (s1 AND NOT s0 AND in2) OR
		  (NOT s1 AND s0 AND in1) OR
		  (NOT s1 AND NOT s0 AND in0);
		  --saída é in3 para s1s0 = 3
		  --saída é in2 para s1s0 = 2
		  --saída é in1 para s1s0 = 1
		  --saída é in0 para s1s0 = 0
	
end Hardware;