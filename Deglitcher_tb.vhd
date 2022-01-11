----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2021 11:01:50
-- Design Name: 
-- Module Name: Deglitcher_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Deglitcher_tb is
--  Port ( );
end Deglitcher_tb;

architecture Behavioral of Deglitcher_tb is
    component Deglitcher
        generic (
            O_active    : boolean := False
        );
        port ( 
            input       : in std_logic; --! Input we want to deglitchs
            clk         : in std_logic;
            reset       : in std_logic;
            
            output      : out std_logic;--! Basically input deglitched
            n_output    : out std_logic
        );
    end component;
    
    signal input    : std_logic;
    signal clk      : std_logic;
    signal reset    : std_logic;
    signal output   : std_logic;
    signal n_output : std_logic;

begin
    UUT: Deglitcher 
    generic map(O_active => true)
    port map(input => input, clk => clk, reset => reset, output => output, n_output => n_output);
    
    reset_gen: process
        begin
            reset <= '0'; wait for 10us;
            reset <= '1'; wait for 10000ms;
        end process;
    
    gen_O_not_active_without_bug: process
        begin
            input <= '1'; wait for 10100ns;
            input <= '0'; wait for 100ns;
            input <= '1'; wait for 300ns;
            input <= '0'; wait for 800ns;
            input <= '1'; wait for 9000ns;
            input <= '0'; wait for 15us;
            input <= '1'; wait for 100ns;
            input <= '0'; wait for 100ns;
            input <= '1'; wait for 100ns;
            input <= '0'; wait for 100ns;
            input <= '0'; wait for 15us;
        end process;
    
    --! 10 Mhz clock
    clk_gen: process
        begin
            clk <= '0'; wait for 50ns;
            clk <= '1'; wait for 50ns;
        end process;

end Behavioral;
