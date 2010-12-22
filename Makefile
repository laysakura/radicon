CXX	= g++
CXXFLAGS = -DDEBUG -g -Wall
LDFLAGS	= 
INCLUDES = 
LIBS = -lftdi -lpthread

SRCS = $(wildcard *.cpp)
OBJS = $(subst .cpp,.o,$(SRCS))
DEPENDS = $(subst .cpp,.d,$(SRCS))

TARGET = radicon

$(TARGET): $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

.PHONY: clean
clean :
	rm -f $(TARGETS) $(OBJS) $(DEPENDS)

.cpp .o:
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $<

%.d: %.cpp
	@set -e; $(CXX) -MM $(CXXFLAGS) $< \
		| sed 's/\($*\)\.o[ :]*/\1.o $@ : /g' > $@; \
		[ -s $@ ] || rm -f $@
-include $(DEPENDS)
