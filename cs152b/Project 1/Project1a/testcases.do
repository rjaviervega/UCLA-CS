# Test Cases Script .do
#
restart
force -freeze sim:/alu4/a0_in 1 0
force -freeze sim:/alu4/a1_in 0 0
force -freeze sim:/alu4/a2_in 0 0
force -freeze sim:/alu4/a3_in 1 0
force -freeze sim:/alu4/aluctrl0 0 0
force -freeze sim:/alu4/aluctrl1 0 0
force -freeze sim:/alu4/aluctrl2 0 0
force -freeze sim:/alu4/b0_in 1 0
force -freeze sim:/alu4/b1_in 1 0
force -freeze sim:/alu4/b2_in 0 0
force -freeze sim:/alu4/b3_in 0 0
force -freeze sim:/alu4/cin 0 0
run
force -freeze sim:/alu4/aluctrl0 1 0
force -freeze sim:/alu4/aluctrl1 0 0
force -freeze sim:/alu4/aluctrl2 0 0
run
force -freeze sim:/alu4/aluctrl0 0 0
force -freeze sim:/alu4/aluctrl1 1 0
force -freeze sim:/alu4/aluctrl2 0 0
run
force -freeze sim:/alu4/aluctrl0 1 0
force -freeze sim:/alu4/aluctrl1 1 0
force -freeze sim:/alu4/aluctrl2 0 0
run
force -freeze sim:/alu4/aluctrl0 0 0
force -freeze sim:/alu4/aluctrl1 0 0
force -freeze sim:/alu4/aluctrl2 1 0
run
force -freeze sim:/alu4/aluctrl0 1 0
force -freeze sim:/alu4/aluctrl1 0 0
force -freeze sim:/alu4/aluctrl2 1 0
run
force -freeze sim:/alu4/aluctrl0 0 0
force -freeze sim:/alu4/aluctrl1 1 0
force -freeze sim:/alu4/aluctrl2 1 0
run
force -freeze sim:/alu4/aluctrl0 1 0
force -freeze sim:/alu4/aluctrl1 1 0
force -freeze sim:/alu4/aluctrl2 1 0
run
force -freeze sim:/alu4/a0_in 1 0
force -freeze sim:/alu4/a1_in 1 0
force -freeze sim:/alu4/a2_in 1 0
force -freeze sim:/alu4/a3_in 1 0
force -freeze sim:/alu4/aluctrl0 0 0
force -freeze sim:/alu4/aluctrl1 0 0
force -freeze sim:/alu4/aluctrl2 0 0
force -freeze sim:/alu4/b0_in 1 0
force -freeze sim:/alu4/b1_in 1 0
force -freeze sim:/alu4/b2_in 1 0
force -freeze sim:/alu4/b3_in 1 0
force -freeze sim:/alu4/cin 0 0
run
force -freeze sim:/alu4/a0_in 1 0
force -freeze sim:/alu4/a1_in 1 0
force -freeze sim:/alu4/a2_in 1 0
force -freeze sim:/alu4/a3_in 0 0
force -freeze sim:/alu4/aluctrl0 0 0
force -freeze sim:/alu4/aluctrl1 0 0
force -freeze sim:/alu4/aluctrl2 0 0
force -freeze sim:/alu4/b0_in 0 0
force -freeze sim:/alu4/b1_in 0 0
force -freeze sim:/alu4/b2_in 0 0
force -freeze sim:/alu4/b3_in 0 0
force -freeze sim:/alu4/cin 1 0
run
force -freeze sim:/alu4/a0_in 0 0
force -freeze sim:/alu4/a1_in 0 0
force -freeze sim:/alu4/a2_in 0 0
force -freeze sim:/alu4/a3_in 1 0
force -freeze sim:/alu4/aluctrl0 1 0
force -freeze sim:/alu4/aluctrl1 0 0
force -freeze sim:/alu4/aluctrl2 0 0
force -freeze sim:/alu4/b0_in 1 0
force -freeze sim:/alu4/b1_in 1 0
force -freeze sim:/alu4/b2_in 1 0
force -freeze sim:/alu4/b3_in 1 0
force -freeze sim:/alu4/cin 0 0
run
force -freeze sim:/alu4/a0_in 1 1
force -freeze sim:/alu4/a1_in 1 0
force -freeze sim:/alu4/a2_in 1 0
force -freeze sim:/alu4/a3_in 1 0
force -freeze sim:/alu4/aluctrl0 1 0
force -freeze sim:/alu4/aluctrl1 0 0
force -freeze sim:/alu4/aluctrl2 0 0
force -freeze sim:/alu4/b0_in 1 0
force -freeze sim:/alu4/b1_in 1 0
force -freeze sim:/alu4/b2_in 1 0
force -freeze sim:/alu4/b3_in 1 1
force -freeze sim:/alu4/cin 0 0
run

force -freeze sim:/alu4/a0_in 0 1
force -freeze sim:/alu4/a1_in 0 0
force -freeze sim:/alu4/a2_in 0 0
force -freeze sim:/alu4/a3_in 0 0
force -freeze sim:/alu4/aluctrl0 1 0
force -freeze sim:/alu4/aluctrl1 0 0
force -freeze sim:/alu4/aluctrl2 1 0
force -freeze sim:/alu4/b0_in 1 0
force -freeze sim:/alu4/b1_in 1 0
force -freeze sim:/alu4/b2_in 1 0
force -freeze sim:/alu4/b3_in 1 1
force -freeze sim:/alu4/cin 0 0
run