
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	bf 01 00 00 00       	mov    $0x1,%edi
  13:	56                   	push   %esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 71 04             	mov    0x4(%ecx),%esi
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;

  if(argc <= 1){
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	7f 29                	jg     4f <main+0x4f>
  26:	eb 60                	jmp    88 <main+0x88>
  28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  2f:	00 
  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit(0);
    }
    wc(fd, argv[i]);
  30:	83 ec 08             	sub    $0x8,%esp
  33:	ff 34 be             	push   (%esi,%edi,4)
  for(i = 1; i < argc; i++){
  36:	83 c7 01             	add    $0x1,%edi
    wc(fd, argv[i]);
  39:	53                   	push   %ebx
  3a:	e8 81 00 00 00       	call   c0 <wc>
    close(fd);
  3f:	89 1c 24             	mov    %ebx,(%esp)
  42:	e8 e3 03 00 00       	call   42a <close>
  for(i = 1; i < argc; i++){
  47:	83 c4 10             	add    $0x10,%esp
  4a:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  4d:	74 54                	je     a3 <main+0xa3>
    if((fd = open(argv[i], 0)) < 0){
  4f:	83 ec 08             	sub    $0x8,%esp
  52:	6a 00                	push   $0x0
  54:	ff 34 be             	push   (%esi,%edi,4)
  57:	e8 e6 03 00 00       	call   442 <open>
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	89 c3                	mov    %eax,%ebx
  61:	85 c0                	test   %eax,%eax
  63:	79 cb                	jns    30 <main+0x30>
      printf(1, "wc: cannot open %s\n", argv[i]);
  65:	83 ec 04             	sub    $0x4,%esp
  68:	ff 34 be             	push   (%esi,%edi,4)
  6b:	68 bb 08 00 00       	push   $0x8bb
  70:	6a 01                	push   $0x1
  72:	e8 19 05 00 00       	call   590 <printf>
      exit(0);
  77:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  7e:	e8 7f 03 00 00       	call   402 <exit>
  83:	83 c4 10             	add    $0x10,%esp
  86:	eb a8                	jmp    30 <main+0x30>
    wc(0, "");
  88:	50                   	push   %eax
  89:	50                   	push   %eax
  8a:	68 ad 08 00 00       	push   $0x8ad
  8f:	6a 00                	push   $0x0
  91:	e8 2a 00 00 00       	call   c0 <wc>
    exit(0);
  96:	31 d2                	xor    %edx,%edx
  98:	89 14 24             	mov    %edx,(%esp)
  9b:	e8 62 03 00 00       	call   402 <exit>
  a0:	83 c4 10             	add    $0x10,%esp
  }
  exit(0);
  a3:	83 ec 0c             	sub    $0xc,%esp
  a6:	6a 00                	push   $0x0
  a8:	e8 55 03 00 00       	call   402 <exit>
}
  ad:	8d 65 f0             	lea    -0x10(%ebp),%esp
  b0:	31 c0                	xor    %eax,%eax
  b2:	59                   	pop    %ecx
  b3:	5b                   	pop    %ebx
  b4:	5e                   	pop    %esi
  b5:	5f                   	pop    %edi
  b6:	5d                   	pop    %ebp
  b7:	8d 61 fc             	lea    -0x4(%ecx),%esp
  ba:	c3                   	ret
  bb:	66 90                	xchg   %ax,%ax
  bd:	66 90                	xchg   %ax,%ax
  bf:	90                   	nop

000000c0 <wc>:
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	57                   	push   %edi
  c4:	56                   	push   %esi
  inword = 0;
  c5:	31 f6                	xor    %esi,%esi
{
  c7:	53                   	push   %ebx
  l = w = c = 0;
  c8:	31 db                	xor    %ebx,%ebx
{
  ca:	83 ec 1c             	sub    $0x1c,%esp
  l = w = c = 0;
  cd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  d4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
  e0:	83 ec 04             	sub    $0x4,%esp
  e3:	68 00 02 00 00       	push   $0x200
  e8:	68 40 0c 00 00       	push   $0xc40
  ed:	ff 75 08             	push   0x8(%ebp)
  f0:	e8 25 03 00 00       	call   41a <read>
  f5:	83 c4 10             	add    $0x10,%esp
  f8:	89 c1                	mov    %eax,%ecx
  fa:	85 c0                	test   %eax,%eax
  fc:	7e 62                	jle    160 <wc+0xa0>
    for(i=0; i<n; i++){
  fe:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 101:	31 ff                	xor    %edi,%edi
 103:	eb 0d                	jmp    112 <wc+0x52>
 105:	8d 76 00             	lea    0x0(%esi),%esi
        inword = 0;
 108:	31 f6                	xor    %esi,%esi
    for(i=0; i<n; i++){
 10a:	83 c7 01             	add    $0x1,%edi
 10d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
 110:	74 3e                	je     150 <wc+0x90>
      if(buf[i] == '\n')
 112:	0f be 87 40 0c 00 00 	movsbl 0xc40(%edi),%eax
        l++;
 119:	31 c9                	xor    %ecx,%ecx
 11b:	3c 0a                	cmp    $0xa,%al
 11d:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 120:	83 ec 08             	sub    $0x8,%esp
 123:	50                   	push   %eax
        l++;
 124:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 126:	68 98 08 00 00       	push   $0x898
 12b:	e8 60 01 00 00       	call   290 <strchr>
 130:	83 c4 10             	add    $0x10,%esp
 133:	85 c0                	test   %eax,%eax
 135:	75 d1                	jne    108 <wc+0x48>
      else if(!inword){
 137:	85 f6                	test   %esi,%esi
 139:	75 cf                	jne    10a <wc+0x4a>
        w++;
 13b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 13f:	be 01 00 00 00       	mov    $0x1,%esi
    for(i=0; i<n; i++){
 144:	83 c7 01             	add    $0x1,%edi
 147:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
 14a:	75 c6                	jne    112 <wc+0x52>
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 150:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 153:	01 4d dc             	add    %ecx,-0x24(%ebp)
 156:	eb 88                	jmp    e0 <wc+0x20>
 158:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 15f:	00 
  if(n < 0){
 160:	75 24                	jne    186 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 162:	83 ec 08             	sub    $0x8,%esp
 165:	ff 75 0c             	push   0xc(%ebp)
 168:	ff 75 dc             	push   -0x24(%ebp)
 16b:	ff 75 e0             	push   -0x20(%ebp)
 16e:	53                   	push   %ebx
 16f:	68 ae 08 00 00       	push   $0x8ae
 174:	6a 01                	push   $0x1
 176:	e8 15 04 00 00       	call   590 <printf>
}
 17b:	83 c4 20             	add    $0x20,%esp
 17e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 181:	5b                   	pop    %ebx
 182:	5e                   	pop    %esi
 183:	5f                   	pop    %edi
 184:	5d                   	pop    %ebp
 185:	c3                   	ret
    printf(1, "wc: read error\n");
 186:	83 ec 08             	sub    $0x8,%esp
 189:	68 9e 08 00 00       	push   $0x89e
 18e:	6a 01                	push   $0x1
 190:	e8 fb 03 00 00       	call   590 <printf>
    exit(0);
 195:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 19c:	e8 61 02 00 00       	call   402 <exit>
 1a1:	83 c4 10             	add    $0x10,%esp
 1a4:	eb bc                	jmp    162 <wc+0xa2>
 1a6:	66 90                	xchg   %ax,%ax
 1a8:	66 90                	xchg   %ax,%ax
 1aa:	66 90                	xchg   %ax,%ax
 1ac:	66 90                	xchg   %ax,%ax
 1ae:	66 90                	xchg   %ax,%ax

000001b0 <strcpy>:
#include "user.h"
#include "x86.h"

// String and memory utilities

char* strcpy(char *s, const char *t) {
 1b0:	55                   	push   %ebp
  char *os = s;
  while ((*s++ = *t++) != 0);
 1b1:	31 c0                	xor    %eax,%eax
char* strcpy(char *s, const char *t) {
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	53                   	push   %ebx
 1b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0);
 1c0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1c4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1c7:	83 c0 01             	add    $0x1,%eax
 1ca:	84 d2                	test   %dl,%dl
 1cc:	75 f2                	jne    1c0 <strcpy+0x10>
  return os;
}
 1ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1d1:	89 c8                	mov    %ecx,%eax
 1d3:	c9                   	leave
 1d4:	c3                   	ret
 1d5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1dc:	00 
 1dd:	8d 76 00             	lea    0x0(%esi),%esi

000001e0 <strcmp>:

int strcmp(const char *p, const char *q) {
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	53                   	push   %ebx
 1e4:	8b 55 08             	mov    0x8(%ebp),%edx
 1e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
 1ea:	0f b6 02             	movzbl (%edx),%eax
 1ed:	84 c0                	test   %al,%al
 1ef:	75 17                	jne    208 <strcmp+0x28>
 1f1:	eb 3a                	jmp    22d <strcmp+0x4d>
 1f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 1f8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1fc:	83 c2 01             	add    $0x1,%edx
 1ff:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
 202:	84 c0                	test   %al,%al
 204:	74 1a                	je     220 <strcmp+0x40>
 206:	89 d9                	mov    %ebx,%ecx
 208:	0f b6 19             	movzbl (%ecx),%ebx
 20b:	38 c3                	cmp    %al,%bl
 20d:	74 e9                	je     1f8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 20f:	29 d8                	sub    %ebx,%eax
}
 211:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 214:	c9                   	leave
 215:	c3                   	ret
 216:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 21d:	00 
 21e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 220:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 224:	31 c0                	xor    %eax,%eax
 226:	29 d8                	sub    %ebx,%eax
}
 228:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 22b:	c9                   	leave
 22c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 22d:	0f b6 19             	movzbl (%ecx),%ebx
 230:	31 c0                	xor    %eax,%eax
 232:	eb db                	jmp    20f <strcmp+0x2f>
 234:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23b:	00 
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000240 <strlen>:

uint strlen(const char *s) {
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;
  for (n = 0; s[n]; n++);
 246:	80 3a 00             	cmpb   $0x0,(%edx)
 249:	74 15                	je     260 <strlen+0x20>
 24b:	31 c0                	xor    %eax,%eax
 24d:	8d 76 00             	lea    0x0(%esi),%esi
 250:	83 c0 01             	add    $0x1,%eax
 253:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 257:	89 c1                	mov    %eax,%ecx
 259:	75 f5                	jne    250 <strlen+0x10>
  return n;
}
 25b:	89 c8                	mov    %ecx,%eax
 25d:	5d                   	pop    %ebp
 25e:	c3                   	ret
 25f:	90                   	nop
  for (n = 0; s[n]; n++);
 260:	31 c9                	xor    %ecx,%ecx
}
 262:	5d                   	pop    %ebp
 263:	89 c8                	mov    %ecx,%eax
 265:	c3                   	ret
 266:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 26d:	00 
 26e:	66 90                	xchg   %ax,%ax

00000270 <memset>:

void* memset(void *dst, int c, uint n) {
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	8b 55 08             	mov    0x8(%ebp),%edx
               "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 277:	8b 4d 10             	mov    0x10(%ebp),%ecx
 27a:	8b 45 0c             	mov    0xc(%ebp),%eax
 27d:	89 d7                	mov    %edx,%edi
 27f:	fc                   	cld
 280:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 282:	8b 7d fc             	mov    -0x4(%ebp),%edi
 285:	89 d0                	mov    %edx,%eax
 287:	c9                   	leave
 288:	c3                   	ret
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000290 <strchr>:

char* strchr(const char *s, int c) {
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  for (; *s; s++)
 299:	0f be 10             	movsbl (%eax),%edx
 29c:	84 d2                	test   %dl,%dl
 29e:	75 13                	jne    2b3 <strchr+0x23>
 2a0:	eb 1e                	jmp    2c0 <strchr+0x30>
 2a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2a8:	0f be 50 01          	movsbl 0x1(%eax),%edx
 2ac:	83 c0 01             	add    $0x1,%eax
 2af:	84 d2                	test   %dl,%dl
 2b1:	74 0d                	je     2c0 <strchr+0x30>
    if (*s == c)
 2b3:	39 ca                	cmp    %ecx,%edx
 2b5:	75 f1                	jne    2a8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2b7:	5d                   	pop    %ebp
 2b8:	c3                   	ret
 2b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2c0:	31 c0                	xor    %eax,%eax
}
 2c2:	5d                   	pop    %ebp
 2c3:	c3                   	ret
 2c4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2cb:	00 
 2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002d0 <gets>:

char* gets(char *buf, int max) {
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	56                   	push   %esi
  int i, cc;
  char c;
  for (i = 0; i+1 < max;) {
    cc = read(0, &c, 1);
 2d5:	8d 75 e7             	lea    -0x19(%ebp),%esi
char* gets(char *buf, int max) {
 2d8:	53                   	push   %ebx
  for (i = 0; i+1 < max;) {
 2d9:	31 db                	xor    %ebx,%ebx
char* gets(char *buf, int max) {
 2db:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i+1 < max;) {
 2de:	eb 27                	jmp    307 <gets+0x37>
    cc = read(0, &c, 1);
 2e0:	83 ec 04             	sub    $0x4,%esp
 2e3:	6a 01                	push   $0x1
 2e5:	56                   	push   %esi
 2e6:	6a 00                	push   $0x0
 2e8:	e8 2d 01 00 00       	call   41a <read>
    if (cc < 1) break;
 2ed:	83 c4 10             	add    $0x10,%esp
 2f0:	85 c0                	test   %eax,%eax
 2f2:	7e 1d                	jle    311 <gets+0x41>
    buf[i++] = c;
 2f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2f8:	8b 55 08             	mov    0x8(%ebp),%edx
 2fb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r') break;
 2ff:	3c 0a                	cmp    $0xa,%al
 301:	74 10                	je     313 <gets+0x43>
 303:	3c 0d                	cmp    $0xd,%al
 305:	74 0c                	je     313 <gets+0x43>
  for (i = 0; i+1 < max;) {
 307:	89 df                	mov    %ebx,%edi
 309:	83 c3 01             	add    $0x1,%ebx
 30c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 30f:	7c cf                	jl     2e0 <gets+0x10>
 311:	89 fb                	mov    %edi,%ebx
  }
  buf[i] = '\0';
 313:	8b 45 08             	mov    0x8(%ebp),%eax
 316:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 31a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31d:	5b                   	pop    %ebx
 31e:	5e                   	pop    %esi
 31f:	5f                   	pop    %edi
 320:	5d                   	pop    %ebp
 321:	c3                   	ret
 322:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 329:	00 
 32a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000330 <stat>:

int stat(const char *n, struct stat *st) {
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
  int fd, r;
  fd = open(n, O_RDONLY);
 335:	83 ec 08             	sub    $0x8,%esp
 338:	6a 00                	push   $0x0
 33a:	ff 75 08             	push   0x8(%ebp)
 33d:	e8 00 01 00 00       	call   442 <open>
  if (fd < 0) return -1;
 342:	83 c4 10             	add    $0x10,%esp
 345:	85 c0                	test   %eax,%eax
 347:	78 27                	js     370 <stat+0x40>
  r = fstat(fd, st);
 349:	83 ec 08             	sub    $0x8,%esp
 34c:	ff 75 0c             	push   0xc(%ebp)
 34f:	89 c3                	mov    %eax,%ebx
 351:	50                   	push   %eax
 352:	e8 03 01 00 00       	call   45a <fstat>
  close(fd);
 357:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 35a:	89 c6                	mov    %eax,%esi
  close(fd);
 35c:	e8 c9 00 00 00       	call   42a <close>
  return r;
 361:	83 c4 10             	add    $0x10,%esp
}
 364:	8d 65 f8             	lea    -0x8(%ebp),%esp
 367:	89 f0                	mov    %esi,%eax
 369:	5b                   	pop    %ebx
 36a:	5e                   	pop    %esi
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret
 36d:	8d 76 00             	lea    0x0(%esi),%esi
  if (fd < 0) return -1;
 370:	be ff ff ff ff       	mov    $0xffffffff,%esi
 375:	eb ed                	jmp    364 <stat+0x34>
 377:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 37e:	00 
 37f:	90                   	nop

00000380 <atoi>:

int atoi(const char *s) {
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 55 08             	mov    0x8(%ebp),%edx
  int n = 0;
  while ('0' <= *s && *s <= '9')
 387:	0f be 02             	movsbl (%edx),%eax
 38a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 38d:	80 f9 09             	cmp    $0x9,%cl
  int n = 0;
 390:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 395:	77 1e                	ja     3b5 <atoi+0x35>
 397:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 39e:	00 
 39f:	90                   	nop
    n = n*10 + *s++ - '0';
 3a0:	83 c2 01             	add    $0x1,%edx
 3a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 3aa:	0f be 02             	movsbl (%edx),%eax
 3ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
  return n;
}
 3b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b8:	89 c8                	mov    %ecx,%eax
 3ba:	c9                   	leave
 3bb:	c3                   	ret
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <memmove>:

void* memmove(void *vdst, const void *vsrc, int n) {
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	8b 45 10             	mov    0x10(%ebp),%eax
 3c7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ca:	56                   	push   %esi
 3cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst = vdst;
  const char *src = vsrc;
  while (n-- > 0)
 3ce:	85 c0                	test   %eax,%eax
 3d0:	7e 13                	jle    3e5 <memmove+0x25>
 3d2:	01 d0                	add    %edx,%eax
  char *dst = vdst;
 3d4:	89 d7                	mov    %edx,%edi
 3d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3dd:	00 
 3de:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 3e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 3e1:	39 f8                	cmp    %edi,%eax
 3e3:	75 fb                	jne    3e0 <memmove+0x20>
  return vdst;
}
 3e5:	5e                   	pop    %esi
 3e6:	89 d0                	mov    %edx,%eax
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret
 3eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000003f0 <syscall>:

// Add syscall definition for internal use
int syscall(int num, ...) {
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
    int ret;
    asm volatile("int $64" : "=a" (ret) : "a" (num));
 3f3:	8b 45 08             	mov    0x8(%ebp),%eax
 3f6:	cd 40                	int    $0x40
    return ret;
}
 3f8:	5d                   	pop    %ebp
 3f9:	c3                   	ret

000003fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3fa:	b8 01 00 00 00       	mov    $0x1,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret

00000402 <exit>:
SYSCALL(exit)
 402:	b8 02 00 00 00       	mov    $0x2,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret

0000040a <wait>:
SYSCALL(wait)
 40a:	b8 03 00 00 00       	mov    $0x3,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret

00000412 <pipe>:
SYSCALL(pipe)
 412:	b8 04 00 00 00       	mov    $0x4,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret

0000041a <read>:
SYSCALL(read)
 41a:	b8 05 00 00 00       	mov    $0x5,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret

00000422 <write>:
SYSCALL(write)
 422:	b8 10 00 00 00       	mov    $0x10,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret

0000042a <close>:
SYSCALL(close)
 42a:	b8 15 00 00 00       	mov    $0x15,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret

00000432 <kill>:
SYSCALL(kill)
 432:	b8 06 00 00 00       	mov    $0x6,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret

0000043a <exec>:
SYSCALL(exec)
 43a:	b8 07 00 00 00       	mov    $0x7,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret

00000442 <open>:
SYSCALL(open)
 442:	b8 0f 00 00 00       	mov    $0xf,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret

0000044a <mknod>:
SYSCALL(mknod)
 44a:	b8 11 00 00 00       	mov    $0x11,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret

00000452 <unlink>:
SYSCALL(unlink)
 452:	b8 12 00 00 00       	mov    $0x12,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret

0000045a <fstat>:
SYSCALL(fstat)
 45a:	b8 08 00 00 00       	mov    $0x8,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret

00000462 <link>:
SYSCALL(link)
 462:	b8 13 00 00 00       	mov    $0x13,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret

0000046a <mkdir>:
SYSCALL(mkdir)
 46a:	b8 14 00 00 00       	mov    $0x14,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret

00000472 <chdir>:
SYSCALL(chdir)
 472:	b8 09 00 00 00       	mov    $0x9,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret

0000047a <dup>:
SYSCALL(dup)
 47a:	b8 0a 00 00 00       	mov    $0xa,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret

00000482 <getpid>:
SYSCALL(getpid)
 482:	b8 0b 00 00 00       	mov    $0xb,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret

0000048a <sbrk>:
SYSCALL(sbrk)
 48a:	b8 0c 00 00 00       	mov    $0xc,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret

00000492 <sleep>:
SYSCALL(sleep)
 492:	b8 0d 00 00 00       	mov    $0xd,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret

0000049a <uptime>:
SYSCALL(uptime)
 49a:	b8 0e 00 00 00       	mov    $0xe,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret

000004a2 <spawn>:
SYSCALL(spawn)
 4a2:	b8 16 00 00 00       	mov    $0x16,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret

000004aa <shm_open>:
SYSCALL(shm_open)
 4aa:	b8 17 00 00 00       	mov    $0x17,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret

000004b2 <shm_attach>:
SYSCALL(shm_attach)
 4b2:	b8 18 00 00 00       	mov    $0x18,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret

000004ba <thread_create>:
SYSCALL(thread_create)
 4ba:	b8 19 00 00 00       	mov    $0x19,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret

000004c2 <thread_join>:
SYSCALL(thread_join)
 4c2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret

000004ca <mutex_lock>:
SYSCALL(mutex_lock)
 4ca:	b8 1b 00 00 00       	mov    $0x1b,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret

000004d2 <mutex_unlock>:
SYSCALL(mutex_unlock)
 4d2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret

000004da <signal>:
SYSCALL(signal)
 4da:	b8 1d 00 00 00       	mov    $0x1d,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret
 4e2:	66 90                	xchg   %ax,%ax
 4e4:	66 90                	xchg   %ax,%ax
 4e6:	66 90                	xchg   %ax,%ax
 4e8:	66 90                	xchg   %ax,%ax
 4ea:	66 90                	xchg   %ax,%ax
 4ec:	66 90                	xchg   %ax,%ax
 4ee:	66 90                	xchg   %ax,%ax

000004f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	57                   	push   %edi
 4f4:	56                   	push   %esi
 4f5:	53                   	push   %ebx
 4f6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4f8:	89 d1                	mov    %edx,%ecx
{
 4fa:	83 ec 3c             	sub    $0x3c,%esp
 4fd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 500:	85 d2                	test   %edx,%edx
 502:	0f 89 80 00 00 00    	jns    588 <printint+0x98>
 508:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 50c:	74 7a                	je     588 <printint+0x98>
    x = -xx;
 50e:	f7 d9                	neg    %ecx
    neg = 1;
 510:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 515:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 518:	31 f6                	xor    %esi,%esi
 51a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 520:	89 c8                	mov    %ecx,%eax
 522:	31 d2                	xor    %edx,%edx
 524:	89 f7                	mov    %esi,%edi
 526:	f7 f3                	div    %ebx
 528:	8d 76 01             	lea    0x1(%esi),%esi
 52b:	0f b6 92 30 09 00 00 	movzbl 0x930(%edx),%edx
 532:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 536:	89 ca                	mov    %ecx,%edx
 538:	89 c1                	mov    %eax,%ecx
 53a:	39 da                	cmp    %ebx,%edx
 53c:	73 e2                	jae    520 <printint+0x30>
  if(neg)
 53e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 541:	85 c0                	test   %eax,%eax
 543:	74 07                	je     54c <printint+0x5c>
    buf[i++] = '-';
 545:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 54a:	89 f7                	mov    %esi,%edi
 54c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 54f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 552:	01 df                	add    %ebx,%edi
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 558:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 55b:	83 ec 04             	sub    $0x4,%esp
 55e:	88 45 d7             	mov    %al,-0x29(%ebp)
 561:	8d 45 d7             	lea    -0x29(%ebp),%eax
 564:	6a 01                	push   $0x1
 566:	50                   	push   %eax
 567:	56                   	push   %esi
 568:	e8 b5 fe ff ff       	call   422 <write>
  while(--i >= 0)
 56d:	89 f8                	mov    %edi,%eax
 56f:	83 c4 10             	add    $0x10,%esp
 572:	83 ef 01             	sub    $0x1,%edi
 575:	39 c3                	cmp    %eax,%ebx
 577:	75 df                	jne    558 <printint+0x68>
}
 579:	8d 65 f4             	lea    -0xc(%ebp),%esp
 57c:	5b                   	pop    %ebx
 57d:	5e                   	pop    %esi
 57e:	5f                   	pop    %edi
 57f:	5d                   	pop    %ebp
 580:	c3                   	ret
 581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 588:	31 c0                	xor    %eax,%eax
 58a:	eb 89                	jmp    515 <printint+0x25>
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000590 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 599:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 59c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 59f:	0f b6 1e             	movzbl (%esi),%ebx
 5a2:	83 c6 01             	add    $0x1,%esi
 5a5:	84 db                	test   %bl,%bl
 5a7:	74 67                	je     610 <printf+0x80>
 5a9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 5ac:	31 d2                	xor    %edx,%edx
 5ae:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 5b1:	eb 34                	jmp    5e7 <printf+0x57>
 5b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 5b8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5bb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5c0:	83 f8 25             	cmp    $0x25,%eax
 5c3:	74 18                	je     5dd <printf+0x4d>
  write(fd, &c, 1);
 5c5:	83 ec 04             	sub    $0x4,%esp
 5c8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5cb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5ce:	6a 01                	push   $0x1
 5d0:	50                   	push   %eax
 5d1:	57                   	push   %edi
 5d2:	e8 4b fe ff ff       	call   422 <write>
 5d7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 5da:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5dd:	0f b6 1e             	movzbl (%esi),%ebx
 5e0:	83 c6 01             	add    $0x1,%esi
 5e3:	84 db                	test   %bl,%bl
 5e5:	74 29                	je     610 <printf+0x80>
    c = fmt[i] & 0xff;
 5e7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 5ea:	85 d2                	test   %edx,%edx
 5ec:	74 ca                	je     5b8 <printf+0x28>
      }
    } else if(state == '%'){
 5ee:	83 fa 25             	cmp    $0x25,%edx
 5f1:	75 ea                	jne    5dd <printf+0x4d>
      if(c == 'd'){
 5f3:	83 f8 25             	cmp    $0x25,%eax
 5f6:	0f 84 04 01 00 00    	je     700 <printf+0x170>
 5fc:	83 e8 63             	sub    $0x63,%eax
 5ff:	83 f8 15             	cmp    $0x15,%eax
 602:	77 1c                	ja     620 <printf+0x90>
 604:	ff 24 85 d8 08 00 00 	jmp    *0x8d8(,%eax,4)
 60b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 610:	8d 65 f4             	lea    -0xc(%ebp),%esp
 613:	5b                   	pop    %ebx
 614:	5e                   	pop    %esi
 615:	5f                   	pop    %edi
 616:	5d                   	pop    %ebp
 617:	c3                   	ret
 618:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 61f:	00 
  write(fd, &c, 1);
 620:	83 ec 04             	sub    $0x4,%esp
 623:	8d 55 e7             	lea    -0x19(%ebp),%edx
 626:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 62a:	6a 01                	push   $0x1
 62c:	52                   	push   %edx
 62d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 630:	57                   	push   %edi
 631:	e8 ec fd ff ff       	call   422 <write>
 636:	83 c4 0c             	add    $0xc,%esp
 639:	88 5d e7             	mov    %bl,-0x19(%ebp)
 63c:	6a 01                	push   $0x1
 63e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 641:	52                   	push   %edx
 642:	57                   	push   %edi
 643:	e8 da fd ff ff       	call   422 <write>
        putc(fd, c);
 648:	83 c4 10             	add    $0x10,%esp
      state = 0;
 64b:	31 d2                	xor    %edx,%edx
 64d:	eb 8e                	jmp    5dd <printf+0x4d>
 64f:	90                   	nop
        printint(fd, *ap, 16, 0);
 650:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 653:	83 ec 0c             	sub    $0xc,%esp
 656:	b9 10 00 00 00       	mov    $0x10,%ecx
 65b:	8b 13                	mov    (%ebx),%edx
 65d:	6a 00                	push   $0x0
 65f:	89 f8                	mov    %edi,%eax
        ap++;
 661:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 664:	e8 87 fe ff ff       	call   4f0 <printint>
        ap++;
 669:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 66c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 66f:	31 d2                	xor    %edx,%edx
 671:	e9 67 ff ff ff       	jmp    5dd <printf+0x4d>
        s = (char*)*ap;
 676:	8b 45 d0             	mov    -0x30(%ebp),%eax
 679:	8b 18                	mov    (%eax),%ebx
        ap++;
 67b:	83 c0 04             	add    $0x4,%eax
 67e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 681:	85 db                	test   %ebx,%ebx
 683:	0f 84 87 00 00 00    	je     710 <printf+0x180>
        while(*s != 0){
 689:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 68c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 68e:	84 c0                	test   %al,%al
 690:	0f 84 47 ff ff ff    	je     5dd <printf+0x4d>
 696:	8d 55 e7             	lea    -0x19(%ebp),%edx
 699:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 69c:	89 de                	mov    %ebx,%esi
 69e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
 6a3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 6a6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 6a9:	6a 01                	push   $0x1
 6ab:	53                   	push   %ebx
 6ac:	57                   	push   %edi
 6ad:	e8 70 fd ff ff       	call   422 <write>
        while(*s != 0){
 6b2:	0f b6 06             	movzbl (%esi),%eax
 6b5:	83 c4 10             	add    $0x10,%esp
 6b8:	84 c0                	test   %al,%al
 6ba:	75 e4                	jne    6a0 <printf+0x110>
      state = 0;
 6bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 6bf:	31 d2                	xor    %edx,%edx
 6c1:	e9 17 ff ff ff       	jmp    5dd <printf+0x4d>
        printint(fd, *ap, 10, 1);
 6c6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6c9:	83 ec 0c             	sub    $0xc,%esp
 6cc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6d1:	8b 13                	mov    (%ebx),%edx
 6d3:	6a 01                	push   $0x1
 6d5:	eb 88                	jmp    65f <printf+0xcf>
        putc(fd, *ap);
 6d7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6da:	83 ec 04             	sub    $0x4,%esp
 6dd:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 6e0:	8b 03                	mov    (%ebx),%eax
        ap++;
 6e2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 6e5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6e8:	6a 01                	push   $0x1
 6ea:	52                   	push   %edx
 6eb:	57                   	push   %edi
 6ec:	e8 31 fd ff ff       	call   422 <write>
        ap++;
 6f1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6f4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6f7:	31 d2                	xor    %edx,%edx
 6f9:	e9 df fe ff ff       	jmp    5dd <printf+0x4d>
 6fe:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 700:	83 ec 04             	sub    $0x4,%esp
 703:	88 5d e7             	mov    %bl,-0x19(%ebp)
 706:	8d 55 e7             	lea    -0x19(%ebp),%edx
 709:	6a 01                	push   $0x1
 70b:	e9 31 ff ff ff       	jmp    641 <printf+0xb1>
 710:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 715:	bb cf 08 00 00       	mov    $0x8cf,%ebx
 71a:	e9 77 ff ff ff       	jmp    696 <printf+0x106>
 71f:	90                   	nop

00000720 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 720:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 721:	a1 40 0e 00 00       	mov    0xe40,%eax
{
 726:	89 e5                	mov    %esp,%ebp
 728:	57                   	push   %edi
 729:	56                   	push   %esi
 72a:	53                   	push   %ebx
 72b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 72e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 738:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73a:	39 c8                	cmp    %ecx,%eax
 73c:	73 32                	jae    770 <free+0x50>
 73e:	39 d1                	cmp    %edx,%ecx
 740:	72 04                	jb     746 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 742:	39 d0                	cmp    %edx,%eax
 744:	72 32                	jb     778 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 746:	8b 73 fc             	mov    -0x4(%ebx),%esi
 749:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 74c:	39 fa                	cmp    %edi,%edx
 74e:	74 30                	je     780 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 750:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 753:	8b 50 04             	mov    0x4(%eax),%edx
 756:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 759:	39 f1                	cmp    %esi,%ecx
 75b:	74 3a                	je     797 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 75d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 75f:	5b                   	pop    %ebx
  freep = p;
 760:	a3 40 0e 00 00       	mov    %eax,0xe40
}
 765:	5e                   	pop    %esi
 766:	5f                   	pop    %edi
 767:	5d                   	pop    %ebp
 768:	c3                   	ret
 769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 770:	39 d0                	cmp    %edx,%eax
 772:	72 04                	jb     778 <free+0x58>
 774:	39 d1                	cmp    %edx,%ecx
 776:	72 ce                	jb     746 <free+0x26>
{
 778:	89 d0                	mov    %edx,%eax
 77a:	eb bc                	jmp    738 <free+0x18>
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 780:	03 72 04             	add    0x4(%edx),%esi
 783:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 786:	8b 10                	mov    (%eax),%edx
 788:	8b 12                	mov    (%edx),%edx
 78a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 78d:	8b 50 04             	mov    0x4(%eax),%edx
 790:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 793:	39 f1                	cmp    %esi,%ecx
 795:	75 c6                	jne    75d <free+0x3d>
    p->s.size += bp->s.size;
 797:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 79a:	a3 40 0e 00 00       	mov    %eax,0xe40
    p->s.size += bp->s.size;
 79f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7a2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7a5:	89 08                	mov    %ecx,(%eax)
}
 7a7:	5b                   	pop    %ebx
 7a8:	5e                   	pop    %esi
 7a9:	5f                   	pop    %edi
 7aa:	5d                   	pop    %ebp
 7ab:	c3                   	ret
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000007b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7bc:	8b 15 40 0e 00 00    	mov    0xe40,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c2:	8d 78 07             	lea    0x7(%eax),%edi
 7c5:	c1 ef 03             	shr    $0x3,%edi
 7c8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 7cb:	85 d2                	test   %edx,%edx
 7cd:	0f 84 8d 00 00 00    	je     860 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7d5:	8b 48 04             	mov    0x4(%eax),%ecx
 7d8:	39 f9                	cmp    %edi,%ecx
 7da:	73 64                	jae    840 <malloc+0x90>
  if(nu < 4096)
 7dc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7e1:	39 df                	cmp    %ebx,%edi
 7e3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7e6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7ed:	eb 0a                	jmp    7f9 <malloc+0x49>
 7ef:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7f2:	8b 48 04             	mov    0x4(%eax),%ecx
 7f5:	39 f9                	cmp    %edi,%ecx
 7f7:	73 47                	jae    840 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7f9:	89 c2                	mov    %eax,%edx
 7fb:	3b 05 40 0e 00 00    	cmp    0xe40,%eax
 801:	75 ed                	jne    7f0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 803:	83 ec 0c             	sub    $0xc,%esp
 806:	56                   	push   %esi
 807:	e8 7e fc ff ff       	call   48a <sbrk>
  if(p == (char*)-1)
 80c:	83 c4 10             	add    $0x10,%esp
 80f:	83 f8 ff             	cmp    $0xffffffff,%eax
 812:	74 1c                	je     830 <malloc+0x80>
  hp->s.size = nu;
 814:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 817:	83 ec 0c             	sub    $0xc,%esp
 81a:	83 c0 08             	add    $0x8,%eax
 81d:	50                   	push   %eax
 81e:	e8 fd fe ff ff       	call   720 <free>
  return freep;
 823:	8b 15 40 0e 00 00    	mov    0xe40,%edx
      if((p = morecore(nunits)) == 0)
 829:	83 c4 10             	add    $0x10,%esp
 82c:	85 d2                	test   %edx,%edx
 82e:	75 c0                	jne    7f0 <malloc+0x40>
        return 0;
  }
}
 830:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 833:	31 c0                	xor    %eax,%eax
}
 835:	5b                   	pop    %ebx
 836:	5e                   	pop    %esi
 837:	5f                   	pop    %edi
 838:	5d                   	pop    %ebp
 839:	c3                   	ret
 83a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 840:	39 cf                	cmp    %ecx,%edi
 842:	74 4c                	je     890 <malloc+0xe0>
        p->s.size -= nunits;
 844:	29 f9                	sub    %edi,%ecx
 846:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 849:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 84c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 84f:	89 15 40 0e 00 00    	mov    %edx,0xe40
}
 855:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 858:	83 c0 08             	add    $0x8,%eax
}
 85b:	5b                   	pop    %ebx
 85c:	5e                   	pop    %esi
 85d:	5f                   	pop    %edi
 85e:	5d                   	pop    %ebp
 85f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 860:	c7 05 40 0e 00 00 44 	movl   $0xe44,0xe40
 867:	0e 00 00 
    base.s.size = 0;
 86a:	b8 44 0e 00 00       	mov    $0xe44,%eax
    base.s.ptr = freep = prevp = &base;
 86f:	c7 05 44 0e 00 00 44 	movl   $0xe44,0xe44
 876:	0e 00 00 
    base.s.size = 0;
 879:	c7 05 48 0e 00 00 00 	movl   $0x0,0xe48
 880:	00 00 00 
    if(p->s.size >= nunits){
 883:	e9 54 ff ff ff       	jmp    7dc <malloc+0x2c>
 888:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 88f:	00 
        prevp->s.ptr = p->s.ptr;
 890:	8b 08                	mov    (%eax),%ecx
 892:	89 0a                	mov    %ecx,(%edx)
 894:	eb b9                	jmp    84f <malloc+0x9f>
