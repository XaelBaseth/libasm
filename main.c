#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <assert.h>

// Declare your assembly functions
size_t  ft_strlen(const char *str);
char    *ft_strcpy(char *dest, const char *src);
int     ft_strcmp(const char *s1, const char *s2);
char    *ft_strdup(const char *s);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);

void test_strlen() {
    const char *test1 = "Hello, world!";
    const char *test2 = "";

    assert(ft_strlen(test1) == strlen(test1)); 
    assert(ft_strlen(test2) == strlen(test2));
    printf("ft_strlen: OK\n");
}

void test_strcpy() {
    char dest1[20], dest2[20];
    const char *src = "Test string";

    ft_strcpy(dest1, src);
    strcpy(dest2, src);

    assert(strcmp(dest1, dest2) == 0); 
    printf("ft_strcpy: OK\n");
}

void test_strcmp() {
    const char *s1 = "Hello";
    const char *s2 = "World";
    const char *s3 = "Hello";

    assert(ft_strcmp(s1, s2) == strcmp(s1, s2));  
    assert(ft_strcmp(s1, s3) == strcmp(s1, s3));
    printf("ft_strcmp: OK\n");
}

void test_strdup() {
    const char *test = "Duplicate me!";
    char *ft_dup = ft_strdup(test);
    char *c_dup = strdup(test);

    assert(strcmp(ft_dup, c_dup) == 0);  
    free(ft_dup);
    free(c_dup);
    printf("ft_strdup: OK\n");
}

void test_write() {
    const char *msg = "Hello, write test!\n";
    ssize_t ft_ret = ft_write(STDOUT_FILENO, msg, strlen(msg));
    ssize_t c_ret = write(STDOUT_FILENO, msg, strlen(msg));

    assert(ft_ret == c_ret);  
    printf("ft_write: OK\n");
}

void test_read() {
    char ft_buf[20], c_buf[20];
    ssize_t ft_ret, c_ret;

    int fd = STDIN_FILENO;
    printf("Enter some input (up to 19 characters): ");
    ft_ret = ft_read(fd, ft_buf, 19);
    ft_buf[ft_ret] = '\0';

    lseek(fd, 0, SEEK_SET);  
    printf("\nNow enter the same input again: ");
    c_ret = read(fd, c_buf, 19);
    c_buf[c_ret] = '\0';

    assert(ft_ret == c_ret);  
    assert(strcmp(ft_buf, c_buf) == 0);  
    printf("ft_read: OK\n");
}

int main() {
    test_strlen();
    test_strcpy();
    test_strcmp();
    test_strdup();
    test_write();
    test_read();
    return 0;
}
