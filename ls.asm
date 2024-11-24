
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
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
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	bb 01 00 00 00       	mov    $0x1,%ebx
  15:	51                   	push   %ecx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 24                	jle    47 <main+0x47>
  23:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    ls(".");
    exit(0);
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	push   (%edi,%ebx,4)
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  31:	e8 ba 00 00 00       	call   f0 <ls>
  for(i=1; i<argc; i++)
  36:	83 c4 10             	add    $0x10,%esp
  39:	39 de                	cmp    %ebx,%esi
  3b:	75 eb                	jne    28 <main+0x28>
  exit(0);
  3d:	83 ec 0c             	sub    $0xc,%esp
  40:	6a 00                	push   $0x0
  42:	e8 2b 05 00 00       	call   572 <exit>
    ls(".");
  47:	83 ec 0c             	sub    $0xc,%esp
  4a:	68 50 0a 00 00       	push   $0xa50
  4f:	e8 9c 00 00 00       	call   f0 <ls>
    exit(0);
  54:	31 c0                	xor    %eax,%eax
  56:	89 04 24             	mov    %eax,(%esp)
  59:	e8 14 05 00 00       	call   572 <exit>
  5e:	66 90                	xchg   %ax,%ax

00000060 <fmtname>:
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	56                   	push   %esi
  64:	53                   	push   %ebx
  65:	8b 75 08             	mov    0x8(%ebp),%esi
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  68:	83 ec 0c             	sub    $0xc,%esp
  6b:	56                   	push   %esi
  6c:	e8 3f 03 00 00       	call   3b0 <strlen>
  71:	83 c4 10             	add    $0x10,%esp
  74:	01 f0                	add    %esi,%eax
  76:	89 c3                	mov    %eax,%ebx
  78:	73 0f                	jae    89 <fmtname+0x29>
  7a:	eb 12                	jmp    8e <fmtname+0x2e>
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  83:	39 f0                	cmp    %esi,%eax
  85:	72 0a                	jb     91 <fmtname+0x31>
  87:	89 c3                	mov    %eax,%ebx
  89:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  8c:	75 f2                	jne    80 <fmtname+0x20>
  p++;
  8e:	83 c3 01             	add    $0x1,%ebx
  if(strlen(p) >= DIRSIZ)
  91:	83 ec 0c             	sub    $0xc,%esp
  94:	53                   	push   %ebx
  95:	e8 16 03 00 00       	call   3b0 <strlen>
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	83 f8 0d             	cmp    $0xd,%eax
  a0:	77 37                	ja     d9 <fmtname+0x79>
  memmove(buf, p, strlen(p));
  a2:	83 ec 04             	sub    $0x4,%esp
  a5:	50                   	push   %eax
  a6:	53                   	push   %ebx
  a7:	68 f8 0d 00 00       	push   $0xdf8
  ac:	e8 7f 04 00 00       	call   530 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  b1:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  b4:	bb f8 0d 00 00       	mov    $0xdf8,%ebx
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  b9:	e8 f2 02 00 00       	call   3b0 <strlen>
  be:	ba 0e 00 00 00       	mov    $0xe,%edx
  c3:	83 c4 0c             	add    $0xc,%esp
  c6:	29 c2                	sub    %eax,%edx
  c8:	05 f8 0d 00 00       	add    $0xdf8,%eax
  cd:	52                   	push   %edx
  ce:	6a 20                	push   $0x20
  d0:	50                   	push   %eax
  d1:	e8 0a 03 00 00       	call   3e0 <memset>
  return buf;
  d6:	83 c4 10             	add    $0x10,%esp
}
  d9:	8d 65 f8             	lea    -0x8(%ebp),%esp
  dc:	89 d8                	mov    %ebx,%eax
  de:	5b                   	pop    %ebx
  df:	5e                   	pop    %esi
  e0:	5d                   	pop    %ebp
  e1:	c3                   	ret
  e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  e9:	00 
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000000f0 <ls>:
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	56                   	push   %esi
  f5:	53                   	push   %ebx
  f6:	81 ec 54 02 00 00    	sub    $0x254,%esp
  fc:	8b 7d 08             	mov    0x8(%ebp),%edi
  if((fd = open(path, 0)) < 0){
  ff:	6a 00                	push   $0x0
 101:	57                   	push   %edi
 102:	e8 ab 04 00 00       	call   5b2 <open>
 107:	83 c4 10             	add    $0x10,%esp
 10a:	85 c0                	test   %eax,%eax
 10c:	0f 88 8e 01 00 00    	js     2a0 <ls+0x1b0>
  if(fstat(fd, &st) < 0){
 112:	83 ec 08             	sub    $0x8,%esp
 115:	8d b5 c8 fd ff ff    	lea    -0x238(%ebp),%esi
 11b:	89 c3                	mov    %eax,%ebx
 11d:	56                   	push   %esi
 11e:	50                   	push   %eax
 11f:	e8 a6 04 00 00       	call   5ca <fstat>
 124:	83 c4 10             	add    $0x10,%esp
 127:	85 c0                	test   %eax,%eax
 129:	0f 88 b1 01 00 00    	js     2e0 <ls+0x1f0>
  switch(st.type){
 12f:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 136:	66 83 f8 01          	cmp    $0x1,%ax
 13a:	74 54                	je     190 <ls+0xa0>
 13c:	66 83 f8 02          	cmp    $0x2,%ax
 140:	75 37                	jne    179 <ls+0x89>
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 142:	8b 95 d4 fd ff ff    	mov    -0x22c(%ebp),%edx
 148:	83 ec 0c             	sub    $0xc,%esp
 14b:	8b b5 cc fd ff ff    	mov    -0x234(%ebp),%esi
 151:	89 95 c4 fd ff ff    	mov    %edx,-0x23c(%ebp)
 157:	57                   	push   %edi
 158:	e8 03 ff ff ff       	call   60 <fmtname>
 15d:	8b 95 c4 fd ff ff    	mov    -0x23c(%ebp),%edx
 163:	59                   	pop    %ecx
 164:	5f                   	pop    %edi
 165:	52                   	push   %edx
 166:	56                   	push   %esi
 167:	6a 02                	push   $0x2
 169:	50                   	push   %eax
 16a:	68 30 0a 00 00       	push   $0xa30
 16f:	6a 01                	push   $0x1
 171:	e8 8a 05 00 00       	call   700 <printf>
    break;
 176:	83 c4 20             	add    $0x20,%esp
  close(fd);
 179:	83 ec 0c             	sub    $0xc,%esp
 17c:	53                   	push   %ebx
 17d:	e8 18 04 00 00       	call   59a <close>
 182:	83 c4 10             	add    $0x10,%esp
}
 185:	8d 65 f4             	lea    -0xc(%ebp),%esp
 188:	5b                   	pop    %ebx
 189:	5e                   	pop    %esi
 18a:	5f                   	pop    %edi
 18b:	5d                   	pop    %ebp
 18c:	c3                   	ret
 18d:	8d 76 00             	lea    0x0(%esi),%esi
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 190:	83 ec 0c             	sub    $0xc,%esp
 193:	57                   	push   %edi
 194:	e8 17 02 00 00       	call   3b0 <strlen>
 199:	83 c4 10             	add    $0x10,%esp
 19c:	83 c0 10             	add    $0x10,%eax
 19f:	3d 00 02 00 00       	cmp    $0x200,%eax
 1a4:	0f 87 16 01 00 00    	ja     2c0 <ls+0x1d0>
    strcpy(buf, path);
 1aa:	83 ec 08             	sub    $0x8,%esp
 1ad:	57                   	push   %edi
 1ae:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1b4:	57                   	push   %edi
 1b5:	e8 66 01 00 00       	call   320 <strcpy>
    p = buf+strlen(buf);
 1ba:	89 3c 24             	mov    %edi,(%esp)
 1bd:	e8 ee 01 00 00       	call   3b0 <strlen>
 1c2:	83 c4 10             	add    $0x10,%esp
 1c5:	01 f8                	add    %edi,%eax
    *p++ = '/';
 1c7:	8d 48 01             	lea    0x1(%eax),%ecx
    p = buf+strlen(buf);
 1ca:	89 85 b8 fd ff ff    	mov    %eax,-0x248(%ebp)
    *p++ = '/';
 1d0:	89 8d b4 fd ff ff    	mov    %ecx,-0x24c(%ebp)
 1d6:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e0:	83 ec 04             	sub    $0x4,%esp
 1e3:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
 1e9:	6a 10                	push   $0x10
 1eb:	50                   	push   %eax
 1ec:	53                   	push   %ebx
 1ed:	e8 98 03 00 00       	call   58a <read>
 1f2:	83 c4 10             	add    $0x10,%esp
 1f5:	83 f8 10             	cmp    $0x10,%eax
 1f8:	0f 85 7b ff ff ff    	jne    179 <ls+0x89>
      if(de.inum == 0)
 1fe:	66 83 bd d8 fd ff ff 	cmpw   $0x0,-0x228(%ebp)
 205:	00 
 206:	74 d8                	je     1e0 <ls+0xf0>
      memmove(p, de.name, DIRSIZ);
 208:	83 ec 04             	sub    $0x4,%esp
 20b:	8d 85 da fd ff ff    	lea    -0x226(%ebp),%eax
 211:	6a 0e                	push   $0xe
 213:	50                   	push   %eax
 214:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 21a:	e8 11 03 00 00       	call   530 <memmove>
      p[DIRSIZ] = 0;
 21f:	8b 85 b8 fd ff ff    	mov    -0x248(%ebp),%eax
 225:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
 229:	58                   	pop    %eax
 22a:	5a                   	pop    %edx
 22b:	56                   	push   %esi
 22c:	57                   	push   %edi
 22d:	e8 6e 02 00 00       	call   4a0 <stat>
 232:	83 c4 10             	add    $0x10,%esp
 235:	85 c0                	test   %eax,%eax
 237:	0f 88 cb 00 00 00    	js     308 <ls+0x218>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 23d:	8b 8d d4 fd ff ff    	mov    -0x22c(%ebp),%ecx
 243:	8b 95 cc fd ff ff    	mov    -0x234(%ebp),%edx
 249:	83 ec 0c             	sub    $0xc,%esp
 24c:	0f bf 85 d0 fd ff ff 	movswl -0x230(%ebp),%eax
 253:	89 8d bc fd ff ff    	mov    %ecx,-0x244(%ebp)
 259:	89 95 c0 fd ff ff    	mov    %edx,-0x240(%ebp)
 25f:	89 85 c4 fd ff ff    	mov    %eax,-0x23c(%ebp)
 265:	57                   	push   %edi
 266:	e8 f5 fd ff ff       	call   60 <fmtname>
 26b:	5a                   	pop    %edx
 26c:	59                   	pop    %ecx
 26d:	8b 8d bc fd ff ff    	mov    -0x244(%ebp),%ecx
 273:	51                   	push   %ecx
 274:	8b 95 c0 fd ff ff    	mov    -0x240(%ebp),%edx
 27a:	52                   	push   %edx
 27b:	ff b5 c4 fd ff ff    	push   -0x23c(%ebp)
 281:	50                   	push   %eax
 282:	68 30 0a 00 00       	push   $0xa30
 287:	6a 01                	push   $0x1
 289:	e8 72 04 00 00       	call   700 <printf>
 28e:	83 c4 20             	add    $0x20,%esp
 291:	e9 4a ff ff ff       	jmp    1e0 <ls+0xf0>
 296:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 29d:	00 
 29e:	66 90                	xchg   %ax,%ax
    printf(2, "ls: cannot open %s\n", path);
 2a0:	83 ec 04             	sub    $0x4,%esp
 2a3:	57                   	push   %edi
 2a4:	68 08 0a 00 00       	push   $0xa08
 2a9:	6a 02                	push   $0x2
 2ab:	e8 50 04 00 00       	call   700 <printf>
    return;
 2b0:	83 c4 10             	add    $0x10,%esp
}
 2b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2b6:	5b                   	pop    %ebx
 2b7:	5e                   	pop    %esi
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret
 2bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      printf(1, "ls: path too long\n");
 2c0:	83 ec 08             	sub    $0x8,%esp
 2c3:	68 3d 0a 00 00       	push   $0xa3d
 2c8:	6a 01                	push   $0x1
 2ca:	e8 31 04 00 00       	call   700 <printf>
      break;
 2cf:	83 c4 10             	add    $0x10,%esp
 2d2:	e9 a2 fe ff ff       	jmp    179 <ls+0x89>
 2d7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 2de:	00 
 2df:	90                   	nop
    printf(2, "ls: cannot stat %s\n", path);
 2e0:	83 ec 04             	sub    $0x4,%esp
 2e3:	57                   	push   %edi
 2e4:	68 1c 0a 00 00       	push   $0xa1c
 2e9:	6a 02                	push   $0x2
 2eb:	e8 10 04 00 00       	call   700 <printf>
    close(fd);
 2f0:	89 1c 24             	mov    %ebx,(%esp)
 2f3:	e8 a2 02 00 00       	call   59a <close>
    return;
 2f8:	83 c4 10             	add    $0x10,%esp
}
 2fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fe:	5b                   	pop    %ebx
 2ff:	5e                   	pop    %esi
 300:	5f                   	pop    %edi
 301:	5d                   	pop    %ebp
 302:	c3                   	ret
 303:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        printf(1, "ls: cannot stat %s\n", buf);
 308:	83 ec 04             	sub    $0x4,%esp
 30b:	57                   	push   %edi
 30c:	68 1c 0a 00 00       	push   $0xa1c
 311:	6a 01                	push   $0x1
 313:	e8 e8 03 00 00       	call   700 <printf>
        continue;
 318:	83 c4 10             	add    $0x10,%esp
 31b:	e9 c0 fe ff ff       	jmp    1e0 <ls+0xf0>

