
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
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
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 23 01 00 00    	jg     144 <main+0x144>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 d9 15 00 00       	push   $0x15d9
      2b:	e8 b2 10 00 00       	call   10e2 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 28                	jmp    61 <main+0x61>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      40:	85 c0                	test   %eax,%eax
      42:	75 18                	jne    5c <main+0x5c>
      runcmd(parsecmd(buf));
      44:	83 ec 0c             	sub    $0xc,%esp
      47:	68 a0 1c 00 00       	push   $0x1ca0
      4c:	e8 6f 0d 00 00       	call   dc0 <parsecmd>
      51:	89 04 24             	mov    %eax,(%esp)
      54:	e8 07 01 00 00       	call   160 <runcmd>
      59:	83 c4 10             	add    $0x10,%esp
    wait();
      5c:	e8 49 10 00 00       	call   10aa <wait>
  printf(2, "$ ");
      61:	83 ec 08             	sub    $0x8,%esp
      64:	68 69 15 00 00       	push   $0x1569
      69:	6a 02                	push   $0x2
      6b:	e8 c0 11 00 00       	call   1230 <printf>
  memset(buf, 0, nbuf);
      70:	83 c4 0c             	add    $0xc,%esp
      73:	6a 64                	push   $0x64
      75:	6a 00                	push   $0x0
      77:	68 a0 1c 00 00       	push   $0x1ca0
      7c:	e8 8f 0e 00 00       	call   f10 <memset>
  gets(buf, nbuf);
      81:	58                   	pop    %eax
      82:	5a                   	pop    %edx
      83:	6a 64                	push   $0x64
      85:	68 a0 1c 00 00       	push   $0x1ca0
      8a:	e8 e1 0e 00 00       	call   f70 <gets>
  if(buf[0] == 0) // EOF
      8f:	0f b6 05 a0 1c 00 00 	movzbl 0x1ca0,%eax
      96:	83 c4 10             	add    $0x10,%esp
      99:	84 c0                	test   %al,%al
      9b:	0f 84 8f 00 00 00    	je     130 <main+0x130>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      a1:	3c 63                	cmp    $0x63,%al
      a3:	75 09                	jne    ae <main+0xae>
      a5:	80 3d a1 1c 00 00 64 	cmpb   $0x64,0x1ca1
      ac:	74 32                	je     e0 <main+0xe0>
int
fork1(void)
{
  int pid;

  pid = fork();
      ae:	e8 e7 0f 00 00       	call   109a <fork>
  if(pid == -1)
      b3:	83 f8 ff             	cmp    $0xffffffff,%eax
      b6:	75 88                	jne    40 <main+0x40>
  printf(2, "%s\n", s);
      b8:	83 ec 04             	sub    $0x4,%esp
      bb:	68 5f 15 00 00       	push   $0x155f
      c0:	68 d5 15 00 00       	push   $0x15d5
      c5:	6a 02                	push   $0x2
      c7:	e8 64 11 00 00       	call   1230 <printf>
  exit(0);
      cc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      d3:	e8 ca 0f 00 00       	call   10a2 <exit>
      d8:	83 c4 10             	add    $0x10,%esp
      db:	e9 7c ff ff ff       	jmp    5c <main+0x5c>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      e0:	80 3d a2 1c 00 00 20 	cmpb   $0x20,0x1ca2
      e7:	75 c5                	jne    ae <main+0xae>
      buf[strlen(buf)-1] = 0;  // chop \n
      e9:	83 ec 0c             	sub    $0xc,%esp
      ec:	68 a0 1c 00 00       	push   $0x1ca0
      f1:	e8 ea 0d 00 00       	call   ee0 <strlen>
      f6:	c6 80 9f 1c 00 00 00 	movb   $0x0,0x1c9f(%eax)
      if(chdir(buf+3) < 0)
      fd:	c7 04 24 a3 1c 00 00 	movl   $0x1ca3,(%esp)
     104:	e8 09 10 00 00       	call   1112 <chdir>
     109:	83 c4 10             	add    $0x10,%esp
     10c:	85 c0                	test   %eax,%eax
     10e:	0f 89 4d ff ff ff    	jns    61 <main+0x61>
        printf(2, "cannot cd %s\n", buf+3);
     114:	51                   	push   %ecx
     115:	68 a3 1c 00 00       	push   $0x1ca3
     11a:	68 e1 15 00 00       	push   $0x15e1
     11f:	6a 02                	push   $0x2
     121:	e8 0a 11 00 00       	call   1230 <printf>
     126:	83 c4 10             	add    $0x10,%esp
     129:	e9 33 ff ff ff       	jmp    61 <main+0x61>
     12e:	66 90                	xchg   %ax,%ax
  exit(0);
     130:	83 ec 0c             	sub    $0xc,%esp
     133:	6a 00                	push   $0x0
     135:	e8 68 0f 00 00       	call   10a2 <exit>
}
     13a:	8b 4d fc             	mov    -0x4(%ebp),%ecx
     13d:	31 c0                	xor    %eax,%eax
     13f:	c9                   	leave
     140:	8d 61 fc             	lea    -0x4(%ecx),%esp
     143:	c3                   	ret
      close(fd);
     144:	83 ec 0c             	sub    $0xc,%esp
     147:	50                   	push   %eax
     148:	e8 7d 0f 00 00       	call   10ca <close>
      break;
     14d:	83 c4 10             	add    $0x10,%esp
     150:	e9 0c ff ff ff       	jmp    61 <main+0x61>
     155:	66 90                	xchg   %ax,%ax
     157:	66 90                	xchg   %ax,%ax
     159:	66 90                	xchg   %ax,%ax
     15b:	66 90                	xchg   %ax,%ax
     15d:	66 90                	xchg   %ax,%ax
     15f:	90                   	nop

