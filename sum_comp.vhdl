library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entidad
entity sum_comp is
    port(
        A, B, Cin : in std_logic;
        Cout, S : out std_logic
    );
    end sum_comp;
    
-- Arquitectura
architecture estructural of sum_comp is
    -- componentes
    component MedSum
        port(
            A : in STD_LOGIC;
           B : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC
        );
    end component;
    -- cables
    signal cS0_1, cS1_1, cS1_2 : STD_LOGIC;
begin
    -- Mapeo de puertos para cada componente
    ms_1 : MedSum
        port map(
            A => A,
            B => B,
            S0 => cS0_1,
            S1 => cS1_1
        );
     
    ms_2 : MedSum
        port map(
            A => cS0_1,
            B => Cin,
            S0 => S,
            S1 => cS1_2
        );    

    Cout <= cS1_1 xor cS1_2;
end estructural; 