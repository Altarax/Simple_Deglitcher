----------------------------------------------------------------------------------
--!
--! \file Deglitcher.vhd
--!
--! \brief Main file to create a deglitcher component
--!
--! \version 1.0
--! \date 25/11/2021
--!
--! \author Dangremont Jayson, dangremontjayson.pro@gmail.com
--!
----------------------------------------------------------------------------------

--! Use standard library
library IEEE;

--! Use logic elements library
use IEEE.STD_LOGIC_1164.ALL;

--! \brief Entity of the deglitcher.
--! \details Why do we need a deglitcher ?
--! This deglitcher is important to not mistunderstand
--! the input signals. More specifically, the disjunction
--! signals can receive some noises and we need to avoid
--! reactions based on thses inteferences. We deglitch
--! the disjunction LV and HV inputs before sending
--! to the H_Bridge inputs.
entity Deglitcher is
    generic (
        O_active    : boolean := False
    );
    port ( 
        input       : in std_logic;     --! Input we want to deglitch
        clk         : in std_logic;
        reset       : in std_logic;
        
        output      : out std_logic;    --! Basically input deglitched
        n_output    : out std_logic     --! Basically input deglitched but inverted
    );
end Deglitcher;

architecture Behavioral of Deglitcher is

    --! \defgroup Deglitching_signals
    --! \{
    signal input_deglitch_1_s   : std_logic := '0';
    signal input_deglitch_2_s   : std_logic := '0';
    signal input_deglitch_3_s   : std_logic := '0';
    signal input_deglitch_4_s   : std_logic := '0';
    signal input_deglitch_5_s   : std_logic := '0';
    signal input_deglitch_6_s   : std_logic := '0';
    signal input_deglitch_7_s   : std_logic := '0';
    signal input_deglitch_8_s   : std_logic := '0';
    signal input_deglitch_9_s   : std_logic := '0';
    signal input_deglitch_10_s  : std_logic := '0';
    signal output_s             : std_logic := '0';
        
    signal n_output_s           : std_logic := '1';
    signal n_input_deglitch_1_s : std_logic := '1';
    signal n_input_deglitch_2_s : std_logic := '1';
    signal n_input_deglitch_3_s : std_logic := '1';
    signal n_input_deglitch_4_s : std_logic := '1';
    signal n_input_deglitch_5_s : std_logic := '1';
    signal n_input_deglitch_6_s : std_logic := '1';
    signal n_input_deglitch_7_s : std_logic := '1';
    signal n_input_deglitch_8_s : std_logic := '1';
    signal n_input_deglitch_9_s : std_logic := '1';
    signal n_input_deglitch_10_s: std_logic := '1';
    --! \}