00000160 <runcmd>:
{
     160:	55                   	push   %ebp
     161:	89 e5                	mov    %esp,%ebp
     163:	53                   	push   %ebx
     164:	83 ec 14             	sub    $0x14,%esp
     167:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     16a:	85 db                	test   %ebx,%ebx
     16c:	0f 84 ee 01 00 00    	je     360 <runcmd+0x200>
  switch(cmd->type){
     172:	83 3b 05             	cmpl   $0x5,(%ebx)
     175:	77 09                	ja     180 <runcmd+0x20>
     177:	8b 03                	mov    (%ebx),%eax
     179:	ff 24 85 f8 15 00 00 	jmp    *0x15f8(,%eax,4)
  printf(2, "%s\n", s);
     180:	83 ec 04             	sub    $0x4,%esp
     183:	68 38 15 00 00       	push   $0x1538
     188:	68 d5 15 00 00       	push   $0x15d5
     18d:	6a 02                	push   $0x2
     18f:	e8 9c 10 00 00       	call   1230 <printf>
  exit(0);
     194:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     19b:	e8 02 0f 00 00       	call   10a2 <exit>
}
     1a0:	83 c4 10             	add    $0x10,%esp
    if(ecmd->argv[0] == 0)
     1a3:	8b 43 04             	mov    0x4(%ebx),%eax
     1a6:	85 c0                	test   %eax,%eax
     1a8:	0f 84 ca 01 00 00    	je     378 <runcmd+0x218>
    exec(ecmd->argv[0], ecmd->argv);
     1ae:	83 ec 08             	sub    $0x8,%esp
     1b1:	8d 53 04             	lea    0x4(%ebx),%edx
     1b4:	52                   	push   %edx
     1b5:	50                   	push   %eax
     1b6:	e8 1f 0f 00 00       	call   10da <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     1bb:	83 c4 0c             	add    $0xc,%esp
     1be:	ff 73 04             	push   0x4(%ebx)
     1c1:	68 3f 15 00 00       	push   $0x153f
     1c6:	6a 02                	push   $0x2
     1c8:	e8 63 10 00 00       	call   1230 <printf>
    break;
     1cd:	83 c4 10             	add    $0x10,%esp
  exit(0);
     1d0:	83 ec 0c             	sub    $0xc,%esp
     1d3:	6a 00                	push   $0x0
     1d5:	e8 c8 0e 00 00       	call   10a2 <exit>
}
     1da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     1dd:	83 c4 10             	add    $0x10,%esp
     1e0:	c9                   	leave
     1e1:	c3                   	ret
     1e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  pid = fork();
     1e8:	e8 ad 0e 00 00       	call   109a <fork>
  if(pid == -1)
     1ed:	83 f8 ff             	cmp    $0xffffffff,%eax
     1f0:	0f 84 ca 01 00 00    	je     3c0 <runcmd+0x260>
    if(fork1() == 0)
     1f6:	85 c0                	test   %eax,%eax
     1f8:	75 d6                	jne    1d0 <runcmd+0x70>
      runcmd(bcmd->cmd);
     1fa:	83 ec 0c             	sub    $0xc,%esp
     1fd:	ff 73 04             	push   0x4(%ebx)
     200:	e8 5b ff ff ff       	call   160 <runcmd>
     205:	83 c4 10             	add    $0x10,%esp
     208:	eb c6                	jmp    1d0 <runcmd+0x70>
     20a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    close(rcmd->fd);
     210:	83 ec 0c             	sub    $0xc,%esp
     213:	ff 73 14             	push   0x14(%ebx)
     216:	e8 af 0e 00 00       	call   10ca <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     21b:	59                   	pop    %ecx
     21c:	58                   	pop    %eax
     21d:	ff 73 10             	push   0x10(%ebx)
     220:	ff 73 08             	push   0x8(%ebx)
     223:	e8 ba 0e 00 00       	call   10e2 <open>
     228:	83 c4 10             	add    $0x10,%esp
     22b:	85 c0                	test   %eax,%eax
     22d:	79 cb                	jns    1fa <runcmd+0x9a>
      printf(2, "open %s failed\n", rcmd->file);
     22f:	83 ec 04             	sub    $0x4,%esp
     232:	ff 73 08             	push   0x8(%ebx)
     235:	68 4f 15 00 00       	push   $0x154f
     23a:	6a 02                	push   $0x2
     23c:	e8 ef 0f 00 00       	call   1230 <printf>
      exit(0);
     241:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     248:	e8 55 0e 00 00       	call   10a2 <exit>
     24d:	83 c4 10             	add    $0x10,%esp
    runcmd(rcmd->cmd);
     250:	eb a8                	jmp    1fa <runcmd+0x9a>
     252:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pipe(p) < 0)
     258:	83 ec 0c             	sub    $0xc,%esp
     25b:	8d 45 f0             	lea    -0x10(%ebp),%eax
     25e:	50                   	push   %eax
     25f:	e8 4e 0e 00 00       	call   10b2 <pipe>
     264:	83 c4 10             	add    $0x10,%esp
     267:	85 c0                	test   %eax,%eax
     269:	0f 88 21 01 00 00    	js     390 <runcmd+0x230>
  pid = fork();
     26f:	e8 26 0e 00 00       	call   109a <fork>
  if(pid == -1)
     274:	83 f8 ff             	cmp    $0xffffffff,%eax
     277:	0f 84 73 01 00 00    	je     3f0 <runcmd+0x290>
    if(fork1() == 0){
     27d:	85 c0                	test   %eax,%eax
     27f:	75 31                	jne    2b2 <runcmd+0x152>
      close(1);
     281:	83 ec 0c             	sub    $0xc,%esp
     284:	6a 01                	push   $0x1
     286:	e8 3f 0e 00 00       	call   10ca <close>
      dup(p[1]);
     28b:	58                   	pop    %eax
     28c:	ff 75 f4             	push   -0xc(%ebp)
     28f:	e8 86 0e 00 00       	call   111a <dup>
      close(p[0]);
     294:	58                   	pop    %eax
     295:	ff 75 f0             	push   -0x10(%ebp)
     298:	e8 2d 0e 00 00       	call   10ca <close>
      close(p[1]);
     29d:	58                   	pop    %eax
     29e:	ff 75 f4             	push   -0xc(%ebp)
     2a1:	e8 24 0e 00 00       	call   10ca <close>
      runcmd(pcmd->left);
     2a6:	5a                   	pop    %edx
     2a7:	ff 73 04             	push   0x4(%ebx)
     2aa:	e8 b1 fe ff ff       	call   160 <runcmd>
     2af:	83 c4 10             	add    $0x10,%esp
  pid = fork();
     2b2:	e8 e3 0d 00 00       	call   109a <fork>
  if(pid == -1)
     2b7:	83 f8 ff             	cmp    $0xffffffff,%eax
     2ba:	0f 84 90 01 00 00    	je     450 <runcmd+0x2f0>
    if(fork1() == 0){
     2c0:	85 c0                	test   %eax,%eax
     2c2:	75 31                	jne    2f5 <runcmd+0x195>
      close(0);
     2c4:	83 ec 0c             	sub    $0xc,%esp
     2c7:	6a 00                	push   $0x0
     2c9:	e8 fc 0d 00 00       	call   10ca <close>
      dup(p[0]);
     2ce:	5a                   	pop    %edx
     2cf:	ff 75 f0             	push   -0x10(%ebp)
     2d2:	e8 43 0e 00 00       	call   111a <dup>
      close(p[0]);
     2d7:	59                   	pop    %ecx
     2d8:	ff 75 f0             	push   -0x10(%ebp)
     2db:	e8 ea 0d 00 00       	call   10ca <close>
      close(p[1]);
     2e0:	58                   	pop    %eax
     2e1:	ff 75 f4             	push   -0xc(%ebp)
     2e4:	e8 e1 0d 00 00       	call   10ca <close>
      runcmd(pcmd->right);
     2e9:	58                   	pop    %eax
     2ea:	ff 73 08             	push   0x8(%ebx)
     2ed:	e8 6e fe ff ff       	call   160 <runcmd>
     2f2:	83 c4 10             	add    $0x10,%esp
    close(p[0]);
     2f5:	83 ec 0c             	sub    $0xc,%esp
     2f8:	ff 75 f0             	push   -0x10(%ebp)
     2fb:	e8 ca 0d 00 00       	call   10ca <close>
    close(p[1]);
     300:	58                   	pop    %eax
     301:	ff 75 f4             	push   -0xc(%ebp)
     304:	e8 c1 0d 00 00       	call   10ca <close>
    wait();
     309:	e8 9c 0d 00 00       	call   10aa <wait>
    wait();
     30e:	e8 97 0d 00 00       	call   10aa <wait>
    break;
     313:	83 c4 10             	add    $0x10,%esp
     316:	e9 b5 fe ff ff       	jmp    1d0 <runcmd+0x70>
     31b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  pid = fork();
     320:	e8 75 0d 00 00       	call   109a <fork>
  if(pid == -1)
     325:	83 f8 ff             	cmp    $0xffffffff,%eax
     328:	0f 84 f2 00 00 00    	je     420 <runcmd+0x2c0>
    if(fork1() == 0)
     32e:	85 c0                	test   %eax,%eax
     330:	75 0e                	jne    340 <runcmd+0x1e0>
      runcmd(lcmd->left);
     332:	83 ec 0c             	sub    $0xc,%esp
     335:	ff 73 04             	push   0x4(%ebx)
     338:	e8 23 fe ff ff       	call   160 <runcmd>
     33d:	83 c4 10             	add    $0x10,%esp
    wait();
     340:	e8 65 0d 00 00       	call   10aa <wait>
    runcmd(lcmd->right);
     345:	83 ec 0c             	sub    $0xc,%esp
     348:	ff 73 08             	push   0x8(%ebx)
     34b:	e8 10 fe ff ff       	call   160 <runcmd>
    break;
     350:	83 c4 10             	add    $0x10,%esp
     353:	e9 78 fe ff ff       	jmp    1d0 <runcmd+0x70>
     358:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     35f:	00 
    exit(0);
     360:	83 ec 0c             	sub    $0xc,%esp
     363:	6a 00                	push   $0x0
     365:	e8 38 0d 00 00       	call   10a2 <exit>
     36a:	83 c4 10             	add    $0x10,%esp
     36d:	e9 00 fe ff ff       	jmp    172 <runcmd+0x12>
     372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit(0);
     378:	83 ec 0c             	sub    $0xc,%esp
     37b:	6a 00                	push   $0x0
     37d:	e8 20 0d 00 00       	call   10a2 <exit>
    exec(ecmd->argv[0], ecmd->argv);
     382:	8b 43 04             	mov    0x4(%ebx),%eax
     385:	83 c4 10             	add    $0x10,%esp
     388:	e9 21 fe ff ff       	jmp    1ae <runcmd+0x4e>
     38d:	8d 76 00             	lea    0x0(%esi),%esi
  printf(2, "%s\n", s);
     390:	83 ec 04             	sub    $0x4,%esp
     393:	68 64 15 00 00       	push   $0x1564
     398:	68 d5 15 00 00       	push   $0x15d5
     39d:	6a 02                	push   $0x2
     39f:	e8 8c 0e 00 00       	call   1230 <printf>
  exit(0);
     3a4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     3ab:	e8 f2 0c 00 00       	call   10a2 <exit>
}
     3b0:	83 c4 10             	add    $0x10,%esp
     3b3:	e9 b7 fe ff ff       	jmp    26f <runcmd+0x10f>
     3b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     3bf:	00 
  printf(2, "%s\n", s);
     3c0:	83 ec 04             	sub    $0x4,%esp
     3c3:	68 5f 15 00 00       	push   $0x155f
     3c8:	68 d5 15 00 00       	push   $0x15d5
     3cd:	6a 02                	push   $0x2
     3cf:	e8 5c 0e 00 00       	call   1230 <printf>
  exit(0);
     3d4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     3db:	e8 c2 0c 00 00       	call   10a2 <exit>
     3e0:	83 c4 10             	add    $0x10,%esp
     3e3:	e9 e8 fd ff ff       	jmp    1d0 <runcmd+0x70>
     3e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     3ef:	00 
  printf(2, "%s\n", s);
     3f0:	83 ec 04             	sub    $0x4,%esp
     3f3:	68 5f 15 00 00       	push   $0x155f
     3f8:	68 d5 15 00 00       	push   $0x15d5
     3fd:	6a 02                	push   $0x2
     3ff:	e8 2c 0e 00 00       	call   1230 <printf>
  exit(0);
     404:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     40b:	e8 92 0c 00 00       	call   10a2 <exit>
     410:	83 c4 10             	add    $0x10,%esp
     413:	e9 9a fe ff ff       	jmp    2b2 <runcmd+0x152>
     418:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     41f:	00 
  printf(2, "%s\n", s);
     420:	83 ec 04             	sub    $0x4,%esp
     423:	68 5f 15 00 00       	push   $0x155f
     428:	68 d5 15 00 00       	push   $0x15d5
     42d:	6a 02                	push   $0x2
     42f:	e8 fc 0d 00 00       	call   1230 <printf>
  exit(0);
     434:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     43b:	e8 62 0c 00 00       	call   10a2 <exit>
     440:	83 c4 10             	add    $0x10,%esp
     443:	e9 f8 fe ff ff       	jmp    340 <runcmd+0x1e0>
     448:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     44f:	00 
  printf(2, "%s\n", s);
     450:	83 ec 04             	sub    $0x4,%esp
     453:	68 5f 15 00 00       	push   $0x155f
     458:	68 d5 15 00 00       	push   $0x15d5
     45d:	6a 02                	push   $0x2
     45f:	e8 cc 0d 00 00       	call   1230 <printf>
  exit(0);
     464:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     46b:	e8 32 0c 00 00       	call   10a2 <exit>
     470:	83 c4 10             	add    $0x10,%esp
     473:	e9 7d fe ff ff       	jmp    2f5 <runcmd+0x195>
     478:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     47f:	00 

00000480 <getcmd>:
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	56                   	push   %esi
     484:	53                   	push   %ebx
     485:	8b 5d 08             	mov    0x8(%ebp),%ebx
     488:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     48b:	83 ec 08             	sub    $0x8,%esp
     48e:	68 69 15 00 00       	push   $0x1569
     493:	6a 02                	push   $0x2
     495:	e8 96 0d 00 00       	call   1230 <printf>
  memset(buf, 0, nbuf);
     49a:	83 c4 0c             	add    $0xc,%esp
     49d:	56                   	push   %esi
     49e:	6a 00                	push   $0x0
     4a0:	53                   	push   %ebx
     4a1:	e8 6a 0a 00 00       	call   f10 <memset>
  gets(buf, nbuf);
     4a6:	58                   	pop    %eax
     4a7:	5a                   	pop    %edx
     4a8:	56                   	push   %esi
     4a9:	53                   	push   %ebx
     4aa:	e8 c1 0a 00 00       	call   f70 <gets>
  if(buf[0] == 0) // EOF
     4af:	83 c4 10             	add    $0x10,%esp
     4b2:	80 3b 01             	cmpb   $0x1,(%ebx)
     4b5:	19 c0                	sbb    %eax,%eax
}
     4b7:	8d 65 f8             	lea    -0x8(%ebp),%esp
     4ba:	5b                   	pop    %ebx
     4bb:	5e                   	pop    %esi
     4bc:	5d                   	pop    %ebp
     4bd:	c3                   	ret
     4be:	66 90                	xchg   %ax,%ax

000004c0 <panic>:
{
     4c0:	55                   	push   %ebp
     4c1:	89 e5                	mov    %esp,%ebp
     4c3:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     4c6:	ff 75 08             	push   0x8(%ebp)
     4c9:	68 d5 15 00 00       	push   $0x15d5
     4ce:	6a 02                	push   $0x2
     4d0:	e8 5b 0d 00 00       	call   1230 <printf>
  exit(0);
     4d5:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
     4dc:	83 c4 10             	add    $0x10,%esp
}
     4df:	c9                   	leave
  exit(0);
     4e0:	e9 bd 0b 00 00       	jmp    10a2 <exit>
     4e5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     4ec:	00 
     4ed:	8d 76 00             	lea    0x0(%esi),%esi

000004f0 <fork1>:
{
     4f0:	55                   	push   %ebp
     4f1:	89 e5                	mov    %esp,%ebp
     4f3:	53                   	push   %ebx
     4f4:	83 ec 04             	sub    $0x4,%esp
  pid = fork();
     4f7:	e8 9e 0b 00 00       	call   109a <fork>
     4fc:	89 c3                	mov    %eax,%ebx
  if(pid == -1)
     4fe:	83 f8 ff             	cmp    $0xffffffff,%eax
     501:	74 0d                	je     510 <fork1+0x20>
    panic("fork");
  return pid;
}
     503:	89 d8                	mov    %ebx,%eax
     505:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     508:	c9                   	leave
     509:	c3                   	ret
     50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  printf(2, "%s\n", s);
     510:	83 ec 04             	sub    $0x4,%esp
     513:	68 5f 15 00 00       	push   $0x155f
     518:	68 d5 15 00 00       	push   $0x15d5
     51d:	6a 02                	push   $0x2
     51f:	e8 0c 0d 00 00       	call   1230 <printf>
  exit(0);
     524:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     52b:	e8 72 0b 00 00       	call   10a2 <exit>
}
     530:	89 d8                	mov    %ebx,%eax
}
     532:	83 c4 10             	add    $0x10,%esp
}
     535:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     538:	c9                   	leave
     539:	c3                   	ret
     53a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000540 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     540:	55                   	push   %ebp
     541:	89 e5                	mov    %esp,%ebp
     543:	53                   	push   %ebx
     544:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     547:	6a 54                	push   $0x54
     549:	e8 02 0f 00 00       	call   1450 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     54e:	83 c4 0c             	add    $0xc,%esp
     551:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     553:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     555:	6a 00                	push   $0x0
     557:	50                   	push   %eax
     558:	e8 b3 09 00 00       	call   f10 <memset>
  cmd->type = EXEC;
     55d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     563:	89 d8                	mov    %ebx,%eax
     565:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     568:	c9                   	leave
     569:	c3                   	ret
     56a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000570 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     570:	55                   	push   %ebp
     571:	89 e5                	mov    %esp,%ebp
     573:	53                   	push   %ebx
     574:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     577:	6a 18                	push   $0x18
     579:	e8 d2 0e 00 00       	call   1450 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     57e:	83 c4 0c             	add    $0xc,%esp
     581:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     583:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     585:	6a 00                	push   $0x0
     587:	50                   	push   %eax
     588:	e8 83 09 00 00       	call   f10 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     58d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     590:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     596:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     599:	8b 45 0c             	mov    0xc(%ebp),%eax
     59c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     59f:	8b 45 10             	mov    0x10(%ebp),%eax
     5a2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     5a5:	8b 45 14             	mov    0x14(%ebp),%eax
     5a8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     5ab:	8b 45 18             	mov    0x18(%ebp),%eax
     5ae:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     5b1:	89 d8                	mov    %ebx,%eax
     5b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     5b6:	c9                   	leave
     5b7:	c3                   	ret
     5b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     5bf:	00 

000005c0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     5c0:	55                   	push   %ebp
     5c1:	89 e5                	mov    %esp,%ebp
     5c3:	53                   	push   %ebx
     5c4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5c7:	6a 0c                	push   $0xc
     5c9:	e8 82 0e 00 00       	call   1450 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     5ce:	83 c4 0c             	add    $0xc,%esp
     5d1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     5d3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     5d5:	6a 00                	push   $0x0
     5d7:	50                   	push   %eax
     5d8:	e8 33 09 00 00       	call   f10 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     5dd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     5e0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     5e6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     5e9:	8b 45 0c             	mov    0xc(%ebp),%eax
     5ec:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     5ef:	89 d8                	mov    %ebx,%eax
     5f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     5f4:	c9                   	leave
     5f5:	c3                   	ret
     5f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     5fd:	00 
     5fe:	66 90                	xchg   %ax,%ax

