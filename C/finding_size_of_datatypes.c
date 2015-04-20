#include <stdio.h>
#include <limits.h>
#include <float.h>

int main()

{

  printf("The value of FLT_MAX is %f \n", FLT_MAX);
  printf("A float takes %zu bytes \n", sizeof(float));

  char *string_literal = "string literal";
  char initials[] = "ABC";
  char initials_again[4];
  initials_again[0] = 'D';
  initials_again[1] = 'E';
  initials_again[2] = 'F';


  printf("This is a %s.\n", string_literal);

  printf("Know your %s's and %s's\n", initials, initials_again);

}
