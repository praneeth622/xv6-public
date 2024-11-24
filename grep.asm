
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
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
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
  1c:	83 f8 01             	cmp    $0x1,%eax
  1f:	7e 79                	jle    9a <main+0x9a>
    printf(2, "usage: grep pattern [file ...]\n");
    exit(0);
  }
  pattern = argv[1];
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
  27:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
    grep(pattern, 0);
    exit(0);
  }

  for(i = 2; i < argc; i++){
  2b:	be 02 00 00 00       	mov    $0x2,%esi
  pattern = argv[1];
  30:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(argc <= 2){
  33:	75 2d                	jne    62 <main+0x62>
  35:	eb 7b                	jmp    b2 <main+0xb2>
  37:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  3e:	00 
  3f:	90                   	nop
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit(0);
    }
    grep(pattern, fd);
  40:	83 ec 08             	sub    $0x8,%esp
  for(i = 2; i < argc; i++){
  43:	83 c6 01             	add    $0x1,%esi
  46:	83 c3 04             	add    $0x4,%ebx
    grep(pattern, fd);
  49:	50                   	push   %eax
  4a:	ff 75 e0             	push   -0x20(%ebp)
  4d:	e8 ae 01 00 00       	call   200 <grep>
    close(fd);
  52:	89 3c 24             	mov    %edi,(%esp)
  55:	e8 d0 05 00 00       	call   62a <close>
  for(i = 2; i < argc; i++){
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  60:	7e 2e                	jle    90 <main+0x90>
    if((fd = open(argv[i], 0)) < 0){
  62:	83 ec 08             	sub    $0x8,%esp
  65:	6a 00                	push   $0x0
  67:	ff 33                	push   (%ebx)
  69:	e8 d4 05 00 00       	call   642 <open>
  6e:	83 c4 10             	add    $0x10,%esp
  71:	89 c7                	mov    %eax,%edi
  73:	85 c0                	test   %eax,%eax
  75:	79 c9                	jns    40 <main+0x40>
      printf(1, "grep: cannot open %s\n", argv[i]);
  77:	50                   	push   %eax
  78:	ff 33                	push   (%ebx)
  7a:	68 b8 0a 00 00       	push   $0xab8
  7f:	6a 01                	push   $0x1
  81:	e8 0a 07 00 00       	call   790 <printf>
      exit(0);
  86:	31 d2                	xor    %edx,%edx
  88:	89 14 24             	mov    %edx,(%esp)
  8b:	e8 72 05 00 00       	call   602 <exit>
  }
  exit(0);
  90:	83 ec 0c             	sub    $0xc,%esp
  93:	6a 00                	push   $0x0
  95:	e8 68 05 00 00       	call   602 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  9a:	56                   	push   %esi
    exit(0);
  9b:	31 ff                	xor    %edi,%edi
    printf(2, "usage: grep pattern [file ...]\n");
  9d:	56                   	push   %esi
  9e:	68 98 0a 00 00       	push   $0xa98
  a3:	6a 02                	push   $0x2
  a5:	e8 e6 06 00 00       	call   790 <printf>
    exit(0);
  aa:	89 3c 24             	mov    %edi,(%esp)
  ad:	e8 50 05 00 00       	call   602 <exit>
    grep(pattern, 0);
  b2:	51                   	push   %ecx
    exit(0);
  b3:	31 db                	xor    %ebx,%ebx
    grep(pattern, 0);
  b5:	51                   	push   %ecx
  b6:	6a 00                	push   $0x0
  b8:	50                   	push   %eax
  b9:	e8 42 01 00 00       	call   200 <grep>
    exit(0);
  be:	89 1c 24             	mov    %ebx,(%esp)
  c1:	e8 3c 05 00 00       	call   602 <exit>
  c6:	66 90                	xchg   %ax,%ax
  c8:	66 90                	xchg   %ax,%ax
  ca:	66 90                	xchg   %ax,%ax
  cc:	66 90                	xchg   %ax,%ax
  ce:	66 90                	xchg   %ax,%ax

000000d0 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	57                   	push   %edi
  d4:	56                   	push   %esi
  d5:	53                   	push   %ebx
  d6:	83 ec 0c             	sub    $0xc,%esp
  d9:	8b 7d 08             	mov    0x8(%ebp),%edi
  dc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '\0')
  df:	0f b6 0f             	movzbl (%edi),%ecx
  e2:	84 c9                	test   %cl,%cl
  e4:	0f 84 96 00 00 00    	je     180 <matchhere+0xb0>
    return 1;
  if(re[1] == '*')
  ea:	0f b6 47 01          	movzbl 0x1(%edi),%eax
  ee:	3c 2a                	cmp    $0x2a,%al
  f0:	74 2d                	je     11f <matchhere+0x4f>
  f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  f8:	0f b6 33             	movzbl (%ebx),%esi
  if(re[0] == '$' && re[1] == '\0')
  fb:	80 f9 24             	cmp    $0x24,%cl
  fe:	74 50                	je     150 <matchhere+0x80>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 100:	89 f2                	mov    %esi,%edx
 102:	84 d2                	test   %dl,%dl
 104:	74 6e                	je     174 <matchhere+0xa4>
 106:	80 f9 2e             	cmp    $0x2e,%cl
 109:	75 65                	jne    170 <matchhere+0xa0>
    return matchhere(re+1, text+1);
 10b:	83 c3 01             	add    $0x1,%ebx
 10e:	83 c7 01             	add    $0x1,%edi
  if(re[0] == '\0')
 111:	84 c0                	test   %al,%al
 113:	74 6b                	je     180 <matchhere+0xb0>
{
 115:	89 c1                	mov    %eax,%ecx
  if(re[1] == '*')
 117:	0f b6 47 01          	movzbl 0x1(%edi),%eax
 11b:	3c 2a                	cmp    $0x2a,%al
 11d:	75 d9                	jne    f8 <matchhere+0x28>
    return matchstar(re[0], re+2, text);
 11f:	8d 77 02             	lea    0x2(%edi),%esi
 122:	0f be f9             	movsbl %cl,%edi
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
 125:	8d 76 00             	lea    0x0(%esi),%esi
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 128:	83 ec 08             	sub    $0x8,%esp
 12b:	53                   	push   %ebx
 12c:	56                   	push   %esi
 12d:	e8 9e ff ff ff       	call   d0 <matchhere>
 132:	83 c4 10             	add    $0x10,%esp
 135:	85 c0                	test   %eax,%eax
 137:	75 47                	jne    180 <matchhere+0xb0>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
 139:	0f be 13             	movsbl (%ebx),%edx
 13c:	84 d2                	test   %dl,%dl
 13e:	74 45                	je     185 <matchhere+0xb5>
 140:	83 c3 01             	add    $0x1,%ebx
 143:	39 fa                	cmp    %edi,%edx
 145:	74 e1                	je     128 <matchhere+0x58>
 147:	83 ff 2e             	cmp    $0x2e,%edi
 14a:	74 dc                	je     128 <matchhere+0x58>
 14c:	eb 37                	jmp    185 <matchhere+0xb5>
 14e:	66 90                	xchg   %ax,%ax
  if(re[0] == '$' && re[1] == '\0')
 150:	84 c0                	test   %al,%al
 152:	74 39                	je     18d <matchhere+0xbd>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 154:	89 f2                	mov    %esi,%edx
 156:	84 d2                	test   %dl,%dl
 158:	74 1a                	je     174 <matchhere+0xa4>
 15a:	80 fa 24             	cmp    $0x24,%dl
 15d:	75 15                	jne    174 <matchhere+0xa4>
    return matchhere(re+1, text+1);
 15f:	83 c3 01             	add    $0x1,%ebx
 162:	83 c7 01             	add    $0x1,%edi
{
 165:	89 c1                	mov    %eax,%ecx
 167:	eb ae                	jmp    117 <matchhere+0x47>
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 170:	38 ca                	cmp    %cl,%dl
 172:	74 97                	je     10b <matchhere+0x3b>
}
 174:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
 177:	31 c0                	xor    %eax,%eax
}
 179:	5b                   	pop    %ebx
 17a:	5e                   	pop    %esi
 17b:	5f                   	pop    %edi
 17c:	5d                   	pop    %ebp
 17d:	c3                   	ret
 17e:	66 90                	xchg   %ax,%ax
    return 1;
 180:	b8 01 00 00 00       	mov    $0x1,%eax
}
 185:	8d 65 f4             	lea    -0xc(%ebp),%esp
 188:	5b                   	pop    %ebx
 189:	5e                   	pop    %esi
 18a:	5f                   	pop    %edi
 18b:	5d                   	pop    %ebp
 18c:	c3                   	ret
    return *text == '\0';
 18d:	89 f0                	mov    %esi,%eax
 18f:	84 c0                	test   %al,%al
 191:	0f 94 c0             	sete   %al
 194:	0f b6 c0             	movzbl %al,%eax
 197:	eb ec                	jmp    185 <matchhere+0xb5>
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <match>:
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	56                   	push   %esi
 1a4:	53                   	push   %ebx
 1a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 1a8:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(re[0] == '^')
 1ab:	80 3b 5e             	cmpb   $0x5e,(%ebx)
 1ae:	75 11                	jne    1c1 <match+0x21>
 1b0:	eb 2e                	jmp    1e0 <match+0x40>
 1b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 1b8:	83 c6 01             	add    $0x1,%esi
 1bb:	80 7e ff 00          	cmpb   $0x0,-0x1(%esi)
 1bf:	74 16                	je     1d7 <match+0x37>
    if(matchhere(re, text))
 1c1:	83 ec 08             	sub    $0x8,%esp
 1c4:	56                   	push   %esi
 1c5:	53                   	push   %ebx
 1c6:	e8 05 ff ff ff       	call   d0 <matchhere>
 1cb:	83 c4 10             	add    $0x10,%esp
 1ce:	85 c0                	test   %eax,%eax
 1d0:	74 e6                	je     1b8 <match+0x18>
      return 1;
 1d2:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1d7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1da:	5b                   	pop    %ebx
 1db:	5e                   	pop    %esi
 1dc:	5d                   	pop    %ebp
 1dd:	c3                   	ret
 1de:	66 90                	xchg   %ax,%ax
    return matchhere(re+1, text);
 1e0:	83 c3 01             	add    $0x1,%ebx
 1e3:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
 1e6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1e9:	5b                   	pop    %ebx
 1ea:	5e                   	pop    %esi
 1eb:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 1ec:	e9 df fe ff ff       	jmp    d0 <matchhere>
 1f1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1f8:	00 
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000200 <grep>:
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
  m = 0;
 204:	31 ff                	xor    %edi,%edi
{
 206:	56                   	push   %esi
 207:	53                   	push   %ebx
 208:	83 ec 1c             	sub    $0x1c,%esp
 20b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 20e:	89 7d e0             	mov    %edi,-0x20(%ebp)
    return matchhere(re+1, text);
 211:	8d 43 01             	lea    0x1(%ebx),%eax
 214:	89 45 dc             	mov    %eax,-0x24(%ebp)
 217:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 21e:	00 
 21f:	90                   	nop
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 220:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 223:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 228:	83 ec 04             	sub    $0x4,%esp
 22b:	29 c8                	sub    %ecx,%eax
 22d:	50                   	push   %eax
 22e:	8d 81 e0 0e 00 00    	lea    0xee0(%ecx),%eax
 234:	50                   	push   %eax
 235:	ff 75 0c             	push   0xc(%ebp)
 238:	e8 dd 03 00 00       	call   61a <read>
 23d:	83 c4 10             	add    $0x10,%esp
 240:	85 c0                	test   %eax,%eax
 242:	0f 8e fd 00 00 00    	jle    345 <grep+0x145>
    m += n;
 248:	01 45 e0             	add    %eax,-0x20(%ebp)
 24b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    buf[m] = '\0';
 24e:	bf e0 0e 00 00       	mov    $0xee0,%edi
 253:	89 de                	mov    %ebx,%esi
 255:	c6 81 e0 0e 00 00 00 	movb   $0x0,0xee0(%ecx)
    while((q = strchr(p, '\n')) != 0){
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 260:	83 ec 08             	sub    $0x8,%esp
 263:	6a 0a                	push   $0xa
 265:	57                   	push   %edi
 266:	e8 25 02 00 00       	call   490 <strchr>
 26b:	83 c4 10             	add    $0x10,%esp
 26e:	89 c2                	mov    %eax,%edx
 270:	85 c0                	test   %eax,%eax
 272:	0f 84 88 00 00 00    	je     300 <grep+0x100>
      *q = 0;
 278:	c6 02 00             	movb   $0x0,(%edx)
  if(re[0] == '^')
 27b:	80 3e 5e             	cmpb   $0x5e,(%esi)
 27e:	74 58                	je     2d8 <grep+0xd8>
 280:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 283:	89 d3                	mov    %edx,%ebx
 285:	eb 12                	jmp    299 <grep+0x99>
 287:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 28e:	00 
 28f:	90                   	nop
  }while(*text++ != '\0');
 290:	83 c7 01             	add    $0x1,%edi
 293:	80 7f ff 00          	cmpb   $0x0,-0x1(%edi)
 297:	74 37                	je     2d0 <grep+0xd0>
    if(matchhere(re, text))
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	57                   	push   %edi
 29d:	56                   	push   %esi
 29e:	e8 2d fe ff ff       	call   d0 <matchhere>
 2a3:	83 c4 10             	add    $0x10,%esp
 2a6:	85 c0                	test   %eax,%eax
 2a8:	74 e6                	je     290 <grep+0x90>
        write(1, p, q+1 - p);
 2aa:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 2ad:	89 da                	mov    %ebx,%edx
 2af:	8d 5b 01             	lea    0x1(%ebx),%ebx
 2b2:	89 d8                	mov    %ebx,%eax
 2b4:	83 ec 04             	sub    $0x4,%esp
        *q = '\n';
 2b7:	c6 02 0a             	movb   $0xa,(%edx)
        write(1, p, q+1 - p);
 2ba:	29 f8                	sub    %edi,%eax
 2bc:	50                   	push   %eax
 2bd:	57                   	push   %edi
 2be:	89 df                	mov    %ebx,%edi
 2c0:	6a 01                	push   $0x1
 2c2:	e8 5b 03 00 00       	call   622 <write>
 2c7:	83 c4 10             	add    $0x10,%esp
 2ca:	eb 94                	jmp    260 <grep+0x60>
 2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2d0:	8d 7b 01             	lea    0x1(%ebx),%edi
      p = q+1;
 2d3:	eb 8b                	jmp    260 <grep+0x60>
 2d5:	8d 76 00             	lea    0x0(%esi),%esi
    return matchhere(re+1, text);
 2d8:	83 ec 08             	sub    $0x8,%esp
 2db:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 2de:	57                   	push   %edi
 2df:	ff 75 dc             	push   -0x24(%ebp)
 2e2:	e8 e9 fd ff ff       	call   d0 <matchhere>
        write(1, p, q+1 - p);
 2e7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    return matchhere(re+1, text);
 2ea:	83 c4 10             	add    $0x10,%esp
        write(1, p, q+1 - p);
 2ed:	8d 5a 01             	lea    0x1(%edx),%ebx
      if(match(pattern, p)){
 2f0:	85 c0                	test   %eax,%eax
 2f2:	75 be                	jne    2b2 <grep+0xb2>
        write(1, p, q+1 - p);
 2f4:	89 df                	mov    %ebx,%edi
 2f6:	e9 65 ff ff ff       	jmp    260 <grep+0x60>
 2fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(p == buf)
 300:	89 f3                	mov    %esi,%ebx
 302:	81 ff e0 0e 00 00    	cmp    $0xee0,%edi
 308:	74 2f                	je     339 <grep+0x139>
    if(m > 0){
 30a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 30d:	85 c0                	test   %eax,%eax
 30f:	0f 8e 0b ff ff ff    	jle    220 <grep+0x20>
      m -= p - buf;
 315:	89 f8                	mov    %edi,%eax
      memmove(buf, p, m);
 317:	83 ec 04             	sub    $0x4,%esp
      m -= p - buf;
 31a:	2d e0 0e 00 00       	sub    $0xee0,%eax
 31f:	29 45 e0             	sub    %eax,-0x20(%ebp)
 322:	8b 4d e0             	mov    -0x20(%ebp),%ecx
      memmove(buf, p, m);
 325:	51                   	push   %ecx
 326:	57                   	push   %edi
 327:	68 e0 0e 00 00       	push   $0xee0
 32c:	e8 8f 02 00 00       	call   5c0 <memmove>
 331:	83 c4 10             	add    $0x10,%esp
 334:	e9 e7 fe ff ff       	jmp    220 <grep+0x20>
      m = 0;
 339:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 340:	e9 db fe ff ff       	jmp    220 <grep+0x20>
}
 345:	8d 65 f4             	lea    -0xc(%ebp),%esp
 348:	5b                   	pop    %ebx
 349:	5e                   	pop    %esi
 34a:	5f                   	pop    %edi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret
 34d:	8d 76 00             	lea    0x0(%esi),%esi

00000350 <matchstar>:
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
 356:	83 ec 0c             	sub    $0xc,%esp
 359:	8b 5d 08             	mov    0x8(%ebp),%ebx
 35c:	8b 75 0c             	mov    0xc(%ebp),%esi
 35f:	8b 7d 10             	mov    0x10(%ebp),%edi
 362:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(matchhere(re, text))
 368:	83 ec 08             	sub    $0x8,%esp
 36b:	57                   	push   %edi
 36c:	56                   	push   %esi
 36d:	e8 5e fd ff ff       	call   d0 <matchhere>
 372:	83 c4 10             	add    $0x10,%esp
 375:	85 c0                	test   %eax,%eax
 377:	75 1f                	jne    398 <matchstar+0x48>
  }while(*text!='\0' && (*text++==c || c=='.'));
 379:	0f be 17             	movsbl (%edi),%edx
 37c:	84 d2                	test   %dl,%dl
 37e:	74 0c                	je     38c <matchstar+0x3c>
 380:	83 c7 01             	add    $0x1,%edi
 383:	83 fb 2e             	cmp    $0x2e,%ebx
 386:	74 e0                	je     368 <matchstar+0x18>
 388:	39 da                	cmp    %ebx,%edx
 38a:	74 dc                	je     368 <matchstar+0x18>
}
 38c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 38f:	5b                   	pop    %ebx
 390:	5e                   	pop    %esi
 391:	5f                   	pop    %edi
 392:	5d                   	pop    %ebp
 393:	c3                   	ret
 394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 398:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 1;
 39b:	b8 01 00 00 00       	mov    $0x1,%eax
}
 3a0:	5b                   	pop    %ebx
 3a1:	5e                   	pop    %esi
 3a2:	5f                   	pop    %edi
 3a3:	5d                   	pop    %ebp
 3a4:	c3                   	ret
 3a5:	66 90                	xchg   %ax,%ax
 3a7:	66 90                	xchg   %ax,%ax
 3a9:	66 90                	xchg   %ax,%ax
 3ab:	66 90                	xchg   %ax,%ax
 3ad:	66 90                	xchg   %ax,%ax
 3af:	90                   	nop

