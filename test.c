#include <dlfcn.h>
int adb_test(int argc, char **argv);

int main(int argc, char **argv)
{
	void *handle;
	handle = dlopen("./libadb86.so",RTLD_LAZY);
	return adb_test(argc, argv);
}