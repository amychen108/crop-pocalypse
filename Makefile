# Compiler
CXX := g++
# Compiler flags
CXXFLAGS := -Wall -Wextra -std=c++11 -I/path/to/cppunit/headers
# Test framework
TEST := cppunit

# Directories
SRC_DIR := src
BUILD_DIR := build
TEST_DIR := test

# Source files
SRCS := $(wildcard $(SRC_DIR)/*.cpp)
# Object files
OBJS := $(SRCS:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)
# Test files
TEST_SRCS := $(wildcard $(TEST_DIR)/*.cpp)
# Test executables
TEST_EXES := $(BUILD_DIR)/TestCases

# Default target
.PHONY: all
all: $(BUILD_DIR) $(OBJS) $(TEST_EXES)

# Create build directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compile source files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile test files
$(BUILD_DIR)/TestCases: $(BUILD_DIR)/TestCases.o $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@ -L/path/to/cppunit/libs -lcppunit

$(BUILD_DIR)/%.o: $(TEST_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Run tests
.PHONY: test
test: $(TEST_EXES)
	@echo "Running tests..."
	@$(BUILD_DIR)/TestCases

# Clean
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

