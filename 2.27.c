#include <stdio.h>

int uadd_ok(unsigned x, unsigned y)
{
	unsigned s = x + y;
	if (s < x || s < y)
			return 0;
	return 1;
}

