#include <stdio.h>
#include <string.h>
#include <sys/mman.h> /* so we can use mprotect */
#include <unistd.h> /* so we can use getpagesize */
unsigned char code[] = "\xeb\x2b\x5e\x48\xc7\xc0\x01\x00\x00\x00\x48\xc7\xc7\x01\x00\x00\x00\x48\x89\xf6\x48\xc7\xc2\x07\x00\x00\x00\x0f\x05\x48\xc7\xc0\x3c\x00\x00\x00\x48\xc7\xc7\x00\x00\x00\x00\x0f\x05\xe8\xd0\xff\xff\xff\x65\x62\x75\x6c\x74\x6f\x6e";
int main() {
int pagesize = getpagesize(); // Get the page size for this system
// calculate the address of the code (subtract the difference between the pagesize and the address to code to get the offset)
void *addrOfThePage = code - ((unsigned int)code % pagesize);
mprotect(addrOfThePage, pagesize, PROT_EXEC | PROT_WRITE); // Set the permissions for the page to be EXECUTABLE
 int (*ret)() = (int(*)())code; // Run the code
ret();
}