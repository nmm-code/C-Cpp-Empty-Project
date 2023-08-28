##############################
#
#	Makefile cpp application
#
#	@author nmm-code
#
###############################

# Compiler
CXX 		:= g++
# Compiler Flags
CXXFLAGS 	:= -std=c++11 -Wall -Wextra 
# Source directory
SRC_DIR 	:= src
# Output directory
OUT_DIR 	:= out
# Executable name
EXEC 		:= a

##################################################################################################
rwildcard = $(foreach d,$(wildcard $(1:=/*)),$(call rwildcard,$d,$2) $(filter $(subst *,%,$2),$d))
SRCS := $(call rwildcard,$(SRC_DIR),*.cpp)
OBJS := $(patsubst $(SRC_DIR)/%.cpp,$(OUT_DIR)/%.o,$(SRCS))

.PHONY: all clean help

all: $(EXEC)

$(OUT_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(@D)
	@echo ...building
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(EXEC): $(OBJS)
	$(CXX) $(OBJS) -o $(OUT_DIR)/$@

clean:
	rm -rf $(OUT_DIR)

help:
	@echo "(make) make all   : Compiles every file in src/ into an executable"
	@echo "       make clean : Deletes every compiled file and the executable"
	@echo "       make help  : Prints the usage"
