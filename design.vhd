library IEEE;
use IEEE.std_logic_1164.all;

entity cont is
    port (
        fc_fc: in std_logic;
        fc_ab: in std_logic;
        bot: in std_logic;
        mot_ab: out std_logic;
        mot_fc: out std_logic
    );
end entity cont;

architecture portao of cont is
    signal clk: std_logic;
    signal estado: std_logic_vector(1 downto 0) := "00";
begin
    clk <= not (fc_ab or fc_fc or bot);

    abc: process (clk)
    begin
        if falling_edge(clk) then
            case estado is
                when "00" =>
                    if bot = '1' then
                        estado <= "01";
                    end if;
                when "01" =>
                    if bot = '1' then
                        estado <= "10";
                    elsif fc_ab = '1' then
                        estado <= "10";
                    end if;
                when "10" =>
                    if bot = '1' then
                        estado <= "11";
                    end if;
                when "11" =>
                    if bot = '1' then
                        estado <= "00";
                    elsif fc_fc = '1' then
                        estado <= "00";
                    end if;
                when others =>
                    estado <= "00";
            end case;
        end if;
    end process abc;

    with estado select
        mot_ab <= '1' when "01",
                  '0' when others;

    with estado select
        mot_fc <= '1' when "11",
                  '0' when others;
end architecture portao;
