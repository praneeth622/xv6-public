
_test_syscalls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    signal(pid, SIGUSR1);
    printf(1, "Signal sent to process %d\n", pid);
}


int main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 0c             	sub    $0xc,%esp
    printf(1, "Testing custom system calls...\n");
  11:	68 f8 09 00 00       	push   $0x9f8
  16:	6a 01                	push   $0x1
  18:	e8 a3 05 00 00       	call   5c0 <printf>

    test_process_creation();
  1d:	e8 3e 00 00 00       	call   60 <test_process_creation>
    test_ipc();
  22:	e8 89 00 00 00       	call   b0 <test_ipc>
    test_threads();
  27:	e8 14 01 00 00       	call   140 <test_threads>
    // test_mutex();
    test_signal();
  2c:	e8 6f 01 00 00       	call   1a0 <test_signal>

    return 0;
}
  31:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  34:	31 c0                	xor    %eax,%eax
  36:	c9                   	leave
  37:	8d 61 fc             	lea    -0x4(%ecx),%esp
  3a:	c3                   	ret
  3b:	66 90                	xchg   %ax,%ax
  3d:	66 90                	xchg   %ax,%ax
  3f:	90                   	nop

00000040 <thread_func>:
void thread_func(void *arg) {
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	83 ec 0c             	sub    $0xc,%esp
    printf(1, "Thread ID %d running\n", (int)arg);
  46:	ff 75 08             	push   0x8(%ebp)
  49:	68 c8 08 00 00       	push   $0x8c8
  4e:	6a 01                	push   $0x1
  50:	e8 6b 05 00 00       	call   5c0 <printf>
}
  55:	83 c4 10             	add    $0x10,%esp
  58:	c9                   	leave
  59:	c3                   	ret
  5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000060 <test_process_creation>:
void test_process_creation() {
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	83 ec 10             	sub    $0x10,%esp
    int pid = spawn("priority_task", 5);
  66:	6a 05                	push   $0x5
  68:	68 de 08 00 00       	push   $0x8de
  6d:	e8 60 04 00 00       	call   4d2 <spawn>
    if (pid < 0) {
  72:	83 c4 10             	add    $0x10,%esp
  75:	85 c0                	test   %eax,%eax
  77:	78 17                	js     90 <test_process_creation+0x30>
        printf(1, "Process created with PID %d\n", pid);
  79:	83 ec 04             	sub    $0x4,%esp
  7c:	50                   	push   %eax
  7d:	68 05 09 00 00       	push   $0x905
  82:	6a 01                	push   $0x1
  84:	e8 37 05 00 00       	call   5c0 <printf>
  89:	83 c4 10             	add    $0x10,%esp
}
  8c:	c9                   	leave
  8d:	c3                   	ret
  8e:	66 90                	xchg   %ax,%ax
        printf(1, "Process creation failed\n");
  90:	83 ec 08             	sub    $0x8,%esp
  93:	68 ec 08 00 00       	push   $0x8ec
  98:	6a 01                	push   $0x1
  9a:	e8 21 05 00 00       	call   5c0 <printf>
}
  9f:	83 c4 10             	add    $0x10,%esp
  a2:	c9                   	leave
  a3:	c3                   	ret
  a4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  ab:	00 
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000b0 <test_ipc>:
void test_ipc() {
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	83 ec 10             	sub    $0x10,%esp
    void* shmid = shm_open(4096);
  b7:	68 00 10 00 00       	push   $0x1000
  bc:	e8 19 04 00 00       	call   4da <shm_open>
      if (shmid == NULL) {
  c1:	83 c4 10             	add    $0x10,%esp
  c4:	85 c0                	test   %eax,%eax
  c6:	74 38                	je     100 <test_ipc+0x50>
    char *shmem = shm_attach((int)shmid);
  c8:	83 ec 0c             	sub    $0xc,%esp
  cb:	50                   	push   %eax
  cc:	e8 11 04 00 00       	call   4e2 <shm_attach>
        if (shmem == NULL) {
  d1:	83 c4 10             	add    $0x10,%esp
    char *shmem = shm_attach((int)shmid);
  d4:	89 c3                	mov    %eax,%ebx
        if (shmem == NULL) {
  d6:	85 c0                	test   %eax,%eax
  d8:	74 46                	je     120 <test_ipc+0x70>
    strcpy(shmem, "Message from Process A");
  da:	83 ec 08             	sub    $0x8,%esp
  dd:	68 22 09 00 00       	push   $0x922
  e2:	50                   	push   %eax
  e3:	e8 f8 00 00 00       	call   1e0 <strcpy>
    printf(1, "Message in shared memory: %s\n", shmem);
  e8:	83 c4 0c             	add    $0xc,%esp
  eb:	53                   	push   %ebx
  ec:	68 39 09 00 00       	push   $0x939
  f1:	6a 01                	push   $0x1
  f3:	e8 c8 04 00 00       	call   5c0 <printf>
}
  f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    printf(1, "Message in shared memory: %s\n", shmem);
  fb:	83 c4 10             	add    $0x10,%esp
}
  fe:	c9                   	leave
  ff:	c3                   	ret
        printf(1, "Shared memory allocation failed\n");
 100:	83 ec 08             	sub    $0x8,%esp
 103:	68 b0 09 00 00       	push   $0x9b0
 108:	6a 01                	push   $0x1
 10a:	e8 b1 04 00 00       	call   5c0 <printf>
}
 10f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
        return;
 112:	83 c4 10             	add    $0x10,%esp
}
 115:	c9                   	leave
 116:	c3                   	ret
 117:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 11e:	00 
 11f:	90                   	nop
        printf(1, "Failed to attach to shared memory\n");
 120:	83 ec 08             	sub    $0x8,%esp
 123:	68 d4 09 00 00       	push   $0x9d4
 128:	6a 01                	push   $0x1
 12a:	e8 91 04 00 00       	call   5c0 <printf>
}
 12f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
        printf(1, "Failed to attach to shared memory\n");
 132:	83 c4 10             	add    $0x10,%esp
}
 135:	c9                   	leave
 136:	c3                   	ret
 137:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 13e:	00 
 13f:	90                   	nop

