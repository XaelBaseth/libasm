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
SHARED_NAME	 = libasm.so

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
MAND_FILES   = ft_strlen #ft_strcpy ft_strcmp ft_write ft_read ft_strdup
BONU_DIR     = bonus/
BONU_FILES   = ft_list_push_front ft_list_size ft_list_sort ft_list_remove_if

SRC_MAND_FILE= $(addprefix $(MAND_DIR), $(MAND_FILES))
SRC_BONU_FILE= $(addprefix $(BONU_DIR), $(BONU_FILES))

OBJF 		= 	.cache_exists

# Source files
SRC          = $(addprefix $(SRC_DIR), $(SRC_MAND_FILE))
SRC_BONUS    = $(addprefix $(SRC_DIR), $(SRC_BONU_FILE))
OBJ          = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_MAND_FILE)))
OBJ_BONUS    = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(BONU_FILE)))

# Rules
all: $(NAME)

$(NAME): $(OBJ)
		@ar rcs $@ $^
		@$(ECHO) "$(YELLOW)[$(NAME_CAPS)]:\t$(ORANGE)[==========]\t$(GREEN) => Success!$(DEF_COLOR)\n"

bonus: $(OBJ) $(OBJ_BONUS)
		@ar rcs $(NAME) $^
		@$(ECHO) "$(YELLOW)[$(NAME_CAPS)]:\t$(ORANGE)[==========]\t$(GREEN) => Bonus files compiled!$(DEF_COLOR)\n"

$(SHARED_NAME): $(OBJ)
		@$(CC) -shared -o $@ $^
		@$(ECHO) "$(YELLOW)[$(NAME_CAPS)]:\t$(ORANGE)[==========]\t$(GREEN) => Shared library created!$(DEF_COLOR)\n"

test: $(OBJ) $(OBJ_BONUS) $(SHARED_NAME)
		@$(ECHO) "$(YELLOW)[$(NAME_CAPS)]:\t$(ORANGE)[==========]\t$(GREEN) => Starting tests...$(DEF_COLOR)\n"
		

$(OBJ_DIR)%.o: $(SRC_DIR)%.s $(OBJF)
		@$(CC) $(CFLAGS) $< -o $@
		@$(ECHO) "\033[1A\033[K$< created"

$(OBJF):		
				@mkdir -p $(OBJ_DIR)
				@mkdir -p $(OBJ_DIR)$(MAND_DIR)
				@mkdir -p $(OBJ_DIR)$(BONU_DIR)



help: ##  Print help on Makefile.
		@grep '^[^.#]\+:\s\+.*#' Makefile | \
		sed "s/\(.\+\):\s*\(.*\) #\s*\(.*\)/`printf "$(GRAY)"`\1`printf "$(DEF_COLOR)"`	\3 /" | \
		expand -t8

clean: ##  Clean generated files and cache.
		@$(RM) $(OBJ_DIR)
		@$(RM) $(OBJF)
		@$(ECHO) "$(BLUE)[$(NAME_CAPS)]:\tobj. files$(DEF_COLOR)\t$(GREEN) => Cleaned!$(DEF_COLOR)\n"

fclean: ##  Clean all generated file, including binaries.		
		@make clean
		@$(RM) $(NAME)
		@$(ECHO) "$(CYAN)[$(NAME_CAPS)]:\texe. files$(DEF_COLOR)\t$(GREEN) => Cleaned!$(DEF_COLOR)\n"

re: ##  Clean and rebuild binary file.
		@make fclean all
		@$(ECHO) "\n$(GREEN)###\tCleaned and rebuilt everything for [$(NAME_CAPS)]!\t###$(DEF_COLOR)\n"

.PHONY: all clean fclean re help bonus
