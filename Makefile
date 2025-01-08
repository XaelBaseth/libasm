# Variable
MAKEFLAGS    += --silent
NAME         = libasm.a
NAME_CAPS    = LIBASM
INC          = inc/
HEADER       = -I inc
SRC_DIR      = src/
OBJ_DIR      = obj/
CC           = nasm
CFLAGS       = -f elf64
RM           = rm -rf
ECHO         = echo

# Colors
DEF_COLOR    = \033[0;39m
ORANGE       = \033[0;33m
GRAY         = \033[0;90m
RED          = \033[0;91m
GREEN        = \033[1;92m
YELLOW       = \033[1;93m
BLUE         = \033[0;94m
MAGENTA      = \033[0;95m
CYAN         = \033[0;96m
WHITE        = \033[0;97m

# Files
MAND_DIR     = mandatory/
MAND_FILES   = ft_strlen ft_strcpy ft_read ft_strcmp ft_write  ft_strdup

SRC_MAND_FILE= $(addprefix $(MAND_DIR), $(MAND_FILES))

OBJF 		= 	.cache_exists

# Source files
SRC          = $(addprefix $(SRC_DIR), $(SRC_MAND_FILE))
OBJ          = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_MAND_FILE)))

# Generation of .o
$(NAME): $(OBJ)
		@ar rcs $@ $^
		@$(ECHO) "$(YELLOW)[$(NAME_CAPS)]:\t$(ORANGE)[==========]\t$(GREEN) => Success!$(DEF_COLOR)\n"

$(OBJ_DIR)%.o: $(SRC_DIR)%.s $(OBJF)
		@$(CC) $(CFLAGS) -o $@ $<
		@$(ECHO) "\033[1A\033[K$< created"

$(OBJF):		
				@mkdir -p $(OBJ_DIR)
				@mkdir -p $(OBJ_DIR)$(MAND_DIR)
				@touch $(OBJF)

# Rules
all: $(NAME)

help: ##  Print help on Makefile.
		@grep '^[^.#]\+:\s\+.*#' Makefile | \
		sed "s/\(.\+\):\s*\(.*\) #\s*\(.*\)/`printf "$(GRAY)"`\1`printf "$(DEF_COLOR)"`	\3 /" | \
		expand -t8

clean: ##  Clean generated files and cache.
		@$(RM) $(OBJ_DIR)
		@$(RM) $(OBJF)
		@$(RM) main
		@$(RM) test_output.txt
		@$(ECHO) "$(BLUE)[$(NAME_CAPS)]:\tobj. files$(DEF_COLOR)\t$(GREEN) => Cleaned!$(DEF_COLOR)\n"

fclean: ##  Clean all generated file, including binaries.		
		@make clean
		@$(RM) $(NAME)
		@$(ECHO) "$(CYAN)[$(NAME_CAPS)]:\texe. files$(DEF_COLOR)\t$(GREEN) => Cleaned!$(DEF_COLOR)\n"

re: ##  Clean and rebuild binary file.
		@make fclean all
		@$(ECHO) "\n$(GREEN)###\tCleaned and rebuilt everything for [$(NAME_CAPS)]!\t###$(DEF_COLOR)\n"

# no-pie is needed due a relocation issue with __errno_location. Link a
# position-independent executable (PIE), but some of the object files in
# libasm.a are compiled in a way that doesn't support this.
test: ##Use the main.c to test the program.
		@make re
		gcc -o main main.c -L. -lasm -no-pie 
		valgrind ./main

.PHONY: all test clean fclean re help test
