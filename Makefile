# Compiler
CXX := g++
# Compiler flags
CXXFLAGS := -Wall -Wextra -std=c++11
# Test framework
TEST := catch.hpp

# Directories
SRC_DIR := src
BUILD_DIR := build
TEST_DIR := test

# Source files
SRCS := $(wildcard $(SRC)/*.cpp)
# Object files
OBJS := $(SRCS:$(SRC)/%.cpp=$(BUILD_DIR)/%.o)
# Test files
TEST_SRCS := $(wildcard $(TEST_DIR)/*.cpp)
# Test executables
TEST_EXES := $(TEST_SRCS:$(TEST_DIR)/%.cpp=$(BUILD_DIR)/%)

# Default target
.PHONY: all
all: $(BUILD_DIR) $(OBJS)

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compile source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile test files
$(BUILD_DIR)/%: $(TEST_DIR)/%.cpp $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@

# Run tests
.PHONY: test
test: $(TEST_EXES)
	@for test_exe in $(TEST_EXES); do \
		echo "Running $$test_exe"; \
		$$test_exe; \
	done

# Clean
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
