-- Definimos la librería y el paquete que vamos a utilizar
Library IEEE;
use IEEE.std_logic_1164.all;

-- Declaramos la entidad
entity MedSum is
    Port (
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC
    );
end MedSum;

architecture comportamental of MedSum is
begin
    S1 <= A and B; -- Suma
    S0 <= A xor B; -- Carry
end comportamental;