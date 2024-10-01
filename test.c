#include  "libasm.a"


void	test_ft_strlen(char *str)
{
	printf("   Strlen: %lu\n", strlen(str));
	printf("Ft_strlen: %d\n", ft_strlen(str));
}

int		main(int ac, char **av)
{
    test_ft_strlen('Hello, World!');
    return (0);
}