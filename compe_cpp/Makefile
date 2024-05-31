CXX      = g++-13
CXXFLAGS = -std=gnu++20 -Wall -Wextra -pedantic -std=gnu++20 \
	-Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 \
	-Wduplicated-cond -Wcast-qual -Wcast-align \
	-D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 \
	-fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector \
	-DDEBUG_
TARGET   = a.out
SRC      = solve.cc

run:
	$(CXX) $(CXXFLAGS) $(SRC) -o $(TARGET)

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
