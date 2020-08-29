#include <stdio.h>
#include <string.h>

int main(int argc, char **argv) {
	char buf[512];
	while(fgets(buf, sizeof(buf), stdin)) {
		char *from = buf;
		char *to = strchr(buf, '\t');
		if(!to) continue;
		*to = 0;
		to++;

		char *end = strchr(to, '\n');
		if(end) *end = 0;

		printf("s/");
		for(unsigned char *c = from; *c; c++) {
			if(*c > 127) printf("\\x%02x", *c);
			else if(strchr("$.*[\\^/", *c)) printf("\\%c", *c);
			else printf("%c", *c);
		}
		printf("/");
		for(unsigned char *c = to; *c; c++) {
			if(strchr("/", *c)) printf("\\%c", *c);
			else if(strchr("'", *c)) printf("',$%02x,'", *c);
			else printf("%c", *c);
		}
		printf("/g\n");
	}

	return 0;
}
