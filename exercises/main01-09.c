#include <stdio.h>
#include <unistd.h>

#include "ex01-09.h"

float sensor = 1;

/* This function is called as the trigger. */
void trigger1 (float arg) {
  printf("Monitor going off with data: %f\n", arg);
}

int main (int argc, char **argv) {
  int i;
  for (i = 0; i < 20; i++) {
    sensor *= 2;
    step();
    sleep(1);
  }
  return 0;
}
