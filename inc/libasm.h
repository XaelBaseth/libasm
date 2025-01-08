#ifndef LIBASM_H
# define	LIBASM_H
/*-----------------------------------------------------------------------------
								LIBRAIRIES
-----------------------------------------------------------------------------*/

# include	<stdio.h>
# include	<string.h>
# include	<unistd.h>
# include	<stdlib.h>
# include	<assert.h>
# include 	<fcntl.h>

/*-----------------------------------------------------------------------------
								MACROS
-----------------------------------------------------------------------------*/

# define DEF_COLOR  "\033[0;39m"
# define ORANGE     "\033[0;33m"
# define GRAY       "\033[0;90m"
# define RED        "\033[0;91m"
# define GREEN      "\033[1;92m"
# define YELLOW     "\033[1;93m"
# define BLUE       "\033[0;94m"
# define MAGENTA    "\033[0;95m"
# define CYAN       "\033[0;96m"
# define WHITE      "\033[0;97m"

/*-----------------------------------------------------------------------------
								FUNCTIONS
-----------------------------------------------------------------------------*/

size_t	ft_strlen(char *str);
char	*ft_strcpy(char *dest, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
char	*ft_strdup(const char *s);
size_t	ft_write(int fd, const void *buf, size_t count);
size_t	ft_read(int fd, void *buf, size_t count);

#endif
