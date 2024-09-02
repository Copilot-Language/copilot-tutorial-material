#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <unistd.h>

#include "sample1.h"

float sensor = 1;

void sample1 (float arg) {
  printf("Monitor going off with data: %f\n", arg);
}

int main (int argc, char **argv) {
  int i = 0;
  for (;i < 20; i++) {
    sensor *= 2;
    step();
    sleep(1);
  }
  return 0;
}
