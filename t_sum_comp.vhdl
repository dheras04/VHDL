library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entidad
entity t_sum_comp is
end t_sum_comp;

-- Arquitectura
architecture comportamental of t_sum_comp is
    component sum_comp is
        port(
            A, B, Cin : in std_logic;
            Cout, S : out std_logic
        );
    end component;

    -- Señales de entrada y salida
        signal cable_A, cable_B, cable_Cin, cable_Cout, cable_S : std_logic;

    -- Periodo de reloj
    constant clock_period: time := 10 ns;
    
begin
    -- Conecto componentes y cables
    SC : sum_comp
        port map (
            A => cable_A,
            B => cable_B,
            Cin => cable_Cin,
            Cout => cable_Cout,
            S => cable_S
        );

    -- Proceso de estimulación de entradas
    stim_proc: process
    begin
        -- Inicializo las entradas
        cable_A <= '0';
        cable_B <= '0';
        cable_Cin <= '0';
        wait for clock_period;

        cable_A <= '0';
        cable_B <= '0';
        cable_Cin <= '1';
        wait for clock_period;

        cable_A <= '0';
        cable_B <= '1';
        cable_Cin <= '0';
        wait for clock_period;

        cable_A <= '0';
        cable_B <= '1';
        cable_Cin <= '1';
        wait for clock_period;

        cable_A <= '1';
        cable_B <= '0';
        cable_Cin <= '0';
        wait for clock_period;

        cable_A <= '1';
        cable_B <= '0';
        cable_Cin <= '1';
        wait for clock_period;

        cable_A <= '1';
        cable_B <= '1';
        cable_Cin <= '0';
        wait for clock_period;

        cable_A <= '1';
        cable_B <= '1';
        cable_Cin <= '1';
        wait for clock_period;
        wait;
    end process;

end comportamental;  