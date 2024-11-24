
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 36 5a 00 00       	push   $0x5a36
      16:	6a 01                	push   $0x1
      18:	e8 23 47 00 00       	call   4740 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	59                   	pop    %ecx
      1e:	58                   	pop    %eax
      1f:	6a 00                	push   $0x0
      21:	68 4a 5a 00 00       	push   $0x5a4a
      26:	e8 c7 45 00 00       	call   45f2 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 1b                	js     4d <main+0x4d>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	50                   	push   %eax
      33:	50                   	push   %eax
      34:	68 bc 61 00 00       	push   $0x61bc
      39:	6a 01                	push   $0x1
      3b:	e8 00 47 00 00       	call   4740 <printf>
    exit(0);
      40:	31 d2                	xor    %edx,%edx
      42:	89 14 24             	mov    %edx,(%esp)
      45:	e8 68 45 00 00       	call   45b2 <exit>
      4a:	83 c4 10             	add    $0x10,%esp
  }
  close(open("usertests.ran", O_CREATE));
      4d:	83 ec 08             	sub    $0x8,%esp
      50:	68 00 02 00 00       	push   $0x200
      55:	68 4a 5a 00 00       	push   $0x5a4a
      5a:	e8 93 45 00 00       	call   45f2 <open>
      5f:	89 04 24             	mov    %eax,(%esp)
      62:	e8 73 45 00 00       	call   45da <close>

  argptest();
      67:	e8 54 42 00 00       	call   42c0 <argptest>
  createdelete();
      6c:	e8 0f 15 00 00       	call   1580 <createdelete>
  linkunlink();
      71:	e8 ba 1f 00 00       	call   2030 <linkunlink>
  concreate();
      76:	e8 f5 1b 00 00       	call   1c70 <concreate>
  fourfiles();
      7b:	e8 a0 12 00 00       	call   1320 <fourfiles>
  sharedfd();
      80:	e8 bb 10 00 00       	call   1140 <sharedfd>

  bigargtest();
      85:	e8 76 3e 00 00       	call   3f00 <bigargtest>
  bigwrite();
      8a:	e8 e1 2b 00 00       	call   2c70 <bigwrite>
  bigargtest();
      8f:	e8 6c 3e 00 00       	call   3f00 <bigargtest>
  bsstest();
      94:	e8 e7 3d 00 00       	call   3e80 <bsstest>
  sbrktest();
      99:	e8 f2 37 00 00       	call   3890 <sbrktest>
  validatetest();
      9e:	e8 0d 3d 00 00       	call   3db0 <validatetest>

  opentest();
      a3:	e8 68 04 00 00       	call   510 <opentest>
  writetest();
      a8:	e8 23 05 00 00       	call   5d0 <writetest>
  writetest1();
      ad:	e8 4e 07 00 00       	call   800 <writetest1>
  createtest();
      b2:	e8 69 09 00 00       	call   a20 <createtest>

  openiputtest();
      b7:	e8 f4 02 00 00       	call   3b0 <openiputtest>
  exitiputtest();
      bc:	e8 9f 01 00 00       	call   260 <exitiputtest>
  iputtest();
      c1:	e8 6a 00 00 00       	call   130 <iputtest>

  mem();
      c6:	e8 85 0f 00 00       	call   1050 <mem>
  pipe1();
      cb:	e8 90 0b 00 00       	call   c60 <pipe1>
  preempt();
      d0:	e8 7b 0d 00 00       	call   e50 <preempt>
  exitwait();
      d5:	e8 d6 0e 00 00       	call   fb0 <exitwait>

  rmdot();
      da:	e8 91 30 00 00       	call   3170 <rmdot>
  fourteen();
      df:	e8 cc 2e 00 00       	call   2fb0 <fourteen>
  bigfile();
      e4:	e8 97 2c 00 00       	call   2d80 <bigfile>
  subdir();
      e9:	e8 f2 21 00 00       	call   22e0 <subdir>
  linktest();
      ee:	e8 ed 18 00 00       	call   19e0 <linktest>
  unlinkread();
      f3:	e8 f8 16 00 00       	call   17f0 <unlinkread>
  dirfile();
      f8:	e8 93 32 00 00       	call   3390 <dirfile>
  iref();
      fd:	e8 3e 35 00 00       	call   3640 <iref>
  forktest();
     102:	e8 79 36 00 00       	call   3780 <forktest>
  bigdir(); // slow
     107:	e8 54 20 00 00       	call   2160 <bigdir>

  uio();
     10c:	e8 1f 41 00 00       	call   4230 <uio>

  exectest();
     111:	e8 ea 0a 00 00       	call   c00 <exectest>

  exit(0);
     116:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     11d:	e8 90 44 00 00       	call   45b2 <exit>
}
     122:	8b 4d fc             	mov    -0x4(%ebp),%ecx
     125:	31 c0                	xor    %eax,%eax
     127:	c9                   	leave
     128:	8d 61 fc             	lea    -0x4(%ecx),%esp
     12b:	c3                   	ret
     12c:	66 90                	xchg   %ax,%ax
     12e:	66 90                	xchg   %ax,%ax

00000130 <iputtest>:
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     136:	68 dc 4a 00 00       	push   $0x4adc
     13b:	ff 35 8c 6b 00 00    	push   0x6b8c
     141:	e8 fa 45 00 00       	call   4740 <printf>
  if(mkdir("iputdir") < 0){
     146:	c7 04 24 6f 4a 00 00 	movl   $0x4a6f,(%esp)
     14d:	e8 c8 44 00 00       	call   461a <mkdir>
     152:	83 c4 10             	add    $0x10,%esp
     155:	85 c0                	test   %eax,%eax
     157:	78 5f                	js     1b8 <iputtest+0x88>
  if(chdir("iputdir") < 0){
     159:	83 ec 0c             	sub    $0xc,%esp
     15c:	68 6f 4a 00 00       	push   $0x4a6f
     161:	e8 bc 44 00 00       	call   4622 <chdir>
     166:	83 c4 10             	add    $0x10,%esp
     169:	85 c0                	test   %eax,%eax
     16b:	0f 88 bf 00 00 00    	js     230 <iputtest+0x100>
  if(unlink("../iputdir") < 0){
     171:	83 ec 0c             	sub    $0xc,%esp
     174:	68 6c 4a 00 00       	push   $0x4a6c
     179:	e8 84 44 00 00       	call   4602 <unlink>
     17e:	83 c4 10             	add    $0x10,%esp
     181:	85 c0                	test   %eax,%eax
     183:	0f 88 7f 00 00 00    	js     208 <iputtest+0xd8>
  if(chdir("/") < 0){
     189:	83 ec 0c             	sub    $0xc,%esp
     18c:	68 91 4a 00 00       	push   $0x4a91
     191:	e8 8c 44 00 00       	call   4622 <chdir>
     196:	83 c4 10             	add    $0x10,%esp
     199:	85 c0                	test   %eax,%eax
     19b:	78 43                	js     1e0 <iputtest+0xb0>
  printf(stdout, "iput test ok\n");
     19d:	83 ec 08             	sub    $0x8,%esp
     1a0:	68 14 4b 00 00       	push   $0x4b14
     1a5:	ff 35 8c 6b 00 00    	push   0x6b8c
     1ab:	e8 90 45 00 00       	call   4740 <printf>
}
     1b0:	83 c4 10             	add    $0x10,%esp
     1b3:	c9                   	leave
     1b4:	c3                   	ret
     1b5:	8d 76 00             	lea    0x0(%esi),%esi
    printf(stdout, "mkdir failed\n");
     1b8:	83 ec 08             	sub    $0x8,%esp
     1bb:	68 48 4a 00 00       	push   $0x4a48
     1c0:	ff 35 8c 6b 00 00    	push   0x6b8c
     1c6:	e8 75 45 00 00       	call   4740 <printf>
    exit(0);
     1cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1d2:	e8 db 43 00 00       	call   45b2 <exit>
     1d7:	83 c4 10             	add    $0x10,%esp
     1da:	e9 7a ff ff ff       	jmp    159 <iputtest+0x29>
     1df:	90                   	nop
    printf(stdout, "chdir / failed\n");
     1e0:	83 ec 08             	sub    $0x8,%esp
     1e3:	68 93 4a 00 00       	push   $0x4a93
     1e8:	ff 35 8c 6b 00 00    	push   0x6b8c
     1ee:	e8 4d 45 00 00       	call   4740 <printf>
    exit(0);
     1f3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1fa:	e8 b3 43 00 00       	call   45b2 <exit>
     1ff:	83 c4 10             	add    $0x10,%esp
     202:	eb 99                	jmp    19d <iputtest+0x6d>
     204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(stdout, "unlink ../iputdir failed\n");
     208:	83 ec 08             	sub    $0x8,%esp
     20b:	68 77 4a 00 00       	push   $0x4a77
     210:	ff 35 8c 6b 00 00    	push   0x6b8c
     216:	e8 25 45 00 00       	call   4740 <printf>
    exit(0);
     21b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     222:	e8 8b 43 00 00       	call   45b2 <exit>
     227:	83 c4 10             	add    $0x10,%esp
     22a:	e9 5a ff ff ff       	jmp    189 <iputtest+0x59>
     22f:	90                   	nop
    printf(stdout, "chdir iputdir failed\n");
     230:	83 ec 08             	sub    $0x8,%esp
     233:	68 56 4a 00 00       	push   $0x4a56
     238:	ff 35 8c 6b 00 00    	push   0x6b8c
     23e:	e8 fd 44 00 00       	call   4740 <printf>
    exit(0);
     243:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     24a:	e8 63 43 00 00       	call   45b2 <exit>
     24f:	83 c4 10             	add    $0x10,%esp
     252:	e9 1a ff ff ff       	jmp    171 <iputtest+0x41>
     257:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     25e:	00 
     25f:	90                   	nop

00000260 <exitiputtest>:
{
     260:	55                   	push   %ebp
     261:	89 e5                	mov    %esp,%ebp
     263:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exitiput test\n");
     266:	68 a3 4a 00 00       	push   $0x4aa3
     26b:	ff 35 8c 6b 00 00    	push   0x6b8c
     271:	e8 ca 44 00 00       	call   4740 <printf>
  pid = fork();
     276:	e8 2f 43 00 00       	call   45aa <fork>
  if(pid < 0){
     27b:	83 c4 10             	add    $0x10,%esp
     27e:	85 c0                	test   %eax,%eax
     280:	78 7e                	js     300 <exitiputtest+0xa0>
  if(pid == 0){
     282:	75 55                	jne    2d9 <exitiputtest+0x79>
    if(mkdir("iputdir") < 0){
     284:	83 ec 0c             	sub    $0xc,%esp
     287:	68 6f 4a 00 00       	push   $0x4a6f
     28c:	e8 89 43 00 00       	call   461a <mkdir>
     291:	83 c4 10             	add    $0x10,%esp
     294:	85 c0                	test   %eax,%eax
     296:	0f 88 8c 00 00 00    	js     328 <exitiputtest+0xc8>
    if(chdir("iputdir") < 0){
     29c:	83 ec 0c             	sub    $0xc,%esp
     29f:	68 6f 4a 00 00       	push   $0x4a6f
     2a4:	e8 79 43 00 00       	call   4622 <chdir>
     2a9:	83 c4 10             	add    $0x10,%esp
     2ac:	85 c0                	test   %eax,%eax
     2ae:	0f 88 cc 00 00 00    	js     380 <exitiputtest+0x120>
    if(unlink("../iputdir") < 0){
     2b4:	83 ec 0c             	sub    $0xc,%esp
     2b7:	68 6c 4a 00 00       	push   $0x4a6c
     2bc:	e8 41 43 00 00       	call   4602 <unlink>
     2c1:	83 c4 10             	add    $0x10,%esp
     2c4:	85 c0                	test   %eax,%eax
     2c6:	0f 88 84 00 00 00    	js     350 <exitiputtest+0xf0>
    exit(0);
     2cc:	83 ec 0c             	sub    $0xc,%esp
     2cf:	6a 00                	push   $0x0
     2d1:	e8 dc 42 00 00       	call   45b2 <exit>
     2d6:	83 c4 10             	add    $0x10,%esp
  wait();
     2d9:	e8 dc 42 00 00       	call   45ba <wait>
  printf(stdout, "exitiput test ok\n");
     2de:	83 ec 08             	sub    $0x8,%esp
     2e1:	68 c6 4a 00 00       	push   $0x4ac6
     2e6:	ff 35 8c 6b 00 00    	push   0x6b8c
     2ec:	e8 4f 44 00 00       	call   4740 <printf>
}
     2f1:	83 c4 10             	add    $0x10,%esp
     2f4:	c9                   	leave
     2f5:	c3                   	ret
     2f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     2fd:	00 
     2fe:	66 90                	xchg   %ax,%ax
    printf(stdout, "fork failed\n");
     300:	83 ec 08             	sub    $0x8,%esp
     303:	68 89 59 00 00       	push   $0x5989
     308:	ff 35 8c 6b 00 00    	push   0x6b8c
     30e:	e8 2d 44 00 00       	call   4740 <printf>
    exit(0);
     313:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     31a:	e8 93 42 00 00       	call   45b2 <exit>
     31f:	83 c4 10             	add    $0x10,%esp
     322:	eb b5                	jmp    2d9 <exitiputtest+0x79>
     324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(stdout, "mkdir failed\n");
     328:	83 ec 08             	sub    $0x8,%esp
     32b:	68 48 4a 00 00       	push   $0x4a48
     330:	ff 35 8c 6b 00 00    	push   0x6b8c
     336:	e8 05 44 00 00       	call   4740 <printf>
      exit(0);
     33b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     342:	e8 6b 42 00 00       	call   45b2 <exit>
     347:	83 c4 10             	add    $0x10,%esp
     34a:	e9 4d ff ff ff       	jmp    29c <exitiputtest+0x3c>
     34f:	90                   	nop
      printf(stdout, "unlink ../iputdir failed\n");
     350:	83 ec 08             	sub    $0x8,%esp
     353:	68 77 4a 00 00       	push   $0x4a77
     358:	ff 35 8c 6b 00 00    	push   0x6b8c
     35e:	e8 dd 43 00 00       	call   4740 <printf>
      exit(0);
     363:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     36a:	e8 43 42 00 00       	call   45b2 <exit>
     36f:	83 c4 10             	add    $0x10,%esp
     372:	e9 55 ff ff ff       	jmp    2cc <exitiputtest+0x6c>
     377:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     37e:	00 
     37f:	90                   	nop
      printf(stdout, "child chdir failed\n");
     380:	83 ec 08             	sub    $0x8,%esp
     383:	68 b2 4a 00 00       	push   $0x4ab2
     388:	ff 35 8c 6b 00 00    	push   0x6b8c
     38e:	e8 ad 43 00 00       	call   4740 <printf>
      exit(0);
     393:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     39a:	e8 13 42 00 00       	call   45b2 <exit>
     39f:	83 c4 10             	add    $0x10,%esp
     3a2:	e9 0d ff ff ff       	jmp    2b4 <exitiputtest+0x54>
     3a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     3ae:	00 
     3af:	90                   	nop

000003b0 <openiputtest>:
{
     3b0:	55                   	push   %ebp
     3b1:	89 e5                	mov    %esp,%ebp
     3b3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "openiput test\n");
     3b6:	68 d8 4a 00 00       	push   $0x4ad8
     3bb:	ff 35 8c 6b 00 00    	push   0x6b8c
     3c1:	e8 7a 43 00 00       	call   4740 <printf>
  if(mkdir("oidir") < 0){
     3c6:	c7 04 24 e7 4a 00 00 	movl   $0x4ae7,(%esp)
     3cd:	e8 48 42 00 00       	call   461a <mkdir>
     3d2:	83 c4 10             	add    $0x10,%esp
     3d5:	85 c0                	test   %eax,%eax
     3d7:	0f 88 c3 00 00 00    	js     4a0 <openiputtest+0xf0>
  pid = fork();
     3dd:	e8 c8 41 00 00       	call   45aa <fork>
  if(pid < 0){
     3e2:	85 c0                	test   %eax,%eax
     3e4:	0f 88 8e 00 00 00    	js     478 <openiputtest+0xc8>
  if(pid == 0){
     3ea:	75 27                	jne    413 <openiputtest+0x63>
    int fd = open("oidir", O_RDWR);
     3ec:	83 ec 08             	sub    $0x8,%esp
     3ef:	6a 02                	push   $0x2
     3f1:	68 e7 4a 00 00       	push   $0x4ae7
     3f6:	e8 f7 41 00 00       	call   45f2 <open>
    if(fd >= 0){
     3fb:	83 c4 10             	add    $0x10,%esp
     3fe:	85 c0                	test   %eax,%eax
     400:	0f 89 ca 00 00 00    	jns    4d0 <openiputtest+0x120>
    exit(0);
     406:	83 ec 0c             	sub    $0xc,%esp
     409:	6a 00                	push   $0x0
     40b:	e8 a2 41 00 00       	call   45b2 <exit>
     410:	83 c4 10             	add    $0x10,%esp
  sleep(1);
     413:	83 ec 0c             	sub    $0xc,%esp
     416:	6a 01                	push   $0x1
     418:	e8 25 42 00 00       	call   4642 <sleep>
  if(unlink("oidir") != 0){
     41d:	c7 04 24 e7 4a 00 00 	movl   $0x4ae7,(%esp)
     424:	e8 d9 41 00 00       	call   4602 <unlink>
     429:	83 c4 10             	add    $0x10,%esp
     42c:	85 c0                	test   %eax,%eax
     42e:	75 20                	jne    450 <openiputtest+0xa0>
  wait();
     430:	e8 85 41 00 00       	call   45ba <wait>
  printf(stdout, "openiput test ok\n");
     435:	83 ec 08             	sub    $0x8,%esp
     438:	68 10 4b 00 00       	push   $0x4b10
     43d:	ff 35 8c 6b 00 00    	push   0x6b8c
     443:	e8 f8 42 00 00       	call   4740 <printf>
}
     448:	83 c4 10             	add    $0x10,%esp
     44b:	c9                   	leave
     44c:	c3                   	ret
     44d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(stdout, "unlink failed\n");
     450:	83 ec 08             	sub    $0x8,%esp
     453:	68 01 4b 00 00       	push   $0x4b01
     458:	ff 35 8c 6b 00 00    	push   0x6b8c
     45e:	e8 dd 42 00 00       	call   4740 <printf>
    exit(0);
     463:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     46a:	e8 43 41 00 00       	call   45b2 <exit>
     46f:	83 c4 10             	add    $0x10,%esp
     472:	eb bc                	jmp    430 <openiputtest+0x80>
     474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(stdout, "fork failed\n");
     478:	83 ec 08             	sub    $0x8,%esp
     47b:	68 89 59 00 00       	push   $0x5989
     480:	ff 35 8c 6b 00 00    	push   0x6b8c
     486:	e8 b5 42 00 00       	call   4740 <printf>
    exit(0);
     48b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     492:	e8 1b 41 00 00       	call   45b2 <exit>
     497:	83 c4 10             	add    $0x10,%esp
     49a:	e9 74 ff ff ff       	jmp    413 <openiputtest+0x63>
     49f:	90                   	nop
    printf(stdout, "mkdir oidir failed\n");
     4a0:	83 ec 08             	sub    $0x8,%esp
     4a3:	68 ed 4a 00 00       	push   $0x4aed
     4a8:	ff 35 8c 6b 00 00    	push   0x6b8c
     4ae:	e8 8d 42 00 00       	call   4740 <printf>
    exit(0);
     4b3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     4ba:	e8 f3 40 00 00       	call   45b2 <exit>
     4bf:	83 c4 10             	add    $0x10,%esp
     4c2:	e9 16 ff ff ff       	jmp    3dd <openiputtest+0x2d>
     4c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     4ce:	00 
     4cf:	90                   	nop
      printf(stdout, "open directory for write succeeded\n");
     4d0:	83 ec 08             	sub    $0x8,%esp
     4d3:	68 70 5a 00 00       	push   $0x5a70
     4d8:	ff 35 8c 6b 00 00    	push   0x6b8c
     4de:	e8 5d 42 00 00       	call   4740 <printf>
      exit(0);
     4e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     4ea:	e8 c3 40 00 00       	call   45b2 <exit>
     4ef:	83 c4 10             	add    $0x10,%esp
    exit(0);
     4f2:	83 ec 0c             	sub    $0xc,%esp
     4f5:	6a 00                	push   $0x0
     4f7:	e8 b6 40 00 00       	call   45b2 <exit>
     4fc:	83 c4 10             	add    $0x10,%esp
     4ff:	e9 0f ff ff ff       	jmp    413 <openiputtest+0x63>
     504:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     50b:	00 
     50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000510 <opentest>:
{
     510:	55                   	push   %ebp
     511:	89 e5                	mov    %esp,%ebp
     513:	53                   	push   %ebx
     514:	83 ec 0c             	sub    $0xc,%esp
  printf(stdout, "open test\n");
     517:	68 22 4b 00 00       	push   $0x4b22
     51c:	ff 35 8c 6b 00 00    	push   0x6b8c
     522:	e8 19 42 00 00       	call   4740 <printf>
  fd = open("echo", 0);
     527:	59                   	pop    %ecx
     528:	5b                   	pop    %ebx
     529:	6a 00                	push   $0x0
     52b:	68 2d 4b 00 00       	push   $0x4b2d
     530:	e8 bd 40 00 00       	call   45f2 <open>
  if(fd < 0){
     535:	83 c4 10             	add    $0x10,%esp
  fd = open("echo", 0);
     538:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
     53a:	85 c0                	test   %eax,%eax
     53c:	78 62                	js     5a0 <opentest+0x90>
  close(fd);
     53e:	83 ec 0c             	sub    $0xc,%esp
     541:	53                   	push   %ebx
     542:	e8 93 40 00 00       	call   45da <close>
  fd = open("doesnotexist", 0);
     547:	58                   	pop    %eax
     548:	5a                   	pop    %edx
     549:	6a 00                	push   $0x0
     54b:	68 45 4b 00 00       	push   $0x4b45
     550:	e8 9d 40 00 00       	call   45f2 <open>
  if(fd >= 0){
     555:	83 c4 10             	add    $0x10,%esp
     558:	85 c0                	test   %eax,%eax
     55a:	78 22                	js     57e <opentest+0x6e>
    printf(stdout, "open doesnotexist succeeded!\n");
     55c:	83 ec 08             	sub    $0x8,%esp
     55f:	68 52 4b 00 00       	push   $0x4b52
     564:	ff 35 8c 6b 00 00    	push   0x6b8c
     56a:	e8 d1 41 00 00       	call   4740 <printf>
    exit(0);
     56f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     576:	e8 37 40 00 00       	call   45b2 <exit>
     57b:	83 c4 10             	add    $0x10,%esp
  printf(stdout, "open test ok\n");
     57e:	83 ec 08             	sub    $0x8,%esp
     581:	68 70 4b 00 00       	push   $0x4b70
     586:	ff 35 8c 6b 00 00    	push   0x6b8c
     58c:	e8 af 41 00 00       	call   4740 <printf>
}
     591:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     594:	83 c4 10             	add    $0x10,%esp
     597:	c9                   	leave
     598:	c3                   	ret
     599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(stdout, "open echo failed!\n");
     5a0:	83 ec 08             	sub    $0x8,%esp
     5a3:	68 32 4b 00 00       	push   $0x4b32
     5a8:	ff 35 8c 6b 00 00    	push   0x6b8c
     5ae:	e8 8d 41 00 00       	call   4740 <printf>
    exit(0);
     5b3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     5ba:	e8 f3 3f 00 00       	call   45b2 <exit>
     5bf:	83 c4 10             	add    $0x10,%esp
     5c2:	e9 77 ff ff ff       	jmp    53e <opentest+0x2e>
     5c7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     5ce:	00 
     5cf:	90                   	nop

000005d0 <writetest>:
{
     5d0:	55                   	push   %ebp
     5d1:	89 e5                	mov    %esp,%ebp
     5d3:	56                   	push   %esi
     5d4:	53                   	push   %ebx
  printf(stdout, "small file test\n");
     5d5:	83 ec 08             	sub    $0x8,%esp
     5d8:	68 7e 4b 00 00       	push   $0x4b7e
     5dd:	ff 35 8c 6b 00 00    	push   0x6b8c
     5e3:	e8 58 41 00 00       	call   4740 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     5e8:	59                   	pop    %ecx
     5e9:	5b                   	pop    %ebx
     5ea:	68 02 02 00 00       	push   $0x202
     5ef:	68 8f 4b 00 00       	push   $0x4b8f
     5f4:	e8 f9 3f 00 00       	call   45f2 <open>
  if(fd >= 0){
     5f9:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_CREATE|O_RDWR);
     5fc:	89 c6                	mov    %eax,%esi
  if(fd >= 0){
     5fe:	85 c0                	test   %eax,%eax
     600:	0f 88 64 01 00 00    	js     76a <writetest+0x19a>
    printf(stdout, "creat small succeeded; ok\n");
     606:	83 ec 08             	sub    $0x8,%esp
     609:	68 95 4b 00 00       	push   $0x4b95
     60e:	ff 35 8c 6b 00 00    	push   0x6b8c
     614:	e8 27 41 00 00       	call   4740 <printf>
     619:	83 c4 10             	add    $0x10,%esp
{
     61c:	31 db                	xor    %ebx,%ebx
     61e:	66 90                	xchg   %ax,%ax
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     620:	83 ec 04             	sub    $0x4,%esp
     623:	6a 0a                	push   $0xa
     625:	68 cc 4b 00 00       	push   $0x4bcc
     62a:	56                   	push   %esi
     62b:	e8 a2 3f 00 00       	call   45d2 <write>
     630:	83 c4 10             	add    $0x10,%esp
     633:	83 f8 0a             	cmp    $0xa,%eax
     636:	74 23                	je     65b <writetest+0x8b>
      printf(stdout, "error: write aa %d new file failed\n", i);
     638:	83 ec 04             	sub    $0x4,%esp
     63b:	53                   	push   %ebx
     63c:	68 94 5a 00 00       	push   $0x5a94
     641:	ff 35 8c 6b 00 00    	push   0x6b8c
     647:	e8 f4 40 00 00       	call   4740 <printf>
      exit(0);
     64c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     653:	e8 5a 3f 00 00       	call   45b2 <exit>
     658:	83 c4 10             	add    $0x10,%esp
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     65b:	83 ec 04             	sub    $0x4,%esp
     65e:	6a 0a                	push   $0xa
     660:	68 d7 4b 00 00       	push   $0x4bd7
     665:	56                   	push   %esi
     666:	e8 67 3f 00 00       	call   45d2 <write>
     66b:	83 c4 10             	add    $0x10,%esp
     66e:	83 f8 0a             	cmp    $0xa,%eax
     671:	74 23                	je     696 <writetest+0xc6>
      printf(stdout, "error: write bb %d new file failed\n", i);
     673:	83 ec 04             	sub    $0x4,%esp
     676:	53                   	push   %ebx
     677:	68 b8 5a 00 00       	push   $0x5ab8
     67c:	ff 35 8c 6b 00 00    	push   0x6b8c
     682:	e8 b9 40 00 00       	call   4740 <printf>
      exit(0);
     687:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     68e:	e8 1f 3f 00 00       	call   45b2 <exit>
     693:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
     696:	83 c3 01             	add    $0x1,%ebx
     699:	83 fb 64             	cmp    $0x64,%ebx
     69c:	75 82                	jne    620 <writetest+0x50>
  printf(stdout, "writes ok\n");
     69e:	83 ec 08             	sub    $0x8,%esp
     6a1:	68 e2 4b 00 00       	push   $0x4be2
     6a6:	ff 35 8c 6b 00 00    	push   0x6b8c
     6ac:	e8 8f 40 00 00       	call   4740 <printf>
  close(fd);
     6b1:	89 34 24             	mov    %esi,(%esp)
     6b4:	e8 21 3f 00 00       	call   45da <close>
  fd = open("small", O_RDONLY);
     6b9:	58                   	pop    %eax
     6ba:	5a                   	pop    %edx
     6bb:	6a 00                	push   $0x0
     6bd:	68 8f 4b 00 00       	push   $0x4b8f
     6c2:	e8 2b 3f 00 00       	call   45f2 <open>
  if(fd >= 0){
     6c7:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_RDONLY);
     6ca:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     6cc:	85 c0                	test   %eax,%eax
     6ce:	0f 88 bd 00 00 00    	js     791 <writetest+0x1c1>
    printf(stdout, "open small succeeded ok\n");
     6d4:	83 ec 08             	sub    $0x8,%esp
     6d7:	68 ed 4b 00 00       	push   $0x4bed
     6dc:	ff 35 8c 6b 00 00    	push   0x6b8c
     6e2:	e8 59 40 00 00       	call   4740 <printf>
     6e7:	83 c4 10             	add    $0x10,%esp
  i = read(fd, buf, 2000);
     6ea:	83 ec 04             	sub    $0x4,%esp
     6ed:	68 d0 07 00 00       	push   $0x7d0
     6f2:	68 e0 92 00 00       	push   $0x92e0
     6f7:	53                   	push   %ebx
     6f8:	e8 cd 3e 00 00       	call   45ca <read>
  if(i == 2000){
     6fd:	83 c4 10             	add    $0x10,%esp
     700:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     705:	0f 84 ad 00 00 00    	je     7b8 <writetest+0x1e8>
    printf(stdout, "read failed\n");
     70b:	83 ec 08             	sub    $0x8,%esp
     70e:	68 4d 4f 00 00       	push   $0x4f4d
     713:	ff 35 8c 6b 00 00    	push   0x6b8c
     719:	e8 22 40 00 00       	call   4740 <printf>
    exit(0);
     71e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     725:	e8 88 3e 00 00       	call   45b2 <exit>
     72a:	83 c4 10             	add    $0x10,%esp
  close(fd);
     72d:	83 ec 0c             	sub    $0xc,%esp
     730:	53                   	push   %ebx
     731:	e8 a4 3e 00 00       	call   45da <close>
  if(unlink("small") < 0){
     736:	c7 04 24 8f 4b 00 00 	movl   $0x4b8f,(%esp)
     73d:	e8 c0 3e 00 00       	call   4602 <unlink>
     742:	83 c4 10             	add    $0x10,%esp
     745:	85 c0                	test   %eax,%eax
     747:	0f 88 86 00 00 00    	js     7d3 <writetest+0x203>
  printf(stdout, "small file test ok\n");
     74d:	83 ec 08             	sub    $0x8,%esp
     750:	68 49 4c 00 00       	push   $0x4c49
     755:	ff 35 8c 6b 00 00    	push   0x6b8c
     75b:	e8 e0 3f 00 00       	call   4740 <printf>
}
     760:	83 c4 10             	add    $0x10,%esp
     763:	8d 65 f8             	lea    -0x8(%ebp),%esp
     766:	5b                   	pop    %ebx
     767:	5e                   	pop    %esi
     768:	5d                   	pop    %ebp
     769:	c3                   	ret
    printf(stdout, "error: creat small failed!\n");
     76a:	83 ec 08             	sub    $0x8,%esp
     76d:	68 b0 4b 00 00       	push   $0x4bb0
     772:	ff 35 8c 6b 00 00    	push   0x6b8c
     778:	e8 c3 3f 00 00       	call   4740 <printf>
    exit(0);
     77d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     784:	e8 29 3e 00 00       	call   45b2 <exit>
     789:	83 c4 10             	add    $0x10,%esp
     78c:	e9 8b fe ff ff       	jmp    61c <writetest+0x4c>
    printf(stdout, "error: open small failed!\n");
     791:	83 ec 08             	sub    $0x8,%esp
     794:	68 06 4c 00 00       	push   $0x4c06
     799:	ff 35 8c 6b 00 00    	push   0x6b8c
     79f:	e8 9c 3f 00 00       	call   4740 <printf>
    exit(0);
     7a4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     7ab:	e8 02 3e 00 00       	call   45b2 <exit>
     7b0:	83 c4 10             	add    $0x10,%esp
     7b3:	e9 32 ff ff ff       	jmp    6ea <writetest+0x11a>
    printf(stdout, "read succeeded ok\n");
     7b8:	83 ec 08             	sub    $0x8,%esp
     7bb:	68 21 4c 00 00       	push   $0x4c21
     7c0:	ff 35 8c 6b 00 00    	push   0x6b8c
     7c6:	e8 75 3f 00 00       	call   4740 <printf>
     7cb:	83 c4 10             	add    $0x10,%esp
     7ce:	e9 5a ff ff ff       	jmp    72d <writetest+0x15d>
    printf(stdout, "unlink small failed\n");
     7d3:	83 ec 08             	sub    $0x8,%esp
     7d6:	68 34 4c 00 00       	push   $0x4c34
     7db:	ff 35 8c 6b 00 00    	push   0x6b8c
     7e1:	e8 5a 3f 00 00       	call   4740 <printf>
    exit(0);
     7e6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     7ed:	e8 c0 3d 00 00       	call   45b2 <exit>
     7f2:	83 c4 10             	add    $0x10,%esp
     7f5:	e9 53 ff ff ff       	jmp    74d <writetest+0x17d>
     7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000800 <writetest1>:
{
     800:	55                   	push   %ebp
     801:	89 e5                	mov    %esp,%ebp
     803:	56                   	push   %esi
     804:	53                   	push   %ebx
  printf(stdout, "big files test\n");
     805:	83 ec 08             	sub    $0x8,%esp
     808:	68 5d 4c 00 00       	push   $0x4c5d
     80d:	ff 35 8c 6b 00 00    	push   0x6b8c
     813:	e8 28 3f 00 00       	call   4740 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     818:	59                   	pop    %ecx
     819:	5b                   	pop    %ebx
     81a:	68 02 02 00 00       	push   $0x202
     81f:	68 d7 4c 00 00       	push   $0x4cd7
     824:	e8 c9 3d 00 00       	call   45f2 <open>
  if(fd < 0){
     829:	83 c4 10             	add    $0x10,%esp
  fd = open("big", O_CREATE|O_RDWR);
     82c:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     82e:	85 c0                	test   %eax,%eax
     830:	0f 88 67 01 00 00    	js     99d <writetest1+0x19d>
{
     836:	31 db                	xor    %ebx,%ebx
     838:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     83f:	00 
    if(write(fd, buf, 512) != 512){
     840:	83 ec 04             	sub    $0x4,%esp
    ((int*)buf)[0] = i;
     843:	89 1d e0 92 00 00    	mov    %ebx,0x92e0
    if(write(fd, buf, 512) != 512){
     849:	68 00 02 00 00       	push   $0x200
     84e:	68 e0 92 00 00       	push   $0x92e0
     853:	56                   	push   %esi
     854:	e8 79 3d 00 00       	call   45d2 <write>
     859:	83 c4 10             	add    $0x10,%esp
     85c:	3d 00 02 00 00       	cmp    $0x200,%eax
     861:	74 23                	je     886 <writetest1+0x86>
      printf(stdout, "error: write big file failed\n", i);
     863:	83 ec 04             	sub    $0x4,%esp
     866:	53                   	push   %ebx
     867:	68 87 4c 00 00       	push   $0x4c87
     86c:	ff 35 8c 6b 00 00    	push   0x6b8c
     872:	e8 c9 3e 00 00       	call   4740 <printf>
      exit(0);
     877:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     87e:	e8 2f 3d 00 00       	call   45b2 <exit>
     883:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < MAXFILE; i++){
     886:	83 c3 01             	add    $0x1,%ebx
     889:	81 fb 48 02 00 00    	cmp    $0x248,%ebx
     88f:	75 af                	jne    840 <writetest1+0x40>
  close(fd);
     891:	83 ec 0c             	sub    $0xc,%esp
     894:	56                   	push   %esi
     895:	e8 40 3d 00 00       	call   45da <close>
  fd = open("big", O_RDONLY);
     89a:	58                   	pop    %eax
     89b:	5a                   	pop    %edx
     89c:	6a 00                	push   $0x0
     89e:	68 d7 4c 00 00       	push   $0x4cd7
     8a3:	e8 4a 3d 00 00       	call   45f2 <open>
  if(fd < 0){
     8a8:	83 c4 10             	add    $0x10,%esp
  fd = open("big", O_RDONLY);
     8ab:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     8ad:	85 c0                	test   %eax,%eax
     8af:	0f 88 c1 00 00 00    	js     976 <writetest1+0x176>
{
     8b5:	31 db                	xor    %ebx,%ebx
     8b7:	eb 5e                	jmp    917 <writetest1+0x117>
     8b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    } else if(i != 512){
     8c0:	3d 00 02 00 00       	cmp    $0x200,%eax
     8c5:	74 23                	je     8ea <writetest1+0xea>
      printf(stdout, "read failed %d\n", i);
     8c7:	83 ec 04             	sub    $0x4,%esp
     8ca:	50                   	push   %eax
     8cb:	68 db 4c 00 00       	push   $0x4cdb
     8d0:	ff 35 8c 6b 00 00    	push   0x6b8c
     8d6:	e8 65 3e 00 00       	call   4740 <printf>
      exit(0);
     8db:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     8e2:	e8 cb 3c 00 00       	call   45b2 <exit>
     8e7:	83 c4 10             	add    $0x10,%esp
    if(((int*)buf)[0] != n){
     8ea:	a1 e0 92 00 00       	mov    0x92e0,%eax
     8ef:	39 d8                	cmp    %ebx,%eax
     8f1:	74 21                	je     914 <writetest1+0x114>
      printf(stdout, "read content of block %d is %d\n",
     8f3:	50                   	push   %eax
     8f4:	53                   	push   %ebx
     8f5:	68 dc 5a 00 00       	push   $0x5adc
     8fa:	ff 35 8c 6b 00 00    	push   0x6b8c
     900:	e8 3b 3e 00 00       	call   4740 <printf>
      exit(0);
     905:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     90c:	e8 a1 3c 00 00       	call   45b2 <exit>
     911:	83 c4 10             	add    $0x10,%esp
    n++;
     914:	83 c3 01             	add    $0x1,%ebx
    i = read(fd, buf, 512);
     917:	83 ec 04             	sub    $0x4,%esp
     91a:	68 00 02 00 00       	push   $0x200
     91f:	68 e0 92 00 00       	push   $0x92e0
     924:	56                   	push   %esi
     925:	e8 a0 3c 00 00       	call   45ca <read>
    if(i == 0){
     92a:	83 c4 10             	add    $0x10,%esp
     92d:	85 c0                	test   %eax,%eax
     92f:	75 8f                	jne    8c0 <writetest1+0xc0>
      if(n == MAXFILE - 1){
     931:	81 fb 47 02 00 00    	cmp    $0x247,%ebx
     937:	0f 84 ae 00 00 00    	je     9eb <writetest1+0x1eb>
  close(fd);
     93d:	83 ec 0c             	sub    $0xc,%esp
     940:	56                   	push   %esi
     941:	e8 94 3c 00 00       	call   45da <close>
  if(unlink("big") < 0){
     946:	c7 04 24 d7 4c 00 00 	movl   $0x4cd7,(%esp)
     94d:	e8 b0 3c 00 00       	call   4602 <unlink>
     952:	83 c4 10             	add    $0x10,%esp
     955:	85 c0                	test   %eax,%eax
     957:	78 6b                	js     9c4 <writetest1+0x1c4>
  printf(stdout, "big files ok\n");
     959:	83 ec 08             	sub    $0x8,%esp
     95c:	68 fe 4c 00 00       	push   $0x4cfe
     961:	ff 35 8c 6b 00 00    	push   0x6b8c
     967:	e8 d4 3d 00 00       	call   4740 <printf>
}
     96c:	83 c4 10             	add    $0x10,%esp
     96f:	8d 65 f8             	lea    -0x8(%ebp),%esp
     972:	5b                   	pop    %ebx
     973:	5e                   	pop    %esi
     974:	5d                   	pop    %ebp
     975:	c3                   	ret
    printf(stdout, "error: open big failed!\n");
     976:	83 ec 08             	sub    $0x8,%esp
     979:	68 a5 4c 00 00       	push   $0x4ca5
     97e:	ff 35 8c 6b 00 00    	push   0x6b8c
     984:	e8 b7 3d 00 00       	call   4740 <printf>
    exit(0);
     989:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     990:	e8 1d 3c 00 00       	call   45b2 <exit>
     995:	83 c4 10             	add    $0x10,%esp
     998:	e9 18 ff ff ff       	jmp    8b5 <writetest1+0xb5>
    printf(stdout, "error: creat big failed!\n");
     99d:	83 ec 08             	sub    $0x8,%esp
     9a0:	68 6d 4c 00 00       	push   $0x4c6d
     9a5:	ff 35 8c 6b 00 00    	push   0x6b8c
     9ab:	e8 90 3d 00 00       	call   4740 <printf>
    exit(0);
     9b0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     9b7:	e8 f6 3b 00 00       	call   45b2 <exit>
     9bc:	83 c4 10             	add    $0x10,%esp
     9bf:	e9 72 fe ff ff       	jmp    836 <writetest1+0x36>
    printf(stdout, "unlink big failed\n");
     9c4:	83 ec 08             	sub    $0x8,%esp
     9c7:	68 eb 4c 00 00       	push   $0x4ceb
     9cc:	ff 35 8c 6b 00 00    	push   0x6b8c
     9d2:	e8 69 3d 00 00       	call   4740 <printf>
    exit(0);
     9d7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     9de:	e8 cf 3b 00 00       	call   45b2 <exit>
     9e3:	83 c4 10             	add    $0x10,%esp
     9e6:	e9 6e ff ff ff       	jmp    959 <writetest1+0x159>
        printf(stdout, "read only %d blocks from big", n);
     9eb:	83 ec 04             	sub    $0x4,%esp
     9ee:	68 47 02 00 00       	push   $0x247
     9f3:	68 be 4c 00 00       	push   $0x4cbe
     9f8:	ff 35 8c 6b 00 00    	push   0x6b8c
     9fe:	e8 3d 3d 00 00       	call   4740 <printf>
        exit(0);
     a03:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     a0a:	e8 a3 3b 00 00       	call   45b2 <exit>
     a0f:	83 c4 10             	add    $0x10,%esp
     a12:	e9 26 ff ff ff       	jmp    93d <writetest1+0x13d>
     a17:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     a1e:	00 
     a1f:	90                   	nop

00000a20 <createtest>:
{
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	53                   	push   %ebx
  name[2] = '\0';
     a24:	bb 30 00 00 00       	mov    $0x30,%ebx
{
     a29:	83 ec 0c             	sub    $0xc,%esp
  printf(stdout, "many creates, followed by unlink test\n");
     a2c:	68 fc 5a 00 00       	push   $0x5afc
     a31:	ff 35 8c 6b 00 00    	push   0x6b8c
     a37:	e8 04 3d 00 00       	call   4740 <printf>
  name[0] = 'a';
     a3c:	c6 05 d0 92 00 00 61 	movb   $0x61,0x92d0
  name[2] = '\0';
     a43:	83 c4 10             	add    $0x10,%esp
     a46:	c6 05 d2 92 00 00 00 	movb   $0x0,0x92d2
  for(i = 0; i < 52; i++){
     a4d:	8d 76 00             	lea    0x0(%esi),%esi
    fd = open(name, O_CREATE|O_RDWR);
     a50:	83 ec 08             	sub    $0x8,%esp
    name[1] = '0' + i;
     a53:	88 1d d1 92 00 00    	mov    %bl,0x92d1
  for(i = 0; i < 52; i++){
     a59:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     a5c:	68 02 02 00 00       	push   $0x202
     a61:	68 d0 92 00 00       	push   $0x92d0
     a66:	e8 87 3b 00 00       	call   45f2 <open>
    close(fd);
     a6b:	89 04 24             	mov    %eax,(%esp)
     a6e:	e8 67 3b 00 00       	call   45da <close>
  for(i = 0; i < 52; i++){
     a73:	83 c4 10             	add    $0x10,%esp
     a76:	80 fb 64             	cmp    $0x64,%bl
     a79:	75 d5                	jne    a50 <createtest+0x30>
  name[0] = 'a';
     a7b:	c6 05 d0 92 00 00 61 	movb   $0x61,0x92d0
  name[2] = '\0';
     a82:	bb 30 00 00 00       	mov    $0x30,%ebx
     a87:	c6 05 d2 92 00 00 00 	movb   $0x0,0x92d2
  for(i = 0; i < 52; i++){
     a8e:	66 90                	xchg   %ax,%ax
    unlink(name);
     a90:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + i;
     a93:	88 1d d1 92 00 00    	mov    %bl,0x92d1
  for(i = 0; i < 52; i++){
     a99:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     a9c:	68 d0 92 00 00       	push   $0x92d0
     aa1:	e8 5c 3b 00 00       	call   4602 <unlink>
  for(i = 0; i < 52; i++){
     aa6:	83 c4 10             	add    $0x10,%esp
     aa9:	80 fb 64             	cmp    $0x64,%bl
     aac:	75 e2                	jne    a90 <createtest+0x70>
  printf(stdout, "many creates, followed by unlink; ok\n");
     aae:	83 ec 08             	sub    $0x8,%esp
     ab1:	68 28 5b 00 00       	push   $0x5b28
     ab6:	ff 35 8c 6b 00 00    	push   0x6b8c
     abc:	e8 7f 3c 00 00       	call   4740 <printf>
}
     ac1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ac4:	83 c4 10             	add    $0x10,%esp
     ac7:	c9                   	leave
     ac8:	c3                   	ret
     ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ad0 <dirtest>:
{
     ad0:	55                   	push   %ebp
     ad1:	89 e5                	mov    %esp,%ebp
     ad3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     ad6:	68 0c 4d 00 00       	push   $0x4d0c
     adb:	ff 35 8c 6b 00 00    	push   0x6b8c
     ae1:	e8 5a 3c 00 00       	call   4740 <printf>
  if(mkdir("dir0") < 0){
     ae6:	c7 04 24 18 4d 00 00 	movl   $0x4d18,(%esp)
     aed:	e8 28 3b 00 00       	call   461a <mkdir>
     af2:	83 c4 10             	add    $0x10,%esp
     af5:	85 c0                	test   %eax,%eax
     af7:	78 5f                	js     b58 <dirtest+0x88>
  if(chdir("dir0") < 0){
     af9:	83 ec 0c             	sub    $0xc,%esp
     afc:	68 18 4d 00 00       	push   $0x4d18
     b01:	e8 1c 3b 00 00       	call   4622 <chdir>
     b06:	83 c4 10             	add    $0x10,%esp
     b09:	85 c0                	test   %eax,%eax
     b0b:	0f 88 bf 00 00 00    	js     bd0 <dirtest+0x100>
  if(chdir("..") < 0){
     b11:	83 ec 0c             	sub    $0xc,%esp
     b14:	68 bd 52 00 00       	push   $0x52bd
     b19:	e8 04 3b 00 00       	call   4622 <chdir>
     b1e:	83 c4 10             	add    $0x10,%esp
     b21:	85 c0                	test   %eax,%eax
     b23:	0f 88 7f 00 00 00    	js     ba8 <dirtest+0xd8>
  if(unlink("dir0") < 0){
     b29:	83 ec 0c             	sub    $0xc,%esp
     b2c:	68 18 4d 00 00       	push   $0x4d18
     b31:	e8 cc 3a 00 00       	call   4602 <unlink>
     b36:	83 c4 10             	add    $0x10,%esp
     b39:	85 c0                	test   %eax,%eax
     b3b:	78 43                	js     b80 <dirtest+0xb0>
  printf(stdout, "mkdir test ok\n");
     b3d:	83 ec 08             	sub    $0x8,%esp
     b40:	68 55 4d 00 00       	push   $0x4d55
     b45:	ff 35 8c 6b 00 00    	push   0x6b8c
     b4b:	e8 f0 3b 00 00       	call   4740 <printf>
}
     b50:	83 c4 10             	add    $0x10,%esp
     b53:	c9                   	leave
     b54:	c3                   	ret
     b55:	8d 76 00             	lea    0x0(%esi),%esi
    printf(stdout, "mkdir failed\n");
     b58:	83 ec 08             	sub    $0x8,%esp
     b5b:	68 48 4a 00 00       	push   $0x4a48
     b60:	ff 35 8c 6b 00 00    	push   0x6b8c
     b66:	e8 d5 3b 00 00       	call   4740 <printf>
    exit(0);
     b6b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b72:	e8 3b 3a 00 00       	call   45b2 <exit>
     b77:	83 c4 10             	add    $0x10,%esp
     b7a:	e9 7a ff ff ff       	jmp    af9 <dirtest+0x29>
     b7f:	90                   	nop
    printf(stdout, "unlink dir0 failed\n");
     b80:	83 ec 08             	sub    $0x8,%esp
     b83:	68 41 4d 00 00       	push   $0x4d41
     b88:	ff 35 8c 6b 00 00    	push   0x6b8c
     b8e:	e8 ad 3b 00 00       	call   4740 <printf>
    exit(0);
     b93:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b9a:	e8 13 3a 00 00       	call   45b2 <exit>
     b9f:	83 c4 10             	add    $0x10,%esp
     ba2:	eb 99                	jmp    b3d <dirtest+0x6d>
     ba4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(stdout, "chdir .. failed\n");
     ba8:	83 ec 08             	sub    $0x8,%esp
     bab:	68 30 4d 00 00       	push   $0x4d30
     bb0:	ff 35 8c 6b 00 00    	push   0x6b8c
     bb6:	e8 85 3b 00 00       	call   4740 <printf>
    exit(0);
     bbb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     bc2:	e8 eb 39 00 00       	call   45b2 <exit>
     bc7:	83 c4 10             	add    $0x10,%esp
     bca:	e9 5a ff ff ff       	jmp    b29 <dirtest+0x59>
     bcf:	90                   	nop
    printf(stdout, "chdir dir0 failed\n");
     bd0:	83 ec 08             	sub    $0x8,%esp
     bd3:	68 1d 4d 00 00       	push   $0x4d1d
     bd8:	ff 35 8c 6b 00 00    	push   0x6b8c
     bde:	e8 5d 3b 00 00       	call   4740 <printf>
    exit(0);
     be3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     bea:	e8 c3 39 00 00       	call   45b2 <exit>
     bef:	83 c4 10             	add    $0x10,%esp
     bf2:	e9 1a ff ff ff       	jmp    b11 <dirtest+0x41>
     bf7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     bfe:	00 
     bff:	90                   	nop

00000c00 <exectest>:
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     c06:	68 64 4d 00 00       	push   $0x4d64
     c0b:	ff 35 8c 6b 00 00    	push   0x6b8c
     c11:	e8 2a 3b 00 00       	call   4740 <printf>
  if(exec("echo", echoargv) < 0){
     c16:	58                   	pop    %eax
     c17:	5a                   	pop    %edx
     c18:	68 90 6b 00 00       	push   $0x6b90
     c1d:	68 2d 4b 00 00       	push   $0x4b2d
     c22:	e8 c3 39 00 00       	call   45ea <exec>
     c27:	83 c4 10             	add    $0x10,%esp
     c2a:	85 c0                	test   %eax,%eax
     c2c:	78 02                	js     c30 <exectest+0x30>
}
     c2e:	c9                   	leave
     c2f:	c3                   	ret
    printf(stdout, "exec echo failed\n");
     c30:	83 ec 08             	sub    $0x8,%esp
     c33:	68 6f 4d 00 00       	push   $0x4d6f
     c38:	ff 35 8c 6b 00 00    	push   0x6b8c
     c3e:	e8 fd 3a 00 00       	call   4740 <printf>
    exit(0);
     c43:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c4a:	e8 63 39 00 00       	call   45b2 <exit>
}
     c4f:	83 c4 10             	add    $0x10,%esp
     c52:	c9                   	leave
     c53:	c3                   	ret
     c54:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     c5b:	00 
     c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c60 <pipe1>:
{
     c60:	55                   	push   %ebp
     c61:	89 e5                	mov    %esp,%ebp
     c63:	57                   	push   %edi
     c64:	56                   	push   %esi
  if(pipe(fds) != 0){
     c65:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
     c68:	53                   	push   %ebx
     c69:	83 ec 28             	sub    $0x28,%esp
  if(pipe(fds) != 0){
     c6c:	50                   	push   %eax
     c6d:	e8 50 39 00 00       	call   45c2 <pipe>
     c72:	83 c4 10             	add    $0x10,%esp
     c75:	85 c0                	test   %eax,%eax
     c77:	0f 85 d1 00 00 00    	jne    d4e <pipe1+0xee>
  pid = fork();
     c7d:	e8 28 39 00 00       	call   45aa <fork>
  if(pid == 0){
     c82:	85 c0                	test   %eax,%eax
     c84:	0f 84 ef 00 00 00    	je     d79 <pipe1+0x119>
  } else if(pid > 0){
     c8a:	7e 70                	jle    cfc <pipe1+0x9c>
    close(fds[1]);
     c8c:	83 ec 0c             	sub    $0xc,%esp
     c8f:	ff 75 e4             	push   -0x1c(%ebp)
    total = 0;
     c92:	31 db                	xor    %ebx,%ebx
    cc = 1;
     c94:	bf 01 00 00 00       	mov    $0x1,%edi
  seq = 0;
     c99:	31 f6                	xor    %esi,%esi
    close(fds[1]);
     c9b:	e8 3a 39 00 00       	call   45da <close>
    while((n = read(fds[0], buf, cc)) > 0){
     ca0:	83 c4 10             	add    $0x10,%esp
     ca3:	83 ec 04             	sub    $0x4,%esp
     ca6:	57                   	push   %edi
     ca7:	68 e0 92 00 00       	push   $0x92e0
     cac:	ff 75 e0             	push   -0x20(%ebp)
     caf:	e8 16 39 00 00       	call   45ca <read>
     cb4:	83 c4 10             	add    $0x10,%esp
     cb7:	89 c1                	mov    %eax,%ecx
     cb9:	85 c0                	test   %eax,%eax
     cbb:	0f 8e 47 01 00 00    	jle    e08 <pipe1+0x1a8>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     cc1:	89 f0                	mov    %esi,%eax
     cc3:	32 05 e0 92 00 00    	xor    0x92e0,%al
     cc9:	0f b6 c0             	movzbl %al,%eax
     ccc:	85 c0                	test   %eax,%eax
     cce:	75 64                	jne    d34 <pipe1+0xd4>
     cd0:	83 c6 01             	add    $0x1,%esi
     cd3:	eb 0b                	jmp    ce0 <pipe1+0x80>
     cd5:	8d 76 00             	lea    0x0(%esi),%esi
     cd8:	38 90 e0 92 00 00    	cmp    %dl,0x92e0(%eax)
     cde:	75 54                	jne    d34 <pipe1+0xd4>
     ce0:	8d 14 06             	lea    (%esi,%eax,1),%edx
      for(i = 0; i < n; i++){
     ce3:	83 c0 01             	add    $0x1,%eax
     ce6:	39 c1                	cmp    %eax,%ecx
     ce8:	75 ee                	jne    cd8 <pipe1+0x78>
      cc = cc * 2;
     cea:	01 ff                	add    %edi,%edi
      if(cc > sizeof(buf))
     cec:	b8 00 20 00 00       	mov    $0x2000,%eax
      total += n;
     cf1:	01 cb                	add    %ecx,%ebx
      if(cc > sizeof(buf))
     cf3:	89 d6                	mov    %edx,%esi
     cf5:	39 c7                	cmp    %eax,%edi
     cf7:	0f 4f f8             	cmovg  %eax,%edi
     cfa:	eb a7                	jmp    ca3 <pipe1+0x43>
    printf(1, "fork() failed\n");
     cfc:	83 ec 08             	sub    $0x8,%esp
     cff:	68 c3 4d 00 00       	push   $0x4dc3
     d04:	6a 01                	push   $0x1
     d06:	e8 35 3a 00 00       	call   4740 <printf>
    exit(0);
     d0b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d12:	e8 9b 38 00 00       	call   45b2 <exit>
     d17:	83 c4 10             	add    $0x10,%esp
  printf(1, "pipe1 ok\n");
     d1a:	83 ec 08             	sub    $0x8,%esp
     d1d:	68 d2 4d 00 00       	push   $0x4dd2
     d22:	6a 01                	push   $0x1
     d24:	e8 17 3a 00 00       	call   4740 <printf>
     d29:	83 c4 10             	add    $0x10,%esp
}
     d2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d2f:	5b                   	pop    %ebx
     d30:	5e                   	pop    %esi
     d31:	5f                   	pop    %edi
     d32:	5d                   	pop    %ebp
     d33:	c3                   	ret
          printf(1, "pipe1 oops 2\n");
     d34:	83 ec 08             	sub    $0x8,%esp
     d37:	68 9e 4d 00 00       	push   $0x4d9e
     d3c:	6a 01                	push   $0x1
     d3e:	e8 fd 39 00 00       	call   4740 <printf>
     d43:	83 c4 10             	add    $0x10,%esp
}
     d46:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d49:	5b                   	pop    %ebx
     d4a:	5e                   	pop    %esi
     d4b:	5f                   	pop    %edi
     d4c:	5d                   	pop    %ebp
     d4d:	c3                   	ret
    printf(1, "pipe() failed\n");
     d4e:	83 ec 08             	sub    $0x8,%esp
     d51:	68 81 4d 00 00       	push   $0x4d81
     d56:	6a 01                	push   $0x1
     d58:	e8 e3 39 00 00       	call   4740 <printf>
    exit(0);
     d5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d64:	e8 49 38 00 00       	call   45b2 <exit>
     d69:	83 c4 10             	add    $0x10,%esp
  pid = fork();
     d6c:	e8 39 38 00 00       	call   45aa <fork>
  if(pid == 0){
     d71:	85 c0                	test   %eax,%eax
     d73:	0f 85 11 ff ff ff    	jne    c8a <pipe1+0x2a>
    close(fds[0]);
     d79:	83 ec 0c             	sub    $0xc,%esp
     d7c:	ff 75 e0             	push   -0x20(%ebp)
  seq = 0;
     d7f:	31 db                	xor    %ebx,%ebx
    close(fds[0]);
     d81:	e8 54 38 00 00       	call   45da <close>
     d86:	83 c4 10             	add    $0x10,%esp
     d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < 1033; i++)
     d90:	31 c0                	xor    %eax,%eax
     d92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        buf[i] = seq++;
     d98:	8d 14 03             	lea    (%ebx,%eax,1),%edx
      for(i = 0; i < 1033; i++)
     d9b:	83 c0 01             	add    $0x1,%eax
        buf[i] = seq++;
     d9e:	88 90 df 92 00 00    	mov    %dl,0x92df(%eax)
      for(i = 0; i < 1033; i++)
     da4:	3d 09 04 00 00       	cmp    $0x409,%eax
     da9:	75 ed                	jne    d98 <pipe1+0x138>
      if(write(fds[1], buf, 1033) != 1033){
     dab:	83 ec 04             	sub    $0x4,%esp
     dae:	81 c3 09 04 00 00    	add    $0x409,%ebx
     db4:	68 09 04 00 00       	push   $0x409
     db9:	68 e0 92 00 00       	push   $0x92e0
     dbe:	ff 75 e4             	push   -0x1c(%ebp)
     dc1:	e8 0c 38 00 00       	call   45d2 <write>
     dc6:	83 c4 10             	add    $0x10,%esp
     dc9:	3d 09 04 00 00       	cmp    $0x409,%eax
     dce:	74 1e                	je     dee <pipe1+0x18e>
        printf(1, "pipe1 oops 1\n");
     dd0:	83 ec 08             	sub    $0x8,%esp
     dd3:	68 90 4d 00 00       	push   $0x4d90
     dd8:	6a 01                	push   $0x1
     dda:	e8 61 39 00 00       	call   4740 <printf>
        exit(0);
     ddf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     de6:	e8 c7 37 00 00       	call   45b2 <exit>
     deb:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
     dee:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     df4:	75 9a                	jne    d90 <pipe1+0x130>
    exit(0);
     df6:	83 ec 0c             	sub    $0xc,%esp
     df9:	6a 00                	push   $0x0
     dfb:	e8 b2 37 00 00       	call   45b2 <exit>
     e00:	83 c4 10             	add    $0x10,%esp
     e03:	e9 12 ff ff ff       	jmp    d1a <pipe1+0xba>
    if(total != 5 * 1033){
     e08:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     e0e:	74 1f                	je     e2f <pipe1+0x1cf>
      printf(1, "pipe1 oops 3 total %d\n", total);
     e10:	83 ec 04             	sub    $0x4,%esp
     e13:	53                   	push   %ebx
     e14:	68 ac 4d 00 00       	push   $0x4dac
     e19:	6a 01                	push   $0x1
     e1b:	e8 20 39 00 00       	call   4740 <printf>
      exit(0);
     e20:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e27:	e8 86 37 00 00       	call   45b2 <exit>
     e2c:	83 c4 10             	add    $0x10,%esp
    close(fds[0]);
     e2f:	83 ec 0c             	sub    $0xc,%esp
     e32:	ff 75 e0             	push   -0x20(%ebp)
     e35:	e8 a0 37 00 00       	call   45da <close>
    wait();
     e3a:	e8 7b 37 00 00       	call   45ba <wait>
     e3f:	83 c4 10             	add    $0x10,%esp
     e42:	e9 d3 fe ff ff       	jmp    d1a <pipe1+0xba>
     e47:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e4e:	00 
     e4f:	90                   	nop

00000e50 <preempt>:
{
     e50:	55                   	push   %ebp
     e51:	89 e5                	mov    %esp,%ebp
     e53:	57                   	push   %edi
     e54:	56                   	push   %esi
     e55:	53                   	push   %ebx
     e56:	83 ec 24             	sub    $0x24,%esp
  printf(1, "preempt: ");
     e59:	68 dc 4d 00 00       	push   $0x4ddc
     e5e:	6a 01                	push   $0x1
     e60:	e8 db 38 00 00       	call   4740 <printf>
  pid1 = fork();
     e65:	e8 40 37 00 00       	call   45aa <fork>
  if(pid1 == 0)
     e6a:	83 c4 10             	add    $0x10,%esp
     e6d:	85 c0                	test   %eax,%eax
     e6f:	75 07                	jne    e78 <preempt+0x28>
    for(;;)
     e71:	eb fe                	jmp    e71 <preempt+0x21>
     e73:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
     e78:	89 c3                	mov    %eax,%ebx
  pid2 = fork();
     e7a:	e8 2b 37 00 00       	call   45aa <fork>
     e7f:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     e81:	85 c0                	test   %eax,%eax
     e83:	75 0b                	jne    e90 <preempt+0x40>
    for(;;)
     e85:	eb fe                	jmp    e85 <preempt+0x35>
     e87:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     e8e:	00 
     e8f:	90                   	nop
  pipe(pfds);
     e90:	83 ec 0c             	sub    $0xc,%esp
     e93:	8d 45 e0             	lea    -0x20(%ebp),%eax
     e96:	50                   	push   %eax
     e97:	e8 26 37 00 00       	call   45c2 <pipe>
  pid3 = fork();
     e9c:	e8 09 37 00 00       	call   45aa <fork>
  if(pid3 == 0){
     ea1:	83 c4 10             	add    $0x10,%esp
  pid3 = fork();
     ea4:	89 c7                	mov    %eax,%edi
  if(pid3 == 0){
     ea6:	85 c0                	test   %eax,%eax
     ea8:	75 3e                	jne    ee8 <preempt+0x98>
    close(pfds[0]);
     eaa:	83 ec 0c             	sub    $0xc,%esp
     ead:	ff 75 e0             	push   -0x20(%ebp)
     eb0:	e8 25 37 00 00       	call   45da <close>
    if(write(pfds[1], "x", 1) != 1)
     eb5:	83 c4 0c             	add    $0xc,%esp
     eb8:	6a 01                	push   $0x1
     eba:	68 a1 53 00 00       	push   $0x53a1
     ebf:	ff 75 e4             	push   -0x1c(%ebp)
     ec2:	e8 0b 37 00 00       	call   45d2 <write>
     ec7:	83 c4 10             	add    $0x10,%esp
     eca:	83 f8 01             	cmp    $0x1,%eax
     ecd:	0f 85 b8 00 00 00    	jne    f8b <preempt+0x13b>
    close(pfds[1]);
     ed3:	83 ec 0c             	sub    $0xc,%esp
     ed6:	ff 75 e4             	push   -0x1c(%ebp)
     ed9:	e8 fc 36 00 00       	call   45da <close>
     ede:	83 c4 10             	add    $0x10,%esp
    for(;;)
     ee1:	eb fe                	jmp    ee1 <preempt+0x91>
     ee3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  close(pfds[1]);
     ee8:	83 ec 0c             	sub    $0xc,%esp
     eeb:	ff 75 e4             	push   -0x1c(%ebp)
     eee:	e8 e7 36 00 00       	call   45da <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     ef3:	83 c4 0c             	add    $0xc,%esp
     ef6:	68 00 20 00 00       	push   $0x2000
     efb:	68 e0 92 00 00       	push   $0x92e0
     f00:	ff 75 e0             	push   -0x20(%ebp)
     f03:	e8 c2 36 00 00       	call   45ca <read>
     f08:	83 c4 10             	add    $0x10,%esp
     f0b:	83 f8 01             	cmp    $0x1,%eax
     f0e:	75 67                	jne    f77 <preempt+0x127>
  close(pfds[0]);
     f10:	83 ec 0c             	sub    $0xc,%esp
     f13:	ff 75 e0             	push   -0x20(%ebp)
     f16:	e8 bf 36 00 00       	call   45da <close>
  printf(1, "kill... ");
     f1b:	58                   	pop    %eax
     f1c:	5a                   	pop    %edx
     f1d:	68 0d 4e 00 00       	push   $0x4e0d
     f22:	6a 01                	push   $0x1
     f24:	e8 17 38 00 00       	call   4740 <printf>
  kill(pid1);
     f29:	89 1c 24             	mov    %ebx,(%esp)
     f2c:	e8 b1 36 00 00       	call   45e2 <kill>
  kill(pid2);
     f31:	89 34 24             	mov    %esi,(%esp)
     f34:	e8 a9 36 00 00       	call   45e2 <kill>
  kill(pid3);
     f39:	89 3c 24             	mov    %edi,(%esp)
     f3c:	e8 a1 36 00 00       	call   45e2 <kill>
  printf(1, "wait... ");
     f41:	59                   	pop    %ecx
     f42:	5b                   	pop    %ebx
     f43:	68 16 4e 00 00       	push   $0x4e16
     f48:	6a 01                	push   $0x1
     f4a:	e8 f1 37 00 00       	call   4740 <printf>
  wait();
     f4f:	e8 66 36 00 00       	call   45ba <wait>
  wait();
     f54:	e8 61 36 00 00       	call   45ba <wait>
  wait();
     f59:	e8 5c 36 00 00       	call   45ba <wait>
  printf(1, "preempt ok\n");
     f5e:	5e                   	pop    %esi
     f5f:	5f                   	pop    %edi
     f60:	68 1f 4e 00 00       	push   $0x4e1f
     f65:	6a 01                	push   $0x1
     f67:	e8 d4 37 00 00       	call   4740 <printf>
     f6c:	83 c4 10             	add    $0x10,%esp
}
     f6f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f72:	5b                   	pop    %ebx
     f73:	5e                   	pop    %esi
     f74:	5f                   	pop    %edi
     f75:	5d                   	pop    %ebp
     f76:	c3                   	ret
    printf(1, "preempt read error");
     f77:	83 ec 08             	sub    $0x8,%esp
     f7a:	68 fa 4d 00 00       	push   $0x4dfa
     f7f:	6a 01                	push   $0x1
     f81:	e8 ba 37 00 00       	call   4740 <printf>
     f86:	83 c4 10             	add    $0x10,%esp
     f89:	eb e4                	jmp    f6f <preempt+0x11f>
      printf(1, "preempt write error");
     f8b:	83 ec 08             	sub    $0x8,%esp
     f8e:	68 e6 4d 00 00       	push   $0x4de6
     f93:	6a 01                	push   $0x1
     f95:	e8 a6 37 00 00       	call   4740 <printf>
     f9a:	83 c4 10             	add    $0x10,%esp
     f9d:	e9 31 ff ff ff       	jmp    ed3 <preempt+0x83>
     fa2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
     fa9:	00 
     faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000fb0 <exitwait>:
{
     fb0:	55                   	push   %ebp
     fb1:	89 e5                	mov    %esp,%ebp
     fb3:	56                   	push   %esi
     fb4:	be 64 00 00 00       	mov    $0x64,%esi
     fb9:	53                   	push   %ebx
     fba:	eb 12                	jmp    fce <exitwait+0x1e>
     fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(wait() != pid){
     fc0:	e8 f5 35 00 00       	call   45ba <wait>
     fc5:	39 d8                	cmp    %ebx,%eax
     fc7:	75 67                	jne    1030 <exitwait+0x80>
  for(i = 0; i < 100; i++){
     fc9:	83 ee 01             	sub    $0x1,%esi
     fcc:	74 1f                	je     fed <exitwait+0x3d>
    pid = fork();
     fce:	e8 d7 35 00 00       	call   45aa <fork>
     fd3:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     fd5:	85 c0                	test   %eax,%eax
     fd7:	78 37                	js     1010 <exitwait+0x60>
    if(pid){
     fd9:	75 e5                	jne    fc0 <exitwait+0x10>
      exit(0);
     fdb:	83 ec 0c             	sub    $0xc,%esp
     fde:	6a 00                	push   $0x0
     fe0:	e8 cd 35 00 00       	call   45b2 <exit>
     fe5:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
     fe8:	83 ee 01             	sub    $0x1,%esi
     feb:	75 e1                	jne    fce <exitwait+0x1e>
  printf(1, "exitwait ok\n");
     fed:	83 ec 08             	sub    $0x8,%esp
     ff0:	68 3b 4e 00 00       	push   $0x4e3b
     ff5:	6a 01                	push   $0x1
     ff7:	e8 44 37 00 00       	call   4740 <printf>
     ffc:	83 c4 10             	add    $0x10,%esp
}
     fff:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1002:	5b                   	pop    %ebx
    1003:	5e                   	pop    %esi
    1004:	5d                   	pop    %ebp
    1005:	c3                   	ret
    1006:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    100d:	00 
    100e:	66 90                	xchg   %ax,%ax
      printf(1, "fork failed\n");
    1010:	83 ec 08             	sub    $0x8,%esp
    1013:	68 89 59 00 00       	push   $0x5989
    1018:	6a 01                	push   $0x1
    101a:	e8 21 37 00 00       	call   4740 <printf>
      return;
    101f:	83 c4 10             	add    $0x10,%esp
}
    1022:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1025:	5b                   	pop    %ebx
    1026:	5e                   	pop    %esi
    1027:	5d                   	pop    %ebp
    1028:	c3                   	ret
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "wait wrong pid\n");
    1030:	83 ec 08             	sub    $0x8,%esp
    1033:	68 2b 4e 00 00       	push   $0x4e2b
    1038:	6a 01                	push   $0x1
    103a:	e8 01 37 00 00       	call   4740 <printf>
        return;
    103f:	83 c4 10             	add    $0x10,%esp
}
    1042:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1045:	5b                   	pop    %ebx
    1046:	5e                   	pop    %esi
    1047:	5d                   	pop    %ebp
    1048:	c3                   	ret
    1049:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001050 <mem>:
{
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	56                   	push   %esi
    1054:	31 f6                	xor    %esi,%esi
    1056:	53                   	push   %ebx
  printf(1, "mem test\n");
    1057:	83 ec 08             	sub    $0x8,%esp
    105a:	68 48 4e 00 00       	push   $0x4e48
    105f:	6a 01                	push   $0x1
    1061:	e8 da 36 00 00       	call   4740 <printf>
  ppid = getpid();
    1066:	e8 c7 35 00 00       	call   4632 <getpid>
    106b:	89 c3                	mov    %eax,%ebx
  if((pid = fork()) == 0){
    106d:	e8 38 35 00 00       	call   45aa <fork>
    1072:	83 c4 10             	add    $0x10,%esp
    1075:	85 c0                	test   %eax,%eax
    1077:	74 0b                	je     1084 <mem+0x34>
    1079:	e9 82 00 00 00       	jmp    1100 <mem+0xb0>
    107e:	66 90                	xchg   %ax,%ax
      *(char**)m2 = m1;
    1080:	89 30                	mov    %esi,(%eax)
      m1 = m2;
    1082:	89 c6                	mov    %eax,%esi
    while((m2 = malloc(10001)) != 0){
    1084:	83 ec 0c             	sub    $0xc,%esp
    1087:	68 11 27 00 00       	push   $0x2711
    108c:	e8 cf 38 00 00       	call   4960 <malloc>
    1091:	83 c4 10             	add    $0x10,%esp
    1094:	85 c0                	test   %eax,%eax
    1096:	75 e8                	jne    1080 <mem+0x30>
    while(m1){
    1098:	85 f6                	test   %esi,%esi
    109a:	74 18                	je     10b4 <mem+0x64>
    109c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
    10a0:	89 f0                	mov    %esi,%eax
      free(m1);
    10a2:	83 ec 0c             	sub    $0xc,%esp
      m2 = *(char**)m1;
    10a5:	8b 36                	mov    (%esi),%esi
      free(m1);
    10a7:	50                   	push   %eax
    10a8:	e8 23 38 00 00       	call   48d0 <free>
    while(m1){
    10ad:	83 c4 10             	add    $0x10,%esp
    10b0:	85 f6                	test   %esi,%esi
    10b2:	75 ec                	jne    10a0 <mem+0x50>
    m1 = malloc(1024*20);
    10b4:	83 ec 0c             	sub    $0xc,%esp
    10b7:	68 00 50 00 00       	push   $0x5000
    10bc:	e8 9f 38 00 00       	call   4960 <malloc>
    if(m1 == 0){
    10c1:	83 c4 10             	add    $0x10,%esp
    m1 = malloc(1024*20);
    10c4:	89 c6                	mov    %eax,%esi
    if(m1 == 0){
    10c6:	85 c0                	test   %eax,%eax
    10c8:	74 46                	je     1110 <mem+0xc0>
    free(m1);
    10ca:	83 ec 0c             	sub    $0xc,%esp
    10cd:	56                   	push   %esi
    10ce:	e8 fd 37 00 00       	call   48d0 <free>
    printf(1, "mem ok\n");
    10d3:	58                   	pop    %eax
    10d4:	5a                   	pop    %edx
    10d5:	68 6c 4e 00 00       	push   $0x4e6c
    10da:	6a 01                	push   $0x1
    10dc:	e8 5f 36 00 00       	call   4740 <printf>
    exit(0);
    10e1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    10e8:	e8 c5 34 00 00       	call   45b2 <exit>
    10ed:	83 c4 10             	add    $0x10,%esp
}
    10f0:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10f3:	5b                   	pop    %ebx
    10f4:	5e                   	pop    %esi
    10f5:	5d                   	pop    %ebp
    10f6:	c3                   	ret
    10f7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    10fe:	00 
    10ff:	90                   	nop
    1100:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1103:	5b                   	pop    %ebx
    1104:	5e                   	pop    %esi
    1105:	5d                   	pop    %ebp
    wait();
    1106:	e9 af 34 00 00       	jmp    45ba <wait>
    110b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      printf(1, "couldn't allocate mem?!!\n");
    1110:	83 ec 08             	sub    $0x8,%esp
    1113:	68 52 4e 00 00       	push   $0x4e52
    1118:	6a 01                	push   $0x1
    111a:	e8 21 36 00 00       	call   4740 <printf>
      kill(ppid);
    111f:	89 1c 24             	mov    %ebx,(%esp)
    1122:	e8 bb 34 00 00       	call   45e2 <kill>
      exit(0);
    1127:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    112e:	e8 7f 34 00 00       	call   45b2 <exit>
    1133:	83 c4 10             	add    $0x10,%esp
    1136:	eb 92                	jmp    10ca <mem+0x7a>
    1138:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    113f:	00 

00001140 <sharedfd>:
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	57                   	push   %edi
    1144:	56                   	push   %esi
    1145:	53                   	push   %ebx
    1146:	83 ec 34             	sub    $0x34,%esp
  printf(1, "sharedfd test\n");
    1149:	68 74 4e 00 00       	push   $0x4e74
    114e:	6a 01                	push   $0x1
    1150:	e8 eb 35 00 00       	call   4740 <printf>
  unlink("sharedfd");
    1155:	c7 04 24 83 4e 00 00 	movl   $0x4e83,(%esp)
    115c:	e8 a1 34 00 00       	call   4602 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
    1161:	5b                   	pop    %ebx
    1162:	5e                   	pop    %esi
    1163:	68 02 02 00 00       	push   $0x202
    1168:	68 83 4e 00 00       	push   $0x4e83
    116d:	e8 80 34 00 00       	call   45f2 <open>
  if(fd < 0){
    1172:	83 c4 10             	add    $0x10,%esp
    1175:	85 c0                	test   %eax,%eax
    1177:	0f 88 67 01 00 00    	js     12e4 <sharedfd+0x1a4>
    117d:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
    117f:	8d 75 de             	lea    -0x22(%ebp),%esi
    1182:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  pid = fork();
    1187:	e8 1e 34 00 00       	call   45aa <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
    118c:	83 f8 01             	cmp    $0x1,%eax
  pid = fork();
    118f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
    1192:	19 c0                	sbb    %eax,%eax
    1194:	83 ec 04             	sub    $0x4,%esp
    1197:	83 e0 f3             	and    $0xfffffff3,%eax
    119a:	6a 0a                	push   $0xa
    119c:	83 c0 70             	add    $0x70,%eax
    119f:	50                   	push   %eax
    11a0:	56                   	push   %esi
    11a1:	e8 7a 32 00 00       	call   4420 <memset>
    11a6:	83 c4 10             	add    $0x10,%esp
    11a9:	eb 0a                	jmp    11b5 <sharedfd+0x75>
    11ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 1000; i++){
    11b0:	83 eb 01             	sub    $0x1,%ebx
    11b3:	74 26                	je     11db <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    11b5:	83 ec 04             	sub    $0x4,%esp
    11b8:	6a 0a                	push   $0xa
    11ba:	56                   	push   %esi
    11bb:	57                   	push   %edi
    11bc:	e8 11 34 00 00       	call   45d2 <write>
    11c1:	83 c4 10             	add    $0x10,%esp
    11c4:	83 f8 0a             	cmp    $0xa,%eax
    11c7:	74 e7                	je     11b0 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
    11c9:	83 ec 08             	sub    $0x8,%esp
    11cc:	68 7c 5b 00 00       	push   $0x5b7c
    11d1:	6a 01                	push   $0x1
    11d3:	e8 68 35 00 00       	call   4740 <printf>
      break;
    11d8:	83 c4 10             	add    $0x10,%esp
  if(pid == 0)
    11db:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    11de:	85 c9                	test   %ecx,%ecx
    11e0:	74 7d                	je     125f <sharedfd+0x11f>
    wait();
    11e2:	e8 d3 33 00 00       	call   45ba <wait>
  close(fd);
    11e7:	83 ec 0c             	sub    $0xc,%esp
  nc = np = 0;
    11ea:	31 db                	xor    %ebx,%ebx
  close(fd);
    11ec:	57                   	push   %edi
    11ed:	8d 7d e8             	lea    -0x18(%ebp),%edi
    11f0:	e8 e5 33 00 00       	call   45da <close>
  fd = open("sharedfd", 0);
    11f5:	58                   	pop    %eax
    11f6:	5a                   	pop    %edx
    11f7:	6a 00                	push   $0x0
    11f9:	68 83 4e 00 00       	push   $0x4e83
    11fe:	e8 ef 33 00 00       	call   45f2 <open>
  if(fd < 0){
    1203:	83 c4 10             	add    $0x10,%esp
  nc = np = 0;
    1206:	31 d2                	xor    %edx,%edx
  fd = open("sharedfd", 0);
    1208:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
    120b:	85 c0                	test   %eax,%eax
    120d:	0f 88 eb 00 00 00    	js     12fe <sharedfd+0x1be>
    1213:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
    1218:	83 ec 04             	sub    $0x4,%esp
    121b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    121e:	6a 0a                	push   $0xa
    1220:	56                   	push   %esi
    1221:	ff 75 d0             	push   -0x30(%ebp)
    1224:	e8 a1 33 00 00       	call   45ca <read>
    1229:	83 c4 10             	add    $0x10,%esp
    122c:	85 c0                	test   %eax,%eax
    122e:	7e 48                	jle    1278 <sharedfd+0x138>
    1230:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1233:	89 f0                	mov    %esi,%eax
    1235:	eb 1b                	jmp    1252 <sharedfd+0x112>
    1237:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    123e:	00 
    123f:	90                   	nop
        np++;
    1240:	80 f9 70             	cmp    $0x70,%cl
    1243:	0f 94 c1             	sete   %cl
    1246:	0f b6 c9             	movzbl %cl,%ecx
    1249:	01 cb                	add    %ecx,%ebx
    for(i = 0; i < sizeof(buf); i++){
    124b:	83 c0 01             	add    $0x1,%eax
    124e:	39 c7                	cmp    %eax,%edi
    1250:	74 c6                	je     1218 <sharedfd+0xd8>
      if(buf[i] == 'c')
    1252:	0f b6 08             	movzbl (%eax),%ecx
    1255:	80 f9 63             	cmp    $0x63,%cl
    1258:	75 e6                	jne    1240 <sharedfd+0x100>
        nc++;
    125a:	83 c2 01             	add    $0x1,%edx
      if(buf[i] == 'p')
    125d:	eb ec                	jmp    124b <sharedfd+0x10b>
    exit(0);
    125f:	83 ec 0c             	sub    $0xc,%esp
    1262:	6a 00                	push   $0x0
    1264:	e8 49 33 00 00       	call   45b2 <exit>
    1269:	83 c4 10             	add    $0x10,%esp
    126c:	e9 76 ff ff ff       	jmp    11e7 <sharedfd+0xa7>
    1271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  close(fd);
    1278:	83 ec 0c             	sub    $0xc,%esp
    127b:	ff 75 d0             	push   -0x30(%ebp)
    127e:	e8 57 33 00 00       	call   45da <close>
  unlink("sharedfd");
    1283:	c7 04 24 83 4e 00 00 	movl   $0x4e83,(%esp)
    128a:	e8 73 33 00 00       	call   4602 <unlink>
  if(nc == 10000 && np == 10000){
    128f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1292:	83 c4 10             	add    $0x10,%esp
    1295:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
    129b:	75 22                	jne    12bf <sharedfd+0x17f>
    129d:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
    12a3:	75 1a                	jne    12bf <sharedfd+0x17f>
    printf(1, "sharedfd ok\n");
    12a5:	83 ec 08             	sub    $0x8,%esp
    12a8:	68 8c 4e 00 00       	push   $0x4e8c
    12ad:	6a 01                	push   $0x1
    12af:	e8 8c 34 00 00       	call   4740 <printf>
    12b4:	83 c4 10             	add    $0x10,%esp
}
    12b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12ba:	5b                   	pop    %ebx
    12bb:	5e                   	pop    %esi
    12bc:	5f                   	pop    %edi
    12bd:	5d                   	pop    %ebp
    12be:	c3                   	ret
    printf(1, "sharedfd oops %d %d\n", nc, np);
    12bf:	53                   	push   %ebx
    12c0:	52                   	push   %edx
    12c1:	68 99 4e 00 00       	push   $0x4e99
    12c6:	6a 01                	push   $0x1
    12c8:	e8 73 34 00 00       	call   4740 <printf>
    exit(0);
    12cd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    12d4:	e8 d9 32 00 00       	call   45b2 <exit>
    12d9:	83 c4 10             	add    $0x10,%esp
}
    12dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12df:	5b                   	pop    %ebx
    12e0:	5e                   	pop    %esi
    12e1:	5f                   	pop    %edi
    12e2:	5d                   	pop    %ebp
    12e3:	c3                   	ret
    printf(1, "fstests: cannot open sharedfd for writing");
    12e4:	83 ec 08             	sub    $0x8,%esp
    12e7:	68 50 5b 00 00       	push   $0x5b50
    12ec:	6a 01                	push   $0x1
    12ee:	e8 4d 34 00 00       	call   4740 <printf>
    return;
    12f3:	83 c4 10             	add    $0x10,%esp
}
    12f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12f9:	5b                   	pop    %ebx
    12fa:	5e                   	pop    %esi
    12fb:	5f                   	pop    %edi
    12fc:	5d                   	pop    %ebp
    12fd:	c3                   	ret
    printf(1, "fstests: cannot open sharedfd for reading\n");
    12fe:	83 ec 08             	sub    $0x8,%esp
    1301:	68 9c 5b 00 00       	push   $0x5b9c
    1306:	6a 01                	push   $0x1
    1308:	e8 33 34 00 00       	call   4740 <printf>
    return;
    130d:	83 c4 10             	add    $0x10,%esp
}
    1310:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1313:	5b                   	pop    %ebx
    1314:	5e                   	pop    %esi
    1315:	5f                   	pop    %edi
    1316:	5d                   	pop    %ebp
    1317:	c3                   	ret
    1318:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    131f:	00 

00001320 <fourfiles>:
{
    1320:	55                   	push   %ebp
    1321:	89 e5                	mov    %esp,%ebp
    1323:	57                   	push   %edi
    1324:	56                   	push   %esi
  printf(1, "fourfiles test\n");
    1325:	be 30 00 00 00       	mov    $0x30,%esi
{
    132a:	53                   	push   %ebx
    132b:	83 ec 34             	sub    $0x34,%esp
  char *names[] = { "f0", "f1", "f2", "f3" };
    132e:	c7 45 d8 ae 4e 00 00 	movl   $0x4eae,-0x28(%ebp)
    1335:	c7 45 dc f7 4f 00 00 	movl   $0x4ff7,-0x24(%ebp)
    133c:	c7 45 e0 fb 4f 00 00 	movl   $0x4ffb,-0x20(%ebp)
    1343:	c7 45 e4 b1 4e 00 00 	movl   $0x4eb1,-0x1c(%ebp)
  printf(1, "fourfiles test\n");
    134a:	68 b4 4e 00 00       	push   $0x4eb4
    134f:	6a 01                	push   $0x1
    1351:	e8 ea 33 00 00       	call   4740 <printf>
    1356:	83 c4 10             	add    $0x10,%esp
    fname = names[pi];
    1359:	8b 9c b5 18 ff ff ff 	mov    -0xe8(%ebp,%esi,4),%ebx
    unlink(fname);
    1360:	83 ec 0c             	sub    $0xc,%esp
    1363:	53                   	push   %ebx
    1364:	e8 99 32 00 00       	call   4602 <unlink>
    pid = fork();
    1369:	e8 3c 32 00 00       	call   45aa <fork>
    if(pid < 0){
    136e:	83 c4 10             	add    $0x10,%esp
    1371:	85 c0                	test   %eax,%eax
    1373:	0f 88 0e 01 00 00    	js     1487 <fourfiles+0x167>
    if(pid == 0){
    1379:	0f 84 45 01 00 00    	je     14c4 <fourfiles+0x1a4>
  for(pi = 0; pi < 4; pi++){
    137f:	83 c6 01             	add    $0x1,%esi
    1382:	83 fe 34             	cmp    $0x34,%esi
    1385:	75 d2                	jne    1359 <fourfiles+0x39>
    wait();
    1387:	e8 2e 32 00 00       	call   45ba <wait>
  for(i = 0; i < 2; i++){
    138c:	31 ff                	xor    %edi,%edi
    wait();
    138e:	e8 27 32 00 00       	call   45ba <wait>
    1393:	e8 22 32 00 00       	call   45ba <wait>
    1398:	e8 1d 32 00 00       	call   45ba <wait>
    fname = names[i];
    139d:	8b 44 bd d8          	mov    -0x28(%ebp,%edi,4),%eax
    fd = open(fname, 0);
    13a1:	83 ec 08             	sub    $0x8,%esp
    13a4:	89 fb                	mov    %edi,%ebx
    13a6:	83 f3 01             	xor    $0x1,%ebx
    fname = names[i];
    13a9:	89 45 cc             	mov    %eax,-0x34(%ebp)
    fd = open(fname, 0);
    13ac:	6a 00                	push   $0x0
    13ae:	50                   	push   %eax
    13af:	e8 3e 32 00 00       	call   45f2 <open>
    total = 0;
    13b4:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    13bb:	83 c4 10             	add    $0x10,%esp
    13be:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    13c1:	89 7d c8             	mov    %edi,-0x38(%ebp)
    13c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13c8:	83 ec 04             	sub    $0x4,%esp
    13cb:	68 00 20 00 00       	push   $0x2000
    13d0:	68 e0 92 00 00       	push   $0x92e0
    13d5:	ff 75 d4             	push   -0x2c(%ebp)
    13d8:	e8 ed 31 00 00       	call   45ca <read>
    13dd:	83 c4 10             	add    $0x10,%esp
    13e0:	89 c6                	mov    %eax,%esi
    13e2:	85 c0                	test   %eax,%eax
    13e4:	7e 4a                	jle    1430 <fourfiles+0x110>
      for(j = 0; j < n; j++){
    13e6:	31 ff                	xor    %edi,%edi
    13e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    13ef:	00 
        if(buf[j] != '0'+i){
    13f0:	89 d8                	mov    %ebx,%eax
    13f2:	0f be 97 e0 92 00 00 	movsbl 0x92e0(%edi),%edx
    13f9:	c1 e0 1f             	shl    $0x1f,%eax
    13fc:	c1 f8 1f             	sar    $0x1f,%eax
    13ff:	83 c0 31             	add    $0x31,%eax
    1402:	39 c2                	cmp    %eax,%edx
    1404:	74 1e                	je     1424 <fourfiles+0x104>
          printf(1, "wrong char\n");
    1406:	83 ec 08             	sub    $0x8,%esp
    1409:	68 d5 4e 00 00       	push   $0x4ed5
    140e:	6a 01                	push   $0x1
    1410:	e8 2b 33 00 00       	call   4740 <printf>
          exit(0);
    1415:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    141c:	e8 91 31 00 00       	call   45b2 <exit>
    1421:	83 c4 10             	add    $0x10,%esp
      for(j = 0; j < n; j++){
    1424:	83 c7 01             	add    $0x1,%edi
    1427:	39 fe                	cmp    %edi,%esi
    1429:	75 c5                	jne    13f0 <fourfiles+0xd0>
      total += n;
    142b:	01 75 d0             	add    %esi,-0x30(%ebp)
    142e:	eb 98                	jmp    13c8 <fourfiles+0xa8>
    close(fd);
    1430:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    1433:	83 ec 0c             	sub    $0xc,%esp
    1436:	8b 7d c8             	mov    -0x38(%ebp),%edi
    1439:	51                   	push   %ecx
    143a:	e8 9b 31 00 00       	call   45da <close>
    if(total != 12*500){
    143f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1442:	83 c4 10             	add    $0x10,%esp
    1445:	3d 70 17 00 00       	cmp    $0x1770,%eax
    144a:	74 1f                	je     146b <fourfiles+0x14b>
      printf(1, "wrong length %d\n", total);
    144c:	83 ec 04             	sub    $0x4,%esp
    144f:	50                   	push   %eax
    1450:	68 e1 4e 00 00       	push   $0x4ee1
    1455:	6a 01                	push   $0x1
    1457:	e8 e4 32 00 00       	call   4740 <printf>
      exit(0);
    145c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1463:	e8 4a 31 00 00       	call   45b2 <exit>
    1468:	83 c4 10             	add    $0x10,%esp
    unlink(fname);
    146b:	83 ec 0c             	sub    $0xc,%esp
    146e:	ff 75 cc             	push   -0x34(%ebp)
    1471:	e8 8c 31 00 00       	call   4602 <unlink>
  for(i = 0; i < 2; i++){
    1476:	83 c4 10             	add    $0x10,%esp
    1479:	85 ff                	test   %edi,%edi
    147b:	75 2d                	jne    14aa <fourfiles+0x18a>
    147d:	bf 01 00 00 00       	mov    $0x1,%edi
    1482:	e9 16 ff ff ff       	jmp    139d <fourfiles+0x7d>
      printf(1, "fork failed\n");
    1487:	83 ec 08             	sub    $0x8,%esp
    148a:	68 89 59 00 00       	push   $0x5989
    148f:	6a 01                	push   $0x1
    1491:	e8 aa 32 00 00       	call   4740 <printf>
      exit(0);
    1496:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    149d:	e8 10 31 00 00       	call   45b2 <exit>
    14a2:	83 c4 10             	add    $0x10,%esp
    14a5:	e9 d5 fe ff ff       	jmp    137f <fourfiles+0x5f>
  printf(1, "fourfiles ok\n");
    14aa:	83 ec 08             	sub    $0x8,%esp
    14ad:	68 f2 4e 00 00       	push   $0x4ef2
    14b2:	6a 01                	push   $0x1
    14b4:	e8 87 32 00 00       	call   4740 <printf>
}
    14b9:	83 c4 10             	add    $0x10,%esp
    14bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14bf:	5b                   	pop    %ebx
    14c0:	5e                   	pop    %esi
    14c1:	5f                   	pop    %edi
    14c2:	5d                   	pop    %ebp
    14c3:	c3                   	ret
      fd = open(fname, O_CREATE | O_RDWR);
    14c4:	83 ec 08             	sub    $0x8,%esp
    14c7:	68 02 02 00 00       	push   $0x202
    14cc:	53                   	push   %ebx
    14cd:	e8 20 31 00 00       	call   45f2 <open>
      if(fd < 0){
    14d2:	83 c4 10             	add    $0x10,%esp
      fd = open(fname, O_CREATE | O_RDWR);
    14d5:	89 c7                	mov    %eax,%edi
      if(fd < 0){
    14d7:	85 c0                	test   %eax,%eax
    14d9:	78 78                	js     1553 <fourfiles+0x233>
      memset(buf, '0'+pi, 512);
    14db:	83 ec 04             	sub    $0x4,%esp
    14de:	bb 0c 00 00 00       	mov    $0xc,%ebx
    14e3:	68 00 02 00 00       	push   $0x200
    14e8:	56                   	push   %esi
    14e9:	68 e0 92 00 00       	push   $0x92e0
    14ee:	e8 2d 2f 00 00       	call   4420 <memset>
    14f3:	83 c4 10             	add    $0x10,%esp
    14f6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    14fd:	00 
    14fe:	66 90                	xchg   %ax,%ax
        if((n = write(fd, buf, 500)) != 500){
    1500:	83 ec 04             	sub    $0x4,%esp
    1503:	68 f4 01 00 00       	push   $0x1f4
    1508:	68 e0 92 00 00       	push   $0x92e0
    150d:	57                   	push   %edi
    150e:	e8 bf 30 00 00       	call   45d2 <write>
    1513:	83 c4 10             	add    $0x10,%esp
    1516:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    151b:	74 1f                	je     153c <fourfiles+0x21c>
          printf(1, "write failed %d\n", n);
    151d:	83 ec 04             	sub    $0x4,%esp
    1520:	50                   	push   %eax
    1521:	68 c4 4e 00 00       	push   $0x4ec4
    1526:	6a 01                	push   $0x1
    1528:	e8 13 32 00 00       	call   4740 <printf>
          exit(0);
    152d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1534:	e8 79 30 00 00       	call   45b2 <exit>
    1539:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
    153c:	83 eb 01             	sub    $0x1,%ebx
    153f:	75 bf                	jne    1500 <fourfiles+0x1e0>
      exit(0);
    1541:	83 ec 0c             	sub    $0xc,%esp
    1544:	6a 00                	push   $0x0
    1546:	e8 67 30 00 00       	call   45b2 <exit>
    154b:	83 c4 10             	add    $0x10,%esp
    154e:	e9 2c fe ff ff       	jmp    137f <fourfiles+0x5f>
        printf(1, "create failed\n");
    1553:	83 ec 08             	sub    $0x8,%esp
    1556:	68 4f 51 00 00       	push   $0x514f
    155b:	6a 01                	push   $0x1
    155d:	e8 de 31 00 00       	call   4740 <printf>
        exit(0);
    1562:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1569:	e8 44 30 00 00       	call   45b2 <exit>
    156e:	83 c4 10             	add    $0x10,%esp
    1571:	e9 65 ff ff ff       	jmp    14db <fourfiles+0x1bb>
    1576:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    157d:	00 
    157e:	66 90                	xchg   %ax,%ax

00001580 <createdelete>:
{
    1580:	55                   	push   %ebp
    1581:	89 e5                	mov    %esp,%ebp
    1583:	57                   	push   %edi
    1584:	56                   	push   %esi
  printf(1, "createdelete test\n");
    1585:	be 70 00 00 00       	mov    $0x70,%esi
{
    158a:	53                   	push   %ebx
    158b:	83 ec 44             	sub    $0x44,%esp
  printf(1, "createdelete test\n");
    158e:	68 00 4f 00 00       	push   $0x4f00
    1593:	6a 01                	push   $0x1
    1595:	e8 a6 31 00 00       	call   4740 <printf>
    159a:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    159d:	e8 08 30 00 00       	call   45aa <fork>
    15a2:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
    15a4:	85 c0                	test   %eax,%eax
    15a6:	0f 88 14 02 00 00    	js     17c0 <createdelete+0x240>
    if(pid == 0){
    15ac:	0f 84 3e 01 00 00    	je     16f0 <createdelete+0x170>
  for(pi = 0; pi < 4; pi++){
    15b2:	83 c6 01             	add    $0x1,%esi
    15b5:	89 f0                	mov    %esi,%eax
    15b7:	3c 74                	cmp    $0x74,%al
    15b9:	75 e2                	jne    159d <createdelete+0x1d>
    wait();
    15bb:	e8 fa 2f 00 00       	call   45ba <wait>
    15c0:	e8 f5 2f 00 00       	call   45ba <wait>
    15c5:	e8 f0 2f 00 00       	call   45ba <wait>
    15ca:	e8 eb 2f 00 00       	call   45ba <wait>
  name[0] = name[1] = name[2] = 0;
    15cf:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
  for(i = 0; i < N; i++){
    15d3:	31 c0                	xor    %eax,%eax
    15d5:	8d 76 00             	lea    0x0(%esi),%esi
      if((i == 0 || i >= N/2) && fd < 0){
    15d8:	85 c0                	test   %eax,%eax
    15da:	89 45 c0             	mov    %eax,-0x40(%ebp)
      name[1] = '0' + i;
    15dd:	8d 78 30             	lea    0x30(%eax),%edi
      if((i == 0 || i >= N/2) && fd < 0){
    15e0:	bb 70 00 00 00       	mov    $0x70,%ebx
    15e5:	0f 94 c1             	sete   %cl
    15e8:	83 f8 09             	cmp    $0x9,%eax
    15eb:	0f 9f c2             	setg   %dl
    15ee:	09 d1                	or     %edx,%ecx
    15f0:	89 ce                	mov    %ecx,%esi
      name[1] = '0' + i;
    15f2:	89 f8                	mov    %edi,%eax
      fd = open(name, 0);
    15f4:	83 ec 08             	sub    $0x8,%esp
      name[0] = 'p' + pi;
    15f7:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
    15fa:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    15fd:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1600:	6a 00                	push   $0x0
    1602:	50                   	push   %eax
    1603:	e8 ea 2f 00 00       	call   45f2 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    1608:	83 c4 10             	add    $0x10,%esp
      fd = open(name, 0);
    160b:	89 c2                	mov    %eax,%edx
      if((i == 0 || i >= N/2) && fd < 0){
    160d:	89 f0                	mov    %esi,%eax
    160f:	84 c0                	test   %al,%al
    1611:	74 7d                	je     1690 <createdelete+0x110>
    1613:	85 d2                	test   %edx,%edx
    1615:	0f 88 a5 00 00 00    	js     16c0 <createdelete+0x140>
        close(fd);
    161b:	83 ec 0c             	sub    $0xc,%esp
    161e:	52                   	push   %edx
    161f:	e8 b6 2f 00 00       	call   45da <close>
    1624:	83 c4 10             	add    $0x10,%esp
    for(pi = 0; pi < 4; pi++){
    1627:	83 c3 01             	add    $0x1,%ebx
    162a:	80 fb 74             	cmp    $0x74,%bl
    162d:	75 c3                	jne    15f2 <createdelete+0x72>
  for(i = 0; i < N; i++){
    162f:	8b 45 c0             	mov    -0x40(%ebp),%eax
    1632:	83 c0 01             	add    $0x1,%eax
    1635:	83 f8 14             	cmp    $0x14,%eax
    1638:	75 9e                	jne    15d8 <createdelete+0x58>
    163a:	be 70 00 00 00       	mov    $0x70,%esi
    163f:	90                   	nop
      name[1] = '0' + i;
    1640:	8d 7e c0             	lea    -0x40(%esi),%edi
    1643:	bb 04 00 00 00       	mov    $0x4,%ebx
      name[0] = 'p' + i;
    1648:	89 f0                	mov    %esi,%eax
      unlink(name);
    164a:	83 ec 0c             	sub    $0xc,%esp
      name[0] = 'p' + i;
    164d:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    1650:	89 f8                	mov    %edi,%eax
    1652:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    1655:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1658:	50                   	push   %eax
    1659:	e8 a4 2f 00 00       	call   4602 <unlink>
    for(pi = 0; pi < 4; pi++){
    165e:	83 c4 10             	add    $0x10,%esp
    1661:	83 eb 01             	sub    $0x1,%ebx
    1664:	75 e2                	jne    1648 <createdelete+0xc8>
  for(i = 0; i < N; i++){
    1666:	83 c6 01             	add    $0x1,%esi
    1669:	89 f0                	mov    %esi,%eax
    166b:	3c 84                	cmp    $0x84,%al
    166d:	75 d1                	jne    1640 <createdelete+0xc0>
  printf(1, "createdelete ok\n");
    166f:	83 ec 08             	sub    $0x8,%esp
    1672:	68 13 4f 00 00       	push   $0x4f13
    1677:	6a 01                	push   $0x1
    1679:	e8 c2 30 00 00       	call   4740 <printf>
}
    167e:	83 c4 10             	add    $0x10,%esp
    1681:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1684:	5b                   	pop    %ebx
    1685:	5e                   	pop    %esi
    1686:	5f                   	pop    %edi
    1687:	5d                   	pop    %ebp
    1688:	c3                   	ret
    1689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1690:	85 d2                	test   %edx,%edx
    1692:	89 55 c4             	mov    %edx,-0x3c(%ebp)
    1695:	78 90                	js     1627 <createdelete+0xa7>
        printf(1, "oops createdelete %s did exist\n", name);
    1697:	50                   	push   %eax
    1698:	8d 45 c8             	lea    -0x38(%ebp),%eax
    169b:	50                   	push   %eax
    169c:	68 ec 5b 00 00       	push   $0x5bec
    16a1:	6a 01                	push   $0x1
    16a3:	e8 98 30 00 00       	call   4740 <printf>
        exit(0);
    16a8:	31 d2                	xor    %edx,%edx
    16aa:	89 14 24             	mov    %edx,(%esp)
    16ad:	e8 00 2f 00 00       	call   45b2 <exit>
    16b2:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    16b5:	83 c4 10             	add    $0x10,%esp
    16b8:	e9 5e ff ff ff       	jmp    161b <createdelete+0x9b>
    16bd:	8d 76 00             	lea    0x0(%esi),%esi
        printf(1, "oops createdelete %s didn't exist\n", name);
    16c0:	83 ec 04             	sub    $0x4,%esp
    16c3:	8d 45 c8             	lea    -0x38(%ebp),%eax
    16c6:	50                   	push   %eax
    16c7:	68 c8 5b 00 00       	push   $0x5bc8
    16cc:	6a 01                	push   $0x1
    16ce:	e8 6d 30 00 00       	call   4740 <printf>
        exit(0);
    16d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    16da:	e8 d3 2e 00 00       	call   45b2 <exit>
    16df:	83 c4 10             	add    $0x10,%esp
    16e2:	e9 40 ff ff ff       	jmp    1627 <createdelete+0xa7>
    16e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    16ee:	00 
    16ef:	90                   	nop
      name[0] = 'p' + pi;
    16f0:	89 f0                	mov    %esi,%eax
      name[2] = '\0';
    16f2:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
      name[0] = 'p' + pi;
    16f6:	88 45 c8             	mov    %al,-0x38(%ebp)
      for(i = 0; i < N; i++){
    16f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        name[1] = '0' + i;
    1700:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    1703:	83 ec 08             	sub    $0x8,%esp
        name[1] = '0' + i;
    1706:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    1709:	8d 45 c8             	lea    -0x38(%ebp),%eax
    170c:	68 02 02 00 00       	push   $0x202
    1711:	50                   	push   %eax
    1712:	e8 db 2e 00 00       	call   45f2 <open>
        if(fd < 0){
    1717:	83 c4 10             	add    $0x10,%esp
        fd = open(name, O_CREATE | O_RDWR);
    171a:	89 c7                	mov    %eax,%edi
        if(fd < 0){
    171c:	85 c0                	test   %eax,%eax
    171e:	78 40                	js     1760 <createdelete+0x1e0>
        close(fd);
    1720:	83 ec 0c             	sub    $0xc,%esp
    1723:	57                   	push   %edi
    1724:	e8 b1 2e 00 00       	call   45da <close>
        if(i > 0 && (i % 2 ) == 0){
    1729:	83 c4 10             	add    $0x10,%esp
    172c:	85 db                	test   %ebx,%ebx
    172e:	74 20                	je     1750 <createdelete+0x1d0>
    1730:	f6 c3 01             	test   $0x1,%bl
    1733:	74 4b                	je     1780 <createdelete+0x200>
      for(i = 0; i < N; i++){
    1735:	83 c3 01             	add    $0x1,%ebx
    1738:	83 fb 14             	cmp    $0x14,%ebx
    173b:	75 c3                	jne    1700 <createdelete+0x180>
      exit(0);
    173d:	83 ec 0c             	sub    $0xc,%esp
    1740:	6a 00                	push   $0x0
    1742:	e8 6b 2e 00 00       	call   45b2 <exit>
    1747:	83 c4 10             	add    $0x10,%esp
    174a:	e9 63 fe ff ff       	jmp    15b2 <createdelete+0x32>
    174f:	90                   	nop
      for(i = 0; i < N; i++){
    1750:	bb 01 00 00 00       	mov    $0x1,%ebx
    1755:	eb a9                	jmp    1700 <createdelete+0x180>
    1757:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    175e:	00 
    175f:	90                   	nop
          printf(1, "create failed\n");
    1760:	83 ec 08             	sub    $0x8,%esp
    1763:	68 4f 51 00 00       	push   $0x514f
    1768:	6a 01                	push   $0x1
    176a:	e8 d1 2f 00 00       	call   4740 <printf>
          exit(0);
    176f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1776:	e8 37 2e 00 00       	call   45b2 <exit>
    177b:	83 c4 10             	add    $0x10,%esp
    177e:	eb a0                	jmp    1720 <createdelete+0x1a0>
          name[1] = '0' + (i / 2);
    1780:	89 d8                	mov    %ebx,%eax
          if(unlink(name) < 0){
    1782:	83 ec 0c             	sub    $0xc,%esp
          name[1] = '0' + (i / 2);
    1785:	d1 f8                	sar    $1,%eax
    1787:	83 c0 30             	add    $0x30,%eax
    178a:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    178d:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1790:	50                   	push   %eax
    1791:	e8 6c 2e 00 00       	call   4602 <unlink>
    1796:	83 c4 10             	add    $0x10,%esp
    1799:	85 c0                	test   %eax,%eax
    179b:	79 98                	jns    1735 <createdelete+0x1b5>
            printf(1, "unlink failed\n");
    179d:	83 ec 08             	sub    $0x8,%esp
    17a0:	68 01 4b 00 00       	push   $0x4b01
    17a5:	6a 01                	push   $0x1
    17a7:	e8 94 2f 00 00       	call   4740 <printf>
            exit(0);
    17ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    17b3:	e8 fa 2d 00 00       	call   45b2 <exit>
    17b8:	83 c4 10             	add    $0x10,%esp
    17bb:	e9 75 ff ff ff       	jmp    1735 <createdelete+0x1b5>
      printf(1, "fork failed\n");
    17c0:	83 ec 08             	sub    $0x8,%esp
    17c3:	68 89 59 00 00       	push   $0x5989
    17c8:	6a 01                	push   $0x1
    17ca:	e8 71 2f 00 00       	call   4740 <printf>
      exit(0);
    17cf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    17d6:	e8 d7 2d 00 00       	call   45b2 <exit>
    17db:	83 c4 10             	add    $0x10,%esp
    17de:	e9 cf fd ff ff       	jmp    15b2 <createdelete+0x32>
    17e3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    17ea:	00 
    17eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000017f0 <unlinkread>:
{
    17f0:	55                   	push   %ebp
    17f1:	89 e5                	mov    %esp,%ebp
    17f3:	56                   	push   %esi
    17f4:	53                   	push   %ebx
  printf(1, "unlinkread test\n");
    17f5:	83 ec 08             	sub    $0x8,%esp
    17f8:	68 24 4f 00 00       	push   $0x4f24
    17fd:	6a 01                	push   $0x1
    17ff:	e8 3c 2f 00 00       	call   4740 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1804:	5e                   	pop    %esi
    1805:	58                   	pop    %eax
    1806:	68 02 02 00 00       	push   $0x202
    180b:	68 35 4f 00 00       	push   $0x4f35
    1810:	e8 dd 2d 00 00       	call   45f2 <open>
  if(fd < 0){
    1815:	83 c4 10             	add    $0x10,%esp
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1818:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    181a:	85 c0                	test   %eax,%eax
    181c:	0f 88 8e 01 00 00    	js     19b0 <unlinkread+0x1c0>
  write(fd, "hello", 5);
    1822:	83 ec 04             	sub    $0x4,%esp
    1825:	6a 05                	push   $0x5
    1827:	68 5a 4f 00 00       	push   $0x4f5a
    182c:	53                   	push   %ebx
    182d:	e8 a0 2d 00 00       	call   45d2 <write>
  close(fd);
    1832:	89 1c 24             	mov    %ebx,(%esp)
    1835:	e8 a0 2d 00 00       	call   45da <close>
  fd = open("unlinkread", O_RDWR);
    183a:	59                   	pop    %ecx
    183b:	5b                   	pop    %ebx
    183c:	6a 02                	push   $0x2
    183e:	68 35 4f 00 00       	push   $0x4f35
    1843:	e8 aa 2d 00 00       	call   45f2 <open>
  if(fd < 0){
    1848:	83 c4 10             	add    $0x10,%esp
  fd = open("unlinkread", O_RDWR);
    184b:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    184d:	85 c0                	test   %eax,%eax
    184f:	0f 88 33 01 00 00    	js     1988 <unlinkread+0x198>
  if(unlink("unlinkread") != 0){
    1855:	83 ec 0c             	sub    $0xc,%esp
    1858:	68 35 4f 00 00       	push   $0x4f35
    185d:	e8 a0 2d 00 00       	call   4602 <unlink>
    1862:	83 c4 10             	add    $0x10,%esp
    1865:	85 c0                	test   %eax,%eax
    1867:	0f 85 f3 00 00 00    	jne    1960 <unlinkread+0x170>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    186d:	83 ec 08             	sub    $0x8,%esp
    1870:	68 02 02 00 00       	push   $0x202
    1875:	68 35 4f 00 00       	push   $0x4f35
    187a:	e8 73 2d 00 00       	call   45f2 <open>
  write(fd1, "yyy", 3);
    187f:	83 c4 0c             	add    $0xc,%esp
    1882:	6a 03                	push   $0x3
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1884:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    1886:	68 92 4f 00 00       	push   $0x4f92
    188b:	50                   	push   %eax
    188c:	e8 41 2d 00 00       	call   45d2 <write>
  close(fd1);
    1891:	89 34 24             	mov    %esi,(%esp)
    1894:	e8 41 2d 00 00       	call   45da <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    1899:	83 c4 0c             	add    $0xc,%esp
    189c:	68 00 20 00 00       	push   $0x2000
    18a1:	68 e0 92 00 00       	push   $0x92e0
    18a6:	53                   	push   %ebx
    18a7:	e8 1e 2d 00 00       	call   45ca <read>
    18ac:	83 c4 10             	add    $0x10,%esp
    18af:	83 f8 05             	cmp    $0x5,%eax
    18b2:	74 1e                	je     18d2 <unlinkread+0xe2>
    printf(1, "unlinkread read failed");
    18b4:	83 ec 08             	sub    $0x8,%esp
    18b7:	68 96 4f 00 00       	push   $0x4f96
    18bc:	6a 01                	push   $0x1
    18be:	e8 7d 2e 00 00       	call   4740 <printf>
    exit(0);
    18c3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18ca:	e8 e3 2c 00 00       	call   45b2 <exit>
    18cf:	83 c4 10             	add    $0x10,%esp
  if(buf[0] != 'h'){
    18d2:	80 3d e0 92 00 00 68 	cmpb   $0x68,0x92e0
    18d9:	74 1e                	je     18f9 <unlinkread+0x109>
    printf(1, "unlinkread wrong data\n");
    18db:	83 ec 08             	sub    $0x8,%esp
    18de:	68 ad 4f 00 00       	push   $0x4fad
    18e3:	6a 01                	push   $0x1
    18e5:	e8 56 2e 00 00       	call   4740 <printf>
    exit(0);
    18ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18f1:	e8 bc 2c 00 00       	call   45b2 <exit>
    18f6:	83 c4 10             	add    $0x10,%esp
  if(write(fd, buf, 10) != 10){
    18f9:	83 ec 04             	sub    $0x4,%esp
    18fc:	6a 0a                	push   $0xa
    18fe:	68 e0 92 00 00       	push   $0x92e0
    1903:	53                   	push   %ebx
    1904:	e8 c9 2c 00 00       	call   45d2 <write>
    1909:	83 c4 10             	add    $0x10,%esp
    190c:	83 f8 0a             	cmp    $0xa,%eax
    190f:	74 1e                	je     192f <unlinkread+0x13f>
    printf(1, "unlinkread write failed\n");
    1911:	83 ec 08             	sub    $0x8,%esp
    1914:	68 c4 4f 00 00       	push   $0x4fc4
    1919:	6a 01                	push   $0x1
    191b:	e8 20 2e 00 00       	call   4740 <printf>
    exit(0);
    1920:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1927:	e8 86 2c 00 00       	call   45b2 <exit>
    192c:	83 c4 10             	add    $0x10,%esp
  close(fd);
    192f:	83 ec 0c             	sub    $0xc,%esp
    1932:	53                   	push   %ebx
    1933:	e8 a2 2c 00 00       	call   45da <close>
  unlink("unlinkread");
    1938:	c7 04 24 35 4f 00 00 	movl   $0x4f35,(%esp)
    193f:	e8 be 2c 00 00       	call   4602 <unlink>
  printf(1, "unlinkread ok\n");
    1944:	58                   	pop    %eax
    1945:	5a                   	pop    %edx
    1946:	68 dd 4f 00 00       	push   $0x4fdd
    194b:	6a 01                	push   $0x1
    194d:	e8 ee 2d 00 00       	call   4740 <printf>
}
    1952:	83 c4 10             	add    $0x10,%esp
    1955:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1958:	5b                   	pop    %ebx
    1959:	5e                   	pop    %esi
    195a:	5d                   	pop    %ebp
    195b:	c3                   	ret
    195c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "unlink unlinkread failed\n");
    1960:	83 ec 08             	sub    $0x8,%esp
    1963:	68 78 4f 00 00       	push   $0x4f78
    1968:	6a 01                	push   $0x1
    196a:	e8 d1 2d 00 00       	call   4740 <printf>
    exit(0);
    196f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1976:	e8 37 2c 00 00       	call   45b2 <exit>
    197b:	83 c4 10             	add    $0x10,%esp
    197e:	e9 ea fe ff ff       	jmp    186d <unlinkread+0x7d>
    1983:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "open unlinkread failed\n");
    1988:	83 ec 08             	sub    $0x8,%esp
    198b:	68 60 4f 00 00       	push   $0x4f60
    1990:	6a 01                	push   $0x1
    1992:	e8 a9 2d 00 00       	call   4740 <printf>
    exit(0);
    1997:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    199e:	e8 0f 2c 00 00       	call   45b2 <exit>
    19a3:	83 c4 10             	add    $0x10,%esp
    19a6:	e9 aa fe ff ff       	jmp    1855 <unlinkread+0x65>
    19ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "create unlinkread failed\n");
    19b0:	83 ec 08             	sub    $0x8,%esp
    19b3:	68 40 4f 00 00       	push   $0x4f40
    19b8:	6a 01                	push   $0x1
    19ba:	e8 81 2d 00 00       	call   4740 <printf>
    exit(0);
    19bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19c6:	e8 e7 2b 00 00       	call   45b2 <exit>
    19cb:	83 c4 10             	add    $0x10,%esp
    19ce:	e9 4f fe ff ff       	jmp    1822 <unlinkread+0x32>
    19d3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    19da:	00 
    19db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000019e0 <linktest>:
{
    19e0:	55                   	push   %ebp
    19e1:	89 e5                	mov    %esp,%ebp
    19e3:	53                   	push   %ebx
    19e4:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "linktest\n");
    19e7:	68 ec 4f 00 00       	push   $0x4fec
    19ec:	6a 01                	push   $0x1
    19ee:	e8 4d 2d 00 00       	call   4740 <printf>
  unlink("lf1");
    19f3:	c7 04 24 f6 4f 00 00 	movl   $0x4ff6,(%esp)
    19fa:	e8 03 2c 00 00       	call   4602 <unlink>
  unlink("lf2");
    19ff:	c7 04 24 fa 4f 00 00 	movl   $0x4ffa,(%esp)
    1a06:	e8 f7 2b 00 00       	call   4602 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    1a0b:	58                   	pop    %eax
    1a0c:	5a                   	pop    %edx
    1a0d:	68 02 02 00 00       	push   $0x202
    1a12:	68 f6 4f 00 00       	push   $0x4ff6
    1a17:	e8 d6 2b 00 00       	call   45f2 <open>
  if(fd < 0){
    1a1c:	83 c4 10             	add    $0x10,%esp
  fd = open("lf1", O_CREATE|O_RDWR);
    1a1f:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1a21:	85 c0                	test   %eax,%eax
    1a23:	0f 88 17 02 00 00    	js     1c40 <linktest+0x260>
  if(write(fd, "hello", 5) != 5){
    1a29:	83 ec 04             	sub    $0x4,%esp
    1a2c:	6a 05                	push   $0x5
    1a2e:	68 5a 4f 00 00       	push   $0x4f5a
    1a33:	53                   	push   %ebx
    1a34:	e8 99 2b 00 00       	call   45d2 <write>
    1a39:	83 c4 10             	add    $0x10,%esp
    1a3c:	83 f8 05             	cmp    $0x5,%eax
    1a3f:	74 1e                	je     1a5f <linktest+0x7f>
    printf(1, "write lf1 failed\n");
    1a41:	83 ec 08             	sub    $0x8,%esp
    1a44:	68 11 50 00 00       	push   $0x5011
    1a49:	6a 01                	push   $0x1
    1a4b:	e8 f0 2c 00 00       	call   4740 <printf>
    exit(0);
    1a50:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a57:	e8 56 2b 00 00       	call   45b2 <exit>
    1a5c:	83 c4 10             	add    $0x10,%esp
  close(fd);
    1a5f:	83 ec 0c             	sub    $0xc,%esp
    1a62:	53                   	push   %ebx
    1a63:	e8 72 2b 00 00       	call   45da <close>
  if(link("lf1", "lf2") < 0){
    1a68:	59                   	pop    %ecx
    1a69:	5b                   	pop    %ebx
    1a6a:	68 fa 4f 00 00       	push   $0x4ffa
    1a6f:	68 f6 4f 00 00       	push   $0x4ff6
    1a74:	e8 99 2b 00 00       	call   4612 <link>
    1a79:	83 c4 10             	add    $0x10,%esp
    1a7c:	85 c0                	test   %eax,%eax
    1a7e:	0f 88 94 01 00 00    	js     1c18 <linktest+0x238>
  unlink("lf1");
    1a84:	83 ec 0c             	sub    $0xc,%esp
    1a87:	68 f6 4f 00 00       	push   $0x4ff6
    1a8c:	e8 71 2b 00 00       	call   4602 <unlink>
  if(open("lf1", 0) >= 0){
    1a91:	58                   	pop    %eax
    1a92:	5a                   	pop    %edx
    1a93:	6a 00                	push   $0x0
    1a95:	68 f6 4f 00 00       	push   $0x4ff6
    1a9a:	e8 53 2b 00 00       	call   45f2 <open>
    1a9f:	83 c4 10             	add    $0x10,%esp
    1aa2:	85 c0                	test   %eax,%eax
    1aa4:	78 1e                	js     1ac4 <linktest+0xe4>
    printf(1, "unlinked lf1 but it is still there!\n");
    1aa6:	83 ec 08             	sub    $0x8,%esp
    1aa9:	68 0c 5c 00 00       	push   $0x5c0c
    1aae:	6a 01                	push   $0x1
    1ab0:	e8 8b 2c 00 00       	call   4740 <printf>
    exit(0);
    1ab5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1abc:	e8 f1 2a 00 00       	call   45b2 <exit>
    1ac1:	83 c4 10             	add    $0x10,%esp
  fd = open("lf2", 0);
    1ac4:	83 ec 08             	sub    $0x8,%esp
    1ac7:	6a 00                	push   $0x0
    1ac9:	68 fa 4f 00 00       	push   $0x4ffa
    1ace:	e8 1f 2b 00 00       	call   45f2 <open>
  if(fd < 0){
    1ad3:	83 c4 10             	add    $0x10,%esp
  fd = open("lf2", 0);
    1ad6:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1ad8:	85 c0                	test   %eax,%eax
    1ada:	0f 88 10 01 00 00    	js     1bf0 <linktest+0x210>
  if(read(fd, buf, sizeof(buf)) != 5){
    1ae0:	83 ec 04             	sub    $0x4,%esp
    1ae3:	68 00 20 00 00       	push   $0x2000
    1ae8:	68 e0 92 00 00       	push   $0x92e0
    1aed:	53                   	push   %ebx
    1aee:	e8 d7 2a 00 00       	call   45ca <read>
    1af3:	83 c4 10             	add    $0x10,%esp
    1af6:	83 f8 05             	cmp    $0x5,%eax
    1af9:	74 1e                	je     1b19 <linktest+0x139>
    printf(1, "read lf2 failed\n");
    1afb:	83 ec 08             	sub    $0x8,%esp
    1afe:	68 49 50 00 00       	push   $0x5049
    1b03:	6a 01                	push   $0x1
    1b05:	e8 36 2c 00 00       	call   4740 <printf>
    exit(0);
    1b0a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1b11:	e8 9c 2a 00 00       	call   45b2 <exit>
    1b16:	83 c4 10             	add    $0x10,%esp
  close(fd);
    1b19:	83 ec 0c             	sub    $0xc,%esp
    1b1c:	53                   	push   %ebx
    1b1d:	e8 b8 2a 00 00       	call   45da <close>
  if(link("lf2", "lf2") >= 0){
    1b22:	59                   	pop    %ecx
    1b23:	5b                   	pop    %ebx
    1b24:	68 fa 4f 00 00       	push   $0x4ffa
    1b29:	68 fa 4f 00 00       	push   $0x4ffa
    1b2e:	e8 df 2a 00 00       	call   4612 <link>
    1b33:	83 c4 10             	add    $0x10,%esp
    1b36:	85 c0                	test   %eax,%eax
    1b38:	78 1e                	js     1b58 <linktest+0x178>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    1b3a:	83 ec 08             	sub    $0x8,%esp
    1b3d:	68 5a 50 00 00       	push   $0x505a
    1b42:	6a 01                	push   $0x1
    1b44:	e8 f7 2b 00 00       	call   4740 <printf>
    exit(0);
    1b49:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1b50:	e8 5d 2a 00 00       	call   45b2 <exit>
    1b55:	83 c4 10             	add    $0x10,%esp
  unlink("lf2");
    1b58:	83 ec 0c             	sub    $0xc,%esp
    1b5b:	68 fa 4f 00 00       	push   $0x4ffa
    1b60:	e8 9d 2a 00 00       	call   4602 <unlink>
  if(link("lf2", "lf1") >= 0){
    1b65:	58                   	pop    %eax
    1b66:	5a                   	pop    %edx
    1b67:	68 f6 4f 00 00       	push   $0x4ff6
    1b6c:	68 fa 4f 00 00       	push   $0x4ffa
    1b71:	e8 9c 2a 00 00       	call   4612 <link>
    1b76:	83 c4 10             	add    $0x10,%esp
    1b79:	85 c0                	test   %eax,%eax
    1b7b:	78 1e                	js     1b9b <linktest+0x1bb>
    printf(1, "link non-existant succeeded! oops\n");
    1b7d:	83 ec 08             	sub    $0x8,%esp
    1b80:	68 34 5c 00 00       	push   $0x5c34
    1b85:	6a 01                	push   $0x1
    1b87:	e8 b4 2b 00 00       	call   4740 <printf>
    exit(0);
    1b8c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1b93:	e8 1a 2a 00 00       	call   45b2 <exit>
    1b98:	83 c4 10             	add    $0x10,%esp
  if(link(".", "lf1") >= 0){
    1b9b:	83 ec 08             	sub    $0x8,%esp
    1b9e:	68 f6 4f 00 00       	push   $0x4ff6
    1ba3:	68 be 52 00 00       	push   $0x52be
    1ba8:	e8 65 2a 00 00       	call   4612 <link>
    1bad:	83 c4 10             	add    $0x10,%esp
    1bb0:	85 c0                	test   %eax,%eax
    1bb2:	78 1e                	js     1bd2 <linktest+0x1f2>
    printf(1, "link . lf1 succeeded! oops\n");
    1bb4:	83 ec 08             	sub    $0x8,%esp
    1bb7:	68 78 50 00 00       	push   $0x5078
    1bbc:	6a 01                	push   $0x1
    1bbe:	e8 7d 2b 00 00       	call   4740 <printf>
    exit(0);
    1bc3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1bca:	e8 e3 29 00 00       	call   45b2 <exit>
    1bcf:	83 c4 10             	add    $0x10,%esp
  printf(1, "linktest ok\n");
    1bd2:	83 ec 08             	sub    $0x8,%esp
    1bd5:	68 94 50 00 00       	push   $0x5094
    1bda:	6a 01                	push   $0x1
    1bdc:	e8 5f 2b 00 00       	call   4740 <printf>
}
    1be1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1be4:	83 c4 10             	add    $0x10,%esp
    1be7:	c9                   	leave
    1be8:	c3                   	ret
    1be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "open lf2 failed\n");
    1bf0:	83 ec 08             	sub    $0x8,%esp
    1bf3:	68 38 50 00 00       	push   $0x5038
    1bf8:	6a 01                	push   $0x1
    1bfa:	e8 41 2b 00 00       	call   4740 <printf>
    exit(0);
    1bff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c06:	e8 a7 29 00 00       	call   45b2 <exit>
    1c0b:	83 c4 10             	add    $0x10,%esp
    1c0e:	e9 cd fe ff ff       	jmp    1ae0 <linktest+0x100>
    1c13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "link lf1 lf2 failed\n");
    1c18:	83 ec 08             	sub    $0x8,%esp
    1c1b:	68 23 50 00 00       	push   $0x5023
    1c20:	6a 01                	push   $0x1
    1c22:	e8 19 2b 00 00       	call   4740 <printf>
    exit(0);
    1c27:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c2e:	e8 7f 29 00 00       	call   45b2 <exit>
    1c33:	83 c4 10             	add    $0x10,%esp
    1c36:	e9 49 fe ff ff       	jmp    1a84 <linktest+0xa4>
    1c3b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "create lf1 failed\n");
    1c40:	83 ec 08             	sub    $0x8,%esp
    1c43:	68 fe 4f 00 00       	push   $0x4ffe
    1c48:	6a 01                	push   $0x1
    1c4a:	e8 f1 2a 00 00       	call   4740 <printf>
    exit(0);
    1c4f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c56:	e8 57 29 00 00       	call   45b2 <exit>
    1c5b:	83 c4 10             	add    $0x10,%esp
    1c5e:	e9 c6 fd ff ff       	jmp    1a29 <linktest+0x49>
    1c63:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1c6a:	00 
    1c6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00001c70 <concreate>:
{
    1c70:	55                   	push   %ebp
    1c71:	89 e5                	mov    %esp,%ebp
    1c73:	57                   	push   %edi
    1c74:	56                   	push   %esi
  for(i = 0; i < 40; i++){
    1c75:	31 f6                	xor    %esi,%esi
{
    1c77:	53                   	push   %ebx
    1c78:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    1c7b:	83 ec 64             	sub    $0x64,%esp
  printf(1, "concreate test\n");
    1c7e:	68 a1 50 00 00       	push   $0x50a1
    1c83:	6a 01                	push   $0x1
    1c85:	e8 b6 2a 00 00       	call   4740 <printf>
  file[0] = 'C';
    1c8a:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    1c8e:	83 c4 10             	add    $0x10,%esp
    1c91:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
  for(i = 0; i < 40; i++){
    1c95:	eb 4e                	jmp    1ce5 <concreate+0x75>
    1c97:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1c9e:	00 
    1c9f:	90                   	nop
    1ca0:	69 c6 ab aa aa aa    	imul   $0xaaaaaaab,%esi,%eax
    if(pid && (i % 3) == 1){
    1ca6:	3d ab aa aa aa       	cmp    $0xaaaaaaab,%eax
    1cab:	0f 83 9f 01 00 00    	jae    1e50 <concreate+0x1e0>
      fd = open(file, O_CREATE | O_RDWR);
    1cb1:	83 ec 08             	sub    $0x8,%esp
    1cb4:	68 02 02 00 00       	push   $0x202
    1cb9:	53                   	push   %ebx
    1cba:	e8 33 29 00 00       	call   45f2 <open>
      if(fd < 0){
    1cbf:	83 c4 10             	add    $0x10,%esp
      fd = open(file, O_CREATE | O_RDWR);
    1cc2:	89 c7                	mov    %eax,%edi
      if(fd < 0){
    1cc4:	85 c0                	test   %eax,%eax
    1cc6:	0f 88 04 01 00 00    	js     1dd0 <concreate+0x160>
      close(fd);
    1ccc:	83 ec 0c             	sub    $0xc,%esp
    1ccf:	57                   	push   %edi
    1cd0:	e8 05 29 00 00       	call   45da <close>
    1cd5:	83 c4 10             	add    $0x10,%esp
      wait();
    1cd8:	e8 dd 28 00 00       	call   45ba <wait>
  for(i = 0; i < 40; i++){
    1cdd:	83 c6 01             	add    $0x1,%esi
    1ce0:	83 fe 28             	cmp    $0x28,%esi
    1ce3:	74 68                	je     1d4d <concreate+0xdd>
    unlink(file);
    1ce5:	83 ec 0c             	sub    $0xc,%esp
    file[1] = '0' + i;
    1ce8:	8d 46 30             	lea    0x30(%esi),%eax
    1ceb:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1cee:	53                   	push   %ebx
    1cef:	e8 0e 29 00 00       	call   4602 <unlink>
    pid = fork();
    1cf4:	e8 b1 28 00 00       	call   45aa <fork>
    if(pid && (i % 3) == 1){
    1cf9:	83 c4 10             	add    $0x10,%esp
    1cfc:	85 c0                	test   %eax,%eax
    1cfe:	75 a0                	jne    1ca0 <concreate+0x30>
      link("C0", file);
    1d00:	69 c6 cd cc cc cc    	imul   $0xcccccccd,%esi,%eax
    } else if(pid == 0 && (i % 5) == 1){
    1d06:	3d cd cc cc cc       	cmp    $0xcccccccd,%eax
    1d0b:	0f 83 1f 01 00 00    	jae    1e30 <concreate+0x1c0>
      fd = open(file, O_CREATE | O_RDWR);
    1d11:	83 ec 08             	sub    $0x8,%esp
    1d14:	68 02 02 00 00       	push   $0x202
    1d19:	53                   	push   %ebx
    1d1a:	e8 d3 28 00 00       	call   45f2 <open>
      if(fd < 0){
    1d1f:	83 c4 10             	add    $0x10,%esp
      fd = open(file, O_CREATE | O_RDWR);
    1d22:	89 c7                	mov    %eax,%edi
      if(fd < 0){
    1d24:	85 c0                	test   %eax,%eax
    1d26:	0f 88 d4 00 00 00    	js     1e00 <concreate+0x190>
      close(fd);
    1d2c:	83 ec 0c             	sub    $0xc,%esp
    1d2f:	57                   	push   %edi
    1d30:	e8 a5 28 00 00       	call   45da <close>
    1d35:	83 c4 10             	add    $0x10,%esp
      exit(0);
    1d38:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 40; i++){
    1d3b:	83 c6 01             	add    $0x1,%esi
      exit(0);
    1d3e:	6a 00                	push   $0x0
    1d40:	e8 6d 28 00 00       	call   45b2 <exit>
    1d45:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 40; i++){
    1d48:	83 fe 28             	cmp    $0x28,%esi
    1d4b:	75 98                	jne    1ce5 <concreate+0x75>
  memset(fa, 0, sizeof(fa));
    1d4d:	83 ec 04             	sub    $0x4,%esp
    1d50:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1d53:	8d 7d b0             	lea    -0x50(%ebp),%edi
    1d56:	6a 28                	push   $0x28
    1d58:	6a 00                	push   $0x0
    1d5a:	50                   	push   %eax
    1d5b:	e8 c0 26 00 00       	call   4420 <memset>
  fd = open(".", 0);
    1d60:	59                   	pop    %ecx
    1d61:	5e                   	pop    %esi
    1d62:	6a 00                	push   $0x0
    1d64:	68 be 52 00 00       	push   $0x52be
    1d69:	e8 84 28 00 00       	call   45f2 <open>
  n = 0;
    1d6e:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    1d75:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    1d78:	89 c6                	mov    %eax,%esi
  while(read(fd, &de, sizeof(de)) > 0){
    1d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1d80:	83 ec 04             	sub    $0x4,%esp
    1d83:	6a 10                	push   $0x10
    1d85:	57                   	push   %edi
    1d86:	56                   	push   %esi
    1d87:	e8 3e 28 00 00       	call   45ca <read>
    1d8c:	83 c4 10             	add    $0x10,%esp
    1d8f:	85 c0                	test   %eax,%eax
    1d91:	0f 8e d9 00 00 00    	jle    1e70 <concreate+0x200>
    if(de.inum == 0)
    1d97:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1d9c:	74 e2                	je     1d80 <concreate+0x110>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1d9e:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1da2:	75 dc                	jne    1d80 <concreate+0x110>
    1da4:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1da8:	75 d6                	jne    1d80 <concreate+0x110>
      i = de.name[1] - '0';
    1daa:	0f be 55 b3          	movsbl -0x4d(%ebp),%edx
    1dae:	83 ea 30             	sub    $0x30,%edx
      if(i < 0 || i >= sizeof(fa)){
    1db1:	83 fa 27             	cmp    $0x27,%edx
    1db4:	0f 87 46 02 00 00    	ja     2000 <concreate+0x390>
      if(fa[i]){
    1dba:	80 7c 15 c0 00       	cmpb   $0x0,-0x40(%ebp,%edx,1)
    1dbf:	0f 85 0e 02 00 00    	jne    1fd3 <concreate+0x363>
      n++;
    1dc5:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
      fa[i] = 1;
    1dc9:	c6 44 15 c0 01       	movb   $0x1,-0x40(%ebp,%edx,1)
      n++;
    1dce:	eb b0                	jmp    1d80 <concreate+0x110>
        printf(1, "concreate create %s failed\n", file);
    1dd0:	83 ec 04             	sub    $0x4,%esp
    1dd3:	53                   	push   %ebx
    1dd4:	68 f8 50 00 00       	push   $0x50f8
    1dd9:	6a 01                	push   $0x1
    1ddb:	e8 60 29 00 00       	call   4740 <printf>
        exit(0);
    1de0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1de7:	e8 c6 27 00 00       	call   45b2 <exit>
      close(fd);
    1dec:	89 3c 24             	mov    %edi,(%esp)
    1def:	e8 e6 27 00 00       	call   45da <close>
    1df4:	83 c4 10             	add    $0x10,%esp
    1df7:	e9 dc fe ff ff       	jmp    1cd8 <concreate+0x68>
    1dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "concreate create %s failed\n", file);
    1e00:	83 ec 04             	sub    $0x4,%esp
    1e03:	53                   	push   %ebx
    1e04:	68 f8 50 00 00       	push   $0x50f8
    1e09:	6a 01                	push   $0x1
    1e0b:	e8 30 29 00 00       	call   4740 <printf>
        exit(0);
    1e10:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e17:	e8 96 27 00 00       	call   45b2 <exit>
      close(fd);
    1e1c:	89 3c 24             	mov    %edi,(%esp)
    1e1f:	e8 b6 27 00 00       	call   45da <close>
    1e24:	83 c4 10             	add    $0x10,%esp
    1e27:	e9 0c ff ff ff       	jmp    1d38 <concreate+0xc8>
    1e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      link("C0", file);
    1e30:	83 ec 08             	sub    $0x8,%esp
    1e33:	53                   	push   %ebx
    1e34:	68 b1 50 00 00       	push   $0x50b1
    1e39:	e8 d4 27 00 00       	call   4612 <link>
    1e3e:	83 c4 10             	add    $0x10,%esp
    1e41:	e9 f2 fe ff ff       	jmp    1d38 <concreate+0xc8>
    1e46:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1e4d:	00 
    1e4e:	66 90                	xchg   %ax,%ax
      link("C0", file);
    1e50:	83 ec 08             	sub    $0x8,%esp
    1e53:	53                   	push   %ebx
    1e54:	68 b1 50 00 00       	push   $0x50b1
    1e59:	e8 b4 27 00 00       	call   4612 <link>
    1e5e:	83 c4 10             	add    $0x10,%esp
    1e61:	e9 72 fe ff ff       	jmp    1cd8 <concreate+0x68>
    1e66:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    1e6d:	00 
    1e6e:	66 90                	xchg   %ax,%ax
  close(fd);
    1e70:	83 ec 0c             	sub    $0xc,%esp
    1e73:	56                   	push   %esi
    1e74:	e8 61 27 00 00       	call   45da <close>
  if(n != 40){
    1e79:	83 c4 10             	add    $0x10,%esp
    1e7c:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1e80:	0f 85 2a 01 00 00    	jne    1fb0 <concreate+0x340>
  n = 0;
    1e86:	31 f6                	xor    %esi,%esi
    1e88:	eb 1b                	jmp    1ea5 <concreate+0x235>
    1e8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit(0);
    1e90:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 40; i++){
    1e93:	83 c6 01             	add    $0x1,%esi
      exit(0);
    1e96:	6a 00                	push   $0x0
    1e98:	e8 15 27 00 00       	call   45b2 <exit>
    1e9d:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 40; i++){
    1ea0:	83 fe 28             	cmp    $0x28,%esi
    1ea3:	74 6d                	je     1f12 <concreate+0x2a2>
    file[1] = '0' + i;
    1ea5:	8d 46 30             	lea    0x30(%esi),%eax
    1ea8:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    1eab:	e8 fa 26 00 00       	call   45aa <fork>
    1eb0:	89 c7                	mov    %eax,%edi
    if(((i % 3) == 0 && pid == 0) ||
    1eb2:	b8 ab aa aa aa       	mov    $0xaaaaaaab,%eax
    1eb7:	f7 e6                	mul    %esi
    1eb9:	89 d1                	mov    %edx,%ecx
    1ebb:	83 e2 fe             	and    $0xfffffffe,%edx
    1ebe:	d1 e9                	shr    $1,%ecx
    1ec0:	01 ca                	add    %ecx,%edx
    1ec2:	89 f1                	mov    %esi,%ecx
    1ec4:	29 d1                	sub    %edx,%ecx
    if(pid < 0){
    1ec6:	85 ff                	test   %edi,%edi
    1ec8:	0f 88 b2 00 00 00    	js     1f80 <concreate+0x310>
    if(((i % 3) == 0 && pid == 0) ||
    1ece:	89 c8                	mov    %ecx,%eax
    1ed0:	09 f8                	or     %edi,%eax
    1ed2:	74 5c                	je     1f30 <concreate+0x2c0>
       ((i % 3) == 1 && pid != 0)){
    1ed4:	85 ff                	test   %edi,%edi
    1ed6:	74 05                	je     1edd <concreate+0x26d>
    if(((i % 3) == 0 && pid == 0) ||
    1ed8:	83 f9 01             	cmp    $0x1,%ecx
    1edb:	74 53                	je     1f30 <concreate+0x2c0>
      unlink(file);
    1edd:	83 ec 0c             	sub    $0xc,%esp
    1ee0:	53                   	push   %ebx
    1ee1:	e8 1c 27 00 00       	call   4602 <unlink>
      unlink(file);
    1ee6:	89 1c 24             	mov    %ebx,(%esp)
    1ee9:	e8 14 27 00 00       	call   4602 <unlink>
      unlink(file);
    1eee:	89 1c 24             	mov    %ebx,(%esp)
    1ef1:	e8 0c 27 00 00       	call   4602 <unlink>
      unlink(file);
    1ef6:	89 1c 24             	mov    %ebx,(%esp)
    1ef9:	e8 04 27 00 00       	call   4602 <unlink>
    1efe:	83 c4 10             	add    $0x10,%esp
    if(pid == 0)
    1f01:	85 ff                	test   %edi,%edi
    1f03:	74 8b                	je     1e90 <concreate+0x220>
      wait();
    1f05:	e8 b0 26 00 00       	call   45ba <wait>
  for(i = 0; i < 40; i++){
    1f0a:	83 c6 01             	add    $0x1,%esi
    1f0d:	83 fe 28             	cmp    $0x28,%esi
    1f10:	75 93                	jne    1ea5 <concreate+0x235>
  printf(1, "concreate ok\n");
    1f12:	83 ec 08             	sub    $0x8,%esp
    1f15:	68 ea 50 00 00       	push   $0x50ea
    1f1a:	6a 01                	push   $0x1
    1f1c:	e8 1f 28 00 00       	call   4740 <printf>
}
    1f21:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1f24:	5b                   	pop    %ebx
    1f25:	5e                   	pop    %esi
    1f26:	5f                   	pop    %edi
    1f27:	5d                   	pop    %ebp
    1f28:	c3                   	ret
    1f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      close(open(file, 0));
    1f30:	83 ec 08             	sub    $0x8,%esp
    1f33:	6a 00                	push   $0x0
    1f35:	53                   	push   %ebx
    1f36:	e8 b7 26 00 00       	call   45f2 <open>
    1f3b:	89 04 24             	mov    %eax,(%esp)
    1f3e:	e8 97 26 00 00       	call   45da <close>
      close(open(file, 0));
    1f43:	58                   	pop    %eax
    1f44:	5a                   	pop    %edx
    1f45:	6a 00                	push   $0x0
    1f47:	53                   	push   %ebx
    1f48:	e8 a5 26 00 00       	call   45f2 <open>
    1f4d:	89 04 24             	mov    %eax,(%esp)
    1f50:	e8 85 26 00 00       	call   45da <close>
      close(open(file, 0));
    1f55:	59                   	pop    %ecx
    1f56:	58                   	pop    %eax
    1f57:	6a 00                	push   $0x0
    1f59:	53                   	push   %ebx
    1f5a:	e8 93 26 00 00       	call   45f2 <open>
    1f5f:	89 04 24             	mov    %eax,(%esp)
    1f62:	e8 73 26 00 00       	call   45da <close>
      close(open(file, 0));
    1f67:	58                   	pop    %eax
    1f68:	5a                   	pop    %edx
    1f69:	6a 00                	push   $0x0
    1f6b:	53                   	push   %ebx
    1f6c:	e8 81 26 00 00       	call   45f2 <open>
    1f71:	89 04 24             	mov    %eax,(%esp)
    1f74:	e8 61 26 00 00       	call   45da <close>
    1f79:	83 c4 10             	add    $0x10,%esp
    1f7c:	eb 83                	jmp    1f01 <concreate+0x291>
    1f7e:	66 90                	xchg   %ax,%ax
      printf(1, "fork failed\n");
    1f80:	83 ec 08             	sub    $0x8,%esp
    1f83:	89 4d a4             	mov    %ecx,-0x5c(%ebp)
    1f86:	68 89 59 00 00       	push   $0x5989
    1f8b:	6a 01                	push   $0x1
    1f8d:	e8 ae 27 00 00       	call   4740 <printf>
      exit(0);
    1f92:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f99:	e8 14 26 00 00       	call   45b2 <exit>
    if(((i % 3) == 0 && pid == 0) ||
    1f9e:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
    1fa1:	83 c4 10             	add    $0x10,%esp
    1fa4:	e9 2f ff ff ff       	jmp    1ed8 <concreate+0x268>
    1fa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "concreate not enough files in directory listing\n");
    1fb0:	83 ec 08             	sub    $0x8,%esp
    1fb3:	68 58 5c 00 00       	push   $0x5c58
    1fb8:	6a 01                	push   $0x1
    1fba:	e8 81 27 00 00       	call   4740 <printf>
    exit(0);
    1fbf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1fc6:	e8 e7 25 00 00       	call   45b2 <exit>
    1fcb:	83 c4 10             	add    $0x10,%esp
    1fce:	e9 b3 fe ff ff       	jmp    1e86 <concreate+0x216>
        printf(1, "concreate duplicate file %s\n", de.name);
    1fd3:	83 ec 04             	sub    $0x4,%esp
    1fd6:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1fd9:	89 55 a0             	mov    %edx,-0x60(%ebp)
    1fdc:	50                   	push   %eax
    1fdd:	68 cd 50 00 00       	push   $0x50cd
    1fe2:	6a 01                	push   $0x1
    1fe4:	e8 57 27 00 00       	call   4740 <printf>
        exit(0);
    1fe9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ff0:	e8 bd 25 00 00       	call   45b2 <exit>
    1ff5:	8b 55 a0             	mov    -0x60(%ebp),%edx
    1ff8:	83 c4 10             	add    $0x10,%esp
    1ffb:	e9 c5 fd ff ff       	jmp    1dc5 <concreate+0x155>
        printf(1, "concreate weird file %s\n", de.name);
    2000:	83 ec 04             	sub    $0x4,%esp
    2003:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    2006:	89 55 a0             	mov    %edx,-0x60(%ebp)
    2009:	50                   	push   %eax
    200a:	68 b4 50 00 00       	push   $0x50b4
    200f:	6a 01                	push   $0x1
    2011:	e8 2a 27 00 00       	call   4740 <printf>
        exit(0);
    2016:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    201d:	e8 90 25 00 00       	call   45b2 <exit>
    2022:	8b 55 a0             	mov    -0x60(%ebp),%edx
    2025:	83 c4 10             	add    $0x10,%esp
    2028:	e9 8d fd ff ff       	jmp    1dba <concreate+0x14a>
    202d:	8d 76 00             	lea    0x0(%esi),%esi

00002030 <linkunlink>:
{
    2030:	55                   	push   %ebp
    2031:	89 e5                	mov    %esp,%ebp
    2033:	57                   	push   %edi
    2034:	56                   	push   %esi
    2035:	53                   	push   %ebx
    2036:	83 ec 24             	sub    $0x24,%esp
  printf(1, "linkunlink test\n");
    2039:	68 14 51 00 00       	push   $0x5114
    203e:	6a 01                	push   $0x1
    2040:	e8 fb 26 00 00       	call   4740 <printf>
  unlink("x");
    2045:	c7 04 24 a1 53 00 00 	movl   $0x53a1,(%esp)
    204c:	e8 b1 25 00 00       	call   4602 <unlink>
  pid = fork();
    2051:	e8 54 25 00 00       	call   45aa <fork>
  if(pid < 0){
    2056:	83 c4 10             	add    $0x10,%esp
  pid = fork();
    2059:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    205c:	85 c0                	test   %eax,%eax
    205e:	0f 88 cd 00 00 00    	js     2131 <linkunlink+0x101>
  unsigned int x = (pid ? 1 : 97);
    2064:	0f 85 e5 00 00 00    	jne    214f <linkunlink+0x11f>
    206a:	bf 61 00 00 00       	mov    $0x61,%edi
    206f:	bb 64 00 00 00       	mov    $0x64,%ebx
    if((x % 3) == 0){
    2074:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
    2079:	eb 23                	jmp    209e <linkunlink+0x6e>
    207b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    } else if((x % 3) == 1){
    2080:	83 f8 01             	cmp    $0x1,%eax
    2083:	0f 84 87 00 00 00    	je     2110 <linkunlink+0xe0>
      unlink("x");
    2089:	83 ec 0c             	sub    $0xc,%esp
    208c:	68 a1 53 00 00       	push   $0x53a1
    2091:	e8 6c 25 00 00       	call   4602 <unlink>
    2096:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    2099:	83 eb 01             	sub    $0x1,%ebx
    209c:	74 41                	je     20df <linkunlink+0xaf>
    x = x * 1103515245 + 12345;
    209e:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    20a4:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    20aa:	89 f8                	mov    %edi,%eax
    20ac:	f7 e6                	mul    %esi
    20ae:	89 d0                	mov    %edx,%eax
    20b0:	83 e2 fe             	and    $0xfffffffe,%edx
    20b3:	d1 e8                	shr    $1,%eax
    20b5:	01 c2                	add    %eax,%edx
    20b7:	89 f8                	mov    %edi,%eax
    20b9:	29 d0                	sub    %edx,%eax
    20bb:	75 c3                	jne    2080 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    20bd:	83 ec 08             	sub    $0x8,%esp
    20c0:	68 02 02 00 00       	push   $0x202
    20c5:	68 a1 53 00 00       	push   $0x53a1
    20ca:	e8 23 25 00 00       	call   45f2 <open>
    20cf:	89 04 24             	mov    %eax,(%esp)
    20d2:	e8 03 25 00 00       	call   45da <close>
    20d7:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    20da:	83 eb 01             	sub    $0x1,%ebx
    20dd:	75 bf                	jne    209e <linkunlink+0x6e>
  if(pid)
    20df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    20e2:	85 c0                	test   %eax,%eax
    20e4:	75 44                	jne    212a <linkunlink+0xfa>
    exit(0);
    20e6:	83 ec 0c             	sub    $0xc,%esp
    20e9:	6a 00                	push   $0x0
    20eb:	e8 c2 24 00 00       	call   45b2 <exit>
    20f0:	83 c4 10             	add    $0x10,%esp
  printf(1, "linkunlink ok\n");
    20f3:	83 ec 08             	sub    $0x8,%esp
    20f6:	68 29 51 00 00       	push   $0x5129
    20fb:	6a 01                	push   $0x1
    20fd:	e8 3e 26 00 00       	call   4740 <printf>
}
    2102:	83 c4 10             	add    $0x10,%esp
    2105:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2108:	5b                   	pop    %ebx
    2109:	5e                   	pop    %esi
    210a:	5f                   	pop    %edi
    210b:	5d                   	pop    %ebp
    210c:	c3                   	ret
    210d:	8d 76 00             	lea    0x0(%esi),%esi
      link("cat", "x");
    2110:	83 ec 08             	sub    $0x8,%esp
    2113:	68 a1 53 00 00       	push   $0x53a1
    2118:	68 25 51 00 00       	push   $0x5125
    211d:	e8 f0 24 00 00       	call   4612 <link>
    2122:	83 c4 10             	add    $0x10,%esp
    2125:	e9 6f ff ff ff       	jmp    2099 <linkunlink+0x69>
    wait();
    212a:	e8 8b 24 00 00       	call   45ba <wait>
    212f:	eb c2                	jmp    20f3 <linkunlink+0xc3>
    printf(1, "fork failed\n");
    2131:	83 ec 08             	sub    $0x8,%esp
    2134:	68 89 59 00 00       	push   $0x5989
    2139:	6a 01                	push   $0x1
    213b:	e8 00 26 00 00       	call   4740 <printf>
    exit(0);
    2140:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2147:	e8 66 24 00 00       	call   45b2 <exit>
    214c:	83 c4 10             	add    $0x10,%esp
  unsigned int x = (pid ? 1 : 97);
    214f:	bf 01 00 00 00       	mov    $0x1,%edi
    2154:	e9 16 ff ff ff       	jmp    206f <linkunlink+0x3f>
    2159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00002160 <bigdir>:
{
    2160:	55                   	push   %ebp
    2161:	89 e5                	mov    %esp,%ebp
    2163:	56                   	push   %esi
    2164:	53                   	push   %ebx
    2165:	83 ec 18             	sub    $0x18,%esp
  printf(1, "bigdir test\n");
    2168:	68 38 51 00 00       	push   $0x5138
    216d:	6a 01                	push   $0x1
    216f:	e8 cc 25 00 00       	call   4740 <printf>
  unlink("bd");
    2174:	c7 04 24 45 51 00 00 	movl   $0x5145,(%esp)
    217b:	e8 82 24 00 00       	call   4602 <unlink>
  fd = open("bd", O_CREATE);
    2180:	58                   	pop    %eax
    2181:	5a                   	pop    %edx
    2182:	68 00 02 00 00       	push   $0x200
    2187:	68 45 51 00 00       	push   $0x5145
    218c:	e8 61 24 00 00       	call   45f2 <open>
  if(fd < 0){
    2191:	83 c4 10             	add    $0x10,%esp
  fd = open("bd", O_CREATE);
    2194:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    2196:	85 c0                	test   %eax,%eax
    2198:	0f 88 15 01 00 00    	js     22b3 <bigdir+0x153>
  close(fd);
    219e:	83 ec 0c             	sub    $0xc,%esp
    21a1:	8d 75 ee             	lea    -0x12(%ebp),%esi
    21a4:	53                   	push   %ebx
  for(i = 0; i < 500; i++){
    21a5:	31 db                	xor    %ebx,%ebx
  close(fd);
    21a7:	e8 2e 24 00 00       	call   45da <close>
    21ac:	83 c4 10             	add    $0x10,%esp
    21af:	eb 12                	jmp    21c3 <bigdir+0x63>
    21b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 500; i++){
    21b8:	83 c3 01             	add    $0x1,%ebx
    21bb:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    21c1:	74 5c                	je     221f <bigdir+0xbf>
    name[1] = '0' + (i / 64);
    21c3:	89 d8                	mov    %ebx,%eax
    if(link("bd", name) != 0){
    21c5:	83 ec 08             	sub    $0x8,%esp
    name[0] = 'x';
    21c8:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    21cc:	c1 f8 06             	sar    $0x6,%eax
    name[3] = '\0';
    21cf:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    name[1] = '0' + (i / 64);
    21d3:	83 c0 30             	add    $0x30,%eax
    21d6:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    21d9:	89 d8                	mov    %ebx,%eax
    21db:	83 e0 3f             	and    $0x3f,%eax
    21de:	83 c0 30             	add    $0x30,%eax
    21e1:	88 45 f0             	mov    %al,-0x10(%ebp)
    if(link("bd", name) != 0){
    21e4:	56                   	push   %esi
    21e5:	68 45 51 00 00       	push   $0x5145
    21ea:	e8 23 24 00 00       	call   4612 <link>
    21ef:	83 c4 10             	add    $0x10,%esp
    21f2:	85 c0                	test   %eax,%eax
    21f4:	74 c2                	je     21b8 <bigdir+0x58>
      printf(1, "bigdir link failed\n");
    21f6:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < 500; i++){
    21f9:	83 c3 01             	add    $0x1,%ebx
      printf(1, "bigdir link failed\n");
    21fc:	68 5e 51 00 00       	push   $0x515e
    2201:	6a 01                	push   $0x1
    2203:	e8 38 25 00 00       	call   4740 <printf>
      exit(0);
    2208:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    220f:	e8 9e 23 00 00       	call   45b2 <exit>
    2214:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    2217:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    221d:	75 a4                	jne    21c3 <bigdir+0x63>
  unlink("bd");
    221f:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    2222:	31 db                	xor    %ebx,%ebx
  unlink("bd");
    2224:	68 45 51 00 00       	push   $0x5145
    2229:	e8 d4 23 00 00       	call   4602 <unlink>
    222e:	83 c4 10             	add    $0x10,%esp
    2231:	eb 10                	jmp    2243 <bigdir+0xe3>
    2233:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 500; i++){
    2238:	83 c3 01             	add    $0x1,%ebx
    223b:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    2241:	74 57                	je     229a <bigdir+0x13a>
    name[1] = '0' + (i / 64);
    2243:	89 d8                	mov    %ebx,%eax
    if(unlink(name) != 0){
    2245:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'x';
    2248:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    224c:	c1 f8 06             	sar    $0x6,%eax
    name[3] = '\0';
    224f:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    name[1] = '0' + (i / 64);
    2253:	83 c0 30             	add    $0x30,%eax
    2256:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    2259:	89 d8                	mov    %ebx,%eax
    225b:	83 e0 3f             	and    $0x3f,%eax
    225e:	83 c0 30             	add    $0x30,%eax
    2261:	88 45 f0             	mov    %al,-0x10(%ebp)
    if(unlink(name) != 0){
    2264:	56                   	push   %esi
    2265:	e8 98 23 00 00       	call   4602 <unlink>
    226a:	83 c4 10             	add    $0x10,%esp
    226d:	85 c0                	test   %eax,%eax
    226f:	74 c7                	je     2238 <bigdir+0xd8>
      printf(1, "bigdir unlink failed");
    2271:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < 500; i++){
    2274:	83 c3 01             	add    $0x1,%ebx
      printf(1, "bigdir unlink failed");
    2277:	68 72 51 00 00       	push   $0x5172
    227c:	6a 01                	push   $0x1
    227e:	e8 bd 24 00 00       	call   4740 <printf>
      exit(0);
    2283:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    228a:	e8 23 23 00 00       	call   45b2 <exit>
    228f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    2292:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    2298:	75 a9                	jne    2243 <bigdir+0xe3>
  printf(1, "bigdir ok\n");
    229a:	83 ec 08             	sub    $0x8,%esp
    229d:	68 87 51 00 00       	push   $0x5187
    22a2:	6a 01                	push   $0x1
    22a4:	e8 97 24 00 00       	call   4740 <printf>
}
    22a9:	83 c4 10             	add    $0x10,%esp
    22ac:	8d 65 f8             	lea    -0x8(%ebp),%esp
    22af:	5b                   	pop    %ebx
    22b0:	5e                   	pop    %esi
    22b1:	5d                   	pop    %ebp
    22b2:	c3                   	ret
    printf(1, "bigdir create failed\n");
    22b3:	83 ec 08             	sub    $0x8,%esp
    22b6:	68 48 51 00 00       	push   $0x5148
    22bb:	6a 01                	push   $0x1
    22bd:	e8 7e 24 00 00       	call   4740 <printf>
    exit(0);
    22c2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    22c9:	e8 e4 22 00 00       	call   45b2 <exit>
    22ce:	83 c4 10             	add    $0x10,%esp
    22d1:	e9 c8 fe ff ff       	jmp    219e <bigdir+0x3e>
    22d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    22dd:	00 
    22de:	66 90                	xchg   %ax,%ax

000022e0 <subdir>:
{
    22e0:	55                   	push   %ebp
    22e1:	89 e5                	mov    %esp,%ebp
    22e3:	53                   	push   %ebx
    22e4:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "subdir test\n");
    22e7:	68 92 51 00 00       	push   $0x5192
    22ec:	6a 01                	push   $0x1
    22ee:	e8 4d 24 00 00       	call   4740 <printf>
  unlink("ff");
    22f3:	c7 04 24 1b 52 00 00 	movl   $0x521b,(%esp)
    22fa:	e8 03 23 00 00       	call   4602 <unlink>
  if(mkdir("dd") != 0){
    22ff:	c7 04 24 b8 52 00 00 	movl   $0x52b8,(%esp)
    2306:	e8 0f 23 00 00       	call   461a <mkdir>
    230b:	83 c4 10             	add    $0x10,%esp
    230e:	85 c0                	test   %eax,%eax
    2310:	0f 85 3a 08 00 00    	jne    2b50 <subdir+0x870>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    2316:	83 ec 08             	sub    $0x8,%esp
    2319:	68 02 02 00 00       	push   $0x202
    231e:	68 f1 51 00 00       	push   $0x51f1
    2323:	e8 ca 22 00 00       	call   45f2 <open>
  if(fd < 0){
    2328:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/ff", O_CREATE | O_RDWR);
    232b:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    232d:	85 c0                	test   %eax,%eax
    232f:	0f 88 6b 08 00 00    	js     2ba0 <subdir+0x8c0>
  write(fd, "ff", 2);
    2335:	83 ec 04             	sub    $0x4,%esp
    2338:	6a 02                	push   $0x2
    233a:	68 1b 52 00 00       	push   $0x521b
    233f:	53                   	push   %ebx
    2340:	e8 8d 22 00 00       	call   45d2 <write>
  close(fd);
    2345:	89 1c 24             	mov    %ebx,(%esp)
    2348:	e8 8d 22 00 00       	call   45da <close>
  if(unlink("dd") >= 0){
    234d:	c7 04 24 b8 52 00 00 	movl   $0x52b8,(%esp)
    2354:	e8 a9 22 00 00       	call   4602 <unlink>
    2359:	83 c4 10             	add    $0x10,%esp
    235c:	85 c0                	test   %eax,%eax
    235e:	78 1e                	js     237e <subdir+0x9e>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    2360:	83 ec 08             	sub    $0x8,%esp
    2363:	68 8c 5c 00 00       	push   $0x5c8c
    2368:	6a 01                	push   $0x1
    236a:	e8 d1 23 00 00       	call   4740 <printf>
    exit(0);
    236f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2376:	e8 37 22 00 00       	call   45b2 <exit>
    237b:	83 c4 10             	add    $0x10,%esp
  if(mkdir("/dd/dd") != 0){
    237e:	83 ec 0c             	sub    $0xc,%esp
    2381:	68 cc 51 00 00       	push   $0x51cc
    2386:	e8 8f 22 00 00       	call   461a <mkdir>
    238b:	83 c4 10             	add    $0x10,%esp
    238e:	85 c0                	test   %eax,%eax
    2390:	0f 85 92 07 00 00    	jne    2b28 <subdir+0x848>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2396:	83 ec 08             	sub    $0x8,%esp
    2399:	68 02 02 00 00       	push   $0x202
    239e:	68 ee 51 00 00       	push   $0x51ee
    23a3:	e8 4a 22 00 00       	call   45f2 <open>
  if(fd < 0){
    23a8:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    23ab:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    23ad:	85 c0                	test   %eax,%eax
    23af:	0f 88 c3 07 00 00    	js     2b78 <subdir+0x898>
  write(fd, "FF", 2);
    23b5:	83 ec 04             	sub    $0x4,%esp
    23b8:	6a 02                	push   $0x2
    23ba:	68 0f 52 00 00       	push   $0x520f
    23bf:	53                   	push   %ebx
    23c0:	e8 0d 22 00 00       	call   45d2 <write>
  close(fd);
    23c5:	89 1c 24             	mov    %ebx,(%esp)
    23c8:	e8 0d 22 00 00       	call   45da <close>
  fd = open("dd/dd/../ff", 0);
    23cd:	58                   	pop    %eax
    23ce:	5a                   	pop    %edx
    23cf:	6a 00                	push   $0x0
    23d1:	68 12 52 00 00       	push   $0x5212
    23d6:	e8 17 22 00 00       	call   45f2 <open>
  if(fd < 0){
    23db:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/../ff", 0);
    23de:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    23e0:	85 c0                	test   %eax,%eax
    23e2:	0f 88 08 08 00 00    	js     2bf0 <subdir+0x910>
  cc = read(fd, buf, sizeof(buf));
    23e8:	83 ec 04             	sub    $0x4,%esp
    23eb:	68 00 20 00 00       	push   $0x2000
    23f0:	68 e0 92 00 00       	push   $0x92e0
    23f5:	53                   	push   %ebx
    23f6:	e8 cf 21 00 00       	call   45ca <read>
  if(cc != 2 || buf[0] != 'f'){
    23fb:	83 c4 10             	add    $0x10,%esp
    23fe:	83 f8 02             	cmp    $0x2,%eax
    2401:	75 09                	jne    240c <subdir+0x12c>
    2403:	80 3d e0 92 00 00 66 	cmpb   $0x66,0x92e0
    240a:	74 1e                	je     242a <subdir+0x14a>
    printf(1, "dd/dd/../ff wrong content\n");
    240c:	83 ec 08             	sub    $0x8,%esp
    240f:	68 37 52 00 00       	push   $0x5237
    2414:	6a 01                	push   $0x1
    2416:	e8 25 23 00 00       	call   4740 <printf>
    exit(0);
    241b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2422:	e8 8b 21 00 00       	call   45b2 <exit>
    2427:	83 c4 10             	add    $0x10,%esp
  close(fd);
    242a:	83 ec 0c             	sub    $0xc,%esp
    242d:	53                   	push   %ebx
    242e:	e8 a7 21 00 00       	call   45da <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    2433:	59                   	pop    %ecx
    2434:	5b                   	pop    %ebx
    2435:	68 52 52 00 00       	push   $0x5252
    243a:	68 ee 51 00 00       	push   $0x51ee
    243f:	e8 ce 21 00 00       	call   4612 <link>
    2444:	83 c4 10             	add    $0x10,%esp
    2447:	85 c0                	test   %eax,%eax
    2449:	0f 85 b1 06 00 00    	jne    2b00 <subdir+0x820>
  if(unlink("dd/dd/ff") != 0){
    244f:	83 ec 0c             	sub    $0xc,%esp
    2452:	68 ee 51 00 00       	push   $0x51ee
    2457:	e8 a6 21 00 00       	call   4602 <unlink>
    245c:	83 c4 10             	add    $0x10,%esp
    245f:	85 c0                	test   %eax,%eax
    2461:	0f 85 71 06 00 00    	jne    2ad8 <subdir+0x7f8>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2467:	83 ec 08             	sub    $0x8,%esp
    246a:	6a 00                	push   $0x0
    246c:	68 ee 51 00 00       	push   $0x51ee
    2471:	e8 7c 21 00 00       	call   45f2 <open>
    2476:	83 c4 10             	add    $0x10,%esp
    2479:	85 c0                	test   %eax,%eax
    247b:	78 1e                	js     249b <subdir+0x1bb>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    247d:	83 ec 08             	sub    $0x8,%esp
    2480:	68 d8 5c 00 00       	push   $0x5cd8
    2485:	6a 01                	push   $0x1
    2487:	e8 b4 22 00 00       	call   4740 <printf>
    exit(0);
    248c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2493:	e8 1a 21 00 00       	call   45b2 <exit>
    2498:	83 c4 10             	add    $0x10,%esp
  if(chdir("dd") != 0){
    249b:	83 ec 0c             	sub    $0xc,%esp
    249e:	68 b8 52 00 00       	push   $0x52b8
    24a3:	e8 7a 21 00 00       	call   4622 <chdir>
    24a8:	83 c4 10             	add    $0x10,%esp
    24ab:	85 c0                	test   %eax,%eax
    24ad:	0f 85 fd 05 00 00    	jne    2ab0 <subdir+0x7d0>
  if(chdir("dd/../../dd") != 0){
    24b3:	83 ec 0c             	sub    $0xc,%esp
    24b6:	68 86 52 00 00       	push   $0x5286
    24bb:	e8 62 21 00 00       	call   4622 <chdir>
    24c0:	83 c4 10             	add    $0x10,%esp
    24c3:	85 c0                	test   %eax,%eax
    24c5:	0f 85 b5 03 00 00    	jne    2880 <subdir+0x5a0>
  if(chdir("dd/../../../dd") != 0){
    24cb:	83 ec 0c             	sub    $0xc,%esp
    24ce:	68 ac 52 00 00       	push   $0x52ac
    24d3:	e8 4a 21 00 00       	call   4622 <chdir>
    24d8:	83 c4 10             	add    $0x10,%esp
    24db:	85 c0                	test   %eax,%eax
    24dd:	0f 85 75 03 00 00    	jne    2858 <subdir+0x578>
  if(chdir("./..") != 0){
    24e3:	83 ec 0c             	sub    $0xc,%esp
    24e6:	68 bb 52 00 00       	push   $0x52bb
    24eb:	e8 32 21 00 00       	call   4622 <chdir>
    24f0:	83 c4 10             	add    $0x10,%esp
    24f3:	85 c0                	test   %eax,%eax
    24f5:	0f 85 35 03 00 00    	jne    2830 <subdir+0x550>
  fd = open("dd/dd/ffff", 0);
    24fb:	83 ec 08             	sub    $0x8,%esp
    24fe:	6a 00                	push   $0x0
    2500:	68 52 52 00 00       	push   $0x5252
    2505:	e8 e8 20 00 00       	call   45f2 <open>
  if(fd < 0){
    250a:	83 c4 10             	add    $0x10,%esp
  fd = open("dd/dd/ffff", 0);
    250d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    250f:	85 c0                	test   %eax,%eax
    2511:	0f 88 01 07 00 00    	js     2c18 <subdir+0x938>
  if(read(fd, buf, sizeof(buf)) != 2){
    2517:	83 ec 04             	sub    $0x4,%esp
    251a:	68 00 20 00 00       	push   $0x2000
    251f:	68 e0 92 00 00       	push   $0x92e0
    2524:	53                   	push   %ebx
    2525:	e8 a0 20 00 00       	call   45ca <read>
    252a:	83 c4 10             	add    $0x10,%esp
    252d:	83 f8 02             	cmp    $0x2,%eax
    2530:	74 1e                	je     2550 <subdir+0x270>
    printf(1, "read dd/dd/ffff wrong len\n");
    2532:	83 ec 08             	sub    $0x8,%esp
    2535:	68 eb 52 00 00       	push   $0x52eb
    253a:	6a 01                	push   $0x1
    253c:	e8 ff 21 00 00       	call   4740 <printf>
    exit(0);
    2541:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2548:	e8 65 20 00 00       	call   45b2 <exit>
    254d:	83 c4 10             	add    $0x10,%esp
  close(fd);
    2550:	83 ec 0c             	sub    $0xc,%esp
    2553:	53                   	push   %ebx
    2554:	e8 81 20 00 00       	call   45da <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2559:	58                   	pop    %eax
    255a:	5a                   	pop    %edx
    255b:	6a 00                	push   $0x0
    255d:	68 ee 51 00 00       	push   $0x51ee
    2562:	e8 8b 20 00 00       	call   45f2 <open>
    2567:	83 c4 10             	add    $0x10,%esp
    256a:	85 c0                	test   %eax,%eax
    256c:	78 1e                	js     258c <subdir+0x2ac>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    256e:	83 ec 08             	sub    $0x8,%esp
    2571:	68 fc 5c 00 00       	push   $0x5cfc
    2576:	6a 01                	push   $0x1
    2578:	e8 c3 21 00 00       	call   4740 <printf>
    exit(0);
    257d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2584:	e8 29 20 00 00       	call   45b2 <exit>
    2589:	83 c4 10             	add    $0x10,%esp
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    258c:	83 ec 08             	sub    $0x8,%esp
    258f:	68 02 02 00 00       	push   $0x202
    2594:	68 06 53 00 00       	push   $0x5306
    2599:	e8 54 20 00 00       	call   45f2 <open>
    259e:	83 c4 10             	add    $0x10,%esp
    25a1:	85 c0                	test   %eax,%eax
    25a3:	78 1e                	js     25c3 <subdir+0x2e3>
    printf(1, "create dd/ff/ff succeeded!\n");
    25a5:	83 ec 08             	sub    $0x8,%esp
    25a8:	68 0f 53 00 00       	push   $0x530f
    25ad:	6a 01                	push   $0x1
    25af:	e8 8c 21 00 00       	call   4740 <printf>
    exit(0);
    25b4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25bb:	e8 f2 1f 00 00       	call   45b2 <exit>
    25c0:	83 c4 10             	add    $0x10,%esp
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    25c3:	83 ec 08             	sub    $0x8,%esp
    25c6:	68 02 02 00 00       	push   $0x202
    25cb:	68 2b 53 00 00       	push   $0x532b
    25d0:	e8 1d 20 00 00       	call   45f2 <open>
    25d5:	83 c4 10             	add    $0x10,%esp
    25d8:	85 c0                	test   %eax,%eax
    25da:	78 1e                	js     25fa <subdir+0x31a>
    printf(1, "create dd/xx/ff succeeded!\n");
    25dc:	83 ec 08             	sub    $0x8,%esp
    25df:	68 34 53 00 00       	push   $0x5334
    25e4:	6a 01                	push   $0x1
    25e6:	e8 55 21 00 00       	call   4740 <printf>
    exit(0);
    25eb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25f2:	e8 bb 1f 00 00       	call   45b2 <exit>
    25f7:	83 c4 10             	add    $0x10,%esp
  if(open("dd", O_CREATE) >= 0){
    25fa:	83 ec 08             	sub    $0x8,%esp
    25fd:	68 00 02 00 00       	push   $0x200
    2602:	68 b8 52 00 00       	push   $0x52b8
    2607:	e8 e6 1f 00 00       	call   45f2 <open>
    260c:	83 c4 10             	add    $0x10,%esp
    260f:	85 c0                	test   %eax,%eax
    2611:	78 1e                	js     2631 <subdir+0x351>
    printf(1, "create dd succeeded!\n");
    2613:	83 ec 08             	sub    $0x8,%esp
    2616:	68 50 53 00 00       	push   $0x5350
    261b:	6a 01                	push   $0x1
    261d:	e8 1e 21 00 00       	call   4740 <printf>
    exit(0);
    2622:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2629:	e8 84 1f 00 00       	call   45b2 <exit>
    262e:	83 c4 10             	add    $0x10,%esp
  if(open("dd", O_RDWR) >= 0){
    2631:	83 ec 08             	sub    $0x8,%esp
    2634:	6a 02                	push   $0x2
    2636:	68 b8 52 00 00       	push   $0x52b8
    263b:	e8 b2 1f 00 00       	call   45f2 <open>
    2640:	83 c4 10             	add    $0x10,%esp
    2643:	85 c0                	test   %eax,%eax
    2645:	78 1e                	js     2665 <subdir+0x385>
    printf(1, "open dd rdwr succeeded!\n");
    2647:	83 ec 08             	sub    $0x8,%esp
    264a:	68 66 53 00 00       	push   $0x5366
    264f:	6a 01                	push   $0x1
    2651:	e8 ea 20 00 00       	call   4740 <printf>
    exit(0);
    2656:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    265d:	e8 50 1f 00 00       	call   45b2 <exit>
    2662:	83 c4 10             	add    $0x10,%esp
  if(open("dd", O_WRONLY) >= 0){
    2665:	83 ec 08             	sub    $0x8,%esp
    2668:	6a 01                	push   $0x1
    266a:	68 b8 52 00 00       	push   $0x52b8
    266f:	e8 7e 1f 00 00       	call   45f2 <open>
    2674:	83 c4 10             	add    $0x10,%esp
    2677:	85 c0                	test   %eax,%eax
    2679:	78 1e                	js     2699 <subdir+0x3b9>
    printf(1, "open dd wronly succeeded!\n");
    267b:	83 ec 08             	sub    $0x8,%esp
    267e:	68 7f 53 00 00       	push   $0x537f
    2683:	6a 01                	push   $0x1
    2685:	e8 b6 20 00 00       	call   4740 <printf>
    exit(0);
    268a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2691:	e8 1c 1f 00 00       	call   45b2 <exit>
    2696:	83 c4 10             	add    $0x10,%esp
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2699:	83 ec 08             	sub    $0x8,%esp
    269c:	68 9a 53 00 00       	push   $0x539a
    26a1:	68 06 53 00 00       	push   $0x5306
    26a6:	e8 67 1f 00 00       	call   4612 <link>
    26ab:	83 c4 10             	add    $0x10,%esp
    26ae:	85 c0                	test   %eax,%eax
    26b0:	0f 84 d2 03 00 00    	je     2a88 <subdir+0x7a8>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    26b6:	83 ec 08             	sub    $0x8,%esp
    26b9:	68 9a 53 00 00       	push   $0x539a
    26be:	68 2b 53 00 00       	push   $0x532b
    26c3:	e8 4a 1f 00 00       	call   4612 <link>
    26c8:	83 c4 10             	add    $0x10,%esp
    26cb:	85 c0                	test   %eax,%eax
    26cd:	0f 84 8d 03 00 00    	je     2a60 <subdir+0x780>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    26d3:	83 ec 08             	sub    $0x8,%esp
    26d6:	68 52 52 00 00       	push   $0x5252
    26db:	68 f1 51 00 00       	push   $0x51f1
    26e0:	e8 2d 1f 00 00       	call   4612 <link>
    26e5:	83 c4 10             	add    $0x10,%esp
    26e8:	85 c0                	test   %eax,%eax
    26ea:	0f 84 48 03 00 00    	je     2a38 <subdir+0x758>
  if(mkdir("dd/ff/ff") == 0){
    26f0:	83 ec 0c             	sub    $0xc,%esp
    26f3:	68 06 53 00 00       	push   $0x5306
    26f8:	e8 1d 1f 00 00       	call   461a <mkdir>
    26fd:	83 c4 10             	add    $0x10,%esp
    2700:	85 c0                	test   %eax,%eax
    2702:	0f 84 08 03 00 00    	je     2a10 <subdir+0x730>
  if(mkdir("dd/xx/ff") == 0){
    2708:	83 ec 0c             	sub    $0xc,%esp
    270b:	68 2b 53 00 00       	push   $0x532b
    2710:	e8 05 1f 00 00       	call   461a <mkdir>
    2715:	83 c4 10             	add    $0x10,%esp
    2718:	85 c0                	test   %eax,%eax
    271a:	0f 84 c8 02 00 00    	je     29e8 <subdir+0x708>
  if(mkdir("dd/dd/ffff") == 0){
    2720:	83 ec 0c             	sub    $0xc,%esp
    2723:	68 52 52 00 00       	push   $0x5252
    2728:	e8 ed 1e 00 00       	call   461a <mkdir>
    272d:	83 c4 10             	add    $0x10,%esp
    2730:	85 c0                	test   %eax,%eax
    2732:	0f 84 88 02 00 00    	je     29c0 <subdir+0x6e0>
  if(unlink("dd/xx/ff") == 0){
    2738:	83 ec 0c             	sub    $0xc,%esp
    273b:	68 2b 53 00 00       	push   $0x532b
    2740:	e8 bd 1e 00 00       	call   4602 <unlink>
    2745:	83 c4 10             	add    $0x10,%esp
    2748:	85 c0                	test   %eax,%eax
    274a:	0f 84 48 02 00 00    	je     2998 <subdir+0x6b8>
  if(unlink("dd/ff/ff") == 0){
    2750:	83 ec 0c             	sub    $0xc,%esp
    2753:	68 06 53 00 00       	push   $0x5306
    2758:	e8 a5 1e 00 00       	call   4602 <unlink>
    275d:	83 c4 10             	add    $0x10,%esp
    2760:	85 c0                	test   %eax,%eax
    2762:	0f 84 08 02 00 00    	je     2970 <subdir+0x690>
  if(chdir("dd/ff") == 0){
    2768:	83 ec 0c             	sub    $0xc,%esp
    276b:	68 f1 51 00 00       	push   $0x51f1
    2770:	e8 ad 1e 00 00       	call   4622 <chdir>
    2775:	83 c4 10             	add    $0x10,%esp
    2778:	85 c0                	test   %eax,%eax
    277a:	0f 84 c8 01 00 00    	je     2948 <subdir+0x668>
  if(chdir("dd/xx") == 0){
    2780:	83 ec 0c             	sub    $0xc,%esp
    2783:	68 9d 53 00 00       	push   $0x539d
    2788:	e8 95 1e 00 00       	call   4622 <chdir>
    278d:	83 c4 10             	add    $0x10,%esp
    2790:	85 c0                	test   %eax,%eax
    2792:	0f 84 88 01 00 00    	je     2920 <subdir+0x640>
  if(unlink("dd/dd/ffff") != 0){
    2798:	83 ec 0c             	sub    $0xc,%esp
    279b:	68 52 52 00 00       	push   $0x5252
    27a0:	e8 5d 1e 00 00       	call   4602 <unlink>
    27a5:	83 c4 10             	add    $0x10,%esp
    27a8:	85 c0                	test   %eax,%eax
    27aa:	0f 85 48 01 00 00    	jne    28f8 <subdir+0x618>
  if(unlink("dd/ff") != 0){
    27b0:	83 ec 0c             	sub    $0xc,%esp
    27b3:	68 f1 51 00 00       	push   $0x51f1
    27b8:	e8 45 1e 00 00       	call   4602 <unlink>
    27bd:	83 c4 10             	add    $0x10,%esp
    27c0:	85 c0                	test   %eax,%eax
    27c2:	0f 85 08 01 00 00    	jne    28d0 <subdir+0x5f0>
  if(unlink("dd") == 0){
    27c8:	83 ec 0c             	sub    $0xc,%esp
    27cb:	68 b8 52 00 00       	push   $0x52b8
    27d0:	e8 2d 1e 00 00       	call   4602 <unlink>
    27d5:	83 c4 10             	add    $0x10,%esp
    27d8:	85 c0                	test   %eax,%eax
    27da:	0f 84 c8 00 00 00    	je     28a8 <subdir+0x5c8>
  if(unlink("dd/dd") < 0){
    27e0:	83 ec 0c             	sub    $0xc,%esp
    27e3:	68 cd 51 00 00       	push   $0x51cd
    27e8:	e8 15 1e 00 00       	call   4602 <unlink>
    27ed:	83 c4 10             	add    $0x10,%esp
    27f0:	85 c0                	test   %eax,%eax
    27f2:	0f 88 d0 03 00 00    	js     2bc8 <subdir+0x8e8>
  if(unlink("dd") < 0){
    27f8:	83 ec 0c             	sub    $0xc,%esp
    27fb:	68 b8 52 00 00       	push   $0x52b8
    2800:	e8 fd 1d 00 00       	call   4602 <unlink>
    2805:	83 c4 10             	add    $0x10,%esp
    2808:	85 c0                	test   %eax,%eax
    280a:	0f 88 30 04 00 00    	js     2c40 <subdir+0x960>
  printf(1, "subdir ok\n");
    2810:	83 ec 08             	sub    $0x8,%esp
    2813:	68 9a 54 00 00       	push   $0x549a
    2818:	6a 01                	push   $0x1
    281a:	e8 21 1f 00 00       	call   4740 <printf>
}
    281f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2822:	83 c4 10             	add    $0x10,%esp
    2825:	c9                   	leave
    2826:	c3                   	ret
    2827:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    282e:	00 
    282f:	90                   	nop
    printf(1, "chdir ./.. failed\n");
    2830:	83 ec 08             	sub    $0x8,%esp
    2833:	68 c0 52 00 00       	push   $0x52c0
    2838:	6a 01                	push   $0x1
    283a:	e8 01 1f 00 00       	call   4740 <printf>
    exit(0);
    283f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2846:	e8 67 1d 00 00       	call   45b2 <exit>
    284b:	83 c4 10             	add    $0x10,%esp
    284e:	e9 a8 fc ff ff       	jmp    24fb <subdir+0x21b>
    2853:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "chdir dd/../../dd failed\n");
    2858:	83 ec 08             	sub    $0x8,%esp
    285b:	68 92 52 00 00       	push   $0x5292
    2860:	6a 01                	push   $0x1
    2862:	e8 d9 1e 00 00       	call   4740 <printf>
    exit(0);
    2867:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    286e:	e8 3f 1d 00 00       	call   45b2 <exit>
    2873:	83 c4 10             	add    $0x10,%esp
    2876:	e9 68 fc ff ff       	jmp    24e3 <subdir+0x203>
    287b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "chdir dd/../../dd failed\n");
    2880:	83 ec 08             	sub    $0x8,%esp
    2883:	68 92 52 00 00       	push   $0x5292
    2888:	6a 01                	push   $0x1
    288a:	e8 b1 1e 00 00       	call   4740 <printf>
    exit(0);
    288f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2896:	e8 17 1d 00 00       	call   45b2 <exit>
    289b:	83 c4 10             	add    $0x10,%esp
    289e:	e9 28 fc ff ff       	jmp    24cb <subdir+0x1eb>
    28a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "unlink non-empty dd succeeded!\n");
    28a8:	83 ec 08             	sub    $0x8,%esp
    28ab:	68 90 5d 00 00       	push   $0x5d90
    28b0:	6a 01                	push   $0x1
    28b2:	e8 89 1e 00 00       	call   4740 <printf>
    exit(0);
    28b7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    28be:	e8 ef 1c 00 00       	call   45b2 <exit>
    28c3:	83 c4 10             	add    $0x10,%esp
    28c6:	e9 15 ff ff ff       	jmp    27e0 <subdir+0x500>
    28cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "unlink dd/ff failed\n");
    28d0:	83 ec 08             	sub    $0x8,%esp
    28d3:	68 5e 54 00 00       	push   $0x545e
    28d8:	6a 01                	push   $0x1
    28da:	e8 61 1e 00 00       	call   4740 <printf>
    exit(0);
    28df:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    28e6:	e8 c7 1c 00 00       	call   45b2 <exit>
    28eb:	83 c4 10             	add    $0x10,%esp
    28ee:	e9 d5 fe ff ff       	jmp    27c8 <subdir+0x4e8>
    28f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "unlink dd/dd/ff failed\n");
    28f8:	83 ec 08             	sub    $0x8,%esp
    28fb:	68 5d 52 00 00       	push   $0x525d
    2900:	6a 01                	push   $0x1
    2902:	e8 39 1e 00 00       	call   4740 <printf>
    exit(0);
    2907:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    290e:	e8 9f 1c 00 00       	call   45b2 <exit>
    2913:	83 c4 10             	add    $0x10,%esp
    2916:	e9 95 fe ff ff       	jmp    27b0 <subdir+0x4d0>
    291b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "chdir dd/xx succeeded!\n");
    2920:	83 ec 08             	sub    $0x8,%esp
    2923:	68 46 54 00 00       	push   $0x5446
    2928:	6a 01                	push   $0x1
    292a:	e8 11 1e 00 00       	call   4740 <printf>
    exit(0);
    292f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2936:	e8 77 1c 00 00       	call   45b2 <exit>
    293b:	83 c4 10             	add    $0x10,%esp
    293e:	e9 55 fe ff ff       	jmp    2798 <subdir+0x4b8>
    2943:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "chdir dd/ff succeeded!\n");
    2948:	83 ec 08             	sub    $0x8,%esp
    294b:	68 2e 54 00 00       	push   $0x542e
    2950:	6a 01                	push   $0x1
    2952:	e8 e9 1d 00 00       	call   4740 <printf>
    exit(0);
    2957:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    295e:	e8 4f 1c 00 00       	call   45b2 <exit>
    2963:	83 c4 10             	add    $0x10,%esp
    2966:	e9 15 fe ff ff       	jmp    2780 <subdir+0x4a0>
    296b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "unlink dd/ff/ff succeeded!\n");
    2970:	83 ec 08             	sub    $0x8,%esp
    2973:	68 12 54 00 00       	push   $0x5412
    2978:	6a 01                	push   $0x1
    297a:	e8 c1 1d 00 00       	call   4740 <printf>
    exit(0);
    297f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2986:	e8 27 1c 00 00       	call   45b2 <exit>
    298b:	83 c4 10             	add    $0x10,%esp
    298e:	e9 d5 fd ff ff       	jmp    2768 <subdir+0x488>
    2993:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2998:	83 ec 08             	sub    $0x8,%esp
    299b:	68 f6 53 00 00       	push   $0x53f6
    29a0:	6a 01                	push   $0x1
    29a2:	e8 99 1d 00 00       	call   4740 <printf>
    exit(0);
    29a7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29ae:	e8 ff 1b 00 00       	call   45b2 <exit>
    29b3:	83 c4 10             	add    $0x10,%esp
    29b6:	e9 95 fd ff ff       	jmp    2750 <subdir+0x470>
    29bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    29c0:	83 ec 08             	sub    $0x8,%esp
    29c3:	68 d9 53 00 00       	push   $0x53d9
    29c8:	6a 01                	push   $0x1
    29ca:	e8 71 1d 00 00       	call   4740 <printf>
    exit(0);
    29cf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29d6:	e8 d7 1b 00 00       	call   45b2 <exit>
    29db:	83 c4 10             	add    $0x10,%esp
    29de:	e9 55 fd ff ff       	jmp    2738 <subdir+0x458>
    29e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    29e8:	83 ec 08             	sub    $0x8,%esp
    29eb:	68 be 53 00 00       	push   $0x53be
    29f0:	6a 01                	push   $0x1
    29f2:	e8 49 1d 00 00       	call   4740 <printf>
    exit(0);
    29f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29fe:	e8 af 1b 00 00       	call   45b2 <exit>
    2a03:	83 c4 10             	add    $0x10,%esp
    2a06:	e9 15 fd ff ff       	jmp    2720 <subdir+0x440>
    2a0b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    2a10:	83 ec 08             	sub    $0x8,%esp
    2a13:	68 a3 53 00 00       	push   $0x53a3
    2a18:	6a 01                	push   $0x1
    2a1a:	e8 21 1d 00 00       	call   4740 <printf>
    exit(0);
    2a1f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a26:	e8 87 1b 00 00       	call   45b2 <exit>
    2a2b:	83 c4 10             	add    $0x10,%esp
    2a2e:	e9 d5 fc ff ff       	jmp    2708 <subdir+0x428>
    2a33:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2a38:	83 ec 08             	sub    $0x8,%esp
    2a3b:	68 6c 5d 00 00       	push   $0x5d6c
    2a40:	6a 01                	push   $0x1
    2a42:	e8 f9 1c 00 00       	call   4740 <printf>
    exit(0);
    2a47:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a4e:	e8 5f 1b 00 00       	call   45b2 <exit>
    2a53:	83 c4 10             	add    $0x10,%esp
    2a56:	e9 95 fc ff ff       	jmp    26f0 <subdir+0x410>
    2a5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2a60:	83 ec 08             	sub    $0x8,%esp
    2a63:	68 48 5d 00 00       	push   $0x5d48
    2a68:	6a 01                	push   $0x1
    2a6a:	e8 d1 1c 00 00       	call   4740 <printf>
    exit(0);
    2a6f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a76:	e8 37 1b 00 00       	call   45b2 <exit>
    2a7b:	83 c4 10             	add    $0x10,%esp
    2a7e:	e9 50 fc ff ff       	jmp    26d3 <subdir+0x3f3>
    2a83:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    2a88:	83 ec 08             	sub    $0x8,%esp
    2a8b:	68 24 5d 00 00       	push   $0x5d24
    2a90:	6a 01                	push   $0x1
    2a92:	e8 a9 1c 00 00       	call   4740 <printf>
    exit(0);
    2a97:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a9e:	e8 0f 1b 00 00       	call   45b2 <exit>
    2aa3:	83 c4 10             	add    $0x10,%esp
    2aa6:	e9 0b fc ff ff       	jmp    26b6 <subdir+0x3d6>
    2aab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "chdir dd failed\n");
    2ab0:	83 ec 08             	sub    $0x8,%esp
    2ab3:	68 75 52 00 00       	push   $0x5275
    2ab8:	6a 01                	push   $0x1
    2aba:	e8 81 1c 00 00       	call   4740 <printf>
    exit(0);
    2abf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ac6:	e8 e7 1a 00 00       	call   45b2 <exit>
    2acb:	83 c4 10             	add    $0x10,%esp
    2ace:	e9 e0 f9 ff ff       	jmp    24b3 <subdir+0x1d3>
    2ad3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "unlink dd/dd/ff failed\n");
    2ad8:	83 ec 08             	sub    $0x8,%esp
    2adb:	68 5d 52 00 00       	push   $0x525d
    2ae0:	6a 01                	push   $0x1
    2ae2:	e8 59 1c 00 00       	call   4740 <printf>
    exit(0);
    2ae7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2aee:	e8 bf 1a 00 00       	call   45b2 <exit>
    2af3:	83 c4 10             	add    $0x10,%esp
    2af6:	e9 6c f9 ff ff       	jmp    2467 <subdir+0x187>
    2afb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2b00:	83 ec 08             	sub    $0x8,%esp
    2b03:	68 b4 5c 00 00       	push   $0x5cb4
    2b08:	6a 01                	push   $0x1
    2b0a:	e8 31 1c 00 00       	call   4740 <printf>
    exit(0);
    2b0f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b16:	e8 97 1a 00 00       	call   45b2 <exit>
    2b1b:	83 c4 10             	add    $0x10,%esp
    2b1e:	e9 2c f9 ff ff       	jmp    244f <subdir+0x16f>
    2b23:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "subdir mkdir dd/dd failed\n");
    2b28:	83 ec 08             	sub    $0x8,%esp
    2b2b:	68 d3 51 00 00       	push   $0x51d3
    2b30:	6a 01                	push   $0x1
    2b32:	e8 09 1c 00 00       	call   4740 <printf>
    exit(0);
    2b37:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b3e:	e8 6f 1a 00 00       	call   45b2 <exit>
    2b43:	83 c4 10             	add    $0x10,%esp
    2b46:	e9 4b f8 ff ff       	jmp    2396 <subdir+0xb6>
    2b4b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "subdir mkdir dd failed\n");
    2b50:	83 ec 08             	sub    $0x8,%esp
    2b53:	68 9f 51 00 00       	push   $0x519f
    2b58:	6a 01                	push   $0x1
    2b5a:	e8 e1 1b 00 00       	call   4740 <printf>
    exit(0);
    2b5f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b66:	e8 47 1a 00 00       	call   45b2 <exit>
    2b6b:	83 c4 10             	add    $0x10,%esp
    2b6e:	e9 a3 f7 ff ff       	jmp    2316 <subdir+0x36>
    2b73:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "create dd/dd/ff failed\n");
    2b78:	83 ec 08             	sub    $0x8,%esp
    2b7b:	68 f7 51 00 00       	push   $0x51f7
    2b80:	6a 01                	push   $0x1
    2b82:	e8 b9 1b 00 00       	call   4740 <printf>
    exit(0);
    2b87:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b8e:	e8 1f 1a 00 00       	call   45b2 <exit>
    2b93:	83 c4 10             	add    $0x10,%esp
    2b96:	e9 1a f8 ff ff       	jmp    23b5 <subdir+0xd5>
    2b9b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "create dd/ff failed\n");
    2ba0:	83 ec 08             	sub    $0x8,%esp
    2ba3:	68 b7 51 00 00       	push   $0x51b7
    2ba8:	6a 01                	push   $0x1
    2baa:	e8 91 1b 00 00       	call   4740 <printf>
    exit(0);
    2baf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2bb6:	e8 f7 19 00 00       	call   45b2 <exit>
    2bbb:	83 c4 10             	add    $0x10,%esp
    2bbe:	e9 72 f7 ff ff       	jmp    2335 <subdir+0x55>
    2bc3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "unlink dd/dd failed\n");
    2bc8:	83 ec 08             	sub    $0x8,%esp
    2bcb:	68 73 54 00 00       	push   $0x5473
    2bd0:	6a 01                	push   $0x1
    2bd2:	e8 69 1b 00 00       	call   4740 <printf>
    exit(0);
    2bd7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2bde:	e8 cf 19 00 00       	call   45b2 <exit>
    2be3:	83 c4 10             	add    $0x10,%esp
    2be6:	e9 0d fc ff ff       	jmp    27f8 <subdir+0x518>
    2beb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "open dd/dd/../ff failed\n");
    2bf0:	83 ec 08             	sub    $0x8,%esp
    2bf3:	68 1e 52 00 00       	push   $0x521e
    2bf8:	6a 01                	push   $0x1
    2bfa:	e8 41 1b 00 00       	call   4740 <printf>
    exit(0);
    2bff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c06:	e8 a7 19 00 00       	call   45b2 <exit>
    2c0b:	83 c4 10             	add    $0x10,%esp
    2c0e:	e9 d5 f7 ff ff       	jmp    23e8 <subdir+0x108>
    2c13:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "open dd/dd/ffff failed\n");
    2c18:	83 ec 08             	sub    $0x8,%esp
    2c1b:	68 d3 52 00 00       	push   $0x52d3
    2c20:	6a 01                	push   $0x1
    2c22:	e8 19 1b 00 00       	call   4740 <printf>
    exit(0);
    2c27:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c2e:	e8 7f 19 00 00       	call   45b2 <exit>
    2c33:	83 c4 10             	add    $0x10,%esp
    2c36:	e9 dc f8 ff ff       	jmp    2517 <subdir+0x237>
    2c3b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "unlink dd failed\n");
    2c40:	83 ec 08             	sub    $0x8,%esp
    2c43:	68 88 54 00 00       	push   $0x5488
    2c48:	6a 01                	push   $0x1
    2c4a:	e8 f1 1a 00 00       	call   4740 <printf>
    exit(0);
    2c4f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c56:	e8 57 19 00 00       	call   45b2 <exit>
    2c5b:	83 c4 10             	add    $0x10,%esp
    2c5e:	e9 ad fb ff ff       	jmp    2810 <subdir+0x530>
    2c63:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    2c6a:	00 
    2c6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00002c70 <bigwrite>:
{
    2c70:	55                   	push   %ebp
    2c71:	89 e5                	mov    %esp,%ebp
    2c73:	57                   	push   %edi
    2c74:	56                   	push   %esi
    2c75:	53                   	push   %ebx
  for(sz = 499; sz < 12*512; sz += 471){
    2c76:	bb f3 01 00 00       	mov    $0x1f3,%ebx
{
    2c7b:	83 ec 14             	sub    $0x14,%esp
  printf(1, "bigwrite test\n");
    2c7e:	68 a5 54 00 00       	push   $0x54a5
    2c83:	6a 01                	push   $0x1
    2c85:	e8 b6 1a 00 00       	call   4740 <printf>
  unlink("bigwrite");
    2c8a:	c7 04 24 b4 54 00 00 	movl   $0x54b4,(%esp)
    2c91:	e8 6c 19 00 00       	call   4602 <unlink>
    2c96:	83 c4 10             	add    $0x10,%esp
    2c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2ca0:	83 ec 08             	sub    $0x8,%esp
    2ca3:	68 02 02 00 00       	push   $0x202
    2ca8:	68 b4 54 00 00       	push   $0x54b4
    2cad:	e8 40 19 00 00       	call   45f2 <open>
    if(fd < 0){
    2cb2:	83 c4 10             	add    $0x10,%esp
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2cb5:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2cb7:	85 c0                	test   %eax,%eax
    2cb9:	0f 88 91 00 00 00    	js     2d50 <bigwrite+0xe0>
    2cbf:	bf 02 00 00 00       	mov    $0x2,%edi
      int cc = write(fd, buf, sz);
    2cc4:	83 ec 04             	sub    $0x4,%esp
    2cc7:	53                   	push   %ebx
    2cc8:	68 e0 92 00 00       	push   $0x92e0
    2ccd:	56                   	push   %esi
    2cce:	e8 ff 18 00 00       	call   45d2 <write>
      if(cc != sz){
    2cd3:	83 c4 10             	add    $0x10,%esp
    2cd6:	39 d8                	cmp    %ebx,%eax
    2cd8:	74 1d                	je     2cf7 <bigwrite+0x87>
        printf(1, "write(%d) ret %d\n", sz, cc);
    2cda:	50                   	push   %eax
    2cdb:	53                   	push   %ebx
    2cdc:	68 d5 54 00 00       	push   $0x54d5
    2ce1:	6a 01                	push   $0x1
    2ce3:	e8 58 1a 00 00       	call   4740 <printf>
        exit(0);
    2ce8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2cef:	e8 be 18 00 00       	call   45b2 <exit>
    2cf4:	83 c4 10             	add    $0x10,%esp
    for(i = 0; i < 2; i++){
    2cf7:	83 ff 01             	cmp    $0x1,%edi
    2cfa:	74 0c                	je     2d08 <bigwrite+0x98>
    2cfc:	bf 01 00 00 00       	mov    $0x1,%edi
    2d01:	eb c1                	jmp    2cc4 <bigwrite+0x54>
    2d03:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    close(fd);
    2d08:	83 ec 0c             	sub    $0xc,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    2d0b:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    close(fd);
    2d11:	56                   	push   %esi
    2d12:	e8 c3 18 00 00       	call   45da <close>
    unlink("bigwrite");
    2d17:	c7 04 24 b4 54 00 00 	movl   $0x54b4,(%esp)
    2d1e:	e8 df 18 00 00       	call   4602 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    2d23:	83 c4 10             	add    $0x10,%esp
    2d26:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    2d2c:	0f 85 6e ff ff ff    	jne    2ca0 <bigwrite+0x30>
  printf(1, "bigwrite ok\n");
    2d32:	83 ec 08             	sub    $0x8,%esp
    2d35:	68 e7 54 00 00       	push   $0x54e7
    2d3a:	6a 01                	push   $0x1
    2d3c:	e8 ff 19 00 00       	call   4740 <printf>
}
    2d41:	83 c4 10             	add    $0x10,%esp
    2d44:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2d47:	5b                   	pop    %ebx
    2d48:	5e                   	pop    %esi
    2d49:	5f                   	pop    %edi
    2d4a:	5d                   	pop    %ebp
    2d4b:	c3                   	ret
    2d4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "cannot create bigwrite\n");
    2d50:	83 ec 08             	sub    $0x8,%esp
    2d53:	68 bd 54 00 00       	push   $0x54bd
    2d58:	6a 01                	push   $0x1
    2d5a:	e8 e1 19 00 00       	call   4740 <printf>
      exit(0);
    2d5f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d66:	e8 47 18 00 00       	call   45b2 <exit>
    2d6b:	83 c4 10             	add    $0x10,%esp
    2d6e:	e9 4c ff ff ff       	jmp    2cbf <bigwrite+0x4f>
    2d73:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    2d7a:	00 
    2d7b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00002d80 <bigfile>:
{
    2d80:	55                   	push   %ebp
    2d81:	89 e5                	mov    %esp,%ebp
    2d83:	57                   	push   %edi
    2d84:	56                   	push   %esi
    2d85:	53                   	push   %ebx
    2d86:	83 ec 24             	sub    $0x24,%esp
  printf(1, "bigfile test\n");
    2d89:	68 f4 54 00 00       	push   $0x54f4
    2d8e:	6a 01                	push   $0x1
    2d90:	e8 ab 19 00 00       	call   4740 <printf>
  unlink("bigfile");
    2d95:	c7 04 24 10 55 00 00 	movl   $0x5510,(%esp)
    2d9c:	e8 61 18 00 00       	call   4602 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2da1:	5e                   	pop    %esi
    2da2:	5f                   	pop    %edi
    2da3:	68 02 02 00 00       	push   $0x202
    2da8:	68 10 55 00 00       	push   $0x5510
    2dad:	e8 40 18 00 00       	call   45f2 <open>
  if(fd < 0){
    2db2:	83 c4 10             	add    $0x10,%esp
  fd = open("bigfile", O_CREATE | O_RDWR);
    2db5:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2db7:	85 c0                	test   %eax,%eax
    2db9:	0f 88 a1 01 00 00    	js     2f60 <bigfile+0x1e0>
{
    2dbf:	31 db                	xor    %ebx,%ebx
    2dc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    memset(buf, i, 600);
    2dc8:	83 ec 04             	sub    $0x4,%esp
    2dcb:	68 58 02 00 00       	push   $0x258
    2dd0:	53                   	push   %ebx
    2dd1:	68 e0 92 00 00       	push   $0x92e0
    2dd6:	e8 45 16 00 00       	call   4420 <memset>
    if(write(fd, buf, 600) != 600){
    2ddb:	83 c4 0c             	add    $0xc,%esp
    2dde:	68 58 02 00 00       	push   $0x258
    2de3:	68 e0 92 00 00       	push   $0x92e0
    2de8:	56                   	push   %esi
    2de9:	e8 e4 17 00 00       	call   45d2 <write>
    2dee:	83 c4 10             	add    $0x10,%esp
    2df1:	3d 58 02 00 00       	cmp    $0x258,%eax
    2df6:	74 1e                	je     2e16 <bigfile+0x96>
      printf(1, "write bigfile failed\n");
    2df8:	83 ec 08             	sub    $0x8,%esp
    2dfb:	68 18 55 00 00       	push   $0x5518
    2e00:	6a 01                	push   $0x1
    2e02:	e8 39 19 00 00       	call   4740 <printf>
      exit(0);
    2e07:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e0e:	e8 9f 17 00 00       	call   45b2 <exit>
    2e13:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 20; i++){
    2e16:	83 c3 01             	add    $0x1,%ebx
    2e19:	83 fb 14             	cmp    $0x14,%ebx
    2e1c:	75 aa                	jne    2dc8 <bigfile+0x48>
  close(fd);
    2e1e:	83 ec 0c             	sub    $0xc,%esp
    2e21:	56                   	push   %esi
    2e22:	e8 b3 17 00 00       	call   45da <close>
  fd = open("bigfile", 0);
    2e27:	59                   	pop    %ecx
    2e28:	5b                   	pop    %ebx
    2e29:	6a 00                	push   $0x0
    2e2b:	68 10 55 00 00       	push   $0x5510
    2e30:	e8 bd 17 00 00       	call   45f2 <open>
  if(fd < 0){
    2e35:	83 c4 10             	add    $0x10,%esp
  fd = open("bigfile", 0);
    2e38:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(fd < 0){
    2e3b:	85 c0                	test   %eax,%eax
    2e3d:	0f 88 45 01 00 00    	js     2f88 <bigfile+0x208>
{
    2e43:	31 f6                	xor    %esi,%esi
    2e45:	31 db                	xor    %ebx,%ebx
    2e47:	eb 51                	jmp    2e9a <bigfile+0x11a>
    2e49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(cc == 0)
    2e50:	0f 84 aa 00 00 00    	je     2f00 <bigfile+0x180>
    if(cc != 300){
    2e56:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2e5b:	75 79                	jne    2ed6 <bigfile+0x156>
    if(buf[0] != i/2 || buf[299] != i/2){
    2e5d:	89 d9                	mov    %ebx,%ecx
    2e5f:	0f be 05 e0 92 00 00 	movsbl 0x92e0,%eax
    2e66:	d1 f9                	sar    $1,%ecx
    2e68:	39 c8                	cmp    %ecx,%eax
    2e6a:	75 0b                	jne    2e77 <bigfile+0xf7>
    2e6c:	0f be 0d 0b 94 00 00 	movsbl 0x940b,%ecx
    2e73:	39 c8                	cmp    %ecx,%eax
    2e75:	74 1e                	je     2e95 <bigfile+0x115>
      printf(1, "read bigfile wrong data\n");
    2e77:	83 ec 08             	sub    $0x8,%esp
    2e7a:	68 6c 55 00 00       	push   $0x556c
    2e7f:	6a 01                	push   $0x1
    2e81:	e8 ba 18 00 00       	call   4740 <printf>
      exit(0);
    2e86:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e8d:	e8 20 17 00 00       	call   45b2 <exit>
    2e92:	83 c4 10             	add    $0x10,%esp
    total += cc;
    2e95:	01 fe                	add    %edi,%esi
  for(i = 0; ; i++){
    2e97:	83 c3 01             	add    $0x1,%ebx
    cc = read(fd, buf, 300);
    2e9a:	83 ec 04             	sub    $0x4,%esp
    2e9d:	68 2c 01 00 00       	push   $0x12c
    2ea2:	68 e0 92 00 00       	push   $0x92e0
    2ea7:	ff 75 e4             	push   -0x1c(%ebp)
    2eaa:	e8 1b 17 00 00       	call   45ca <read>
    if(cc < 0){
    2eaf:	83 c4 10             	add    $0x10,%esp
    cc = read(fd, buf, 300);
    2eb2:	89 c7                	mov    %eax,%edi
    if(cc < 0){
    2eb4:	85 c0                	test   %eax,%eax
    2eb6:	79 98                	jns    2e50 <bigfile+0xd0>
      printf(1, "read bigfile failed\n");
    2eb8:	83 ec 08             	sub    $0x8,%esp
    2ebb:	68 43 55 00 00       	push   $0x5543
    2ec0:	6a 01                	push   $0x1
    2ec2:	e8 79 18 00 00       	call   4740 <printf>
      exit(0);
    2ec7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ece:	e8 df 16 00 00       	call   45b2 <exit>
    2ed3:	83 c4 10             	add    $0x10,%esp
      printf(1, "short read bigfile\n");
    2ed6:	83 ec 08             	sub    $0x8,%esp
    2ed9:	68 58 55 00 00       	push   $0x5558
    2ede:	6a 01                	push   $0x1
    2ee0:	e8 5b 18 00 00       	call   4740 <printf>
      exit(0);
    2ee5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2eec:	e8 c1 16 00 00       	call   45b2 <exit>
    2ef1:	83 c4 10             	add    $0x10,%esp
    2ef4:	e9 64 ff ff ff       	jmp    2e5d <bigfile+0xdd>
    2ef9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  close(fd);
    2f00:	83 ec 0c             	sub    $0xc,%esp
    2f03:	ff 75 e4             	push   -0x1c(%ebp)
    2f06:	e8 cf 16 00 00       	call   45da <close>
  if(total != 20*600){
    2f0b:	83 c4 10             	add    $0x10,%esp
    2f0e:	81 fe e0 2e 00 00    	cmp    $0x2ee0,%esi
    2f14:	74 1e                	je     2f34 <bigfile+0x1b4>
    printf(1, "read bigfile wrong total\n");
    2f16:	83 ec 08             	sub    $0x8,%esp
    2f19:	68 85 55 00 00       	push   $0x5585
    2f1e:	6a 01                	push   $0x1
    2f20:	e8 1b 18 00 00       	call   4740 <printf>
    exit(0);
    2f25:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f2c:	e8 81 16 00 00       	call   45b2 <exit>
    2f31:	83 c4 10             	add    $0x10,%esp
  unlink("bigfile");
    2f34:	83 ec 0c             	sub    $0xc,%esp
    2f37:	68 10 55 00 00       	push   $0x5510
    2f3c:	e8 c1 16 00 00       	call   4602 <unlink>
  printf(1, "bigfile test ok\n");
    2f41:	58                   	pop    %eax
    2f42:	5a                   	pop    %edx
    2f43:	68 9f 55 00 00       	push   $0x559f
    2f48:	6a 01                	push   $0x1
    2f4a:	e8 f1 17 00 00       	call   4740 <printf>
}
    2f4f:	83 c4 10             	add    $0x10,%esp
    2f52:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2f55:	5b                   	pop    %ebx
    2f56:	5e                   	pop    %esi
    2f57:	5f                   	pop    %edi
    2f58:	5d                   	pop    %ebp
    2f59:	c3                   	ret
    2f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "cannot create bigfile");
    2f60:	83 ec 08             	sub    $0x8,%esp
    2f63:	68 02 55 00 00       	push   $0x5502
    2f68:	6a 01                	push   $0x1
    2f6a:	e8 d1 17 00 00       	call   4740 <printf>
    exit(0);
    2f6f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f76:	e8 37 16 00 00       	call   45b2 <exit>
    2f7b:	83 c4 10             	add    $0x10,%esp
    2f7e:	e9 3c fe ff ff       	jmp    2dbf <bigfile+0x3f>
    2f83:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "cannot open bigfile\n");
    2f88:	83 ec 08             	sub    $0x8,%esp
    2f8b:	68 2e 55 00 00       	push   $0x552e
    2f90:	6a 01                	push   $0x1
    2f92:	e8 a9 17 00 00       	call   4740 <printf>
    exit(0);
    2f97:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f9e:	e8 0f 16 00 00       	call   45b2 <exit>
    2fa3:	83 c4 10             	add    $0x10,%esp
    2fa6:	e9 98 fe ff ff       	jmp    2e43 <bigfile+0xc3>
    2fab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00002fb0 <fourteen>:
{
    2fb0:	55                   	push   %ebp
    2fb1:	89 e5                	mov    %esp,%ebp
    2fb3:	53                   	push   %ebx
    2fb4:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "fourteen test\n");
    2fb7:	68 b0 55 00 00       	push   $0x55b0
    2fbc:	6a 01                	push   $0x1
    2fbe:	e8 7d 17 00 00       	call   4740 <printf>
  if(mkdir("12345678901234") != 0){
    2fc3:	c7 04 24 eb 55 00 00 	movl   $0x55eb,(%esp)
    2fca:	e8 4b 16 00 00       	call   461a <mkdir>
    2fcf:	83 c4 10             	add    $0x10,%esp
    2fd2:	85 c0                	test   %eax,%eax
    2fd4:	0f 85 a6 00 00 00    	jne    3080 <fourteen+0xd0>
  if(mkdir("12345678901234/123456789012345") != 0){
    2fda:	83 ec 0c             	sub    $0xc,%esp
    2fdd:	68 b0 5d 00 00       	push   $0x5db0
    2fe2:	e8 33 16 00 00       	call   461a <mkdir>
    2fe7:	83 c4 10             	add    $0x10,%esp
    2fea:	85 c0                	test   %eax,%eax
    2fec:	0f 85 06 01 00 00    	jne    30f8 <fourteen+0x148>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2ff2:	83 ec 08             	sub    $0x8,%esp
    2ff5:	68 00 02 00 00       	push   $0x200
    2ffa:	68 00 5e 00 00       	push   $0x5e00
    2fff:	e8 ee 15 00 00       	call   45f2 <open>
  if(fd < 0){
    3004:	83 c4 10             	add    $0x10,%esp
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    3007:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    3009:	85 c0                	test   %eax,%eax
    300b:	0f 88 37 01 00 00    	js     3148 <fourteen+0x198>
  close(fd);
    3011:	83 ec 0c             	sub    $0xc,%esp
    3014:	53                   	push   %ebx
    3015:	e8 c0 15 00 00       	call   45da <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    301a:	58                   	pop    %eax
    301b:	5a                   	pop    %edx
    301c:	6a 00                	push   $0x0
    301e:	68 70 5e 00 00       	push   $0x5e70
    3023:	e8 ca 15 00 00       	call   45f2 <open>
  if(fd < 0){
    3028:	83 c4 10             	add    $0x10,%esp
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    302b:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    302d:	85 c0                	test   %eax,%eax
    302f:	0f 88 eb 00 00 00    	js     3120 <fourteen+0x170>
  close(fd);
    3035:	83 ec 0c             	sub    $0xc,%esp
    3038:	53                   	push   %ebx
    3039:	e8 9c 15 00 00       	call   45da <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    303e:	c7 04 24 dc 55 00 00 	movl   $0x55dc,(%esp)
    3045:	e8 d0 15 00 00       	call   461a <mkdir>
    304a:	83 c4 10             	add    $0x10,%esp
    304d:	85 c0                	test   %eax,%eax
    304f:	74 7f                	je     30d0 <fourteen+0x120>
  if(mkdir("123456789012345/12345678901234") == 0){
    3051:	83 ec 0c             	sub    $0xc,%esp
    3054:	68 0c 5f 00 00       	push   $0x5f0c
    3059:	e8 bc 15 00 00       	call   461a <mkdir>
    305e:	83 c4 10             	add    $0x10,%esp
    3061:	85 c0                	test   %eax,%eax
    3063:	74 43                	je     30a8 <fourteen+0xf8>
  printf(1, "fourteen ok\n");
    3065:	83 ec 08             	sub    $0x8,%esp
    3068:	68 fa 55 00 00       	push   $0x55fa
    306d:	6a 01                	push   $0x1
    306f:	e8 cc 16 00 00       	call   4740 <printf>
}
    3074:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3077:	83 c4 10             	add    $0x10,%esp
    307a:	c9                   	leave
    307b:	c3                   	ret
    307c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "mkdir 12345678901234 failed\n");
    3080:	83 ec 08             	sub    $0x8,%esp
    3083:	68 bf 55 00 00       	push   $0x55bf
    3088:	6a 01                	push   $0x1
    308a:	e8 b1 16 00 00       	call   4740 <printf>
    exit(0);
    308f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3096:	e8 17 15 00 00       	call   45b2 <exit>
    309b:	83 c4 10             	add    $0x10,%esp
    309e:	e9 37 ff ff ff       	jmp    2fda <fourteen+0x2a>
    30a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    30a8:	83 ec 08             	sub    $0x8,%esp
    30ab:	68 2c 5f 00 00       	push   $0x5f2c
    30b0:	6a 01                	push   $0x1
    30b2:	e8 89 16 00 00       	call   4740 <printf>
    exit(0);
    30b7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30be:	e8 ef 14 00 00       	call   45b2 <exit>
    30c3:	83 c4 10             	add    $0x10,%esp
    30c6:	eb 9d                	jmp    3065 <fourteen+0xb5>
    30c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    30cf:	00 
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    30d0:	83 ec 08             	sub    $0x8,%esp
    30d3:	68 dc 5e 00 00       	push   $0x5edc
    30d8:	6a 01                	push   $0x1
    30da:	e8 61 16 00 00       	call   4740 <printf>
    exit(0);
    30df:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30e6:	e8 c7 14 00 00       	call   45b2 <exit>
    30eb:	83 c4 10             	add    $0x10,%esp
    30ee:	e9 5e ff ff ff       	jmp    3051 <fourteen+0xa1>
    30f3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    30f8:	83 ec 08             	sub    $0x8,%esp
    30fb:	68 d0 5d 00 00       	push   $0x5dd0
    3100:	6a 01                	push   $0x1
    3102:	e8 39 16 00 00       	call   4740 <printf>
    exit(0);
    3107:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    310e:	e8 9f 14 00 00       	call   45b2 <exit>
    3113:	83 c4 10             	add    $0x10,%esp
    3116:	e9 d7 fe ff ff       	jmp    2ff2 <fourteen+0x42>
    311b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    3120:	83 ec 08             	sub    $0x8,%esp
    3123:	68 a0 5e 00 00       	push   $0x5ea0
    3128:	6a 01                	push   $0x1
    312a:	e8 11 16 00 00       	call   4740 <printf>
    exit(0);
    312f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3136:	e8 77 14 00 00       	call   45b2 <exit>
    313b:	83 c4 10             	add    $0x10,%esp
    313e:	e9 f2 fe ff ff       	jmp    3035 <fourteen+0x85>
    3143:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    3148:	83 ec 08             	sub    $0x8,%esp
    314b:	68 30 5e 00 00       	push   $0x5e30
    3150:	6a 01                	push   $0x1
    3152:	e8 e9 15 00 00       	call   4740 <printf>
    exit(0);
    3157:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    315e:	e8 4f 14 00 00       	call   45b2 <exit>
    3163:	83 c4 10             	add    $0x10,%esp
    3166:	e9 a6 fe ff ff       	jmp    3011 <fourteen+0x61>
    316b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00003170 <rmdot>:
{
    3170:	55                   	push   %ebp
    3171:	89 e5                	mov    %esp,%ebp
    3173:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    3176:	68 07 56 00 00       	push   $0x5607
    317b:	6a 01                	push   $0x1
    317d:	e8 be 15 00 00       	call   4740 <printf>
  if(mkdir("dots") != 0){
    3182:	c7 04 24 13 56 00 00 	movl   $0x5613,(%esp)
    3189:	e8 8c 14 00 00       	call   461a <mkdir>
    318e:	83 c4 10             	add    $0x10,%esp
    3191:	85 c0                	test   %eax,%eax
    3193:	0f 85 b7 00 00 00    	jne    3250 <rmdot+0xe0>
  if(chdir("dots") != 0){
    3199:	83 ec 0c             	sub    $0xc,%esp
    319c:	68 13 56 00 00       	push   $0x5613
    31a1:	e8 7c 14 00 00       	call   4622 <chdir>
    31a6:	83 c4 10             	add    $0x10,%esp
    31a9:	85 c0                	test   %eax,%eax
    31ab:	0f 85 b7 01 00 00    	jne    3368 <rmdot+0x1f8>
  if(unlink(".") == 0){
    31b1:	83 ec 0c             	sub    $0xc,%esp
    31b4:	68 be 52 00 00       	push   $0x52be
    31b9:	e8 44 14 00 00       	call   4602 <unlink>
    31be:	83 c4 10             	add    $0x10,%esp
    31c1:	85 c0                	test   %eax,%eax
    31c3:	0f 84 77 01 00 00    	je     3340 <rmdot+0x1d0>
  if(unlink("..") == 0){
    31c9:	83 ec 0c             	sub    $0xc,%esp
    31cc:	68 bd 52 00 00       	push   $0x52bd
    31d1:	e8 2c 14 00 00       	call   4602 <unlink>
    31d6:	83 c4 10             	add    $0x10,%esp
    31d9:	85 c0                	test   %eax,%eax
    31db:	0f 84 37 01 00 00    	je     3318 <rmdot+0x1a8>
  if(chdir("/") != 0){
    31e1:	83 ec 0c             	sub    $0xc,%esp
    31e4:	68 91 4a 00 00       	push   $0x4a91
    31e9:	e8 34 14 00 00       	call   4622 <chdir>
    31ee:	83 c4 10             	add    $0x10,%esp
    31f1:	85 c0                	test   %eax,%eax
    31f3:	0f 85 f7 00 00 00    	jne    32f0 <rmdot+0x180>
  if(unlink("dots/.") == 0){
    31f9:	83 ec 0c             	sub    $0xc,%esp
    31fc:	68 5b 56 00 00       	push   $0x565b
    3201:	e8 fc 13 00 00       	call   4602 <unlink>
    3206:	83 c4 10             	add    $0x10,%esp
    3209:	85 c0                	test   %eax,%eax
    320b:	0f 84 b7 00 00 00    	je     32c8 <rmdot+0x158>
  if(unlink("dots/..") == 0){
    3211:	83 ec 0c             	sub    $0xc,%esp
    3214:	68 79 56 00 00       	push   $0x5679
    3219:	e8 e4 13 00 00       	call   4602 <unlink>
    321e:	83 c4 10             	add    $0x10,%esp
    3221:	85 c0                	test   %eax,%eax
    3223:	74 7b                	je     32a0 <rmdot+0x130>
  if(unlink("dots") != 0){
    3225:	83 ec 0c             	sub    $0xc,%esp
    3228:	68 13 56 00 00       	push   $0x5613
    322d:	e8 d0 13 00 00       	call   4602 <unlink>
    3232:	83 c4 10             	add    $0x10,%esp
    3235:	85 c0                	test   %eax,%eax
    3237:	75 3f                	jne    3278 <rmdot+0x108>
  printf(1, "rmdot ok\n");
    3239:	83 ec 08             	sub    $0x8,%esp
    323c:	68 ae 56 00 00       	push   $0x56ae
    3241:	6a 01                	push   $0x1
    3243:	e8 f8 14 00 00       	call   4740 <printf>
}
    3248:	83 c4 10             	add    $0x10,%esp
    324b:	c9                   	leave
    324c:	c3                   	ret
    324d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "mkdir dots failed\n");
    3250:	83 ec 08             	sub    $0x8,%esp
    3253:	68 18 56 00 00       	push   $0x5618
    3258:	6a 01                	push   $0x1
    325a:	e8 e1 14 00 00       	call   4740 <printf>
    exit(0);
    325f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3266:	e8 47 13 00 00       	call   45b2 <exit>
    326b:	83 c4 10             	add    $0x10,%esp
    326e:	e9 26 ff ff ff       	jmp    3199 <rmdot+0x29>
    3273:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "unlink dots failed!\n");
    3278:	83 ec 08             	sub    $0x8,%esp
    327b:	68 99 56 00 00       	push   $0x5699
    3280:	6a 01                	push   $0x1
    3282:	e8 b9 14 00 00       	call   4740 <printf>
    exit(0);
    3287:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    328e:	e8 1f 13 00 00       	call   45b2 <exit>
    3293:	83 c4 10             	add    $0x10,%esp
    3296:	eb a1                	jmp    3239 <rmdot+0xc9>
    3298:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    329f:	00 
    printf(1, "unlink dots/.. worked!\n");
    32a0:	83 ec 08             	sub    $0x8,%esp
    32a3:	68 81 56 00 00       	push   $0x5681
    32a8:	6a 01                	push   $0x1
    32aa:	e8 91 14 00 00       	call   4740 <printf>
    exit(0);
    32af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32b6:	e8 f7 12 00 00       	call   45b2 <exit>
    32bb:	83 c4 10             	add    $0x10,%esp
    32be:	e9 62 ff ff ff       	jmp    3225 <rmdot+0xb5>
    32c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "unlink dots/. worked!\n");
    32c8:	83 ec 08             	sub    $0x8,%esp
    32cb:	68 62 56 00 00       	push   $0x5662
    32d0:	6a 01                	push   $0x1
    32d2:	e8 69 14 00 00       	call   4740 <printf>
    exit(0);
    32d7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32de:	e8 cf 12 00 00       	call   45b2 <exit>
    32e3:	83 c4 10             	add    $0x10,%esp
    32e6:	e9 26 ff ff ff       	jmp    3211 <rmdot+0xa1>
    32eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "chdir / failed\n");
    32f0:	83 ec 08             	sub    $0x8,%esp
    32f3:	68 93 4a 00 00       	push   $0x4a93
    32f8:	6a 01                	push   $0x1
    32fa:	e8 41 14 00 00       	call   4740 <printf>
    exit(0);
    32ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3306:	e8 a7 12 00 00       	call   45b2 <exit>
    330b:	83 c4 10             	add    $0x10,%esp
    330e:	e9 e6 fe ff ff       	jmp    31f9 <rmdot+0x89>
    3313:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "rm .. worked!\n");
    3318:	83 ec 08             	sub    $0x8,%esp
    331b:	68 4c 56 00 00       	push   $0x564c
    3320:	6a 01                	push   $0x1
    3322:	e8 19 14 00 00       	call   4740 <printf>
    exit(0);
    3327:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    332e:	e8 7f 12 00 00       	call   45b2 <exit>
    3333:	83 c4 10             	add    $0x10,%esp
    3336:	e9 a6 fe ff ff       	jmp    31e1 <rmdot+0x71>
    333b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "rm . worked!\n");
    3340:	83 ec 08             	sub    $0x8,%esp
    3343:	68 3e 56 00 00       	push   $0x563e
    3348:	6a 01                	push   $0x1
    334a:	e8 f1 13 00 00       	call   4740 <printf>
    exit(0);
    334f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3356:	e8 57 12 00 00       	call   45b2 <exit>
    335b:	83 c4 10             	add    $0x10,%esp
    335e:	e9 66 fe ff ff       	jmp    31c9 <rmdot+0x59>
    3363:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "chdir dots failed\n");
    3368:	83 ec 08             	sub    $0x8,%esp
    336b:	68 2b 56 00 00       	push   $0x562b
    3370:	6a 01                	push   $0x1
    3372:	e8 c9 13 00 00       	call   4740 <printf>
    exit(0);
    3377:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    337e:	e8 2f 12 00 00       	call   45b2 <exit>
    3383:	83 c4 10             	add    $0x10,%esp
    3386:	e9 26 fe ff ff       	jmp    31b1 <rmdot+0x41>
    338b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00003390 <dirfile>:
{
    3390:	55                   	push   %ebp
    3391:	89 e5                	mov    %esp,%ebp
    3393:	53                   	push   %ebx
    3394:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "dir vs file\n");
    3397:	68 b8 56 00 00       	push   $0x56b8
    339c:	6a 01                	push   $0x1
    339e:	e8 9d 13 00 00       	call   4740 <printf>
  fd = open("dirfile", O_CREATE);
    33a3:	59                   	pop    %ecx
    33a4:	5b                   	pop    %ebx
    33a5:	68 00 02 00 00       	push   $0x200
    33aa:	68 c5 56 00 00       	push   $0x56c5
    33af:	e8 3e 12 00 00       	call   45f2 <open>
  if(fd < 0){
    33b4:	83 c4 10             	add    $0x10,%esp
  fd = open("dirfile", O_CREATE);
    33b7:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    33b9:	85 c0                	test   %eax,%eax
    33bb:	0f 88 57 02 00 00    	js     3618 <dirfile+0x288>
  close(fd);
    33c1:	83 ec 0c             	sub    $0xc,%esp
    33c4:	53                   	push   %ebx
    33c5:	e8 10 12 00 00       	call   45da <close>
  if(chdir("dirfile") == 0){
    33ca:	c7 04 24 c5 56 00 00 	movl   $0x56c5,(%esp)
    33d1:	e8 4c 12 00 00       	call   4622 <chdir>
    33d6:	83 c4 10             	add    $0x10,%esp
    33d9:	85 c0                	test   %eax,%eax
    33db:	0f 84 0f 02 00 00    	je     35f0 <dirfile+0x260>
  fd = open("dirfile/xx", 0);
    33e1:	83 ec 08             	sub    $0x8,%esp
    33e4:	6a 00                	push   $0x0
    33e6:	68 fe 56 00 00       	push   $0x56fe
    33eb:	e8 02 12 00 00       	call   45f2 <open>
  if(fd >= 0){
    33f0:	83 c4 10             	add    $0x10,%esp
    33f3:	85 c0                	test   %eax,%eax
    33f5:	78 1e                	js     3415 <dirfile+0x85>
    printf(1, "create dirfile/xx succeeded!\n");
    33f7:	83 ec 08             	sub    $0x8,%esp
    33fa:	68 09 57 00 00       	push   $0x5709
    33ff:	6a 01                	push   $0x1
    3401:	e8 3a 13 00 00       	call   4740 <printf>
    exit(0);
    3406:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    340d:	e8 a0 11 00 00       	call   45b2 <exit>
    3412:	83 c4 10             	add    $0x10,%esp
  fd = open("dirfile/xx", O_CREATE);
    3415:	83 ec 08             	sub    $0x8,%esp
    3418:	68 00 02 00 00       	push   $0x200
    341d:	68 fe 56 00 00       	push   $0x56fe
    3422:	e8 cb 11 00 00       	call   45f2 <open>
  if(fd >= 0){
    3427:	83 c4 10             	add    $0x10,%esp
    342a:	85 c0                	test   %eax,%eax
    342c:	78 1e                	js     344c <dirfile+0xbc>
    printf(1, "create dirfile/xx succeeded!\n");
    342e:	83 ec 08             	sub    $0x8,%esp
    3431:	68 09 57 00 00       	push   $0x5709
    3436:	6a 01                	push   $0x1
    3438:	e8 03 13 00 00       	call   4740 <printf>
    exit(0);
    343d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3444:	e8 69 11 00 00       	call   45b2 <exit>
    3449:	83 c4 10             	add    $0x10,%esp
  if(mkdir("dirfile/xx") == 0){
    344c:	83 ec 0c             	sub    $0xc,%esp
    344f:	68 fe 56 00 00       	push   $0x56fe
    3454:	e8 c1 11 00 00       	call   461a <mkdir>
    3459:	83 c4 10             	add    $0x10,%esp
    345c:	85 c0                	test   %eax,%eax
    345e:	0f 84 64 01 00 00    	je     35c8 <dirfile+0x238>
  if(unlink("dirfile/xx") == 0){
    3464:	83 ec 0c             	sub    $0xc,%esp
    3467:	68 fe 56 00 00       	push   $0x56fe
    346c:	e8 91 11 00 00       	call   4602 <unlink>
    3471:	83 c4 10             	add    $0x10,%esp
    3474:	85 c0                	test   %eax,%eax
    3476:	0f 84 24 01 00 00    	je     35a0 <dirfile+0x210>
  if(link("README", "dirfile/xx") == 0){
    347c:	83 ec 08             	sub    $0x8,%esp
    347f:	68 fe 56 00 00       	push   $0x56fe
    3484:	68 62 57 00 00       	push   $0x5762
    3489:	e8 84 11 00 00       	call   4612 <link>
    348e:	83 c4 10             	add    $0x10,%esp
    3491:	85 c0                	test   %eax,%eax
    3493:	0f 84 df 00 00 00    	je     3578 <dirfile+0x1e8>
  if(unlink("dirfile") != 0){
    3499:	83 ec 0c             	sub    $0xc,%esp
    349c:	68 c5 56 00 00       	push   $0x56c5
    34a1:	e8 5c 11 00 00       	call   4602 <unlink>
    34a6:	83 c4 10             	add    $0x10,%esp
    34a9:	85 c0                	test   %eax,%eax
    34ab:	0f 85 9f 00 00 00    	jne    3550 <dirfile+0x1c0>
  fd = open(".", O_RDWR);
    34b1:	83 ec 08             	sub    $0x8,%esp
    34b4:	6a 02                	push   $0x2
    34b6:	68 be 52 00 00       	push   $0x52be
    34bb:	e8 32 11 00 00       	call   45f2 <open>
  if(fd >= 0){
    34c0:	83 c4 10             	add    $0x10,%esp
    34c3:	85 c0                	test   %eax,%eax
    34c5:	78 1e                	js     34e5 <dirfile+0x155>
    printf(1, "open . for writing succeeded!\n");
    34c7:	83 ec 08             	sub    $0x8,%esp
    34ca:	68 80 5f 00 00       	push   $0x5f80
    34cf:	6a 01                	push   $0x1
    34d1:	e8 6a 12 00 00       	call   4740 <printf>
    exit(0);
    34d6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34dd:	e8 d0 10 00 00       	call   45b2 <exit>
    34e2:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    34e5:	83 ec 08             	sub    $0x8,%esp
    34e8:	6a 00                	push   $0x0
    34ea:	68 be 52 00 00       	push   $0x52be
    34ef:	e8 fe 10 00 00       	call   45f2 <open>
  if(write(fd, "x", 1) > 0){
    34f4:	83 c4 0c             	add    $0xc,%esp
    34f7:	6a 01                	push   $0x1
  fd = open(".", 0);
    34f9:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    34fb:	68 a1 53 00 00       	push   $0x53a1
    3500:	50                   	push   %eax
    3501:	e8 cc 10 00 00       	call   45d2 <write>
    3506:	83 c4 10             	add    $0x10,%esp
    3509:	85 c0                	test   %eax,%eax
    350b:	7e 1e                	jle    352b <dirfile+0x19b>
    printf(1, "write . succeeded!\n");
    350d:	83 ec 08             	sub    $0x8,%esp
    3510:	68 81 57 00 00       	push   $0x5781
    3515:	6a 01                	push   $0x1
    3517:	e8 24 12 00 00       	call   4740 <printf>
    exit(0);
    351c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3523:	e8 8a 10 00 00       	call   45b2 <exit>
    3528:	83 c4 10             	add    $0x10,%esp
  close(fd);
    352b:	83 ec 0c             	sub    $0xc,%esp
    352e:	53                   	push   %ebx
    352f:	e8 a6 10 00 00       	call   45da <close>
  printf(1, "dir vs file OK\n");
    3534:	58                   	pop    %eax
    3535:	5a                   	pop    %edx
    3536:	68 95 57 00 00       	push   $0x5795
    353b:	6a 01                	push   $0x1
    353d:	e8 fe 11 00 00       	call   4740 <printf>
}
    3542:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3545:	83 c4 10             	add    $0x10,%esp
    3548:	c9                   	leave
    3549:	c3                   	ret
    354a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "unlink dirfile failed!\n");
    3550:	83 ec 08             	sub    $0x8,%esp
    3553:	68 69 57 00 00       	push   $0x5769
    3558:	6a 01                	push   $0x1
    355a:	e8 e1 11 00 00       	call   4740 <printf>
    exit(0);
    355f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3566:	e8 47 10 00 00       	call   45b2 <exit>
    356b:	83 c4 10             	add    $0x10,%esp
    356e:	e9 3e ff ff ff       	jmp    34b1 <dirfile+0x121>
    3573:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "link to dirfile/xx succeeded!\n");
    3578:	83 ec 08             	sub    $0x8,%esp
    357b:	68 60 5f 00 00       	push   $0x5f60
    3580:	6a 01                	push   $0x1
    3582:	e8 b9 11 00 00       	call   4740 <printf>
    exit(0);
    3587:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    358e:	e8 1f 10 00 00       	call   45b2 <exit>
    3593:	83 c4 10             	add    $0x10,%esp
    3596:	e9 fe fe ff ff       	jmp    3499 <dirfile+0x109>
    359b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "unlink dirfile/xx succeeded!\n");
    35a0:	83 ec 08             	sub    $0x8,%esp
    35a3:	68 44 57 00 00       	push   $0x5744
    35a8:	6a 01                	push   $0x1
    35aa:	e8 91 11 00 00       	call   4740 <printf>
    exit(0);
    35af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35b6:	e8 f7 0f 00 00       	call   45b2 <exit>
    35bb:	83 c4 10             	add    $0x10,%esp
    35be:	e9 b9 fe ff ff       	jmp    347c <dirfile+0xec>
    35c3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "mkdir dirfile/xx succeeded!\n");
    35c8:	83 ec 08             	sub    $0x8,%esp
    35cb:	68 27 57 00 00       	push   $0x5727
    35d0:	6a 01                	push   $0x1
    35d2:	e8 69 11 00 00       	call   4740 <printf>
    exit(0);
    35d7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35de:	e8 cf 0f 00 00       	call   45b2 <exit>
    35e3:	83 c4 10             	add    $0x10,%esp
    35e6:	e9 79 fe ff ff       	jmp    3464 <dirfile+0xd4>
    35eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "chdir dirfile succeeded!\n");
    35f0:	83 ec 08             	sub    $0x8,%esp
    35f3:	68 e4 56 00 00       	push   $0x56e4
    35f8:	6a 01                	push   $0x1
    35fa:	e8 41 11 00 00       	call   4740 <printf>
    exit(0);
    35ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3606:	e8 a7 0f 00 00       	call   45b2 <exit>
    360b:	83 c4 10             	add    $0x10,%esp
    360e:	e9 ce fd ff ff       	jmp    33e1 <dirfile+0x51>
    3613:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(1, "create dirfile failed\n");
    3618:	83 ec 08             	sub    $0x8,%esp
    361b:	68 cd 56 00 00       	push   $0x56cd
    3620:	6a 01                	push   $0x1
    3622:	e8 19 11 00 00       	call   4740 <printf>
    exit(0);
    3627:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    362e:	e8 7f 0f 00 00       	call   45b2 <exit>
    3633:	83 c4 10             	add    $0x10,%esp
    3636:	e9 86 fd ff ff       	jmp    33c1 <dirfile+0x31>
    363b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00003640 <iref>:
{
    3640:	55                   	push   %ebp
    3641:	89 e5                	mov    %esp,%ebp
    3643:	53                   	push   %ebx
  printf(1, "empty file name\n");
    3644:	bb 33 00 00 00       	mov    $0x33,%ebx
{
    3649:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "empty file name\n");
    364c:	68 a5 57 00 00       	push   $0x57a5
    3651:	6a 01                	push   $0x1
    3653:	e8 e8 10 00 00       	call   4740 <printf>
    3658:	83 c4 10             	add    $0x10,%esp
    365b:	e9 94 00 00 00       	jmp    36f4 <iref+0xb4>
    if(chdir("irefd") != 0){
    3660:	83 ec 0c             	sub    $0xc,%esp
    3663:	68 b6 57 00 00       	push   $0x57b6
    3668:	e8 b5 0f 00 00       	call   4622 <chdir>
    366d:	83 c4 10             	add    $0x10,%esp
    3670:	85 c0                	test   %eax,%eax
    3672:	0f 85 b8 00 00 00    	jne    3730 <iref+0xf0>
    mkdir("");
    3678:	83 ec 0c             	sub    $0xc,%esp
    367b:	68 6b 4e 00 00       	push   $0x4e6b
    3680:	e8 95 0f 00 00       	call   461a <mkdir>
    link("README", "");
    3685:	59                   	pop    %ecx
    3686:	58                   	pop    %eax
    3687:	68 6b 4e 00 00       	push   $0x4e6b
    368c:	68 62 57 00 00       	push   $0x5762
    3691:	e8 7c 0f 00 00       	call   4612 <link>
    fd = open("", O_CREATE);
    3696:	58                   	pop    %eax
    3697:	5a                   	pop    %edx
    3698:	68 00 02 00 00       	push   $0x200
    369d:	68 6b 4e 00 00       	push   $0x4e6b
    36a2:	e8 4b 0f 00 00       	call   45f2 <open>
    if(fd >= 0)
    36a7:	83 c4 10             	add    $0x10,%esp
    36aa:	85 c0                	test   %eax,%eax
    36ac:	78 0c                	js     36ba <iref+0x7a>
      close(fd);
    36ae:	83 ec 0c             	sub    $0xc,%esp
    36b1:	50                   	push   %eax
    36b2:	e8 23 0f 00 00       	call   45da <close>
    36b7:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    36ba:	83 ec 08             	sub    $0x8,%esp
    36bd:	68 00 02 00 00       	push   $0x200
    36c2:	68 a0 53 00 00       	push   $0x53a0
    36c7:	e8 26 0f 00 00       	call   45f2 <open>
    if(fd >= 0)
    36cc:	83 c4 10             	add    $0x10,%esp
    36cf:	85 c0                	test   %eax,%eax
    36d1:	78 0c                	js     36df <iref+0x9f>
      close(fd);
    36d3:	83 ec 0c             	sub    $0xc,%esp
    36d6:	50                   	push   %eax
    36d7:	e8 fe 0e 00 00       	call   45da <close>
    36dc:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    36df:	83 ec 0c             	sub    $0xc,%esp
    36e2:	68 a0 53 00 00       	push   $0x53a0
    36e7:	e8 16 0f 00 00       	call   4602 <unlink>
  for(i = 0; i < 50 + 1; i++){
    36ec:	83 c4 10             	add    $0x10,%esp
    36ef:	83 eb 01             	sub    $0x1,%ebx
    36f2:	74 64                	je     3758 <iref+0x118>
    if(mkdir("irefd") != 0){
    36f4:	83 ec 0c             	sub    $0xc,%esp
    36f7:	68 b6 57 00 00       	push   $0x57b6
    36fc:	e8 19 0f 00 00       	call   461a <mkdir>
    3701:	83 c4 10             	add    $0x10,%esp
    3704:	85 c0                	test   %eax,%eax
    3706:	0f 84 54 ff ff ff    	je     3660 <iref+0x20>
      printf(1, "mkdir irefd failed\n");
    370c:	83 ec 08             	sub    $0x8,%esp
    370f:	68 bc 57 00 00       	push   $0x57bc
    3714:	6a 01                	push   $0x1
    3716:	e8 25 10 00 00       	call   4740 <printf>
      exit(0);
    371b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3722:	e8 8b 0e 00 00       	call   45b2 <exit>
    3727:	83 c4 10             	add    $0x10,%esp
    372a:	e9 31 ff ff ff       	jmp    3660 <iref+0x20>
    372f:	90                   	nop
      printf(1, "chdir irefd failed\n");
    3730:	83 ec 08             	sub    $0x8,%esp
    3733:	68 d0 57 00 00       	push   $0x57d0
    3738:	6a 01                	push   $0x1
    373a:	e8 01 10 00 00       	call   4740 <printf>
      exit(0);
    373f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3746:	e8 67 0e 00 00       	call   45b2 <exit>
    374b:	83 c4 10             	add    $0x10,%esp
    374e:	e9 25 ff ff ff       	jmp    3678 <iref+0x38>
    3753:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  chdir("/");
    3758:	83 ec 0c             	sub    $0xc,%esp
    375b:	68 91 4a 00 00       	push   $0x4a91
    3760:	e8 bd 0e 00 00       	call   4622 <chdir>
  printf(1, "empty file name OK\n");
    3765:	58                   	pop    %eax
    3766:	5a                   	pop    %edx
    3767:	68 e4 57 00 00       	push   $0x57e4
    376c:	6a 01                	push   $0x1
    376e:	e8 cd 0f 00 00       	call   4740 <printf>
}
    3773:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3776:	83 c4 10             	add    $0x10,%esp
    3779:	c9                   	leave
    377a:	c3                   	ret
    377b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00003780 <forktest>:
{
    3780:	55                   	push   %ebp
    3781:	89 e5                	mov    %esp,%ebp
    3783:	53                   	push   %ebx
  for(n=0; n<1000; n++){
    3784:	31 db                	xor    %ebx,%ebx
{
    3786:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "fork test\n");
    3789:	68 f8 57 00 00       	push   $0x57f8
    378e:	6a 01                	push   $0x1
    3790:	e8 ab 0f 00 00       	call   4740 <printf>
    3795:	83 c4 10             	add    $0x10,%esp
    3798:	eb 11                	jmp    37ab <forktest+0x2b>
    379a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(n=0; n<1000; n++){
    37a0:	83 c3 01             	add    $0x1,%ebx
    37a3:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    37a9:	74 27                	je     37d2 <forktest+0x52>
    pid = fork();
    37ab:	e8 fa 0d 00 00       	call   45aa <fork>
    if(pid < 0)
    37b0:	85 c0                	test   %eax,%eax
    37b2:	0f 88 a8 00 00 00    	js     3860 <forktest+0xe0>
    if(pid == 0)
    37b8:	75 e6                	jne    37a0 <forktest+0x20>
      exit(0);
    37ba:	83 ec 0c             	sub    $0xc,%esp
  for(n=0; n<1000; n++){
    37bd:	83 c3 01             	add    $0x1,%ebx
      exit(0);
    37c0:	6a 00                	push   $0x0
    37c2:	e8 eb 0d 00 00       	call   45b2 <exit>
    37c7:	83 c4 10             	add    $0x10,%esp
  for(n=0; n<1000; n++){
    37ca:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    37d0:	75 d9                	jne    37ab <forktest+0x2b>
    printf(1, "fork claimed to work 1000 times!\n");
    37d2:	83 ec 08             	sub    $0x8,%esp
    37d5:	68 a0 5f 00 00       	push   $0x5fa0
    37da:	6a 01                	push   $0x1
    37dc:	e8 5f 0f 00 00       	call   4740 <printf>
    exit(0);
    37e1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    37e8:	e8 c5 0d 00 00       	call   45b2 <exit>
    37ed:	83 c4 10             	add    $0x10,%esp
    if(wait() < 0){
    37f0:	e8 c5 0d 00 00       	call   45ba <wait>
    37f5:	85 c0                	test   %eax,%eax
    37f7:	79 77                	jns    3870 <forktest+0xf0>
    37f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "wait stopped early\n");
    3800:	83 ec 08             	sub    $0x8,%esp
    3803:	68 03 58 00 00       	push   $0x5803
    3808:	6a 01                	push   $0x1
    380a:	e8 31 0f 00 00       	call   4740 <printf>
      exit(0);
    380f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3816:	e8 97 0d 00 00       	call   45b2 <exit>
    381b:	83 c4 10             	add    $0x10,%esp
  for(; n > 0; n--){
    381e:	83 eb 01             	sub    $0x1,%ebx
    3821:	75 52                	jne    3875 <forktest+0xf5>
  if(wait() != -1){
    3823:	e8 92 0d 00 00       	call   45ba <wait>
    3828:	83 f8 ff             	cmp    $0xffffffff,%eax
    382b:	74 1e                	je     384b <forktest+0xcb>
    printf(1, "wait got too many\n");
    382d:	83 ec 08             	sub    $0x8,%esp
    3830:	68 17 58 00 00       	push   $0x5817
    3835:	6a 01                	push   $0x1
    3837:	e8 04 0f 00 00       	call   4740 <printf>
    exit(0);
    383c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3843:	e8 6a 0d 00 00       	call   45b2 <exit>
    3848:	83 c4 10             	add    $0x10,%esp
  printf(1, "fork test OK\n");
    384b:	83 ec 08             	sub    $0x8,%esp
    384e:	68 2a 58 00 00       	push   $0x582a
    3853:	6a 01                	push   $0x1
    3855:	e8 e6 0e 00 00       	call   4740 <printf>
}
    385a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    385d:	c9                   	leave
    385e:	c3                   	ret
    385f:	90                   	nop
  for(; n > 0; n--){
    3860:	85 db                	test   %ebx,%ebx
    3862:	75 11                	jne    3875 <forktest+0xf5>
    3864:	eb bd                	jmp    3823 <forktest+0xa3>
    3866:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    386d:	00 
    386e:	66 90                	xchg   %ax,%ax
    3870:	83 eb 01             	sub    $0x1,%ebx
    3873:	74 ae                	je     3823 <forktest+0xa3>
    if(wait() < 0){
    3875:	e8 40 0d 00 00       	call   45ba <wait>
    387a:	85 c0                	test   %eax,%eax
    387c:	79 f2                	jns    3870 <forktest+0xf0>
    387e:	e9 7d ff ff ff       	jmp    3800 <forktest+0x80>
    3883:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    388a:	00 
    388b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00003890 <sbrktest>:
{
    3890:	55                   	push   %ebp
    3891:	89 e5                	mov    %esp,%ebp
    3893:	57                   	push   %edi
    3894:	56                   	push   %esi
  for(i = 0; i < 5000; i++){
    3895:	31 f6                	xor    %esi,%esi
{
    3897:	53                   	push   %ebx
    3898:	83 ec 64             	sub    $0x64,%esp
  printf(stdout, "sbrk test\n");
    389b:	68 38 58 00 00       	push   $0x5838
    38a0:	ff 35 8c 6b 00 00    	push   0x6b8c
    38a6:	e8 95 0e 00 00       	call   4740 <printf>
  oldbrk = sbrk(0);
    38ab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    38b2:	e8 83 0d 00 00       	call   463a <sbrk>
    38b7:	89 45 a4             	mov    %eax,-0x5c(%ebp)
  a = sbrk(0);
    38ba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    38c1:	e8 74 0d 00 00       	call   463a <sbrk>
    38c6:	83 c4 10             	add    $0x10,%esp
    38c9:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 5000; i++){
    38cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    b = sbrk(1);
    38d0:	83 ec 0c             	sub    $0xc,%esp
    38d3:	6a 01                	push   $0x1
    38d5:	e8 60 0d 00 00       	call   463a <sbrk>
    if(b != a){
    38da:	83 c4 10             	add    $0x10,%esp
    b = sbrk(1);
    38dd:	89 c3                	mov    %eax,%ebx
    if(b != a){
    38df:	39 f8                	cmp    %edi,%eax
    38e1:	74 23                	je     3906 <sbrktest+0x76>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    38e3:	83 ec 0c             	sub    $0xc,%esp
    38e6:	50                   	push   %eax
    38e7:	57                   	push   %edi
    38e8:	56                   	push   %esi
    38e9:	68 43 58 00 00       	push   $0x5843
    38ee:	ff 35 8c 6b 00 00    	push   0x6b8c
    38f4:	e8 47 0e 00 00       	call   4740 <printf>
      exit(0);
    38f9:	83 c4 14             	add    $0x14,%esp
    38fc:	6a 00                	push   $0x0
    38fe:	e8 af 0c 00 00       	call   45b2 <exit>
    3903:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 5000; i++){
    3906:	83 c6 01             	add    $0x1,%esi
    *b = 1;
    3909:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    390c:	8d 7b 01             	lea    0x1(%ebx),%edi
  for(i = 0; i < 5000; i++){
    390f:	81 fe 88 13 00 00    	cmp    $0x1388,%esi
    3915:	75 b9                	jne    38d0 <sbrktest+0x40>
  pid = fork();
    3917:	e8 8e 0c 00 00       	call   45aa <fork>
  if(c != a + 1){
    391c:	83 c3 02             	add    $0x2,%ebx
  pid = fork();
    391f:	89 c6                	mov    %eax,%esi
  if(pid < 0){
    3921:	85 c0                	test   %eax,%eax
    3923:	0f 88 8c 03 00 00    	js     3cb5 <sbrktest+0x425>
  c = sbrk(1);
    3929:	83 ec 0c             	sub    $0xc,%esp
    392c:	6a 01                	push   $0x1
    392e:	e8 07 0d 00 00       	call   463a <sbrk>
  c = sbrk(1);
    3933:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    393a:	e8 fb 0c 00 00       	call   463a <sbrk>
  if(c != a + 1){
    393f:	83 c4 10             	add    $0x10,%esp
    3942:	39 c3                	cmp    %eax,%ebx
    3944:	74 22                	je     3968 <sbrktest+0xd8>
    printf(stdout, "sbrk test failed post-fork\n");
    3946:	83 ec 08             	sub    $0x8,%esp
    3949:	68 75 58 00 00       	push   $0x5875
    394e:	ff 35 8c 6b 00 00    	push   0x6b8c
    3954:	e8 e7 0d 00 00       	call   4740 <printf>
    exit(0);
    3959:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3960:	e8 4d 0c 00 00       	call   45b2 <exit>
    3965:	83 c4 10             	add    $0x10,%esp
  if(pid == 0)
    3968:	85 f6                	test   %esi,%esi
    396a:	0f 84 90 02 00 00    	je     3c00 <sbrktest+0x370>
  wait();
    3970:	e8 45 0c 00 00       	call   45ba <wait>
  a = sbrk(0);
    3975:	83 ec 0c             	sub    $0xc,%esp
    3978:	6a 00                	push   $0x0
    397a:	e8 bb 0c 00 00       	call   463a <sbrk>
    397f:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
    3981:	b8 00 00 40 06       	mov    $0x6400000,%eax
    3986:	29 d8                	sub    %ebx,%eax
  p = sbrk(amt);
    3988:	89 04 24             	mov    %eax,(%esp)
    398b:	e8 aa 0c 00 00       	call   463a <sbrk>
  if (p != a) {
    3990:	83 c4 10             	add    $0x10,%esp
    3993:	39 c3                	cmp    %eax,%ebx
    3995:	74 22                	je     39b9 <sbrktest+0x129>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    3997:	83 ec 08             	sub    $0x8,%esp
    399a:	68 c4 5f 00 00       	push   $0x5fc4
    399f:	ff 35 8c 6b 00 00    	push   0x6b8c
    39a5:	e8 96 0d 00 00       	call   4740 <printf>
    exit(0);
    39aa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    39b1:	e8 fc 0b 00 00       	call   45b2 <exit>
    39b6:	83 c4 10             	add    $0x10,%esp
  a = sbrk(0);
    39b9:	83 ec 0c             	sub    $0xc,%esp
  *lastaddr = 99;
    39bc:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
  a = sbrk(0);
    39c3:	6a 00                	push   $0x0
    39c5:	e8 70 0c 00 00       	call   463a <sbrk>
  c = sbrk(-4096);
    39ca:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  a = sbrk(0);
    39d1:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    39d3:	e8 62 0c 00 00       	call   463a <sbrk>
  if(c == (char*)0xffffffff){
    39d8:	83 c4 10             	add    $0x10,%esp
    39db:	83 f8 ff             	cmp    $0xffffffff,%eax
    39de:	0f 84 61 03 00 00    	je     3d45 <sbrktest+0x4b5>
  c = sbrk(0);
    39e4:	83 ec 0c             	sub    $0xc,%esp
    39e7:	6a 00                	push   $0x0
    39e9:	e8 4c 0c 00 00       	call   463a <sbrk>
  if(c != a - 4096){
    39ee:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    39f4:	83 c4 10             	add    $0x10,%esp
    39f7:	39 d0                	cmp    %edx,%eax
    39f9:	74 21                	je     3a1c <sbrktest+0x18c>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    39fb:	50                   	push   %eax
    39fc:	53                   	push   %ebx
    39fd:	68 04 60 00 00       	push   $0x6004
    3a02:	ff 35 8c 6b 00 00    	push   0x6b8c
    3a08:	e8 33 0d 00 00       	call   4740 <printf>
    exit(0);
    3a0d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a14:	e8 99 0b 00 00       	call   45b2 <exit>
    3a19:	83 c4 10             	add    $0x10,%esp
  a = sbrk(0);
    3a1c:	83 ec 0c             	sub    $0xc,%esp
    3a1f:	6a 00                	push   $0x0
    3a21:	e8 14 0c 00 00       	call   463a <sbrk>
  c = sbrk(4096);
    3a26:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
  a = sbrk(0);
    3a2d:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    3a2f:	e8 06 0c 00 00       	call   463a <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    3a34:	83 c4 10             	add    $0x10,%esp
  c = sbrk(4096);
    3a37:	89 c6                	mov    %eax,%esi
  if(c != a || sbrk(0) != a + 4096){
    3a39:	39 c3                	cmp    %eax,%ebx
    3a3b:	0f 84 54 02 00 00    	je     3c95 <sbrktest+0x405>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    3a41:	56                   	push   %esi
    3a42:	53                   	push   %ebx
    3a43:	68 3c 60 00 00       	push   $0x603c
    3a48:	ff 35 8c 6b 00 00    	push   0x6b8c
    3a4e:	e8 ed 0c 00 00       	call   4740 <printf>
    exit(0);
    3a53:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a5a:	e8 53 0b 00 00       	call   45b2 <exit>
    3a5f:	83 c4 10             	add    $0x10,%esp
  if(*lastaddr == 99){
    3a62:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    3a69:	0f 84 af 02 00 00    	je     3d1e <sbrktest+0x48e>
  a = sbrk(0);
    3a6f:	83 ec 0c             	sub    $0xc,%esp
    3a72:	6a 00                	push   $0x0
    3a74:	e8 c1 0b 00 00       	call   463a <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    3a79:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a = sbrk(0);
    3a80:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    3a82:	e8 b3 0b 00 00       	call   463a <sbrk>
    3a87:	89 c2                	mov    %eax,%edx
    3a89:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    3a8c:	29 d0                	sub    %edx,%eax
    3a8e:	89 04 24             	mov    %eax,(%esp)
    3a91:	e8 a4 0b 00 00       	call   463a <sbrk>
  if(c != a){
    3a96:	83 c4 10             	add    $0x10,%esp
    3a99:	39 c3                	cmp    %eax,%ebx
    3a9b:	74 21                	je     3abe <sbrktest+0x22e>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    3a9d:	50                   	push   %eax
    3a9e:	53                   	push   %ebx
    3a9f:	68 94 60 00 00       	push   $0x6094
    3aa4:	ff 35 8c 6b 00 00    	push   0x6b8c
    3aaa:	e8 91 0c 00 00       	call   4740 <printf>
    exit(0);
    3aaf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ab6:	e8 f7 0a 00 00       	call   45b2 <exit>
    3abb:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 5000; i++){
    3abe:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    3ac3:	eb 44                	jmp    3b09 <sbrktest+0x279>
    3ac5:	8d 76 00             	lea    0x0(%esi),%esi
    if(pid == 0){
    3ac8:	75 2c                	jne    3af6 <sbrktest+0x266>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3aca:	0f be 03             	movsbl (%ebx),%eax
    3acd:	50                   	push   %eax
    3ace:	53                   	push   %ebx
    3acf:	68 ac 58 00 00       	push   $0x58ac
    3ad4:	ff 35 8c 6b 00 00    	push   0x6b8c
    3ada:	e8 61 0c 00 00       	call   4740 <printf>
      kill(ppid);
    3adf:	89 34 24             	mov    %esi,(%esp)
    3ae2:	e8 fb 0a 00 00       	call   45e2 <kill>
      exit(0);
    3ae7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3aee:	e8 bf 0a 00 00       	call   45b2 <exit>
    3af3:	83 c4 10             	add    $0x10,%esp
    wait();
    3af6:	e8 bf 0a 00 00       	call   45ba <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3afb:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    3b01:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    3b07:	74 34                	je     3b3d <sbrktest+0x2ad>
    ppid = getpid();
    3b09:	e8 24 0b 00 00       	call   4632 <getpid>
    3b0e:	89 c6                	mov    %eax,%esi
    pid = fork();
    3b10:	e8 95 0a 00 00       	call   45aa <fork>
    if(pid < 0){
    3b15:	85 c0                	test   %eax,%eax
    3b17:	79 af                	jns    3ac8 <sbrktest+0x238>
      printf(stdout, "fork failed\n");
    3b19:	83 ec 08             	sub    $0x8,%esp
    3b1c:	68 89 59 00 00       	push   $0x5989
    3b21:	ff 35 8c 6b 00 00    	push   0x6b8c
    3b27:	e8 14 0c 00 00       	call   4740 <printf>
      exit(0);
    3b2c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3b33:	e8 7a 0a 00 00       	call   45b2 <exit>
    3b38:	83 c4 10             	add    $0x10,%esp
    3b3b:	eb b9                	jmp    3af6 <sbrktest+0x266>
  if(pipe(fds) != 0){
    3b3d:	83 ec 0c             	sub    $0xc,%esp
    3b40:	8d 45 b8             	lea    -0x48(%ebp),%eax
    3b43:	50                   	push   %eax
    3b44:	e8 79 0a 00 00       	call   45c2 <pipe>
    3b49:	83 c4 10             	add    $0x10,%esp
    3b4c:	85 c0                	test   %eax,%eax
    3b4e:	0f 85 1e 01 00 00    	jne    3c72 <sbrktest+0x3e2>
    3b54:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    3b57:	8d 75 e8             	lea    -0x18(%ebp),%esi
  for(i = 0; i < 5000; i++){
    3b5a:	89 df                	mov    %ebx,%edi
    3b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((pids[i] = fork()) == 0){
    3b60:	e8 45 0a 00 00       	call   45aa <fork>
    3b65:	89 07                	mov    %eax,(%edi)
    3b67:	85 c0                	test   %eax,%eax
    3b69:	0f 84 c1 00 00 00    	je     3c30 <sbrktest+0x3a0>
    if(pids[i] != -1)
    3b6f:	83 f8 ff             	cmp    $0xffffffff,%eax
    3b72:	74 14                	je     3b88 <sbrktest+0x2f8>
      read(fds[0], &scratch, 1);
    3b74:	83 ec 04             	sub    $0x4,%esp
    3b77:	8d 45 b7             	lea    -0x49(%ebp),%eax
    3b7a:	6a 01                	push   $0x1
    3b7c:	50                   	push   %eax
    3b7d:	ff 75 b8             	push   -0x48(%ebp)
    3b80:	e8 45 0a 00 00       	call   45ca <read>
    3b85:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3b88:	83 c7 04             	add    $0x4,%edi
    3b8b:	39 f7                	cmp    %esi,%edi
    3b8d:	75 d1                	jne    3b60 <sbrktest+0x2d0>
  c = sbrk(4096);
    3b8f:	83 ec 0c             	sub    $0xc,%esp
    3b92:	68 00 10 00 00       	push   $0x1000
    3b97:	e8 9e 0a 00 00       	call   463a <sbrk>
    3b9c:	83 c4 10             	add    $0x10,%esp
    3b9f:	89 c7                	mov    %eax,%edi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3ba1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(pids[i] == -1)
    3ba8:	8b 03                	mov    (%ebx),%eax
    3baa:	83 f8 ff             	cmp    $0xffffffff,%eax
    3bad:	74 11                	je     3bc0 <sbrktest+0x330>
    kill(pids[i]);
    3baf:	83 ec 0c             	sub    $0xc,%esp
    3bb2:	50                   	push   %eax
    3bb3:	e8 2a 0a 00 00       	call   45e2 <kill>
    wait();
    3bb8:	e8 fd 09 00 00       	call   45ba <wait>
    3bbd:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3bc0:	83 c3 04             	add    $0x4,%ebx
    3bc3:	39 f3                	cmp    %esi,%ebx
    3bc5:	75 e1                	jne    3ba8 <sbrktest+0x318>
  if(c == (char*)0xffffffff){
    3bc7:	83 ff ff             	cmp    $0xffffffff,%edi
    3bca:	0f 84 9c 01 00 00    	je     3d6c <sbrktest+0x4dc>
  if(sbrk(0) > oldbrk)
    3bd0:	83 ec 0c             	sub    $0xc,%esp
    3bd3:	6a 00                	push   $0x0
    3bd5:	e8 60 0a 00 00       	call   463a <sbrk>
    3bda:	83 c4 10             	add    $0x10,%esp
    3bdd:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    3be0:	72 30                	jb     3c12 <sbrktest+0x382>
  printf(stdout, "sbrk test OK\n");
    3be2:	83 ec 08             	sub    $0x8,%esp
    3be5:	68 e0 58 00 00       	push   $0x58e0
    3bea:	ff 35 8c 6b 00 00    	push   0x6b8c
    3bf0:	e8 4b 0b 00 00       	call   4740 <printf>
}
    3bf5:	83 c4 10             	add    $0x10,%esp
    3bf8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3bfb:	5b                   	pop    %ebx
    3bfc:	5e                   	pop    %esi
    3bfd:	5f                   	pop    %edi
    3bfe:	5d                   	pop    %ebp
    3bff:	c3                   	ret
    exit(0);
    3c00:	83 ec 0c             	sub    $0xc,%esp
    3c03:	6a 00                	push   $0x0
    3c05:	e8 a8 09 00 00       	call   45b2 <exit>
    3c0a:	83 c4 10             	add    $0x10,%esp
    3c0d:	e9 5e fd ff ff       	jmp    3970 <sbrktest+0xe0>
    sbrk(-(sbrk(0) - oldbrk));
    3c12:	83 ec 0c             	sub    $0xc,%esp
    3c15:	6a 00                	push   $0x0
    3c17:	e8 1e 0a 00 00       	call   463a <sbrk>
    3c1c:	89 c2                	mov    %eax,%edx
    3c1e:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    3c21:	29 d0                	sub    %edx,%eax
    3c23:	89 04 24             	mov    %eax,(%esp)
    3c26:	e8 0f 0a 00 00       	call   463a <sbrk>
    3c2b:	83 c4 10             	add    $0x10,%esp
    3c2e:	eb b2                	jmp    3be2 <sbrktest+0x352>
      sbrk(BIG - (uint)sbrk(0));
    3c30:	83 ec 0c             	sub    $0xc,%esp
    3c33:	6a 00                	push   $0x0
    3c35:	e8 00 0a 00 00       	call   463a <sbrk>
    3c3a:	89 c2                	mov    %eax,%edx
    3c3c:	b8 00 00 40 06       	mov    $0x6400000,%eax
    3c41:	29 d0                	sub    %edx,%eax
    3c43:	89 04 24             	mov    %eax,(%esp)
    3c46:	e8 ef 09 00 00       	call   463a <sbrk>
      write(fds[1], "x", 1);
    3c4b:	83 c4 0c             	add    $0xc,%esp
    3c4e:	6a 01                	push   $0x1
    3c50:	68 a1 53 00 00       	push   $0x53a1
    3c55:	ff 75 bc             	push   -0x44(%ebp)
    3c58:	e8 75 09 00 00       	call   45d2 <write>
    3c5d:	83 c4 10             	add    $0x10,%esp
      for(;;) sleep(1000);
    3c60:	83 ec 0c             	sub    $0xc,%esp
    3c63:	68 e8 03 00 00       	push   $0x3e8
    3c68:	e8 d5 09 00 00       	call   4642 <sleep>
    3c6d:	83 c4 10             	add    $0x10,%esp
    3c70:	eb ee                	jmp    3c60 <sbrktest+0x3d0>
    printf(1, "pipe() failed\n");
    3c72:	83 ec 08             	sub    $0x8,%esp
    3c75:	68 81 4d 00 00       	push   $0x4d81
    3c7a:	6a 01                	push   $0x1
    3c7c:	e8 bf 0a 00 00       	call   4740 <printf>
    exit(0);
    3c81:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3c88:	e8 25 09 00 00       	call   45b2 <exit>
    3c8d:	83 c4 10             	add    $0x10,%esp
    3c90:	e9 bf fe ff ff       	jmp    3b54 <sbrktest+0x2c4>
  if(c != a || sbrk(0) != a + 4096){
    3c95:	83 ec 0c             	sub    $0xc,%esp
    3c98:	6a 00                	push   $0x0
    3c9a:	e8 9b 09 00 00       	call   463a <sbrk>
    3c9f:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    3ca5:	83 c4 10             	add    $0x10,%esp
    3ca8:	39 c2                	cmp    %eax,%edx
    3caa:	0f 85 91 fd ff ff    	jne    3a41 <sbrktest+0x1b1>
    3cb0:	e9 ad fd ff ff       	jmp    3a62 <sbrktest+0x1d2>
    printf(stdout, "sbrk test fork failed\n");
    3cb5:	83 ec 08             	sub    $0x8,%esp
    3cb8:	68 5e 58 00 00       	push   $0x585e
    3cbd:	ff 35 8c 6b 00 00    	push   0x6b8c
    3cc3:	e8 78 0a 00 00       	call   4740 <printf>
    exit(0);
    3cc8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ccf:	e8 de 08 00 00       	call   45b2 <exit>
  c = sbrk(1);
    3cd4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3cdb:	e8 5a 09 00 00       	call   463a <sbrk>
  c = sbrk(1);
    3ce0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3ce7:	e8 4e 09 00 00       	call   463a <sbrk>
  if(c != a + 1){
    3cec:	83 c4 10             	add    $0x10,%esp
    3cef:	39 c3                	cmp    %eax,%ebx
    3cf1:	0f 84 79 fc ff ff    	je     3970 <sbrktest+0xe0>
    printf(stdout, "sbrk test failed post-fork\n");
    3cf7:	83 ec 08             	sub    $0x8,%esp
    3cfa:	68 75 58 00 00       	push   $0x5875
    3cff:	ff 35 8c 6b 00 00    	push   0x6b8c
    3d05:	e8 36 0a 00 00       	call   4740 <printf>
    exit(0);
    3d0a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d11:	e8 9c 08 00 00       	call   45b2 <exit>
    3d16:	83 c4 10             	add    $0x10,%esp
    3d19:	e9 52 fc ff ff       	jmp    3970 <sbrktest+0xe0>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    3d1e:	83 ec 08             	sub    $0x8,%esp
    3d21:	68 64 60 00 00       	push   $0x6064
    3d26:	ff 35 8c 6b 00 00    	push   0x6b8c
    3d2c:	e8 0f 0a 00 00       	call   4740 <printf>
    exit(0);
    3d31:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d38:	e8 75 08 00 00       	call   45b2 <exit>
    3d3d:	83 c4 10             	add    $0x10,%esp
    3d40:	e9 2a fd ff ff       	jmp    3a6f <sbrktest+0x1df>
    printf(stdout, "sbrk could not deallocate\n");
    3d45:	83 ec 08             	sub    $0x8,%esp
    3d48:	68 91 58 00 00       	push   $0x5891
    3d4d:	ff 35 8c 6b 00 00    	push   0x6b8c
    3d53:	e8 e8 09 00 00       	call   4740 <printf>
    exit(0);
    3d58:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d5f:	e8 4e 08 00 00       	call   45b2 <exit>
    3d64:	83 c4 10             	add    $0x10,%esp
    3d67:	e9 78 fc ff ff       	jmp    39e4 <sbrktest+0x154>
    printf(stdout, "failed sbrk leaked memory\n");
    3d6c:	83 ec 08             	sub    $0x8,%esp
    3d6f:	68 c5 58 00 00       	push   $0x58c5
    3d74:	ff 35 8c 6b 00 00    	push   0x6b8c
    3d7a:	e8 c1 09 00 00       	call   4740 <printf>
    exit(0);
    3d7f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d86:	e8 27 08 00 00       	call   45b2 <exit>
    3d8b:	83 c4 10             	add    $0x10,%esp
    3d8e:	e9 3d fe ff ff       	jmp    3bd0 <sbrktest+0x340>
    3d93:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3d9a:	00 
    3d9b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00003da0 <validateint>:
}
    3da0:	c3                   	ret
    3da1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3da8:	00 
    3da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003db0 <validatetest>:
{
    3db0:	55                   	push   %ebp
    3db1:	89 e5                	mov    %esp,%ebp
    3db3:	56                   	push   %esi
  for(p = 0; p <= (uint)hi; p += 4096){
    3db4:	31 f6                	xor    %esi,%esi
{
    3db6:	53                   	push   %ebx
  printf(stdout, "validate test\n");
    3db7:	83 ec 08             	sub    $0x8,%esp
    3dba:	68 ee 58 00 00       	push   $0x58ee
    3dbf:	ff 35 8c 6b 00 00    	push   0x6b8c
    3dc5:	e8 76 09 00 00       	call   4740 <printf>
    3dca:	83 c4 10             	add    $0x10,%esp
    3dcd:	eb 69                	jmp    3e38 <validatetest+0x88>
    3dcf:	90                   	nop
    sleep(0);
    3dd0:	83 ec 0c             	sub    $0xc,%esp
    3dd3:	6a 00                	push   $0x0
    3dd5:	e8 68 08 00 00       	call   4642 <sleep>
    sleep(0);
    3dda:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3de1:	e8 5c 08 00 00       	call   4642 <sleep>
    kill(pid);
    3de6:	89 1c 24             	mov    %ebx,(%esp)
    3de9:	e8 f4 07 00 00       	call   45e2 <kill>
    wait();
    3dee:	e8 c7 07 00 00       	call   45ba <wait>
    if(link("nosuchfile", (char*)p) != -1){
    3df3:	58                   	pop    %eax
    3df4:	5a                   	pop    %edx
    3df5:	56                   	push   %esi
    3df6:	68 fd 58 00 00       	push   $0x58fd
    3dfb:	e8 12 08 00 00       	call   4612 <link>
    3e00:	83 c4 10             	add    $0x10,%esp
    3e03:	83 f8 ff             	cmp    $0xffffffff,%eax
    3e06:	74 22                	je     3e2a <validatetest+0x7a>
      printf(stdout, "link should not succeed\n");
    3e08:	83 ec 08             	sub    $0x8,%esp
    3e0b:	68 08 59 00 00       	push   $0x5908
    3e10:	ff 35 8c 6b 00 00    	push   0x6b8c
    3e16:	e8 25 09 00 00       	call   4740 <printf>
      exit(0);
    3e1b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e22:	e8 8b 07 00 00       	call   45b2 <exit>
    3e27:	83 c4 10             	add    $0x10,%esp
  for(p = 0; p <= (uint)hi; p += 4096){
    3e2a:	81 c6 00 10 00 00    	add    $0x1000,%esi
    3e30:	81 fe 00 40 11 00    	cmp    $0x114000,%esi
    3e36:	74 1d                	je     3e55 <validatetest+0xa5>
    if((pid = fork()) == 0){
    3e38:	e8 6d 07 00 00       	call   45aa <fork>
    3e3d:	89 c3                	mov    %eax,%ebx
    3e3f:	85 c0                	test   %eax,%eax
    3e41:	75 8d                	jne    3dd0 <validatetest+0x20>
      exit(0);
    3e43:	83 ec 0c             	sub    $0xc,%esp
    3e46:	6a 00                	push   $0x0
    3e48:	e8 65 07 00 00       	call   45b2 <exit>
    3e4d:	83 c4 10             	add    $0x10,%esp
    3e50:	e9 7b ff ff ff       	jmp    3dd0 <validatetest+0x20>
  printf(stdout, "validate ok\n");
    3e55:	83 ec 08             	sub    $0x8,%esp
    3e58:	68 21 59 00 00       	push   $0x5921
    3e5d:	ff 35 8c 6b 00 00    	push   0x6b8c
    3e63:	e8 d8 08 00 00       	call   4740 <printf>
}
    3e68:	83 c4 10             	add    $0x10,%esp
    3e6b:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3e6e:	5b                   	pop    %ebx
    3e6f:	5e                   	pop    %esi
    3e70:	5d                   	pop    %ebp
    3e71:	c3                   	ret
    3e72:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3e79:	00 
    3e7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00003e80 <bsstest>:
{
    3e80:	55                   	push   %ebp
    3e81:	89 e5                	mov    %esp,%ebp
    3e83:	53                   	push   %ebx
  for(i = 0; i < sizeof(uninit); i++){
    3e84:	31 db                	xor    %ebx,%ebx
{
    3e86:	83 ec 0c             	sub    $0xc,%esp
  printf(stdout, "bss test\n");
    3e89:	68 2e 59 00 00       	push   $0x592e
    3e8e:	ff 35 8c 6b 00 00    	push   0x6b8c
    3e94:	e8 a7 08 00 00       	call   4740 <printf>
    3e99:	83 c4 10             	add    $0x10,%esp
    3e9c:	eb 0d                	jmp    3eab <bsstest+0x2b>
    3e9e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < sizeof(uninit); i++){
    3ea0:	83 c3 01             	add    $0x1,%ebx
    3ea3:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
    3ea9:	74 36                	je     3ee1 <bsstest+0x61>
    if(uninit[i] != '\0'){
    3eab:	80 bb c0 6b 00 00 00 	cmpb   $0x0,0x6bc0(%ebx)
    3eb2:	74 ec                	je     3ea0 <bsstest+0x20>
      printf(stdout, "bss test failed\n");
    3eb4:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < sizeof(uninit); i++){
    3eb7:	83 c3 01             	add    $0x1,%ebx
      printf(stdout, "bss test failed\n");
    3eba:	68 38 59 00 00       	push   $0x5938
    3ebf:	ff 35 8c 6b 00 00    	push   0x6b8c
    3ec5:	e8 76 08 00 00       	call   4740 <printf>
      exit(0);
    3eca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ed1:	e8 dc 06 00 00       	call   45b2 <exit>
    3ed6:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(uninit); i++){
    3ed9:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
    3edf:	75 ca                	jne    3eab <bsstest+0x2b>
  printf(stdout, "bss test ok\n");
    3ee1:	83 ec 08             	sub    $0x8,%esp
    3ee4:	68 49 59 00 00       	push   $0x5949
    3ee9:	ff 35 8c 6b 00 00    	push   0x6b8c
    3eef:	e8 4c 08 00 00       	call   4740 <printf>
}
    3ef4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3ef7:	83 c4 10             	add    $0x10,%esp
    3efa:	c9                   	leave
    3efb:	c3                   	ret
    3efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003f00 <bigargtest>:
{
    3f00:	55                   	push   %ebp
    3f01:	89 e5                	mov    %esp,%ebp
    3f03:	53                   	push   %ebx
    3f04:	83 ec 10             	sub    $0x10,%esp
  unlink("bigarg-ok");
    3f07:	68 56 59 00 00       	push   $0x5956
    3f0c:	e8 f1 06 00 00       	call   4602 <unlink>
  pid = fork();
    3f11:	e8 94 06 00 00       	call   45aa <fork>
  if(pid == 0){
    3f16:	83 c4 10             	add    $0x10,%esp
    3f19:	85 c0                	test   %eax,%eax
    3f1b:	0f 85 df 00 00 00    	jne    4000 <bigargtest+0x100>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3f21:	c7 04 85 e0 b2 00 00 	movl   $0x60b8,0xb2e0(,%eax,4)
    3f28:	b8 60 00 00 
    for(i = 0; i < MAXARG-1; i++)
    3f2c:	b8 01 00 00 00       	mov    $0x1,%eax
    3f31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3f38:	c7 04 85 e0 b2 00 00 	movl   $0x60b8,0xb2e0(,%eax,4)
    3f3f:	b8 60 00 00 
    3f43:	c7 04 85 e4 b2 00 00 	movl   $0x60b8,0xb2e4(,%eax,4)
    3f4a:	b8 60 00 00 
    for(i = 0; i < MAXARG-1; i++)
    3f4e:	83 c0 02             	add    $0x2,%eax
    3f51:	83 f8 1f             	cmp    $0x1f,%eax
    3f54:	75 e2                	jne    3f38 <bigargtest+0x38>
    args[MAXARG-1] = 0;
    3f56:	c7 05 5c b3 00 00 00 	movl   $0x0,0xb35c
    3f5d:	00 00 00 
    printf(stdout, "bigarg test\n");
    3f60:	83 ec 08             	sub    $0x8,%esp
    3f63:	68 60 59 00 00       	push   $0x5960
    3f68:	ff 35 8c 6b 00 00    	push   0x6b8c
    3f6e:	e8 cd 07 00 00       	call   4740 <printf>
    exec("echo", args);
    3f73:	58                   	pop    %eax
    3f74:	5a                   	pop    %edx
    3f75:	68 e0 b2 00 00       	push   $0xb2e0
    3f7a:	68 2d 4b 00 00       	push   $0x4b2d
    3f7f:	e8 66 06 00 00       	call   45ea <exec>
    printf(stdout, "bigarg test ok\n");
    3f84:	59                   	pop    %ecx
    3f85:	5b                   	pop    %ebx
    3f86:	68 6d 59 00 00       	push   $0x596d
    3f8b:	ff 35 8c 6b 00 00    	push   0x6b8c
    3f91:	e8 aa 07 00 00       	call   4740 <printf>
    fd = open("bigarg-ok", O_CREATE);
    3f96:	58                   	pop    %eax
    3f97:	5a                   	pop    %edx
    3f98:	68 00 02 00 00       	push   $0x200
    3f9d:	68 56 59 00 00       	push   $0x5956
    3fa2:	e8 4b 06 00 00       	call   45f2 <open>
    close(fd);
    3fa7:	89 04 24             	mov    %eax,(%esp)
    3faa:	e8 2b 06 00 00       	call   45da <close>
    exit(0);
    3faf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3fb6:	e8 f7 05 00 00       	call   45b2 <exit>
    3fbb:	83 c4 10             	add    $0x10,%esp
  wait();
    3fbe:	e8 f7 05 00 00       	call   45ba <wait>
  fd = open("bigarg-ok", 0);
    3fc3:	83 ec 08             	sub    $0x8,%esp
    3fc6:	6a 00                	push   $0x0
    3fc8:	68 56 59 00 00       	push   $0x5956
    3fcd:	e8 20 06 00 00       	call   45f2 <open>
  if(fd < 0){
    3fd2:	83 c4 10             	add    $0x10,%esp
  fd = open("bigarg-ok", 0);
    3fd5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    3fd7:	85 c0                	test   %eax,%eax
    3fd9:	78 55                	js     4030 <bigargtest+0x130>
  close(fd);
    3fdb:	83 ec 0c             	sub    $0xc,%esp
    3fde:	53                   	push   %ebx
    3fdf:	e8 f6 05 00 00       	call   45da <close>
  unlink("bigarg-ok");
    3fe4:	c7 04 24 56 59 00 00 	movl   $0x5956,(%esp)
    3feb:	e8 12 06 00 00       	call   4602 <unlink>
}
    3ff0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3ff3:	83 c4 10             	add    $0x10,%esp
    3ff6:	c9                   	leave
    3ff7:	c3                   	ret
    3ff8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    3fff:	00 
  } else if(pid < 0){
    4000:	79 bc                	jns    3fbe <bigargtest+0xbe>
    printf(stdout, "bigargtest: fork failed\n");
    4002:	83 ec 08             	sub    $0x8,%esp
    4005:	68 7d 59 00 00       	push   $0x597d
    400a:	ff 35 8c 6b 00 00    	push   0x6b8c
    4010:	e8 2b 07 00 00       	call   4740 <printf>
    exit(0);
    4015:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    401c:	e8 91 05 00 00       	call   45b2 <exit>
    4021:	83 c4 10             	add    $0x10,%esp
    4024:	eb 98                	jmp    3fbe <bigargtest+0xbe>
    4026:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    402d:	00 
    402e:	66 90                	xchg   %ax,%ax
    printf(stdout, "bigarg test failed!\n");
    4030:	83 ec 08             	sub    $0x8,%esp
    4033:	68 96 59 00 00       	push   $0x5996
    4038:	ff 35 8c 6b 00 00    	push   0x6b8c
    403e:	e8 fd 06 00 00       	call   4740 <printf>
    exit(0);
    4043:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    404a:	e8 63 05 00 00       	call   45b2 <exit>
    404f:	83 c4 10             	add    $0x10,%esp
    4052:	eb 87                	jmp    3fdb <bigargtest+0xdb>
    4054:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    405b:	00 
    405c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004060 <fsfull>:
{
    4060:	55                   	push   %ebp
    4061:	89 e5                	mov    %esp,%ebp
    4063:	57                   	push   %edi
    4064:	56                   	push   %esi
  for(nfiles = 0; ; nfiles++){
    4065:	31 f6                	xor    %esi,%esi
{
    4067:	53                   	push   %ebx
    4068:	83 ec 54             	sub    $0x54,%esp
  printf(1, "fsfull test\n");
    406b:	68 ab 59 00 00       	push   $0x59ab
    4070:	6a 01                	push   $0x1
    4072:	e8 c9 06 00 00       	call   4740 <printf>
    4077:	83 c4 10             	add    $0x10,%esp
    407a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    name[1] = '0' + nfiles / 1000;
    4080:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    4085:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    printf(1, "writing %s\n", name);
    408a:	83 ec 04             	sub    $0x4,%esp
    name[0] = 'f';
    408d:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    4091:	f7 e6                	mul    %esi
    name[5] = '\0';
    4093:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    4097:	c1 ea 06             	shr    $0x6,%edx
    409a:	8d 42 30             	lea    0x30(%edx),%eax
    409d:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    40a0:	69 c2 e8 03 00 00    	imul   $0x3e8,%edx,%eax
    40a6:	89 f2                	mov    %esi,%edx
    40a8:	29 c2                	sub    %eax,%edx
    40aa:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    40af:	f7 e2                	mul    %edx
    name[3] = '0' + (nfiles % 100) / 10;
    40b1:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    40b6:	c1 ea 05             	shr    $0x5,%edx
    40b9:	83 c2 30             	add    $0x30,%edx
    40bc:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    40bf:	f7 e6                	mul    %esi
    40c1:	c1 ea 05             	shr    $0x5,%edx
    40c4:	6b c2 64             	imul   $0x64,%edx,%eax
    40c7:	89 f2                	mov    %esi,%edx
    40c9:	29 c2                	sub    %eax,%edx
    40cb:	89 d0                	mov    %edx,%eax
    40cd:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    40cf:	89 f0                	mov    %esi,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    40d1:	c1 ea 03             	shr    $0x3,%edx
    40d4:	83 c2 30             	add    $0x30,%edx
    40d7:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    40da:	f7 e1                	mul    %ecx
    40dc:	89 f0                	mov    %esi,%eax
    40de:	c1 ea 03             	shr    $0x3,%edx
    40e1:	8d 14 92             	lea    (%edx,%edx,4),%edx
    40e4:	01 d2                	add    %edx,%edx
    40e6:	29 d0                	sub    %edx,%eax
    40e8:	83 c0 30             	add    $0x30,%eax
    40eb:	88 45 ac             	mov    %al,-0x54(%ebp)
    printf(1, "writing %s\n", name);
    40ee:	8d 45 a8             	lea    -0x58(%ebp),%eax
    40f1:	50                   	push   %eax
    40f2:	68 b8 59 00 00       	push   $0x59b8
    40f7:	6a 01                	push   $0x1
    40f9:	e8 42 06 00 00       	call   4740 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    40fe:	58                   	pop    %eax
    40ff:	8d 45 a8             	lea    -0x58(%ebp),%eax
    4102:	5a                   	pop    %edx
    4103:	68 02 02 00 00       	push   $0x202
    4108:	50                   	push   %eax
    4109:	e8 e4 04 00 00       	call   45f2 <open>
    if(fd < 0){
    410e:	83 c4 10             	add    $0x10,%esp
    int fd = open(name, O_CREATE|O_RDWR);
    4111:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    4113:	85 c0                	test   %eax,%eax
    4115:	78 4f                	js     4166 <fsfull+0x106>
    int total = 0;
    4117:	31 db                	xor    %ebx,%ebx
    4119:	eb 07                	jmp    4122 <fsfull+0xc2>
    411b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      total += cc;
    4120:	01 c3                	add    %eax,%ebx
      int cc = write(fd, buf, 512);
    4122:	83 ec 04             	sub    $0x4,%esp
    4125:	68 00 02 00 00       	push   $0x200
    412a:	68 e0 92 00 00       	push   $0x92e0
    412f:	57                   	push   %edi
    4130:	e8 9d 04 00 00       	call   45d2 <write>
      if(cc < 512)
    4135:	83 c4 10             	add    $0x10,%esp
    4138:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    413d:	7f e1                	jg     4120 <fsfull+0xc0>
    printf(1, "wrote %d bytes\n", total);
    413f:	83 ec 04             	sub    $0x4,%esp
    4142:	53                   	push   %ebx
    4143:	68 d4 59 00 00       	push   $0x59d4
    4148:	6a 01                	push   $0x1
    414a:	e8 f1 05 00 00       	call   4740 <printf>
    close(fd);
    414f:	89 3c 24             	mov    %edi,(%esp)
    4152:	e8 83 04 00 00       	call   45da <close>
    if(total == 0)
    4157:	83 c4 10             	add    $0x10,%esp
    415a:	85 db                	test   %ebx,%ebx
    415c:	74 1e                	je     417c <fsfull+0x11c>
  for(nfiles = 0; ; nfiles++){
    415e:	83 c6 01             	add    $0x1,%esi
    4161:	e9 1a ff ff ff       	jmp    4080 <fsfull+0x20>
      printf(1, "open %s failed\n", name);
    4166:	83 ec 04             	sub    $0x4,%esp
    4169:	8d 45 a8             	lea    -0x58(%ebp),%eax
    416c:	50                   	push   %eax
    416d:	68 c4 59 00 00       	push   $0x59c4
    4172:	6a 01                	push   $0x1
    4174:	e8 c7 05 00 00       	call   4740 <printf>
      break;
    4179:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + nfiles / 1000;
    417c:	bf d3 4d 62 10       	mov    $0x10624dd3,%edi
    name[2] = '0' + (nfiles % 1000) / 100;
    4181:	bb 1f 85 eb 51       	mov    $0x51eb851f,%ebx
    4186:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    418d:	00 
    418e:	66 90                	xchg   %ax,%ax
    name[1] = '0' + nfiles / 1000;
    4190:	89 f0                	mov    %esi,%eax
    unlink(name);
    4192:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'f';
    4195:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    4199:	f7 e7                	mul    %edi
    name[5] = '\0';
    419b:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    419f:	c1 ea 06             	shr    $0x6,%edx
    41a2:	8d 42 30             	lea    0x30(%edx),%eax
    41a5:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    41a8:	69 c2 e8 03 00 00    	imul   $0x3e8,%edx,%eax
    41ae:	89 f2                	mov    %esi,%edx
    41b0:	29 c2                	sub    %eax,%edx
    41b2:	89 d0                	mov    %edx,%eax
    41b4:	f7 e3                	mul    %ebx
    name[3] = '0' + (nfiles % 100) / 10;
    41b6:	89 f0                	mov    %esi,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    41b8:	c1 ea 05             	shr    $0x5,%edx
    41bb:	83 c2 30             	add    $0x30,%edx
    41be:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    41c1:	f7 e3                	mul    %ebx
    41c3:	c1 ea 05             	shr    $0x5,%edx
    41c6:	6b ca 64             	imul   $0x64,%edx,%ecx
    41c9:	89 f2                	mov    %esi,%edx
    41cb:	29 ca                	sub    %ecx,%edx
    41cd:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    41d2:	89 d0                	mov    %edx,%eax
    41d4:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    41d6:	89 f0                	mov    %esi,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    41d8:	c1 ea 03             	shr    $0x3,%edx
    41db:	83 c2 30             	add    $0x30,%edx
    41de:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    41e1:	f7 e1                	mul    %ecx
    41e3:	89 f0                	mov    %esi,%eax
    nfiles--;
    41e5:	83 ee 01             	sub    $0x1,%esi
    name[4] = '0' + (nfiles % 10);
    41e8:	c1 ea 03             	shr    $0x3,%edx
    41eb:	8d 14 92             	lea    (%edx,%edx,4),%edx
    41ee:	01 d2                	add    %edx,%edx
    41f0:	29 d0                	sub    %edx,%eax
    41f2:	83 c0 30             	add    $0x30,%eax
    41f5:	88 45 ac             	mov    %al,-0x54(%ebp)
    unlink(name);
    41f8:	8d 45 a8             	lea    -0x58(%ebp),%eax
    41fb:	50                   	push   %eax
    41fc:	e8 01 04 00 00       	call   4602 <unlink>
  while(nfiles >= 0){
    4201:	83 c4 10             	add    $0x10,%esp
    4204:	83 fe ff             	cmp    $0xffffffff,%esi
    4207:	75 87                	jne    4190 <fsfull+0x130>
  printf(1, "fsfull test finished\n");
    4209:	83 ec 08             	sub    $0x8,%esp
    420c:	68 e4 59 00 00       	push   $0x59e4
    4211:	6a 01                	push   $0x1
    4213:	e8 28 05 00 00       	call   4740 <printf>
}
    4218:	83 c4 10             	add    $0x10,%esp
    421b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    421e:	5b                   	pop    %ebx
    421f:	5e                   	pop    %esi
    4220:	5f                   	pop    %edi
    4221:	5d                   	pop    %ebp
    4222:	c3                   	ret
    4223:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    422a:	00 
    422b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

00004230 <uio>:
{
    4230:	55                   	push   %ebp
    4231:	89 e5                	mov    %esp,%ebp
    4233:	83 ec 10             	sub    $0x10,%esp
  printf(1, "uio test\n");
    4236:	68 fa 59 00 00       	push   $0x59fa
    423b:	6a 01                	push   $0x1
    423d:	e8 fe 04 00 00       	call   4740 <printf>
  pid = fork();
    4242:	e8 63 03 00 00       	call   45aa <fork>
  if(pid == 0){
    4247:	83 c4 10             	add    $0x10,%esp
    424a:	85 c0                	test   %eax,%eax
    424c:	74 22                	je     4270 <uio+0x40>
  } else if(pid < 0){
    424e:	78 58                	js     42a8 <uio+0x78>
  wait();
    4250:	e8 65 03 00 00       	call   45ba <wait>
  printf(1, "uio test done\n");
    4255:	83 ec 08             	sub    $0x8,%esp
    4258:	68 04 5a 00 00       	push   $0x5a04
    425d:	6a 01                	push   $0x1
    425f:	e8 dc 04 00 00       	call   4740 <printf>
}
    4264:	83 c4 10             	add    $0x10,%esp
    4267:	c9                   	leave
    4268:	c3                   	ret
    4269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    4270:	b8 09 00 00 00       	mov    $0x9,%eax
    4275:	ba 70 00 00 00       	mov    $0x70,%edx
    427a:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    427b:	ba 71 00 00 00       	mov    $0x71,%edx
    4280:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    4281:	83 ec 08             	sub    $0x8,%esp
    4284:	68 98 61 00 00       	push   $0x6198
    printf (1, "fork failed\n");
    4289:	6a 01                	push   $0x1
    428b:	e8 b0 04 00 00       	call   4740 <printf>
    exit(0);
    4290:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4297:	e8 16 03 00 00       	call   45b2 <exit>
    429c:	83 c4 10             	add    $0x10,%esp
    429f:	eb af                	jmp    4250 <uio+0x20>
    42a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf (1, "fork failed\n");
    42a8:	83 ec 08             	sub    $0x8,%esp
    42ab:	68 89 59 00 00       	push   $0x5989
    42b0:	eb d7                	jmp    4289 <uio+0x59>
    42b2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    42b9:	00 
    42ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000042c0 <argptest>:
{
    42c0:	55                   	push   %ebp
    42c1:	89 e5                	mov    %esp,%ebp
    42c3:	53                   	push   %ebx
    42c4:	83 ec 0c             	sub    $0xc,%esp
  fd = open("init", O_RDONLY);
    42c7:	6a 00                	push   $0x0
    42c9:	68 13 5a 00 00       	push   $0x5a13
    42ce:	e8 1f 03 00 00       	call   45f2 <open>
  if (fd < 0) {
    42d3:	83 c4 10             	add    $0x10,%esp
  fd = open("init", O_RDONLY);
    42d6:	89 c3                	mov    %eax,%ebx
  if (fd < 0) {
    42d8:	85 c0                	test   %eax,%eax
    42da:	78 3c                	js     4318 <argptest+0x58>
  read(fd, sbrk(0) - 1, -1);
    42dc:	83 ec 0c             	sub    $0xc,%esp
    42df:	6a 00                	push   $0x0
    42e1:	e8 54 03 00 00       	call   463a <sbrk>
    42e6:	83 c4 0c             	add    $0xc,%esp
    42e9:	83 e8 01             	sub    $0x1,%eax
    42ec:	6a ff                	push   $0xffffffff
    42ee:	50                   	push   %eax
    42ef:	53                   	push   %ebx
    42f0:	e8 d5 02 00 00       	call   45ca <read>
  close(fd);
    42f5:	89 1c 24             	mov    %ebx,(%esp)
    42f8:	e8 dd 02 00 00       	call   45da <close>
  printf(1, "arg test passed\n");
    42fd:	58                   	pop    %eax
    42fe:	5a                   	pop    %edx
    42ff:	68 25 5a 00 00       	push   $0x5a25
    4304:	6a 01                	push   $0x1
    4306:	e8 35 04 00 00       	call   4740 <printf>
}
    430b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    430e:	83 c4 10             	add    $0x10,%esp
    4311:	c9                   	leave
    4312:	c3                   	ret
    4313:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    printf(2, "open failed\n");
    4318:	83 ec 08             	sub    $0x8,%esp
    431b:	68 18 5a 00 00       	push   $0x5a18
    4320:	6a 02                	push   $0x2
    4322:	e8 19 04 00 00       	call   4740 <printf>
    exit(0);
    4327:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    432e:	e8 7f 02 00 00       	call   45b2 <exit>
    4333:	83 c4 10             	add    $0x10,%esp
    4336:	eb a4                	jmp    42dc <argptest+0x1c>
    4338:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    433f:	00 

00004340 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    4340:	69 05 88 6b 00 00 0d 	imul   $0x19660d,0x6b88,%eax
    4347:	66 19 00 
    434a:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    434f:	a3 88 6b 00 00       	mov    %eax,0x6b88
}
    4354:	c3                   	ret
    4355:	66 90                	xchg   %ax,%ax
    4357:	66 90                	xchg   %ax,%ax
    4359:	66 90                	xchg   %ax,%ax
    435b:	66 90                	xchg   %ax,%ax
    435d:	66 90                	xchg   %ax,%ax
    435f:	90                   	nop

00004360 <strcpy>:
#include "user.h"
#include "x86.h"

// String and memory utilities

char* strcpy(char *s, const char *t) {
    4360:	55                   	push   %ebp
  char *os = s;
  while ((*s++ = *t++) != 0);
    4361:	31 c0                	xor    %eax,%eax
char* strcpy(char *s, const char *t) {
    4363:	89 e5                	mov    %esp,%ebp
    4365:	53                   	push   %ebx
    4366:	8b 4d 08             	mov    0x8(%ebp),%ecx
    4369:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    436c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while ((*s++ = *t++) != 0);
    4370:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    4374:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    4377:	83 c0 01             	add    $0x1,%eax
    437a:	84 d2                	test   %dl,%dl
    437c:	75 f2                	jne    4370 <strcpy+0x10>
  return os;
}
    437e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4381:	89 c8                	mov    %ecx,%eax
    4383:	c9                   	leave
    4384:	c3                   	ret
    4385:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    438c:	00 
    438d:	8d 76 00             	lea    0x0(%esi),%esi

00004390 <strcmp>:

int strcmp(const char *p, const char *q) {
    4390:	55                   	push   %ebp
    4391:	89 e5                	mov    %esp,%ebp
    4393:	53                   	push   %ebx
    4394:	8b 55 08             	mov    0x8(%ebp),%edx
    4397:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while (*p && *p == *q)
    439a:	0f b6 02             	movzbl (%edx),%eax
    439d:	84 c0                	test   %al,%al
    439f:	75 17                	jne    43b8 <strcmp+0x28>
    43a1:	eb 3a                	jmp    43dd <strcmp+0x4d>
    43a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    43a8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
    43ac:	83 c2 01             	add    $0x1,%edx
    43af:	8d 59 01             	lea    0x1(%ecx),%ebx
  while (*p && *p == *q)
    43b2:	84 c0                	test   %al,%al
    43b4:	74 1a                	je     43d0 <strcmp+0x40>
    43b6:	89 d9                	mov    %ebx,%ecx
    43b8:	0f b6 19             	movzbl (%ecx),%ebx
    43bb:	38 c3                	cmp    %al,%bl
    43bd:	74 e9                	je     43a8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
    43bf:	29 d8                	sub    %ebx,%eax
}
    43c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    43c4:	c9                   	leave
    43c5:	c3                   	ret
    43c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    43cd:	00 
    43ce:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
    43d0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    43d4:	31 c0                	xor    %eax,%eax
    43d6:	29 d8                	sub    %ebx,%eax
}
    43d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    43db:	c9                   	leave
    43dc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
    43dd:	0f b6 19             	movzbl (%ecx),%ebx
    43e0:	31 c0                	xor    %eax,%eax
    43e2:	eb db                	jmp    43bf <strcmp+0x2f>
    43e4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    43eb:	00 
    43ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000043f0 <strlen>:

uint strlen(const char *s) {
    43f0:	55                   	push   %ebp
    43f1:	89 e5                	mov    %esp,%ebp
    43f3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;
  for (n = 0; s[n]; n++);
    43f6:	80 3a 00             	cmpb   $0x0,(%edx)
    43f9:	74 15                	je     4410 <strlen+0x20>
    43fb:	31 c0                	xor    %eax,%eax
    43fd:	8d 76 00             	lea    0x0(%esi),%esi
    4400:	83 c0 01             	add    $0x1,%eax
    4403:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    4407:	89 c1                	mov    %eax,%ecx
    4409:	75 f5                	jne    4400 <strlen+0x10>
  return n;
}
    440b:	89 c8                	mov    %ecx,%eax
    440d:	5d                   	pop    %ebp
    440e:	c3                   	ret
    440f:	90                   	nop
  for (n = 0; s[n]; n++);
    4410:	31 c9                	xor    %ecx,%ecx
}
    4412:	5d                   	pop    %ebp
    4413:	89 c8                	mov    %ecx,%eax
    4415:	c3                   	ret
    4416:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    441d:	00 
    441e:	66 90                	xchg   %ax,%ax

00004420 <memset>:

void* memset(void *dst, int c, uint n) {
    4420:	55                   	push   %ebp
    4421:	89 e5                	mov    %esp,%ebp
    4423:	57                   	push   %edi
    4424:	8b 55 08             	mov    0x8(%ebp),%edx
               "cc");
}

static inline void stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    4427:	8b 4d 10             	mov    0x10(%ebp),%ecx
    442a:	8b 45 0c             	mov    0xc(%ebp),%eax
    442d:	89 d7                	mov    %edx,%edi
    442f:	fc                   	cld
    4430:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    4432:	8b 7d fc             	mov    -0x4(%ebp),%edi
    4435:	89 d0                	mov    %edx,%eax
    4437:	c9                   	leave
    4438:	c3                   	ret
    4439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00004440 <strchr>:

char* strchr(const char *s, int c) {
    4440:	55                   	push   %ebp
    4441:	89 e5                	mov    %esp,%ebp
    4443:	8b 45 08             	mov    0x8(%ebp),%eax
    4446:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  for (; *s; s++)
    4449:	0f be 10             	movsbl (%eax),%edx
    444c:	84 d2                	test   %dl,%dl
    444e:	75 13                	jne    4463 <strchr+0x23>
    4450:	eb 1e                	jmp    4470 <strchr+0x30>
    4452:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    4458:	0f be 50 01          	movsbl 0x1(%eax),%edx
    445c:	83 c0 01             	add    $0x1,%eax
    445f:	84 d2                	test   %dl,%dl
    4461:	74 0d                	je     4470 <strchr+0x30>
    if (*s == c)
    4463:	39 ca                	cmp    %ecx,%edx
    4465:	75 f1                	jne    4458 <strchr+0x18>
      return (char*)s;
  return 0;
}
    4467:	5d                   	pop    %ebp
    4468:	c3                   	ret
    4469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    4470:	31 c0                	xor    %eax,%eax
}
    4472:	5d                   	pop    %ebp
    4473:	c3                   	ret
    4474:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    447b:	00 
    447c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004480 <gets>:

char* gets(char *buf, int max) {
    4480:	55                   	push   %ebp
    4481:	89 e5                	mov    %esp,%ebp
    4483:	57                   	push   %edi
    4484:	56                   	push   %esi
  int i, cc;
  char c;
  for (i = 0; i+1 < max;) {
    cc = read(0, &c, 1);
    4485:	8d 75 e7             	lea    -0x19(%ebp),%esi
char* gets(char *buf, int max) {
    4488:	53                   	push   %ebx
  for (i = 0; i+1 < max;) {
    4489:	31 db                	xor    %ebx,%ebx
char* gets(char *buf, int max) {
    448b:	83 ec 1c             	sub    $0x1c,%esp
  for (i = 0; i+1 < max;) {
    448e:	eb 27                	jmp    44b7 <gets+0x37>
    cc = read(0, &c, 1);
    4490:	83 ec 04             	sub    $0x4,%esp
    4493:	6a 01                	push   $0x1
    4495:	56                   	push   %esi
    4496:	6a 00                	push   $0x0
    4498:	e8 2d 01 00 00       	call   45ca <read>
    if (cc < 1) break;
    449d:	83 c4 10             	add    $0x10,%esp
    44a0:	85 c0                	test   %eax,%eax
    44a2:	7e 1d                	jle    44c1 <gets+0x41>
    buf[i++] = c;
    44a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    44a8:	8b 55 08             	mov    0x8(%ebp),%edx
    44ab:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if (c == '\n' || c == '\r') break;
    44af:	3c 0a                	cmp    $0xa,%al
    44b1:	74 10                	je     44c3 <gets+0x43>
    44b3:	3c 0d                	cmp    $0xd,%al
    44b5:	74 0c                	je     44c3 <gets+0x43>
  for (i = 0; i+1 < max;) {
    44b7:	89 df                	mov    %ebx,%edi
    44b9:	83 c3 01             	add    $0x1,%ebx
    44bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    44bf:	7c cf                	jl     4490 <gets+0x10>
    44c1:	89 fb                	mov    %edi,%ebx
  }
  buf[i] = '\0';
    44c3:	8b 45 08             	mov    0x8(%ebp),%eax
    44c6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
    44ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
    44cd:	5b                   	pop    %ebx
    44ce:	5e                   	pop    %esi
    44cf:	5f                   	pop    %edi
    44d0:	5d                   	pop    %ebp
    44d1:	c3                   	ret
    44d2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    44d9:	00 
    44da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000044e0 <stat>:

int stat(const char *n, struct stat *st) {
    44e0:	55                   	push   %ebp
    44e1:	89 e5                	mov    %esp,%ebp
    44e3:	56                   	push   %esi
    44e4:	53                   	push   %ebx
  int fd, r;
  fd = open(n, O_RDONLY);
    44e5:	83 ec 08             	sub    $0x8,%esp
    44e8:	6a 00                	push   $0x0
    44ea:	ff 75 08             	push   0x8(%ebp)
    44ed:	e8 00 01 00 00       	call   45f2 <open>
  if (fd < 0) return -1;
    44f2:	83 c4 10             	add    $0x10,%esp
    44f5:	85 c0                	test   %eax,%eax
    44f7:	78 27                	js     4520 <stat+0x40>
  r = fstat(fd, st);
    44f9:	83 ec 08             	sub    $0x8,%esp
    44fc:	ff 75 0c             	push   0xc(%ebp)
    44ff:	89 c3                	mov    %eax,%ebx
    4501:	50                   	push   %eax
    4502:	e8 03 01 00 00       	call   460a <fstat>
  close(fd);
    4507:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    450a:	89 c6                	mov    %eax,%esi
  close(fd);
    450c:	e8 c9 00 00 00       	call   45da <close>
  return r;
    4511:	83 c4 10             	add    $0x10,%esp
}
    4514:	8d 65 f8             	lea    -0x8(%ebp),%esp
    4517:	89 f0                	mov    %esi,%eax
    4519:	5b                   	pop    %ebx
    451a:	5e                   	pop    %esi
    451b:	5d                   	pop    %ebp
    451c:	c3                   	ret
    451d:	8d 76 00             	lea    0x0(%esi),%esi
  if (fd < 0) return -1;
    4520:	be ff ff ff ff       	mov    $0xffffffff,%esi
    4525:	eb ed                	jmp    4514 <stat+0x34>
    4527:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    452e:	00 
    452f:	90                   	nop

00004530 <atoi>:

int atoi(const char *s) {
    4530:	55                   	push   %ebp
    4531:	89 e5                	mov    %esp,%ebp
    4533:	53                   	push   %ebx
    4534:	8b 55 08             	mov    0x8(%ebp),%edx
  int n = 0;
  while ('0' <= *s && *s <= '9')
    4537:	0f be 02             	movsbl (%edx),%eax
    453a:	8d 48 d0             	lea    -0x30(%eax),%ecx
    453d:	80 f9 09             	cmp    $0x9,%cl
  int n = 0;
    4540:	b9 00 00 00 00       	mov    $0x0,%ecx
  while ('0' <= *s && *s <= '9')
    4545:	77 1e                	ja     4565 <atoi+0x35>
    4547:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    454e:	00 
    454f:	90                   	nop
    n = n*10 + *s++ - '0';
    4550:	83 c2 01             	add    $0x1,%edx
    4553:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    4556:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while ('0' <= *s && *s <= '9')
    455a:	0f be 02             	movsbl (%edx),%eax
    455d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    4560:	80 fb 09             	cmp    $0x9,%bl
    4563:	76 eb                	jbe    4550 <atoi+0x20>
  return n;
}
    4565:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    4568:	89 c8                	mov    %ecx,%eax
    456a:	c9                   	leave
    456b:	c3                   	ret
    456c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004570 <memmove>:

void* memmove(void *vdst, const void *vsrc, int n) {
    4570:	55                   	push   %ebp
    4571:	89 e5                	mov    %esp,%ebp
    4573:	57                   	push   %edi
    4574:	8b 45 10             	mov    0x10(%ebp),%eax
    4577:	8b 55 08             	mov    0x8(%ebp),%edx
    457a:	56                   	push   %esi
    457b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst = vdst;
  const char *src = vsrc;
  while (n-- > 0)
    457e:	85 c0                	test   %eax,%eax
    4580:	7e 13                	jle    4595 <memmove+0x25>
    4582:	01 d0                	add    %edx,%eax
  char *dst = vdst;
    4584:	89 d7                	mov    %edx,%edi
    4586:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    458d:	00 
    458e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
    4590:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while (n-- > 0)
    4591:	39 f8                	cmp    %edi,%eax
    4593:	75 fb                	jne    4590 <memmove+0x20>
  return vdst;
}
    4595:	5e                   	pop    %esi
    4596:	89 d0                	mov    %edx,%eax
    4598:	5f                   	pop    %edi
    4599:	5d                   	pop    %ebp
    459a:	c3                   	ret
    459b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

000045a0 <syscall>:

// Add syscall definition for internal use
int syscall(int num, ...) {
    45a0:	55                   	push   %ebp
    45a1:	89 e5                	mov    %esp,%ebp
    int ret;
    asm volatile("int $64" : "=a" (ret) : "a" (num));
    45a3:	8b 45 08             	mov    0x8(%ebp),%eax
    45a6:	cd 40                	int    $0x40
    return ret;
}
    45a8:	5d                   	pop    %ebp
    45a9:	c3                   	ret

000045aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    45aa:	b8 01 00 00 00       	mov    $0x1,%eax
    45af:	cd 40                	int    $0x40
    45b1:	c3                   	ret

000045b2 <exit>:
SYSCALL(exit)
    45b2:	b8 02 00 00 00       	mov    $0x2,%eax
    45b7:	cd 40                	int    $0x40
    45b9:	c3                   	ret

000045ba <wait>:
SYSCALL(wait)
    45ba:	b8 03 00 00 00       	mov    $0x3,%eax
    45bf:	cd 40                	int    $0x40
    45c1:	c3                   	ret

000045c2 <pipe>:
SYSCALL(pipe)
    45c2:	b8 04 00 00 00       	mov    $0x4,%eax
    45c7:	cd 40                	int    $0x40
    45c9:	c3                   	ret

000045ca <read>:
SYSCALL(read)
    45ca:	b8 05 00 00 00       	mov    $0x5,%eax
    45cf:	cd 40                	int    $0x40
    45d1:	c3                   	ret

000045d2 <write>:
SYSCALL(write)
    45d2:	b8 10 00 00 00       	mov    $0x10,%eax
    45d7:	cd 40                	int    $0x40
    45d9:	c3                   	ret

000045da <close>:
SYSCALL(close)
    45da:	b8 15 00 00 00       	mov    $0x15,%eax
    45df:	cd 40                	int    $0x40
    45e1:	c3                   	ret

000045e2 <kill>:
SYSCALL(kill)
    45e2:	b8 06 00 00 00       	mov    $0x6,%eax
    45e7:	cd 40                	int    $0x40
    45e9:	c3                   	ret

000045ea <exec>:
SYSCALL(exec)
    45ea:	b8 07 00 00 00       	mov    $0x7,%eax
    45ef:	cd 40                	int    $0x40
    45f1:	c3                   	ret

000045f2 <open>:
SYSCALL(open)
    45f2:	b8 0f 00 00 00       	mov    $0xf,%eax
    45f7:	cd 40                	int    $0x40
    45f9:	c3                   	ret

000045fa <mknod>:
SYSCALL(mknod)
    45fa:	b8 11 00 00 00       	mov    $0x11,%eax
    45ff:	cd 40                	int    $0x40
    4601:	c3                   	ret

00004602 <unlink>:
SYSCALL(unlink)
    4602:	b8 12 00 00 00       	mov    $0x12,%eax
    4607:	cd 40                	int    $0x40
    4609:	c3                   	ret

0000460a <fstat>:
SYSCALL(fstat)
    460a:	b8 08 00 00 00       	mov    $0x8,%eax
    460f:	cd 40                	int    $0x40
    4611:	c3                   	ret

00004612 <link>:
SYSCALL(link)
    4612:	b8 13 00 00 00       	mov    $0x13,%eax
    4617:	cd 40                	int    $0x40
    4619:	c3                   	ret

0000461a <mkdir>:
SYSCALL(mkdir)
    461a:	b8 14 00 00 00       	mov    $0x14,%eax
    461f:	cd 40                	int    $0x40
    4621:	c3                   	ret

00004622 <chdir>:
SYSCALL(chdir)
    4622:	b8 09 00 00 00       	mov    $0x9,%eax
    4627:	cd 40                	int    $0x40
    4629:	c3                   	ret

0000462a <dup>:
SYSCALL(dup)
    462a:	b8 0a 00 00 00       	mov    $0xa,%eax
    462f:	cd 40                	int    $0x40
    4631:	c3                   	ret

00004632 <getpid>:
SYSCALL(getpid)
    4632:	b8 0b 00 00 00       	mov    $0xb,%eax
    4637:	cd 40                	int    $0x40
    4639:	c3                   	ret

0000463a <sbrk>:
SYSCALL(sbrk)
    463a:	b8 0c 00 00 00       	mov    $0xc,%eax
    463f:	cd 40                	int    $0x40
    4641:	c3                   	ret

00004642 <sleep>:
SYSCALL(sleep)
    4642:	b8 0d 00 00 00       	mov    $0xd,%eax
    4647:	cd 40                	int    $0x40
    4649:	c3                   	ret

0000464a <uptime>:
SYSCALL(uptime)
    464a:	b8 0e 00 00 00       	mov    $0xe,%eax
    464f:	cd 40                	int    $0x40
    4651:	c3                   	ret

00004652 <spawn>:
SYSCALL(spawn)
    4652:	b8 16 00 00 00       	mov    $0x16,%eax
    4657:	cd 40                	int    $0x40
    4659:	c3                   	ret

0000465a <shm_open>:
SYSCALL(shm_open)
    465a:	b8 17 00 00 00       	mov    $0x17,%eax
    465f:	cd 40                	int    $0x40
    4661:	c3                   	ret

00004662 <shm_attach>:
SYSCALL(shm_attach)
    4662:	b8 18 00 00 00       	mov    $0x18,%eax
    4667:	cd 40                	int    $0x40
    4669:	c3                   	ret

0000466a <thread_create>:
SYSCALL(thread_create)
    466a:	b8 19 00 00 00       	mov    $0x19,%eax
    466f:	cd 40                	int    $0x40
    4671:	c3                   	ret

00004672 <thread_join>:
SYSCALL(thread_join)
    4672:	b8 1a 00 00 00       	mov    $0x1a,%eax
    4677:	cd 40                	int    $0x40
    4679:	c3                   	ret

0000467a <mutex_lock>:
SYSCALL(mutex_lock)
    467a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    467f:	cd 40                	int    $0x40
    4681:	c3                   	ret

00004682 <mutex_unlock>:
SYSCALL(mutex_unlock)
    4682:	b8 1c 00 00 00       	mov    $0x1c,%eax
    4687:	cd 40                	int    $0x40
    4689:	c3                   	ret

0000468a <signal>:
SYSCALL(signal)
    468a:	b8 1d 00 00 00       	mov    $0x1d,%eax
    468f:	cd 40                	int    $0x40
    4691:	c3                   	ret
    4692:	66 90                	xchg   %ax,%ax
    4694:	66 90                	xchg   %ax,%ax
    4696:	66 90                	xchg   %ax,%ax
    4698:	66 90                	xchg   %ax,%ax
    469a:	66 90                	xchg   %ax,%ax
    469c:	66 90                	xchg   %ax,%ax
    469e:	66 90                	xchg   %ax,%ax

000046a0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    46a0:	55                   	push   %ebp
    46a1:	89 e5                	mov    %esp,%ebp
    46a3:	57                   	push   %edi
    46a4:	56                   	push   %esi
    46a5:	53                   	push   %ebx
    46a6:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    46a8:	89 d1                	mov    %edx,%ecx
{
    46aa:	83 ec 3c             	sub    $0x3c,%esp
    46ad:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
    46b0:	85 d2                	test   %edx,%edx
    46b2:	0f 89 80 00 00 00    	jns    4738 <printint+0x98>
    46b8:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    46bc:	74 7a                	je     4738 <printint+0x98>
    x = -xx;
    46be:	f7 d9                	neg    %ecx
    neg = 1;
    46c0:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
    46c5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    46c8:	31 f6                	xor    %esi,%esi
    46ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    46d0:	89 c8                	mov    %ecx,%eax
    46d2:	31 d2                	xor    %edx,%edx
    46d4:	89 f7                	mov    %esi,%edi
    46d6:	f7 f3                	div    %ebx
    46d8:	8d 76 01             	lea    0x1(%esi),%esi
    46db:	0f b6 92 40 62 00 00 	movzbl 0x6240(%edx),%edx
    46e2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
    46e6:	89 ca                	mov    %ecx,%edx
    46e8:	89 c1                	mov    %eax,%ecx
    46ea:	39 da                	cmp    %ebx,%edx
    46ec:	73 e2                	jae    46d0 <printint+0x30>
  if(neg)
    46ee:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    46f1:	85 c0                	test   %eax,%eax
    46f3:	74 07                	je     46fc <printint+0x5c>
    buf[i++] = '-';
    46f5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
    46fa:	89 f7                	mov    %esi,%edi
    46fc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    46ff:	8b 75 c0             	mov    -0x40(%ebp),%esi
    4702:	01 df                	add    %ebx,%edi
    4704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
    4708:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
    470b:	83 ec 04             	sub    $0x4,%esp
    470e:	88 45 d7             	mov    %al,-0x29(%ebp)
    4711:	8d 45 d7             	lea    -0x29(%ebp),%eax
    4714:	6a 01                	push   $0x1
    4716:	50                   	push   %eax
    4717:	56                   	push   %esi
    4718:	e8 b5 fe ff ff       	call   45d2 <write>
  while(--i >= 0)
    471d:	89 f8                	mov    %edi,%eax
    471f:	83 c4 10             	add    $0x10,%esp
    4722:	83 ef 01             	sub    $0x1,%edi
    4725:	39 c3                	cmp    %eax,%ebx
    4727:	75 df                	jne    4708 <printint+0x68>
}
    4729:	8d 65 f4             	lea    -0xc(%ebp),%esp
    472c:	5b                   	pop    %ebx
    472d:	5e                   	pop    %esi
    472e:	5f                   	pop    %edi
    472f:	5d                   	pop    %ebp
    4730:	c3                   	ret
    4731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    4738:	31 c0                	xor    %eax,%eax
    473a:	eb 89                	jmp    46c5 <printint+0x25>
    473c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004740 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    4740:	55                   	push   %ebp
    4741:	89 e5                	mov    %esp,%ebp
    4743:	57                   	push   %edi
    4744:	56                   	push   %esi
    4745:	53                   	push   %ebx
    4746:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4749:	8b 75 0c             	mov    0xc(%ebp),%esi
{
    474c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
    474f:	0f b6 1e             	movzbl (%esi),%ebx
    4752:	83 c6 01             	add    $0x1,%esi
    4755:	84 db                	test   %bl,%bl
    4757:	74 67                	je     47c0 <printf+0x80>
    4759:	8d 4d 10             	lea    0x10(%ebp),%ecx
    475c:	31 d2                	xor    %edx,%edx
    475e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
    4761:	eb 34                	jmp    4797 <printf+0x57>
    4763:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    4768:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    476b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    4770:	83 f8 25             	cmp    $0x25,%eax
    4773:	74 18                	je     478d <printf+0x4d>
  write(fd, &c, 1);
    4775:	83 ec 04             	sub    $0x4,%esp
    4778:	8d 45 e7             	lea    -0x19(%ebp),%eax
    477b:	88 5d e7             	mov    %bl,-0x19(%ebp)
    477e:	6a 01                	push   $0x1
    4780:	50                   	push   %eax
    4781:	57                   	push   %edi
    4782:	e8 4b fe ff ff       	call   45d2 <write>
    4787:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    478a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    478d:	0f b6 1e             	movzbl (%esi),%ebx
    4790:	83 c6 01             	add    $0x1,%esi
    4793:	84 db                	test   %bl,%bl
    4795:	74 29                	je     47c0 <printf+0x80>
    c = fmt[i] & 0xff;
    4797:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    479a:	85 d2                	test   %edx,%edx
    479c:	74 ca                	je     4768 <printf+0x28>
      }
    } else if(state == '%'){
    479e:	83 fa 25             	cmp    $0x25,%edx
    47a1:	75 ea                	jne    478d <printf+0x4d>
      if(c == 'd'){
    47a3:	83 f8 25             	cmp    $0x25,%eax
    47a6:	0f 84 04 01 00 00    	je     48b0 <printf+0x170>
    47ac:	83 e8 63             	sub    $0x63,%eax
    47af:	83 f8 15             	cmp    $0x15,%eax
    47b2:	77 1c                	ja     47d0 <printf+0x90>
    47b4:	ff 24 85 e8 61 00 00 	jmp    *0x61e8(,%eax,4)
    47bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    47c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    47c3:	5b                   	pop    %ebx
    47c4:	5e                   	pop    %esi
    47c5:	5f                   	pop    %edi
    47c6:	5d                   	pop    %ebp
    47c7:	c3                   	ret
    47c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    47cf:	00 
  write(fd, &c, 1);
    47d0:	83 ec 04             	sub    $0x4,%esp
    47d3:	8d 55 e7             	lea    -0x19(%ebp),%edx
    47d6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    47da:	6a 01                	push   $0x1
    47dc:	52                   	push   %edx
    47dd:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    47e0:	57                   	push   %edi
    47e1:	e8 ec fd ff ff       	call   45d2 <write>
    47e6:	83 c4 0c             	add    $0xc,%esp
    47e9:	88 5d e7             	mov    %bl,-0x19(%ebp)
    47ec:	6a 01                	push   $0x1
    47ee:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    47f1:	52                   	push   %edx
    47f2:	57                   	push   %edi
    47f3:	e8 da fd ff ff       	call   45d2 <write>
        putc(fd, c);
    47f8:	83 c4 10             	add    $0x10,%esp
      state = 0;
    47fb:	31 d2                	xor    %edx,%edx
    47fd:	eb 8e                	jmp    478d <printf+0x4d>
    47ff:	90                   	nop
        printint(fd, *ap, 16, 0);
    4800:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    4803:	83 ec 0c             	sub    $0xc,%esp
    4806:	b9 10 00 00 00       	mov    $0x10,%ecx
    480b:	8b 13                	mov    (%ebx),%edx
    480d:	6a 00                	push   $0x0
    480f:	89 f8                	mov    %edi,%eax
        ap++;
    4811:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
    4814:	e8 87 fe ff ff       	call   46a0 <printint>
        ap++;
    4819:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    481c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    481f:	31 d2                	xor    %edx,%edx
    4821:	e9 67 ff ff ff       	jmp    478d <printf+0x4d>
        s = (char*)*ap;
    4826:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4829:	8b 18                	mov    (%eax),%ebx
        ap++;
    482b:	83 c0 04             	add    $0x4,%eax
    482e:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    4831:	85 db                	test   %ebx,%ebx
    4833:	0f 84 87 00 00 00    	je     48c0 <printf+0x180>
        while(*s != 0){
    4839:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    483c:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    483e:	84 c0                	test   %al,%al
    4840:	0f 84 47 ff ff ff    	je     478d <printf+0x4d>
    4846:	8d 55 e7             	lea    -0x19(%ebp),%edx
    4849:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    484c:	89 de                	mov    %ebx,%esi
    484e:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
    4850:	83 ec 04             	sub    $0x4,%esp
    4853:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    4856:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    4859:	6a 01                	push   $0x1
    485b:	53                   	push   %ebx
    485c:	57                   	push   %edi
    485d:	e8 70 fd ff ff       	call   45d2 <write>
        while(*s != 0){
    4862:	0f b6 06             	movzbl (%esi),%eax
    4865:	83 c4 10             	add    $0x10,%esp
    4868:	84 c0                	test   %al,%al
    486a:	75 e4                	jne    4850 <printf+0x110>
      state = 0;
    486c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    486f:	31 d2                	xor    %edx,%edx
    4871:	e9 17 ff ff ff       	jmp    478d <printf+0x4d>
        printint(fd, *ap, 10, 1);
    4876:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    4879:	83 ec 0c             	sub    $0xc,%esp
    487c:	b9 0a 00 00 00       	mov    $0xa,%ecx
    4881:	8b 13                	mov    (%ebx),%edx
    4883:	6a 01                	push   $0x1
    4885:	eb 88                	jmp    480f <printf+0xcf>
        putc(fd, *ap);
    4887:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    488a:	83 ec 04             	sub    $0x4,%esp
    488d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    4890:	8b 03                	mov    (%ebx),%eax
        ap++;
    4892:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    4895:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    4898:	6a 01                	push   $0x1
    489a:	52                   	push   %edx
    489b:	57                   	push   %edi
    489c:	e8 31 fd ff ff       	call   45d2 <write>
        ap++;
    48a1:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    48a4:	83 c4 10             	add    $0x10,%esp
      state = 0;
    48a7:	31 d2                	xor    %edx,%edx
    48a9:	e9 df fe ff ff       	jmp    478d <printf+0x4d>
    48ae:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
    48b0:	83 ec 04             	sub    $0x4,%esp
    48b3:	88 5d e7             	mov    %bl,-0x19(%ebp)
    48b6:	8d 55 e7             	lea    -0x19(%ebp),%edx
    48b9:	6a 01                	push   $0x1
    48bb:	e9 31 ff ff ff       	jmp    47f1 <printf+0xb1>
    48c0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    48c5:	bb 69 5a 00 00       	mov    $0x5a69,%ebx
    48ca:	e9 77 ff ff ff       	jmp    4846 <printf+0x106>
    48cf:	90                   	nop

000048d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    48d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    48d1:	a1 60 b3 00 00       	mov    0xb360,%eax
{
    48d6:	89 e5                	mov    %esp,%ebp
    48d8:	57                   	push   %edi
    48d9:	56                   	push   %esi
    48da:	53                   	push   %ebx
    48db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    48de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    48e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    48e8:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    48ea:	39 c8                	cmp    %ecx,%eax
    48ec:	73 32                	jae    4920 <free+0x50>
    48ee:	39 d1                	cmp    %edx,%ecx
    48f0:	72 04                	jb     48f6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    48f2:	39 d0                	cmp    %edx,%eax
    48f4:	72 32                	jb     4928 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    48f6:	8b 73 fc             	mov    -0x4(%ebx),%esi
    48f9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    48fc:	39 fa                	cmp    %edi,%edx
    48fe:	74 30                	je     4930 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    4900:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    4903:	8b 50 04             	mov    0x4(%eax),%edx
    4906:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    4909:	39 f1                	cmp    %esi,%ecx
    490b:	74 3a                	je     4947 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    490d:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    490f:	5b                   	pop    %ebx
  freep = p;
    4910:	a3 60 b3 00 00       	mov    %eax,0xb360
}
    4915:	5e                   	pop    %esi
    4916:	5f                   	pop    %edi
    4917:	5d                   	pop    %ebp
    4918:	c3                   	ret
    4919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4920:	39 d0                	cmp    %edx,%eax
    4922:	72 04                	jb     4928 <free+0x58>
    4924:	39 d1                	cmp    %edx,%ecx
    4926:	72 ce                	jb     48f6 <free+0x26>
{
    4928:	89 d0                	mov    %edx,%eax
    492a:	eb bc                	jmp    48e8 <free+0x18>
    492c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    4930:	03 72 04             	add    0x4(%edx),%esi
    4933:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    4936:	8b 10                	mov    (%eax),%edx
    4938:	8b 12                	mov    (%edx),%edx
    493a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    493d:	8b 50 04             	mov    0x4(%eax),%edx
    4940:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    4943:	39 f1                	cmp    %esi,%ecx
    4945:	75 c6                	jne    490d <free+0x3d>
    p->s.size += bp->s.size;
    4947:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    494a:	a3 60 b3 00 00       	mov    %eax,0xb360
    p->s.size += bp->s.size;
    494f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4952:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    4955:	89 08                	mov    %ecx,(%eax)
}
    4957:	5b                   	pop    %ebx
    4958:	5e                   	pop    %esi
    4959:	5f                   	pop    %edi
    495a:	5d                   	pop    %ebp
    495b:	c3                   	ret
    495c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00004960 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    4960:	55                   	push   %ebp
    4961:	89 e5                	mov    %esp,%ebp
    4963:	57                   	push   %edi
    4964:	56                   	push   %esi
    4965:	53                   	push   %ebx
    4966:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4969:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    496c:	8b 15 60 b3 00 00    	mov    0xb360,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4972:	8d 78 07             	lea    0x7(%eax),%edi
    4975:	c1 ef 03             	shr    $0x3,%edi
    4978:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    497b:	85 d2                	test   %edx,%edx
    497d:	0f 84 8d 00 00 00    	je     4a10 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4983:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    4985:	8b 48 04             	mov    0x4(%eax),%ecx
    4988:	39 f9                	cmp    %edi,%ecx
    498a:	73 64                	jae    49f0 <malloc+0x90>
  if(nu < 4096)
    498c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    4991:	39 df                	cmp    %ebx,%edi
    4993:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    4996:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    499d:	eb 0a                	jmp    49a9 <malloc+0x49>
    499f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    49a0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    49a2:	8b 48 04             	mov    0x4(%eax),%ecx
    49a5:	39 f9                	cmp    %edi,%ecx
    49a7:	73 47                	jae    49f0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    49a9:	89 c2                	mov    %eax,%edx
    49ab:	3b 05 60 b3 00 00    	cmp    0xb360,%eax
    49b1:	75 ed                	jne    49a0 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    49b3:	83 ec 0c             	sub    $0xc,%esp
    49b6:	56                   	push   %esi
    49b7:	e8 7e fc ff ff       	call   463a <sbrk>
  if(p == (char*)-1)
    49bc:	83 c4 10             	add    $0x10,%esp
    49bf:	83 f8 ff             	cmp    $0xffffffff,%eax
    49c2:	74 1c                	je     49e0 <malloc+0x80>
  hp->s.size = nu;
    49c4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    49c7:	83 ec 0c             	sub    $0xc,%esp
    49ca:	83 c0 08             	add    $0x8,%eax
    49cd:	50                   	push   %eax
    49ce:	e8 fd fe ff ff       	call   48d0 <free>
  return freep;
    49d3:	8b 15 60 b3 00 00    	mov    0xb360,%edx
      if((p = morecore(nunits)) == 0)
    49d9:	83 c4 10             	add    $0x10,%esp
    49dc:	85 d2                	test   %edx,%edx
    49de:	75 c0                	jne    49a0 <malloc+0x40>
        return 0;
  }
}
    49e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    49e3:	31 c0                	xor    %eax,%eax
}
    49e5:	5b                   	pop    %ebx
    49e6:	5e                   	pop    %esi
    49e7:	5f                   	pop    %edi
    49e8:	5d                   	pop    %ebp
    49e9:	c3                   	ret
    49ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    49f0:	39 cf                	cmp    %ecx,%edi
    49f2:	74 4c                	je     4a40 <malloc+0xe0>
        p->s.size -= nunits;
    49f4:	29 f9                	sub    %edi,%ecx
    49f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    49f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    49fc:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    49ff:	89 15 60 b3 00 00    	mov    %edx,0xb360
}
    4a05:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    4a08:	83 c0 08             	add    $0x8,%eax
}
    4a0b:	5b                   	pop    %ebx
    4a0c:	5e                   	pop    %esi
    4a0d:	5f                   	pop    %edi
    4a0e:	5d                   	pop    %ebp
    4a0f:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    4a10:	c7 05 60 b3 00 00 64 	movl   $0xb364,0xb360
    4a17:	b3 00 00 
    base.s.size = 0;
    4a1a:	b8 64 b3 00 00       	mov    $0xb364,%eax
    base.s.ptr = freep = prevp = &base;
    4a1f:	c7 05 64 b3 00 00 64 	movl   $0xb364,0xb364
    4a26:	b3 00 00 
    base.s.size = 0;
    4a29:	c7 05 68 b3 00 00 00 	movl   $0x0,0xb368
    4a30:	00 00 00 
    if(p->s.size >= nunits){
    4a33:	e9 54 ff ff ff       	jmp    498c <malloc+0x2c>
    4a38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
    4a3f:	00 
        prevp->s.ptr = p->s.ptr;
    4a40:	8b 08                	mov    (%eax),%ecx
    4a42:	89 0a                	mov    %ecx,(%edx)
    4a44:	eb b9                	jmp    49ff <malloc+0x9f>
