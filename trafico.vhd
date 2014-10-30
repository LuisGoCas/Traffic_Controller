library ieee;
use ieee.std_logic_1164.all;

entity trafico is
	port(
		rst,clk	: in std_logic;
		--clk	: in std_logic;
		manual	: in std_logic;
		apaga		: in std_logic;
		nsrojo	: out std_logic;
		nsambar	: out std_logic;
		nsverde	: out std_logic;
		oerojo	: out std_logic;
		oeambar	: out std_logic;
		oeverde	: out std_logic
	);
end trafico;

architecture structural of trafico is
--Declaracion de componentes
component controlador is
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
end component;

component divisor is
	port(
		reset 	: in std_logic;
		CLKin 	: in std_logic;
		CLKOut	: out std_logic
	);
end component;
--señales intermedias
signal clk_out : std_logic;
begin
u1	: divisor port map(rst,clk, clk_out);
u2	:	controlador port map(manual,apaga,clk_out,nsrojo,nsambar,nsverde,oerojo,oeambar,oeverde);
--u2	:	controlador port map(manual,apaga,clk,nsrojo,nsambar,nsverde,oerojo,oeambar,oeverde);
end structural;