00000140 <test_threads>:
void test_threads() {
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	83 ec 0c             	sub    $0xc,%esp
    int tid = thread_create(thread_func, (void *)1);
 147:	6a 01                	push   $0x1
 149:	68 40 00 00 00       	push   $0x40
 14e:	e8 97 03 00 00       	call   4ea <thread_create>
    if (tid < 0) {
 153:	83 c4 10             	add    $0x10,%esp
    int tid = thread_create(thread_func, (void *)1);
 156:	89 c3                	mov    %eax,%ebx
    if (tid < 0) {
 158:	85 c0                	test   %eax,%eax
 15a:	78 24                	js     180 <test_threads+0x40>
        printf(1, "Thread created with TID %d\n", tid);
 15c:	83 ec 04             	sub    $0x4,%esp
 15f:	50                   	push   %eax
 160:	68 6f 09 00 00       	push   $0x96f
 165:	6a 01                	push   $0x1
 167:	e8 54 04 00 00       	call   5c0 <printf>
 16c:	83 c4 10             	add    $0x10,%esp
    thread_join(tid);
 16f:	83 ec 0c             	sub    $0xc,%esp
 172:	53                   	push   %ebx
 173:	e8 7a 03 00 00       	call   4f2 <thread_join>
}
 178:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 17b:	83 c4 10             	add    $0x10,%esp
 17e:	c9                   	leave
 17f:	c3                   	ret
        printf(1, "Thread creation failed\n");
 180:	83 ec 08             	sub    $0x8,%esp
 183:	68 57 09 00 00       	push   $0x957
 188:	6a 01                	push   $0x1
 18a:	e8 31 04 00 00       	call   5c0 <printf>
 18f:	83 c4 10             	add    $0x10,%esp
 192:	eb db                	jmp    16f <test_threads+0x2f>
 194:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 19b:	00 
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001a0 <test_signal>:
void test_signal() {
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	53                   	push   %ebx
 1a4:	83 ec 04             	sub    $0x4,%esp
    int pid = getpid();  // Get the current process ID
 1a7:	e8 06 03 00 00       	call   4b2 <getpid>
    signal(pid, SIGUSR1);
 1ac:	83 ec 08             	sub    $0x8,%esp
 1af:	6a 01                	push   $0x1
    int pid = getpid();  // Get the current process ID
 1b1:	89 c3                	mov    %eax,%ebx
    signal(pid, SIGUSR1);
 1b3:	50                   	push   %eax
 1b4:	e8 51 03 00 00       	call   50a <signal>
    printf(1, "Signal sent to process %d\n", pid);
 1b9:	83 c4 0c             	add    $0xc,%esp
 1bc:	53                   	push   %ebx
 1bd:	68 8b 09 00 00       	push   $0x98b
 1c2:	6a 01                	push   $0x1
 1c4:	e8 f7 03 00 00       	call   5c0 <printf>
}
 1c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1cc:	83 c4 10             	add    $0x10,%esp
 1cf:	c9                   	leave
 1d0:	c3                   	ret
 1d1:	66 90                	xchg   %ax,%ax
 1d3:	66 90                	xchg   %ax,%ax
 1d5:	66 90                	xchg   %ax,%ax
 1d7:	66 90                	xchg   %ax,%ax
 1d9:	66 90                	xchg   %ax,%ax
 1db:	66 90                	xchg   %ax,%ax
 1dd:	66 90                	xchg   %ax,%ax
 1df:	90                   	nop

000001e0 <strcpy>:
#include "user.h"
#include "x86.h"

// String and memory utilities

char* strcpy(char *s, const char *t) {
 1e0:	55                   	push   %ebp
  char *os = s;
  while ((*s++ = *t++) != 0);
 1e1:	31 c0                	xor    %eax,%eax
char* strcpy(char *s, const char *t) {
 1e3:	89 e5                	mov    %esp,%ebp
 1e5:	53                   	push   %ebx
 1e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0);
 1f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1f7:	83 c0 01             	add    $0x1,%eax
 1fa:	84 d2                	test   %dl,%dl
 1fc:	75 f2                	jne    1f0 <strcpy+0x10>
  return os;
}
 1fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 201:	89 c8                	mov    %ecx,%eax
 203:	c9                   	leave
 204:	c3                   	ret
 205:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 20c:	00 
 20d:	8d 76 00             	lea    0x0(%esi),%esi

00000210 <strcmp>:

int strcmp(const char *p, const char *q) {
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 55 08             	mov    0x8(%ebp),%edx
 217:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
 21a:	0f b6 02             	movzbl (%edx),%eax
 21d:	84 c0                	test   %al,%al
 21f:	75 17                	jne    238 <strcmp+0x28>
 221:	eb 3a                	jmp    25d <strcmp+0x4d>
 223:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 228:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 22c:	83 c2 01             	add    $0x1,%edx
 22f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
 232:	84 c0                	test   %al,%al
 234:	74 1a                	je     250 <strcmp+0x40>
 236:	89 d9                	mov    %ebx,%ecx
 238:	0f b6 19             	movzbl (%ecx),%ebx
 23b:	38 c3                	cmp    %al,%bl
 23d:	74 e9                	je     228 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 23f:	29 d8                	sub    %ebx,%eax
}
 241:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 244:	c9                   	leave
 245:	c3                   	ret
 246:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 24d:	00 
 24e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 250:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 254:	31 c0                	xor    %eax,%eax
 256:	29 d8                	sub    %ebx,%eax
}
 258:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 25b:	c9                   	leave
 25c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 25d:	0f b6 19             	movzbl (%ecx),%ebx
 260:	31 c0                	xor    %eax,%eax
 262:	eb db                	jmp    23f <strcmp+0x2f>
 264:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 26b:	00 
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <strlen>:

uint strlen(const char *s) {
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;
  for (n = 0; s[n]; n++);
 276:	80 3a 00             	cmpb   $0x0,(%edx)
 279:	74 15                	je     290 <strlen+0x20>
 27b:	31 c0                	xor    %eax,%eax
 27d:	8d 76 00             	lea    0x0(%esi),%esi
 280:	83 c0 01             	add    $0x1,%eax
 283:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 287:	89 c1                	mov    %eax,%ecx
 289:	75 f5                	jne    280 <strlen+0x10>
  return n;
}
 28b:	89 c8                	mov    %ecx,%eax
 28d:	5d                   	pop    %ebp
 28e:	c3                   	ret
 28f:	90                   	nop
  for (n = 0; s[n]; n++);
 290:	31 c9                	xor    %ecx,%ecx
}
 292:	5d                   	pop    %ebp
 293:	89 c8                	mov    %ecx,%eax
 295:	c3                   	ret
 296:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 29d:	00 
 29e:	66 90                	xchg   %ax,%ax