00000600 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     600:	55                   	push   %ebp
     601:	89 e5                	mov    %esp,%ebp
     603:	53                   	push   %ebx
     604:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     607:	6a 0c                	push   $0xc
     609:	e8 42 0e 00 00       	call   1450 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     60e:	83 c4 0c             	add    $0xc,%esp
     611:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     613:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     615:	6a 00                	push   $0x0
     617:	50                   	push   %eax
     618:	e8 f3 08 00 00       	call   f10 <memset>
  cmd->type = LIST;
  cmd->left = left;
     61d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     620:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     626:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     629:	8b 45 0c             	mov    0xc(%ebp),%eax
     62c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     62f:	89 d8                	mov    %ebx,%eax
     631:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     634:	c9                   	leave
     635:	c3                   	ret
     636:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     63d:	00 
     63e:	66 90                	xchg   %ax,%ax

00000640 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     640:	55                   	push   %ebp
     641:	89 e5                	mov    %esp,%ebp
     643:	53                   	push   %ebx
     644:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     647:	6a 08                	push   $0x8
     649:	e8 02 0e 00 00       	call   1450 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     64e:	83 c4 0c             	add    $0xc,%esp
     651:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     653:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     655:	6a 00                	push   $0x0
     657:	50                   	push   %eax
     658:	e8 b3 08 00 00       	call   f10 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     65d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     660:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     666:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     669:	89 d8                	mov    %ebx,%eax
     66b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     66e:	c9                   	leave
     66f:	c3                   	ret

