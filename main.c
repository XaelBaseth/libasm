#include "./inc/libasm.h"

void test_strlen() {
	printf(BLUE"\n[===============] STRLEN [====================]\n"DEF_COLOR);
    
	char *test1 = "Hello, world!";
    char *test2 = "";
	char *test3 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id ligula tellus. Vestibulum ac nunc eu magna pellentesque facilisis eu eu urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas elementum neque non euismod pretium. Nunc consectetur vel urna sed mollis. Vivamus maximus metus eu auctor ullamcorper. Curabitur vel tincidunt odio. Suspendisse egestas dolor eu metus pellentesque, in finibus purus vulputate. Nulla lacus urna, finibus ut congue non, auctor vitae tortor. Maecenas pellentesque sit amet tellus gravida malesuada. Phasellus velit dui, vulputate commodo urna vel, viverra euismod purus. ";

    if (ft_strlen(test1) == strlen(test1))
		printf(GREEN" [OK]"DEF_COLOR);
	else
		printf(RED" [NOK]"DEF_COLOR);
	
	if (ft_strlen(test2) == strlen(test2))
		printf(GREEN" [OK]"DEF_COLOR);
	else
		printf(RED" [NOK]"DEF_COLOR);
	
	if (ft_strlen(test2) == strlen(test2))
		printf(GREEN" [OK]"DEF_COLOR);
	else
		printf(RED" [NOK]"DEF_COLOR);
}

void test_strcpy() {
	printf(BLUE"\n[===============] STRCPY [====================]\n"DEF_COLOR);
    
	char dest1[20], dest2[20], dest3[660];
    char *src1 = "";
	char *src2 = "Hello, world!";
	char *src3 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id ligula tellus. Vestibulum ac nunc eu magna pellentesque facilisis eu eu urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas elementum neque non euismod pretium. Nunc consectetur vel urna sed mollis. Vivamus maximus metus eu auctor ullamcorper. Curabitur vel tincidunt odio. Suspendisse egestas dolor eu metus pellentesque, in finibus purus vulputate. Nulla lacus urna, finibus ut congue non, auctor vitae tortor. Maecenas pellentesque sit amet tellus gravida malesuada. Phasellus velit dui, vulputate commodo urna vel, viverra euismod purus. ";

    if (ft_strcpy(dest1, src1) == strcpy(dest1, src1))
		printf(GREEN" [OK]"DEF_COLOR);
	else
		printf(RED" [NOK]"DEF_COLOR);
	
	if (ft_strcpy(dest2, src2) == strcpy(dest2, src2))
		printf(GREEN" [OK]"DEF_COLOR);
	else
		printf(RED" [NOK]"DEF_COLOR);
	
	if (ft_strcpy(dest3, src3) == strcpy(dest3, src3))
		printf(GREEN" [OK]"DEF_COLOR);
	else
		printf(RED" [NOK]"DEF_COLOR);
}

void test_strcmp() {
	printf(BLUE"\n[===============] STRCMP [====================]\n"DEF_COLOR);
    
	const char *s1 = "Hello";
    const char *s2 = "World";
    const char *s3 = "Hello";

    if (ft_strcmp(s1, s1) == strcmp(s1, s1))
		printf(GREEN" [OK]"DEF_COLOR);
	else
		printf(RED" [NOK]"DEF_COLOR);
	
	if (ft_strcmp(s1, s3) == strcmp(s1, s3))
		printf(GREEN" [OK]"DEF_COLOR);
	else
		printf(RED" [NOK]"DEF_COLOR);
	
	if (ft_strcmp(s1, s2) != strcmp(s1, s2))
		printf(GREEN" [OK]"DEF_COLOR);
	else
		printf(RED" [NOK]"DEF_COLOR);
}

void test_strdup() {
	printf(BLUE"\n[===============] STRDUP [====================]\n"DEF_COLOR);
    
	char *test1 = "Hello, World!";
    char *ft_dup1 = ft_strdup(test1);
    char *c_dup1 = strdup(test1);
	char *test2 = "";
    char *ft_dup2 = ft_strdup(test2);
    char *c_dup2 = strdup(test2);
	char *test3 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris id ligula tellus. Vestibulum ac nunc eu magna pellentesque facilisis eu eu urna. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas elementum neque non euismod pretium. Nunc consectetur vel urna sed mollis. Vivamus maximus metus eu auctor ullamcorper. Curabitur vel tincidunt odio. Suspendisse egestas dolor eu metus pellentesque, in finibus purus vulputate. Nulla lacus urna, finibus ut congue non, auctor vitae tortor. Maecenas pellentesque sit amet tellus gravida malesuada. Phasellus velit dui, vulputate commodo urna vel, viverra euismod purus. ";
    char *ft_dup3 = ft_strdup(test3);
    char *c_dup3 = strdup(test3);

    if (strcmp(c_dup1, ft_dup1) != 0)
		printf(RED" [NOK]"DEF_COLOR);
	else 
		printf(GREEN" [OK]"DEF_COLOR);
	
	if (strcmp(c_dup2, ft_dup2) != 0)
		printf(RED" [NOK]"DEF_COLOR);
	else 
		printf(GREEN" [OK]"DEF_COLOR);

	if (strcmp(c_dup3, ft_dup3) != 0)
		printf(RED" [NOK]"DEF_COLOR);
	else 
		printf(GREEN" [OK]"DEF_COLOR);

	free(ft_dup1);
    free(c_dup1);
	free(ft_dup2);
    free(c_dup2);
	free(ft_dup3);
    free(c_dup3);
}

