library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity un_controle is
  port (
    clk : in std_logic;
    rst : in std_logic;
    endereco_rom : out unsigned(15 downto 0);  -- Saída do PC para a entrada de endereços da ROM
    dado_rom : in unsigned(7 downto 0);  -- Dados lidos da ROM
    jump_enable : in std_logic  -- Habilitação de salto (se necessário)
  );
end entity;

architecture a_un_controle of un_controle is
  signal pc_out : unsigned(15 downto 0);  -- Sinal de saída do contador de programa
  signal estado : std_logic := '0';  -- Máquina de estados de 1 bit (0 para fetch, 1 para decode/execute)

  signal opcode: unsigned(1 downto 0);
  begin
   -- coloquei o opcode nos 3 bits MSB
   opcode <= dado_rom(7 downto 6);
   -- meu jump: opcode 11
   jump_enable <= '1' when opcode="11" else
                  '0';

  -- Instanciar o componente program_counter
  component program_counter
    port (
      data_out : out unsigned(15 downto 0);
      clk : in std_logic;
      rst : in std_logic;
      wr_en : in std_logic
    );
  end component;

  -- Instanciar o componente ROM
  component rom
    port (
      clk : in std_logic;
      endereco : in unsigned(15 downto 0);
      dado : out unsigned(7 downto 0)
    );
  end component;

begin
  -- Instanciar o contador de programa
  pc_instance: program_counter port map(pc_out, clk, rst, '0');  -- '0' desabilita a escrita

  -- Processo para alternar a máquina de estados

		estado <= 	'0' when rst = '1' else -- Reset para o estado 0 (fetch)
                -- Se o salto estiver habilitado, vá para o estado 1 (decode/execute)
				        '1'         when jump_enable = '1' and rising_edge(clk) else
                -- Caso contrário, alternar estados
				        not estado  when jump_enable = '0' and rising_edge(clk) else
				        '0'';
  -- Conectar a saída do PC à entrada de endereços da ROM
  endereco_rom <= pc_out;

  -- Instanciar a ROM
  rom_instance: rom port map(clk, endereco_rom, dado_rom);

  -- Outras lógicas ou componentes da sua entidade de nível superior, se houver
  -- ...

end architecture;
