# Default target: build the project
all: build

# Build the project
build:
    # Add your build commands here
    @echo "Building project..."

# Run tests
check:
    # Add your test commands here
    @echo "Running tests..."

# Check distribution package
distcheck:
    # Add your distribution check commands here
    @echo "Checking distribution package..."

# Clean up
clean:
    # Add your clean-up commands here
    @echo "Cleaning up..."

# Phony targets
.PHONY: all build check distcheck clean