begin

    not_O_active: process(clk, reset)
        begin
        
            if not O_active then
                if reset = '0' then
                    output_s <= '0';
                    input_deglitch_1_s <= '0';
                    input_deglitch_2_s <= '0';
                    input_deglitch_3_s <= '0';
                    input_deglitch_4_s <= '0';
                    input_deglitch_5_s <= '0';
                    input_deglitch_6_s <= '0';
                    input_deglitch_7_s <= '0';
                    input_deglitch_8_s <= '0';
                    input_deglitch_9_s <= '0';
                    input_deglitch_10_s <= '0';
                elsif rising_edge(clk) then
                    input_deglitch_1_s <= input;
                    input_deglitch_2_s <= input_deglitch_1_s;
                    input_deglitch_3_s <= input_deglitch_2_s;
                        input_deglitch_4_s <= input_deglitch_3_s;
                        input_deglitch_5_s <= input_deglitch_4_s;
                        input_deglitch_6_s <= input_deglitch_5_s;
                        input_deglitch_7_s <= input_deglitch_6_s;
                        input_deglitch_8_s <= input_deglitch_7_s;
                        input_deglitch_9_s <= input_deglitch_8_s;
                        input_deglitch_10_s <= input_deglitch_9_s;
                        output_s <= 
                                 (  input_deglitch_1_s and input_deglitch_2_s and
                                    input_deglitch_3_s and input_deglitch_4_s and
                                    input_deglitch_5_s and input_deglitch_6_s and
                                    input_deglitch_6_s and input_deglitch_7_s and
                                    input_deglitch_8_s and input_deglitch_9_s and
                                    input_deglitch_10_s );
                 else
                        input_deglitch_1_s <= input_deglitch_1_s;
                        input_deglitch_2_s <= input_deglitch_2_s;
                        input_deglitch_3_s <= input_deglitch_3_s;
                        input_deglitch_4_s <= input_deglitch_4_s;
                        input_deglitch_5_s <= input_deglitch_5_s;
                        input_deglitch_6_s <= input_deglitch_6_s;
                        input_deglitch_7_s <= input_deglitch_7_s;
                        input_deglitch_8_s <= input_deglitch_8_s;
                        input_deglitch_9_s <= input_deglitch_9_s;
                        input_deglitch_10_s <= input_deglitch_10_s;
                        output_s <= output_s;
                        
                end if;            
            end if;
            
        end process;
    
    n_output <= n_output_s;
    output <= output_s;
    not_not_O_active: process(clk, reset)
        begin
        
            if O_active then
                if reset = '0' then
                    n_output_s <= '1';
                    n_input_deglitch_1_s <= '1';
                    n_input_deglitch_2_s <= '1';
                    n_input_deglitch_3_s <= '1';
                    n_input_deglitch_4_s <= '1';
                    n_input_deglitch_5_s <= '1';
                    n_input_deglitch_6_s <= '1';
                    n_input_deglitch_7_s <= '1';
                    n_input_deglitch_8_s <= '1';
                    n_input_deglitch_9_s <= '1';
                    n_input_deglitch_10_s <= '1';
                elsif rising_edge(clk) then
                    n_input_deglitch_1_s <= input;
                    n_input_deglitch_2_s <= n_input_deglitch_1_s;
                    n_input_deglitch_3_s <= n_input_deglitch_2_s;
                    n_input_deglitch_4_s <= n_input_deglitch_3_s;
                    n_input_deglitch_5_s <= n_input_deglitch_4_s;
                    n_input_deglitch_6_s <= n_input_deglitch_5_s;
                    n_input_deglitch_7_s <= n_input_deglitch_6_s;
                    n_input_deglitch_8_s <= n_input_deglitch_7_s;
                    n_input_deglitch_9_s <= n_input_deglitch_8_s;
                    n_input_deglitch_10_s <= n_input_deglitch_9_s;
                    n_output_s <= 
                             (  n_input_deglitch_1_s or n_input_deglitch_2_s or
                                n_input_deglitch_3_s or n_input_deglitch_4_s or
                                n_input_deglitch_5_s or n_input_deglitch_6_s or
                                n_input_deglitch_6_s or n_input_deglitch_7_s or
                                n_input_deglitch_8_s or n_input_deglitch_9_s or
                                n_input_deglitch_10_s );
                else
                    n_input_deglitch_1_s <= n_input_deglitch_1_s;
                    n_input_deglitch_2_s <= n_input_deglitch_2_s;
                    n_input_deglitch_3_s <= n_input_deglitch_3_s;
                    n_input_deglitch_4_s <= n_input_deglitch_4_s;
                    n_input_deglitch_5_s <= n_input_deglitch_5_s;
                    n_input_deglitch_6_s <= n_input_deglitch_6_s;
                    n_input_deglitch_7_s <= n_input_deglitch_7_s;
                    n_input_deglitch_8_s <= n_input_deglitch_8_s;
                    n_input_deglitch_9_s <= n_input_deglitch_9_s;
                    n_input_deglitch_10_s <= n_input_deglitch_10_s; 
                    n_output_s <= n_output_s;
                        
                end if;            
            end if;
            
        end process;          

end Behavioral;
