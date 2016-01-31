force -freeze sim:/memoryread/clk 1 0
force -freeze sim:/memoryread/reset 0 0
force -freeze sim:/memoryread/issueread 0 0
force -freeze sim:/memoryread/canread 1 0
run
force -freeze sim:/memoryread/clk 0 0
run
force -freeze sim:/memoryread/reset 1 0
force -freeze sim:/memoryread/clk 1 0
run
force -freeze sim:/memoryread/clk 0 0
run
force -freeze sim:/memoryread/clk 1 0
force -freeze sim:/memoryread/issueread 1 0
run
force -freeze sim:/memoryread/clk 0 0
run
force -freeze sim:/memoryread/issueread 0 0
force -freeze sim:/memoryread/clk 1 0
run
force -freeze sim:/memoryread/clk 0 0
run
force -freeze sim:/memoryread/canread 0 0
force -freeze sim:/memoryread/clk 1 0
run
force -freeze sim:/memoryread/clk 0 0
run
force -freeze sim:/memoryread/clk 1 0
run
force -freeze sim:/memoryread/clk 0 0
run
force -freeze sim:/memoryread/clk 1 0
force -freeze sim:/memoryread/canread 1 0
run
force -freeze sim:/memoryread/clk 0 0
run
force -freeze sim:/memoryread/clk 1 0
run
force -freeze sim:/memoryread/clk 0 0
run
force -freeze sim:/memoryread/clk 1 0
run