00000670 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     670:	55                   	push   %ebp
     671:	89 e5                	mov    %esp,%ebp
     673:	57                   	push   %edi
     674:	56                   	push   %esi
     675:	53                   	push   %ebx
     676:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     679:	8b 45 08             	mov    0x8(%ebp),%eax
{
     67c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     67f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     682:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     684:	39 df                	cmp    %ebx,%edi
     686:	72 0f                	jb     697 <gettoken+0x27>
     688:	eb 25                	jmp    6af <gettoken+0x3f>
     68a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     690:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     693:	39 fb                	cmp    %edi,%ebx
     695:	74 18                	je     6af <gettoken+0x3f>
     697:	0f be 07             	movsbl (%edi),%eax
     69a:	83 ec 08             	sub    $0x8,%esp
     69d:	50                   	push   %eax
     69e:	68 90 1c 00 00       	push   $0x1c90
     6a3:	e8 88 08 00 00       	call   f30 <strchr>
     6a8:	83 c4 10             	add    $0x10,%esp
     6ab:	85 c0                	test   %eax,%eax
     6ad:	75 e1                	jne    690 <gettoken+0x20>
  if(q)
     6af:	85 f6                	test   %esi,%esi
     6b1:	74 02                	je     6b5 <gettoken+0x45>
    *q = s;
     6b3:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     6b5:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     6b8:	3c 3c                	cmp    $0x3c,%al
     6ba:	0f 8f c8 00 00 00    	jg     788 <gettoken+0x118>
     6c0:	3c 3a                	cmp    $0x3a,%al
     6c2:	7f 5a                	jg     71e <gettoken+0xae>
     6c4:	84 c0                	test   %al,%al
     6c6:	75 48                	jne    710 <gettoken+0xa0>
     6c8:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     6ca:	8b 4d 14             	mov    0x14(%ebp),%ecx
     6cd:	85 c9                	test   %ecx,%ecx
     6cf:	74 05                	je     6d6 <gettoken+0x66>
    *eq = s;
     6d1:	8b 45 14             	mov    0x14(%ebp),%eax
     6d4:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     6d6:	39 df                	cmp    %ebx,%edi
     6d8:	72 0d                	jb     6e7 <gettoken+0x77>
     6da:	eb 23                	jmp    6ff <gettoken+0x8f>
     6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
     6e0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     6e3:	39 fb                	cmp    %edi,%ebx
     6e5:	74 18                	je     6ff <gettoken+0x8f>
     6e7:	0f be 07             	movsbl (%edi),%eax
     6ea:	83 ec 08             	sub    $0x8,%esp
     6ed:	50                   	push   %eax
     6ee:	68 90 1c 00 00       	push   $0x1c90
     6f3:	e8 38 08 00 00       	call   f30 <strchr>
     6f8:	83 c4 10             	add    $0x10,%esp
     6fb:	85 c0                	test   %eax,%eax
     6fd:	75 e1                	jne    6e0 <gettoken+0x70>
  *ps = s;
     6ff:	8b 45 08             	mov    0x8(%ebp),%eax
     702:	89 38                	mov    %edi,(%eax)
  return ret;
}
     704:	8d 65 f4             	lea    -0xc(%ebp),%esp
     707:	89 f0                	mov    %esi,%eax
     709:	5b                   	pop    %ebx
     70a:	5e                   	pop    %esi
     70b:	5f                   	pop    %edi
     70c:	5d                   	pop    %ebp
     70d:	c3                   	ret
     70e:	66 90                	xchg   %ax,%ax
  switch(*s){
     710:	78 22                	js     734 <gettoken+0xc4>
     712:	3c 26                	cmp    $0x26,%al
     714:	74 08                	je     71e <gettoken+0xae>
     716:	8d 48 d8             	lea    -0x28(%eax),%ecx
     719:	80 f9 01             	cmp    $0x1,%cl
     71c:	77 16                	ja     734 <gettoken+0xc4>
  ret = *s;
     71e:	0f be f0             	movsbl %al,%esi
    s++;
     721:	83 c7 01             	add    $0x1,%edi
    break;
     724:	eb a4                	jmp    6ca <gettoken+0x5a>
     726:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     72d:	00 
     72e:	66 90                	xchg   %ax,%ax
  switch(*s){
     730:	3c 7c                	cmp    $0x7c,%al
     732:	74 ea                	je     71e <gettoken+0xae>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     734:	39 df                	cmp    %ebx,%edi
     736:	72 27                	jb     75f <gettoken+0xef>
     738:	e9 87 00 00 00       	jmp    7c4 <gettoken+0x154>
     73d:	8d 76 00             	lea    0x0(%esi),%esi
     740:	0f be 07             	movsbl (%edi),%eax
     743:	83 ec 08             	sub    $0x8,%esp
     746:	50                   	push   %eax
     747:	68 88 1c 00 00       	push   $0x1c88
     74c:	e8 df 07 00 00       	call   f30 <strchr>
     751:	83 c4 10             	add    $0x10,%esp
     754:	85 c0                	test   %eax,%eax
     756:	75 1f                	jne    777 <gettoken+0x107>
      s++;
     758:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     75b:	39 fb                	cmp    %edi,%ebx
     75d:	74 4d                	je     7ac <gettoken+0x13c>
     75f:	0f be 07             	movsbl (%edi),%eax
     762:	83 ec 08             	sub    $0x8,%esp
     765:	50                   	push   %eax
     766:	68 90 1c 00 00       	push   $0x1c90
     76b:	e8 c0 07 00 00       	call   f30 <strchr>
     770:	83 c4 10             	add    $0x10,%esp
     773:	85 c0                	test   %eax,%eax
     775:	74 c9                	je     740 <gettoken+0xd0>
    ret = 'a';
     777:	be 61 00 00 00       	mov    $0x61,%esi
     77c:	e9 49 ff ff ff       	jmp    6ca <gettoken+0x5a>
     781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     788:	3c 3e                	cmp    $0x3e,%al
     78a:	75 a4                	jne    730 <gettoken+0xc0>
    if(*s == '>'){
     78c:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     790:	74 0d                	je     79f <gettoken+0x12f>
    s++;
     792:	83 c7 01             	add    $0x1,%edi
  ret = *s;
     795:	be 3e 00 00 00       	mov    $0x3e,%esi
     79a:	e9 2b ff ff ff       	jmp    6ca <gettoken+0x5a>
      s++;
     79f:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     7a2:	be 2b 00 00 00       	mov    $0x2b,%esi
     7a7:	e9 1e ff ff ff       	jmp    6ca <gettoken+0x5a>
  if(eq)
     7ac:	8b 45 14             	mov    0x14(%ebp),%eax
     7af:	85 c0                	test   %eax,%eax
     7b1:	74 05                	je     7b8 <gettoken+0x148>
    *eq = s;
     7b3:	8b 45 14             	mov    0x14(%ebp),%eax
     7b6:	89 18                	mov    %ebx,(%eax)
  while(s < es && strchr(whitespace, *s))
     7b8:	89 df                	mov    %ebx,%edi
    ret = 'a';
     7ba:	be 61 00 00 00       	mov    $0x61,%esi
     7bf:	e9 3b ff ff ff       	jmp    6ff <gettoken+0x8f>
  if(eq)
     7c4:	8b 55 14             	mov    0x14(%ebp),%edx
     7c7:	85 d2                	test   %edx,%edx
     7c9:	74 ef                	je     7ba <gettoken+0x14a>
    *eq = s;
     7cb:	8b 45 14             	mov    0x14(%ebp),%eax
     7ce:	89 38                	mov    %edi,(%eax)
  while(s < es && strchr(whitespace, *s))
     7d0:	eb e8                	jmp    7ba <gettoken+0x14a>
     7d2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     7d9:	00 
     7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000007e0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     7e0:	55                   	push   %ebp
     7e1:	89 e5                	mov    %esp,%ebp
     7e3:	57                   	push   %edi
     7e4:	56                   	push   %esi
     7e5:	53                   	push   %ebx
     7e6:	83 ec 0c             	sub    $0xc,%esp
     7e9:	8b 7d 08             	mov    0x8(%ebp),%edi
     7ec:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     7ef:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     7f1:	39 f3                	cmp    %esi,%ebx
     7f3:	72 12                	jb     807 <peek+0x27>
     7f5:	eb 28                	jmp    81f <peek+0x3f>
     7f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     7fe:	00 
     7ff:	90                   	nop
    s++;
     800:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     803:	39 de                	cmp    %ebx,%esi
     805:	74 18                	je     81f <peek+0x3f>
     807:	0f be 03             	movsbl (%ebx),%eax
     80a:	83 ec 08             	sub    $0x8,%esp
     80d:	50                   	push   %eax
     80e:	68 90 1c 00 00       	push   $0x1c90
     813:	e8 18 07 00 00       	call   f30 <strchr>
     818:	83 c4 10             	add    $0x10,%esp
     81b:	85 c0                	test   %eax,%eax
     81d:	75 e1                	jne    800 <peek+0x20>
  *ps = s;
     81f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     821:	0f be 03             	movsbl (%ebx),%eax
     824:	31 d2                	xor    %edx,%edx
     826:	84 c0                	test   %al,%al
     828:	75 0e                	jne    838 <peek+0x58>
}
     82a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     82d:	89 d0                	mov    %edx,%eax
     82f:	5b                   	pop    %ebx
     830:	5e                   	pop    %esi
     831:	5f                   	pop    %edi
     832:	5d                   	pop    %ebp
     833:	c3                   	ret
     834:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     838:	83 ec 08             	sub    $0x8,%esp
     83b:	50                   	push   %eax
     83c:	ff 75 10             	push   0x10(%ebp)
     83f:	e8 ec 06 00 00       	call   f30 <strchr>
     844:	83 c4 10             	add    $0x10,%esp
     847:	31 d2                	xor    %edx,%edx
     849:	85 c0                	test   %eax,%eax
     84b:	0f 95 c2             	setne  %dl
}
     84e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     851:	5b                   	pop    %ebx
     852:	89 d0                	mov    %edx,%eax
     854:	5e                   	pop    %esi
     855:	5f                   	pop    %edi
     856:	5d                   	pop    %ebp
     857:	c3                   	ret
     858:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     85f:	00 

00000860 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     860:	55                   	push   %ebp
     861:	89 e5                	mov    %esp,%ebp
     863:	57                   	push   %edi
     864:	56                   	push   %esi
     865:	53                   	push   %ebx
     866:	83 ec 2c             	sub    $0x2c,%esp
     869:	8b 75 0c             	mov    0xc(%ebp),%esi
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
     870:	8d 7d e0             	lea    -0x20(%ebp),%edi
  while(peek(ps, es, "<>")){
     873:	83 ec 04             	sub    $0x4,%esp
     876:	68 89 15 00 00       	push   $0x1589
     87b:	ff 75 10             	push   0x10(%ebp)
     87e:	56                   	push   %esi
     87f:	e8 5c ff ff ff       	call   7e0 <peek>
     884:	83 c4 10             	add    $0x10,%esp
     887:	85 c0                	test   %eax,%eax
     889:	0f 84 01 01 00 00    	je     990 <parseredirs+0x130>
    tok = gettoken(ps, es, 0, 0);
     88f:	6a 00                	push   $0x0
     891:	6a 00                	push   $0x0
     893:	ff 75 10             	push   0x10(%ebp)
     896:	56                   	push   %esi
     897:	e8 d4 fd ff ff       	call   670 <gettoken>
     89c:	89 c3                	mov    %eax,%ebx
    if(gettoken(ps, es, &q, &eq) != 'a')
     89e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     8a1:	50                   	push   %eax
     8a2:	57                   	push   %edi
     8a3:	ff 75 10             	push   0x10(%ebp)
     8a6:	56                   	push   %esi
     8a7:	e8 c4 fd ff ff       	call   670 <gettoken>
     8ac:	83 c4 20             	add    $0x20,%esp
     8af:	83 f8 61             	cmp    $0x61,%eax
     8b2:	74 23                	je     8d7 <parseredirs+0x77>
  printf(2, "%s\n", s);
     8b4:	83 ec 04             	sub    $0x4,%esp
     8b7:	68 6c 15 00 00       	push   $0x156c
     8bc:	68 d5 15 00 00       	push   $0x15d5
     8c1:	6a 02                	push   $0x2
     8c3:	e8 68 09 00 00       	call   1230 <printf>
  exit(0);
     8c8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     8cf:	e8 ce 07 00 00       	call   10a2 <exit>
}
     8d4:	83 c4 10             	add    $0x10,%esp
      panic("missing file for redirection");
    switch(tok){
     8d7:	83 fb 3c             	cmp    $0x3c,%ebx
     8da:	74 64                	je     940 <parseredirs+0xe0>
     8dc:	83 fb 3e             	cmp    $0x3e,%ebx
     8df:	74 05                	je     8e6 <parseredirs+0x86>
     8e1:	83 fb 2b             	cmp    $0x2b,%ebx
     8e4:	75 8d                	jne    873 <parseredirs+0x13>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     8e6:	8b 55 e0             	mov    -0x20(%ebp),%edx
  cmd = malloc(sizeof(*cmd));
     8e9:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     8ec:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     8ef:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     8f2:	6a 18                	push   $0x18
     8f4:	e8 57 0b 00 00       	call   1450 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     8f9:	83 c4 0c             	add    $0xc,%esp
     8fc:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     8fe:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     900:	6a 00                	push   $0x0
     902:	50                   	push   %eax
     903:	e8 08 06 00 00       	call   f10 <memset>
  cmd->type = REDIR;
     908:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     90e:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     911:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     914:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     917:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  cmd->efile = efile;
     91a:	89 7b 0c             	mov    %edi,0xc(%ebx)
    if(gettoken(ps, es, &q, &eq) != 'a')
     91d:	8d 7d e0             	lea    -0x20(%ebp),%edi
  cmd->file = file;
     920:	89 53 08             	mov    %edx,0x8(%ebx)
  cmd->mode = mode;
     923:	c7 43 10 01 02 00 00 	movl   $0x201,0x10(%ebx)
  cmd->fd = fd;
     92a:	c7 43 14 01 00 00 00 	movl   $0x1,0x14(%ebx)
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     931:	89 5d 08             	mov    %ebx,0x8(%ebp)
     934:	e9 3a ff ff ff       	jmp    873 <parseredirs+0x13>
     939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     940:	8b 55 e0             	mov    -0x20(%ebp),%edx
  cmd = malloc(sizeof(*cmd));
     943:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     946:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     949:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     94c:	6a 18                	push   $0x18
     94e:	e8 fd 0a 00 00       	call   1450 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     953:	83 c4 0c             	add    $0xc,%esp
     956:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     958:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     95a:	6a 00                	push   $0x0
     95c:	50                   	push   %eax
     95d:	e8 ae 05 00 00       	call   f10 <memset>
  cmd->cmd = subcmd;
     962:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     965:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  cmd->efile = efile;
     968:	89 7b 0c             	mov    %edi,0xc(%ebx)
  cmd->type = REDIR;
     96b:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
      break;
     971:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     974:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     977:	89 53 08             	mov    %edx,0x8(%ebx)
  cmd->mode = mode;
     97a:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
  cmd->fd = fd;
     981:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     988:	89 5d 08             	mov    %ebx,0x8(%ebp)
      break;
     98b:	e9 e0 fe ff ff       	jmp    870 <parseredirs+0x10>
    }
  }
  return cmd;
}
     990:	8b 45 08             	mov    0x8(%ebp),%eax
     993:	8d 65 f4             	lea    -0xc(%ebp),%esp
     996:	5b                   	pop    %ebx
     997:	5e                   	pop    %esi
     998:	5f                   	pop    %edi
     999:	5d                   	pop    %ebp
     99a:	c3                   	ret
     99b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000009a0 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     9a0:	55                   	push   %ebp
     9a1:	89 e5                	mov    %esp,%ebp
     9a3:	57                   	push   %edi
     9a4:	56                   	push   %esi
     9a5:	53                   	push   %ebx
     9a6:	83 ec 30             	sub    $0x30,%esp
     9a9:	8b 75 08             	mov    0x8(%ebp),%esi
     9ac:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     9af:	68 8c 15 00 00       	push   $0x158c
     9b4:	57                   	push   %edi
     9b5:	56                   	push   %esi
     9b6:	e8 25 fe ff ff       	call   7e0 <peek>
     9bb:	83 c4 10             	add    $0x10,%esp
     9be:	85 c0                	test   %eax,%eax
     9c0:	0f 85 0a 01 00 00    	jne    ad0 <parseexec+0x130>
  cmd = malloc(sizeof(*cmd));
     9c6:	83 ec 0c             	sub    $0xc,%esp
     9c9:	89 c3                	mov    %eax,%ebx
     9cb:	6a 54                	push   $0x54
     9cd:	e8 7e 0a 00 00       	call   1450 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     9d2:	83 c4 0c             	add    $0xc,%esp
     9d5:	6a 54                	push   $0x54
     9d7:	6a 00                	push   $0x0
     9d9:	50                   	push   %eax
     9da:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     9dd:	e8 2e 05 00 00       	call   f10 <memset>
  cmd->type = EXEC;
     9e2:	8b 55 d4             	mov    -0x2c(%ebp),%edx

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     9e5:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     9e8:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
  ret = parseredirs(ret, ps, es);
     9ee:	57                   	push   %edi
     9ef:	56                   	push   %esi
     9f0:	52                   	push   %edx
     9f1:	89 55 d0             	mov    %edx,-0x30(%ebp)
     9f4:	e8 67 fe ff ff       	call   860 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     9f9:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     9fc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     9ff:	eb 1a                	jmp    a1b <parseexec+0x7b>
     a01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     a08:	83 ec 04             	sub    $0x4,%esp
     a0b:	57                   	push   %edi
     a0c:	56                   	push   %esi
     a0d:	ff 75 d4             	push   -0x2c(%ebp)
     a10:	e8 4b fe ff ff       	call   860 <parseredirs>
     a15:	83 c4 10             	add    $0x10,%esp
     a18:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     a1b:	83 ec 04             	sub    $0x4,%esp
     a1e:	68 a3 15 00 00       	push   $0x15a3
     a23:	57                   	push   %edi
     a24:	56                   	push   %esi
     a25:	e8 b6 fd ff ff       	call   7e0 <peek>
     a2a:	83 c4 10             	add    $0x10,%esp
     a2d:	85 c0                	test   %eax,%eax
     a2f:	75 7f                	jne    ab0 <parseexec+0x110>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     a31:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     a34:	50                   	push   %eax
     a35:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a38:	50                   	push   %eax
     a39:	57                   	push   %edi
     a3a:	56                   	push   %esi
     a3b:	e8 30 fc ff ff       	call   670 <gettoken>
     a40:	83 c4 10             	add    $0x10,%esp
     a43:	85 c0                	test   %eax,%eax
     a45:	74 69                	je     ab0 <parseexec+0x110>
    if(tok != 'a')
     a47:	83 f8 61             	cmp    $0x61,%eax
     a4a:	74 23                	je     a6f <parseexec+0xcf>
  printf(2, "%s\n", s);
     a4c:	83 ec 04             	sub    $0x4,%esp
     a4f:	68 8e 15 00 00       	push   $0x158e
     a54:	68 d5 15 00 00       	push   $0x15d5
     a59:	6a 02                	push   $0x2
     a5b:	e8 d0 07 00 00       	call   1230 <printf>
  exit(0);
     a60:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     a67:	e8 36 06 00 00       	call   10a2 <exit>
}
     a6c:	83 c4 10             	add    $0x10,%esp
    cmd->argv[argc] = q;
     a6f:	8b 45 e0             	mov    -0x20(%ebp),%eax
     a72:	8b 4d d0             	mov    -0x30(%ebp),%ecx
     a75:	89 44 99 04          	mov    %eax,0x4(%ecx,%ebx,4)
    cmd->eargv[argc] = eq;
     a79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     a7c:	89 44 99 2c          	mov    %eax,0x2c(%ecx,%ebx,4)
    argc++;
     a80:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     a83:	83 fb 09             	cmp    $0x9,%ebx
     a86:	7e 80                	jle    a08 <parseexec+0x68>
  printf(2, "%s\n", s);
     a88:	83 ec 04             	sub    $0x4,%esp
     a8b:	68 95 15 00 00       	push   $0x1595
     a90:	68 d5 15 00 00       	push   $0x15d5
     a95:	6a 02                	push   $0x2
     a97:	e8 94 07 00 00       	call   1230 <printf>
  exit(0);
     a9c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     aa3:	e8 fa 05 00 00       	call   10a2 <exit>
}
     aa8:	83 c4 10             	add    $0x10,%esp
     aab:	e9 58 ff ff ff       	jmp    a08 <parseexec+0x68>
     ab0:	8b 55 d0             	mov    -0x30(%ebp),%edx
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     ab3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  cmd->argv[argc] = 0;
     ab6:	c7 44 9a 04 00 00 00 	movl   $0x0,0x4(%edx,%ebx,4)
     abd:	00 
  cmd->eargv[argc] = 0;
     abe:	c7 44 9a 2c 00 00 00 	movl   $0x0,0x2c(%edx,%ebx,4)
     ac5:	00 
}
     ac6:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ac9:	5b                   	pop    %ebx
     aca:	5e                   	pop    %esi
     acb:	5f                   	pop    %edi
     acc:	5d                   	pop    %ebp
     acd:	c3                   	ret
     ace:	66 90                	xchg   %ax,%ax
    return parseblock(ps, es);
     ad0:	89 7d 0c             	mov    %edi,0xc(%ebp)
     ad3:	89 75 08             	mov    %esi,0x8(%ebp)
}
     ad6:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ad9:	5b                   	pop    %ebx
     ada:	5e                   	pop    %esi
     adb:	5f                   	pop    %edi
     adc:	5d                   	pop    %ebp
    return parseblock(ps, es);
     add:	e9 7e 01 00 00       	jmp    c60 <parseblock>
     ae2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     ae9:	00 
     aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000af0 <parsepipe>:
{
     af0:	55                   	push   %ebp
     af1:	89 e5                	mov    %esp,%ebp
     af3:	57                   	push   %edi
     af4:	56                   	push   %esi
     af5:	53                   	push   %ebx
     af6:	83 ec 14             	sub    $0x14,%esp
     af9:	8b 75 08             	mov    0x8(%ebp),%esi
     afc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     aff:	57                   	push   %edi
     b00:	56                   	push   %esi
     b01:	e8 9a fe ff ff       	call   9a0 <parseexec>
  if(peek(ps, es, "|")){
     b06:	83 c4 0c             	add    $0xc,%esp
     b09:	68 a8 15 00 00       	push   $0x15a8
  cmd = parseexec(ps, es);
     b0e:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     b10:	57                   	push   %edi
     b11:	56                   	push   %esi
     b12:	e8 c9 fc ff ff       	call   7e0 <peek>
     b17:	83 c4 10             	add    $0x10,%esp
     b1a:	85 c0                	test   %eax,%eax
     b1c:	75 12                	jne    b30 <parsepipe+0x40>
}
     b1e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b21:	89 d8                	mov    %ebx,%eax
     b23:	5b                   	pop    %ebx
     b24:	5e                   	pop    %esi
     b25:	5f                   	pop    %edi
     b26:	5d                   	pop    %ebp
     b27:	c3                   	ret
     b28:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     b2f:	00 
    gettoken(ps, es, 0, 0);
     b30:	6a 00                	push   $0x0
     b32:	6a 00                	push   $0x0
     b34:	57                   	push   %edi
     b35:	56                   	push   %esi
     b36:	e8 35 fb ff ff       	call   670 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b3b:	58                   	pop    %eax
     b3c:	5a                   	pop    %edx
     b3d:	57                   	push   %edi
     b3e:	56                   	push   %esi
     b3f:	e8 ac ff ff ff       	call   af0 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     b44:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b4b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     b4d:	e8 fe 08 00 00       	call   1450 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     b52:	83 c4 0c             	add    $0xc,%esp
     b55:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     b57:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     b59:	6a 00                	push   $0x0
     b5b:	50                   	push   %eax
     b5c:	e8 af 03 00 00       	call   f10 <memset>
  cmd->left = left;
     b61:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     b64:	83 c4 10             	add    $0x10,%esp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b67:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     b69:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     b6f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     b71:	89 7e 08             	mov    %edi,0x8(%esi)
}
     b74:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b77:	5b                   	pop    %ebx
     b78:	5e                   	pop    %esi
     b79:	5f                   	pop    %edi
     b7a:	5d                   	pop    %ebp
     b7b:	c3                   	ret
     b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b80 <parseline>:
{
     b80:	55                   	push   %ebp
     b81:	89 e5                	mov    %esp,%ebp
     b83:	57                   	push   %edi
     b84:	56                   	push   %esi
     b85:	53                   	push   %ebx
     b86:	83 ec 24             	sub    $0x24,%esp
     b89:	8b 75 08             	mov    0x8(%ebp),%esi
     b8c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     b8f:	57                   	push   %edi
     b90:	56                   	push   %esi
     b91:	e8 5a ff ff ff       	call   af0 <parsepipe>
  while(peek(ps, es, "&")){
     b96:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     b99:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     b9b:	eb 3b                	jmp    bd8 <parseline+0x58>
     b9d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     ba0:	6a 00                	push   $0x0
     ba2:	6a 00                	push   $0x0
     ba4:	57                   	push   %edi
     ba5:	56                   	push   %esi
     ba6:	e8 c5 fa ff ff       	call   670 <gettoken>
  cmd = malloc(sizeof(*cmd));
     bab:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     bb2:	e8 99 08 00 00       	call   1450 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     bb7:	83 c4 0c             	add    $0xc,%esp
     bba:	6a 08                	push   $0x8
     bbc:	6a 00                	push   $0x0
     bbe:	50                   	push   %eax
     bbf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     bc2:	e8 49 03 00 00       	call   f10 <memset>
  cmd->type = BACK;
     bc7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     bca:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     bcd:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     bd3:	89 5a 04             	mov    %ebx,0x4(%edx)
    cmd = backcmd(cmd);
     bd6:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     bd8:	83 ec 04             	sub    $0x4,%esp
     bdb:	68 aa 15 00 00       	push   $0x15aa
     be0:	57                   	push   %edi
     be1:	56                   	push   %esi
     be2:	e8 f9 fb ff ff       	call   7e0 <peek>
     be7:	83 c4 10             	add    $0x10,%esp
     bea:	85 c0                	test   %eax,%eax
     bec:	75 b2                	jne    ba0 <parseline+0x20>
  if(peek(ps, es, ";")){
     bee:	83 ec 04             	sub    $0x4,%esp
     bf1:	68 a6 15 00 00       	push   $0x15a6
     bf6:	57                   	push   %edi
     bf7:	56                   	push   %esi
     bf8:	e8 e3 fb ff ff       	call   7e0 <peek>
     bfd:	83 c4 10             	add    $0x10,%esp
     c00:	85 c0                	test   %eax,%eax
     c02:	75 0c                	jne    c10 <parseline+0x90>
}
     c04:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c07:	89 d8                	mov    %ebx,%eax
     c09:	5b                   	pop    %ebx
     c0a:	5e                   	pop    %esi
     c0b:	5f                   	pop    %edi
     c0c:	5d                   	pop    %ebp
     c0d:	c3                   	ret
     c0e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     c10:	6a 00                	push   $0x0
     c12:	6a 00                	push   $0x0
     c14:	57                   	push   %edi
     c15:	56                   	push   %esi
     c16:	e8 55 fa ff ff       	call   670 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     c1b:	58                   	pop    %eax
     c1c:	5a                   	pop    %edx
     c1d:	57                   	push   %edi
     c1e:	56                   	push   %esi
     c1f:	e8 5c ff ff ff       	call   b80 <parseline>
  cmd = malloc(sizeof(*cmd));
     c24:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     c2b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     c2d:	e8 1e 08 00 00       	call   1450 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     c32:	83 c4 0c             	add    $0xc,%esp
     c35:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     c37:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     c39:	6a 00                	push   $0x0
     c3b:	50                   	push   %eax
     c3c:	e8 cf 02 00 00       	call   f10 <memset>
  cmd->left = left;
     c41:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     c44:	83 c4 10             	add    $0x10,%esp
    cmd = listcmd(cmd, parseline(ps, es));
     c47:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     c49:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     c4f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     c51:	89 7e 08             	mov    %edi,0x8(%esi)
}
     c54:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c57:	5b                   	pop    %ebx
     c58:	5e                   	pop    %esi
     c59:	5f                   	pop    %edi
     c5a:	5d                   	pop    %ebp
     c5b:	c3                   	ret
     c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c60 <parseblock>:
{
     c60:	55                   	push   %ebp
     c61:	89 e5                	mov    %esp,%ebp
     c63:	57                   	push   %edi
     c64:	56                   	push   %esi
     c65:	53                   	push   %ebx
     c66:	83 ec 10             	sub    $0x10,%esp
     c69:	8b 5d 08             	mov    0x8(%ebp),%ebx
     c6c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     c6f:	68 8c 15 00 00       	push   $0x158c
     c74:	56                   	push   %esi
     c75:	53                   	push   %ebx
     c76:	e8 65 fb ff ff       	call   7e0 <peek>
     c7b:	83 c4 10             	add    $0x10,%esp
     c7e:	85 c0                	test   %eax,%eax
     c80:	74 4e                	je     cd0 <parseblock+0x70>
  gettoken(ps, es, 0, 0);
     c82:	6a 00                	push   $0x0
     c84:	6a 00                	push   $0x0
     c86:	56                   	push   %esi
     c87:	53                   	push   %ebx
     c88:	e8 e3 f9 ff ff       	call   670 <gettoken>
  cmd = parseline(ps, es);
     c8d:	58                   	pop    %eax
     c8e:	5a                   	pop    %edx
     c8f:	56                   	push   %esi
     c90:	53                   	push   %ebx
     c91:	e8 ea fe ff ff       	call   b80 <parseline>
  if(!peek(ps, es, ")"))
     c96:	83 c4 0c             	add    $0xc,%esp
     c99:	68 c8 15 00 00       	push   $0x15c8
  cmd = parseline(ps, es);
     c9e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     ca0:	56                   	push   %esi
     ca1:	53                   	push   %ebx
     ca2:	e8 39 fb ff ff       	call   7e0 <peek>
     ca7:	83 c4 10             	add    $0x10,%esp
     caa:	85 c0                	test   %eax,%eax
     cac:	74 4a                	je     cf8 <parseblock+0x98>
  gettoken(ps, es, 0, 0);
     cae:	6a 00                	push   $0x0
     cb0:	6a 00                	push   $0x0
     cb2:	56                   	push   %esi
     cb3:	53                   	push   %ebx
     cb4:	e8 b7 f9 ff ff       	call   670 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     cb9:	83 c4 0c             	add    $0xc,%esp
     cbc:	56                   	push   %esi
     cbd:	53                   	push   %ebx
     cbe:	57                   	push   %edi
     cbf:	e8 9c fb ff ff       	call   860 <parseredirs>
}
     cc4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cc7:	5b                   	pop    %ebx
     cc8:	5e                   	pop    %esi
     cc9:	5f                   	pop    %edi
     cca:	5d                   	pop    %ebp
     ccb:	c3                   	ret
     ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  printf(2, "%s\n", s);
     cd0:	83 ec 04             	sub    $0x4,%esp
     cd3:	68 ac 15 00 00       	push   $0x15ac
     cd8:	68 d5 15 00 00       	push   $0x15d5
     cdd:	6a 02                	push   $0x2
     cdf:	e8 4c 05 00 00       	call   1230 <printf>
  exit(0);
     ce4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     ceb:	e8 b2 03 00 00       	call   10a2 <exit>
}
     cf0:	83 c4 10             	add    $0x10,%esp
     cf3:	eb 8d                	jmp    c82 <parseblock+0x22>
     cf5:	8d 76 00             	lea    0x0(%esi),%esi
  printf(2, "%s\n", s);
     cf8:	83 ec 04             	sub    $0x4,%esp
     cfb:	68 b7 15 00 00       	push   $0x15b7
     d00:	68 d5 15 00 00       	push   $0x15d5
     d05:	6a 02                	push   $0x2
     d07:	e8 24 05 00 00       	call   1230 <printf>
  exit(0);
     d0c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d13:	e8 8a 03 00 00       	call   10a2 <exit>
}
     d18:	83 c4 10             	add    $0x10,%esp
     d1b:	eb 91                	jmp    cae <parseblock+0x4e>
     d1d:	8d 76 00             	lea    0x0(%esi),%esi

