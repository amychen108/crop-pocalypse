# Compiler
CXX := g++
# Flags
CXXFLAGS := -std=c++11 -Wall -Wextra -pedantic -g
# Source files
SRCS := $(wildcard *.cpp)
# Object files
OBJS := $(SRCS:.cpp=.o)
# Executable name for the main program
MAIN := unit_tests

# Build main program
$(MAIN): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(MAIN)

# Compile source files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

.PHONY: test clean

# Run tests
test: $(MAIN)
	./$(MAIN) && echo "Tests passed!" || echo "Tests failed!"

# Clean up
clean:
	rm -f $(OBJS) $(MAIN)