000002a0 <memset>:

void* memset(void *dst, int c, uint n) {
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	8b 55 08             	mov    0x8(%ebp),%edx
               "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ad:	89 d7                	mov    %edx,%edi
 2af:	fc                   	cld
 2b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 2b5:	89 d0                	mov    %edx,%eax
 2b7:	c9                   	leave
 2b8:	c3                   	ret
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002c0 <strchr>:

char* strchr(const char *s, int c) {
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 45 08             	mov    0x8(%ebp),%eax
 2c6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  for (; *s; s++)
 2c9:	0f be 10             	movsbl (%eax),%edx
 2cc:	84 d2                	test   %dl,%dl
 2ce:	75 13                	jne    2e3 <strchr+0x23>
 2d0:	eb 1e                	jmp    2f0 <strchr+0x30>
 2d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2d8:	0f be 50 01          	movsbl 0x1(%eax),%edx
 2dc:	83 c0 01             	add    $0x1,%eax
 2df:	84 d2                	test   %dl,%dl
 2e1:	74 0d                	je     2f0 <strchr+0x30>
    if (*s == c)
 2e3:	39 ca                	cmp    %ecx,%edx
 2e5:	75 f1                	jne    2d8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2e7:	5d                   	pop    %ebp
 2e8:	c3                   	ret
 2e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2f0:	31 c0                	xor    %eax,%eax
}
 2f2:	5d                   	pop    %ebp
 2f3:	c3                   	ret
 2f4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2fb:	00 
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000300 <gets>:

char* gets(char *buf, int max) {
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	56                   	push   %esi
  int i, cc;
  char c;
  for (i = 0; i+1 < max;) {
    cc = read(0, &c, 1);
 305:	8d 75 e7             	lea    -0x19(%ebp),%esi
char* gets(char *buf, int max) {
 308:	53                   	push   %ebx
  for (i = 0; i+1 < max;) {
 309:	31 db                	xor    %ebx,%ebx
char* gets(char *buf, int max) {
 30b:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i+1 < max;) {
 30e:	eb 27                	jmp    337 <gets+0x37>
    cc = read(0, &c, 1);
 310:	83 ec 04             	sub    $0x4,%esp
 313:	6a 01                	push   $0x1
 315:	56                   	push   %esi
 316:	6a 00                	push   $0x0
 318:	e8 2d 01 00 00       	call   44a <read>
    if (cc < 1) break;
 31d:	83 c4 10             	add    $0x10,%esp
 320:	85 c0                	test   %eax,%eax
 322:	7e 1d                	jle    341 <gets+0x41>
    buf[i++] = c;
 324:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 328:	8b 55 08             	mov    0x8(%ebp),%edx
 32b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r') break;
 32f:	3c 0a                	cmp    $0xa,%al
 331:	74 10                	je     343 <gets+0x43>
 333:	3c 0d                	cmp    $0xd,%al
 335:	74 0c                	je     343 <gets+0x43>
  for (i = 0; i+1 < max;) {
 337:	89 df                	mov    %ebx,%edi
 339:	83 c3 01             	add    $0x1,%ebx
 33c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 33f:	7c cf                	jl     310 <gets+0x10>
 341:	89 fb                	mov    %edi,%ebx
  }
  buf[i] = '\0';
 343:	8b 45 08             	mov    0x8(%ebp),%eax
 346:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 34a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34d:	5b                   	pop    %ebx
 34e:	5e                   	pop    %esi
 34f:	5f                   	pop    %edi
 350:	5d                   	pop    %ebp
 351:	c3                   	ret
 352:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 359:	00 
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000360 <stat>:

int stat(const char *n, struct stat *st) {
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
  int fd, r;
  fd = open(n, O_RDONLY);
 365:	83 ec 08             	sub    $0x8,%esp
 368:	6a 00                	push   $0x0
 36a:	ff 75 08             	push   0x8(%ebp)
 36d:	e8 00 01 00 00       	call   472 <open>
  if (fd < 0) return -1;
 372:	83 c4 10             	add    $0x10,%esp
 375:	85 c0                	test   %eax,%eax
 377:	78 27                	js     3a0 <stat+0x40>
  r = fstat(fd, st);
 379:	83 ec 08             	sub    $0x8,%esp
 37c:	ff 75 0c             	push   0xc(%ebp)
 37f:	89 c3                	mov    %eax,%ebx
 381:	50                   	push   %eax
 382:	e8 03 01 00 00       	call   48a <fstat>
  close(fd);
 387:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 38a:	89 c6                	mov    %eax,%esi
  close(fd);
 38c:	e8 c9 00 00 00       	call   45a <close>
  return r;
 391:	83 c4 10             	add    $0x10,%esp
}
 394:	8d 65 f8             	lea    -0x8(%ebp),%esp
 397:	89 f0                	mov    %esi,%eax
 399:	5b                   	pop    %ebx
 39a:	5e                   	pop    %esi
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret
 39d:	8d 76 00             	lea    0x0(%esi),%esi
  if (fd < 0) return -1;
 3a0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3a5:	eb ed                	jmp    394 <stat+0x34>
 3a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ae:	00 
 3af:	90                   	nop

000003b0 <atoi>:

int atoi(const char *s) {
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	53                   	push   %ebx
 3b4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n = 0;
  while ('0' <= *s && *s <= '9')
 3b7:	0f be 02             	movsbl (%edx),%eax
 3ba:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3bd:	80 f9 09             	cmp    $0x9,%cl
  int n = 0;
 3c0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 3c5:	77 1e                	ja     3e5 <atoi+0x35>
 3c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ce:	00 
 3cf:	90                   	nop
    n = n*10 + *s++ - '0';
 3d0:	83 c2 01             	add    $0x1,%edx
 3d3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3d6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 3da:	0f be 02             	movsbl (%edx),%eax
 3dd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3e0:	80 fb 09             	cmp    $0x9,%bl
 3e3:	76 eb                	jbe    3d0 <atoi+0x20>
  return n;
}
 3e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3e8:	89 c8                	mov    %ecx,%eax
 3ea:	c9                   	leave
 3eb:	c3                   	ret
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003f0 <memmove>:

void* memmove(void *vdst, const void *vsrc, int n) {
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	8b 45 10             	mov    0x10(%ebp),%eax
 3f7:	8b 55 08             	mov    0x8(%ebp),%edx
 3fa:	56                   	push   %esi
 3fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst = vdst;
  const char *src = vsrc;
  while (n-- > 0)
 3fe:	85 c0                	test   %eax,%eax
 400:	7e 13                	jle    415 <memmove+0x25>
 402:	01 d0                	add    %edx,%eax
  char *dst = vdst;
 404:	89 d7                	mov    %edx,%edi
 406:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 40d:	00 
 40e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 410:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 411:	39 f8                	cmp    %edi,%eax
 413:	75 fb                	jne    410 <memmove+0x20>
  return vdst;
}
 415:	5e                   	pop    %esi
 416:	89 d0                	mov    %edx,%eax
 418:	5f                   	pop    %edi
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret
 41b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000420 <syscall>:

// Add syscall definition for internal use
int syscall(int num, ...) {
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
    int ret;
    asm volatile("int $64" : "=a" (ret) : "a" (num));
 423:	8b 45 08             	mov    0x8(%ebp),%eax
 426:	cd 40                	int    $0x40
    return ret;
}
 428:	5d                   	pop    %ebp
 429:	c3                   	ret

0000042a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 42a:	b8 01 00 00 00       	mov    $0x1,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret

00000432 <exit>:
SYSCALL(exit)
 432:	b8 02 00 00 00       	mov    $0x2,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret

0000043a <wait>:
SYSCALL(wait)
 43a:	b8 03 00 00 00       	mov    $0x3,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret

00000442 <pipe>:
SYSCALL(pipe)
 442:	b8 04 00 00 00       	mov    $0x4,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret

0000044a <read>:
SYSCALL(read)
 44a:	b8 05 00 00 00       	mov    $0x5,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret

00000452 <write>:
SYSCALL(write)
 452:	b8 10 00 00 00       	mov    $0x10,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret

0000045a <close>:
SYSCALL(close)
 45a:	b8 15 00 00 00       	mov    $0x15,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret

00000462 <kill>:
SYSCALL(kill)
 462:	b8 06 00 00 00       	mov    $0x6,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret

0000046a <exec>:
SYSCALL(exec)
 46a:	b8 07 00 00 00       	mov    $0x7,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret

00000472 <open>:
SYSCALL(open)
 472:	b8 0f 00 00 00       	mov    $0xf,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret

0000047a <mknod>:
SYSCALL(mknod)
 47a:	b8 11 00 00 00       	mov    $0x11,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret

00000482 <unlink>:
SYSCALL(unlink)
 482:	b8 12 00 00 00       	mov    $0x12,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret

0000048a <fstat>:
SYSCALL(fstat)
 48a:	b8 08 00 00 00       	mov    $0x8,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret

00000492 <link>:
SYSCALL(link)
 492:	b8 13 00 00 00       	mov    $0x13,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret

0000049a <mkdir>:
SYSCALL(mkdir)
 49a:	b8 14 00 00 00       	mov    $0x14,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret

000004a2 <chdir>:
SYSCALL(chdir)
 4a2:	b8 09 00 00 00       	mov    $0x9,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret

000004aa <dup>:
SYSCALL(dup)
 4aa:	b8 0a 00 00 00       	mov    $0xa,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret

000004b2 <getpid>:
SYSCALL(getpid)
 4b2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret

000004ba <sbrk>:
SYSCALL(sbrk)
 4ba:	b8 0c 00 00 00       	mov    $0xc,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret

000004c2 <sleep>:
SYSCALL(sleep)
 4c2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret

000004ca <uptime>:
SYSCALL(uptime)
 4ca:	b8 0e 00 00 00       	mov    $0xe,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret

000004d2 <spawn>:
SYSCALL(spawn)
 4d2:	b8 16 00 00 00       	mov    $0x16,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret

000004da <shm_open>:
SYSCALL(shm_open)
 4da:	b8 17 00 00 00       	mov    $0x17,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret

000004e2 <shm_attach>:
SYSCALL(shm_attach)
 4e2:	b8 18 00 00 00       	mov    $0x18,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret

000004ea <thread_create>:
SYSCALL(thread_create)
 4ea:	b8 19 00 00 00       	mov    $0x19,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret

000004f2 <thread_join>:
SYSCALL(thread_join)
 4f2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret

000004fa <mutex_lock>:
SYSCALL(mutex_lock)
 4fa:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret

00000502 <mutex_unlock>:
SYSCALL(mutex_unlock)
 502:	b8 1c 00 00 00       	mov    $0x1c,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret

0000050a <signal>:
SYSCALL(signal)
 50a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret
 512:	66 90                	xchg   %ax,%ax
 514:	66 90                	xchg   %ax,%ax
 516:	66 90                	xchg   %ax,%ax
 518:	66 90                	xchg   %ax,%ax
 51a:	66 90                	xchg   %ax,%ax
 51c:	66 90                	xchg   %ax,%ax
 51e:	66 90                	xchg   %ax,%ax

00000520 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 528:	89 d1                	mov    %edx,%ecx
{
 52a:	83 ec 3c             	sub    $0x3c,%esp
 52d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 530:	85 d2                	test   %edx,%edx
 532:	0f 89 80 00 00 00    	jns    5b8 <printint+0x98>
 538:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 53c:	74 7a                	je     5b8 <printint+0x98>
    x = -xx;
 53e:	f7 d9                	neg    %ecx
    neg = 1;
 540:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 545:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 548:	31 f6                	xor    %esi,%esi
 54a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 550:	89 c8                	mov    %ecx,%eax
 552:	31 d2                	xor    %edx,%edx
 554:	89 f7                	mov    %esi,%edi
 556:	f7 f3                	div    %ebx
 558:	8d 76 01             	lea    0x1(%esi),%esi
 55b:	0f b6 92 70 0a 00 00 	movzbl 0xa70(%edx),%edx
 562:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 566:	89 ca                	mov    %ecx,%edx
 568:	89 c1                	mov    %eax,%ecx
 56a:	39 da                	cmp    %ebx,%edx
 56c:	73 e2                	jae    550 <printint+0x30>
  if(neg)
 56e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 571:	85 c0                	test   %eax,%eax
 573:	74 07                	je     57c <printint+0x5c>
    buf[i++] = '-';
 575:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 57a:	89 f7                	mov    %esi,%edi
 57c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 57f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 582:	01 df                	add    %ebx,%edi
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 588:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 58b:	83 ec 04             	sub    $0x4,%esp
 58e:	88 45 d7             	mov    %al,-0x29(%ebp)
 591:	8d 45 d7             	lea    -0x29(%ebp),%eax
 594:	6a 01                	push   $0x1
 596:	50                   	push   %eax
 597:	56                   	push   %esi
 598:	e8 b5 fe ff ff       	call   452 <write>
  while(--i >= 0)
 59d:	89 f8                	mov    %edi,%eax
 59f:	83 c4 10             	add    $0x10,%esp
 5a2:	83 ef 01             	sub    $0x1,%edi
 5a5:	39 c3                	cmp    %eax,%ebx
 5a7:	75 df                	jne    588 <printint+0x68>
}
 5a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ac:	5b                   	pop    %ebx
 5ad:	5e                   	pop    %esi
 5ae:	5f                   	pop    %edi
 5af:	5d                   	pop    %ebp
 5b0:	c3                   	ret
 5b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5b8:	31 c0                	xor    %eax,%eax
 5ba:	eb 89                	jmp    545 <printint+0x25>
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 5cc:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 5cf:	0f b6 1e             	movzbl (%esi),%ebx
 5d2:	83 c6 01             	add    $0x1,%esi
 5d5:	84 db                	test   %bl,%bl
 5d7:	74 67                	je     640 <printf+0x80>
 5d9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 5dc:	31 d2                	xor    %edx,%edx
 5de:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 5e1:	eb 34                	jmp    617 <printf+0x57>
 5e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 5e8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5eb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5f0:	83 f8 25             	cmp    $0x25,%eax
 5f3:	74 18                	je     60d <printf+0x4d>
  write(fd, &c, 1);
 5f5:	83 ec 04             	sub    $0x4,%esp
 5f8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5fb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5fe:	6a 01                	push   $0x1
 600:	50                   	push   %eax
 601:	57                   	push   %edi
 602:	e8 4b fe ff ff       	call   452 <write>
 607:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 60a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 60d:	0f b6 1e             	movzbl (%esi),%ebx
 610:	83 c6 01             	add    $0x1,%esi
 613:	84 db                	test   %bl,%bl
 615:	74 29                	je     640 <printf+0x80>
    c = fmt[i] & 0xff;
 617:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 61a:	85 d2                	test   %edx,%edx
 61c:	74 ca                	je     5e8 <printf+0x28>
      }
    } else if(state == '%'){
 61e:	83 fa 25             	cmp    $0x25,%edx
 621:	75 ea                	jne    60d <printf+0x4d>
      if(c == 'd'){
 623:	83 f8 25             	cmp    $0x25,%eax
 626:	0f 84 04 01 00 00    	je     730 <printf+0x170>
 62c:	83 e8 63             	sub    $0x63,%eax
 62f:	83 f8 15             	cmp    $0x15,%eax
 632:	77 1c                	ja     650 <printf+0x90>
 634:	ff 24 85 18 0a 00 00 	jmp    *0xa18(,%eax,4)
 63b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 640:	8d 65 f4             	lea    -0xc(%ebp),%esp
 643:	5b                   	pop    %ebx
 644:	5e                   	pop    %esi
 645:	5f                   	pop    %edi
 646:	5d                   	pop    %ebp
 647:	c3                   	ret
 648:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 64f:	00 
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
 653:	8d 55 e7             	lea    -0x19(%ebp),%edx
 656:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 65a:	6a 01                	push   $0x1
 65c:	52                   	push   %edx
 65d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 660:	57                   	push   %edi
 661:	e8 ec fd ff ff       	call   452 <write>
 666:	83 c4 0c             	add    $0xc,%esp
 669:	88 5d e7             	mov    %bl,-0x19(%ebp)
 66c:	6a 01                	push   $0x1
 66e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 671:	52                   	push   %edx
 672:	57                   	push   %edi
 673:	e8 da fd ff ff       	call   452 <write>
        putc(fd, c);
 678:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67b:	31 d2                	xor    %edx,%edx
 67d:	eb 8e                	jmp    60d <printf+0x4d>
 67f:	90                   	nop
        printint(fd, *ap, 16, 0);
 680:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 683:	83 ec 0c             	sub    $0xc,%esp
 686:	b9 10 00 00 00       	mov    $0x10,%ecx
 68b:	8b 13                	mov    (%ebx),%edx
 68d:	6a 00                	push   $0x0
 68f:	89 f8                	mov    %edi,%eax
        ap++;
 691:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 694:	e8 87 fe ff ff       	call   520 <printint>
        ap++;
 699:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 69c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 69f:	31 d2                	xor    %edx,%edx
 6a1:	e9 67 ff ff ff       	jmp    60d <printf+0x4d>
        s = (char*)*ap;
 6a6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6a9:	8b 18                	mov    (%eax),%ebx
        ap++;
 6ab:	83 c0 04             	add    $0x4,%eax
 6ae:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6b1:	85 db                	test   %ebx,%ebx
 6b3:	0f 84 87 00 00 00    	je     740 <printf+0x180>
        while(*s != 0){
 6b9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 6bc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 6be:	84 c0                	test   %al,%al
 6c0:	0f 84 47 ff ff ff    	je     60d <printf+0x4d>
 6c6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 6c9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 6cc:	89 de                	mov    %ebx,%esi
 6ce:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 6d0:	83 ec 04             	sub    $0x4,%esp
 6d3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 6d6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6d9:	6a 01                	push   $0x1
 6db:	53                   	push   %ebx
 6dc:	57                   	push   %edi
 6dd:	e8 70 fd ff ff       	call   452 <write>
        while(*s != 0){
 6e2:	0f b6 06             	movzbl (%esi),%eax
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	84 c0                	test   %al,%al
 6ea:	75 e4                	jne    6d0 <printf+0x110>
      state = 0;
 6ec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 6ef:	31 d2                	xor    %edx,%edx
 6f1:	e9 17 ff ff ff       	jmp    60d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 6f6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6f9:	83 ec 0c             	sub    $0xc,%esp
 6fc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 701:	8b 13                	mov    (%ebx),%edx
 703:	6a 01                	push   $0x1
 705:	eb 88                	jmp    68f <printf+0xcf>
        putc(fd, *ap);
 707:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 70a:	83 ec 04             	sub    $0x4,%esp
 70d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 710:	8b 03                	mov    (%ebx),%eax
        ap++;
 712:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 715:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 718:	6a 01                	push   $0x1
 71a:	52                   	push   %edx
 71b:	57                   	push   %edi
 71c:	e8 31 fd ff ff       	call   452 <write>
        ap++;
 721:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 724:	83 c4 10             	add    $0x10,%esp
      state = 0;
 727:	31 d2                	xor    %edx,%edx
 729:	e9 df fe ff ff       	jmp    60d <printf+0x4d>
 72e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 730:	83 ec 04             	sub    $0x4,%esp
 733:	88 5d e7             	mov    %bl,-0x19(%ebp)
 736:	8d 55 e7             	lea    -0x19(%ebp),%edx
 739:	6a 01                	push   $0x1
 73b:	e9 31 ff ff ff       	jmp    671 <printf+0xb1>
 740:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 745:	bb a6 09 00 00       	mov    $0x9a6,%ebx
 74a:	e9 77 ff ff ff       	jmp    6c6 <printf+0x106>
 74f:	90                   	nop

00000750 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 750:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 751:	a1 00 0e 00 00       	mov    0xe00,%eax
{
 756:	89 e5                	mov    %esp,%ebp
 758:	57                   	push   %edi
 759:	56                   	push   %esi
 75a:	53                   	push   %ebx
 75b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 75e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 768:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76a:	39 c8                	cmp    %ecx,%eax
 76c:	73 32                	jae    7a0 <free+0x50>
 76e:	39 d1                	cmp    %edx,%ecx
 770:	72 04                	jb     776 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 772:	39 d0                	cmp    %edx,%eax
 774:	72 32                	jb     7a8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 776:	8b 73 fc             	mov    -0x4(%ebx),%esi
 779:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 77c:	39 fa                	cmp    %edi,%edx
 77e:	74 30                	je     7b0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 780:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 783:	8b 50 04             	mov    0x4(%eax),%edx
 786:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 789:	39 f1                	cmp    %esi,%ecx
 78b:	74 3a                	je     7c7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 78d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 78f:	5b                   	pop    %ebx
  freep = p;
 790:	a3 00 0e 00 00       	mov    %eax,0xe00
}
 795:	5e                   	pop    %esi
 796:	5f                   	pop    %edi
 797:	5d                   	pop    %ebp
 798:	c3                   	ret
 799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a0:	39 d0                	cmp    %edx,%eax
 7a2:	72 04                	jb     7a8 <free+0x58>
 7a4:	39 d1                	cmp    %edx,%ecx
 7a6:	72 ce                	jb     776 <free+0x26>
{
 7a8:	89 d0                	mov    %edx,%eax
 7aa:	eb bc                	jmp    768 <free+0x18>
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 7b0:	03 72 04             	add    0x4(%edx),%esi
 7b3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7b6:	8b 10                	mov    (%eax),%edx
 7b8:	8b 12                	mov    (%edx),%edx
 7ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7bd:	8b 50 04             	mov    0x4(%eax),%edx
 7c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7c3:	39 f1                	cmp    %esi,%ecx
 7c5:	75 c6                	jne    78d <free+0x3d>
    p->s.size += bp->s.size;
 7c7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7ca:	a3 00 0e 00 00       	mov    %eax,0xe00
    p->s.size += bp->s.size;
 7cf:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7d2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7d5:	89 08                	mov    %ecx,(%eax)
}
 7d7:	5b                   	pop    %ebx
 7d8:	5e                   	pop    %esi
 7d9:	5f                   	pop    %edi
 7da:	5d                   	pop    %ebp
 7db:	c3                   	ret
 7dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	57                   	push   %edi
 7e4:	56                   	push   %esi
 7e5:	53                   	push   %ebx
 7e6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7ec:	8b 15 00 0e 00 00    	mov    0xe00,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f2:	8d 78 07             	lea    0x7(%eax),%edi
 7f5:	c1 ef 03             	shr    $0x3,%edi
 7f8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7fb:	85 d2                	test   %edx,%edx
 7fd:	0f 84 8d 00 00 00    	je     890 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 803:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 805:	8b 48 04             	mov    0x4(%eax),%ecx
 808:	39 f9                	cmp    %edi,%ecx
 80a:	73 64                	jae    870 <malloc+0x90>
  if(nu < 4096)
 80c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 811:	39 df                	cmp    %ebx,%edi
 813:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 816:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 81d:	eb 0a                	jmp    829 <malloc+0x49>
 81f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 820:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 822:	8b 48 04             	mov    0x4(%eax),%ecx
 825:	39 f9                	cmp    %edi,%ecx
 827:	73 47                	jae    870 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 829:	89 c2                	mov    %eax,%edx
 82b:	3b 05 00 0e 00 00    	cmp    0xe00,%eax
 831:	75 ed                	jne    820 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 833:	83 ec 0c             	sub    $0xc,%esp
 836:	56                   	push   %esi
 837:	e8 7e fc ff ff       	call   4ba <sbrk>
  if(p == (char*)-1)
 83c:	83 c4 10             	add    $0x10,%esp
 83f:	83 f8 ff             	cmp    $0xffffffff,%eax
 842:	74 1c                	je     860 <malloc+0x80>
  hp->s.size = nu;
 844:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 847:	83 ec 0c             	sub    $0xc,%esp
 84a:	83 c0 08             	add    $0x8,%eax
 84d:	50                   	push   %eax
 84e:	e8 fd fe ff ff       	call   750 <free>
  return freep;
 853:	8b 15 00 0e 00 00    	mov    0xe00,%edx
      if((p = morecore(nunits)) == 0)
 859:	83 c4 10             	add    $0x10,%esp
 85c:	85 d2                	test   %edx,%edx
 85e:	75 c0                	jne    820 <malloc+0x40>
        return 0;
  }
}
 860:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 863:	31 c0                	xor    %eax,%eax
}
 865:	5b                   	pop    %ebx
 866:	5e                   	pop    %esi
 867:	5f                   	pop    %edi
 868:	5d                   	pop    %ebp
 869:	c3                   	ret
 86a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 870:	39 cf                	cmp    %ecx,%edi
 872:	74 4c                	je     8c0 <malloc+0xe0>
        p->s.size -= nunits;
 874:	29 f9                	sub    %edi,%ecx
 876:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 879:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 87c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 87f:	89 15 00 0e 00 00    	mov    %edx,0xe00
}
 885:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 888:	83 c0 08             	add    $0x8,%eax
}
 88b:	5b                   	pop    %ebx
 88c:	5e                   	pop    %esi
 88d:	5f                   	pop    %edi
 88e:	5d                   	pop    %ebp
 88f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 890:	c7 05 00 0e 00 00 04 	movl   $0xe04,0xe00
 897:	0e 00 00 
    base.s.size = 0;
 89a:	b8 04 0e 00 00       	mov    $0xe04,%eax
    base.s.ptr = freep = prevp = &base;
 89f:	c7 05 04 0e 00 00 04 	movl   $0xe04,0xe04
 8a6:	0e 00 00 
    base.s.size = 0;
 8a9:	c7 05 08 0e 00 00 00 	movl   $0x0,0xe08
 8b0:	00 00 00 
    if(p->s.size >= nunits){
 8b3:	e9 54 ff ff ff       	jmp    80c <malloc+0x2c>
 8b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 8bf:	00 
        prevp->s.ptr = p->s.ptr;
 8c0:	8b 08                	mov    (%eax),%ecx
 8c2:	89 0a                	mov    %ecx,(%edx)
 8c4:	eb b9                	jmp    87f <malloc+0x9f>
