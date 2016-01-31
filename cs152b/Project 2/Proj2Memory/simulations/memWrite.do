force -freeze sim:/memorywrite/clk 1 0
force -freeze sim:/memorywrite/reset 0 0
force -freeze sim:/memorywrite/issuewrite 0 0
force -freeze sim:/memorywrite/canwrite 1 0
run
force -freeze sim:/memorywrite/clk 0 0
run
force -freeze sim:/memorywrite/reset 1 0
force -freeze sim:/memorywrite/clk 1 0
run
force -freeze sim:/memorywrite/clk 0 0
run
force -freeze sim:/memorywrite/clk 1 0
force -freeze sim:/memorywrite/issuewrite 1 0
run
force -freeze sim:/memorywrite/clk 0 0
run
force -freeze sim:/memorywrite/issuewrite 0 0
force -freeze sim:/memorywrite/clk 1 0
run
force -freeze sim:/memorywrite/clk 0 0
run
force -freeze sim:/memorywrite/canwrite 0 0
force -freeze sim:/memorywrite/clk 1 0
run
force -freeze sim:/memorywrite/clk 0 0
run
force -freeze sim:/memorywrite/clk 1 0
run
force -freeze sim:/memorywrite/clk 0 0
run
force -freeze sim:/memorywrite/clk 1 0
force -freeze sim:/memorywrite/canwrite 1 0
run
force -freeze sim:/memorywrite/clk 0 0
run
force -freeze sim:/memorywrite/clk 1 0
run
force -freeze sim:/memorywrite/clk 0 0
run
force -freeze sim:/memorywrite/clk 1 0
run