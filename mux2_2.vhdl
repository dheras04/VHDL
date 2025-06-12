Library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_2 is
end mux2_2;

architecture comportamental of mux2_2 is
    -- Cajas
    component mux2_1 is
        port (
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            m : in STD_LOGIC;
            S : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    -- cables
    signal c_A, c_B, c_S : STD_LOGIC_VECTOR(3 downto 0);
    signal c_m : STD_LOGIC;

    --Periodo de reloj
    constant clock_period : time := 10 ns;

begin
    -- Conectar los cables al componente (Mapear los puertos del componente)

    mi_mux : mux2_1
        port map (
            A => c_A,
            B => c_B,
            m => c_m,
            S => c_S
        );

    -- Proceso de estimulación de entradas
    stim_proc: process
    begin
        -- A=15, B=6, m=1 -> S=6
        c_A <= "1111";  
        c_B <= "0110";  
        c_m <= '1';     
        wait for clock_period;

        -- A=4, B=13, m=0 -> S=4
        c_A <= "0100";  
        c_B <= "1101";  
        c_m <= '0';     
        wait for clock_period;

        -- A=8, B=2, m=1 -> S=2
         c_A <= "1000";  
        c_B <= "0010";  
        c_m <= '1';     
        wait for clock_period;
        wait;
    end process;
    
end comportamental;