CXX      = g++-13
CXXFLAGS = -std=gnu++20 -Wall -Wextra -D_GLIBCXX_DEBUG -DDEBUG_
TARGET   = a.out
SRC      = solve.cc

run:
	$(CXX) $(CXXFLAGS) -O2 $(SRC) -o $(TARGET)

.PHONY: out
out:
	./$(TARGET)

.PHONY: in
in:
	./$(TARGET) < in

# -g3: debug level 3
# -O0: Optimize level 0 <=> no optimizations
.PHONY: debug
debug:
	$(CXX) $(CXXFLAGS) -g3 -O0 $(SRC) -o $(TARGET)

.PHONY: watch
watch:
	find $(SRC) | entr -sc "make run && oj t"

.PHONY: clean
clean:
	rm a.out solve.cc ./test in out -r