000003b0 <strcpy>:
#include "user.h"
#include "x86.h"

// String and memory utilities

char* strcpy(char *s, const char *t) {
 3b0:	55                   	push   %ebp
  char *os = s;
  while ((*s++ = *t++) != 0);
 3b1:	31 c0                	xor    %eax,%eax
char* strcpy(char *s, const char *t) {
 3b3:	89 e5                	mov    %esp,%ebp
 3b5:	53                   	push   %ebx
 3b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0);
 3c0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 3c4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 3c7:	83 c0 01             	add    $0x1,%eax
 3ca:	84 d2                	test   %dl,%dl
 3cc:	75 f2                	jne    3c0 <strcpy+0x10>
  return os;
}
 3ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3d1:	89 c8                	mov    %ecx,%eax
 3d3:	c9                   	leave
 3d4:	c3                   	ret
 3d5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 3dc:	00 
 3dd:	8d 76 00             	lea    0x0(%esi),%esi

000003e0 <strcmp>:

int strcmp(const char *p, const char *q) {
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	53                   	push   %ebx
 3e4:	8b 55 08             	mov    0x8(%ebp),%edx
 3e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
 3ea:	0f b6 02             	movzbl (%edx),%eax
 3ed:	84 c0                	test   %al,%al
 3ef:	75 17                	jne    408 <strcmp+0x28>
 3f1:	eb 3a                	jmp    42d <strcmp+0x4d>
 3f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 3f8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 3fc:	83 c2 01             	add    $0x1,%edx
 3ff:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
 402:	84 c0                	test   %al,%al
 404:	74 1a                	je     420 <strcmp+0x40>
 406:	89 d9                	mov    %ebx,%ecx
 408:	0f b6 19             	movzbl (%ecx),%ebx
 40b:	38 c3                	cmp    %al,%bl
 40d:	74 e9                	je     3f8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 40f:	29 d8                	sub    %ebx,%eax
}
 411:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 414:	c9                   	leave
 415:	c3                   	ret
 416:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 41d:	00 
 41e:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
 420:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 424:	31 c0                	xor    %eax,%eax
 426:	29 d8                	sub    %ebx,%eax
}
 428:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 42b:	c9                   	leave
 42c:	c3                   	ret
  return (uchar)*p - (uchar)*q;
 42d:	0f b6 19             	movzbl (%ecx),%ebx
 430:	31 c0                	xor    %eax,%eax
 432:	eb db                	jmp    40f <strcmp+0x2f>
 434:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 43b:	00 
 43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000440 <strlen>:

