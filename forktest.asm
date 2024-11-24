
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  forktest();
  11:	e8 3a 00 00 00       	call   50 <forktest>
  exit(0);
  16:	83 ec 0c             	sub    $0xc,%esp
  19:	6a 00                	push   $0x0
  1b:	e8 82 03 00 00       	call   3a2 <exit>

00000020 <printf>:
{
  20:	55                   	push   %ebp
  21:	89 e5                	mov    %esp,%ebp
  23:	53                   	push   %ebx
  24:	83 ec 10             	sub    $0x10,%esp
  27:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  2a:	53                   	push   %ebx
  2b:	e8 b0 01 00 00       	call   1e0 <strlen>
  30:	83 c4 0c             	add    $0xc,%esp
  33:	50                   	push   %eax
  34:	53                   	push   %ebx
  35:	ff 75 08             	push   0x8(%ebp)
  38:	e8 85 03 00 00       	call   3c2 <write>
}
  3d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  40:	83 c4 10             	add    $0x10,%esp
  43:	c9                   	leave
  44:	c3                   	ret
  45:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  4c:	00 
  4d:	8d 76 00             	lea    0x0(%esi),%esi

00000050 <forktest>:
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	53                   	push   %ebx
  for(n=0; n<N; n++){
  54:	31 db                	xor    %ebx,%ebx
{
  56:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
  59:	68 84 04 00 00       	push   $0x484
  5e:	e8 7d 01 00 00       	call   1e0 <strlen>
  63:	83 c4 0c             	add    $0xc,%esp
  66:	50                   	push   %eax
  67:	68 84 04 00 00       	push   $0x484
  6c:	6a 01                	push   $0x1
  6e:	e8 4f 03 00 00       	call   3c2 <write>
  73:	83 c4 10             	add    $0x10,%esp
  76:	eb 19                	jmp    91 <forktest+0x41>
  78:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  7f:	00 
    if(pid == 0)
  80:	74 58                	je     da <forktest+0x8a>
  for(n=0; n<N; n++){
  82:	83 c3 01             	add    $0x1,%ebx
  85:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  8b:	0f 84 94 00 00 00    	je     125 <forktest+0xd5>
    pid = fork();
  91:	e8 04 03 00 00       	call   39a <fork>
    if(pid < 0)
  96:	85 c0                	test   %eax,%eax
  98:	79 e6                	jns    80 <forktest+0x30>
  for(; n > 0; n--){
  9a:	85 db                	test   %ebx,%ebx
  9c:	74 10                	je     ae <forktest+0x5e>
  9e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  a0:	e8 05 03 00 00       	call   3aa <wait>
  a5:	85 c0                	test   %eax,%eax
  a7:	78 3b                	js     e4 <forktest+0x94>
  for(; n > 0; n--){
  a9:	83 eb 01             	sub    $0x1,%ebx
  ac:	75 f2                	jne    a0 <forktest+0x50>
  if(wait() != -1){
  ae:	e8 f7 02 00 00       	call   3aa <wait>
  b3:	83 f8 ff             	cmp    $0xffffffff,%eax
  b6:	75 55                	jne    10d <forktest+0xbd>
  write(fd, s, strlen(s));
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	68 b6 04 00 00       	push   $0x4b6
  c0:	e8 1b 01 00 00       	call   1e0 <strlen>
  c5:	83 c4 0c             	add    $0xc,%esp
  c8:	50                   	push   %eax
  c9:	68 b6 04 00 00       	push   $0x4b6
  ce:	6a 01                	push   $0x1
  d0:	e8 ed 02 00 00       	call   3c2 <write>
}
  d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d8:	c9                   	leave
  d9:	c3                   	ret
      exit(0);
  da:	83 ec 0c             	sub    $0xc,%esp
  dd:	6a 00                	push   $0x0
  df:	e8 be 02 00 00       	call   3a2 <exit>
  write(fd, s, strlen(s));
  e4:	83 ec 0c             	sub    $0xc,%esp
  e7:	68 8f 04 00 00       	push   $0x48f
  ec:	e8 ef 00 00 00       	call   1e0 <strlen>
  f1:	83 c4 0c             	add    $0xc,%esp
  f4:	50                   	push   %eax
  f5:	68 8f 04 00 00       	push   $0x48f
  fa:	6a 01                	push   $0x1
  fc:	e8 c1 02 00 00       	call   3c2 <write>
      exit(0);
 101:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 108:	e8 95 02 00 00       	call   3a2 <exit>
    printf(1, "wait got too many\n");
 10d:	51                   	push   %ecx
    exit(0);
 10e:	31 db                	xor    %ebx,%ebx
    printf(1, "wait got too many\n");
 110:	51                   	push   %ecx
 111:	68 a3 04 00 00       	push   $0x4a3
 116:	6a 01                	push   $0x1
 118:	e8 03 ff ff ff       	call   20 <printf>
    exit(0);
 11d:	89 1c 24             	mov    %ebx,(%esp)
 120:	e8 7d 02 00 00       	call   3a2 <exit>
    printf(1, "fork claimed to work N times!\n", N);
 125:	50                   	push   %eax
 126:	68 e8 03 00 00       	push   $0x3e8
 12b:	68 c4 04 00 00       	push   $0x4c4
 130:	6a 01                	push   $0x1
 132:	e8 e9 fe ff ff       	call   20 <printf>
    exit(0);
 137:	31 d2                	xor    %edx,%edx
 139:	89 14 24             	mov    %edx,(%esp)
 13c:	e8 61 02 00 00       	call   3a2 <exit>
 141:	66 90                	xchg   %ax,%ax
 143:	66 90                	xchg   %ax,%ax
 145:	66 90                	xchg   %ax,%ax
 147:	66 90                	xchg   %ax,%ax
 149:	66 90                	xchg   %ax,%ax
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <strcpy>:
#include "user.h"
#include "x86.h"

// String and memory utilities

char* strcpy(char *s, const char *t) {
 150:	55                   	push   %ebp
  char *os = s;
  while ((*s++ = *t++) != 0);
 151:	31 c0                	xor    %eax,%eax
char* strcpy(char *s, const char *t) {
 153:	89 e5                	mov    %esp,%ebp
 155:	53                   	push   %ebx
 156:	8b 4d 08             	mov    0x8(%ebp),%ecx
 159:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0);
 160:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 164:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 167:	83 c0 01             	add    $0x1,%eax
 16a:	84 d2                	test   %dl,%dl
 16c:	75 f2                	jne    160 <strcpy+0x10>
  return os;
}
 16e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 171:	89 c8                	mov    %ecx,%eax
 173:	c9                   	leave
 174:	c3                   	ret
 175:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 17c:	00 
 17d:	8d 76 00             	lea    0x0(%esi),%esi

00000180 <strcmp>:

int strcmp(const char *p, const char *q) {
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	53                   	push   %ebx
 184:	8b 55 08             	mov    0x8(%ebp),%edx
 187:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
 18a:	0f b6 02             	movzbl (%edx),%eax
 18d:	84 c0                	test   %al,%al
 18f:	75 17                	jne    1a8 <strcmp+0x28>
 191:	eb 3a                	jmp    1cd <strcmp+0x4d>
 193:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 198:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 19c:	83 c2 01             	add    $0x1,%edx
 19f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
 1a2:	84 c0                	test   %al,%al
 1a4:	74 1a                	je     1c0 <strcmp+0x40>
 1a6:	89 d9                	mov    %ebx,%ecx
 1a8:	0f b6 19             	movzbl (%ecx),%ebx
 1ab:	38 c3                	cmp    %al,%bl
 1ad:	74 e9                	je     198 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1af:	29 d8                	sub    %ebx,%eax
}
 1b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1b4:	c9                   	leave
 1b5:	c3                   	ret
 1b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1bd:	00 
 1be:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 1c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1c4:	31 c0                	xor    %eax,%eax
 1c6:	29 d8                	sub    %ebx,%eax
}
 1c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1cb:	c9                   	leave
 1cc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 1cd:	0f b6 19             	movzbl (%ecx),%ebx
 1d0:	31 c0                	xor    %eax,%eax
 1d2:	eb db                	jmp    1af <strcmp+0x2f>
 1d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1db:	00 
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001e0 <strlen>:

uint strlen(const char *s) {
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;
  for (n = 0; s[n]; n++);
 1e6:	80 3a 00             	cmpb   $0x0,(%edx)
 1e9:	74 15                	je     200 <strlen+0x20>
 1eb:	31 c0                	xor    %eax,%eax
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
 1f0:	83 c0 01             	add    $0x1,%eax
 1f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1f7:	89 c1                	mov    %eax,%ecx
 1f9:	75 f5                	jne    1f0 <strlen+0x10>
  return n;
}
 1fb:	89 c8                	mov    %ecx,%eax
 1fd:	5d                   	pop    %ebp
 1fe:	c3                   	ret
 1ff:	90                   	nop
  for (n = 0; s[n]; n++);
 200:	31 c9                	xor    %ecx,%ecx
}
 202:	5d                   	pop    %ebp
 203:	89 c8                	mov    %ecx,%eax
 205:	c3                   	ret
 206:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 20d:	00 
 20e:	66 90                	xchg   %ax,%ax

00000210 <memset>:

void* memset(void *dst, int c, uint n) {
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	8b 55 08             	mov    0x8(%ebp),%edx
               "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 217:	8b 4d 10             	mov    0x10(%ebp),%ecx
 21a:	8b 45 0c             	mov    0xc(%ebp),%eax
 21d:	89 d7                	mov    %edx,%edi
 21f:	fc                   	cld
 220:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 222:	8b 7d fc             	mov    -0x4(%ebp),%edi
 225:	89 d0                	mov    %edx,%eax
 227:	c9                   	leave
 228:	c3                   	ret
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000230 <strchr>:

char* strchr(const char *s, int c) {
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  for (; *s; s++)
 239:	0f be 10             	movsbl (%eax),%edx
 23c:	84 d2                	test   %dl,%dl
 23e:	75 13                	jne    253 <strchr+0x23>
 240:	eb 1e                	jmp    260 <strchr+0x30>
 242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 248:	0f be 50 01          	movsbl 0x1(%eax),%edx
 24c:	83 c0 01             	add    $0x1,%eax
 24f:	84 d2                	test   %dl,%dl
 251:	74 0d                	je     260 <strchr+0x30>
    if (*s == c)
 253:	39 ca                	cmp    %ecx,%edx
 255:	75 f1                	jne    248 <strchr+0x18>
      return (char*)s;
  return 0;
}
 257:	5d                   	pop    %ebp
 258:	c3                   	ret
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 260:	31 c0                	xor    %eax,%eax
}
 262:	5d                   	pop    %ebp
 263:	c3                   	ret
 264:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 26b:	00 
 26c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000270 <gets>:

char* gets(char *buf, int max) {
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
  int i, cc;
  char c;
  for (i = 0; i+1 < max;) {
    cc = read(0, &c, 1);
 275:	8d 75 e7             	lea    -0x19(%ebp),%esi
char* gets(char *buf, int max) {
 278:	53                   	push   %ebx
  for (i = 0; i+1 < max;) {
 279:	31 db                	xor    %ebx,%ebx
char* gets(char *buf, int max) {
 27b:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i+1 < max;) {
 27e:	eb 27                	jmp    2a7 <gets+0x37>
    cc = read(0, &c, 1);
 280:	83 ec 04             	sub    $0x4,%esp
 283:	6a 01                	push   $0x1
 285:	56                   	push   %esi
 286:	6a 00                	push   $0x0
 288:	e8 2d 01 00 00       	call   3ba <read>
    if (cc < 1) break;
 28d:	83 c4 10             	add    $0x10,%esp
 290:	85 c0                	test   %eax,%eax
 292:	7e 1d                	jle    2b1 <gets+0x41>
    buf[i++] = c;
 294:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 298:	8b 55 08             	mov    0x8(%ebp),%edx
 29b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r') break;
 29f:	3c 0a                	cmp    $0xa,%al
 2a1:	74 10                	je     2b3 <gets+0x43>
 2a3:	3c 0d                	cmp    $0xd,%al
 2a5:	74 0c                	je     2b3 <gets+0x43>
  for (i = 0; i+1 < max;) {
 2a7:	89 df                	mov    %ebx,%edi
 2a9:	83 c3 01             	add    $0x1,%ebx
 2ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2af:	7c cf                	jl     280 <gets+0x10>
 2b1:	89 fb                	mov    %edi,%ebx
  }
  buf[i] = '\0';
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 2ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2bd:	5b                   	pop    %ebx
 2be:	5e                   	pop    %esi
 2bf:	5f                   	pop    %edi
 2c0:	5d                   	pop    %ebp
 2c1:	c3                   	ret
 2c2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2c9:	00 
 2ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000002d0 <stat>:

int stat(const char *n, struct stat *st) {
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
  int fd, r;
  fd = open(n, O_RDONLY);
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	6a 00                	push   $0x0
 2da:	ff 75 08             	push   0x8(%ebp)
 2dd:	e8 00 01 00 00       	call   3e2 <open>
  if (fd < 0) return -1;
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	85 c0                	test   %eax,%eax
 2e7:	78 27                	js     310 <stat+0x40>
  r = fstat(fd, st);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	ff 75 0c             	push   0xc(%ebp)
 2ef:	89 c3                	mov    %eax,%ebx
 2f1:	50                   	push   %eax
 2f2:	e8 03 01 00 00       	call   3fa <fstat>
  close(fd);
 2f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2fa:	89 c6                	mov    %eax,%esi
  close(fd);
 2fc:	e8 c9 00 00 00       	call   3ca <close>
  return r;
 301:	83 c4 10             	add    $0x10,%esp
}
 304:	8d 65 f8             	lea    -0x8(%ebp),%esp
 307:	89 f0                	mov    %esi,%eax
 309:	5b                   	pop    %ebx
 30a:	5e                   	pop    %esi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret
 30d:	8d 76 00             	lea    0x0(%esi),%esi
  if (fd < 0) return -1;
 310:	be ff ff ff ff       	mov    $0xffffffff,%esi
 315:	eb ed                	jmp    304 <stat+0x34>
 317:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 31e:	00 
 31f:	90                   	nop

00000320 <atoi>:

int atoi(const char *s) {
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 55 08             	mov    0x8(%ebp),%edx
  int n = 0;
  while ('0' <= *s && *s <= '9')
 327:	0f be 02             	movsbl (%edx),%eax
 32a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 32d:	80 f9 09             	cmp    $0x9,%cl
  int n = 0;
 330:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 335:	77 1e                	ja     355 <atoi+0x35>
 337:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 33e:	00 
 33f:	90                   	nop
    n = n*10 + *s++ - '0';
 340:	83 c2 01             	add    $0x1,%edx
 343:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 346:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 34a:	0f be 02             	movsbl (%edx),%eax
 34d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 eb                	jbe    340 <atoi+0x20>
  return n;
}
 355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 358:	89 c8                	mov    %ecx,%eax
 35a:	c9                   	leave
 35b:	c3                   	ret
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000360 <memmove>:

void* memmove(void *vdst, const void *vsrc, int n) {
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	8b 45 10             	mov    0x10(%ebp),%eax
 367:	8b 55 08             	mov    0x8(%ebp),%edx
 36a:	56                   	push   %esi
 36b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst = vdst;
  const char *src = vsrc;
  while (n-- > 0)
 36e:	85 c0                	test   %eax,%eax
 370:	7e 13                	jle    385 <memmove+0x25>
 372:	01 d0                	add    %edx,%eax
  char *dst = vdst;
 374:	89 d7                	mov    %edx,%edi
 376:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 37d:	00 
 37e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 380:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 381:	39 f8                	cmp    %edi,%eax
 383:	75 fb                	jne    380 <memmove+0x20>
  return vdst;
}
 385:	5e                   	pop    %esi
 386:	89 d0                	mov    %edx,%eax
 388:	5f                   	pop    %edi
 389:	5d                   	pop    %ebp
 38a:	c3                   	ret
 38b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000390 <syscall>:

// Add syscall definition for internal use
int syscall(int num, ...) {
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
    int ret;
    asm volatile("int $64" : "=a" (ret) : "a" (num));
 393:	8b 45 08             	mov    0x8(%ebp),%eax
 396:	cd 40                	int    $0x40
    return ret;
}
 398:	5d                   	pop    %ebp
 399:	c3                   	ret

0000039a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 39a:	b8 01 00 00 00       	mov    $0x1,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret

000003a2 <exit>:
SYSCALL(exit)
 3a2:	b8 02 00 00 00       	mov    $0x2,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret

000003aa <wait>:
SYSCALL(wait)
 3aa:	b8 03 00 00 00       	mov    $0x3,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret

000003b2 <pipe>:
SYSCALL(pipe)
 3b2:	b8 04 00 00 00       	mov    $0x4,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret

000003ba <read>:
SYSCALL(read)
 3ba:	b8 05 00 00 00       	mov    $0x5,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret

000003c2 <write>:
SYSCALL(write)
 3c2:	b8 10 00 00 00       	mov    $0x10,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret

000003ca <close>:
SYSCALL(close)
 3ca:	b8 15 00 00 00       	mov    $0x15,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret

000003d2 <kill>:
SYSCALL(kill)
 3d2:	b8 06 00 00 00       	mov    $0x6,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret

000003da <exec>:
SYSCALL(exec)
 3da:	b8 07 00 00 00       	mov    $0x7,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret

000003e2 <open>:
SYSCALL(open)
 3e2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret

000003ea <mknod>:
SYSCALL(mknod)
 3ea:	b8 11 00 00 00       	mov    $0x11,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret

000003f2 <unlink>:
SYSCALL(unlink)
 3f2:	b8 12 00 00 00       	mov    $0x12,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret

000003fa <fstat>:
SYSCALL(fstat)
 3fa:	b8 08 00 00 00       	mov    $0x8,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret

00000402 <link>:
SYSCALL(link)
 402:	b8 13 00 00 00       	mov    $0x13,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret

0000040a <mkdir>:
SYSCALL(mkdir)
 40a:	b8 14 00 00 00       	mov    $0x14,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret

00000412 <chdir>:
SYSCALL(chdir)
 412:	b8 09 00 00 00       	mov    $0x9,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret

0000041a <dup>:
SYSCALL(dup)
 41a:	b8 0a 00 00 00       	mov    $0xa,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret

00000422 <getpid>:
SYSCALL(getpid)
 422:	b8 0b 00 00 00       	mov    $0xb,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret

0000042a <sbrk>:
SYSCALL(sbrk)
 42a:	b8 0c 00 00 00       	mov    $0xc,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret

00000432 <sleep>:
SYSCALL(sleep)
 432:	b8 0d 00 00 00       	mov    $0xd,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret

0000043a <uptime>:
SYSCALL(uptime)
 43a:	b8 0e 00 00 00       	mov    $0xe,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret

00000442 <spawn>:
SYSCALL(spawn)
 442:	b8 16 00 00 00       	mov    $0x16,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret

0000044a <shm_open>:
SYSCALL(shm_open)
 44a:	b8 17 00 00 00       	mov    $0x17,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret

00000452 <shm_attach>:
SYSCALL(shm_attach)
 452:	b8 18 00 00 00       	mov    $0x18,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret

0000045a <thread_create>:
SYSCALL(thread_create)
 45a:	b8 19 00 00 00       	mov    $0x19,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret

00000462 <thread_join>:
SYSCALL(thread_join)
 462:	b8 1a 00 00 00       	mov    $0x1a,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret

0000046a <mutex_lock>:
SYSCALL(mutex_lock)
 46a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret

00000472 <mutex_unlock>:
SYSCALL(mutex_unlock)
 472:	b8 1c 00 00 00       	mov    $0x1c,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret

0000047a <signal>:
SYSCALL(signal)
 47a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret
