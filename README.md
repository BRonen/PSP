# Hello World PSP

## main.c
```c
#include <pspkernel.h>
#include <pspdebug.h>
```

```c
PSP_MODULE_INFO("Hello World", 0, 1, 0);
```

```c
int exit_callback(int arg1, int arg2, void *common){
  sceKernelExitGame();	
  return 0;
}

int CallbackThread(SceSize args, void *argp){
  int cbid;
  cbid = sceKernelCreateCallback("Exit Callback", exit_callback, NULL);
  sceKernelRegisterExitCallback(cbid);
  sceKernelSleepThreadCB();
  return 0;
}

int SetupCallbacks(void){
  int thid = 0;
  thid = sceKernelCreateThread("update_thread", CallbackThread, 0x11, 0xFA0, 0, 0);
  if(thid >= 0) {	
    sceKernelStartThread(thid, 0, 0);
  }
  return thid;	
}
```

```c
int main(){
  pspDebugScreenInit();
  SetupCallbacks();
  pspDebugScreenPrintf("Hello World");
  sceKernelSleepThread();
  return 0;
}
```

## makefile

```makefile
OBJS = main.o
```

```makefile
CFLAGS = -Wall -Wextra
CXXFLAGS = $(CFLAGS)
```

```makefile
LIBS =
```

```makefile
PSP_EBOOT_TITLE = Hello World
```

```makefile
EXTRA_TARGETS = EBOOT.PBP
```

```makefile
PSPSDK = $(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build.mak
```