force -freeze sim:/ctrlunit/clk 1 0, 0 {50 ns} -r 100
force -freeze sim:/ctrlunit/reset 1 0
force -freeze sim:/ctrlunit/rddone 0 0
force -freeze sim:/ctrlunit/pc 0000000000000000 0
force -freeze sim:/ctrlunit/dout 0000000000000000 0
force -freeze sim:/ctrlunit/wrdone 0 0
force -freeze sim:/ctrlunit/start 0 0
run
force -freeze sim:/ctrlunit/start 1 0
run
force -freeze sim:/ctrlunit/start 0 0
run
run
force -freeze sim:/ctrlunit/rddone 1 0
force -freeze sim:/ctrlunit/dout 1100000000001000 0
run
force -freeze sim:/ctrlunit/rddone 0 0
force -freeze sim:/ctrlunit/a 1111111111111110 0
run
run
run
force -freeze sim:/ctrlunit/wrdone 1 0
run
force -freeze sim:/ctrlunit/wrdone 0 0
run
run
run