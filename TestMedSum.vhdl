Library IEEE;
use IEEE.std_logic_1164.all;

entity TestMedSum is
end TestMedSum;

architecture comportamental of TestMedSum is
    --Declaración del componente a simular. Este componente esta definido
    --por la entidad MedSum en el archivo MedSum.vhdl
    component MedSum is
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            S0 : out STD_LOGIC;
            S1 : out STD_LOGIC
        );
    end component;

    --Declaración de las señales de entrada y salida que se utilizarán para conectar el componente
    signal cable_A, cable_B, cable_S0, cable_S1 : STD_LOGIC;

    --Periodo de reloj
    constant clock_period: time := 10 ns;

begin
    --Conecto componentes y cables
    MMS : MedSum
        port map (
            A => cable_A,
            B => cable_B,
            S0 => cable_S0,
            S1 => cable_S1
        );  
        --Proceso de estimulación de entradas
    stim_proc: process
    begin
        --Inicializo las entradas
        cable_A <= '0';
        cable_B <= '0';
        wait for clock_period;

        --Cambio el valor de las entradas
        cable_A <= '0';
        cable_B <= '1';
        wait for clock_period;

        cable_A <= '1';
        cable_B <= '0';
        wait for clock_period;

        cable_A <= '1';
        cable_B <= '1';
        wait for clock_period;

        --Finalizo la simulación
        wait;
    end process;

end comportamental;