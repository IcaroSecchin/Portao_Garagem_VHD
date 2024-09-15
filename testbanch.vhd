library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_cont is
end entity tb_cont;

architecture testbench of tb_cont is
    signal fc_fc_tb, fc_ab_tb, bot_tb: std_logic;
    signal mot_ab_tb, mot_fc_tb: std_logic;
    
    component cont
        port(
            fc_fc: in std_logic;
            fc_ab: in std_logic;
            bot: in std_logic;
            mot_ab: out std_logic;
            mot_fc: out std_logic
        );
    end component cont;
    
begin
    uut: cont
        port map(
            fc_fc => fc_fc_tb,
            fc_ab => fc_ab_tb,
            bot => bot_tb,
            mot_ab => mot_ab_tb,
            mot_fc => mot_fc_tb
        );
        
    process
    begin
        fc_fc_tb <= '0';
        fc_ab_tb <= '0';
        bot_tb <= '0';
        
        wait for 5 ns;
        bot_tb <= '1';
        wait for 5 ns;
        bot_tb <= '0';
        wait for 10 ns;
        fc_ab_tb <= '1';
        wait for 5 ns;
        fc_ab_tb <= '0';
        
        wait for 5 ns;
        bot_tb <= '1';
        wait for 5 ns;
        bot_tb <= '0';
        wait for 5 ns;
        fc_fc_tb <= '1';
        wait for 5 ns;
        fc_fc_tb <= '0';
        
        wait for 5 ns;
        bot_tb <= '1';
        wait for 5 ns;
        bot_tb <= '0';
        wait for 10 ns;
        
        wait for 5 ns;
        bot_tb <= '1';
        wait for 5 ns;
        bot_tb <= '0';
        wait for 10 ns;
        
        wait for 5 ns;
        bot_tb <= '1';
        wait for 5 ns;
        bot_tb <= '0';
        wait for 10 ns;
        
        wait for 5 ns;
        bot_tb <= '1';
        wait for 5 ns;
        bot_tb <= '0';
        wait for 10 ns;
        
        wait;
    end process;
    
end architecture testbench;