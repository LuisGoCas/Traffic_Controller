library ieee;
use ieee.std_logic_1164.all;

entity controlador is
	port(
		manual	: in std_logic;
		apaga		: in std_logic;
		CLK		: in std_logic;
		nsrojo	: out std_logic;
		nsambar	: out std_logic;
		nsverde	: out std_logic;
		oerojo	: out std_logic;
		oeambar	: out std_logic;
		oeverde	: out std_logic
	);
end controlador;

architecture arch of controlador is
--3 rojos, 2 ambars, 3 verdes, 2 ambars, 1 apaga
type estado is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10);
signal sg: estado;
signal pr: estado := s0;

begin

secuencial: process(CLK)
begin
	if(rising_edge(clk)) then
		if(apaga = '1') then
			pr <= sg;
		else
			--En este estado todos
			--los semaforos estan
			--apagados ('0') apaga = 0
			--El oficial controla transito
			pr <= s10;
		end if;
	end if;
end process secuencial;

comb: process(pr, manual,apaga)
begin

case pr is
--manual permite quedarse en el mismo 
--estado si es cero

--prioridad para apaga = 1
--Verde una via(oe) Rojo la otra(ns) x 3
when s0 =>
	nsrojo  <= '1';
	nsambar <= '0';
	nsverde <= '0';
	oerojo  <= '0';
	oeambar <= '0';
	oeverde <= '1';
	if(manual = '1') then
		sg <= s1;
	else
		sg <= s0; --sigue manual 0
	end if;
--Verde una via(oe) Rojo la otra(ns) 2
when s1 =>
	nsrojo  <= '1';
	nsambar <= '0';
	nsverde <= '0';
	oerojo  <= '0';
	oeambar <= '0';
	oeverde <= '1';
	if(manual = '1') then
		sg <= s2;
	else
		sg <= s1; --sigue manual 0
	end if;
--Verde una via(oe) Rojo la otra(ns) 1
when s2 =>
	nsrojo  <= '1';
	nsambar <= '0';
	nsverde <= '0';
	oerojo  <= '0';
	oeambar <= '0';
	oeverde <= '1';
	if(manual = '1') then
		sg <= s3;
	else
		sg <= s2; --sigue manual 0
	end if;
	
--Ambar en una via(ns) Ambar en otra(oe) x 2
when s3 =>
	nsrojo  <= '0';
	nsambar <= '1';
	nsverde <= '0';
	oerojo  <= '0';
	oeambar <= '1';
	oeverde <= '0';
	if(manual = '1') then
		sg <= s4;
	else
		sg <= s4; --sigue manual 0
	end if;
--Ambar en una via(ns) Ambar en otra(oe) 1
when s4 =>
	nsrojo  <= '0';
	nsambar <= '1';
	nsverde <= '0';
	oerojo  <= '0';
	oeambar <= '1';
	oeverde <= '0';
	if(manual = '1') then
		sg <= s5;
	else
		sg <= s5; --sigue manual 0
	end if;

--Verde una via(ns) Rojo la otra(oe) x 3
when s5 =>
	nsrojo  <= '0';
	nsambar <= '0';
	nsverde <= '1';
	oerojo  <= '1';
	oeambar <= '0';
	oeverde <= '0';
	if(manual = '1') then
		sg <= s6;
	else
		sg <= s5; --sigue manual 0
	end if;
--Verde una via(ns) Rojo la otra(oe) x 2
when s6 =>
	nsrojo  <= '0';
	nsambar <= '0';
	nsverde <= '1';
	oerojo  <= '1';
	oeambar <= '0';
	oeverde <= '0';
	if(manual = '1') then
		sg <= s7;
	else
		sg <= s6; --sigue manual 0
	end if;
--Verde una via(ns) Rojo la otra(oe) x 1
when s7 =>
	nsrojo  <= '0';
	nsambar <= '0';
	nsverde <= '1';
	oerojo  <= '1';
	oeambar <= '0';
	oeverde <= '0';
	if(manual = '1') then
		sg <= s8;
	else
		sg <= s7; --sigue manual 0
	end if;

--Estos ambars tienen igual configuracion
--que los primeros estados Ambar.
--pero diferente transicion de estado	

--Ambar en una via(oe) Ambar en otra(ns) x 2
when s8 =>
	nsrojo  <= '0';
	nsambar <= '1';
	nsverde <= '0';
	oerojo  <= '0';
	oeambar <= '1';
	oeverde <= '0';
	if(manual = '1') then
		sg <= s9;
	else
		sg <= s9; --sigue manual 0
	end if;
--Ambar en una via(oe) Ambar en otra(ns) 1
when s9 =>
	nsrojo  <= '0';
	nsambar <= '1';
	nsverde <= '0';
	oerojo  <= '0';
	oeambar <= '1';
	oeverde <= '0';
	if(manual = '1') then
		sg <= s0;
	else
		sg <= s0; --sigue manual 0
	end if;
when s10 =>
	nsrojo  <= '0';
	nsambar <= '0';
	nsverde <= '0';
	oerojo  <= '0';
	oeambar <= '0';
	oeverde <= '0';
	--sg <= s0;
	if(apaga = '0') then
		sg <= s10;
	else
		sg <= s0;
	end if;
end case;
end process comb;
end arch;