Library IEEE;
use IEEE.std_logic_1164.all;

entity mux2_1 is 
    port (
        -- 2 entradas de 4 bits
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        m : in STD_LOGIC;
        -- 1 saída de 4 bits
        S : out STD_LOGIC_VECTOR(3 downto 0)
    );

    end mux2_1;
    -- Arquitetura comportamental
architecture comportamental of mux2_1 is
begin
    
    S(0) <= (((not (m)) and (A(0))) or ((m) and (B(0))));
    S(1) <= (((not (m)) and (A(1))) or ((m) and (B(1))));
    S(2) <= (((not (m)) and (A(2))) or ((m) and (B(2))));
    S(3) <= (((not (m)) and (A(3))) or ((m) and (B(3))));
    
end comportamental;    