00000d20 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     d20:	55                   	push   %ebp
     d21:	89 e5                	mov    %esp,%ebp
     d23:	53                   	push   %ebx
     d24:	83 ec 04             	sub    $0x4,%esp
     d27:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     d2a:	85 db                	test   %ebx,%ebx
     d2c:	74 29                	je     d57 <nulterminate+0x37>
    return 0;

  switch(cmd->type){
     d2e:	83 3b 05             	cmpl   $0x5,(%ebx)
     d31:	77 24                	ja     d57 <nulterminate+0x37>
     d33:	8b 03                	mov    (%ebx),%eax
     d35:	ff 24 85 10 16 00 00 	jmp    *0x1610(,%eax,4)
     d3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     d40:	83 ec 0c             	sub    $0xc,%esp
     d43:	ff 73 04             	push   0x4(%ebx)
     d46:	e8 d5 ff ff ff       	call   d20 <nulterminate>
    nulterminate(lcmd->right);
     d4b:	58                   	pop    %eax
     d4c:	ff 73 08             	push   0x8(%ebx)
     d4f:	e8 cc ff ff ff       	call   d20 <nulterminate>
    break;
     d54:	83 c4 10             	add    $0x10,%esp
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     d57:	89 d8                	mov    %ebx,%eax
     d59:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d5c:	c9                   	leave
     d5d:	c3                   	ret
     d5e:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     d60:	83 ec 0c             	sub    $0xc,%esp
     d63:	ff 73 04             	push   0x4(%ebx)
     d66:	e8 b5 ff ff ff       	call   d20 <nulterminate>
}
     d6b:	89 d8                	mov    %ebx,%eax
    break;
     d6d:	83 c4 10             	add    $0x10,%esp
}
     d70:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d73:	c9                   	leave
     d74:	c3                   	ret
     d75:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     d78:	8b 4b 04             	mov    0x4(%ebx),%ecx
     d7b:	85 c9                	test   %ecx,%ecx
     d7d:	74 d8                	je     d57 <nulterminate+0x37>
     d7f:	8d 43 08             	lea    0x8(%ebx),%eax
     d82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     d88:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     d8b:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     d8e:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     d91:	8b 50 fc             	mov    -0x4(%eax),%edx
     d94:	85 d2                	test   %edx,%edx
     d96:	75 f0                	jne    d88 <nulterminate+0x68>
}
     d98:	89 d8                	mov    %ebx,%eax
     d9a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d9d:	c9                   	leave
     d9e:	c3                   	ret
     d9f:	90                   	nop
    nulterminate(rcmd->cmd);
     da0:	83 ec 0c             	sub    $0xc,%esp
     da3:	ff 73 04             	push   0x4(%ebx)
     da6:	e8 75 ff ff ff       	call   d20 <nulterminate>
    *rcmd->efile = 0;
     dab:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     dae:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     db1:	c6 00 00             	movb   $0x0,(%eax)
}
     db4:	89 d8                	mov    %ebx,%eax
     db6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     db9:	c9                   	leave
     dba:	c3                   	ret
     dbb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00000dc0 <parsecmd>:
{
     dc0:	55                   	push   %ebp
     dc1:	89 e5                	mov    %esp,%ebp
     dc3:	57                   	push   %edi
     dc4:	56                   	push   %esi
  cmd = parseline(&s, es);
     dc5:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     dc8:	53                   	push   %ebx
     dc9:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     dcc:	8b 5d 08             	mov    0x8(%ebp),%ebx
     dcf:	53                   	push   %ebx
     dd0:	e8 0b 01 00 00       	call   ee0 <strlen>
     dd5:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     dd7:	58                   	pop    %eax
     dd8:	5a                   	pop    %edx
     dd9:	53                   	push   %ebx
     dda:	57                   	push   %edi
     ddb:	e8 a0 fd ff ff       	call   b80 <parseline>
  peek(&s, es, "");
     de0:	83 c4 0c             	add    $0xc,%esp
     de3:	68 4e 15 00 00       	push   $0x154e
  cmd = parseline(&s, es);
     de8:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     dea:	53                   	push   %ebx
     deb:	57                   	push   %edi
     dec:	e8 ef f9 ff ff       	call   7e0 <peek>
  if(s != es){
     df1:	8b 45 08             	mov    0x8(%ebp),%eax
     df4:	83 c4 10             	add    $0x10,%esp
     df7:	39 d8                	cmp    %ebx,%eax
     df9:	74 33                	je     e2e <parsecmd+0x6e>
    printf(2, "leftovers: %s\n", s);
     dfb:	83 ec 04             	sub    $0x4,%esp
     dfe:	50                   	push   %eax
     dff:	68 ca 15 00 00       	push   $0x15ca
     e04:	6a 02                	push   $0x2
     e06:	e8 25 04 00 00       	call   1230 <printf>
  printf(2, "%s\n", s);
     e0b:	83 c4 0c             	add    $0xc,%esp
     e0e:	68 8e 15 00 00       	push   $0x158e
     e13:	68 d5 15 00 00       	push   $0x15d5
     e18:	6a 02                	push   $0x2
     e1a:	e8 11 04 00 00       	call   1230 <printf>
  exit(0);
     e1f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e26:	e8 77 02 00 00       	call   10a2 <exit>
}
     e2b:	83 c4 10             	add    $0x10,%esp
  nulterminate(cmd);
     e2e:	83 ec 0c             	sub    $0xc,%esp
     e31:	56                   	push   %esi
     e32:	e8 e9 fe ff ff       	call   d20 <nulterminate>
}
     e37:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e3a:	89 f0                	mov    %esi,%eax
     e3c:	5b                   	pop    %ebx
     e3d:	5e                   	pop    %esi
     e3e:	5f                   	pop    %edi
     e3f:	5d                   	pop    %ebp
     e40:	c3                   	ret
     e41:	66 90                	xchg   %ax,%ax
     e43:	66 90                	xchg   %ax,%ax
     e45:	66 90                	xchg   %ax,%ax
     e47:	66 90                	xchg   %ax,%ax
     e49:	66 90                	xchg   %ax,%ax
     e4b:	66 90                	xchg   %ax,%ax
     e4d:	66 90                	xchg   %ax,%ax
     e4f:	90                   	nop