uint strlen(const char *s) {
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;
  for (n = 0; s[n]; n++);
 446:	80 3a 00             	cmpb   $0x0,(%edx)
 449:	74 15                	je     460 <strlen+0x20>
 44b:	31 c0                	xor    %eax,%eax
 44d:	8d 76 00             	lea    0x0(%esi),%esi
 450:	83 c0 01             	add    $0x1,%eax
 453:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 457:	89 c1                	mov    %eax,%ecx
 459:	75 f5                	jne    450 <strlen+0x10>
  return n;
}
 45b:	89 c8                	mov    %ecx,%eax
 45d:	5d                   	pop    %ebp
 45e:	c3                   	ret
 45f:	90                   	nop
  for (n = 0; s[n]; n++);
 460:	31 c9                	xor    %ecx,%ecx
}
 462:	5d                   	pop    %ebp
 463:	89 c8                	mov    %ecx,%eax
 465:	c3                   	ret
 466:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 46d:	00 
 46e:	66 90                	xchg   %ax,%ax

00000470 <memset>:

void* memset(void *dst, int c, uint n) {
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	8b 55 08             	mov    0x8(%ebp),%edx
               "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 477:	8b 4d 10             	mov    0x10(%ebp),%ecx
 47a:	8b 45 0c             	mov    0xc(%ebp),%eax
 47d:	89 d7                	mov    %edx,%edi
 47f:	fc                   	cld
 480:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 482:	8b 7d fc             	mov    -0x4(%ebp),%edi
 485:	89 d0                	mov    %edx,%eax
 487:	c9                   	leave
 488:	c3                   	ret
 489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000490 <strchr>:

char* strchr(const char *s, int c) {
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	8b 45 08             	mov    0x8(%ebp),%eax
 496:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  for (; *s; s++)
 499:	0f be 10             	movsbl (%eax),%edx
 49c:	84 d2                	test   %dl,%dl
 49e:	75 13                	jne    4b3 <strchr+0x23>
 4a0:	eb 1e                	jmp    4c0 <strchr+0x30>
 4a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4a8:	0f be 50 01          	movsbl 0x1(%eax),%edx
 4ac:	83 c0 01             	add    $0x1,%eax
 4af:	84 d2                	test   %dl,%dl
 4b1:	74 0d                	je     4c0 <strchr+0x30>
    if (*s == c)
 4b3:	39 ca                	cmp    %ecx,%edx
 4b5:	75 f1                	jne    4a8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 4b7:	5d                   	pop    %ebp
 4b8:	c3                   	ret
 4b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 4c0:	31 c0                	xor    %eax,%eax
}
 4c2:	5d                   	pop    %ebp
 4c3:	c3                   	ret
 4c4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 4cb:	00 
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004d0 <gets>:

char* gets(char *buf, int max) {
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
  int i, cc;
  char c;
  for (i = 0; i+1 < max;) {
    cc = read(0, &c, 1);
 4d5:	8d 75 e7             	lea    -0x19(%ebp),%esi
char* gets(char *buf, int max) {
 4d8:	53                   	push   %ebx
  for (i = 0; i+1 < max;) {
 4d9:	31 db                	xor    %ebx,%ebx
char* gets(char *buf, int max) {
 4db:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i+1 < max;) {
 4de:	eb 27                	jmp    507 <gets+0x37>
    cc = read(0, &c, 1);
 4e0:	83 ec 04             	sub    $0x4,%esp
 4e3:	6a 01                	push   $0x1
 4e5:	56                   	push   %esi
 4e6:	6a 00                	push   $0x0
 4e8:	e8 2d 01 00 00       	call   61a <read>
    if (cc < 1) break;
 4ed:	83 c4 10             	add    $0x10,%esp
 4f0:	85 c0                	test   %eax,%eax
 4f2:	7e 1d                	jle    511 <gets+0x41>
    buf[i++] = c;
 4f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4f8:	8b 55 08             	mov    0x8(%ebp),%edx
 4fb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r') break;
 4ff:	3c 0a                	cmp    $0xa,%al
 501:	74 10                	je     513 <gets+0x43>
 503:	3c 0d                	cmp    $0xd,%al
 505:	74 0c                	je     513 <gets+0x43>
  for (i = 0; i+1 < max;) {
 507:	89 df                	mov    %ebx,%edi
 509:	83 c3 01             	add    $0x1,%ebx
 50c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 50f:	7c cf                	jl     4e0 <gets+0x10>
 511:	89 fb                	mov    %edi,%ebx
  }
  buf[i] = '\0';
 513:	8b 45 08             	mov    0x8(%ebp),%eax
 516:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 51a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51d:	5b                   	pop    %ebx
 51e:	5e                   	pop    %esi
 51f:	5f                   	pop    %edi
 520:	5d                   	pop    %ebp
 521:	c3                   	ret
 522:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 529:	00 
 52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000530 <stat>:

int stat(const char *n, struct stat *st) {
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	56                   	push   %esi
 534:	53                   	push   %ebx
  int fd, r;
  fd = open(n, O_RDONLY);
 535:	83 ec 08             	sub    $0x8,%esp
 538:	6a 00                	push   $0x0
 53a:	ff 75 08             	push   0x8(%ebp)
 53d:	e8 00 01 00 00       	call   642 <open>
  if (fd < 0) return -1;
 542:	83 c4 10             	add    $0x10,%esp
 545:	85 c0                	test   %eax,%eax
 547:	78 27                	js     570 <stat+0x40>
  r = fstat(fd, st);
 549:	83 ec 08             	sub    $0x8,%esp
 54c:	ff 75 0c             	push   0xc(%ebp)
 54f:	89 c3                	mov    %eax,%ebx
 551:	50                   	push   %eax
 552:	e8 03 01 00 00       	call   65a <fstat>
  close(fd);
 557:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 55a:	89 c6                	mov    %eax,%esi
  close(fd);
 55c:	e8 c9 00 00 00       	call   62a <close>
  return r;
 561:	83 c4 10             	add    $0x10,%esp
}
 564:	8d 65 f8             	lea    -0x8(%ebp),%esp
 567:	89 f0                	mov    %esi,%eax
 569:	5b                   	pop    %ebx
 56a:	5e                   	pop    %esi
 56b:	5d                   	pop    %ebp
 56c:	c3                   	ret
 56d:	8d 76 00             	lea    0x0(%esi),%esi
  if (fd < 0) return -1;
 570:	be ff ff ff ff       	mov    $0xffffffff,%esi
 575:	eb ed                	jmp    564 <stat+0x34>
 577:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 57e:	00 
 57f:	90                   	nop

00000580 <atoi>:

int atoi(const char *s) {
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	53                   	push   %ebx
 584:	8b 55 08             	mov    0x8(%ebp),%edx
  int n = 0;
  while ('0' <= *s && *s <= '9')
 587:	0f be 02             	movsbl (%edx),%eax
 58a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 58d:	80 f9 09             	cmp    $0x9,%cl
  int n = 0;
 590:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
 595:	77 1e                	ja     5b5 <atoi+0x35>
 597:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 59e:	00 
 59f:	90                   	nop
    n = n*10 + *s++ - '0';
 5a0:	83 c2 01             	add    $0x1,%edx
 5a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 5a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
 5aa:	0f be 02             	movsbl (%edx),%eax
 5ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5b0:	80 fb 09             	cmp    $0x9,%bl
 5b3:	76 eb                	jbe    5a0 <atoi+0x20>
  return n;
}
 5b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5b8:	89 c8                	mov    %ecx,%eax
 5ba:	c9                   	leave
 5bb:	c3                   	ret
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005c0 <memmove>:

void* memmove(void *vdst, const void *vsrc, int n) {
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	8b 45 10             	mov    0x10(%ebp),%eax
 5c7:	8b 55 08             	mov    0x8(%ebp),%edx
 5ca:	56                   	push   %esi
 5cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst = vdst;
  const char *src = vsrc;
  while (n-- > 0)
 5ce:	85 c0                	test   %eax,%eax
 5d0:	7e 13                	jle    5e5 <memmove+0x25>
 5d2:	01 d0                	add    %edx,%eax
  char *dst = vdst;
 5d4:	89 d7                	mov    %edx,%edi
 5d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 5dd:	00 
 5de:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 5e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
 5e1:	39 f8                	cmp    %edi,%eax
 5e3:	75 fb                	jne    5e0 <memmove+0x20>
  return vdst;
}
 5e5:	5e                   	pop    %esi
 5e6:	89 d0                	mov    %edx,%eax
 5e8:	5f                   	pop    %edi
 5e9:	5d                   	pop    %ebp
 5ea:	c3                   	ret
 5eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000005f0 <syscall>:

// Add syscall definition for internal use
int syscall(int num, ...) {
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
    int ret;
    asm volatile("int $64" : "=a" (ret) : "a" (num));
 5f3:	8b 45 08             	mov    0x8(%ebp),%eax
 5f6:	cd 40                	int    $0x40
    return ret;
}
 5f8:	5d                   	pop    %ebp
 5f9:	c3                   	ret

000005fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5fa:	b8 01 00 00 00       	mov    $0x1,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret

00000602 <exit>:
SYSCALL(exit)
 602:	b8 02 00 00 00       	mov    $0x2,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret

0000060a <wait>:
SYSCALL(wait)
 60a:	b8 03 00 00 00       	mov    $0x3,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret

00000612 <pipe>:
SYSCALL(pipe)
 612:	b8 04 00 00 00       	mov    $0x4,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret

0000061a <read>:
SYSCALL(read)
 61a:	b8 05 00 00 00       	mov    $0x5,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret

00000622 <write>:
SYSCALL(write)
 622:	b8 10 00 00 00       	mov    $0x10,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret

0000062a <close>:
SYSCALL(close)
 62a:	b8 15 00 00 00       	mov    $0x15,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret

00000632 <kill>:
SYSCALL(kill)
 632:	b8 06 00 00 00       	mov    $0x6,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret

0000063a <exec>:
SYSCALL(exec)
 63a:	b8 07 00 00 00       	mov    $0x7,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret

00000642 <open>:
SYSCALL(open)
 642:	b8 0f 00 00 00       	mov    $0xf,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret

0000064a <mknod>:
SYSCALL(mknod)
 64a:	b8 11 00 00 00       	mov    $0x11,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret

00000652 <unlink>:
SYSCALL(unlink)
 652:	b8 12 00 00 00       	mov    $0x12,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret

0000065a <fstat>:
SYSCALL(fstat)
 65a:	b8 08 00 00 00       	mov    $0x8,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret

00000662 <link>:
SYSCALL(link)
 662:	b8 13 00 00 00       	mov    $0x13,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret

0000066a <mkdir>:
SYSCALL(mkdir)
 66a:	b8 14 00 00 00       	mov    $0x14,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret

00000672 <chdir>:
SYSCALL(chdir)
 672:	b8 09 00 00 00       	mov    $0x9,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret

0000067a <dup>:
SYSCALL(dup)
 67a:	b8 0a 00 00 00       	mov    $0xa,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret

00000682 <getpid>:
SYSCALL(getpid)
 682:	b8 0b 00 00 00       	mov    $0xb,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret

0000068a <sbrk>:
SYSCALL(sbrk)
 68a:	b8 0c 00 00 00       	mov    $0xc,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret

00000692 <sleep>:
SYSCALL(sleep)
 692:	b8 0d 00 00 00       	mov    $0xd,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret

0000069a <uptime>:
SYSCALL(uptime)
 69a:	b8 0e 00 00 00       	mov    $0xe,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret

000006a2 <spawn>:
SYSCALL(spawn)
 6a2:	b8 16 00 00 00       	mov    $0x16,%eax
 6a7:	cd 40                	int    $0x40
 6a9:	c3                   	ret

000006aa <shm_open>:
SYSCALL(shm_open)
 6aa:	b8 17 00 00 00       	mov    $0x17,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret

000006b2 <shm_attach>:
SYSCALL(shm_attach)
 6b2:	b8 18 00 00 00       	mov    $0x18,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret

000006ba <thread_create>:
SYSCALL(thread_create)
 6ba:	b8 19 00 00 00       	mov    $0x19,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret

000006c2 <thread_join>:
SYSCALL(thread_join)
 6c2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret

000006ca <mutex_lock>:
SYSCALL(mutex_lock)
 6ca:	b8 1b 00 00 00       	mov    $0x1b,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret

000006d2 <mutex_unlock>:
SYSCALL(mutex_unlock)
 6d2:	b8 1c 00 00 00       	mov    $0x1c,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret

000006da <signal>:
SYSCALL(signal)
 6da:	b8 1d 00 00 00       	mov    $0x1d,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret
 6e2:	66 90                	xchg   %ax,%ax
 6e4:	66 90                	xchg   %ax,%ax
 6e6:	66 90                	xchg   %ax,%ax
 6e8:	66 90                	xchg   %ax,%ax
 6ea:	66 90                	xchg   %ax,%ax
 6ec:	66 90                	xchg   %ax,%ax
 6ee:	66 90                	xchg   %ax,%ax

000006f0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 6f8:	89 d1                	mov    %edx,%ecx
{
 6fa:	83 ec 3c             	sub    $0x3c,%esp
 6fd:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 700:	85 d2                	test   %edx,%edx
 702:	0f 89 80 00 00 00    	jns    788 <printint+0x98>
 708:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 70c:	74 7a                	je     788 <printint+0x98>
    x = -xx;
 70e:	f7 d9                	neg    %ecx
    neg = 1;
 710:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 715:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 718:	31 f6                	xor    %esi,%esi
 71a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 720:	89 c8                	mov    %ecx,%eax
 722:	31 d2                	xor    %edx,%edx
 724:	89 f7                	mov    %esi,%edi
 726:	f7 f3                	div    %ebx
 728:	8d 76 01             	lea    0x1(%esi),%esi
 72b:	0f b6 92 30 0b 00 00 	movzbl 0xb30(%edx),%edx
 732:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 736:	89 ca                	mov    %ecx,%edx
 738:	89 c1                	mov    %eax,%ecx
 73a:	39 da                	cmp    %ebx,%edx
 73c:	73 e2                	jae    720 <printint+0x30>
  if(neg)
 73e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 741:	85 c0                	test   %eax,%eax
 743:	74 07                	je     74c <printint+0x5c>
    buf[i++] = '-';
 745:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 74a:	89 f7                	mov    %esi,%edi
 74c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 74f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 752:	01 df                	add    %ebx,%edi
 754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 758:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 75b:	83 ec 04             	sub    $0x4,%esp
 75e:	88 45 d7             	mov    %al,-0x29(%ebp)
 761:	8d 45 d7             	lea    -0x29(%ebp),%eax
 764:	6a 01                	push   $0x1
 766:	50                   	push   %eax
 767:	56                   	push   %esi
 768:	e8 b5 fe ff ff       	call   622 <write>
  while(--i >= 0)
 76d:	89 f8                	mov    %edi,%eax
 76f:	83 c4 10             	add    $0x10,%esp
 772:	83 ef 01             	sub    $0x1,%edi
 775:	39 c3                	cmp    %eax,%ebx
 777:	75 df                	jne    758 <printint+0x68>
}
 779:	8d 65 f4             	lea    -0xc(%ebp),%esp
 77c:	5b                   	pop    %ebx
 77d:	5e                   	pop    %esi
 77e:	5f                   	pop    %edi
 77f:	5d                   	pop    %ebp
 780:	c3                   	ret
 781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 788:	31 c0                	xor    %eax,%eax
 78a:	eb 89                	jmp    715 <printint+0x25>
 78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000790 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	57                   	push   %edi
 794:	56                   	push   %esi
 795:	53                   	push   %ebx
 796:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 799:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 79c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 79f:	0f b6 1e             	movzbl (%esi),%ebx
 7a2:	83 c6 01             	add    $0x1,%esi
 7a5:	84 db                	test   %bl,%bl
 7a7:	74 67                	je     810 <printf+0x80>
 7a9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 7ac:	31 d2                	xor    %edx,%edx
 7ae:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 7b1:	eb 34                	jmp    7e7 <printf+0x57>
 7b3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 7b8:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 7bb:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 7c0:	83 f8 25             	cmp    $0x25,%eax
 7c3:	74 18                	je     7dd <printf+0x4d>
  write(fd, &c, 1);
 7c5:	83 ec 04             	sub    $0x4,%esp
 7c8:	8d 45 e7             	lea    -0x19(%ebp),%eax
 7cb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 7ce:	6a 01                	push   $0x1
 7d0:	50                   	push   %eax
 7d1:	57                   	push   %edi
 7d2:	e8 4b fe ff ff       	call   622 <write>
 7d7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 7da:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7dd:	0f b6 1e             	movzbl (%esi),%ebx
 7e0:	83 c6 01             	add    $0x1,%esi
 7e3:	84 db                	test   %bl,%bl
 7e5:	74 29                	je     810 <printf+0x80>
    c = fmt[i] & 0xff;
 7e7:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 7ea:	85 d2                	test   %edx,%edx
 7ec:	74 ca                	je     7b8 <printf+0x28>
      }
    } else if(state == '%'){
 7ee:	83 fa 25             	cmp    $0x25,%edx
 7f1:	75 ea                	jne    7dd <printf+0x4d>
      if(c == 'd'){
 7f3:	83 f8 25             	cmp    $0x25,%eax
 7f6:	0f 84 04 01 00 00    	je     900 <printf+0x170>
 7fc:	83 e8 63             	sub    $0x63,%eax
 7ff:	83 f8 15             	cmp    $0x15,%eax
 802:	77 1c                	ja     820 <printf+0x90>
 804:	ff 24 85 d8 0a 00 00 	jmp    *0xad8(,%eax,4)
 80b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 810:	8d 65 f4             	lea    -0xc(%ebp),%esp
 813:	5b                   	pop    %ebx
 814:	5e                   	pop    %esi
 815:	5f                   	pop    %edi
 816:	5d                   	pop    %ebp
 817:	c3                   	ret
 818:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 81f:	00 
  write(fd, &c, 1);
 820:	83 ec 04             	sub    $0x4,%esp
 823:	8d 55 e7             	lea    -0x19(%ebp),%edx
 826:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 82a:	6a 01                	push   $0x1
 82c:	52                   	push   %edx
 82d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 830:	57                   	push   %edi
 831:	e8 ec fd ff ff       	call   622 <write>
 836:	83 c4 0c             	add    $0xc,%esp
 839:	88 5d e7             	mov    %bl,-0x19(%ebp)
 83c:	6a 01                	push   $0x1
 83e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 841:	52                   	push   %edx
 842:	57                   	push   %edi
 843:	e8 da fd ff ff       	call   622 <write>
        putc(fd, c);
 848:	83 c4 10             	add    $0x10,%esp
      state = 0;
 84b:	31 d2                	xor    %edx,%edx
 84d:	eb 8e                	jmp    7dd <printf+0x4d>
 84f:	90                   	nop
        printint(fd, *ap, 16, 0);
 850:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 853:	83 ec 0c             	sub    $0xc,%esp
 856:	b9 10 00 00 00       	mov    $0x10,%ecx
 85b:	8b 13                	mov    (%ebx),%edx
 85d:	6a 00                	push   $0x0
 85f:	89 f8                	mov    %edi,%eax
        ap++;
 861:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 864:	e8 87 fe ff ff       	call   6f0 <printint>
        ap++;
 869:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 86c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 86f:	31 d2                	xor    %edx,%edx
 871:	e9 67 ff ff ff       	jmp    7dd <printf+0x4d>
        s = (char*)*ap;
 876:	8b 45 d0             	mov    -0x30(%ebp),%eax
 879:	8b 18                	mov    (%eax),%ebx
        ap++;
 87b:	83 c0 04             	add    $0x4,%eax
 87e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 881:	85 db                	test   %ebx,%ebx
 883:	0f 84 87 00 00 00    	je     910 <printf+0x180>
        while(*s != 0){
 889:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 88c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 88e:	84 c0                	test   %al,%al
 890:	0f 84 47 ff ff ff    	je     7dd <printf+0x4d>
 896:	8d 55 e7             	lea    -0x19(%ebp),%edx
 899:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 89c:	89 de                	mov    %ebx,%esi
 89e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 8a0:	83 ec 04             	sub    $0x4,%esp
 8a3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 8a6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 8a9:	6a 01                	push   $0x1
 8ab:	53                   	push   %ebx
 8ac:	57                   	push   %edi
 8ad:	e8 70 fd ff ff       	call   622 <write>
        while(*s != 0){
 8b2:	0f b6 06             	movzbl (%esi),%eax
 8b5:	83 c4 10             	add    $0x10,%esp
 8b8:	84 c0                	test   %al,%al
 8ba:	75 e4                	jne    8a0 <printf+0x110>
      state = 0;
 8bc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 8bf:	31 d2                	xor    %edx,%edx
 8c1:	e9 17 ff ff ff       	jmp    7dd <printf+0x4d>
        printint(fd, *ap, 10, 1);
 8c6:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 8c9:	83 ec 0c             	sub    $0xc,%esp
 8cc:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8d1:	8b 13                	mov    (%ebx),%edx
 8d3:	6a 01                	push   $0x1
 8d5:	eb 88                	jmp    85f <printf+0xcf>
        putc(fd, *ap);
 8d7:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 8da:	83 ec 04             	sub    $0x4,%esp
 8dd:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 8e0:	8b 03                	mov    (%ebx),%eax
        ap++;
 8e2:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 8e5:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 8e8:	6a 01                	push   $0x1
 8ea:	52                   	push   %edx
 8eb:	57                   	push   %edi
 8ec:	e8 31 fd ff ff       	call   622 <write>
        ap++;
 8f1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 8f4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8f7:	31 d2                	xor    %edx,%edx
 8f9:	e9 df fe ff ff       	jmp    7dd <printf+0x4d>
 8fe:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 900:	83 ec 04             	sub    $0x4,%esp
 903:	88 5d e7             	mov    %bl,-0x19(%ebp)
 906:	8d 55 e7             	lea    -0x19(%ebp),%edx
 909:	6a 01                	push   $0x1
 90b:	e9 31 ff ff ff       	jmp    841 <printf+0xb1>
 910:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 915:	bb ce 0a 00 00       	mov    $0xace,%ebx
 91a:	e9 77 ff ff ff       	jmp    896 <printf+0x106>
 91f:	90                   	nop

00000920 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 920:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 921:	a1 e0 12 00 00       	mov    0x12e0,%eax
{
 926:	89 e5                	mov    %esp,%ebp
 928:	57                   	push   %edi
 929:	56                   	push   %esi
 92a:	53                   	push   %ebx
 92b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 92e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 931:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 938:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 93a:	39 c8                	cmp    %ecx,%eax
 93c:	73 32                	jae    970 <free+0x50>
 93e:	39 d1                	cmp    %edx,%ecx
 940:	72 04                	jb     946 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 942:	39 d0                	cmp    %edx,%eax
 944:	72 32                	jb     978 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 946:	8b 73 fc             	mov    -0x4(%ebx),%esi
 949:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 94c:	39 fa                	cmp    %edi,%edx
 94e:	74 30                	je     980 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 950:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 953:	8b 50 04             	mov    0x4(%eax),%edx
 956:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 959:	39 f1                	cmp    %esi,%ecx
 95b:	74 3a                	je     997 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 95d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 95f:	5b                   	pop    %ebx
  freep = p;
 960:	a3 e0 12 00 00       	mov    %eax,0x12e0
}
 965:	5e                   	pop    %esi
 966:	5f                   	pop    %edi
 967:	5d                   	pop    %ebp
 968:	c3                   	ret
 969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 970:	39 d0                	cmp    %edx,%eax
 972:	72 04                	jb     978 <free+0x58>
 974:	39 d1                	cmp    %edx,%ecx
 976:	72 ce                	jb     946 <free+0x26>
{
 978:	89 d0                	mov    %edx,%eax
 97a:	eb bc                	jmp    938 <free+0x18>
 97c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 980:	03 72 04             	add    0x4(%edx),%esi
 983:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 986:	8b 10                	mov    (%eax),%edx
 988:	8b 12                	mov    (%edx),%edx
 98a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 98d:	8b 50 04             	mov    0x4(%eax),%edx
 990:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 993:	39 f1                	cmp    %esi,%ecx
 995:	75 c6                	jne    95d <free+0x3d>
    p->s.size += bp->s.size;
 997:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 99a:	a3 e0 12 00 00       	mov    %eax,0x12e0
    p->s.size += bp->s.size;
 99f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9a2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 9a5:	89 08                	mov    %ecx,(%eax)
}
 9a7:	5b                   	pop    %ebx
 9a8:	5e                   	pop    %esi
 9a9:	5f                   	pop    %edi
 9aa:	5d                   	pop    %ebp
 9ab:	c3                   	ret
 9ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
 9b3:	57                   	push   %edi
 9b4:	56                   	push   %esi
 9b5:	53                   	push   %ebx
 9b6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 9bc:	8b 15 e0 12 00 00    	mov    0x12e0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9c2:	8d 78 07             	lea    0x7(%eax),%edi
 9c5:	c1 ef 03             	shr    $0x3,%edi
 9c8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 9cb:	85 d2                	test   %edx,%edx
 9cd:	0f 84 8d 00 00 00    	je     a60 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d3:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9d5:	8b 48 04             	mov    0x4(%eax),%ecx
 9d8:	39 f9                	cmp    %edi,%ecx
 9da:	73 64                	jae    a40 <malloc+0x90>
  if(nu < 4096)
 9dc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 9e1:	39 df                	cmp    %ebx,%edi
 9e3:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 9e6:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 9ed:	eb 0a                	jmp    9f9 <malloc+0x49>
 9ef:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9f2:	8b 48 04             	mov    0x4(%eax),%ecx
 9f5:	39 f9                	cmp    %edi,%ecx
 9f7:	73 47                	jae    a40 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9f9:	89 c2                	mov    %eax,%edx
 9fb:	3b 05 e0 12 00 00    	cmp    0x12e0,%eax
 a01:	75 ed                	jne    9f0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 a03:	83 ec 0c             	sub    $0xc,%esp
 a06:	56                   	push   %esi
 a07:	e8 7e fc ff ff       	call   68a <sbrk>
  if(p == (char*)-1)
 a0c:	83 c4 10             	add    $0x10,%esp
 a0f:	83 f8 ff             	cmp    $0xffffffff,%eax
 a12:	74 1c                	je     a30 <malloc+0x80>
  hp->s.size = nu;
 a14:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a17:	83 ec 0c             	sub    $0xc,%esp
 a1a:	83 c0 08             	add    $0x8,%eax
 a1d:	50                   	push   %eax
 a1e:	e8 fd fe ff ff       	call   920 <free>
  return freep;
 a23:	8b 15 e0 12 00 00    	mov    0x12e0,%edx
      if((p = morecore(nunits)) == 0)
 a29:	83 c4 10             	add    $0x10,%esp
 a2c:	85 d2                	test   %edx,%edx
 a2e:	75 c0                	jne    9f0 <malloc+0x40>
        return 0;
  }
}
 a30:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 a33:	31 c0                	xor    %eax,%eax
}
 a35:	5b                   	pop    %ebx
 a36:	5e                   	pop    %esi
 a37:	5f                   	pop    %edi
 a38:	5d                   	pop    %ebp
 a39:	c3                   	ret
 a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 a40:	39 cf                	cmp    %ecx,%edi
 a42:	74 4c                	je     a90 <malloc+0xe0>
        p->s.size -= nunits;
 a44:	29 f9                	sub    %edi,%ecx
 a46:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a49:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a4c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 a4f:	89 15 e0 12 00 00    	mov    %edx,0x12e0
}
 a55:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a58:	83 c0 08             	add    $0x8,%eax
}
 a5b:	5b                   	pop    %ebx
 a5c:	5e                   	pop    %esi
 a5d:	5f                   	pop    %edi
 a5e:	5d                   	pop    %ebp
 a5f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 a60:	c7 05 e0 12 00 00 e4 	movl   $0x12e4,0x12e0
 a67:	12 00 00 
    base.s.size = 0;
 a6a:	b8 e4 12 00 00       	mov    $0x12e4,%eax
    base.s.ptr = freep = prevp = &base;
 a6f:	c7 05 e4 12 00 00 e4 	movl   $0x12e4,0x12e4
 a76:	12 00 00 
    base.s.size = 0;
 a79:	c7 05 e8 12 00 00 00 	movl   $0x0,0x12e8
 a80:	00 00 00 
    if(p->s.size >= nunits){
 a83:	e9 54 ff ff ff       	jmp    9dc <malloc+0x2c>
 a88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 a8f:	00 
        prevp->s.ptr = p->s.ptr;
 a90:	8b 08                	mov    (%eax),%ecx
 a92:	89 0a                	mov    %ecx,(%edx)
 a94:	eb b9                	jmp    a4f <malloc+0x9f>