void test_write() {
	printf(BLUE"\n[===============] WRITE [====================]\n"DEF_COLOR);
    
	char *msg = "Hello, World!\n";
    ssize_t ft_stdout = ft_write(STDOUT_FILENO, msg, strlen(msg));
    ssize_t c_stdout = write(STDOUT_FILENO, msg, strlen(msg));
	const char *filename = "test_output.txt";
    int file_fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644);
	ssize_t ft_file = ft_write(file_fd, msg, strlen(msg));
    ssize_t c_file = write(file_fd, msg, strlen(msg));
	int invalid_fd = -1;
    ssize_t ft_invalid = ft_write(invalid_fd, msg, strlen(msg));
    ssize_t c_invalid = write(invalid_fd, msg, strlen(msg));


    if (c_stdout == ft_stdout)
		printf(GREEN" [OK]"DEF_COLOR);
	else 
		printf(RED" [NOK]"DEF_COLOR);

	if (ft_file == c_file)
		printf(GREEN" [OK]"DEF_COLOR);
	else 
		printf(RED" [NOK]"DEF_COLOR);
    close(file_fd);

	if (ft_invalid == -1 && c_invalid == -1)
		printf(GREEN" [OK]"DEF_COLOR);
	else 
		printf(RED" [NOK]"DEF_COLOR);
	
}

void test_read() {
	printf(BLUE"\n[===============] READ [====================]\n"DEF_COLOR);

	char buffer_ft[1024] = {0};
	char buffer_c[1024] = {0};
	printf("Enter input for stdin test and repeat it:\n");
	ssize_t ft_stdin = ft_read(STDIN_FILENO, buffer_ft, sizeof(buffer_ft) - 1);
	ssize_t c_stdin = read(STDIN_FILENO, buffer_c, sizeof(buffer_c) - 1);
	const char *filename = "test_output.txt";
    int file_fd = open(filename, O_RDONLY);
    ssize_t ft_file = ft_read(file_fd, buffer_ft, sizeof(buffer_ft) - 1);
    ssize_t c_file = read(file_fd, buffer_c, sizeof(buffer_c) - 1);
	int invalid_fd = -1;
    ssize_t ft_invalid = ft_read(invalid_fd, buffer_ft, sizeof(buffer_ft) - 1);
    ssize_t c_invalid = read(invalid_fd, buffer_c, sizeof(buffer_c) - 1);

	if (ft_stdin == c_stdin || strcmp(buffer_ft, buffer_c) == 0) {
		printf(GREEN" [OK]"DEF_COLOR);
	} else {
		printf(RED" [NOK]"DEF_COLOR);
	}

	memset(buffer_ft, 0, sizeof(buffer_ft));
	memset(buffer_c, 0, sizeof(buffer_c));

  	if (ft_file == c_file || strcmp(buffer_ft, buffer_c) == 0)
		printf(GREEN" [OK]"DEF_COLOR);
	else
        printf(RED" [NOK]"DEF_COLOR);
    close(file_fd);

    memset(buffer_ft, 0, sizeof(buffer_ft));
    memset(buffer_c, 0, sizeof(buffer_c));

    if (ft_invalid == -1 && c_invalid == -1)
        printf(GREEN" [OK]"DEF_COLOR);
    else
        printf(RED" [NOK]"DEF_COLOR);
	
	memset(buffer_ft, 0, sizeof(buffer_ft));
    memset(buffer_c, 0, sizeof(buffer_c));
}


int main() {
	printf(MAGENTA"\n[###################] TEST [###################]\n"DEF_COLOR);
    test_strlen();
    test_strcpy();
    test_strcmp();
    test_strdup();
    test_write();
    test_read();
	printf(MAGENTA"\n[###################] TEST [###################]\n"DEF_COLOR);
    return 0;
}