00000e50 <strcpy>:
#include "user.h"
#include "x86.h"

// String and memory utilities

char* strcpy(char *s, const char *t) {
     e50:	55                   	push   %ebp
  char *os = s;
  while ((*s++ = *t++) != 0);
     e51:	31 c0                	xor    %eax,%eax
char* strcpy(char *s, const char *t) {
     e53:	89 e5                	mov    %esp,%ebp
     e55:	53                   	push   %ebx
     e56:	8b 4d 08             	mov    0x8(%ebp),%ecx
     e59:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0);
     e60:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     e64:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     e67:	83 c0 01             	add    $0x1,%eax
     e6a:	84 d2                	test   %dl,%dl
     e6c:	75 f2                	jne    e60 <strcpy+0x10>
  return os;
}
     e6e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e71:	89 c8                	mov    %ecx,%eax
     e73:	c9                   	leave
     e74:	c3                   	ret
     e75:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e7c:	00 
     e7d:	8d 76 00             	lea    0x0(%esi),%esi

00000e80 <strcmp>:

int strcmp(const char *p, const char *q) {
     e80:	55                   	push   %ebp
     e81:	89 e5                	mov    %esp,%ebp
     e83:	53                   	push   %ebx
     e84:	8b 55 08             	mov    0x8(%ebp),%edx
     e87:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
     e8a:	0f b6 02             	movzbl (%edx),%eax
     e8d:	84 c0                	test   %al,%al
     e8f:	75 17                	jne    ea8 <strcmp+0x28>
     e91:	eb 3a                	jmp    ecd <strcmp+0x4d>
     e93:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     e98:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     e9c:	83 c2 01             	add    $0x1,%edx
     e9f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
     ea2:	84 c0                	test   %al,%al
     ea4:	74 1a                	je     ec0 <strcmp+0x40>
     ea6:	89 d9                	mov    %ebx,%ecx
     ea8:	0f b6 19             	movzbl (%ecx),%ebx
     eab:	38 c3                	cmp    %al,%bl
     ead:	74 e9                	je     e98 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     eaf:	29 d8                	sub    %ebx,%eax
}
     eb1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     eb4:	c9                   	leave
     eb5:	c3                   	ret
     eb6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     ebd:	00 
     ebe:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
     ec0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     ec4:	31 c0                	xor    %eax,%eax
     ec6:	29 d8                	sub    %ebx,%eax
}
     ec8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ecb:	c9                   	leave
     ecc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     ecd:	0f b6 19             	movzbl (%ecx),%ebx
     ed0:	31 c0                	xor    %eax,%eax
     ed2:	eb db                	jmp    eaf <strcmp+0x2f>
     ed4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     edb:	00 
     edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ee0 <strlen>:

uint strlen(const char *s) {
     ee0:	55                   	push   %ebp
     ee1:	89 e5                	mov    %esp,%ebp
     ee3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;
  for (n = 0; s[n]; n++);
     ee6:	80 3a 00             	cmpb   $0x0,(%edx)
     ee9:	74 15                	je     f00 <strlen+0x20>
     eeb:	31 c0                	xor    %eax,%eax
     eed:	8d 76 00             	lea    0x0(%esi),%esi
     ef0:	83 c0 01             	add    $0x1,%eax
     ef3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     ef7:	89 c1                	mov    %eax,%ecx
     ef9:	75 f5                	jne    ef0 <strlen+0x10>
  return n;
}
     efb:	89 c8                	mov    %ecx,%eax
     efd:	5d                   	pop    %ebp
     efe:	c3                   	ret
     eff:	90                   	nop
  for (n = 0; s[n]; n++);
     f00:	31 c9                	xor    %ecx,%ecx
}
     f02:	5d                   	pop    %ebp
     f03:	89 c8                	mov    %ecx,%eax
     f05:	c3                   	ret
     f06:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f0d:	00 
     f0e:	66 90                	xchg   %ax,%ax

00000f10 <memset>:

void* memset(void *dst, int c, uint n) {
     f10:	55                   	push   %ebp
     f11:	89 e5                	mov    %esp,%ebp
     f13:	57                   	push   %edi
     f14:	8b 55 08             	mov    0x8(%ebp),%edx
               "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     f17:	8b 4d 10             	mov    0x10(%ebp),%ecx
     f1a:	8b 45 0c             	mov    0xc(%ebp),%eax
     f1d:	89 d7                	mov    %edx,%edi
     f1f:	fc                   	cld
     f20:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     f22:	8b 7d fc             	mov    -0x4(%ebp),%edi
     f25:	89 d0                	mov    %edx,%eax
     f27:	c9                   	leave
     f28:	c3                   	ret
     f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f30 <strchr>:

char* strchr(const char *s, int c) {
     f30:	55                   	push   %ebp
     f31:	89 e5                	mov    %esp,%ebp
     f33:	8b 45 08             	mov    0x8(%ebp),%eax
     f36:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  for (; *s; s++)
     f39:	0f be 10             	movsbl (%eax),%edx
     f3c:	84 d2                	test   %dl,%dl
     f3e:	75 13                	jne    f53 <strchr+0x23>
     f40:	eb 1e                	jmp    f60 <strchr+0x30>
     f42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     f48:	0f be 50 01          	movsbl 0x1(%eax),%edx
     f4c:	83 c0 01             	add    $0x1,%eax
     f4f:	84 d2                	test   %dl,%dl
     f51:	74 0d                	je     f60 <strchr+0x30>
    if (*s == c)
     f53:	39 ca                	cmp    %ecx,%edx
     f55:	75 f1                	jne    f48 <strchr+0x18>
      return (char*)s;
  return 0;
}
     f57:	5d                   	pop    %ebp
     f58:	c3                   	ret
     f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     f60:	31 c0                	xor    %eax,%eax
}
     f62:	5d                   	pop    %ebp
     f63:	c3                   	ret
     f64:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     f6b:	00 
     f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000f70 <gets>:

