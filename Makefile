\all: build

\build:
    @echo "Building project..."

check:
    @echo "Running tests..."

distcheck:
    @echo "Checking distribution package..."

clean:
    @echo "Cleaning up..."

.PHONY: all build check distcheck clean