00000320 <strcpy>:
#include "user.h"
#include "x86.h"

// String and memory utilities

char* strcpy(char *s, const char *t) {
 320:	55                   	push   %ebp
  char *os = s;
  while ((*s++ = *t++) != 0);
 321:	31 c0                	xor    %eax,%eax
char* strcpy(char *s, const char *t) {
 323:	89 e5                	mov    %esp,%ebp
 325:	53                   	push   %ebx
 326:	8b 4d 08             	mov    0x8(%ebp),%ecx
 329:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0);
 330:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 334:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 337:	83 c0 01             	add    $0x1,%eax
 33a:	84 d2                	test   %dl,%dl
 33c:	75 f2                	jne    330 <strcpy+0x10>
  return os;
}
 33e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 341:	89 c8                	mov    %ecx,%eax
 343:	c9                   	leave
 344:	c3                   	ret
 345:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 34c:	00 
 34d:	8d 76 00             	lea    0x0(%esi),%esi

00000350 <strcmp>:

int strcmp(const char *p, const char *q) {
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	53                   	push   %ebx
 354:	8b 55 08             	mov    0x8(%ebp),%edx
 357:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
 35a:	0f b6 02             	movzbl (%edx),%eax
 35d:	84 c0                	test   %al,%al
 35f:	75 17                	jne    378 <strcmp+0x28>
 361:	eb 3a                	jmp    39d <strcmp+0x4d>
 363:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 368:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 36c:	83 c2 01             	add    $0x1,%edx
 36f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
 372:	84 c0                	test   %al,%al
 374:	74 1a                	je     390 <strcmp+0x40>
 376:	89 d9                	mov    %ebx,%ecx
 378:	0f b6 19             	movzbl (%ecx),%ebx
 37b:	38 c3                	cmp    %al,%bl
 37d:	74 e9                	je     368 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 37f:	29 d8                	sub    %ebx,%eax
}
 381:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 384:	c9                   	leave
 385:	c3                   	ret
 386:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 38d:	00 
 38e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 390:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 394:	31 c0                	xor    %eax,%eax
 396:	29 d8                	sub    %ebx,%eax
}
 398:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 39b:	c9                   	leave
 39c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 39d:	0f b6 19             	movzbl (%ecx),%ebx
 3a0:	31 c0                	xor    %eax,%eax
 3a2:	eb db                	jmp    37f <strcmp+0x2f>
 3a4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3ab:	00 
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003b0 <strlen>:

uint strlen(const char *s) {
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;
  for (n = 0; s[n]; n++);
 3b6:	80 3a 00             	cmpb   $0x0,(%edx)
 3b9:	74 15                	je     3d0 <strlen+0x20>
 3bb:	31 c0                	xor    %eax,%eax
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
 3c0:	83 c0 01             	add    $0x1,%eax
 3c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 3c7:	89 c1                	mov    %eax,%ecx
 3c9:	75 f5                	jne    3c0 <strlen+0x10>
  return n;
}
 3cb:	89 c8                	mov    %ecx,%eax
 3cd:	5d                   	pop    %ebp
 3ce:	c3                   	ret
 3cf:	90                   	nop
  for (n = 0; s[n]; n++);
 3d0:	31 c9                	xor    %ecx,%ecx
}
 3d2:	5d                   	pop    %ebp
 3d3:	89 c8                	mov    %ecx,%eax
 3d5:	c3                   	ret
 3d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3dd:	00 
 3de:	66 90                	xchg   %ax,%ax

000003e0 <memset>:

void* memset(void *dst, int c, uint n) {
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	8b 55 08             	mov    0x8(%ebp),%edx
               "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ed:	89 d7                	mov    %edx,%edi
 3ef:	fc                   	cld
 3f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3f2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 3f5:	89 d0                	mov    %edx,%eax
 3f7:	c9                   	leave
 3f8:	c3                   	ret
 3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000400 <strchr>:

char* strchr(const char *s, int c) {
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	8b 45 08             	mov    0x8(%ebp),%eax
 406:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  for (; *s; s++)
 409:	0f be 10             	movsbl (%eax),%edx
 40c:	84 d2                	test   %dl,%dl
 40e:	75 13                	jne    423 <strchr+0x23>
 410:	eb 1e                	jmp    430 <strchr+0x30>
 412:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 418:	0f be 50 01          	movsbl 0x1(%eax),%edx
 41c:	83 c0 01             	add    $0x1,%eax
 41f:	84 d2                	test   %dl,%dl
 421:	74 0d                	je     430 <strchr+0x30>
    if (*s == c)
 423:	39 ca                	cmp    %ecx,%edx
 425:	75 f1                	jne    418 <strchr+0x18>
      return (char*)s;
  return 0;
}
 427:	5d                   	pop    %ebp
 428:	c3                   	ret
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 430:	31 c0                	xor    %eax,%eax
}
 432:	5d                   	pop    %ebp
 433:	c3                   	ret
 434:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 43b:	00 
 43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000440 <gets>:

char* gets(char *buf, int max) {
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
  int i, cc;
  char c;
  for (i = 0; i+1 < max;) {
    cc = read(0, &c, 1);
 445:	8d 75 e7             	lea    -0x19(%ebp),%esi
char* gets(char *buf, int max) {
 448:	53                   	push   %ebx
  for (i = 0; i+1 < max;) {
 449:	31 db                	xor    %ebx,%ebx
char* gets(char *buf, int max) {
 44b:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i+1 < max;) {
 44e:	eb 27                	jmp    477 <gets+0x37>
    cc = read(0, &c, 1);
 450:	83 ec 04             	sub    $0x4,%esp
 453:	6a 01                	push   $0x1
 455:	56                   	push   %esi
 456:	6a 00                	push   $0x0
 458:	e8 2d 01 00 00       	call   58a <read>
    if (cc < 1) break;
 45d:	83 c4 10             	add    $0x10,%esp
 460:	85 c0                	test   %eax,%eax
 462:	7e 1d                	jle    481 <gets+0x41>
    buf[i++] = c;
 464:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 468:	8b 55 08             	mov    0x8(%ebp),%edx
 46b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r') break;
 46f:	3c 0a                	cmp    $0xa,%al
 471:	74 10                	je     483 <gets+0x43>
 473:	3c 0d                	cmp    $0xd,%al
 475:	74 0c                	je     483 <gets+0x43>
  for (i = 0; i+1 < max;) {
 477:	89 df                	mov    %ebx,%edi
 479:	83 c3 01             	add    $0x1,%ebx
 47c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 47f:	7c cf                	jl     450 <gets+0x10>
 481:	89 fb                	mov    %edi,%ebx
  }
  buf[i] = '\0';
 483:	8b 45 08             	mov    0x8(%ebp),%eax
 486:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 48a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48d:	5b                   	pop    %ebx
 48e:	5e                   	pop    %esi
 48f:	5f                   	pop    %edi
 490:	5d                   	pop    %ebp
 491:	c3                   	ret
 492:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 499:	00 
 49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004a0 <stat>:

int stat(const char *n, struct stat *st) {
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	56                   	push   %esi
 4a4:	53                   	push   %ebx
  int fd, r;
  fd = open(n, O_RDONLY);
 4a5:	83 ec 08             	sub    $0x8,%esp
 4a8:	6a 00                	push   $0x0
 4aa:	ff 75 08             	push   0x8(%ebp)
 4ad:	e8 00 01 00 00       	call   5b2 <open>
  if (fd < 0) return -1;
 4b2:	83 c4 10             	add    $0x10,%esp
 4b5:	85 c0                	test   %eax,%eax
 4b7:	78 27                	js     4e0 <stat+0x40>
  r = fstat(fd, st);
 4b9:	83 ec 08             	sub    $0x8,%esp
 4bc:	ff 75 0c             	push   0xc(%ebp)
 4bf:	89 c3                	mov    %eax,%ebx
 4c1:	50                   	push   %eax
 4c2:	e8 03 01 00 00       	call   5ca <fstat>
  close(fd);
 4c7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4ca:	89 c6                	mov    %eax,%esi
  close(fd);
 4cc:	e8 c9 00 00 00       	call   59a <close>
  return r;
 4d1:	83 c4 10             	add    $0x10,%esp
}
 4d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4d7:	89 f0                	mov    %esi,%eax
 4d9:	5b                   	pop    %ebx
 4da:	5e                   	pop    %esi
 4db:	5d                   	pop    %ebp
 4dc:	c3                   	ret
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
  if (fd < 0) return -1;
 4e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4e5:	eb ed                	jmp    4d4 <stat+0x34>
 4e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4ee:	00 
 4ef:	90                   	nop

000004f0 <atoi>:

int atoi(const char *s) {
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	53                   	push   %ebx
 4f4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n = 0;
  while ('0' <= *s && *s <= '9')
 4f7:	0f be 02             	movsbl (%edx),%eax
 4fa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 4fd:	80 f9 09             	cmp    $0x9,%cl
  int n = 0;
 500:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 505:	77 1e                	ja     525 <atoi+0x35>
 507:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 50e:	00 
 50f:	90                   	nop
    n = n*10 + *s++ - '0';
 510:	83 c2 01             	add    $0x1,%edx
 513:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 516:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 51a:	0f be 02             	movsbl (%edx),%eax
 51d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 520:	80 fb 09             	cmp    $0x9,%bl
 523:	76 eb                	jbe    510 <atoi+0x20>
  return n;
}
 525:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 528:	89 c8                	mov    %ecx,%eax
 52a:	c9                   	leave
 52b:	c3                   	ret
 52c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000530 <memmove>:

void* memmove(void *vdst, const void *vsrc, int n) {
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	8b 45 10             	mov    0x10(%ebp),%eax
 537:	8b 55 08             	mov    0x8(%ebp),%edx
 53a:	56                   	push   %esi
 53b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst = vdst;
  const char *src = vsrc;
  while (n-- > 0)
 53e:	85 c0                	test   %eax,%eax
 540:	7e 13                	jle    555 <memmove+0x25>
 542:	01 d0                	add    %edx,%eax
  char *dst = vdst;
 544:	89 d7                	mov    %edx,%edi
 546:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 54d:	00 
 54e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 550:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 551:	39 f8                	cmp    %edi,%eax
 553:	75 fb                	jne    550 <memmove+0x20>
  return vdst;
}
 555:	5e                   	pop    %esi
 556:	89 d0                	mov    %edx,%eax
 558:	5f                   	pop    %edi
 559:	5d                   	pop    %ebp
 55a:	c3                   	ret
 55b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000560 <syscall>:

// Add syscall definition for internal use
int syscall(int num, ...) {
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
    int ret;
    asm volatile("int $64" : "=a" (ret) : "a" (num));
 563:	8b 45 08             	mov    0x8(%ebp),%eax
 566:	cd 40                	int    $0x40
    return ret;
}
 568:	5d                   	pop    %ebp
 569:	c3                   	ret

0000056a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 56a:	b8 01 00 00 00       	mov    $0x1,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret

00000572 <exit>:
SYSCALL(exit)
 572:	b8 02 00 00 00       	mov    $0x2,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret

0000057a <wait>:
SYSCALL(wait)
 57a:	b8 03 00 00 00       	mov    $0x3,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret

00000582 <pipe>:
SYSCALL(pipe)
 582:	b8 04 00 00 00       	mov    $0x4,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret

0000058a <read>:
SYSCALL(read)
 58a:	b8 05 00 00 00       	mov    $0x5,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret

00000592 <write>:
SYSCALL(write)
 592:	b8 10 00 00 00       	mov    $0x10,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret

0000059a <close>:
SYSCALL(close)
 59a:	b8 15 00 00 00       	mov    $0x15,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret

000005a2 <kill>:
SYSCALL(kill)
 5a2:	b8 06 00 00 00       	mov    $0x6,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret

000005aa <exec>:
SYSCALL(exec)
 5aa:	b8 07 00 00 00       	mov    $0x7,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret

000005b2 <open>:
SYSCALL(open)
 5b2:	b8 0f 00 00 00       	mov    $0xf,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret

000005ba <mknod>:
SYSCALL(mknod)
 5ba:	b8 11 00 00 00       	mov    $0x11,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret

000005c2 <unlink>:
SYSCALL(unlink)
 5c2:	b8 12 00 00 00       	mov    $0x12,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret

000005ca <fstat>:
SYSCALL(fstat)
 5ca:	b8 08 00 00 00       	mov    $0x8,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret

000005d2 <link>:
SYSCALL(link)
 5d2:	b8 13 00 00 00       	mov    $0x13,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret

000005da <mkdir>:
SYSCALL(mkdir)
 5da:	b8 14 00 00 00       	mov    $0x14,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret

000005e2 <chdir>:
SYSCALL(chdir)
 5e2:	b8 09 00 00 00       	mov    $0x9,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret

000005ea <dup>:
SYSCALL(dup)
 5ea:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret

000005f2 <getpid>:
SYSCALL(getpid)
 5f2:	b8 0b 00 00 00       	mov    $0xb,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret

000005fa <sbrk>:
SYSCALL(sbrk)
 5fa:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret

00000602 <sleep>:
SYSCALL(sleep)
 602:	b8 0d 00 00 00       	mov    $0xd,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret

0000060a <uptime>:
SYSCALL(uptime)
 60a:	b8 0e 00 00 00       	mov    $0xe,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret

00000612 <spawn>:
SYSCALL(spawn)
 612:	b8 16 00 00 00       	mov    $0x16,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret

0000061a <shm_open>:
SYSCALL(shm_open)
 61a:	b8 17 00 00 00       	mov    $0x17,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret

00000622 <shm_attach>:
SYSCALL(shm_attach)
 622:	b8 18 00 00 00       	mov    $0x18,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret

0000062a <thread_create>:
SYSCALL(thread_create)
 62a:	b8 19 00 00 00       	mov    $0x19,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret

00000632 <thread_join>:
SYSCALL(thread_join)
 632:	b8 1a 00 00 00       	mov    $0x1a,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret

0000063a <mutex_lock>:
SYSCALL(mutex_lock)
 63a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret

00000642 <mutex_unlock>:
SYSCALL(mutex_unlock)
 642:	b8 1c 00 00 00       	mov    $0x1c,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret

0000064a <signal>:
SYSCALL(signal)
 64a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret
 652:	66 90                	xchg   %ax,%ax
 654:	66 90                	xchg   %ax,%ax
 656:	66 90                	xchg   %ax,%ax
 658:	66 90                	xchg   %ax,%ax
 65a:	66 90                	xchg   %ax,%ax
 65c:	66 90                	xchg   %ax,%ax
 65e:	66 90                	xchg   %ax,%ax

00000660 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 668:	89 d1                	mov    %edx,%ecx
{
 66a:	83 ec 3c             	sub    $0x3c,%esp
 66d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 670:	85 d2                	test   %edx,%edx
 672:	0f 89 80 00 00 00    	jns    6f8 <printint+0x98>
 678:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 67c:	74 7a                	je     6f8 <printint+0x98>
    x = -xx;
 67e:	f7 d9                	neg    %ecx
    neg = 1;
 680:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 685:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 688:	31 f6                	xor    %esi,%esi
 68a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 690:	89 c8                	mov    %ecx,%eax
 692:	31 d2                	xor    %edx,%edx
 694:	89 f7                	mov    %esi,%edi
 696:	f7 f3                	div    %ebx
 698:	8d 76 01             	lea    0x1(%esi),%esi
 69b:	0f b6 92 b4 0a 00 00 	movzbl 0xab4(%edx),%edx
 6a2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 6a6:	89 ca                	mov    %ecx,%edx
 6a8:	89 c1                	mov    %eax,%ecx
 6aa:	39 da                	cmp    %ebx,%edx
 6ac:	73 e2                	jae    690 <printint+0x30>
  if(neg)
 6ae:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 6b1:	85 c0                	test   %eax,%eax
 6b3:	74 07                	je     6bc <printint+0x5c>
    buf[i++] = '-';
 6b5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 6ba:	89 f7                	mov    %esi,%edi
 6bc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 6bf:	8b 75 c0             	mov    -0x40(%ebp),%esi
 6c2:	01 df                	add    %ebx,%edi
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 6c8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 6cb:	83 ec 04             	sub    $0x4,%esp
 6ce:	88 45 d7             	mov    %al,-0x29(%ebp)
 6d1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 6d4:	6a 01                	push   $0x1
 6d6:	50                   	push   %eax
 6d7:	56                   	push   %esi
 6d8:	e8 b5 fe ff ff       	call   592 <write>
  while(--i >= 0)
 6dd:	89 f8                	mov    %edi,%eax
 6df:	83 c4 10             	add    $0x10,%esp
 6e2:	83 ef 01             	sub    $0x1,%edi
 6e5:	39 c3                	cmp    %eax,%ebx
 6e7:	75 df                	jne    6c8 <printint+0x68>
}
 6e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6ec:	5b                   	pop    %ebx
 6ed:	5e                   	pop    %esi
 6ee:	5f                   	pop    %edi
 6ef:	5d                   	pop    %ebp
 6f0:	c3                   	ret
 6f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6f8:	31 c0                	xor    %eax,%eax
 6fa:	eb 89                	jmp    685 <printint+0x25>
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000700 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 709:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 70c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 70f:	0f b6 1e             	movzbl (%esi),%ebx
 712:	83 c6 01             	add    $0x1,%esi
 715:	84 db                	test   %bl,%bl
 717:	74 67                	je     780 <printf+0x80>
 719:	8d 4d 10             	lea    0x10(%ebp),%ecx
 71c:	31 d2                	xor    %edx,%edx
 71e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 721:	eb 34                	jmp    757 <printf+0x57>
 723:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 728:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 72b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 730:	83 f8 25             	cmp    $0x25,%eax
 733:	74 18                	je     74d <printf+0x4d>
  write(fd, &c, 1);
 735:	83 ec 04             	sub    $0x4,%esp
 738:	8d 45 e7             	lea    -0x19(%ebp),%eax
 73b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 73e:	6a 01                	push   $0x1
 740:	50                   	push   %eax
 741:	57                   	push   %edi
 742:	e8 4b fe ff ff       	call   592 <write>
 747:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 74a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 74d:	0f b6 1e             	movzbl (%esi),%ebx
 750:	83 c6 01             	add    $0x1,%esi
 753:	84 db                	test   %bl,%bl
 755:	74 29                	je     780 <printf+0x80>
    c = fmt[i] & 0xff;
 757:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 75a:	85 d2                	test   %edx,%edx
 75c:	74 ca                	je     728 <printf+0x28>
      }
    } else if(state == '%'){
 75e:	83 fa 25             	cmp    $0x25,%edx
 761:	75 ea                	jne    74d <printf+0x4d>
      if(c == 'd'){
 763:	83 f8 25             	cmp    $0x25,%eax
 766:	0f 84 04 01 00 00    	je     870 <printf+0x170>
 76c:	83 e8 63             	sub    $0x63,%eax
 76f:	83 f8 15             	cmp    $0x15,%eax
 772:	77 1c                	ja     790 <printf+0x90>
 774:	ff 24 85 5c 0a 00 00 	jmp    *0xa5c(,%eax,4)
 77b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 780:	8d 65 f4             	lea    -0xc(%ebp),%esp
 783:	5b                   	pop    %ebx
 784:	5e                   	pop    %esi
 785:	5f                   	pop    %edi
 786:	5d                   	pop    %ebp
 787:	c3                   	ret
 788:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 78f:	00 
  write(fd, &c, 1);
 790:	83 ec 04             	sub    $0x4,%esp
 793:	8d 55 e7             	lea    -0x19(%ebp),%edx
 796:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 79a:	6a 01                	push   $0x1
 79c:	52                   	push   %edx
 79d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 7a0:	57                   	push   %edi
 7a1:	e8 ec fd ff ff       	call   592 <write>
 7a6:	83 c4 0c             	add    $0xc,%esp
 7a9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 7ac:	6a 01                	push   $0x1
 7ae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 7b1:	52                   	push   %edx
 7b2:	57                   	push   %edi
 7b3:	e8 da fd ff ff       	call   592 <write>
        putc(fd, c);
 7b8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7bb:	31 d2                	xor    %edx,%edx
 7bd:	eb 8e                	jmp    74d <printf+0x4d>
 7bf:	90                   	nop
        printint(fd, *ap, 16, 0);
 7c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 7c3:	83 ec 0c             	sub    $0xc,%esp
 7c6:	b9 10 00 00 00       	mov    $0x10,%ecx
 7cb:	8b 13                	mov    (%ebx),%edx
 7cd:	6a 00                	push   $0x0
 7cf:	89 f8                	mov    %edi,%eax
        ap++;
 7d1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 7d4:	e8 87 fe ff ff       	call   660 <printint>
        ap++;
 7d9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 7dc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7df:	31 d2                	xor    %edx,%edx
 7e1:	e9 67 ff ff ff       	jmp    74d <printf+0x4d>
        s = (char*)*ap;
 7e6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7e9:	8b 18                	mov    (%eax),%ebx
        ap++;
 7eb:	83 c0 04             	add    $0x4,%eax
 7ee:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7f1:	85 db                	test   %ebx,%ebx
 7f3:	0f 84 87 00 00 00    	je     880 <printf+0x180>
        while(*s != 0){
 7f9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 7fc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 7fe:	84 c0                	test   %al,%al
 800:	0f 84 47 ff ff ff    	je     74d <printf+0x4d>
 806:	8d 55 e7             	lea    -0x19(%ebp),%edx
 809:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 80c:	89 de                	mov    %ebx,%esi
 80e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 810:	83 ec 04             	sub    $0x4,%esp
 813:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 816:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 819:	6a 01                	push   $0x1
 81b:	53                   	push   %ebx
 81c:	57                   	push   %edi
 81d:	e8 70 fd ff ff       	call   592 <write>
        while(*s != 0){
 822:	0f b6 06             	movzbl (%esi),%eax
 825:	83 c4 10             	add    $0x10,%esp
 828:	84 c0                	test   %al,%al
 82a:	75 e4                	jne    810 <printf+0x110>
      state = 0;
 82c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 82f:	31 d2                	xor    %edx,%edx
 831:	e9 17 ff ff ff       	jmp    74d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 836:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 839:	83 ec 0c             	sub    $0xc,%esp
 83c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 841:	8b 13                	mov    (%ebx),%edx
 843:	6a 01                	push   $0x1
 845:	eb 88                	jmp    7cf <printf+0xcf>
        putc(fd, *ap);
 847:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 84a:	83 ec 04             	sub    $0x4,%esp
 84d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 850:	8b 03                	mov    (%ebx),%eax
        ap++;
 852:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 855:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 858:	6a 01                	push   $0x1
 85a:	52                   	push   %edx
 85b:	57                   	push   %edi
 85c:	e8 31 fd ff ff       	call   592 <write>
        ap++;
 861:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 864:	83 c4 10             	add    $0x10,%esp
      state = 0;
 867:	31 d2                	xor    %edx,%edx
 869:	e9 df fe ff ff       	jmp    74d <printf+0x4d>
 86e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 870:	83 ec 04             	sub    $0x4,%esp
 873:	88 5d e7             	mov    %bl,-0x19(%ebp)
 876:	8d 55 e7             	lea    -0x19(%ebp),%edx
 879:	6a 01                	push   $0x1
 87b:	e9 31 ff ff ff       	jmp    7b1 <printf+0xb1>
 880:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 885:	bb 52 0a 00 00       	mov    $0xa52,%ebx
 88a:	e9 77 ff ff ff       	jmp    806 <printf+0x106>
 88f:	90                   	nop

00000890 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 890:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 891:	a1 08 0e 00 00       	mov    0xe08,%eax
{
 896:	89 e5                	mov    %esp,%ebp
 898:	57                   	push   %edi
 899:	56                   	push   %esi
 89a:	53                   	push   %ebx
 89b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 89e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8aa:	39 c8                	cmp    %ecx,%eax
 8ac:	73 32                	jae    8e0 <free+0x50>
 8ae:	39 d1                	cmp    %edx,%ecx
 8b0:	72 04                	jb     8b6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b2:	39 d0                	cmp    %edx,%eax
 8b4:	72 32                	jb     8e8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8b6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8b9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8bc:	39 fa                	cmp    %edi,%edx
 8be:	74 30                	je     8f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 8c0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8c3:	8b 50 04             	mov    0x4(%eax),%edx
 8c6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8c9:	39 f1                	cmp    %esi,%ecx
 8cb:	74 3a                	je     907 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 8cd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 8cf:	5b                   	pop    %ebx
  freep = p;
 8d0:	a3 08 0e 00 00       	mov    %eax,0xe08
}
 8d5:	5e                   	pop    %esi
 8d6:	5f                   	pop    %edi
 8d7:	5d                   	pop    %ebp
 8d8:	c3                   	ret
 8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e0:	39 d0                	cmp    %edx,%eax
 8e2:	72 04                	jb     8e8 <free+0x58>
 8e4:	39 d1                	cmp    %edx,%ecx
 8e6:	72 ce                	jb     8b6 <free+0x26>
{
 8e8:	89 d0                	mov    %edx,%eax
 8ea:	eb bc                	jmp    8a8 <free+0x18>
 8ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 8f0:	03 72 04             	add    0x4(%edx),%esi
 8f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8f6:	8b 10                	mov    (%eax),%edx
 8f8:	8b 12                	mov    (%edx),%edx
 8fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8fd:	8b 50 04             	mov    0x4(%eax),%edx
 900:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 903:	39 f1                	cmp    %esi,%ecx
 905:	75 c6                	jne    8cd <free+0x3d>
    p->s.size += bp->s.size;
 907:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 90a:	a3 08 0e 00 00       	mov    %eax,0xe08
    p->s.size += bp->s.size;
 90f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 912:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 915:	89 08                	mov    %ecx,(%eax)
}
 917:	5b                   	pop    %ebx
 918:	5e                   	pop    %esi
 919:	5f                   	pop    %edi
 91a:	5d                   	pop    %ebp
 91b:	c3                   	ret
 91c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000920 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
 923:	57                   	push   %edi
 924:	56                   	push   %esi
 925:	53                   	push   %ebx
 926:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 929:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 92c:	8b 15 08 0e 00 00    	mov    0xe08,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 932:	8d 78 07             	lea    0x7(%eax),%edi
 935:	c1 ef 03             	shr    $0x3,%edi
 938:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 93b:	85 d2                	test   %edx,%edx
 93d:	0f 84 8d 00 00 00    	je     9d0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 943:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 945:	8b 48 04             	mov    0x4(%eax),%ecx
 948:	39 f9                	cmp    %edi,%ecx
 94a:	73 64                	jae    9b0 <malloc+0x90>
  if(nu < 4096)
 94c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 951:	39 df                	cmp    %ebx,%edi
 953:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 956:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 95d:	eb 0a                	jmp    969 <malloc+0x49>
 95f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 960:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 962:	8b 48 04             	mov    0x4(%eax),%ecx
 965:	39 f9                	cmp    %edi,%ecx
 967:	73 47                	jae    9b0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 969:	89 c2                	mov    %eax,%edx
 96b:	3b 05 08 0e 00 00    	cmp    0xe08,%eax
 971:	75 ed                	jne    960 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 973:	83 ec 0c             	sub    $0xc,%esp
 976:	56                   	push   %esi
 977:	e8 7e fc ff ff       	call   5fa <sbrk>
  if(p == (char*)-1)
 97c:	83 c4 10             	add    $0x10,%esp
 97f:	83 f8 ff             	cmp    $0xffffffff,%eax
 982:	74 1c                	je     9a0 <malloc+0x80>
  hp->s.size = nu;
 984:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 987:	83 ec 0c             	sub    $0xc,%esp
 98a:	83 c0 08             	add    $0x8,%eax
 98d:	50                   	push   %eax
 98e:	e8 fd fe ff ff       	call   890 <free>
  return freep;
 993:	8b 15 08 0e 00 00    	mov    0xe08,%edx
      if((p = morecore(nunits)) == 0)
 999:	83 c4 10             	add    $0x10,%esp
 99c:	85 d2                	test   %edx,%edx
 99e:	75 c0                	jne    960 <malloc+0x40>
        return 0;
  }
}
 9a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9a3:	31 c0                	xor    %eax,%eax
}
 9a5:	5b                   	pop    %ebx
 9a6:	5e                   	pop    %esi
 9a7:	5f                   	pop    %edi
 9a8:	5d                   	pop    %ebp
 9a9:	c3                   	ret
 9aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9b0:	39 cf                	cmp    %ecx,%edi
 9b2:	74 4c                	je     a00 <malloc+0xe0>
        p->s.size -= nunits;
 9b4:	29 f9                	sub    %edi,%ecx
 9b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9bc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 9bf:	89 15 08 0e 00 00    	mov    %edx,0xe08
}
 9c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 9c8:	83 c0 08             	add    $0x8,%eax
}
 9cb:	5b                   	pop    %ebx
 9cc:	5e                   	pop    %esi
 9cd:	5f                   	pop    %edi
 9ce:	5d                   	pop    %ebp
 9cf:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 9d0:	c7 05 08 0e 00 00 0c 	movl   $0xe0c,0xe08
 9d7:	0e 00 00 
    base.s.size = 0;
 9da:	b8 0c 0e 00 00       	mov    $0xe0c,%eax
    base.s.ptr = freep = prevp = &base;
 9df:	c7 05 0c 0e 00 00 0c 	movl   $0xe0c,0xe0c
 9e6:	0e 00 00 
    base.s.size = 0;
 9e9:	c7 05 10 0e 00 00 00 	movl   $0x0,0xe10
 9f0:	00 00 00 
    if(p->s.size >= nunits){
 9f3:	e9 54 ff ff ff       	jmp    94c <malloc+0x2c>
 9f8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 9ff:	00 
        prevp->s.ptr = p->s.ptr;
 a00:	8b 08                	mov    (%eax),%ecx
 a02:	89 0a                	mov    %ecx,(%edx)
 a04:	eb b9                	jmp    9bf <malloc+0x9f>
