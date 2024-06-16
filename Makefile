SRC_DIR := fnl
OUT_DIR := lua
SRC := $(shell find $(SRC_DIR)/ -type f -name '*.fnl')
OUT := $(patsubst $(SRC_DIR)/%.fnl,$(OUT_DIR)/%.lua,$(SRC))

MKDIR_P = mkdir -p

build: $(OUT)

$(OUT_DIR)/%.lua: $(SRC_DIR)/%.fnl fennel
	@$(MKDIR_P) $(@D)
	./fennel --compile $< > $@
