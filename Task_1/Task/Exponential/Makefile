MODULE=Exponential
TESTBENCH=$(MODULE)_tb.cpp
SV_FILE=$(MODULE).sv
OBJ_DIR=obj_dir
EXECUTABLE=$(OBJ_DIR)/V$(MODULE)

verilate:
	verilator -Wall -cc $(SV_FILE) --exe $(TESTBENCH)

build: verilate
	make -C $(OBJ_DIR) -f V$(MODULE).mk V$(MODULE)

run: build
	@echo Running $(EXECUTABLE)...
	./$(EXECUTABLE)

.PHONY: verilate build run