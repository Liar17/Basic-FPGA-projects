
-- VHDL Instantiation Created from source file counter_int.vhd -- 06:04:06 03/26/2025
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT counter_int
	PORT(
		clk : IN std_logic;          
		count : OUT std_logic_vector(0 to 7)
		);
	END COMPONENT;

	Inst_counter_int: counter_int PORT MAP(
		clk => ,
		count => 
	);


