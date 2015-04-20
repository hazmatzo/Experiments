#include <stdio.h>
// "" - looks in local file directory / project; <> looks in the system paths

int main(int argc, char *argv[]) {
  printf("Hello Zoe");
}

// In console use "clang --help" and that will show you all the help features.
// Create a file -- hello_world.c
// "clang hello_world.c"
// Now we'll need to find the output.
// ./a.out // showed the output
// default compiled file is a.out, and you can rename it with -o <file> as a command line option
// new lines \n
// Change something in the file, from "hello world" to "hello Zoe", then rerun the compiled version ./a.out
// Result? Still hasn't changed. You have to recompile and then it will overwrite a.out (or not if you specify a different output)