char* gets(char *buf, int max) {
     f70:	55                   	push   %ebp
     f71:	89 e5                	mov    %esp,%ebp
     f73:	57                   	push   %edi
     f74:	56                   	push   %esi
  int i, cc;
  char c;
  for (i = 0; i+1 < max;) {
    cc = read(0, &c, 1);
     f75:	8d 75 e7             	lea    -0x19(%ebp),%esi
char* gets(char *buf, int max) {
     f78:	53                   	push   %ebx
  for (i = 0; i+1 < max;) {
     f79:	31 db                	xor    %ebx,%ebx
char* gets(char *buf, int max) {
     f7b:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i+1 < max;) {
     f7e:	eb 27                	jmp    fa7 <gets+0x37>
    cc = read(0, &c, 1);
     f80:	83 ec 04             	sub    $0x4,%esp
     f83:	6a 01                	push   $0x1
     f85:	56                   	push   %esi
     f86:	6a 00                	push   $0x0
     f88:	e8 2d 01 00 00       	call   10ba <read>
    if (cc < 1) break;
     f8d:	83 c4 10             	add    $0x10,%esp
     f90:	85 c0                	test   %eax,%eax
     f92:	7e 1d                	jle    fb1 <gets+0x41>
    buf[i++] = c;
     f94:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     f98:	8b 55 08             	mov    0x8(%ebp),%edx
     f9b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r') break;
     f9f:	3c 0a                	cmp    $0xa,%al
     fa1:	74 10                	je     fb3 <gets+0x43>
     fa3:	3c 0d                	cmp    $0xd,%al
     fa5:	74 0c                	je     fb3 <gets+0x43>
  for (i = 0; i+1 < max;) {
     fa7:	89 df                	mov    %ebx,%edi
     fa9:	83 c3 01             	add    $0x1,%ebx
     fac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     faf:	7c cf                	jl     f80 <gets+0x10>
     fb1:	89 fb                	mov    %edi,%ebx
  }
  buf[i] = '\0';
     fb3:	8b 45 08             	mov    0x8(%ebp),%eax
     fb6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     fba:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fbd:	5b                   	pop    %ebx
     fbe:	5e                   	pop    %esi
     fbf:	5f                   	pop    %edi
     fc0:	5d                   	pop    %ebp
     fc1:	c3                   	ret
     fc2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     fc9:	00 
     fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000fd0 <stat>:

int stat(const char *n, struct stat *st) {
     fd0:	55                   	push   %ebp
     fd1:	89 e5                	mov    %esp,%ebp
     fd3:	56                   	push   %esi
     fd4:	53                   	push   %ebx
  int fd, r;
  fd = open(n, O_RDONLY);
     fd5:	83 ec 08             	sub    $0x8,%esp
     fd8:	6a 00                	push   $0x0
     fda:	ff 75 08             	push   0x8(%ebp)
     fdd:	e8 00 01 00 00       	call   10e2 <open>
  if (fd < 0) return -1;
     fe2:	83 c4 10             	add    $0x10,%esp
     fe5:	85 c0                	test   %eax,%eax
     fe7:	78 27                	js     1010 <stat+0x40>
  r = fstat(fd, st);
     fe9:	83 ec 08             	sub    $0x8,%esp
     fec:	ff 75 0c             	push   0xc(%ebp)
     fef:	89 c3                	mov    %eax,%ebx
     ff1:	50                   	push   %eax
     ff2:	e8 03 01 00 00       	call   10fa <fstat>
  close(fd);
     ff7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     ffa:	89 c6                	mov    %eax,%esi
  close(fd);
     ffc:	e8 c9 00 00 00       	call   10ca <close>
  return r;
    1001:	83 c4 10             	add    $0x10,%esp
}
    1004:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1007:	89 f0                	mov    %esi,%eax
    1009:	5b                   	pop    %ebx
    100a:	5e                   	pop    %esi
    100b:	5d                   	pop    %ebp
    100c:	c3                   	ret
    100d:	8d 76 00             	lea    0x0(%esi),%esi
  if (fd < 0) return -1;
    1010:	be ff ff ff ff       	mov    $0xffffffff,%esi
    1015:	eb ed                	jmp    1004 <stat+0x34>
    1017:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    101e:	00 
    101f:	90                   	nop

00001020 <atoi>:

int atoi(const char *s) {
    1020:	55                   	push   %ebp
    1021:	89 e5                	mov    %esp,%ebp
    1023:	53                   	push   %ebx
    1024:	8b 55 08             	mov    0x8(%ebp),%edx
  int n = 0;
  while ('0' <= *s && *s <= '9')
    1027:	0f be 02             	movsbl (%edx),%eax
    102a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    102d:	80 f9 09             	cmp    $0x9,%cl
  int n = 0;
    1030:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
    1035:	77 1e                	ja     1055 <atoi+0x35>
    1037:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    103e:	00 
    103f:	90                   	nop
    n = n*10 + *s++ - '0';
    1040:	83 c2 01             	add    $0x1,%edx
    1043:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1046:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
    104a:	0f be 02             	movsbl (%edx),%eax
    104d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1050:	80 fb 09             	cmp    $0x9,%bl
    1053:	76 eb                	jbe    1040 <atoi+0x20>
  return n;
}
    1055:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1058:	89 c8                	mov    %ecx,%eax
    105a:	c9                   	leave
    105b:	c3                   	ret
    105c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001060 <memmove>:

void* memmove(void *vdst, const void *vsrc, int n) {
    1060:	55                   	push   %ebp
    1061:	89 e5                	mov    %esp,%ebp
    1063:	57                   	push   %edi
    1064:	8b 45 10             	mov    0x10(%ebp),%eax
    1067:	8b 55 08             	mov    0x8(%ebp),%edx
    106a:	56                   	push   %esi
    106b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst = vdst;
  const char *src = vsrc;
  while (n-- > 0)
    106e:	85 c0                	test   %eax,%eax
    1070:	7e 13                	jle    1085 <memmove+0x25>
    1072:	01 d0                	add    %edx,%eax
  char *dst = vdst;
    1074:	89 d7                	mov    %edx,%edi
    1076:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    107d:	00 
    107e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
    1080:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
    1081:	39 f8                	cmp    %edi,%eax
    1083:	75 fb                	jne    1080 <memmove+0x20>
  return vdst;
}
    1085:	5e                   	pop    %esi
    1086:	89 d0                	mov    %edx,%eax
    1088:	5f                   	pop    %edi
    1089:	5d                   	pop    %ebp
    108a:	c3                   	ret
    108b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00001090 <syscall>:

// Add syscall definition for internal use
int syscall(int num, ...) {
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    int ret;
    asm volatile("int $64" : "=a" (ret) : "a" (num));
    1093:	8b 45 08             	mov    0x8(%ebp),%eax
    1096:	cd 40                	int    $0x40
    return ret;
}
    1098:	5d                   	pop    %ebp
    1099:	c3                   	ret

0000109a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    109a:	b8 01 00 00 00       	mov    $0x1,%eax
    109f:	cd 40                	int    $0x40
    10a1:	c3                   	ret

000010a2 <exit>:
SYSCALL(exit)
    10a2:	b8 02 00 00 00       	mov    $0x2,%eax
    10a7:	cd 40                	int    $0x40
    10a9:	c3                   	ret

000010aa <wait>:
SYSCALL(wait)
    10aa:	b8 03 00 00 00       	mov    $0x3,%eax
    10af:	cd 40                	int    $0x40
    10b1:	c3                   	ret

000010b2 <pipe>:
SYSCALL(pipe)
    10b2:	b8 04 00 00 00       	mov    $0x4,%eax
    10b7:	cd 40                	int    $0x40
    10b9:	c3                   	ret

000010ba <read>:
SYSCALL(read)
    10ba:	b8 05 00 00 00       	mov    $0x5,%eax
    10bf:	cd 40                	int    $0x40
    10c1:	c3                   	ret

000010c2 <write>:
SYSCALL(write)
    10c2:	b8 10 00 00 00       	mov    $0x10,%eax
    10c7:	cd 40                	int    $0x40
    10c9:	c3                   	ret

000010ca <close>:
SYSCALL(close)
    10ca:	b8 15 00 00 00       	mov    $0x15,%eax
    10cf:	cd 40                	int    $0x40
    10d1:	c3                   	ret

000010d2 <kill>:
SYSCALL(kill)
    10d2:	b8 06 00 00 00       	mov    $0x6,%eax
    10d7:	cd 40                	int    $0x40
    10d9:	c3                   	ret

000010da <exec>:
SYSCALL(exec)
    10da:	b8 07 00 00 00       	mov    $0x7,%eax
    10df:	cd 40                	int    $0x40
    10e1:	c3                   	ret

000010e2 <open>:
SYSCALL(open)
    10e2:	b8 0f 00 00 00       	mov    $0xf,%eax
    10e7:	cd 40                	int    $0x40
    10e9:	c3                   	ret

000010ea <mknod>:
SYSCALL(mknod)
    10ea:	b8 11 00 00 00       	mov    $0x11,%eax
    10ef:	cd 40                	int    $0x40
    10f1:	c3                   	ret

000010f2 <unlink>:
SYSCALL(unlink)
    10f2:	b8 12 00 00 00       	mov    $0x12,%eax
    10f7:	cd 40                	int    $0x40
    10f9:	c3                   	ret

000010fa <fstat>:
SYSCALL(fstat)
    10fa:	b8 08 00 00 00       	mov    $0x8,%eax
    10ff:	cd 40                	int    $0x40
    1101:	c3                   	ret

00001102 <link>:
SYSCALL(link)
    1102:	b8 13 00 00 00       	mov    $0x13,%eax
    1107:	cd 40                	int    $0x40
    1109:	c3                   	ret

0000110a <mkdir>:
SYSCALL(mkdir)
    110a:	b8 14 00 00 00       	mov    $0x14,%eax
    110f:	cd 40                	int    $0x40
    1111:	c3                   	ret

00001112 <chdir>:
SYSCALL(chdir)
    1112:	b8 09 00 00 00       	mov    $0x9,%eax
    1117:	cd 40                	int    $0x40
    1119:	c3                   	ret

0000111a <dup>:
SYSCALL(dup)
    111a:	b8 0a 00 00 00       	mov    $0xa,%eax
    111f:	cd 40                	int    $0x40
    1121:	c3                   	ret

00001122 <getpid>:
SYSCALL(getpid)
    1122:	b8 0b 00 00 00       	mov    $0xb,%eax
    1127:	cd 40                	int    $0x40
    1129:	c3                   	ret

0000112a <sbrk>:
SYSCALL(sbrk)
    112a:	b8 0c 00 00 00       	mov    $0xc,%eax
    112f:	cd 40                	int    $0x40
    1131:	c3                   	ret

00001132 <sleep>:
SYSCALL(sleep)
    1132:	b8 0d 00 00 00       	mov    $0xd,%eax
    1137:	cd 40                	int    $0x40
    1139:	c3                   	ret

0000113a <uptime>:
SYSCALL(uptime)
    113a:	b8 0e 00 00 00       	mov    $0xe,%eax
    113f:	cd 40                	int    $0x40
    1141:	c3                   	ret

00001142 <spawn>:
SYSCALL(spawn)
    1142:	b8 16 00 00 00       	mov    $0x16,%eax
    1147:	cd 40                	int    $0x40
    1149:	c3                   	ret

0000114a <shm_open>:
SYSCALL(shm_open)
    114a:	b8 17 00 00 00       	mov    $0x17,%eax
    114f:	cd 40                	int    $0x40
    1151:	c3                   	ret

00001152 <shm_attach>:
SYSCALL(shm_attach)
    1152:	b8 18 00 00 00       	mov    $0x18,%eax
    1157:	cd 40                	int    $0x40
    1159:	c3                   	ret

0000115a <thread_create>:
SYSCALL(thread_create)
    115a:	b8 19 00 00 00       	mov    $0x19,%eax
    115f:	cd 40                	int    $0x40
    1161:	c3                   	ret

00001162 <thread_join>:
SYSCALL(thread_join)
    1162:	b8 1a 00 00 00       	mov    $0x1a,%eax
    1167:	cd 40                	int    $0x40
    1169:	c3                   	ret

0000116a <mutex_lock>:
SYSCALL(mutex_lock)
    116a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    116f:	cd 40                	int    $0x40
    1171:	c3                   	ret

00001172 <mutex_unlock>:
SYSCALL(mutex_unlock)
    1172:	b8 1c 00 00 00       	mov    $0x1c,%eax
    1177:	cd 40                	int    $0x40
    1179:	c3                   	ret

0000117a <signal>:
SYSCALL(signal)
    117a:	b8 1d 00 00 00       	mov    $0x1d,%eax
    117f:	cd 40                	int    $0x40
    1181:	c3                   	ret
    1182:	66 90                	xchg   %ax,%ax
    1184:	66 90                	xchg   %ax,%ax
    1186:	66 90                	xchg   %ax,%ax
    1188:	66 90                	xchg   %ax,%ax
    118a:	66 90                	xchg   %ax,%ax
    118c:	66 90                	xchg   %ax,%ax
    118e:	66 90                	xchg   %ax,%ax

00001190 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	57                   	push   %edi
    1194:	56                   	push   %esi
    1195:	53                   	push   %ebx
    1196:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    1198:	89 d1                	mov    %edx,%ecx
{
    119a:	83 ec 3c             	sub    $0x3c,%esp
    119d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
    11a0:	85 d2                	test   %edx,%edx
    11a2:	0f 89 80 00 00 00    	jns    1228 <printint+0x98>
    11a8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    11ac:	74 7a                	je     1228 <printint+0x98>
    x = -xx;
    11ae:	f7 d9                	neg    %ecx
    neg = 1;
    11b0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
    11b5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    11b8:	31 f6                	xor    %esi,%esi
    11ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    11c0:	89 c8                	mov    %ecx,%eax
    11c2:	31 d2                	xor    %edx,%edx
    11c4:	89 f7                	mov    %esi,%edi
    11c6:	f7 f3                	div    %ebx
    11c8:	8d 76 01             	lea    0x1(%esi),%esi
    11cb:	0f b6 92 80 16 00 00 	movzbl 0x1680(%edx),%edx
    11d2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
    11d6:	89 ca                	mov    %ecx,%edx
    11d8:	89 c1                	mov    %eax,%ecx
    11da:	39 da                	cmp    %ebx,%edx
    11dc:	73 e2                	jae    11c0 <printint+0x30>
  if(neg)
    11de:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    11e1:	85 c0                	test   %eax,%eax
    11e3:	74 07                	je     11ec <printint+0x5c>
    buf[i++] = '-';
    11e5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
    11ea:	89 f7                	mov    %esi,%edi
    11ec:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    11ef:	8b 75 c0             	mov    -0x40(%ebp),%esi
    11f2:	01 df                	add    %ebx,%edi
    11f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
    11f8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
    11fb:	83 ec 04             	sub    $0x4,%esp
    11fe:	88 45 d7             	mov    %al,-0x29(%ebp)
    1201:	8d 45 d7             	lea    -0x29(%ebp),%eax
    1204:	6a 01                	push   $0x1
    1206:	50                   	push   %eax
    1207:	56                   	push   %esi
    1208:	e8 b5 fe ff ff       	call   10c2 <write>
  while(--i >= 0)
    120d:	89 f8                	mov    %edi,%eax
    120f:	83 c4 10             	add    $0x10,%esp
    1212:	83 ef 01             	sub    $0x1,%edi
    1215:	39 c3                	cmp    %eax,%ebx
    1217:	75 df                	jne    11f8 <printint+0x68>
}
    1219:	8d 65 f4             	lea    -0xc(%ebp),%esp
    121c:	5b                   	pop    %ebx
    121d:	5e                   	pop    %esi
    121e:	5f                   	pop    %edi
    121f:	5d                   	pop    %ebp
    1220:	c3                   	ret
    1221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1228:	31 c0                	xor    %eax,%eax
    122a:	eb 89                	jmp    11b5 <printint+0x25>
    122c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001230 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	57                   	push   %edi
    1234:	56                   	push   %esi
    1235:	53                   	push   %ebx
    1236:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1239:	8b 75 0c             	mov    0xc(%ebp),%esi
{
    123c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
    123f:	0f b6 1e             	movzbl (%esi),%ebx
    1242:	83 c6 01             	add    $0x1,%esi
    1245:	84 db                	test   %bl,%bl
    1247:	74 67                	je     12b0 <printf+0x80>
    1249:	8d 4d 10             	lea    0x10(%ebp),%ecx
    124c:	31 d2                	xor    %edx,%edx
    124e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    1251:	eb 34                	jmp    1287 <printf+0x57>
    1253:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    1258:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    125b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1260:	83 f8 25             	cmp    $0x25,%eax
    1263:	74 18                	je     127d <printf+0x4d>
  write(fd, &c, 1);
    1265:	83 ec 04             	sub    $0x4,%esp
    1268:	8d 45 e7             	lea    -0x19(%ebp),%eax
    126b:	88 5d e7             	mov    %bl,-0x19(%ebp)
    126e:	6a 01                	push   $0x1
    1270:	50                   	push   %eax
    1271:	57                   	push   %edi
    1272:	e8 4b fe ff ff       	call   10c2 <write>
    1277:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    127a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    127d:	0f b6 1e             	movzbl (%esi),%ebx
    1280:	83 c6 01             	add    $0x1,%esi
    1283:	84 db                	test   %bl,%bl
    1285:	74 29                	je     12b0 <printf+0x80>
    c = fmt[i] & 0xff;
    1287:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    128a:	85 d2                	test   %edx,%edx
    128c:	74 ca                	je     1258 <printf+0x28>
      }
    } else if(state == '%'){
    128e:	83 fa 25             	cmp    $0x25,%edx
    1291:	75 ea                	jne    127d <printf+0x4d>
      if(c == 'd'){
    1293:	83 f8 25             	cmp    $0x25,%eax
    1296:	0f 84 04 01 00 00    	je     13a0 <printf+0x170>
    129c:	83 e8 63             	sub    $0x63,%eax
    129f:	83 f8 15             	cmp    $0x15,%eax
    12a2:	77 1c                	ja     12c0 <printf+0x90>
    12a4:	ff 24 85 28 16 00 00 	jmp    *0x1628(,%eax,4)
    12ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    12b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12b3:	5b                   	pop    %ebx
    12b4:	5e                   	pop    %esi
    12b5:	5f                   	pop    %edi
    12b6:	5d                   	pop    %ebp
    12b7:	c3                   	ret
    12b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    12bf:	00 
  write(fd, &c, 1);
    12c0:	83 ec 04             	sub    $0x4,%esp
    12c3:	8d 55 e7             	lea    -0x19(%ebp),%edx
    12c6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    12ca:	6a 01                	push   $0x1
    12cc:	52                   	push   %edx
    12cd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    12d0:	57                   	push   %edi
    12d1:	e8 ec fd ff ff       	call   10c2 <write>
    12d6:	83 c4 0c             	add    $0xc,%esp
    12d9:	88 5d e7             	mov    %bl,-0x19(%ebp)
    12dc:	6a 01                	push   $0x1
    12de:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    12e1:	52                   	push   %edx
    12e2:	57                   	push   %edi
    12e3:	e8 da fd ff ff       	call   10c2 <write>
        putc(fd, c);
    12e8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    12eb:	31 d2                	xor    %edx,%edx
    12ed:	eb 8e                	jmp    127d <printf+0x4d>
    12ef:	90                   	nop
        printint(fd, *ap, 16, 0);
    12f0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    12f3:	83 ec 0c             	sub    $0xc,%esp
    12f6:	b9 10 00 00 00       	mov    $0x10,%ecx
    12fb:	8b 13                	mov    (%ebx),%edx
    12fd:	6a 00                	push   $0x0
    12ff:	89 f8                	mov    %edi,%eax
        ap++;
    1301:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
    1304:	e8 87 fe ff ff       	call   1190 <printint>
        ap++;
    1309:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    130c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    130f:	31 d2                	xor    %edx,%edx
    1311:	e9 67 ff ff ff       	jmp    127d <printf+0x4d>
        s = (char*)*ap;
    1316:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1319:	8b 18                	mov    (%eax),%ebx
        ap++;
    131b:	83 c0 04             	add    $0x4,%eax
    131e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1321:	85 db                	test   %ebx,%ebx
    1323:	0f 84 87 00 00 00    	je     13b0 <printf+0x180>
        while(*s != 0){
    1329:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    132c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    132e:	84 c0                	test   %al,%al
    1330:	0f 84 47 ff ff ff    	je     127d <printf+0x4d>
    1336:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1339:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    133c:	89 de                	mov    %ebx,%esi
    133e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
    1340:	83 ec 04             	sub    $0x4,%esp
    1343:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    1346:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1349:	6a 01                	push   $0x1
    134b:	53                   	push   %ebx
    134c:	57                   	push   %edi
    134d:	e8 70 fd ff ff       	call   10c2 <write>
        while(*s != 0){
    1352:	0f b6 06             	movzbl (%esi),%eax
    1355:	83 c4 10             	add    $0x10,%esp
    1358:	84 c0                	test   %al,%al
    135a:	75 e4                	jne    1340 <printf+0x110>
      state = 0;
    135c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    135f:	31 d2                	xor    %edx,%edx
    1361:	e9 17 ff ff ff       	jmp    127d <printf+0x4d>
        printint(fd, *ap, 10, 1);
    1366:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1369:	83 ec 0c             	sub    $0xc,%esp
    136c:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1371:	8b 13                	mov    (%ebx),%edx
    1373:	6a 01                	push   $0x1
    1375:	eb 88                	jmp    12ff <printf+0xcf>
        putc(fd, *ap);
    1377:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    137a:	83 ec 04             	sub    $0x4,%esp
    137d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    1380:	8b 03                	mov    (%ebx),%eax
        ap++;
    1382:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    1385:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1388:	6a 01                	push   $0x1
    138a:	52                   	push   %edx
    138b:	57                   	push   %edi
    138c:	e8 31 fd ff ff       	call   10c2 <write>
        ap++;
    1391:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1394:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1397:	31 d2                	xor    %edx,%edx
    1399:	e9 df fe ff ff       	jmp    127d <printf+0x4d>
    139e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
    13a0:	83 ec 04             	sub    $0x4,%esp
    13a3:	88 5d e7             	mov    %bl,-0x19(%ebp)
    13a6:	8d 55 e7             	lea    -0x19(%ebp),%edx
    13a9:	6a 01                	push   $0x1
    13ab:	e9 31 ff ff ff       	jmp    12e1 <printf+0xb1>
    13b0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    13b5:	bb ef 15 00 00       	mov    $0x15ef,%ebx
    13ba:	e9 77 ff ff ff       	jmp    1336 <printf+0x106>
    13bf:	90                   	nop

000013c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    13c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    13c1:	a1 04 1d 00 00       	mov    0x1d04,%eax
{
    13c6:	89 e5                	mov    %esp,%ebp
    13c8:	57                   	push   %edi
    13c9:	56                   	push   %esi
    13ca:	53                   	push   %ebx
    13cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    13ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    13d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13d8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    13da:	39 c8                	cmp    %ecx,%eax
    13dc:	73 32                	jae    1410 <free+0x50>
    13de:	39 d1                	cmp    %edx,%ecx
    13e0:	72 04                	jb     13e6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    13e2:	39 d0                	cmp    %edx,%eax
    13e4:	72 32                	jb     1418 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    13e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    13e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    13ec:	39 fa                	cmp    %edi,%edx
    13ee:	74 30                	je     1420 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    13f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    13f3:	8b 50 04             	mov    0x4(%eax),%edx
    13f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    13f9:	39 f1                	cmp    %esi,%ecx
    13fb:	74 3a                	je     1437 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    13fd:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    13ff:	5b                   	pop    %ebx
  freep = p;
    1400:	a3 04 1d 00 00       	mov    %eax,0x1d04
}
    1405:	5e                   	pop    %esi
    1406:	5f                   	pop    %edi
    1407:	5d                   	pop    %ebp
    1408:	c3                   	ret
    1409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1410:	39 d0                	cmp    %edx,%eax
    1412:	72 04                	jb     1418 <free+0x58>
    1414:	39 d1                	cmp    %edx,%ecx
    1416:	72 ce                	jb     13e6 <free+0x26>
{
    1418:	89 d0                	mov    %edx,%eax
    141a:	eb bc                	jmp    13d8 <free+0x18>
    141c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1420:	03 72 04             	add    0x4(%edx),%esi
    1423:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1426:	8b 10                	mov    (%eax),%edx
    1428:	8b 12                	mov    (%edx),%edx
    142a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    142d:	8b 50 04             	mov    0x4(%eax),%edx
    1430:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1433:	39 f1                	cmp    %esi,%ecx
    1435:	75 c6                	jne    13fd <free+0x3d>
    p->s.size += bp->s.size;
    1437:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    143a:	a3 04 1d 00 00       	mov    %eax,0x1d04
    p->s.size += bp->s.size;
    143f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1442:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1445:	89 08                	mov    %ecx,(%eax)
}
    1447:	5b                   	pop    %ebx
    1448:	5e                   	pop    %esi
    1449:	5f                   	pop    %edi
    144a:	5d                   	pop    %ebp
    144b:	c3                   	ret
    144c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001450 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	57                   	push   %edi
    1454:	56                   	push   %esi
    1455:	53                   	push   %ebx
    1456:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1459:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    145c:	8b 15 04 1d 00 00    	mov    0x1d04,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1462:	8d 78 07             	lea    0x7(%eax),%edi
    1465:	c1 ef 03             	shr    $0x3,%edi
    1468:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    146b:	85 d2                	test   %edx,%edx
    146d:	0f 84 8d 00 00 00    	je     1500 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1473:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1475:	8b 48 04             	mov    0x4(%eax),%ecx
    1478:	39 f9                	cmp    %edi,%ecx
    147a:	73 64                	jae    14e0 <malloc+0x90>
  if(nu < 4096)
    147c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1481:	39 df                	cmp    %ebx,%edi
    1483:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    1486:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    148d:	eb 0a                	jmp    1499 <malloc+0x49>
    148f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1490:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1492:	8b 48 04             	mov    0x4(%eax),%ecx
    1495:	39 f9                	cmp    %edi,%ecx
    1497:	73 47                	jae    14e0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1499:	89 c2                	mov    %eax,%edx
    149b:	3b 05 04 1d 00 00    	cmp    0x1d04,%eax
    14a1:	75 ed                	jne    1490 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    14a3:	83 ec 0c             	sub    $0xc,%esp
    14a6:	56                   	push   %esi
    14a7:	e8 7e fc ff ff       	call   112a <sbrk>
  if(p == (char*)-1)
    14ac:	83 c4 10             	add    $0x10,%esp
    14af:	83 f8 ff             	cmp    $0xffffffff,%eax
    14b2:	74 1c                	je     14d0 <malloc+0x80>
  hp->s.size = nu;
    14b4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    14b7:	83 ec 0c             	sub    $0xc,%esp
    14ba:	83 c0 08             	add    $0x8,%eax
    14bd:	50                   	push   %eax
    14be:	e8 fd fe ff ff       	call   13c0 <free>
  return freep;
    14c3:	8b 15 04 1d 00 00    	mov    0x1d04,%edx
      if((p = morecore(nunits)) == 0)
    14c9:	83 c4 10             	add    $0x10,%esp
    14cc:	85 d2                	test   %edx,%edx
    14ce:	75 c0                	jne    1490 <malloc+0x40>
        return 0;
  }
}
    14d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    14d3:	31 c0                	xor    %eax,%eax
}
    14d5:	5b                   	pop    %ebx
    14d6:	5e                   	pop    %esi
    14d7:	5f                   	pop    %edi
    14d8:	5d                   	pop    %ebp
    14d9:	c3                   	ret
    14da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    14e0:	39 cf                	cmp    %ecx,%edi
    14e2:	74 4c                	je     1530 <malloc+0xe0>
        p->s.size -= nunits;
    14e4:	29 f9                	sub    %edi,%ecx
    14e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    14e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    14ec:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    14ef:	89 15 04 1d 00 00    	mov    %edx,0x1d04
}
    14f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    14f8:	83 c0 08             	add    $0x8,%eax
}
    14fb:	5b                   	pop    %ebx
    14fc:	5e                   	pop    %esi
    14fd:	5f                   	pop    %edi
    14fe:	5d                   	pop    %ebp
    14ff:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    1500:	c7 05 04 1d 00 00 08 	movl   $0x1d08,0x1d04
    1507:	1d 00 00 
    base.s.size = 0;
    150a:	b8 08 1d 00 00       	mov    $0x1d08,%eax
    base.s.ptr = freep = prevp = &base;
    150f:	c7 05 08 1d 00 00 08 	movl   $0x1d08,0x1d08
    1516:	1d 00 00 
    base.s.size = 0;
    1519:	c7 05 0c 1d 00 00 00 	movl   $0x0,0x1d0c
    1520:	00 00 00 
    if(p->s.size >= nunits){
    1523:	e9 54 ff ff ff       	jmp    147c <malloc+0x2c>
    1528:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    152f:	00 
        prevp->s.ptr = p->s.ptr;
    1530:	8b 08                	mov    (%eax),%ecx
    1532:	89 0a                	mov    %ecx,(%edx)
    1534:	eb b9                	jmp    14ef <malloc+0x9f>
