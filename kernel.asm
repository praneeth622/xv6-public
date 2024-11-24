
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc d0 ac 11 80       	mov    $0x8011acd0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 b0 30 10 80       	mov    $0x801030b0,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb 54 a5 10 80       	mov    $0x8010a554,%ebx
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  initlock(&bcache.lock, "bcache");
8010004c:	68 60 74 10 80       	push   $0x80107460
80100051:	68 20 a5 10 80       	push   $0x8010a520
80100056:	e8 a5 54 00 00       	call   80105500 <initlock>
  bcache.head.next = &bcache.head;
8010005b:	83 c4 10             	add    $0x10,%esp
8010005e:	b8 5c 33 11 80       	mov    $0x8011335c,%eax
  bcache.head.prev = &bcache.head;
80100063:	c7 05 ac 33 11 80 5c 	movl   $0x8011335c,0x801133ac
8010006a:	33 11 80 
  bcache.head.next = &bcache.head;
8010006d:	c7 05 b0 33 11 80 5c 	movl   $0x8011335c,0x801133b0
80100074:	33 11 80 
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 d3                	mov    %edx,%ebx
    b->next = bcache.head.next;
80100082:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	8d 43 0c             	lea    0xc(%ebx),%eax
    b->prev = &bcache.head;
8010008b:	c7 43 50 5c 33 11 80 	movl   $0x8011335c,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 67 74 10 80       	push   $0x80107467
80100097:	50                   	push   %eax
80100098:	e8 33 53 00 00       	call   801053d0 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 b0 33 11 80       	mov    0x801133b0,%eax
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	8d 93 bc 04 00 00    	lea    0x4bc(%ebx),%edx
801000a8:	83 c4 10             	add    $0x10,%esp
    bcache.head.next->prev = b;
801000ab:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
801000ae:	89 d8                	mov    %ebx,%eax
801000b0:	89 1d b0 33 11 80    	mov    %ebx,0x801133b0
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	81 fb a0 2e 11 80    	cmp    $0x80112ea0,%ebx
801000bc:	75 c2                	jne    80100080 <binit+0x40>
  }
}
801000be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c1:	c9                   	leave
801000c2:	c3                   	ret
801000c3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801000ca:	00 
801000cb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  acquire(&bcache.lock);
801000df:	68 20 a5 10 80       	push   $0x8010a520
801000e4:	e8 07 56 00 00       	call   801056f0 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d b0 33 11 80    	mov    0x801133b0,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb 5c 33 11 80    	cmp    $0x8011335c,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb 5c 33 11 80    	cmp    $0x8011335c,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d ac 33 11 80    	mov    0x801133ac,%ebx
80100126:	81 fb 5c 33 11 80    	cmp    $0x8011335c,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 6e                	jmp    8010019e <bread+0xce>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb 5c 33 11 80    	cmp    $0x8011335c,%ebx
80100139:	74 63                	je     8010019e <bread+0xce>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 20 a5 10 80       	push   $0x8010a520
80100162:	e8 29 55 00 00       	call   80105690 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 9e 52 00 00       	call   80105410 <acquiresleep>
      return b;
80100172:	83 c4 10             	add    $0x10,%esp
  struct buf *b;

  b = bget(dev, blockno);
  if((b->flags & B_VALID) == 0) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	74 0e                	je     80100188 <bread+0xb8>
    iderw(b);
  }
  return b;
}
8010017a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010017d:	89 d8                	mov    %ebx,%eax
8010017f:	5b                   	pop    %ebx
80100180:	5e                   	pop    %esi
80100181:	5f                   	pop    %edi
80100182:	5d                   	pop    %ebp
80100183:	c3                   	ret
80100184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    iderw(b);
80100188:	83 ec 0c             	sub    $0xc,%esp
8010018b:	53                   	push   %ebx
8010018c:	e8 bf 21 00 00       	call   80102350 <iderw>
80100191:	83 c4 10             	add    $0x10,%esp
}
80100194:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100197:	89 d8                	mov    %ebx,%eax
80100199:	5b                   	pop    %ebx
8010019a:	5e                   	pop    %esi
8010019b:	5f                   	pop    %edi
8010019c:	5d                   	pop    %ebp
8010019d:	c3                   	ret
  panic("bget: no buffers");
8010019e:	83 ec 0c             	sub    $0xc,%esp
801001a1:	68 6e 74 10 80       	push   $0x8010746e
801001a6:	e8 d5 01 00 00       	call   80100380 <panic>
801001ab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801001b0 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001b0:	55                   	push   %ebp
801001b1:	89 e5                	mov    %esp,%ebp
801001b3:	53                   	push   %ebx
801001b4:	83 ec 10             	sub    $0x10,%esp
801001b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001ba:	8d 43 0c             	lea    0xc(%ebx),%eax
801001bd:	50                   	push   %eax
801001be:	e8 ed 52 00 00       	call   801054b0 <holdingsleep>
801001c3:	83 c4 10             	add    $0x10,%esp
801001c6:	85 c0                	test   %eax,%eax
801001c8:	74 0f                	je     801001d9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ca:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001cd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001d3:	c9                   	leave
  iderw(b);
801001d4:	e9 77 21 00 00       	jmp    80102350 <iderw>
    panic("bwrite");
801001d9:	83 ec 0c             	sub    $0xc,%esp
801001dc:	68 7f 74 10 80       	push   $0x8010747f
801001e1:	e8 9a 01 00 00       	call   80100380 <panic>
801001e6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801001ed:	00 
801001ee:	66 90                	xchg   %ax,%ax

801001f0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001f0:	55                   	push   %ebp
801001f1:	89 e5                	mov    %esp,%ebp
801001f3:	56                   	push   %esi
801001f4:	53                   	push   %ebx
801001f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001f8:	8d 73 0c             	lea    0xc(%ebx),%esi
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 ac 52 00 00       	call   801054b0 <holdingsleep>
80100204:	83 c4 10             	add    $0x10,%esp
80100207:	85 c0                	test   %eax,%eax
80100209:	74 63                	je     8010026e <brelse+0x7e>
    panic("brelse");

  releasesleep(&b->lock);
8010020b:	83 ec 0c             	sub    $0xc,%esp
8010020e:	56                   	push   %esi
8010020f:	e8 5c 52 00 00       	call   80105470 <releasesleep>

  acquire(&bcache.lock);
80100214:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010021b:	e8 d0 54 00 00       	call   801056f0 <acquire>
  b->refcnt--;
80100220:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100223:	83 c4 10             	add    $0x10,%esp
  b->refcnt--;
80100226:	83 e8 01             	sub    $0x1,%eax
80100229:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010022c:	85 c0                	test   %eax,%eax
8010022e:	75 2c                	jne    8010025c <brelse+0x6c>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100230:	8b 53 54             	mov    0x54(%ebx),%edx
80100233:	8b 43 50             	mov    0x50(%ebx),%eax
80100236:	89 42 50             	mov    %eax,0x50(%edx)
    b->prev->next = b->next;
80100239:	8b 53 54             	mov    0x54(%ebx),%edx
8010023c:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
8010023f:	a1 b0 33 11 80       	mov    0x801133b0,%eax
    b->prev = &bcache.head;
80100244:	c7 43 50 5c 33 11 80 	movl   $0x8011335c,0x50(%ebx)
    b->next = bcache.head.next;
8010024b:	89 43 54             	mov    %eax,0x54(%ebx)
    bcache.head.next->prev = b;
8010024e:	a1 b0 33 11 80       	mov    0x801133b0,%eax
80100253:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100256:	89 1d b0 33 11 80    	mov    %ebx,0x801133b0
  }
  
  release(&bcache.lock);
8010025c:	c7 45 08 20 a5 10 80 	movl   $0x8010a520,0x8(%ebp)
}
80100263:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100266:	5b                   	pop    %ebx
80100267:	5e                   	pop    %esi
80100268:	5d                   	pop    %ebp
  release(&bcache.lock);
80100269:	e9 22 54 00 00       	jmp    80105690 <release>
    panic("brelse");
8010026e:	83 ec 0c             	sub    $0xc,%esp
80100271:	68 86 74 10 80       	push   $0x80107486
80100276:	e8 05 01 00 00       	call   80100380 <panic>
8010027b:	66 90                	xchg   %ax,%ax
8010027d:	66 90                	xchg   %ax,%ax
8010027f:	90                   	nop

80100280 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100280:	55                   	push   %ebp
80100281:	89 e5                	mov    %esp,%ebp
80100283:	57                   	push   %edi
80100284:	56                   	push   %esi
80100285:	53                   	push   %ebx
80100286:	83 ec 18             	sub    $0x18,%esp
80100289:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010028c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010028f:	ff 75 08             	push   0x8(%ebp)
  target = n;
80100292:	89 df                	mov    %ebx,%edi
  iunlock(ip);
80100294:	e8 47 16 00 00       	call   801018e0 <iunlock>
  acquire(&cons.lock);
80100299:	c7 04 24 c0 38 11 80 	movl   $0x801138c0,(%esp)
801002a0:	e8 4b 54 00 00       	call   801056f0 <acquire>
  while(n > 0){
801002a5:	83 c4 10             	add    $0x10,%esp
801002a8:	85 db                	test   %ebx,%ebx
801002aa:	0f 8e 94 00 00 00    	jle    80100344 <consoleread+0xc4>
    while(input.r == input.w){
801002b0:	a1 a0 38 11 80       	mov    0x801138a0,%eax
801002b5:	39 05 a4 38 11 80    	cmp    %eax,0x801138a4
801002bb:	74 25                	je     801002e2 <consoleread+0x62>
801002bd:	eb 59                	jmp    80100318 <consoleread+0x98>
801002bf:	90                   	nop
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002c0:	83 ec 08             	sub    $0x8,%esp
801002c3:	68 c0 38 11 80       	push   $0x801138c0
801002c8:	68 a0 38 11 80       	push   $0x801138a0
801002cd:	e8 ae 3d 00 00       	call   80104080 <sleep>
    while(input.r == input.w){
801002d2:	a1 a0 38 11 80       	mov    0x801138a0,%eax
801002d7:	83 c4 10             	add    $0x10,%esp
801002da:	3b 05 a4 38 11 80    	cmp    0x801138a4,%eax
801002e0:	75 36                	jne    80100318 <consoleread+0x98>
      if(myproc()->killed){
801002e2:	e8 09 35 00 00       	call   801037f0 <myproc>
801002e7:	8b 48 30             	mov    0x30(%eax),%ecx
801002ea:	85 c9                	test   %ecx,%ecx
801002ec:	74 d2                	je     801002c0 <consoleread+0x40>
        release(&cons.lock);
801002ee:	83 ec 0c             	sub    $0xc,%esp
801002f1:	68 c0 38 11 80       	push   $0x801138c0
801002f6:	e8 95 53 00 00       	call   80105690 <release>
        ilock(ip);
801002fb:	5a                   	pop    %edx
801002fc:	ff 75 08             	push   0x8(%ebp)
801002ff:	e8 ec 14 00 00       	call   801017f0 <ilock>
        return -1;
80100304:	83 c4 10             	add    $0x10,%esp
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
80100307:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
8010030a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010030f:	5b                   	pop    %ebx
80100310:	5e                   	pop    %esi
80100311:	5f                   	pop    %edi
80100312:	5d                   	pop    %ebp
80100313:	c3                   	ret
80100314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = input.buf[input.r++ % INPUT_BUF];
80100318:	8d 50 01             	lea    0x1(%eax),%edx
8010031b:	89 15 a0 38 11 80    	mov    %edx,0x801138a0
80100321:	89 c2                	mov    %eax,%edx
80100323:	83 e2 7f             	and    $0x7f,%edx
80100326:	0f be 8a 20 38 11 80 	movsbl -0x7feec7e0(%edx),%ecx
    if(c == C('D')){  // EOF
8010032d:	80 f9 04             	cmp    $0x4,%cl
80100330:	74 37                	je     80100369 <consoleread+0xe9>
    *dst++ = c;
80100332:	83 c6 01             	add    $0x1,%esi
    --n;
80100335:	83 eb 01             	sub    $0x1,%ebx
    *dst++ = c;
80100338:	88 4e ff             	mov    %cl,-0x1(%esi)
    if(c == '\n')
8010033b:	83 f9 0a             	cmp    $0xa,%ecx
8010033e:	0f 85 64 ff ff ff    	jne    801002a8 <consoleread+0x28>
  release(&cons.lock);
80100344:	83 ec 0c             	sub    $0xc,%esp
80100347:	68 c0 38 11 80       	push   $0x801138c0
8010034c:	e8 3f 53 00 00       	call   80105690 <release>
  ilock(ip);
80100351:	58                   	pop    %eax
80100352:	ff 75 08             	push   0x8(%ebp)
80100355:	e8 96 14 00 00       	call   801017f0 <ilock>
  return target - n;
8010035a:	89 f8                	mov    %edi,%eax
8010035c:	83 c4 10             	add    $0x10,%esp
}
8010035f:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return target - n;
80100362:	29 d8                	sub    %ebx,%eax
}
80100364:	5b                   	pop    %ebx
80100365:	5e                   	pop    %esi
80100366:	5f                   	pop    %edi
80100367:	5d                   	pop    %ebp
80100368:	c3                   	ret
      if(n < target){
80100369:	39 fb                	cmp    %edi,%ebx
8010036b:	73 d7                	jae    80100344 <consoleread+0xc4>
        input.r--;
8010036d:	a3 a0 38 11 80       	mov    %eax,0x801138a0
80100372:	eb d0                	jmp    80100344 <consoleread+0xc4>
80100374:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010037b:	00 
8010037c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100380 <panic>:
{
80100380:	55                   	push   %ebp
80100381:	89 e5                	mov    %esp,%ebp
80100383:	56                   	push   %esi
80100384:	53                   	push   %ebx
80100385:	83 ec 30             	sub    $0x30,%esp
  asm volatile("movw %0, %%gs" : : "r" (v));
}

static inline void cli(void)
{
  asm volatile("cli");
80100388:	fa                   	cli
  cons.locking = 0;
80100389:	c7 05 f4 38 11 80 00 	movl   $0x0,0x801138f4
80100390:	00 00 00 
  getcallerpcs(&s, pcs);
80100393:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100396:	8d 75 f8             	lea    -0x8(%ebp),%esi
  cprintf("lapicid %d: panic: ", lapicid());
80100399:	e8 b2 25 00 00       	call   80102950 <lapicid>
8010039e:	83 ec 08             	sub    $0x8,%esp
801003a1:	50                   	push   %eax
801003a2:	68 8d 74 10 80       	push   $0x8010748d
801003a7:	e8 04 03 00 00       	call   801006b0 <cprintf>
  cprintf(s);
801003ac:	58                   	pop    %eax
801003ad:	ff 75 08             	push   0x8(%ebp)
801003b0:	e8 fb 02 00 00       	call   801006b0 <cprintf>
  cprintf("\n");
801003b5:	c7 04 24 ed 78 10 80 	movl   $0x801078ed,(%esp)
801003bc:	e8 ef 02 00 00       	call   801006b0 <cprintf>
  getcallerpcs(&s, pcs);
801003c1:	8d 45 08             	lea    0x8(%ebp),%eax
801003c4:	5a                   	pop    %edx
801003c5:	59                   	pop    %ecx
801003c6:	53                   	push   %ebx
801003c7:	50                   	push   %eax
801003c8:	e8 53 51 00 00       	call   80105520 <getcallerpcs>
  for(i=0; i<10; i++)
801003cd:	83 c4 10             	add    $0x10,%esp
    cprintf(" %p", pcs[i]);
801003d0:	83 ec 08             	sub    $0x8,%esp
801003d3:	ff 33                	push   (%ebx)
  for(i=0; i<10; i++)
801003d5:	83 c3 04             	add    $0x4,%ebx
    cprintf(" %p", pcs[i]);
801003d8:	68 a1 74 10 80       	push   $0x801074a1
801003dd:	e8 ce 02 00 00       	call   801006b0 <cprintf>
  for(i=0; i<10; i++)
801003e2:	83 c4 10             	add    $0x10,%esp
801003e5:	39 f3                	cmp    %esi,%ebx
801003e7:	75 e7                	jne    801003d0 <panic+0x50>
  panicked = 1; // freeze other CPU
801003e9:	c7 05 f8 38 11 80 01 	movl   $0x1,0x801138f8
801003f0:	00 00 00 
  for(;;)
801003f3:	eb fe                	jmp    801003f3 <panic+0x73>
801003f5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801003fc:	00 
801003fd:	8d 76 00             	lea    0x0(%esi),%esi

80100400 <consputc.part.0>:
consputc(int c)
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	83 ec 1c             	sub    $0x1c,%esp
  if(c == BACKSPACE){
80100409:	3d 00 01 00 00       	cmp    $0x100,%eax
8010040e:	0f 84 cc 00 00 00    	je     801004e0 <consputc.part.0+0xe0>
    uartputc(c);
80100414:	83 ec 0c             	sub    $0xc,%esp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100417:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010041c:	89 c3                	mov    %eax,%ebx
8010041e:	50                   	push   %eax
8010041f:	e8 6c 5a 00 00       	call   80105e90 <uartputc>
80100424:	b8 0e 00 00 00       	mov    $0xe,%eax
80100429:	89 fa                	mov    %edi,%edx
8010042b:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042c:	be d5 03 00 00       	mov    $0x3d5,%esi
80100431:	89 f2                	mov    %esi,%edx
80100433:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
80100434:	0f b6 c8             	movzbl %al,%ecx
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100437:	89 fa                	mov    %edi,%edx
80100439:	b8 0f 00 00 00       	mov    $0xf,%eax
8010043e:	c1 e1 08             	shl    $0x8,%ecx
80100441:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100442:	89 f2                	mov    %esi,%edx
80100444:	ec                   	in     (%dx),%al
  pos |= inb(CRTPORT+1);
80100445:	0f b6 c0             	movzbl %al,%eax
  if(c == '\n')
80100448:	83 c4 10             	add    $0x10,%esp
  pos |= inb(CRTPORT+1);
8010044b:	09 c8                	or     %ecx,%eax
  if(c == '\n')
8010044d:	83 fb 0a             	cmp    $0xa,%ebx
80100450:	75 76                	jne    801004c8 <consputc.part.0+0xc8>
    pos += 80 - pos%80;
80100452:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
80100457:	f7 e2                	mul    %edx
80100459:	c1 ea 06             	shr    $0x6,%edx
8010045c:	8d 04 92             	lea    (%edx,%edx,4),%eax
8010045f:	c1 e0 04             	shl    $0x4,%eax
80100462:	8d 70 50             	lea    0x50(%eax),%esi
  if(pos < 0 || pos > 25*80)
80100465:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
8010046b:	0f 8f 2f 01 00 00    	jg     801005a0 <consputc.part.0+0x1a0>
  if((pos/80) >= 24){  // Scroll up.
80100471:	81 fe 7f 07 00 00    	cmp    $0x77f,%esi
80100477:	0f 8f c3 00 00 00    	jg     80100540 <consputc.part.0+0x140>
  outb(CRTPORT+1, pos>>8);
8010047d:	89 f0                	mov    %esi,%eax
  crt[pos] = ' ' | 0x0700;
8010047f:	8d b4 36 00 80 0b 80 	lea    -0x7ff48000(%esi,%esi,1),%esi
  outb(CRTPORT+1, pos);
80100486:	88 45 e7             	mov    %al,-0x19(%ebp)
  outb(CRTPORT+1, pos>>8);
80100489:	0f b6 fc             	movzbl %ah,%edi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010048c:	bb d4 03 00 00       	mov    $0x3d4,%ebx
80100491:	b8 0e 00 00 00       	mov    $0xe,%eax
80100496:	89 da                	mov    %ebx,%edx
80100498:	ee                   	out    %al,(%dx)
80100499:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
8010049e:	89 f8                	mov    %edi,%eax
801004a0:	89 ca                	mov    %ecx,%edx
801004a2:	ee                   	out    %al,(%dx)
801004a3:	b8 0f 00 00 00       	mov    $0xf,%eax
801004a8:	89 da                	mov    %ebx,%edx
801004aa:	ee                   	out    %al,(%dx)
801004ab:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
801004af:	89 ca                	mov    %ecx,%edx
801004b1:	ee                   	out    %al,(%dx)
  crt[pos] = ' ' | 0x0700;
801004b2:	b8 20 07 00 00       	mov    $0x720,%eax
801004b7:	66 89 06             	mov    %ax,(%esi)
}
801004ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004bd:	5b                   	pop    %ebx
801004be:	5e                   	pop    %esi
801004bf:	5f                   	pop    %edi
801004c0:	5d                   	pop    %ebp
801004c1:	c3                   	ret
801004c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
801004c8:	0f b6 db             	movzbl %bl,%ebx
801004cb:	8d 70 01             	lea    0x1(%eax),%esi
801004ce:	80 cf 07             	or     $0x7,%bh
801004d1:	66 89 9c 00 00 80 0b 	mov    %bx,-0x7ff48000(%eax,%eax,1)
801004d8:	80 
801004d9:	eb 8a                	jmp    80100465 <consputc.part.0+0x65>
801004db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004e0:	83 ec 0c             	sub    $0xc,%esp
801004e3:	be d4 03 00 00       	mov    $0x3d4,%esi
801004e8:	6a 08                	push   $0x8
801004ea:	e8 a1 59 00 00       	call   80105e90 <uartputc>
801004ef:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f6:	e8 95 59 00 00       	call   80105e90 <uartputc>
801004fb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100502:	e8 89 59 00 00       	call   80105e90 <uartputc>
80100507:	b8 0e 00 00 00       	mov    $0xe,%eax
8010050c:	89 f2                	mov    %esi,%edx
8010050e:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010050f:	bb d5 03 00 00       	mov    $0x3d5,%ebx
80100514:	89 da                	mov    %ebx,%edx
80100516:	ec                   	in     (%dx),%al
  pos = inb(CRTPORT+1) << 8;
80100517:	0f b6 c8             	movzbl %al,%ecx
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010051a:	89 f2                	mov    %esi,%edx
8010051c:	b8 0f 00 00 00       	mov    $0xf,%eax
80100521:	c1 e1 08             	shl    $0x8,%ecx
80100524:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100525:	89 da                	mov    %ebx,%edx
80100527:	ec                   	in     (%dx),%al
  pos |= inb(CRTPORT+1);
80100528:	0f b6 f0             	movzbl %al,%esi
    if(pos > 0) --pos;
8010052b:	83 c4 10             	add    $0x10,%esp
8010052e:	09 ce                	or     %ecx,%esi
80100530:	74 5e                	je     80100590 <consputc.part.0+0x190>
80100532:	83 ee 01             	sub    $0x1,%esi
80100535:	e9 2b ff ff ff       	jmp    80100465 <consputc.part.0+0x65>
8010053a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100540:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
80100543:	8d 5e b0             	lea    -0x50(%esi),%ebx
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100546:	8d b4 36 60 7f 0b 80 	lea    -0x7ff480a0(%esi,%esi,1),%esi
  outb(CRTPORT+1, pos);
8010054d:	bf 07 00 00 00       	mov    $0x7,%edi
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100552:	68 60 0e 00 00       	push   $0xe60
80100557:	68 a0 80 0b 80       	push   $0x800b80a0
8010055c:	68 00 80 0b 80       	push   $0x800b8000
80100561:	e8 1a 53 00 00       	call   80105880 <memmove>
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100566:	b8 80 07 00 00       	mov    $0x780,%eax
8010056b:	83 c4 0c             	add    $0xc,%esp
8010056e:	29 d8                	sub    %ebx,%eax
80100570:	01 c0                	add    %eax,%eax
80100572:	50                   	push   %eax
80100573:	6a 00                	push   $0x0
80100575:	56                   	push   %esi
80100576:	e8 75 52 00 00       	call   801057f0 <memset>
  outb(CRTPORT+1, pos);
8010057b:	88 5d e7             	mov    %bl,-0x19(%ebp)
8010057e:	83 c4 10             	add    $0x10,%esp
80100581:	e9 06 ff ff ff       	jmp    8010048c <consputc.part.0+0x8c>
80100586:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010058d:	00 
8010058e:	66 90                	xchg   %ax,%ax
80100590:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
80100594:	be 00 80 0b 80       	mov    $0x800b8000,%esi
80100599:	31 ff                	xor    %edi,%edi
8010059b:	e9 ec fe ff ff       	jmp    8010048c <consputc.part.0+0x8c>
    panic("pos under/overflow");
801005a0:	83 ec 0c             	sub    $0xc,%esp
801005a3:	68 a5 74 10 80       	push   $0x801074a5
801005a8:	e8 d3 fd ff ff       	call   80100380 <panic>
801005ad:	8d 76 00             	lea    0x0(%esi),%esi

801005b0 <consolewrite>:

int
consolewrite(struct inode *ip, char *buf, int n)
{
801005b0:	55                   	push   %ebp
801005b1:	89 e5                	mov    %esp,%ebp
801005b3:	57                   	push   %edi
801005b4:	56                   	push   %esi
801005b5:	53                   	push   %ebx
801005b6:	83 ec 18             	sub    $0x18,%esp
801005b9:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
801005bc:	ff 75 08             	push   0x8(%ebp)
801005bf:	e8 1c 13 00 00       	call   801018e0 <iunlock>
  acquire(&cons.lock);
801005c4:	c7 04 24 c0 38 11 80 	movl   $0x801138c0,(%esp)
801005cb:	e8 20 51 00 00       	call   801056f0 <acquire>
  for(i = 0; i < n; i++)
801005d0:	83 c4 10             	add    $0x10,%esp
801005d3:	85 f6                	test   %esi,%esi
801005d5:	7e 25                	jle    801005fc <consolewrite+0x4c>
801005d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801005da:	8d 3c 33             	lea    (%ebx,%esi,1),%edi
  if(panicked){
801005dd:	8b 15 f8 38 11 80    	mov    0x801138f8,%edx
    consputc(buf[i] & 0xff);
801005e3:	0f b6 03             	movzbl (%ebx),%eax
  if(panicked){
801005e6:	85 d2                	test   %edx,%edx
801005e8:	74 06                	je     801005f0 <consolewrite+0x40>
  asm volatile("cli");
801005ea:	fa                   	cli
    for(;;)
801005eb:	eb fe                	jmp    801005eb <consolewrite+0x3b>
801005ed:	8d 76 00             	lea    0x0(%esi),%esi
801005f0:	e8 0b fe ff ff       	call   80100400 <consputc.part.0>
  for(i = 0; i < n; i++)
801005f5:	83 c3 01             	add    $0x1,%ebx
801005f8:	39 fb                	cmp    %edi,%ebx
801005fa:	75 e1                	jne    801005dd <consolewrite+0x2d>
  release(&cons.lock);
801005fc:	83 ec 0c             	sub    $0xc,%esp
801005ff:	68 c0 38 11 80       	push   $0x801138c0
80100604:	e8 87 50 00 00       	call   80105690 <release>
  ilock(ip);
80100609:	58                   	pop    %eax
8010060a:	ff 75 08             	push   0x8(%ebp)
8010060d:	e8 de 11 00 00       	call   801017f0 <ilock>

  return n;
}
80100612:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100615:	89 f0                	mov    %esi,%eax
80100617:	5b                   	pop    %ebx
80100618:	5e                   	pop    %esi
80100619:	5f                   	pop    %edi
8010061a:	5d                   	pop    %ebp
8010061b:	c3                   	ret
8010061c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100620 <printint>:
{
80100620:	55                   	push   %ebp
80100621:	89 e5                	mov    %esp,%ebp
80100623:	57                   	push   %edi
80100624:	56                   	push   %esi
80100625:	53                   	push   %ebx
80100626:	89 d3                	mov    %edx,%ebx
80100628:	83 ec 2c             	sub    $0x2c,%esp
  if(sign && (sign = xx < 0))
8010062b:	85 c0                	test   %eax,%eax
8010062d:	79 05                	jns    80100634 <printint+0x14>
8010062f:	83 e1 01             	and    $0x1,%ecx
80100632:	75 64                	jne    80100698 <printint+0x78>
    x = xx;
80100634:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
8010063b:	89 c1                	mov    %eax,%ecx
  i = 0;
8010063d:	31 f6                	xor    %esi,%esi
8010063f:	90                   	nop
    buf[i++] = digits[x % base];
80100640:	89 c8                	mov    %ecx,%eax
80100642:	31 d2                	xor    %edx,%edx
80100644:	89 f7                	mov    %esi,%edi
80100646:	f7 f3                	div    %ebx
80100648:	8d 76 01             	lea    0x1(%esi),%esi
8010064b:	0f b6 92 40 79 10 80 	movzbl -0x7fef86c0(%edx),%edx
80100652:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
80100656:	89 ca                	mov    %ecx,%edx
80100658:	89 c1                	mov    %eax,%ecx
8010065a:	39 da                	cmp    %ebx,%edx
8010065c:	73 e2                	jae    80100640 <printint+0x20>
  if(sign)
8010065e:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
80100661:	85 c9                	test   %ecx,%ecx
80100663:	74 07                	je     8010066c <printint+0x4c>
    buf[i++] = '-';
80100665:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
  while(--i >= 0)
8010066a:	89 f7                	mov    %esi,%edi
8010066c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
8010066f:	01 df                	add    %ebx,%edi
  if(panicked){
80100671:	8b 15 f8 38 11 80    	mov    0x801138f8,%edx
    consputc(buf[i]);
80100677:	0f be 07             	movsbl (%edi),%eax
  if(panicked){
8010067a:	85 d2                	test   %edx,%edx
8010067c:	74 0a                	je     80100688 <printint+0x68>
8010067e:	fa                   	cli
    for(;;)
8010067f:	eb fe                	jmp    8010067f <printint+0x5f>
80100681:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100688:	e8 73 fd ff ff       	call   80100400 <consputc.part.0>
  while(--i >= 0)
8010068d:	8d 47 ff             	lea    -0x1(%edi),%eax
80100690:	39 df                	cmp    %ebx,%edi
80100692:	74 11                	je     801006a5 <printint+0x85>
80100694:	89 c7                	mov    %eax,%edi
80100696:	eb d9                	jmp    80100671 <printint+0x51>
    x = -xx;
80100698:	f7 d8                	neg    %eax
  if(sign && (sign = xx < 0))
8010069a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    x = -xx;
801006a1:	89 c1                	mov    %eax,%ecx
801006a3:	eb 98                	jmp    8010063d <printint+0x1d>
}
801006a5:	83 c4 2c             	add    $0x2c,%esp
801006a8:	5b                   	pop    %ebx
801006a9:	5e                   	pop    %esi
801006aa:	5f                   	pop    %edi
801006ab:	5d                   	pop    %ebp
801006ac:	c3                   	ret
801006ad:	8d 76 00             	lea    0x0(%esi),%esi

801006b0 <cprintf>:
{
801006b0:	55                   	push   %ebp
801006b1:	89 e5                	mov    %esp,%ebp
801006b3:	57                   	push   %edi
801006b4:	56                   	push   %esi
801006b5:	53                   	push   %ebx
801006b6:	83 ec 1c             	sub    $0x1c,%esp
  locking = cons.locking;
801006b9:	8b 3d f4 38 11 80    	mov    0x801138f4,%edi
  if (fmt == 0)
801006bf:	8b 75 08             	mov    0x8(%ebp),%esi
  if(locking)
801006c2:	85 ff                	test   %edi,%edi
801006c4:	0f 85 06 01 00 00    	jne    801007d0 <cprintf+0x120>
  if (fmt == 0)
801006ca:	85 f6                	test   %esi,%esi
801006cc:	0f 84 b7 01 00 00    	je     80100889 <cprintf+0x1d9>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006d2:	0f b6 06             	movzbl (%esi),%eax
801006d5:	85 c0                	test   %eax,%eax
801006d7:	74 5f                	je     80100738 <cprintf+0x88>
  argp = (uint*)(void*)(&fmt + 1);
801006d9:	8d 55 0c             	lea    0xc(%ebp),%edx
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006dc:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801006df:	31 db                	xor    %ebx,%ebx
801006e1:	89 d7                	mov    %edx,%edi
    if(c != '%'){
801006e3:	83 f8 25             	cmp    $0x25,%eax
801006e6:	75 58                	jne    80100740 <cprintf+0x90>
    c = fmt[++i] & 0xff;
801006e8:	83 c3 01             	add    $0x1,%ebx
801006eb:	0f b6 0c 1e          	movzbl (%esi,%ebx,1),%ecx
    if(c == 0)
801006ef:	85 c9                	test   %ecx,%ecx
801006f1:	74 3a                	je     8010072d <cprintf+0x7d>
    switch(c){
801006f3:	83 f9 70             	cmp    $0x70,%ecx
801006f6:	0f 84 b4 00 00 00    	je     801007b0 <cprintf+0x100>
801006fc:	7f 72                	jg     80100770 <cprintf+0xc0>
801006fe:	83 f9 25             	cmp    $0x25,%ecx
80100701:	74 4d                	je     80100750 <cprintf+0xa0>
80100703:	83 f9 64             	cmp    $0x64,%ecx
80100706:	75 76                	jne    8010077e <cprintf+0xce>
      printint(*argp++, 10, 1);
80100708:	8d 47 04             	lea    0x4(%edi),%eax
8010070b:	b9 01 00 00 00       	mov    $0x1,%ecx
80100710:	ba 0a 00 00 00       	mov    $0xa,%edx
80100715:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100718:	8b 07                	mov    (%edi),%eax
8010071a:	e8 01 ff ff ff       	call   80100620 <printint>
8010071f:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100722:	83 c3 01             	add    $0x1,%ebx
80100725:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
80100729:	85 c0                	test   %eax,%eax
8010072b:	75 b6                	jne    801006e3 <cprintf+0x33>
8010072d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  if(locking)
80100730:	85 ff                	test   %edi,%edi
80100732:	0f 85 bb 00 00 00    	jne    801007f3 <cprintf+0x143>
}
80100738:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010073b:	5b                   	pop    %ebx
8010073c:	5e                   	pop    %esi
8010073d:	5f                   	pop    %edi
8010073e:	5d                   	pop    %ebp
8010073f:	c3                   	ret
  if(panicked){
80100740:	8b 0d f8 38 11 80    	mov    0x801138f8,%ecx
80100746:	85 c9                	test   %ecx,%ecx
80100748:	74 19                	je     80100763 <cprintf+0xb3>
8010074a:	fa                   	cli
    for(;;)
8010074b:	eb fe                	jmp    8010074b <cprintf+0x9b>
8010074d:	8d 76 00             	lea    0x0(%esi),%esi
  if(panicked){
80100750:	8b 0d f8 38 11 80    	mov    0x801138f8,%ecx
80100756:	85 c9                	test   %ecx,%ecx
80100758:	0f 85 f2 00 00 00    	jne    80100850 <cprintf+0x1a0>
8010075e:	b8 25 00 00 00       	mov    $0x25,%eax
80100763:	e8 98 fc ff ff       	call   80100400 <consputc.part.0>
      break;
80100768:	eb b8                	jmp    80100722 <cprintf+0x72>
8010076a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    switch(c){
80100770:	83 f9 73             	cmp    $0x73,%ecx
80100773:	0f 84 8f 00 00 00    	je     80100808 <cprintf+0x158>
80100779:	83 f9 78             	cmp    $0x78,%ecx
8010077c:	74 32                	je     801007b0 <cprintf+0x100>
  if(panicked){
8010077e:	8b 15 f8 38 11 80    	mov    0x801138f8,%edx
80100784:	85 d2                	test   %edx,%edx
80100786:	0f 85 b8 00 00 00    	jne    80100844 <cprintf+0x194>
8010078c:	b8 25 00 00 00       	mov    $0x25,%eax
80100791:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80100794:	e8 67 fc ff ff       	call   80100400 <consputc.part.0>
80100799:	a1 f8 38 11 80       	mov    0x801138f8,%eax
8010079e:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801007a1:	85 c0                	test   %eax,%eax
801007a3:	0f 84 cd 00 00 00    	je     80100876 <cprintf+0x1c6>
801007a9:	fa                   	cli
    for(;;)
801007aa:	eb fe                	jmp    801007aa <cprintf+0xfa>
801007ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printint(*argp++, 16, 0);
801007b0:	8d 47 04             	lea    0x4(%edi),%eax
801007b3:	31 c9                	xor    %ecx,%ecx
801007b5:	ba 10 00 00 00       	mov    $0x10,%edx
801007ba:	89 45 e0             	mov    %eax,-0x20(%ebp)
801007bd:	8b 07                	mov    (%edi),%eax
801007bf:	e8 5c fe ff ff       	call   80100620 <printint>
801007c4:	8b 7d e0             	mov    -0x20(%ebp),%edi
      break;
801007c7:	e9 56 ff ff ff       	jmp    80100722 <cprintf+0x72>
801007cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    acquire(&cons.lock);
801007d0:	83 ec 0c             	sub    $0xc,%esp
801007d3:	68 c0 38 11 80       	push   $0x801138c0
801007d8:	e8 13 4f 00 00       	call   801056f0 <acquire>
  if (fmt == 0)
801007dd:	83 c4 10             	add    $0x10,%esp
801007e0:	85 f6                	test   %esi,%esi
801007e2:	0f 84 a1 00 00 00    	je     80100889 <cprintf+0x1d9>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801007e8:	0f b6 06             	movzbl (%esi),%eax
801007eb:	85 c0                	test   %eax,%eax
801007ed:	0f 85 e6 fe ff ff    	jne    801006d9 <cprintf+0x29>
    release(&cons.lock);
801007f3:	83 ec 0c             	sub    $0xc,%esp
801007f6:	68 c0 38 11 80       	push   $0x801138c0
801007fb:	e8 90 4e 00 00       	call   80105690 <release>
80100800:	83 c4 10             	add    $0x10,%esp
80100803:	e9 30 ff ff ff       	jmp    80100738 <cprintf+0x88>
      if((s = (char*)*argp++) == 0)
80100808:	8b 17                	mov    (%edi),%edx
8010080a:	8d 47 04             	lea    0x4(%edi),%eax
8010080d:	85 d2                	test   %edx,%edx
8010080f:	74 27                	je     80100838 <cprintf+0x188>
      for(; *s; s++)
80100811:	0f b6 0a             	movzbl (%edx),%ecx
      if((s = (char*)*argp++) == 0)
80100814:	89 d7                	mov    %edx,%edi
      for(; *s; s++)
80100816:	84 c9                	test   %cl,%cl
80100818:	74 68                	je     80100882 <cprintf+0x1d2>
8010081a:	89 5d e0             	mov    %ebx,-0x20(%ebp)
8010081d:	89 fb                	mov    %edi,%ebx
8010081f:	89 f7                	mov    %esi,%edi
80100821:	89 c6                	mov    %eax,%esi
80100823:	0f be c1             	movsbl %cl,%eax
  if(panicked){
80100826:	8b 15 f8 38 11 80    	mov    0x801138f8,%edx
8010082c:	85 d2                	test   %edx,%edx
8010082e:	74 28                	je     80100858 <cprintf+0x1a8>
80100830:	fa                   	cli
    for(;;)
80100831:	eb fe                	jmp    80100831 <cprintf+0x181>
80100833:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80100838:	b9 28 00 00 00       	mov    $0x28,%ecx
        s = "(null)";
8010083d:	bf b8 74 10 80       	mov    $0x801074b8,%edi
80100842:	eb d6                	jmp    8010081a <cprintf+0x16a>
80100844:	fa                   	cli
    for(;;)
80100845:	eb fe                	jmp    80100845 <cprintf+0x195>
80100847:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010084e:	00 
8010084f:	90                   	nop
80100850:	fa                   	cli
80100851:	eb fe                	jmp    80100851 <cprintf+0x1a1>
80100853:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80100858:	e8 a3 fb ff ff       	call   80100400 <consputc.part.0>
      for(; *s; s++)
8010085d:	0f be 43 01          	movsbl 0x1(%ebx),%eax
80100861:	83 c3 01             	add    $0x1,%ebx
80100864:	84 c0                	test   %al,%al
80100866:	75 be                	jne    80100826 <cprintf+0x176>
      if((s = (char*)*argp++) == 0)
80100868:	89 f0                	mov    %esi,%eax
8010086a:	8b 5d e0             	mov    -0x20(%ebp),%ebx
8010086d:	89 fe                	mov    %edi,%esi
8010086f:	89 c7                	mov    %eax,%edi
80100871:	e9 ac fe ff ff       	jmp    80100722 <cprintf+0x72>
80100876:	89 c8                	mov    %ecx,%eax
80100878:	e8 83 fb ff ff       	call   80100400 <consputc.part.0>
      break;
8010087d:	e9 a0 fe ff ff       	jmp    80100722 <cprintf+0x72>
      if((s = (char*)*argp++) == 0)
80100882:	89 c7                	mov    %eax,%edi
80100884:	e9 99 fe ff ff       	jmp    80100722 <cprintf+0x72>
    panic("null fmt");
80100889:	83 ec 0c             	sub    $0xc,%esp
8010088c:	68 bf 74 10 80       	push   $0x801074bf
80100891:	e8 ea fa ff ff       	call   80100380 <panic>
80100896:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010089d:	00 
8010089e:	66 90                	xchg   %ax,%ax

801008a0 <consoleintr>:
{
801008a0:	55                   	push   %ebp
801008a1:	89 e5                	mov    %esp,%ebp
801008a3:	57                   	push   %edi
  int c, doprocdump = 0;
801008a4:	31 ff                	xor    %edi,%edi
{
801008a6:	56                   	push   %esi
801008a7:	53                   	push   %ebx
801008a8:	83 ec 18             	sub    $0x18,%esp
801008ab:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&cons.lock);
801008ae:	68 c0 38 11 80       	push   $0x801138c0
801008b3:	e8 38 4e 00 00       	call   801056f0 <acquire>
  while((c = getc()) >= 0){
801008b8:	83 c4 10             	add    $0x10,%esp
801008bb:	ff d6                	call   *%esi
801008bd:	89 c3                	mov    %eax,%ebx
801008bf:	85 c0                	test   %eax,%eax
801008c1:	78 22                	js     801008e5 <consoleintr+0x45>
    switch(c){
801008c3:	83 fb 15             	cmp    $0x15,%ebx
801008c6:	74 47                	je     8010090f <consoleintr+0x6f>
801008c8:	7f 76                	jg     80100940 <consoleintr+0xa0>
801008ca:	83 fb 08             	cmp    $0x8,%ebx
801008cd:	74 76                	je     80100945 <consoleintr+0xa5>
801008cf:	83 fb 10             	cmp    $0x10,%ebx
801008d2:	0f 85 f8 00 00 00    	jne    801009d0 <consoleintr+0x130>
  while((c = getc()) >= 0){
801008d8:	ff d6                	call   *%esi
    switch(c){
801008da:	bf 01 00 00 00       	mov    $0x1,%edi
  while((c = getc()) >= 0){
801008df:	89 c3                	mov    %eax,%ebx
801008e1:	85 c0                	test   %eax,%eax
801008e3:	79 de                	jns    801008c3 <consoleintr+0x23>
  release(&cons.lock);
801008e5:	83 ec 0c             	sub    $0xc,%esp
801008e8:	68 c0 38 11 80       	push   $0x801138c0
801008ed:	e8 9e 4d 00 00       	call   80105690 <release>
  if(doprocdump) {
801008f2:	83 c4 10             	add    $0x10,%esp
801008f5:	85 ff                	test   %edi,%edi
801008f7:	0f 85 4b 01 00 00    	jne    80100a48 <consoleintr+0x1a8>
}
801008fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100900:	5b                   	pop    %ebx
80100901:	5e                   	pop    %esi
80100902:	5f                   	pop    %edi
80100903:	5d                   	pop    %ebp
80100904:	c3                   	ret
80100905:	b8 00 01 00 00       	mov    $0x100,%eax
8010090a:	e8 f1 fa ff ff       	call   80100400 <consputc.part.0>
      while(input.e != input.w &&
8010090f:	a1 a8 38 11 80       	mov    0x801138a8,%eax
80100914:	3b 05 a4 38 11 80    	cmp    0x801138a4,%eax
8010091a:	74 9f                	je     801008bb <consoleintr+0x1b>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
8010091c:	83 e8 01             	sub    $0x1,%eax
8010091f:	89 c2                	mov    %eax,%edx
80100921:	83 e2 7f             	and    $0x7f,%edx
      while(input.e != input.w &&
80100924:	80 ba 20 38 11 80 0a 	cmpb   $0xa,-0x7feec7e0(%edx)
8010092b:	74 8e                	je     801008bb <consoleintr+0x1b>
  if(panicked){
8010092d:	8b 15 f8 38 11 80    	mov    0x801138f8,%edx
        input.e--;
80100933:	a3 a8 38 11 80       	mov    %eax,0x801138a8
  if(panicked){
80100938:	85 d2                	test   %edx,%edx
8010093a:	74 c9                	je     80100905 <consoleintr+0x65>
8010093c:	fa                   	cli
    for(;;)
8010093d:	eb fe                	jmp    8010093d <consoleintr+0x9d>
8010093f:	90                   	nop
    switch(c){
80100940:	83 fb 7f             	cmp    $0x7f,%ebx
80100943:	75 2b                	jne    80100970 <consoleintr+0xd0>
      if(input.e != input.w){
80100945:	a1 a8 38 11 80       	mov    0x801138a8,%eax
8010094a:	3b 05 a4 38 11 80    	cmp    0x801138a4,%eax
80100950:	0f 84 65 ff ff ff    	je     801008bb <consoleintr+0x1b>
        input.e--;
80100956:	83 e8 01             	sub    $0x1,%eax
80100959:	a3 a8 38 11 80       	mov    %eax,0x801138a8
  if(panicked){
8010095e:	a1 f8 38 11 80       	mov    0x801138f8,%eax
80100963:	85 c0                	test   %eax,%eax
80100965:	0f 84 ce 00 00 00    	je     80100a39 <consoleintr+0x199>
8010096b:	fa                   	cli
    for(;;)
8010096c:	eb fe                	jmp    8010096c <consoleintr+0xcc>
8010096e:	66 90                	xchg   %ax,%ax
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100970:	a1 a8 38 11 80       	mov    0x801138a8,%eax
80100975:	89 c2                	mov    %eax,%edx
80100977:	2b 15 a0 38 11 80    	sub    0x801138a0,%edx
8010097d:	83 fa 7f             	cmp    $0x7f,%edx
80100980:	0f 87 35 ff ff ff    	ja     801008bb <consoleintr+0x1b>
  if(panicked){
80100986:	8b 0d f8 38 11 80    	mov    0x801138f8,%ecx
        input.buf[input.e++ % INPUT_BUF] = c;
8010098c:	8d 50 01             	lea    0x1(%eax),%edx
8010098f:	83 e0 7f             	and    $0x7f,%eax
80100992:	89 15 a8 38 11 80    	mov    %edx,0x801138a8
80100998:	88 98 20 38 11 80    	mov    %bl,-0x7feec7e0(%eax)
  if(panicked){
8010099e:	85 c9                	test   %ecx,%ecx
801009a0:	0f 85 ae 00 00 00    	jne    80100a54 <consoleintr+0x1b4>
801009a6:	89 d8                	mov    %ebx,%eax
801009a8:	e8 53 fa ff ff       	call   80100400 <consputc.part.0>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801009ad:	83 fb 0a             	cmp    $0xa,%ebx
801009b0:	74 68                	je     80100a1a <consoleintr+0x17a>
801009b2:	83 fb 04             	cmp    $0x4,%ebx
801009b5:	74 63                	je     80100a1a <consoleintr+0x17a>
801009b7:	a1 a0 38 11 80       	mov    0x801138a0,%eax
801009bc:	83 e8 80             	sub    $0xffffff80,%eax
801009bf:	39 05 a8 38 11 80    	cmp    %eax,0x801138a8
801009c5:	0f 85 f0 fe ff ff    	jne    801008bb <consoleintr+0x1b>
801009cb:	eb 52                	jmp    80100a1f <consoleintr+0x17f>
801009cd:	8d 76 00             	lea    0x0(%esi),%esi
      if(c != 0 && input.e-input.r < INPUT_BUF){
801009d0:	85 db                	test   %ebx,%ebx
801009d2:	0f 84 e3 fe ff ff    	je     801008bb <consoleintr+0x1b>
801009d8:	a1 a8 38 11 80       	mov    0x801138a8,%eax
801009dd:	89 c2                	mov    %eax,%edx
801009df:	2b 15 a0 38 11 80    	sub    0x801138a0,%edx
801009e5:	83 fa 7f             	cmp    $0x7f,%edx
801009e8:	0f 87 cd fe ff ff    	ja     801008bb <consoleintr+0x1b>
        input.buf[input.e++ % INPUT_BUF] = c;
801009ee:	8d 50 01             	lea    0x1(%eax),%edx
  if(panicked){
801009f1:	8b 0d f8 38 11 80    	mov    0x801138f8,%ecx
        input.buf[input.e++ % INPUT_BUF] = c;
801009f7:	83 e0 7f             	and    $0x7f,%eax
        c = (c == '\r') ? '\n' : c;
801009fa:	83 fb 0d             	cmp    $0xd,%ebx
801009fd:	75 93                	jne    80100992 <consoleintr+0xf2>
        input.buf[input.e++ % INPUT_BUF] = c;
801009ff:	89 15 a8 38 11 80    	mov    %edx,0x801138a8
80100a05:	c6 80 20 38 11 80 0a 	movb   $0xa,-0x7feec7e0(%eax)
  if(panicked){
80100a0c:	85 c9                	test   %ecx,%ecx
80100a0e:	75 44                	jne    80100a54 <consoleintr+0x1b4>
80100a10:	b8 0a 00 00 00       	mov    $0xa,%eax
80100a15:	e8 e6 f9 ff ff       	call   80100400 <consputc.part.0>
          input.w = input.e;
80100a1a:	a1 a8 38 11 80       	mov    0x801138a8,%eax
          wakeup(&input.r);
80100a1f:	83 ec 0c             	sub    $0xc,%esp
          input.w = input.e;
80100a22:	a3 a4 38 11 80       	mov    %eax,0x801138a4
          wakeup(&input.r);
80100a27:	68 a0 38 11 80       	push   $0x801138a0
80100a2c:	e8 0f 37 00 00       	call   80104140 <wakeup>
80100a31:	83 c4 10             	add    $0x10,%esp
80100a34:	e9 82 fe ff ff       	jmp    801008bb <consoleintr+0x1b>
80100a39:	b8 00 01 00 00       	mov    $0x100,%eax
80100a3e:	e8 bd f9 ff ff       	call   80100400 <consputc.part.0>
80100a43:	e9 73 fe ff ff       	jmp    801008bb <consoleintr+0x1b>
}
80100a48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a4b:	5b                   	pop    %ebx
80100a4c:	5e                   	pop    %esi
80100a4d:	5f                   	pop    %edi
80100a4e:	5d                   	pop    %ebp
    procdump();  // now call procdump() wo. cons.lock held
80100a4f:	e9 cc 37 00 00       	jmp    80104220 <procdump>
80100a54:	fa                   	cli
    for(;;)
80100a55:	eb fe                	jmp    80100a55 <consoleintr+0x1b5>
80100a57:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80100a5e:	00 
80100a5f:	90                   	nop

80100a60 <consoleinit>:

void
consoleinit(void)
{
80100a60:	55                   	push   %ebp
80100a61:	89 e5                	mov    %esp,%ebp
80100a63:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
80100a66:	68 c8 74 10 80       	push   $0x801074c8
80100a6b:	68 c0 38 11 80       	push   $0x801138c0
80100a70:	e8 8b 4a 00 00       	call   80105500 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
80100a75:	58                   	pop    %eax
80100a76:	5a                   	pop    %edx
80100a77:	6a 00                	push   $0x0
80100a79:	6a 01                	push   $0x1
  devsw[CONSOLE].write = consolewrite;
80100a7b:	c7 05 ac 42 11 80 b0 	movl   $0x801005b0,0x801142ac
80100a82:	05 10 80 
  devsw[CONSOLE].read = consoleread;
80100a85:	c7 05 a8 42 11 80 80 	movl   $0x80100280,0x801142a8
80100a8c:	02 10 80 
  cons.locking = 1;
80100a8f:	c7 05 f4 38 11 80 01 	movl   $0x1,0x801138f4
80100a96:	00 00 00 
  ioapicenable(IRQ_KBD, 0);
80100a99:	e8 42 1a 00 00       	call   801024e0 <ioapicenable>
}
80100a9e:	83 c4 10             	add    $0x10,%esp
80100aa1:	c9                   	leave
80100aa2:	c3                   	ret
80100aa3:	66 90                	xchg   %ax,%ax
80100aa5:	66 90                	xchg   %ax,%ax
80100aa7:	66 90                	xchg   %ax,%ax
80100aa9:	66 90                	xchg   %ax,%ax
80100aab:	66 90                	xchg   %ax,%ax
80100aad:	66 90                	xchg   %ax,%ax
80100aaf:	90                   	nop

80100ab0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
80100ab0:	55                   	push   %ebp
80100ab1:	89 e5                	mov    %esp,%ebp
80100ab3:	57                   	push   %edi
80100ab4:	56                   	push   %esi
80100ab5:	53                   	push   %ebx
80100ab6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
80100abc:	e8 2f 2d 00 00       	call   801037f0 <myproc>
80100ac1:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)

  begin_op();
80100ac7:	e8 f4 22 00 00       	call   80102dc0 <begin_op>

  if((ip = namei(path)) == 0){
80100acc:	83 ec 0c             	sub    $0xc,%esp
80100acf:	ff 75 08             	push   0x8(%ebp)
80100ad2:	e8 29 16 00 00       	call   80102100 <namei>
80100ad7:	83 c4 10             	add    $0x10,%esp
80100ada:	85 c0                	test   %eax,%eax
80100adc:	0f 84 31 03 00 00    	je     80100e13 <exec+0x363>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100ae2:	83 ec 0c             	sub    $0xc,%esp
80100ae5:	89 c7                	mov    %eax,%edi
80100ae7:	50                   	push   %eax
80100ae8:	e8 03 0d 00 00       	call   801017f0 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100aed:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100af3:	6a 34                	push   $0x34
80100af5:	6a 00                	push   $0x0
80100af7:	50                   	push   %eax
80100af8:	57                   	push   %edi
80100af9:	e8 12 10 00 00       	call   80101b10 <readi>
80100afe:	83 c4 20             	add    $0x20,%esp
80100b01:	83 f8 34             	cmp    $0x34,%eax
80100b04:	0f 85 01 01 00 00    	jne    80100c0b <exec+0x15b>
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100b0a:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100b11:	45 4c 46 
80100b14:	0f 85 f1 00 00 00    	jne    80100c0b <exec+0x15b>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100b1a:	e8 e1 64 00 00       	call   80107000 <setupkvm>
80100b1f:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100b25:	85 c0                	test   %eax,%eax
80100b27:	0f 84 de 00 00 00    	je     80100c0b <exec+0x15b>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b2d:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100b34:	00 
80100b35:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100b3b:	0f 84 a2 02 00 00    	je     80100de3 <exec+0x333>
  sz = 0;
80100b41:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100b48:	00 00 00 
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b4b:	31 db                	xor    %ebx,%ebx
80100b4d:	e9 8c 00 00 00       	jmp    80100bde <exec+0x12e>
80100b52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100b58:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100b5f:	75 6c                	jne    80100bcd <exec+0x11d>
      continue;
    if(ph.memsz < ph.filesz)
80100b61:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100b67:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b6d:	0f 82 87 00 00 00    	jb     80100bfa <exec+0x14a>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100b73:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b79:	72 7f                	jb     80100bfa <exec+0x14a>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100b7b:	83 ec 04             	sub    $0x4,%esp
80100b7e:	50                   	push   %eax
80100b7f:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
80100b85:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100b8b:	e8 a0 62 00 00       	call   80106e30 <allocuvm>
80100b90:	83 c4 10             	add    $0x10,%esp
80100b93:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b99:	85 c0                	test   %eax,%eax
80100b9b:	74 5d                	je     80100bfa <exec+0x14a>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100b9d:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100ba3:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100ba8:	75 50                	jne    80100bfa <exec+0x14a>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100baa:	83 ec 0c             	sub    $0xc,%esp
80100bad:	ff b5 14 ff ff ff    	push   -0xec(%ebp)
80100bb3:	ff b5 08 ff ff ff    	push   -0xf8(%ebp)
80100bb9:	57                   	push   %edi
80100bba:	50                   	push   %eax
80100bbb:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100bc1:	e8 9a 61 00 00       	call   80106d60 <loaduvm>
80100bc6:	83 c4 20             	add    $0x20,%esp
80100bc9:	85 c0                	test   %eax,%eax
80100bcb:	78 2d                	js     80100bfa <exec+0x14a>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100bcd:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100bd4:	83 c3 01             	add    $0x1,%ebx
80100bd7:	83 c6 20             	add    $0x20,%esi
80100bda:	39 d8                	cmp    %ebx,%eax
80100bdc:	7e 52                	jle    80100c30 <exec+0x180>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100bde:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100be4:	6a 20                	push   $0x20
80100be6:	56                   	push   %esi
80100be7:	50                   	push   %eax
80100be8:	57                   	push   %edi
80100be9:	e8 22 0f 00 00       	call   80101b10 <readi>
80100bee:	83 c4 10             	add    $0x10,%esp
80100bf1:	83 f8 20             	cmp    $0x20,%eax
80100bf4:	0f 84 5e ff ff ff    	je     80100b58 <exec+0xa8>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100bfa:	83 ec 0c             	sub    $0xc,%esp
80100bfd:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100c03:	e8 78 63 00 00       	call   80106f80 <freevm>
  if(ip){
80100c08:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
80100c0b:	83 ec 0c             	sub    $0xc,%esp
80100c0e:	57                   	push   %edi
80100c0f:	e8 7c 0e 00 00       	call   80101a90 <iunlockput>
    end_op();
80100c14:	e8 17 22 00 00       	call   80102e30 <end_op>
80100c19:	83 c4 10             	add    $0x10,%esp
    return -1;
80100c1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return -1;
}
80100c21:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100c24:	5b                   	pop    %ebx
80100c25:	5e                   	pop    %esi
80100c26:	5f                   	pop    %edi
80100c27:	5d                   	pop    %ebp
80100c28:	c3                   	ret
80100c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  sz = PGROUNDUP(sz);
80100c30:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c36:	81 c6 ff 0f 00 00    	add    $0xfff,%esi
80100c3c:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100c42:	8d 9e 00 20 00 00    	lea    0x2000(%esi),%ebx
  iunlockput(ip);
80100c48:	83 ec 0c             	sub    $0xc,%esp
80100c4b:	57                   	push   %edi
80100c4c:	e8 3f 0e 00 00       	call   80101a90 <iunlockput>
  end_op();
80100c51:	e8 da 21 00 00       	call   80102e30 <end_op>
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100c56:	83 c4 0c             	add    $0xc,%esp
80100c59:	53                   	push   %ebx
80100c5a:	56                   	push   %esi
80100c5b:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100c61:	56                   	push   %esi
80100c62:	e8 c9 61 00 00       	call   80106e30 <allocuvm>
80100c67:	83 c4 10             	add    $0x10,%esp
80100c6a:	89 c7                	mov    %eax,%edi
80100c6c:	85 c0                	test   %eax,%eax
80100c6e:	0f 84 86 00 00 00    	je     80100cfa <exec+0x24a>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c74:	83 ec 08             	sub    $0x8,%esp
80100c77:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
  sp = sz;
80100c7d:	89 fb                	mov    %edi,%ebx
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c7f:	50                   	push   %eax
80100c80:	56                   	push   %esi
  for(argc = 0; argv[argc]; argc++) {
80100c81:	31 f6                	xor    %esi,%esi
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100c83:	e8 18 64 00 00       	call   801070a0 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100c88:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c8b:	83 c4 10             	add    $0x10,%esp
80100c8e:	8b 10                	mov    (%eax),%edx
80100c90:	85 d2                	test   %edx,%edx
80100c92:	0f 84 57 01 00 00    	je     80100def <exec+0x33f>
80100c98:	89 bd f0 fe ff ff    	mov    %edi,-0x110(%ebp)
80100c9e:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100ca1:	eb 23                	jmp    80100cc6 <exec+0x216>
80100ca3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80100ca8:	8d 46 01             	lea    0x1(%esi),%eax
    ustack[3+argc] = sp;
80100cab:	89 9c b5 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%esi,4)
80100cb2:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
  for(argc = 0; argv[argc]; argc++) {
80100cb8:	8b 14 87             	mov    (%edi,%eax,4),%edx
80100cbb:	85 d2                	test   %edx,%edx
80100cbd:	74 51                	je     80100d10 <exec+0x260>
    if(argc >= MAXARG)
80100cbf:	83 f8 20             	cmp    $0x20,%eax
80100cc2:	74 36                	je     80100cfa <exec+0x24a>
80100cc4:	89 c6                	mov    %eax,%esi
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100cc6:	83 ec 0c             	sub    $0xc,%esp
80100cc9:	52                   	push   %edx
80100cca:	e8 11 4d 00 00       	call   801059e0 <strlen>
80100ccf:	29 c3                	sub    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100cd1:	58                   	pop    %eax
80100cd2:	ff 34 b7             	push   (%edi,%esi,4)
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100cd5:	83 eb 01             	sub    $0x1,%ebx
80100cd8:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100cdb:	e8 00 4d 00 00       	call   801059e0 <strlen>
80100ce0:	83 c0 01             	add    $0x1,%eax
80100ce3:	50                   	push   %eax
80100ce4:	ff 34 b7             	push   (%edi,%esi,4)
80100ce7:	53                   	push   %ebx
80100ce8:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100cee:	e8 7d 65 00 00       	call   80107270 <copyout>
80100cf3:	83 c4 20             	add    $0x20,%esp
80100cf6:	85 c0                	test   %eax,%eax
80100cf8:	79 ae                	jns    80100ca8 <exec+0x1f8>
    freevm(pgdir);
80100cfa:	83 ec 0c             	sub    $0xc,%esp
80100cfd:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100d03:	e8 78 62 00 00       	call   80106f80 <freevm>
80100d08:	83 c4 10             	add    $0x10,%esp
80100d0b:	e9 0c ff ff ff       	jmp    80100c1c <exec+0x16c>
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100d10:	8d 14 b5 08 00 00 00 	lea    0x8(,%esi,4),%edx
  ustack[3+argc] = 0;
80100d17:	8b bd f0 fe ff ff    	mov    -0x110(%ebp),%edi
80100d1d:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100d23:	8d 46 04             	lea    0x4(%esi),%eax
  sp -= (3+argc+1) * 4;
80100d26:	8d 72 0c             	lea    0xc(%edx),%esi
  ustack[3+argc] = 0;
80100d29:	c7 84 85 58 ff ff ff 	movl   $0x0,-0xa8(%ebp,%eax,4)
80100d30:	00 00 00 00 
  ustack[1] = argc;
80100d34:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
  ustack[0] = 0xffffffff;  // fake return PC
80100d3a:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100d41:	ff ff ff 
  ustack[1] = argc;
80100d44:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100d4a:	89 d8                	mov    %ebx,%eax
  sp -= (3+argc+1) * 4;
80100d4c:	29 f3                	sub    %esi,%ebx
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100d4e:	29 d0                	sub    %edx,%eax
80100d50:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100d56:	56                   	push   %esi
80100d57:	51                   	push   %ecx
80100d58:	53                   	push   %ebx
80100d59:	ff b5 f4 fe ff ff    	push   -0x10c(%ebp)
80100d5f:	e8 0c 65 00 00       	call   80107270 <copyout>
80100d64:	83 c4 10             	add    $0x10,%esp
80100d67:	85 c0                	test   %eax,%eax
80100d69:	78 8f                	js     80100cfa <exec+0x24a>
  for(last=s=path; *s; s++)
80100d6b:	8b 45 08             	mov    0x8(%ebp),%eax
80100d6e:	8b 55 08             	mov    0x8(%ebp),%edx
80100d71:	0f b6 00             	movzbl (%eax),%eax
80100d74:	84 c0                	test   %al,%al
80100d76:	74 17                	je     80100d8f <exec+0x2df>
80100d78:	89 d1                	mov    %edx,%ecx
80100d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      last = s+1;
80100d80:	83 c1 01             	add    $0x1,%ecx
80100d83:	3c 2f                	cmp    $0x2f,%al
  for(last=s=path; *s; s++)
80100d85:	0f b6 01             	movzbl (%ecx),%eax
      last = s+1;
80100d88:	0f 44 d1             	cmove  %ecx,%edx
  for(last=s=path; *s; s++)
80100d8b:	84 c0                	test   %al,%al
80100d8d:	75 f1                	jne    80100d80 <exec+0x2d0>
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100d8f:	83 ec 04             	sub    $0x4,%esp
80100d92:	6a 10                	push   $0x10
80100d94:	52                   	push   %edx
80100d95:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100d9b:	8d 46 78             	lea    0x78(%esi),%eax
80100d9e:	50                   	push   %eax
80100d9f:	e8 fc 4b 00 00       	call   801059a0 <safestrcpy>
  curproc->pgdir = pgdir;
80100da4:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
  oldpgdir = curproc->pgdir;
80100daa:	89 f0                	mov    %esi,%eax
80100dac:	8b 76 10             	mov    0x10(%esi),%esi
  curproc->sz = sz;
80100daf:	89 78 0c             	mov    %edi,0xc(%eax)
  curproc->pgdir = pgdir;
80100db2:	89 48 10             	mov    %ecx,0x10(%eax)
  curproc->tf->eip = elf.entry;  // main
80100db5:	89 c1                	mov    %eax,%ecx
80100db7:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100dbd:	8b 40 24             	mov    0x24(%eax),%eax
80100dc0:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100dc3:	8b 41 24             	mov    0x24(%ecx),%eax
80100dc6:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100dc9:	89 0c 24             	mov    %ecx,(%esp)
80100dcc:	e8 ff 5d 00 00       	call   80106bd0 <switchuvm>
  freevm(oldpgdir);
80100dd1:	89 34 24             	mov    %esi,(%esp)
80100dd4:	e8 a7 61 00 00       	call   80106f80 <freevm>
  return 0;
80100dd9:	83 c4 10             	add    $0x10,%esp
80100ddc:	31 c0                	xor    %eax,%eax
80100dde:	e9 3e fe ff ff       	jmp    80100c21 <exec+0x171>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100de3:	bb 00 20 00 00       	mov    $0x2000,%ebx
80100de8:	31 f6                	xor    %esi,%esi
80100dea:	e9 59 fe ff ff       	jmp    80100c48 <exec+0x198>
  for(argc = 0; argv[argc]; argc++) {
80100def:	be 10 00 00 00       	mov    $0x10,%esi
80100df4:	ba 04 00 00 00       	mov    $0x4,%edx
80100df9:	b8 03 00 00 00       	mov    $0x3,%eax
80100dfe:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100e05:	00 00 00 
80100e08:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
80100e0e:	e9 16 ff ff ff       	jmp    80100d29 <exec+0x279>
    end_op();
80100e13:	e8 18 20 00 00       	call   80102e30 <end_op>
    cprintf("exec: fail\n");
80100e18:	83 ec 0c             	sub    $0xc,%esp
80100e1b:	68 d0 74 10 80       	push   $0x801074d0
80100e20:	e8 8b f8 ff ff       	call   801006b0 <cprintf>
    return -1;
80100e25:	83 c4 10             	add    $0x10,%esp
80100e28:	e9 ef fd ff ff       	jmp    80100c1c <exec+0x16c>
80100e2d:	66 90                	xchg   %ax,%ax
80100e2f:	90                   	nop

80100e30 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100e36:	68 dc 74 10 80       	push   $0x801074dc
80100e3b:	68 00 39 11 80       	push   $0x80113900
80100e40:	e8 bb 46 00 00       	call   80105500 <initlock>
}
80100e45:	83 c4 10             	add    $0x10,%esp
80100e48:	c9                   	leave
80100e49:	c3                   	ret
80100e4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100e50 <filealloc>:

// Allocate a file structure.
struct file*filealloc(void)
{
80100e50:	55                   	push   %ebp
80100e51:	89 e5                	mov    %esp,%ebp
80100e53:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100e54:	bb 34 39 11 80       	mov    $0x80113934,%ebx
{
80100e59:	83 ec 10             	sub    $0x10,%esp
  acquire(&ftable.lock);
80100e5c:	68 00 39 11 80       	push   $0x80113900
80100e61:	e8 8a 48 00 00       	call   801056f0 <acquire>
80100e66:	83 c4 10             	add    $0x10,%esp
80100e69:	eb 10                	jmp    80100e7b <filealloc+0x2b>
80100e6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100e70:	83 c3 18             	add    $0x18,%ebx
80100e73:	81 fb 94 42 11 80    	cmp    $0x80114294,%ebx
80100e79:	74 25                	je     80100ea0 <filealloc+0x50>
    if(f->ref == 0){
80100e7b:	8b 43 04             	mov    0x4(%ebx),%eax
80100e7e:	85 c0                	test   %eax,%eax
80100e80:	75 ee                	jne    80100e70 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100e82:	83 ec 0c             	sub    $0xc,%esp
      f->ref = 1;
80100e85:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100e8c:	68 00 39 11 80       	push   $0x80113900
80100e91:	e8 fa 47 00 00       	call   80105690 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100e96:	89 d8                	mov    %ebx,%eax
      return f;
80100e98:	83 c4 10             	add    $0x10,%esp
}
80100e9b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e9e:	c9                   	leave
80100e9f:	c3                   	ret
  release(&ftable.lock);
80100ea0:	83 ec 0c             	sub    $0xc,%esp
  return 0;
80100ea3:	31 db                	xor    %ebx,%ebx
  release(&ftable.lock);
80100ea5:	68 00 39 11 80       	push   $0x80113900
80100eaa:	e8 e1 47 00 00       	call   80105690 <release>
}
80100eaf:	89 d8                	mov    %ebx,%eax
  return 0;
80100eb1:	83 c4 10             	add    $0x10,%esp
}
80100eb4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100eb7:	c9                   	leave
80100eb8:	c3                   	ret
80100eb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100ec0 <filedup>:

// Increment ref count for file f.
struct file* filedup(struct file *f)
{
80100ec0:	55                   	push   %ebp
80100ec1:	89 e5                	mov    %esp,%ebp
80100ec3:	53                   	push   %ebx
80100ec4:	83 ec 10             	sub    $0x10,%esp
80100ec7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100eca:	68 00 39 11 80       	push   $0x80113900
80100ecf:	e8 1c 48 00 00       	call   801056f0 <acquire>
  if(f->ref < 1)
80100ed4:	8b 43 04             	mov    0x4(%ebx),%eax
80100ed7:	83 c4 10             	add    $0x10,%esp
80100eda:	85 c0                	test   %eax,%eax
80100edc:	7e 1a                	jle    80100ef8 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100ede:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100ee1:	83 ec 0c             	sub    $0xc,%esp
  f->ref++;
80100ee4:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100ee7:	68 00 39 11 80       	push   $0x80113900
80100eec:	e8 9f 47 00 00       	call   80105690 <release>
  return f;
}
80100ef1:	89 d8                	mov    %ebx,%eax
80100ef3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100ef6:	c9                   	leave
80100ef7:	c3                   	ret
    panic("filedup");
80100ef8:	83 ec 0c             	sub    $0xc,%esp
80100efb:	68 e3 74 10 80       	push   $0x801074e3
80100f00:	e8 7b f4 ff ff       	call   80100380 <panic>
80100f05:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80100f0c:	00 
80100f0d:	8d 76 00             	lea    0x0(%esi),%esi

80100f10 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100f10:	55                   	push   %ebp
80100f11:	89 e5                	mov    %esp,%ebp
80100f13:	57                   	push   %edi
80100f14:	56                   	push   %esi
80100f15:	53                   	push   %ebx
80100f16:	83 ec 28             	sub    $0x28,%esp
80100f19:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct file ff;

  acquire(&ftable.lock);
80100f1c:	68 00 39 11 80       	push   $0x80113900
80100f21:	e8 ca 47 00 00       	call   801056f0 <acquire>
  if(f->ref < 1)
80100f26:	8b 53 04             	mov    0x4(%ebx),%edx
80100f29:	83 c4 10             	add    $0x10,%esp
80100f2c:	85 d2                	test   %edx,%edx
80100f2e:	0f 8e a5 00 00 00    	jle    80100fd9 <fileclose+0xc9>
    panic("fileclose");
  if(--f->ref > 0){
80100f34:	83 ea 01             	sub    $0x1,%edx
80100f37:	89 53 04             	mov    %edx,0x4(%ebx)
80100f3a:	75 44                	jne    80100f80 <fileclose+0x70>
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100f3c:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100f40:	83 ec 0c             	sub    $0xc,%esp
  ff = *f;
80100f43:	8b 3b                	mov    (%ebx),%edi
  f->type = FD_NONE;
80100f45:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  ff = *f;
80100f4b:	8b 73 0c             	mov    0xc(%ebx),%esi
80100f4e:	88 45 e7             	mov    %al,-0x19(%ebp)
80100f51:	8b 43 10             	mov    0x10(%ebx),%eax
80100f54:	89 45 e0             	mov    %eax,-0x20(%ebp)
  release(&ftable.lock);
80100f57:	68 00 39 11 80       	push   $0x80113900
80100f5c:	e8 2f 47 00 00       	call   80105690 <release>

  if(ff.type == FD_PIPE)
80100f61:	83 c4 10             	add    $0x10,%esp
80100f64:	83 ff 01             	cmp    $0x1,%edi
80100f67:	74 57                	je     80100fc0 <fileclose+0xb0>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100f69:	83 ff 02             	cmp    $0x2,%edi
80100f6c:	74 2a                	je     80100f98 <fileclose+0x88>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100f6e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f71:	5b                   	pop    %ebx
80100f72:	5e                   	pop    %esi
80100f73:	5f                   	pop    %edi
80100f74:	5d                   	pop    %ebp
80100f75:	c3                   	ret
80100f76:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80100f7d:	00 
80100f7e:	66 90                	xchg   %ax,%ax
    release(&ftable.lock);
80100f80:	c7 45 08 00 39 11 80 	movl   $0x80113900,0x8(%ebp)
}
80100f87:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f8a:	5b                   	pop    %ebx
80100f8b:	5e                   	pop    %esi
80100f8c:	5f                   	pop    %edi
80100f8d:	5d                   	pop    %ebp
    release(&ftable.lock);
80100f8e:	e9 fd 46 00 00       	jmp    80105690 <release>
80100f93:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    begin_op();
80100f98:	e8 23 1e 00 00       	call   80102dc0 <begin_op>
    iput(ff.ip);
80100f9d:	83 ec 0c             	sub    $0xc,%esp
80100fa0:	ff 75 e0             	push   -0x20(%ebp)
80100fa3:	e8 88 09 00 00       	call   80101930 <iput>
    end_op();
80100fa8:	83 c4 10             	add    $0x10,%esp
}
80100fab:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fae:	5b                   	pop    %ebx
80100faf:	5e                   	pop    %esi
80100fb0:	5f                   	pop    %edi
80100fb1:	5d                   	pop    %ebp
    end_op();
80100fb2:	e9 79 1e 00 00       	jmp    80102e30 <end_op>
80100fb7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80100fbe:	00 
80100fbf:	90                   	nop
    pipeclose(ff.pipe, ff.writable);
80100fc0:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100fc4:	83 ec 08             	sub    $0x8,%esp
80100fc7:	53                   	push   %ebx
80100fc8:	56                   	push   %esi
80100fc9:	e8 52 23 00 00       	call   80103320 <pipeclose>
80100fce:	83 c4 10             	add    $0x10,%esp
}
80100fd1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fd4:	5b                   	pop    %ebx
80100fd5:	5e                   	pop    %esi
80100fd6:	5f                   	pop    %edi
80100fd7:	5d                   	pop    %ebp
80100fd8:	c3                   	ret
    panic("fileclose");
80100fd9:	83 ec 0c             	sub    $0xc,%esp
80100fdc:	68 eb 74 10 80       	push   $0x801074eb
80100fe1:	e8 9a f3 ff ff       	call   80100380 <panic>
80100fe6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80100fed:	00 
80100fee:	66 90                	xchg   %ax,%ax

80100ff0 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100ff0:	55                   	push   %ebp
80100ff1:	89 e5                	mov    %esp,%ebp
80100ff3:	53                   	push   %ebx
80100ff4:	83 ec 04             	sub    $0x4,%esp
80100ff7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100ffa:	83 3b 02             	cmpl   $0x2,(%ebx)
80100ffd:	75 31                	jne    80101030 <filestat+0x40>
    ilock(f->ip);
80100fff:	83 ec 0c             	sub    $0xc,%esp
80101002:	ff 73 10             	push   0x10(%ebx)
80101005:	e8 e6 07 00 00       	call   801017f0 <ilock>
    stati(f->ip, st);
8010100a:	58                   	pop    %eax
8010100b:	5a                   	pop    %edx
8010100c:	ff 75 0c             	push   0xc(%ebp)
8010100f:	ff 73 10             	push   0x10(%ebx)
80101012:	e8 c9 0a 00 00       	call   80101ae0 <stati>
    iunlock(f->ip);
80101017:	59                   	pop    %ecx
80101018:	ff 73 10             	push   0x10(%ebx)
8010101b:	e8 c0 08 00 00       	call   801018e0 <iunlock>
    return 0;
  }
  return -1;
}
80101020:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
80101023:	83 c4 10             	add    $0x10,%esp
80101026:	31 c0                	xor    %eax,%eax
}
80101028:	c9                   	leave
80101029:	c3                   	ret
8010102a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101030:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return -1;
80101033:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80101038:	c9                   	leave
80101039:	c3                   	ret
8010103a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101040 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80101040:	55                   	push   %ebp
80101041:	89 e5                	mov    %esp,%ebp
80101043:	57                   	push   %edi
80101044:	56                   	push   %esi
80101045:	53                   	push   %ebx
80101046:	83 ec 0c             	sub    $0xc,%esp
80101049:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010104c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010104f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80101052:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80101056:	74 60                	je     801010b8 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80101058:	8b 03                	mov    (%ebx),%eax
8010105a:	83 f8 01             	cmp    $0x1,%eax
8010105d:	74 41                	je     801010a0 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010105f:	83 f8 02             	cmp    $0x2,%eax
80101062:	75 5b                	jne    801010bf <fileread+0x7f>
    ilock(f->ip);
80101064:	83 ec 0c             	sub    $0xc,%esp
80101067:	ff 73 10             	push   0x10(%ebx)
8010106a:	e8 81 07 00 00       	call   801017f0 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
8010106f:	57                   	push   %edi
80101070:	ff 73 14             	push   0x14(%ebx)
80101073:	56                   	push   %esi
80101074:	ff 73 10             	push   0x10(%ebx)
80101077:	e8 94 0a 00 00       	call   80101b10 <readi>
8010107c:	83 c4 20             	add    $0x20,%esp
8010107f:	89 c6                	mov    %eax,%esi
80101081:	85 c0                	test   %eax,%eax
80101083:	7e 03                	jle    80101088 <fileread+0x48>
      f->off += r;
80101085:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80101088:	83 ec 0c             	sub    $0xc,%esp
8010108b:	ff 73 10             	push   0x10(%ebx)
8010108e:	e8 4d 08 00 00       	call   801018e0 <iunlock>
    return r;
80101093:	83 c4 10             	add    $0x10,%esp
  }
  panic("fileread");
}
80101096:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101099:	89 f0                	mov    %esi,%eax
8010109b:	5b                   	pop    %ebx
8010109c:	5e                   	pop    %esi
8010109d:	5f                   	pop    %edi
8010109e:	5d                   	pop    %ebp
8010109f:	c3                   	ret
    return piperead(f->pipe, addr, n);
801010a0:	8b 43 0c             	mov    0xc(%ebx),%eax
801010a3:	89 45 08             	mov    %eax,0x8(%ebp)
}
801010a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010a9:	5b                   	pop    %ebx
801010aa:	5e                   	pop    %esi
801010ab:	5f                   	pop    %edi
801010ac:	5d                   	pop    %ebp
    return piperead(f->pipe, addr, n);
801010ad:	e9 2e 24 00 00       	jmp    801034e0 <piperead>
801010b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
801010b8:	be ff ff ff ff       	mov    $0xffffffff,%esi
801010bd:	eb d7                	jmp    80101096 <fileread+0x56>
  panic("fileread");
801010bf:	83 ec 0c             	sub    $0xc,%esp
801010c2:	68 f5 74 10 80       	push   $0x801074f5
801010c7:	e8 b4 f2 ff ff       	call   80100380 <panic>
801010cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801010d0 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
801010d0:	55                   	push   %ebp
801010d1:	89 e5                	mov    %esp,%ebp
801010d3:	57                   	push   %edi
801010d4:	56                   	push   %esi
801010d5:	53                   	push   %ebx
801010d6:	83 ec 1c             	sub    $0x1c,%esp
801010d9:	8b 45 0c             	mov    0xc(%ebp),%eax
801010dc:	8b 5d 08             	mov    0x8(%ebp),%ebx
801010df:	89 45 dc             	mov    %eax,-0x24(%ebp)
801010e2:	8b 45 10             	mov    0x10(%ebp),%eax
  int r;

  if(f->writable == 0)
801010e5:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)
{
801010e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(f->writable == 0)
801010ec:	0f 84 bb 00 00 00    	je     801011ad <filewrite+0xdd>
    return -1;
  if(f->type == FD_PIPE)
801010f2:	8b 03                	mov    (%ebx),%eax
801010f4:	83 f8 01             	cmp    $0x1,%eax
801010f7:	0f 84 bf 00 00 00    	je     801011bc <filewrite+0xec>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
801010fd:	83 f8 02             	cmp    $0x2,%eax
80101100:	0f 85 c8 00 00 00    	jne    801011ce <filewrite+0xfe>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101106:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    int i = 0;
80101109:	31 f6                	xor    %esi,%esi
    while(i < n){
8010110b:	85 c0                	test   %eax,%eax
8010110d:	7f 30                	jg     8010113f <filewrite+0x6f>
8010110f:	e9 94 00 00 00       	jmp    801011a8 <filewrite+0xd8>
80101114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101118:	01 43 14             	add    %eax,0x14(%ebx)
      iunlock(f->ip);
8010111b:	83 ec 0c             	sub    $0xc,%esp
        f->off += r;
8010111e:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101121:	ff 73 10             	push   0x10(%ebx)
80101124:	e8 b7 07 00 00       	call   801018e0 <iunlock>
      end_op();
80101129:	e8 02 1d 00 00       	call   80102e30 <end_op>

      if(r < 0)
        break;
      if(r != n1)
8010112e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101131:	83 c4 10             	add    $0x10,%esp
80101134:	39 c7                	cmp    %eax,%edi
80101136:	75 5c                	jne    80101194 <filewrite+0xc4>
        panic("short filewrite");
      i += r;
80101138:	01 fe                	add    %edi,%esi
    while(i < n){
8010113a:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
8010113d:	7e 69                	jle    801011a8 <filewrite+0xd8>
      int n1 = n - i;
8010113f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
      if(n1 > max)
80101142:	b8 00 06 00 00       	mov    $0x600,%eax
      int n1 = n - i;
80101147:	29 f7                	sub    %esi,%edi
      if(n1 > max)
80101149:	39 c7                	cmp    %eax,%edi
8010114b:	0f 4f f8             	cmovg  %eax,%edi
      begin_op();
8010114e:	e8 6d 1c 00 00       	call   80102dc0 <begin_op>
      ilock(f->ip);
80101153:	83 ec 0c             	sub    $0xc,%esp
80101156:	ff 73 10             	push   0x10(%ebx)
80101159:	e8 92 06 00 00       	call   801017f0 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
8010115e:	57                   	push   %edi
8010115f:	ff 73 14             	push   0x14(%ebx)
80101162:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101165:	01 f0                	add    %esi,%eax
80101167:	50                   	push   %eax
80101168:	ff 73 10             	push   0x10(%ebx)
8010116b:	e8 b0 0a 00 00       	call   80101c20 <writei>
80101170:	83 c4 20             	add    $0x20,%esp
80101173:	85 c0                	test   %eax,%eax
80101175:	7f a1                	jg     80101118 <filewrite+0x48>
80101177:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
8010117a:	83 ec 0c             	sub    $0xc,%esp
8010117d:	ff 73 10             	push   0x10(%ebx)
80101180:	e8 5b 07 00 00       	call   801018e0 <iunlock>
      end_op();
80101185:	e8 a6 1c 00 00       	call   80102e30 <end_op>
      if(r < 0)
8010118a:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010118d:	83 c4 10             	add    $0x10,%esp
80101190:	85 c0                	test   %eax,%eax
80101192:	75 14                	jne    801011a8 <filewrite+0xd8>
        panic("short filewrite");
80101194:	83 ec 0c             	sub    $0xc,%esp
80101197:	68 fe 74 10 80       	push   $0x801074fe
8010119c:	e8 df f1 ff ff       	call   80100380 <panic>
801011a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
    return i == n ? n : -1;
801011a8:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
801011ab:	74 05                	je     801011b2 <filewrite+0xe2>
801011ad:	be ff ff ff ff       	mov    $0xffffffff,%esi
  }
  panic("filewrite");
}
801011b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011b5:	89 f0                	mov    %esi,%eax
801011b7:	5b                   	pop    %ebx
801011b8:	5e                   	pop    %esi
801011b9:	5f                   	pop    %edi
801011ba:	5d                   	pop    %ebp
801011bb:	c3                   	ret
    return pipewrite(f->pipe, addr, n);
801011bc:	8b 43 0c             	mov    0xc(%ebx),%eax
801011bf:	89 45 08             	mov    %eax,0x8(%ebp)
}
801011c2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011c5:	5b                   	pop    %ebx
801011c6:	5e                   	pop    %esi
801011c7:	5f                   	pop    %edi
801011c8:	5d                   	pop    %ebp
    return pipewrite(f->pipe, addr, n);
801011c9:	e9 f2 21 00 00       	jmp    801033c0 <pipewrite>
  panic("filewrite");
801011ce:	83 ec 0c             	sub    $0xc,%esp
801011d1:	68 04 75 10 80       	push   $0x80107504
801011d6:	e8 a5 f1 ff ff       	call   80100380 <panic>
801011db:	66 90                	xchg   %ax,%ax
801011dd:	66 90                	xchg   %ax,%ax
801011df:	90                   	nop

801011e0 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
801011e0:	55                   	push   %ebp
801011e1:	89 e5                	mov    %esp,%ebp
801011e3:	57                   	push   %edi
801011e4:	56                   	push   %esi
801011e5:	53                   	push   %ebx
801011e6:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801011e9:	8b 0d b4 68 11 80    	mov    0x801168b4,%ecx
{
801011ef:	89 45 dc             	mov    %eax,-0x24(%ebp)
  for(b = 0; b < sb.size; b += BPB){
801011f2:	85 c9                	test   %ecx,%ecx
801011f4:	0f 84 94 00 00 00    	je     8010128e <balloc+0xae>
801011fa:	31 ff                	xor    %edi,%edi
    bp = bread(dev, BBLOCK(b, sb));
801011fc:	89 fa                	mov    %edi,%edx
801011fe:	b8 0e 75 50 07       	mov    $0x750750e,%eax
80101203:	83 ec 08             	sub    $0x8,%esp
80101206:	89 fe                	mov    %edi,%esi
80101208:	c1 ea 08             	shr    $0x8,%edx
8010120b:	f7 e2                	mul    %edx
8010120d:	03 15 cc 68 11 80    	add    0x801168cc,%edx
80101213:	52                   	push   %edx
80101214:	ff 75 dc             	push   -0x24(%ebp)
80101217:	e8 b4 ee ff ff       	call   801000d0 <bread>
8010121c:	89 7d d8             	mov    %edi,-0x28(%ebp)
8010121f:	83 c4 10             	add    $0x10,%esp
80101222:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101225:	a1 b4 68 11 80       	mov    0x801168b4,%eax
8010122a:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010122d:	31 c0                	xor    %eax,%eax
8010122f:	eb 33                	jmp    80101264 <balloc+0x84>
80101231:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      m = 1 << (bi % 8);
80101238:	89 c1                	mov    %eax,%ecx
8010123a:	bb 01 00 00 00       	mov    $0x1,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010123f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      m = 1 << (bi % 8);
80101242:	83 e1 07             	and    $0x7,%ecx
80101245:	d3 e3                	shl    %cl,%ebx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101247:	89 c1                	mov    %eax,%ecx
80101249:	c1 f9 03             	sar    $0x3,%ecx
8010124c:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101251:	89 fa                	mov    %edi,%edx
80101253:	85 df                	test   %ebx,%edi
80101255:	74 49                	je     801012a0 <balloc+0xc0>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101257:	83 c0 01             	add    $0x1,%eax
8010125a:	83 c6 01             	add    $0x1,%esi
8010125d:	3d 00 23 00 00       	cmp    $0x2300,%eax
80101262:	74 07                	je     8010126b <balloc+0x8b>
80101264:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101267:	39 fe                	cmp    %edi,%esi
80101269:	72 cd                	jb     80101238 <balloc+0x58>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
8010126b:	8b 7d d8             	mov    -0x28(%ebp),%edi
8010126e:	83 ec 0c             	sub    $0xc,%esp
80101271:	ff 75 e4             	push   -0x1c(%ebp)
  for(b = 0; b < sb.size; b += BPB){
80101274:	81 c7 00 23 00 00    	add    $0x2300,%edi
    brelse(bp);
8010127a:	e8 71 ef ff ff       	call   801001f0 <brelse>
  for(b = 0; b < sb.size; b += BPB){
8010127f:	83 c4 10             	add    $0x10,%esp
80101282:	3b 3d b4 68 11 80    	cmp    0x801168b4,%edi
80101288:	0f 82 6e ff ff ff    	jb     801011fc <balloc+0x1c>
  }
  panic("balloc: out of blocks");
8010128e:	83 ec 0c             	sub    $0xc,%esp
80101291:	68 0e 75 10 80       	push   $0x8010750e
80101296:	e8 e5 f0 ff ff       	call   80100380 <panic>
8010129b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        bp->data[bi/8] |= m;  // Mark block in use.
801012a0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801012a3:	83 ec 0c             	sub    $0xc,%esp
        bp->data[bi/8] |= m;  // Mark block in use.
801012a6:	09 da                	or     %ebx,%edx
801012a8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801012ac:	57                   	push   %edi
801012ad:	e8 ee 1c 00 00       	call   80102fa0 <log_write>
        brelse(bp);
801012b2:	89 3c 24             	mov    %edi,(%esp)
801012b5:	e8 36 ef ff ff       	call   801001f0 <brelse>
  bp = bread(dev, bno);
801012ba:	58                   	pop    %eax
801012bb:	5a                   	pop    %edx
801012bc:	56                   	push   %esi
801012bd:	ff 75 dc             	push   -0x24(%ebp)
801012c0:	e8 0b ee ff ff       	call   801000d0 <bread>
  memset(bp->data, 0, BSIZE);
801012c5:	83 c4 0c             	add    $0xc,%esp
  bp = bread(dev, bno);
801012c8:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801012ca:	8d 40 5c             	lea    0x5c(%eax),%eax
801012cd:	68 60 04 00 00       	push   $0x460
801012d2:	6a 00                	push   $0x0
801012d4:	50                   	push   %eax
801012d5:	e8 16 45 00 00       	call   801057f0 <memset>
  log_write(bp);
801012da:	89 1c 24             	mov    %ebx,(%esp)
801012dd:	e8 be 1c 00 00       	call   80102fa0 <log_write>
  brelse(bp);
801012e2:	89 1c 24             	mov    %ebx,(%esp)
801012e5:	e8 06 ef ff ff       	call   801001f0 <brelse>
}
801012ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ed:	89 f0                	mov    %esi,%eax
801012ef:	5b                   	pop    %ebx
801012f0:	5e                   	pop    %esi
801012f1:	5f                   	pop    %edi
801012f2:	5d                   	pop    %ebp
801012f3:	c3                   	ret
801012f4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801012fb:	00 
801012fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101300 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101300:	55                   	push   %ebp
80101301:	89 e5                	mov    %esp,%ebp
80101303:	57                   	push   %edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101304:	31 ff                	xor    %edi,%edi
{
80101306:	56                   	push   %esi
80101307:	89 c6                	mov    %eax,%esi
80101309:	53                   	push   %ebx
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010130a:	bb 34 43 11 80       	mov    $0x80114334,%ebx
{
8010130f:	83 ec 28             	sub    $0x28,%esp
80101312:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  acquire(&icache.lock);
80101315:	68 00 43 11 80       	push   $0x80114300
8010131a:	e8 d1 43 00 00       	call   801056f0 <acquire>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010131f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  acquire(&icache.lock);
80101322:	83 c4 10             	add    $0x10,%esp
80101325:	eb 1b                	jmp    80101342 <iget+0x42>
80101327:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010132e:	00 
8010132f:	90                   	nop
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101330:	39 33                	cmp    %esi,(%ebx)
80101332:	74 6c                	je     801013a0 <iget+0xa0>
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101334:	81 c3 c0 00 00 00    	add    $0xc0,%ebx
8010133a:	81 fb b4 68 11 80    	cmp    $0x801168b4,%ebx
80101340:	74 26                	je     80101368 <iget+0x68>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101342:	8b 43 08             	mov    0x8(%ebx),%eax
80101345:	85 c0                	test   %eax,%eax
80101347:	7f e7                	jg     80101330 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101349:	85 ff                	test   %edi,%edi
8010134b:	75 e7                	jne    80101334 <iget+0x34>
8010134d:	85 c0                	test   %eax,%eax
8010134f:	75 76                	jne    801013c7 <iget+0xc7>
      empty = ip;
80101351:	89 df                	mov    %ebx,%edi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101353:	81 c3 c0 00 00 00    	add    $0xc0,%ebx
80101359:	81 fb b4 68 11 80    	cmp    $0x801168b4,%ebx
8010135f:	75 e1                	jne    80101342 <iget+0x42>
80101361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }

  // Recycle an inode cache entry.
  if(empty == 0)
80101368:	85 ff                	test   %edi,%edi
8010136a:	74 79                	je     801013e5 <iget+0xe5>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);
8010136c:	83 ec 0c             	sub    $0xc,%esp
  ip->dev = dev;
8010136f:	89 37                	mov    %esi,(%edi)
  ip->inum = inum;
80101371:	89 57 04             	mov    %edx,0x4(%edi)
  ip->ref = 1;
80101374:	c7 47 08 01 00 00 00 	movl   $0x1,0x8(%edi)
  ip->valid = 0;
8010137b:	c7 47 4c 00 00 00 00 	movl   $0x0,0x4c(%edi)
  release(&icache.lock);
80101382:	68 00 43 11 80       	push   $0x80114300
80101387:	e8 04 43 00 00       	call   80105690 <release>

  return ip;
8010138c:	83 c4 10             	add    $0x10,%esp
}
8010138f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101392:	89 f8                	mov    %edi,%eax
80101394:	5b                   	pop    %ebx
80101395:	5e                   	pop    %esi
80101396:	5f                   	pop    %edi
80101397:	5d                   	pop    %ebp
80101398:	c3                   	ret
80101399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
801013a0:	39 53 04             	cmp    %edx,0x4(%ebx)
801013a3:	75 8f                	jne    80101334 <iget+0x34>
      ip->ref++;
801013a5:	83 c0 01             	add    $0x1,%eax
      release(&icache.lock);
801013a8:	83 ec 0c             	sub    $0xc,%esp
      return ip;
801013ab:	89 df                	mov    %ebx,%edi
      ip->ref++;
801013ad:	89 43 08             	mov    %eax,0x8(%ebx)
      release(&icache.lock);
801013b0:	68 00 43 11 80       	push   $0x80114300
801013b5:	e8 d6 42 00 00       	call   80105690 <release>
      return ip;
801013ba:	83 c4 10             	add    $0x10,%esp
}
801013bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013c0:	89 f8                	mov    %edi,%eax
801013c2:	5b                   	pop    %ebx
801013c3:	5e                   	pop    %esi
801013c4:	5f                   	pop    %edi
801013c5:	5d                   	pop    %ebp
801013c6:	c3                   	ret
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801013c7:	81 c3 c0 00 00 00    	add    $0xc0,%ebx
801013cd:	81 fb b4 68 11 80    	cmp    $0x801168b4,%ebx
801013d3:	74 10                	je     801013e5 <iget+0xe5>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
801013d5:	8b 43 08             	mov    0x8(%ebx),%eax
801013d8:	85 c0                	test   %eax,%eax
801013da:	0f 8f 50 ff ff ff    	jg     80101330 <iget+0x30>
801013e0:	e9 68 ff ff ff       	jmp    8010134d <iget+0x4d>
    panic("iget: no inodes");
801013e5:	83 ec 0c             	sub    $0xc,%esp
801013e8:	68 24 75 10 80       	push   $0x80107524
801013ed:	e8 8e ef ff ff       	call   80100380 <panic>
801013f2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801013f9:	00 
801013fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101400 <bfree>:
{
80101400:	55                   	push   %ebp
80101401:	89 e5                	mov    %esp,%ebp
80101403:	57                   	push   %edi
  bp = bread(dev, BBLOCK(b, sb));
80101404:	89 d7                	mov    %edx,%edi
{
80101406:	56                   	push   %esi
  bp = bread(dev, BBLOCK(b, sb));
80101407:	c1 ef 08             	shr    $0x8,%edi
{
8010140a:	89 d6                	mov    %edx,%esi
8010140c:	53                   	push   %ebx
8010140d:	89 c3                	mov    %eax,%ebx
  bp = bread(dev, BBLOCK(b, sb));
8010140f:	b8 0e 75 50 07       	mov    $0x750750e,%eax
80101414:	f7 e7                	mul    %edi
{
80101416:	83 ec 14             	sub    $0x14,%esp
  bp = bread(dev, BBLOCK(b, sb));
80101419:	a1 cc 68 11 80       	mov    0x801168cc,%eax
8010141e:	89 d7                	mov    %edx,%edi
80101420:	01 d0                	add    %edx,%eax
  bi = b % BPB;
80101422:	69 ff 00 23 00 00    	imul   $0x2300,%edi,%edi
  bp = bread(dev, BBLOCK(b, sb));
80101428:	50                   	push   %eax
80101429:	53                   	push   %ebx
8010142a:	e8 a1 ec ff ff       	call   801000d0 <bread>
  bi = b % BPB;
8010142f:	89 f2                	mov    %esi,%edx
  m = 1 << (bi % 8);
80101431:	89 f1                	mov    %esi,%ecx
  if((bp->data[bi/8] & m) == 0)
80101433:	83 c4 10             	add    $0x10,%esp
  bi = b % BPB;
80101436:	29 fa                	sub    %edi,%edx
  bp = bread(dev, BBLOCK(b, sb));
80101438:	89 c3                	mov    %eax,%ebx
  m = 1 << (bi % 8);
8010143a:	83 e1 07             	and    $0x7,%ecx
8010143d:	b8 01 00 00 00       	mov    $0x1,%eax
  if((bp->data[bi/8] & m) == 0)
80101442:	c1 fa 03             	sar    $0x3,%edx
  m = 1 << (bi % 8);
80101445:	d3 e0                	shl    %cl,%eax
  if((bp->data[bi/8] & m) == 0)
80101447:	0f b6 74 13 5c       	movzbl 0x5c(%ebx,%edx,1),%esi
8010144c:	85 c6                	test   %eax,%esi
8010144e:	74 24                	je     80101474 <bfree+0x74>
  bp->data[bi/8] &= ~m;
80101450:	f7 d0                	not    %eax
  log_write(bp);
80101452:	83 ec 0c             	sub    $0xc,%esp
  bp->data[bi/8] &= ~m;
80101455:	21 f0                	and    %esi,%eax
80101457:	88 44 13 5c          	mov    %al,0x5c(%ebx,%edx,1)
  log_write(bp);
8010145b:	53                   	push   %ebx
8010145c:	e8 3f 1b 00 00       	call   80102fa0 <log_write>
  brelse(bp);
80101461:	89 1c 24             	mov    %ebx,(%esp)
80101464:	e8 87 ed ff ff       	call   801001f0 <brelse>
}
80101469:	83 c4 10             	add    $0x10,%esp
8010146c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010146f:	5b                   	pop    %ebx
80101470:	5e                   	pop    %esi
80101471:	5f                   	pop    %edi
80101472:	5d                   	pop    %ebp
80101473:	c3                   	ret
    panic("freeing free block");
80101474:	83 ec 0c             	sub    $0xc,%esp
80101477:	68 34 75 10 80       	push   $0x80107534
8010147c:	e8 ff ee ff ff       	call   80100380 <panic>
80101481:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80101488:	00 
80101489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101490 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
80101490:	55                   	push   %ebp
80101491:	89 e5                	mov    %esp,%ebp
80101493:	57                   	push   %edi
80101494:	56                   	push   %esi
80101495:	89 c6                	mov    %eax,%esi
80101497:	53                   	push   %ebx
80101498:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
8010149b:	83 fa 17             	cmp    $0x17,%edx
8010149e:	0f 86 8c 00 00 00    	jbe    80101530 <bmap+0xa0>
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
801014a4:	8d 5a e8             	lea    -0x18(%edx),%ebx

  if(bn < NINDIRECT){
801014a7:	81 fb 2f 02 00 00    	cmp    $0x22f,%ebx
801014ad:	0f 87 9f 00 00 00    	ja     80101552 <bmap+0xc2>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
801014b3:	8b 80 bc 00 00 00    	mov    0xbc(%eax),%eax
801014b9:	85 c0                	test   %eax,%eax
801014bb:	74 5b                	je     80101518 <bmap+0x88>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
801014bd:	83 ec 08             	sub    $0x8,%esp
801014c0:	50                   	push   %eax
801014c1:	ff 36                	push   (%esi)
801014c3:	e8 08 ec ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
801014c8:	83 c4 10             	add    $0x10,%esp
801014cb:	8d 5c 98 5c          	lea    0x5c(%eax,%ebx,4),%ebx
    bp = bread(ip->dev, addr);
801014cf:	89 c2                	mov    %eax,%edx
    if((addr = a[bn]) == 0){
801014d1:	8b 3b                	mov    (%ebx),%edi
801014d3:	85 ff                	test   %edi,%edi
801014d5:	74 19                	je     801014f0 <bmap+0x60>
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
801014d7:	83 ec 0c             	sub    $0xc,%esp
801014da:	52                   	push   %edx
801014db:	e8 10 ed ff ff       	call   801001f0 <brelse>
801014e0:	83 c4 10             	add    $0x10,%esp
    return addr;
  }

  panic("bmap: out of range");
}
801014e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801014e6:	89 f8                	mov    %edi,%eax
801014e8:	5b                   	pop    %ebx
801014e9:	5e                   	pop    %esi
801014ea:	5f                   	pop    %edi
801014eb:	5d                   	pop    %ebp
801014ec:	c3                   	ret
801014ed:	8d 76 00             	lea    0x0(%esi),%esi
801014f0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      a[bn] = addr = balloc(ip->dev);
801014f3:	8b 06                	mov    (%esi),%eax
801014f5:	e8 e6 fc ff ff       	call   801011e0 <balloc>
      log_write(bp);
801014fa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801014fd:	83 ec 0c             	sub    $0xc,%esp
      a[bn] = addr = balloc(ip->dev);
80101500:	89 03                	mov    %eax,(%ebx)
80101502:	89 c7                	mov    %eax,%edi
      log_write(bp);
80101504:	52                   	push   %edx
80101505:	e8 96 1a 00 00       	call   80102fa0 <log_write>
8010150a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010150d:	83 c4 10             	add    $0x10,%esp
80101510:	eb c5                	jmp    801014d7 <bmap+0x47>
80101512:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101518:	8b 06                	mov    (%esi),%eax
8010151a:	e8 c1 fc ff ff       	call   801011e0 <balloc>
8010151f:	89 86 bc 00 00 00    	mov    %eax,0xbc(%esi)
80101525:	eb 96                	jmp    801014bd <bmap+0x2d>
80101527:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010152e:	00 
8010152f:	90                   	nop
    if((addr = ip->addrs[bn]) == 0)
80101530:	8d 5a 14             	lea    0x14(%edx),%ebx
80101533:	8b 7c 98 0c          	mov    0xc(%eax,%ebx,4),%edi
80101537:	85 ff                	test   %edi,%edi
80101539:	75 a8                	jne    801014e3 <bmap+0x53>
      ip->addrs[bn] = addr = balloc(ip->dev);
8010153b:	8b 00                	mov    (%eax),%eax
8010153d:	e8 9e fc ff ff       	call   801011e0 <balloc>
80101542:	89 44 9e 0c          	mov    %eax,0xc(%esi,%ebx,4)
80101546:	89 c7                	mov    %eax,%edi
}
80101548:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010154b:	5b                   	pop    %ebx
8010154c:	89 f8                	mov    %edi,%eax
8010154e:	5e                   	pop    %esi
8010154f:	5f                   	pop    %edi
80101550:	5d                   	pop    %ebp
80101551:	c3                   	ret
  panic("bmap: out of range");
80101552:	83 ec 0c             	sub    $0xc,%esp
80101555:	68 47 75 10 80       	push   $0x80107547
8010155a:	e8 21 ee ff ff       	call   80100380 <panic>
8010155f:	90                   	nop

80101560 <readsb>:
{
80101560:	55                   	push   %ebp
80101561:	89 e5                	mov    %esp,%ebp
80101563:	56                   	push   %esi
80101564:	53                   	push   %ebx
80101565:	8b 75 0c             	mov    0xc(%ebp),%esi
  bp = bread(dev, 1);
80101568:	83 ec 08             	sub    $0x8,%esp
8010156b:	6a 01                	push   $0x1
8010156d:	ff 75 08             	push   0x8(%ebp)
80101570:	e8 5b eb ff ff       	call   801000d0 <bread>
  memmove(sb, bp->data, sizeof(*sb));
80101575:	83 c4 0c             	add    $0xc,%esp
  bp = bread(dev, 1);
80101578:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
8010157a:	8d 40 5c             	lea    0x5c(%eax),%eax
8010157d:	6a 1c                	push   $0x1c
8010157f:	50                   	push   %eax
80101580:	56                   	push   %esi
80101581:	e8 fa 42 00 00       	call   80105880 <memmove>
  brelse(bp);
80101586:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101589:	83 c4 10             	add    $0x10,%esp
}
8010158c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010158f:	5b                   	pop    %ebx
80101590:	5e                   	pop    %esi
80101591:	5d                   	pop    %ebp
  brelse(bp);
80101592:	e9 59 ec ff ff       	jmp    801001f0 <brelse>
80101597:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010159e:	00 
8010159f:	90                   	nop

801015a0 <iinit>:
{
801015a0:	55                   	push   %ebp
801015a1:	89 e5                	mov    %esp,%ebp
801015a3:	53                   	push   %ebx
801015a4:	bb 40 43 11 80       	mov    $0x80114340,%ebx
801015a9:	83 ec 0c             	sub    $0xc,%esp
  initlock(&icache.lock, "icache");
801015ac:	68 5a 75 10 80       	push   $0x8010755a
801015b1:	68 00 43 11 80       	push   $0x80114300
801015b6:	e8 45 3f 00 00       	call   80105500 <initlock>
  for(i = 0; i < NINODE; i++) {
801015bb:	83 c4 10             	add    $0x10,%esp
801015be:	66 90                	xchg   %ax,%ax
    initsleeplock(&icache.inode[i].lock, "inode");
801015c0:	83 ec 08             	sub    $0x8,%esp
801015c3:	68 61 75 10 80       	push   $0x80107561
801015c8:	53                   	push   %ebx
  for(i = 0; i < NINODE; i++) {
801015c9:	81 c3 c0 00 00 00    	add    $0xc0,%ebx
    initsleeplock(&icache.inode[i].lock, "inode");
801015cf:	e8 fc 3d 00 00       	call   801053d0 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
801015d4:	83 c4 10             	add    $0x10,%esp
801015d7:	81 fb c0 68 11 80    	cmp    $0x801168c0,%ebx
801015dd:	75 e1                	jne    801015c0 <iinit+0x20>
  bp = bread(dev, 1);
801015df:	83 ec 08             	sub    $0x8,%esp
801015e2:	6a 01                	push   $0x1
801015e4:	ff 75 08             	push   0x8(%ebp)
801015e7:	e8 e4 ea ff ff       	call   801000d0 <bread>
  memmove(sb, bp->data, sizeof(*sb));
801015ec:	83 c4 0c             	add    $0xc,%esp
  bp = bread(dev, 1);
801015ef:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801015f1:	8d 40 5c             	lea    0x5c(%eax),%eax
801015f4:	6a 1c                	push   $0x1c
801015f6:	50                   	push   %eax
801015f7:	68 b4 68 11 80       	push   $0x801168b4
801015fc:	e8 7f 42 00 00       	call   80105880 <memmove>
  brelse(bp);
80101601:	89 1c 24             	mov    %ebx,(%esp)
80101604:	e8 e7 eb ff ff       	call   801001f0 <brelse>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
80101609:	ff 35 cc 68 11 80    	push   0x801168cc
8010160f:	ff 35 c8 68 11 80    	push   0x801168c8
80101615:	ff 35 c4 68 11 80    	push   0x801168c4
8010161b:	ff 35 c0 68 11 80    	push   0x801168c0
80101621:	ff 35 bc 68 11 80    	push   0x801168bc
80101627:	ff 35 b8 68 11 80    	push   0x801168b8
8010162d:	ff 35 b4 68 11 80    	push   0x801168b4
80101633:	68 54 79 10 80       	push   $0x80107954
80101638:	e8 73 f0 ff ff       	call   801006b0 <cprintf>
}
8010163d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101640:	83 c4 30             	add    $0x30,%esp
80101643:	c9                   	leave
80101644:	c3                   	ret
80101645:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010164c:	00 
8010164d:	8d 76 00             	lea    0x0(%esi),%esi

80101650 <ialloc>:
{
80101650:	55                   	push   %ebp
80101651:	89 e5                	mov    %esp,%ebp
80101653:	57                   	push   %edi
80101654:	56                   	push   %esi
80101655:	53                   	push   %ebx
80101656:	83 ec 1c             	sub    $0x1c,%esp
80101659:	8b 45 0c             	mov    0xc(%ebp),%eax
  for(inum = 1; inum < sb.ninodes; inum++){
8010165c:	83 3d bc 68 11 80 01 	cmpl   $0x1,0x801168bc
{
80101663:	8b 75 08             	mov    0x8(%ebp),%esi
80101666:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(inum = 1; inum < sb.ninodes; inum++){
80101669:	0f 86 a3 00 00 00    	jbe    80101712 <ialloc+0xc2>
8010166f:	bf 01 00 00 00       	mov    $0x1,%edi
80101674:	eb 21                	jmp    80101697 <ialloc+0x47>
80101676:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010167d:	00 
8010167e:	66 90                	xchg   %ax,%ax
    brelse(bp);
80101680:	83 ec 0c             	sub    $0xc,%esp
  for(inum = 1; inum < sb.ninodes; inum++){
80101683:	83 c7 01             	add    $0x1,%edi
    brelse(bp);
80101686:	52                   	push   %edx
80101687:	e8 64 eb ff ff       	call   801001f0 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
8010168c:	83 c4 10             	add    $0x10,%esp
8010168f:	3b 3d bc 68 11 80    	cmp    0x801168bc,%edi
80101695:	73 7b                	jae    80101712 <ialloc+0xc2>
    bp = bread(dev, IBLOCK(inum, sb));
80101697:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
8010169c:	83 ec 08             	sub    $0x8,%esp
8010169f:	f7 e7                	mul    %edi
801016a1:	a1 c8 68 11 80       	mov    0x801168c8,%eax
801016a6:	89 d3                	mov    %edx,%ebx
801016a8:	c1 eb 03             	shr    $0x3,%ebx
801016ab:	01 d8                	add    %ebx,%eax
801016ad:	50                   	push   %eax
801016ae:	56                   	push   %esi
801016af:	e8 1c ea ff ff       	call   801000d0 <bread>
    dip = (struct dinode*)bp->data + inum%IPB;
801016b4:	8d 0c 9b             	lea    (%ebx,%ebx,4),%ecx
801016b7:	83 c4 10             	add    $0x10,%esp
    bp = bread(dev, IBLOCK(inum, sb));
801016ba:	89 c2                	mov    %eax,%edx
    dip = (struct dinode*)bp->data + inum%IPB;
801016bc:	01 c9                	add    %ecx,%ecx
801016be:	89 f8                	mov    %edi,%eax
801016c0:	29 c8                	sub    %ecx,%eax
801016c2:	6b c0 70             	imul   $0x70,%eax,%eax
801016c5:	8d 5c 02 5c          	lea    0x5c(%edx,%eax,1),%ebx
    if(dip->type == 0){  // a free inode
801016c9:	66 83 3b 00          	cmpw   $0x0,(%ebx)
801016cd:	75 b1                	jne    80101680 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
801016cf:	83 ec 04             	sub    $0x4,%esp
801016d2:	89 55 e0             	mov    %edx,-0x20(%ebp)
801016d5:	6a 70                	push   $0x70
801016d7:	6a 00                	push   $0x0
801016d9:	53                   	push   %ebx
801016da:	e8 11 41 00 00       	call   801057f0 <memset>
      dip->type = type;
801016df:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
      log_write(bp);   // mark it allocated on the disk
801016e3:	8b 55 e0             	mov    -0x20(%ebp),%edx
      dip->type = type;
801016e6:	66 89 03             	mov    %ax,(%ebx)
      log_write(bp);   // mark it allocated on the disk
801016e9:	89 14 24             	mov    %edx,(%esp)
801016ec:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801016ef:	e8 ac 18 00 00       	call   80102fa0 <log_write>
      brelse(bp);
801016f4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801016f7:	89 14 24             	mov    %edx,(%esp)
801016fa:	e8 f1 ea ff ff       	call   801001f0 <brelse>
      return iget(dev, inum);
801016ff:	83 c4 10             	add    $0x10,%esp
}
80101702:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return iget(dev, inum);
80101705:	89 fa                	mov    %edi,%edx
}
80101707:	5b                   	pop    %ebx
      return iget(dev, inum);
80101708:	89 f0                	mov    %esi,%eax
}
8010170a:	5e                   	pop    %esi
8010170b:	5f                   	pop    %edi
8010170c:	5d                   	pop    %ebp
      return iget(dev, inum);
8010170d:	e9 ee fb ff ff       	jmp    80101300 <iget>
  panic("ialloc: no inodes");
80101712:	83 ec 0c             	sub    $0xc,%esp
80101715:	68 67 75 10 80       	push   $0x80107567
8010171a:	e8 61 ec ff ff       	call   80100380 <panic>
8010171f:	90                   	nop

80101720 <iupdate>:
{
80101720:	55                   	push   %ebp
80101721:	89 e5                	mov    %esp,%ebp
80101723:	57                   	push   %edi
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101724:	bf cd cc cc cc       	mov    $0xcccccccd,%edi
{
80101729:	56                   	push   %esi
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
8010172a:	89 f8                	mov    %edi,%eax
{
8010172c:	53                   	push   %ebx
8010172d:	83 ec 14             	sub    $0x14,%esp
80101730:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101733:	f7 63 04             	mull   0x4(%ebx)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101736:	83 c3 5c             	add    $0x5c,%ebx
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101739:	c1 ea 03             	shr    $0x3,%edx
8010173c:	03 15 c8 68 11 80    	add    0x801168c8,%edx
80101742:	52                   	push   %edx
80101743:	ff 73 a4             	push   -0x5c(%ebx)
80101746:	e8 85 e9 ff ff       	call   801000d0 <bread>
  dip = (struct dinode*)bp->data + ip->inum%IPB;
8010174b:	8b 4b a8             	mov    -0x58(%ebx),%ecx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010174e:	83 c4 0c             	add    $0xc,%esp
  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101751:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101753:	89 c8                	mov    %ecx,%eax
80101755:	f7 e7                	mul    %edi
80101757:	c1 ea 03             	shr    $0x3,%edx
8010175a:	8d 04 92             	lea    (%edx,%edx,4),%eax
  dip->type = ip->type;
8010175d:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101761:	01 c0                	add    %eax,%eax
80101763:	29 c1                	sub    %eax,%ecx
80101765:	6b c9 70             	imul   $0x70,%ecx,%ecx
80101768:	8d 44 0e 5c          	lea    0x5c(%esi,%ecx,1),%eax
  dip->type = ip->type;
8010176c:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
8010176f:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101773:	83 c0 0c             	add    $0xc,%eax
  dip->major = ip->major;
80101776:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
8010177a:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010177e:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
80101782:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101786:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
8010178a:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010178d:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101790:	6a 64                	push   $0x64
80101792:	53                   	push   %ebx
80101793:	50                   	push   %eax
80101794:	e8 e7 40 00 00       	call   80105880 <memmove>
  log_write(bp);
80101799:	89 34 24             	mov    %esi,(%esp)
8010179c:	e8 ff 17 00 00       	call   80102fa0 <log_write>
  brelse(bp);
801017a1:	89 75 08             	mov    %esi,0x8(%ebp)
801017a4:	83 c4 10             	add    $0x10,%esp
}
801017a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017aa:	5b                   	pop    %ebx
801017ab:	5e                   	pop    %esi
801017ac:	5f                   	pop    %edi
801017ad:	5d                   	pop    %ebp
  brelse(bp);
801017ae:	e9 3d ea ff ff       	jmp    801001f0 <brelse>
801017b3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801017ba:	00 
801017bb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801017c0 <idup>:
{
801017c0:	55                   	push   %ebp
801017c1:	89 e5                	mov    %esp,%ebp
801017c3:	53                   	push   %ebx
801017c4:	83 ec 10             	sub    $0x10,%esp
801017c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
801017ca:	68 00 43 11 80       	push   $0x80114300
801017cf:	e8 1c 3f 00 00       	call   801056f0 <acquire>
  ip->ref++;
801017d4:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
801017d8:	c7 04 24 00 43 11 80 	movl   $0x80114300,(%esp)
801017df:	e8 ac 3e 00 00       	call   80105690 <release>
}
801017e4:	89 d8                	mov    %ebx,%eax
801017e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801017e9:	c9                   	leave
801017ea:	c3                   	ret
801017eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801017f0 <ilock>:
{
801017f0:	55                   	push   %ebp
801017f1:	89 e5                	mov    %esp,%ebp
801017f3:	57                   	push   %edi
801017f4:	56                   	push   %esi
801017f5:	53                   	push   %ebx
801017f6:	83 ec 0c             	sub    $0xc,%esp
801017f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || ip->ref < 1)
801017fc:	85 db                	test   %ebx,%ebx
801017fe:	0f 84 c5 00 00 00    	je     801018c9 <ilock+0xd9>
80101804:	8b 53 08             	mov    0x8(%ebx),%edx
80101807:	85 d2                	test   %edx,%edx
80101809:	0f 8e ba 00 00 00    	jle    801018c9 <ilock+0xd9>
  acquiresleep(&ip->lock);
8010180f:	83 ec 0c             	sub    $0xc,%esp
80101812:	8d 43 0c             	lea    0xc(%ebx),%eax
80101815:	50                   	push   %eax
80101816:	e8 f5 3b 00 00       	call   80105410 <acquiresleep>
  if(ip->valid == 0){
8010181b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010181e:	83 c4 10             	add    $0x10,%esp
80101821:	85 c0                	test   %eax,%eax
80101823:	74 0b                	je     80101830 <ilock+0x40>
}
80101825:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101828:	5b                   	pop    %ebx
80101829:	5e                   	pop    %esi
8010182a:	5f                   	pop    %edi
8010182b:	5d                   	pop    %ebp
8010182c:	c3                   	ret
8010182d:	8d 76 00             	lea    0x0(%esi),%esi
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101830:	bf cd cc cc cc       	mov    $0xcccccccd,%edi
80101835:	83 ec 08             	sub    $0x8,%esp
80101838:	89 f8                	mov    %edi,%eax
8010183a:	f7 63 04             	mull   0x4(%ebx)
8010183d:	c1 ea 03             	shr    $0x3,%edx
80101840:	03 15 c8 68 11 80    	add    0x801168c8,%edx
80101846:	52                   	push   %edx
80101847:	ff 33                	push   (%ebx)
80101849:	e8 82 e8 ff ff       	call   801000d0 <bread>
    dip = (struct dinode*)bp->data + ip->inum%IPB;
8010184e:	8b 4b 04             	mov    0x4(%ebx),%ecx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101851:	83 c4 0c             	add    $0xc,%esp
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101854:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
80101856:	89 c8                	mov    %ecx,%eax
80101858:	f7 e7                	mul    %edi
8010185a:	c1 ea 03             	shr    $0x3,%edx
8010185d:	8d 04 92             	lea    (%edx,%edx,4),%eax
80101860:	01 c0                	add    %eax,%eax
80101862:	29 c1                	sub    %eax,%ecx
80101864:	6b c9 70             	imul   $0x70,%ecx,%ecx
80101867:	8d 44 0e 5c          	lea    0x5c(%esi,%ecx,1),%eax
    ip->type = dip->type;
8010186b:	0f b7 10             	movzwl (%eax),%edx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010186e:	83 c0 0c             	add    $0xc,%eax
    ip->type = dip->type;
80101871:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
80101875:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101879:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
8010187d:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
80101881:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
80101885:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101889:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
8010188d:	8b 50 fc             	mov    -0x4(%eax),%edx
80101890:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101893:	6a 64                	push   $0x64
80101895:	50                   	push   %eax
80101896:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101899:	50                   	push   %eax
8010189a:	e8 e1 3f 00 00       	call   80105880 <memmove>
    brelse(bp);
8010189f:	89 34 24             	mov    %esi,(%esp)
801018a2:	e8 49 e9 ff ff       	call   801001f0 <brelse>
    if(ip->type == 0)
801018a7:	83 c4 10             	add    $0x10,%esp
801018aa:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->valid = 1;
801018af:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
801018b6:	0f 85 69 ff ff ff    	jne    80101825 <ilock+0x35>
      panic("ilock: no type");
801018bc:	83 ec 0c             	sub    $0xc,%esp
801018bf:	68 7f 75 10 80       	push   $0x8010757f
801018c4:	e8 b7 ea ff ff       	call   80100380 <panic>
    panic("ilock");
801018c9:	83 ec 0c             	sub    $0xc,%esp
801018cc:	68 79 75 10 80       	push   $0x80107579
801018d1:	e8 aa ea ff ff       	call   80100380 <panic>
801018d6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801018dd:	00 
801018de:	66 90                	xchg   %ax,%ax

801018e0 <iunlock>:
{
801018e0:	55                   	push   %ebp
801018e1:	89 e5                	mov    %esp,%ebp
801018e3:	56                   	push   %esi
801018e4:	53                   	push   %ebx
801018e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
801018e8:	85 db                	test   %ebx,%ebx
801018ea:	74 28                	je     80101914 <iunlock+0x34>
801018ec:	83 ec 0c             	sub    $0xc,%esp
801018ef:	8d 73 0c             	lea    0xc(%ebx),%esi
801018f2:	56                   	push   %esi
801018f3:	e8 b8 3b 00 00       	call   801054b0 <holdingsleep>
801018f8:	83 c4 10             	add    $0x10,%esp
801018fb:	85 c0                	test   %eax,%eax
801018fd:	74 15                	je     80101914 <iunlock+0x34>
801018ff:	8b 43 08             	mov    0x8(%ebx),%eax
80101902:	85 c0                	test   %eax,%eax
80101904:	7e 0e                	jle    80101914 <iunlock+0x34>
  releasesleep(&ip->lock);
80101906:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101909:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010190c:	5b                   	pop    %ebx
8010190d:	5e                   	pop    %esi
8010190e:	5d                   	pop    %ebp
  releasesleep(&ip->lock);
8010190f:	e9 5c 3b 00 00       	jmp    80105470 <releasesleep>
    panic("iunlock");
80101914:	83 ec 0c             	sub    $0xc,%esp
80101917:	68 8e 75 10 80       	push   $0x8010758e
8010191c:	e8 5f ea ff ff       	call   80100380 <panic>
80101921:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80101928:	00 
80101929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101930 <iput>:
{
80101930:	55                   	push   %ebp
80101931:	89 e5                	mov    %esp,%ebp
80101933:	57                   	push   %edi
80101934:	56                   	push   %esi
80101935:	53                   	push   %ebx
80101936:	83 ec 28             	sub    $0x28,%esp
80101939:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquiresleep(&ip->lock);
8010193c:	8d 7b 0c             	lea    0xc(%ebx),%edi
8010193f:	57                   	push   %edi
80101940:	e8 cb 3a 00 00       	call   80105410 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
80101945:	8b 53 4c             	mov    0x4c(%ebx),%edx
80101948:	83 c4 10             	add    $0x10,%esp
8010194b:	85 d2                	test   %edx,%edx
8010194d:	74 07                	je     80101956 <iput+0x26>
8010194f:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80101954:	74 32                	je     80101988 <iput+0x58>
  releasesleep(&ip->lock);
80101956:	83 ec 0c             	sub    $0xc,%esp
80101959:	57                   	push   %edi
8010195a:	e8 11 3b 00 00       	call   80105470 <releasesleep>
  acquire(&icache.lock);
8010195f:	c7 04 24 00 43 11 80 	movl   $0x80114300,(%esp)
80101966:	e8 85 3d 00 00       	call   801056f0 <acquire>
  ip->ref--;
8010196b:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
  release(&icache.lock);
8010196f:	83 c4 10             	add    $0x10,%esp
80101972:	c7 45 08 00 43 11 80 	movl   $0x80114300,0x8(%ebp)
}
80101979:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010197c:	5b                   	pop    %ebx
8010197d:	5e                   	pop    %esi
8010197e:	5f                   	pop    %edi
8010197f:	5d                   	pop    %ebp
  release(&icache.lock);
80101980:	e9 0b 3d 00 00       	jmp    80105690 <release>
80101985:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&icache.lock);
80101988:	83 ec 0c             	sub    $0xc,%esp
8010198b:	68 00 43 11 80       	push   $0x80114300
80101990:	e8 5b 3d 00 00       	call   801056f0 <acquire>
    int r = ip->ref;
80101995:	8b 73 08             	mov    0x8(%ebx),%esi
    release(&icache.lock);
80101998:	c7 04 24 00 43 11 80 	movl   $0x80114300,(%esp)
8010199f:	e8 ec 3c 00 00       	call   80105690 <release>
    if(r == 1){
801019a4:	83 c4 10             	add    $0x10,%esp
801019a7:	83 fe 01             	cmp    $0x1,%esi
801019aa:	75 aa                	jne    80101956 <iput+0x26>
801019ac:	8d 8b bc 00 00 00    	lea    0xbc(%ebx),%ecx
801019b2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801019b5:	8d 73 5c             	lea    0x5c(%ebx),%esi
801019b8:	89 df                	mov    %ebx,%edi
801019ba:	89 cb                	mov    %ecx,%ebx
801019bc:	eb 09                	jmp    801019c7 <iput+0x97>
801019be:	66 90                	xchg   %ax,%ax
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
801019c0:	83 c6 04             	add    $0x4,%esi
801019c3:	39 de                	cmp    %ebx,%esi
801019c5:	74 19                	je     801019e0 <iput+0xb0>
    if(ip->addrs[i]){
801019c7:	8b 16                	mov    (%esi),%edx
801019c9:	85 d2                	test   %edx,%edx
801019cb:	74 f3                	je     801019c0 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
801019cd:	8b 07                	mov    (%edi),%eax
801019cf:	e8 2c fa ff ff       	call   80101400 <bfree>
      ip->addrs[i] = 0;
801019d4:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
801019da:	eb e4                	jmp    801019c0 <iput+0x90>
801019dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
801019e0:	89 fb                	mov    %edi,%ebx
801019e2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801019e5:	8b 83 bc 00 00 00    	mov    0xbc(%ebx),%eax
801019eb:	85 c0                	test   %eax,%eax
801019ed:	75 2d                	jne    80101a1c <iput+0xec>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
801019ef:	83 ec 0c             	sub    $0xc,%esp
  ip->size = 0;
801019f2:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  iupdate(ip);
801019f9:	53                   	push   %ebx
801019fa:	e8 21 fd ff ff       	call   80101720 <iupdate>
      ip->type = 0;
801019ff:	31 c0                	xor    %eax,%eax
80101a01:	66 89 43 50          	mov    %ax,0x50(%ebx)
      iupdate(ip);
80101a05:	89 1c 24             	mov    %ebx,(%esp)
80101a08:	e8 13 fd ff ff       	call   80101720 <iupdate>
      ip->valid = 0;
80101a0d:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
80101a14:	83 c4 10             	add    $0x10,%esp
80101a17:	e9 3a ff ff ff       	jmp    80101956 <iput+0x26>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101a1c:	83 ec 08             	sub    $0x8,%esp
80101a1f:	50                   	push   %eax
80101a20:	ff 33                	push   (%ebx)
80101a22:	e8 a9 e6 ff ff       	call   801000d0 <bread>
    for(j = 0; j < NINDIRECT; j++){
80101a27:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101a2a:	83 c4 10             	add    $0x10,%esp
80101a2d:	8d 88 1c 09 00 00    	lea    0x91c(%eax),%ecx
80101a33:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101a36:	8d 70 5c             	lea    0x5c(%eax),%esi
80101a39:	89 cf                	mov    %ecx,%edi
80101a3b:	eb 0a                	jmp    80101a47 <iput+0x117>
80101a3d:	8d 76 00             	lea    0x0(%esi),%esi
80101a40:	83 c6 04             	add    $0x4,%esi
80101a43:	39 fe                	cmp    %edi,%esi
80101a45:	74 0f                	je     80101a56 <iput+0x126>
      if(a[j])
80101a47:	8b 16                	mov    (%esi),%edx
80101a49:	85 d2                	test   %edx,%edx
80101a4b:	74 f3                	je     80101a40 <iput+0x110>
        bfree(ip->dev, a[j]);
80101a4d:	8b 03                	mov    (%ebx),%eax
80101a4f:	e8 ac f9 ff ff       	call   80101400 <bfree>
80101a54:	eb ea                	jmp    80101a40 <iput+0x110>
    brelse(bp);
80101a56:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101a59:	83 ec 0c             	sub    $0xc,%esp
80101a5c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101a5f:	50                   	push   %eax
80101a60:	e8 8b e7 ff ff       	call   801001f0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
80101a65:	8b 93 bc 00 00 00    	mov    0xbc(%ebx),%edx
80101a6b:	8b 03                	mov    (%ebx),%eax
80101a6d:	e8 8e f9 ff ff       	call   80101400 <bfree>
    ip->addrs[NDIRECT] = 0;
80101a72:	83 c4 10             	add    $0x10,%esp
80101a75:	c7 83 bc 00 00 00 00 	movl   $0x0,0xbc(%ebx)
80101a7c:	00 00 00 
80101a7f:	e9 6b ff ff ff       	jmp    801019ef <iput+0xbf>
80101a84:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80101a8b:	00 
80101a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101a90 <iunlockput>:
{
80101a90:	55                   	push   %ebp
80101a91:	89 e5                	mov    %esp,%ebp
80101a93:	56                   	push   %esi
80101a94:	53                   	push   %ebx
80101a95:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101a98:	85 db                	test   %ebx,%ebx
80101a9a:	74 34                	je     80101ad0 <iunlockput+0x40>
80101a9c:	83 ec 0c             	sub    $0xc,%esp
80101a9f:	8d 73 0c             	lea    0xc(%ebx),%esi
80101aa2:	56                   	push   %esi
80101aa3:	e8 08 3a 00 00       	call   801054b0 <holdingsleep>
80101aa8:	83 c4 10             	add    $0x10,%esp
80101aab:	85 c0                	test   %eax,%eax
80101aad:	74 21                	je     80101ad0 <iunlockput+0x40>
80101aaf:	8b 43 08             	mov    0x8(%ebx),%eax
80101ab2:	85 c0                	test   %eax,%eax
80101ab4:	7e 1a                	jle    80101ad0 <iunlockput+0x40>
  releasesleep(&ip->lock);
80101ab6:	83 ec 0c             	sub    $0xc,%esp
80101ab9:	56                   	push   %esi
80101aba:	e8 b1 39 00 00       	call   80105470 <releasesleep>
  iput(ip);
80101abf:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101ac2:	83 c4 10             	add    $0x10,%esp
}
80101ac5:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101ac8:	5b                   	pop    %ebx
80101ac9:	5e                   	pop    %esi
80101aca:	5d                   	pop    %ebp
  iput(ip);
80101acb:	e9 60 fe ff ff       	jmp    80101930 <iput>
    panic("iunlock");
80101ad0:	83 ec 0c             	sub    $0xc,%esp
80101ad3:	68 8e 75 10 80       	push   $0x8010758e
80101ad8:	e8 a3 e8 ff ff       	call   80100380 <panic>
80101add:	8d 76 00             	lea    0x0(%esi),%esi

80101ae0 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101ae0:	55                   	push   %ebp
80101ae1:	89 e5                	mov    %esp,%ebp
80101ae3:	8b 55 08             	mov    0x8(%ebp),%edx
80101ae6:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101ae9:	8b 0a                	mov    (%edx),%ecx
80101aeb:	89 08                	mov    %ecx,(%eax)
  st->ino = ip->inum;
80101aed:	8b 4a 04             	mov    0x4(%edx),%ecx
80101af0:	89 48 04             	mov    %ecx,0x4(%eax)
  st->type = ip->type;
80101af3:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101af7:	66 89 48 08          	mov    %cx,0x8(%eax)
  st->nlink = ip->nlink;
80101afb:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
80101aff:	66 89 48 0a          	mov    %cx,0xa(%eax)
  st->size = ip->size;
80101b03:	8b 52 58             	mov    0x58(%edx),%edx
80101b06:	89 50 0c             	mov    %edx,0xc(%eax)
}
80101b09:	5d                   	pop    %ebp
80101b0a:	c3                   	ret
80101b0b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80101b10 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101b10:	55                   	push   %ebp
80101b11:	89 e5                	mov    %esp,%ebp
80101b13:	57                   	push   %edi
80101b14:	56                   	push   %esi
80101b15:	53                   	push   %ebx
80101b16:	83 ec 1c             	sub    $0x1c,%esp
80101b19:	8b 75 0c             	mov    0xc(%ebp),%esi
80101b1c:	8b 45 08             	mov    0x8(%ebp),%eax
80101b1f:	8b 7d 10             	mov    0x10(%ebp),%edi
80101b22:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101b25:	8b 75 14             	mov    0x14(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101b28:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
{
80101b2d:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101b30:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  if(ip->type == T_DEV){
80101b33:	0f 84 b7 00 00 00    	je     80101bf0 <readi+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101b39:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b3c:	8b 40 58             	mov    0x58(%eax),%eax
80101b3f:	39 f8                	cmp    %edi,%eax
80101b41:	0f 82 ca 00 00 00    	jb     80101c11 <readi+0x101>
80101b47:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b4a:	31 c9                	xor    %ecx,%ecx
80101b4c:	01 fa                	add    %edi,%edx
80101b4e:	0f 92 c1             	setb   %cl
80101b51:	89 ce                	mov    %ecx,%esi
80101b53:	0f 82 b8 00 00 00    	jb     80101c11 <readi+0x101>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101b59:	89 c3                	mov    %eax,%ebx
80101b5b:	29 fb                	sub    %edi,%ebx
80101b5d:	39 d0                	cmp    %edx,%eax
80101b5f:	0f 43 5d e4          	cmovae -0x1c(%ebp),%ebx
80101b63:	89 5d e4             	mov    %ebx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101b66:	85 db                	test   %ebx,%ebx
80101b68:	74 77                	je     80101be1 <readi+0xd1>
80101b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b70:	89 fb                	mov    %edi,%ebx
80101b72:	b8 08 75 50 07       	mov    $0x7507508,%eax
80101b77:	c1 eb 05             	shr    $0x5,%ebx
80101b7a:	f7 e3                	mul    %ebx
80101b7c:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b7f:	89 d3                	mov    %edx,%ebx
80101b81:	e8 0a f9 ff ff       	call   80101490 <bmap>
80101b86:	83 ec 08             	sub    $0x8,%esp
    m = min(n - tot, BSIZE - off%BSIZE);
80101b89:	69 db 60 04 00 00    	imul   $0x460,%ebx,%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b8f:	50                   	push   %eax
80101b90:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b93:	ff 30                	push   (%eax)
80101b95:	e8 36 e5 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101b9a:	ba 60 04 00 00       	mov    $0x460,%edx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b9f:	89 c1                	mov    %eax,%ecx
    m = min(n - tot, BSIZE - off%BSIZE);
80101ba1:	89 f8                	mov    %edi,%eax
80101ba3:	29 d8                	sub    %ebx,%eax
80101ba5:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101ba8:	29 c2                	sub    %eax,%edx
    memmove(dst, bp->data + off%BSIZE, m);
80101baa:	8d 44 01 5c          	lea    0x5c(%ecx,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101bae:	29 f3                	sub    %esi,%ebx
80101bb0:	39 da                	cmp    %ebx,%edx
80101bb2:	0f 46 da             	cmovbe %edx,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
80101bb5:	83 c4 0c             	add    $0xc,%esp
80101bb8:	53                   	push   %ebx
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101bb9:	01 de                	add    %ebx,%esi
80101bbb:	01 df                	add    %ebx,%edi
    memmove(dst, bp->data + off%BSIZE, m);
80101bbd:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80101bc0:	50                   	push   %eax
80101bc1:	ff 75 dc             	push   -0x24(%ebp)
80101bc4:	e8 b7 3c 00 00       	call   80105880 <memmove>
    brelse(bp);
80101bc9:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80101bcc:	89 0c 24             	mov    %ecx,(%esp)
80101bcf:	e8 1c e6 ff ff       	call   801001f0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101bd4:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101bd7:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101bda:	83 c4 10             	add    $0x10,%esp
80101bdd:	39 de                	cmp    %ebx,%esi
80101bdf:	72 8f                	jb     80101b70 <readi+0x60>
  }
  return n;
80101be1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101be4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101be7:	5b                   	pop    %ebx
80101be8:	5e                   	pop    %esi
80101be9:	5f                   	pop    %edi
80101bea:	5d                   	pop    %ebp
80101beb:	c3                   	ret
80101bec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101bf0:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101bf4:	66 83 f8 09          	cmp    $0x9,%ax
80101bf8:	77 17                	ja     80101c11 <readi+0x101>
80101bfa:	8b 04 c5 a0 42 11 80 	mov    -0x7feebd60(,%eax,8),%eax
80101c01:	85 c0                	test   %eax,%eax
80101c03:	74 0c                	je     80101c11 <readi+0x101>
    return devsw[ip->major].read(ip, dst, n);
80101c05:	89 75 10             	mov    %esi,0x10(%ebp)
}
80101c08:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c0b:	5b                   	pop    %ebx
80101c0c:	5e                   	pop    %esi
80101c0d:	5f                   	pop    %edi
80101c0e:	5d                   	pop    %ebp
    return devsw[ip->major].read(ip, dst, n);
80101c0f:	ff e0                	jmp    *%eax
      return -1;
80101c11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101c16:	eb cc                	jmp    80101be4 <readi+0xd4>
80101c18:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80101c1f:	00 

80101c20 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101c20:	55                   	push   %ebp
80101c21:	89 e5                	mov    %esp,%ebp
80101c23:	57                   	push   %edi
80101c24:	56                   	push   %esi
80101c25:	53                   	push   %ebx
80101c26:	83 ec 1c             	sub    $0x1c,%esp
80101c29:	8b 45 0c             	mov    0xc(%ebp),%eax
80101c2c:	8b 4d 08             	mov    0x8(%ebp),%ecx
80101c2f:	8b 7d 10             	mov    0x10(%ebp),%edi
80101c32:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101c35:	8b 45 14             	mov    0x14(%ebp),%eax
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101c38:	66 83 79 50 03       	cmpw   $0x3,0x50(%ecx)
{
80101c3d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(ip->type == T_DEV){
80101c40:	0f 84 ca 00 00 00    	je     80101d10 <writei+0xf0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101c46:	39 79 58             	cmp    %edi,0x58(%ecx)
80101c49:	0f 82 fa 00 00 00    	jb     80101d49 <writei+0x129>
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101c4f:	8b 75 e0             	mov    -0x20(%ebp),%esi
80101c52:	89 f0                	mov    %esi,%eax
80101c54:	01 f8                	add    %edi,%eax
80101c56:	0f 82 ed 00 00 00    	jb     80101d49 <writei+0x129>
80101c5c:	3d 00 fb 09 00       	cmp    $0x9fb00,%eax
80101c61:	0f 87 e2 00 00 00    	ja     80101d49 <writei+0x129>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101c67:	85 f6                	test   %esi,%esi
80101c69:	0f 84 92 00 00 00    	je     80101d01 <writei+0xe1>
80101c6f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
80101c76:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80101c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101c80:	89 fb                	mov    %edi,%ebx
80101c82:	b8 08 75 50 07       	mov    $0x7507508,%eax
80101c87:	8b 75 d8             	mov    -0x28(%ebp),%esi
80101c8a:	c1 eb 05             	shr    $0x5,%ebx
80101c8d:	f7 e3                	mul    %ebx
80101c8f:	89 f0                	mov    %esi,%eax
80101c91:	89 d3                	mov    %edx,%ebx
80101c93:	e8 f8 f7 ff ff       	call   80101490 <bmap>
80101c98:	83 ec 08             	sub    $0x8,%esp
    m = min(n - tot, BSIZE - off%BSIZE);
80101c9b:	69 db 60 04 00 00    	imul   $0x460,%ebx,%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ca1:	50                   	push   %eax
80101ca2:	ff 36                	push   (%esi)
80101ca4:	e8 27 e4 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101ca9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101cac:	ba 60 04 00 00       	mov    $0x460,%edx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101cb1:	89 c6                	mov    %eax,%esi
    m = min(n - tot, BSIZE - off%BSIZE);
80101cb3:	89 f8                	mov    %edi,%eax
80101cb5:	29 d8                	sub    %ebx,%eax
80101cb7:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101cba:	29 c2                	sub    %eax,%edx
    memmove(bp->data + off%BSIZE, src, m);
80101cbc:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101cc0:	29 cb                	sub    %ecx,%ebx
80101cc2:	39 da                	cmp    %ebx,%edx
80101cc4:	0f 46 da             	cmovbe %edx,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101cc7:	83 c4 0c             	add    $0xc,%esp
80101cca:	53                   	push   %ebx
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ccb:	01 df                	add    %ebx,%edi
    memmove(bp->data + off%BSIZE, src, m);
80101ccd:	ff 75 dc             	push   -0x24(%ebp)
80101cd0:	50                   	push   %eax
80101cd1:	e8 aa 3b 00 00       	call   80105880 <memmove>
    log_write(bp);
80101cd6:	89 34 24             	mov    %esi,(%esp)
80101cd9:	e8 c2 12 00 00       	call   80102fa0 <log_write>
    brelse(bp);
80101cde:	89 34 24             	mov    %esi,(%esp)
80101ce1:	e8 0a e5 ff ff       	call   801001f0 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101ce6:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101ce9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101cec:	83 c4 10             	add    $0x10,%esp
80101cef:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101cf2:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101cf5:	39 d8                	cmp    %ebx,%eax
80101cf7:	72 87                	jb     80101c80 <writei+0x60>
  }

  if(n > 0 && off > ip->size){
80101cf9:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80101cfc:	39 79 58             	cmp    %edi,0x58(%ecx)
80101cff:	72 37                	jb     80101d38 <writei+0x118>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101d01:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101d04:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d07:	5b                   	pop    %ebx
80101d08:	5e                   	pop    %esi
80101d09:	5f                   	pop    %edi
80101d0a:	5d                   	pop    %ebp
80101d0b:	c3                   	ret
80101d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101d10:	0f bf 41 52          	movswl 0x52(%ecx),%eax
80101d14:	66 83 f8 09          	cmp    $0x9,%ax
80101d18:	77 2f                	ja     80101d49 <writei+0x129>
80101d1a:	8b 04 c5 a4 42 11 80 	mov    -0x7feebd5c(,%eax,8),%eax
80101d21:	85 c0                	test   %eax,%eax
80101d23:	74 24                	je     80101d49 <writei+0x129>
    return devsw[ip->major].write(ip, src, n);
80101d25:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101d28:	89 7d 10             	mov    %edi,0x10(%ebp)
}
80101d2b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d2e:	5b                   	pop    %ebx
80101d2f:	5e                   	pop    %esi
80101d30:	5f                   	pop    %edi
80101d31:	5d                   	pop    %ebp
    return devsw[ip->major].write(ip, src, n);
80101d32:	ff e0                	jmp    *%eax
80101d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    iupdate(ip);
80101d38:	83 ec 0c             	sub    $0xc,%esp
    ip->size = off;
80101d3b:	89 79 58             	mov    %edi,0x58(%ecx)
    iupdate(ip);
80101d3e:	51                   	push   %ecx
80101d3f:	e8 dc f9 ff ff       	call   80101720 <iupdate>
80101d44:	83 c4 10             	add    $0x10,%esp
80101d47:	eb b8                	jmp    80101d01 <writei+0xe1>
      return -1;
80101d49:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101d4e:	eb b4                	jmp    80101d04 <writei+0xe4>

80101d50 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101d50:	55                   	push   %ebp
80101d51:	89 e5                	mov    %esp,%ebp
80101d53:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101d56:	6a 0e                	push   $0xe
80101d58:	ff 75 0c             	push   0xc(%ebp)
80101d5b:	ff 75 08             	push   0x8(%ebp)
80101d5e:	e8 8d 3b 00 00       	call   801058f0 <strncmp>
}
80101d63:	c9                   	leave
80101d64:	c3                   	ret
80101d65:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80101d6c:	00 
80101d6d:	8d 76 00             	lea    0x0(%esi),%esi

80101d70 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101d70:	55                   	push   %ebp
80101d71:	89 e5                	mov    %esp,%ebp
80101d73:	57                   	push   %edi
80101d74:	56                   	push   %esi
80101d75:	53                   	push   %ebx
80101d76:	83 ec 1c             	sub    $0x1c,%esp
80101d79:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101d7c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101d81:	0f 85 85 00 00 00    	jne    80101e0c <dirlookup+0x9c>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101d87:	8b 53 58             	mov    0x58(%ebx),%edx
80101d8a:	31 ff                	xor    %edi,%edi
80101d8c:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101d8f:	85 d2                	test   %edx,%edx
80101d91:	74 3e                	je     80101dd1 <dirlookup+0x61>
80101d93:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101d98:	6a 10                	push   $0x10
80101d9a:	57                   	push   %edi
80101d9b:	56                   	push   %esi
80101d9c:	53                   	push   %ebx
80101d9d:	e8 6e fd ff ff       	call   80101b10 <readi>
80101da2:	83 c4 10             	add    $0x10,%esp
80101da5:	83 f8 10             	cmp    $0x10,%eax
80101da8:	75 55                	jne    80101dff <dirlookup+0x8f>
      panic("dirlookup read");
    if(de.inum == 0)
80101daa:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101daf:	74 18                	je     80101dc9 <dirlookup+0x59>
  return strncmp(s, t, DIRSIZ);
80101db1:	83 ec 04             	sub    $0x4,%esp
80101db4:	8d 45 da             	lea    -0x26(%ebp),%eax
80101db7:	6a 0e                	push   $0xe
80101db9:	50                   	push   %eax
80101dba:	ff 75 0c             	push   0xc(%ebp)
80101dbd:	e8 2e 3b 00 00       	call   801058f0 <strncmp>
      continue;
    if(namecmp(name, de.name) == 0){
80101dc2:	83 c4 10             	add    $0x10,%esp
80101dc5:	85 c0                	test   %eax,%eax
80101dc7:	74 17                	je     80101de0 <dirlookup+0x70>
  for(off = 0; off < dp->size; off += sizeof(de)){
80101dc9:	83 c7 10             	add    $0x10,%edi
80101dcc:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101dcf:	72 c7                	jb     80101d98 <dirlookup+0x28>
      return iget(dp->dev, inum);
    }
  }

  return 0;
}
80101dd1:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80101dd4:	31 c0                	xor    %eax,%eax
}
80101dd6:	5b                   	pop    %ebx
80101dd7:	5e                   	pop    %esi
80101dd8:	5f                   	pop    %edi
80101dd9:	5d                   	pop    %ebp
80101dda:	c3                   	ret
80101ddb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      if(poff)
80101de0:	8b 45 10             	mov    0x10(%ebp),%eax
80101de3:	85 c0                	test   %eax,%eax
80101de5:	74 05                	je     80101dec <dirlookup+0x7c>
        *poff = off;
80101de7:	8b 45 10             	mov    0x10(%ebp),%eax
80101dea:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
80101dec:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101df0:	8b 03                	mov    (%ebx),%eax
80101df2:	e8 09 f5 ff ff       	call   80101300 <iget>
}
80101df7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101dfa:	5b                   	pop    %ebx
80101dfb:	5e                   	pop    %esi
80101dfc:	5f                   	pop    %edi
80101dfd:	5d                   	pop    %ebp
80101dfe:	c3                   	ret
      panic("dirlookup read");
80101dff:	83 ec 0c             	sub    $0xc,%esp
80101e02:	68 a8 75 10 80       	push   $0x801075a8
80101e07:	e8 74 e5 ff ff       	call   80100380 <panic>
    panic("dirlookup not DIR");
80101e0c:	83 ec 0c             	sub    $0xc,%esp
80101e0f:	68 96 75 10 80       	push   $0x80107596
80101e14:	e8 67 e5 ff ff       	call   80100380 <panic>
80101e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101e20 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101e20:	55                   	push   %ebp
80101e21:	89 e5                	mov    %esp,%ebp
80101e23:	57                   	push   %edi
80101e24:	56                   	push   %esi
80101e25:	53                   	push   %ebx
80101e26:	89 c3                	mov    %eax,%ebx
80101e28:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101e2b:	80 38 2f             	cmpb   $0x2f,(%eax)
{
80101e2e:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101e31:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  if(*path == '/')
80101e34:	0f 84 9e 01 00 00    	je     80101fd8 <namex+0x1b8>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101e3a:	e8 b1 19 00 00       	call   801037f0 <myproc>
  acquire(&icache.lock);
80101e3f:	83 ec 0c             	sub    $0xc,%esp
    ip = idup(myproc()->cwd);
80101e42:	8b 70 74             	mov    0x74(%eax),%esi
  acquire(&icache.lock);
80101e45:	68 00 43 11 80       	push   $0x80114300
80101e4a:	e8 a1 38 00 00       	call   801056f0 <acquire>
  ip->ref++;
80101e4f:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101e53:	c7 04 24 00 43 11 80 	movl   $0x80114300,(%esp)
80101e5a:	e8 31 38 00 00       	call   80105690 <release>
80101e5f:	83 c4 10             	add    $0x10,%esp
80101e62:	eb 07                	jmp    80101e6b <namex+0x4b>
80101e64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    path++;
80101e68:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101e6b:	0f b6 03             	movzbl (%ebx),%eax
80101e6e:	3c 2f                	cmp    $0x2f,%al
80101e70:	74 f6                	je     80101e68 <namex+0x48>
  if(*path == 0)
80101e72:	84 c0                	test   %al,%al
80101e74:	0f 84 06 01 00 00    	je     80101f80 <namex+0x160>
  while(*path != '/' && *path != 0)
80101e7a:	0f b6 03             	movzbl (%ebx),%eax
80101e7d:	84 c0                	test   %al,%al
80101e7f:	0f 84 10 01 00 00    	je     80101f95 <namex+0x175>
80101e85:	89 df                	mov    %ebx,%edi
80101e87:	3c 2f                	cmp    $0x2f,%al
80101e89:	0f 84 06 01 00 00    	je     80101f95 <namex+0x175>
80101e8f:	90                   	nop
80101e90:	0f b6 47 01          	movzbl 0x1(%edi),%eax
    path++;
80101e94:	83 c7 01             	add    $0x1,%edi
  while(*path != '/' && *path != 0)
80101e97:	3c 2f                	cmp    $0x2f,%al
80101e99:	74 04                	je     80101e9f <namex+0x7f>
80101e9b:	84 c0                	test   %al,%al
80101e9d:	75 f1                	jne    80101e90 <namex+0x70>
  len = path - s;
80101e9f:	89 f8                	mov    %edi,%eax
80101ea1:	29 d8                	sub    %ebx,%eax
  if(len >= DIRSIZ)
80101ea3:	83 f8 0d             	cmp    $0xd,%eax
80101ea6:	0f 8e ac 00 00 00    	jle    80101f58 <namex+0x138>
    memmove(name, s, DIRSIZ);
80101eac:	83 ec 04             	sub    $0x4,%esp
80101eaf:	6a 0e                	push   $0xe
80101eb1:	53                   	push   %ebx
80101eb2:	89 fb                	mov    %edi,%ebx
80101eb4:	ff 75 e4             	push   -0x1c(%ebp)
80101eb7:	e8 c4 39 00 00       	call   80105880 <memmove>
80101ebc:	83 c4 10             	add    $0x10,%esp
  while(*path == '/')
80101ebf:	80 3f 2f             	cmpb   $0x2f,(%edi)
80101ec2:	75 0c                	jne    80101ed0 <namex+0xb0>
80101ec4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    path++;
80101ec8:	83 c3 01             	add    $0x1,%ebx
  while(*path == '/')
80101ecb:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101ece:	74 f8                	je     80101ec8 <namex+0xa8>

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101ed0:	83 ec 0c             	sub    $0xc,%esp
80101ed3:	56                   	push   %esi
80101ed4:	e8 17 f9 ff ff       	call   801017f0 <ilock>
    if(ip->type != T_DIR){
80101ed9:	83 c4 10             	add    $0x10,%esp
80101edc:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101ee1:	0f 85 b7 00 00 00    	jne    80101f9e <namex+0x17e>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101ee7:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101eea:	85 c0                	test   %eax,%eax
80101eec:	74 09                	je     80101ef7 <namex+0xd7>
80101eee:	80 3b 00             	cmpb   $0x0,(%ebx)
80101ef1:	0f 84 f7 00 00 00    	je     80101fee <namex+0x1ce>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101ef7:	83 ec 04             	sub    $0x4,%esp
80101efa:	6a 00                	push   $0x0
80101efc:	ff 75 e4             	push   -0x1c(%ebp)
80101eff:	56                   	push   %esi
80101f00:	e8 6b fe ff ff       	call   80101d70 <dirlookup>
80101f05:	83 c4 10             	add    $0x10,%esp
80101f08:	89 c7                	mov    %eax,%edi
80101f0a:	85 c0                	test   %eax,%eax
80101f0c:	0f 84 8c 00 00 00    	je     80101f9e <namex+0x17e>
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101f12:	8d 4e 0c             	lea    0xc(%esi),%ecx
80101f15:	83 ec 0c             	sub    $0xc,%esp
80101f18:	51                   	push   %ecx
80101f19:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101f1c:	e8 8f 35 00 00       	call   801054b0 <holdingsleep>
80101f21:	83 c4 10             	add    $0x10,%esp
80101f24:	85 c0                	test   %eax,%eax
80101f26:	0f 84 02 01 00 00    	je     8010202e <namex+0x20e>
80101f2c:	8b 56 08             	mov    0x8(%esi),%edx
80101f2f:	85 d2                	test   %edx,%edx
80101f31:	0f 8e f7 00 00 00    	jle    8010202e <namex+0x20e>
  releasesleep(&ip->lock);
80101f37:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101f3a:	83 ec 0c             	sub    $0xc,%esp
80101f3d:	51                   	push   %ecx
80101f3e:	e8 2d 35 00 00       	call   80105470 <releasesleep>
  iput(ip);
80101f43:	89 34 24             	mov    %esi,(%esp)
      iunlockput(ip);
      return 0;
    }
    iunlockput(ip);
    ip = next;
80101f46:	89 fe                	mov    %edi,%esi
  iput(ip);
80101f48:	e8 e3 f9 ff ff       	call   80101930 <iput>
80101f4d:	83 c4 10             	add    $0x10,%esp
  while(*path == '/')
80101f50:	e9 16 ff ff ff       	jmp    80101e6b <namex+0x4b>
80101f55:	8d 76 00             	lea    0x0(%esi),%esi
    name[len] = 0;
80101f58:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101f5b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    memmove(name, s, len);
80101f5e:	83 ec 04             	sub    $0x4,%esp
80101f61:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101f64:	50                   	push   %eax
80101f65:	53                   	push   %ebx
    name[len] = 0;
80101f66:	89 fb                	mov    %edi,%ebx
    memmove(name, s, len);
80101f68:	ff 75 e4             	push   -0x1c(%ebp)
80101f6b:	e8 10 39 00 00       	call   80105880 <memmove>
    name[len] = 0;
80101f70:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101f73:	83 c4 10             	add    $0x10,%esp
80101f76:	c6 01 00             	movb   $0x0,(%ecx)
80101f79:	e9 41 ff ff ff       	jmp    80101ebf <namex+0x9f>
80101f7e:	66 90                	xchg   %ax,%ax
  }
  if(nameiparent){
80101f80:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101f83:	85 c0                	test   %eax,%eax
80101f85:	0f 85 93 00 00 00    	jne    8010201e <namex+0x1fe>
    iput(ip);
    return 0;
  }
  return ip;
}
80101f8b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f8e:	89 f0                	mov    %esi,%eax
80101f90:	5b                   	pop    %ebx
80101f91:	5e                   	pop    %esi
80101f92:	5f                   	pop    %edi
80101f93:	5d                   	pop    %ebp
80101f94:	c3                   	ret
  while(*path != '/' && *path != 0)
80101f95:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101f98:	89 df                	mov    %ebx,%edi
80101f9a:	31 c0                	xor    %eax,%eax
80101f9c:	eb c0                	jmp    80101f5e <namex+0x13e>
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101f9e:	83 ec 0c             	sub    $0xc,%esp
80101fa1:	8d 5e 0c             	lea    0xc(%esi),%ebx
80101fa4:	53                   	push   %ebx
80101fa5:	e8 06 35 00 00       	call   801054b0 <holdingsleep>
80101faa:	83 c4 10             	add    $0x10,%esp
80101fad:	85 c0                	test   %eax,%eax
80101faf:	74 7d                	je     8010202e <namex+0x20e>
80101fb1:	8b 4e 08             	mov    0x8(%esi),%ecx
80101fb4:	85 c9                	test   %ecx,%ecx
80101fb6:	7e 76                	jle    8010202e <namex+0x20e>
  releasesleep(&ip->lock);
80101fb8:	83 ec 0c             	sub    $0xc,%esp
80101fbb:	53                   	push   %ebx
80101fbc:	e8 af 34 00 00       	call   80105470 <releasesleep>
  iput(ip);
80101fc1:	89 34 24             	mov    %esi,(%esp)
      return 0;
80101fc4:	31 f6                	xor    %esi,%esi
  iput(ip);
80101fc6:	e8 65 f9 ff ff       	call   80101930 <iput>
      return 0;
80101fcb:	83 c4 10             	add    $0x10,%esp
}
80101fce:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fd1:	89 f0                	mov    %esi,%eax
80101fd3:	5b                   	pop    %ebx
80101fd4:	5e                   	pop    %esi
80101fd5:	5f                   	pop    %edi
80101fd6:	5d                   	pop    %ebp
80101fd7:	c3                   	ret
    ip = iget(ROOTDEV, ROOTINO);
80101fd8:	ba 01 00 00 00       	mov    $0x1,%edx
80101fdd:	b8 01 00 00 00       	mov    $0x1,%eax
80101fe2:	e8 19 f3 ff ff       	call   80101300 <iget>
80101fe7:	89 c6                	mov    %eax,%esi
80101fe9:	e9 7d fe ff ff       	jmp    80101e6b <namex+0x4b>
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101fee:	83 ec 0c             	sub    $0xc,%esp
80101ff1:	8d 5e 0c             	lea    0xc(%esi),%ebx
80101ff4:	53                   	push   %ebx
80101ff5:	e8 b6 34 00 00       	call   801054b0 <holdingsleep>
80101ffa:	83 c4 10             	add    $0x10,%esp
80101ffd:	85 c0                	test   %eax,%eax
80101fff:	74 2d                	je     8010202e <namex+0x20e>
80102001:	8b 7e 08             	mov    0x8(%esi),%edi
80102004:	85 ff                	test   %edi,%edi
80102006:	7e 26                	jle    8010202e <namex+0x20e>
  releasesleep(&ip->lock);
80102008:	83 ec 0c             	sub    $0xc,%esp
8010200b:	53                   	push   %ebx
8010200c:	e8 5f 34 00 00       	call   80105470 <releasesleep>
}
80102011:	83 c4 10             	add    $0x10,%esp
}
80102014:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102017:	89 f0                	mov    %esi,%eax
80102019:	5b                   	pop    %ebx
8010201a:	5e                   	pop    %esi
8010201b:	5f                   	pop    %edi
8010201c:	5d                   	pop    %ebp
8010201d:	c3                   	ret
    iput(ip);
8010201e:	83 ec 0c             	sub    $0xc,%esp
80102021:	56                   	push   %esi
      return 0;
80102022:	31 f6                	xor    %esi,%esi
    iput(ip);
80102024:	e8 07 f9 ff ff       	call   80101930 <iput>
    return 0;
80102029:	83 c4 10             	add    $0x10,%esp
8010202c:	eb a0                	jmp    80101fce <namex+0x1ae>
    panic("iunlock");
8010202e:	83 ec 0c             	sub    $0xc,%esp
80102031:	68 8e 75 10 80       	push   $0x8010758e
80102036:	e8 45 e3 ff ff       	call   80100380 <panic>
8010203b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80102040 <dirlink>:
{
80102040:	55                   	push   %ebp
80102041:	89 e5                	mov    %esp,%ebp
80102043:	57                   	push   %edi
80102044:	56                   	push   %esi
80102045:	53                   	push   %ebx
80102046:	83 ec 20             	sub    $0x20,%esp
80102049:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
8010204c:	6a 00                	push   $0x0
8010204e:	ff 75 0c             	push   0xc(%ebp)
80102051:	53                   	push   %ebx
80102052:	e8 19 fd ff ff       	call   80101d70 <dirlookup>
80102057:	83 c4 10             	add    $0x10,%esp
8010205a:	85 c0                	test   %eax,%eax
8010205c:	75 67                	jne    801020c5 <dirlink+0x85>
  for(off = 0; off < dp->size; off += sizeof(de)){
8010205e:	8b 7b 58             	mov    0x58(%ebx),%edi
80102061:	8d 75 d8             	lea    -0x28(%ebp),%esi
80102064:	85 ff                	test   %edi,%edi
80102066:	74 29                	je     80102091 <dirlink+0x51>
80102068:	31 ff                	xor    %edi,%edi
8010206a:	8d 75 d8             	lea    -0x28(%ebp),%esi
8010206d:	eb 09                	jmp    80102078 <dirlink+0x38>
8010206f:	90                   	nop
80102070:	83 c7 10             	add    $0x10,%edi
80102073:	3b 7b 58             	cmp    0x58(%ebx),%edi
80102076:	73 19                	jae    80102091 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80102078:	6a 10                	push   $0x10
8010207a:	57                   	push   %edi
8010207b:	56                   	push   %esi
8010207c:	53                   	push   %ebx
8010207d:	e8 8e fa ff ff       	call   80101b10 <readi>
80102082:	83 c4 10             	add    $0x10,%esp
80102085:	83 f8 10             	cmp    $0x10,%eax
80102088:	75 4e                	jne    801020d8 <dirlink+0x98>
    if(de.inum == 0)
8010208a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
8010208f:	75 df                	jne    80102070 <dirlink+0x30>
  strncpy(de.name, name, DIRSIZ);
80102091:	83 ec 04             	sub    $0x4,%esp
80102094:	8d 45 da             	lea    -0x26(%ebp),%eax
80102097:	6a 0e                	push   $0xe
80102099:	ff 75 0c             	push   0xc(%ebp)
8010209c:	50                   	push   %eax
8010209d:	e8 9e 38 00 00       	call   80105940 <strncpy>
  de.inum = inum;
801020a2:	8b 45 10             	mov    0x10(%ebp),%eax
801020a5:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801020a9:	6a 10                	push   $0x10
801020ab:	57                   	push   %edi
801020ac:	56                   	push   %esi
801020ad:	53                   	push   %ebx
801020ae:	e8 6d fb ff ff       	call   80101c20 <writei>
801020b3:	83 c4 20             	add    $0x20,%esp
801020b6:	83 f8 10             	cmp    $0x10,%eax
801020b9:	75 2a                	jne    801020e5 <dirlink+0xa5>
  return 0;
801020bb:	31 c0                	xor    %eax,%eax
}
801020bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020c0:	5b                   	pop    %ebx
801020c1:	5e                   	pop    %esi
801020c2:	5f                   	pop    %edi
801020c3:	5d                   	pop    %ebp
801020c4:	c3                   	ret
    iput(ip);
801020c5:	83 ec 0c             	sub    $0xc,%esp
801020c8:	50                   	push   %eax
801020c9:	e8 62 f8 ff ff       	call   80101930 <iput>
    return -1;
801020ce:	83 c4 10             	add    $0x10,%esp
801020d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801020d6:	eb e5                	jmp    801020bd <dirlink+0x7d>
      panic("dirlink read");
801020d8:	83 ec 0c             	sub    $0xc,%esp
801020db:	68 b7 75 10 80       	push   $0x801075b7
801020e0:	e8 9b e2 ff ff       	call   80100380 <panic>
    panic("dirlink");
801020e5:	83 ec 0c             	sub    $0xc,%esp
801020e8:	68 b8 77 10 80       	push   $0x801077b8
801020ed:	e8 8e e2 ff ff       	call   80100380 <panic>
801020f2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801020f9:	00 
801020fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102100 <namei>:

struct inode*
namei(char *path)
{
80102100:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80102101:	31 d2                	xor    %edx,%edx
{
80102103:	89 e5                	mov    %esp,%ebp
80102105:	83 ec 18             	sub    $0x18,%esp
  return namex(path, 0, name);
80102108:	8b 45 08             	mov    0x8(%ebp),%eax
8010210b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
8010210e:	e8 0d fd ff ff       	call   80101e20 <namex>
}
80102113:	c9                   	leave
80102114:	c3                   	ret
80102115:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010211c:	00 
8010211d:	8d 76 00             	lea    0x0(%esi),%esi

80102120 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80102120:	55                   	push   %ebp
  return namex(path, 1, name);
80102121:	ba 01 00 00 00       	mov    $0x1,%edx
{
80102126:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80102128:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010212b:	8b 45 08             	mov    0x8(%ebp),%eax
}
8010212e:	5d                   	pop    %ebp
  return namex(path, 1, name);
8010212f:	e9 ec fc ff ff       	jmp    80101e20 <namex>
80102134:	66 90                	xchg   %ax,%ax
80102136:	66 90                	xchg   %ax,%ax
80102138:	66 90                	xchg   %ax,%ax
8010213a:	66 90                	xchg   %ax,%ax
8010213c:	66 90                	xchg   %ax,%ax
8010213e:	66 90                	xchg   %ax,%ax

80102140 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80102140:	55                   	push   %ebp
80102141:	89 e5                	mov    %esp,%ebp
80102143:	57                   	push   %edi
80102144:	56                   	push   %esi
80102145:	53                   	push   %ebx
80102146:	83 ec 0c             	sub    $0xc,%esp
  if(b == 0)
80102149:	85 c0                	test   %eax,%eax
8010214b:	0f 84 b4 00 00 00    	je     80102205 <idestart+0xc5>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80102151:	8b 70 08             	mov    0x8(%eax),%esi
80102154:	89 c3                	mov    %eax,%ebx
80102156:	81 fe e7 03 00 00    	cmp    $0x3e7,%esi
8010215c:	0f 87 96 00 00 00    	ja     801021f8 <idestart+0xb8>
    panic("incorrect blockno");
  int sector_per_block =  BSIZE/SECTOR_SIZE;
  int sector = b->blockno * sector_per_block;
80102162:	01 f6                	add    %esi,%esi
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102164:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80102169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102170:	89 ca                	mov    %ecx,%edx
80102172:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102173:	83 e0 c0             	and    $0xffffffc0,%eax
80102176:	3c 40                	cmp    $0x40,%al
80102178:	75 f6                	jne    80102170 <idestart+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010217a:	31 ff                	xor    %edi,%edi
8010217c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80102181:	89 f8                	mov    %edi,%eax
80102183:	ee                   	out    %al,(%dx)
80102184:	b8 02 00 00 00       	mov    $0x2,%eax
80102189:	ba f2 01 00 00       	mov    $0x1f2,%edx
8010218e:	ee                   	out    %al,(%dx)
8010218f:	ba f3 01 00 00       	mov    $0x1f3,%edx
80102194:	89 f0                	mov    %esi,%eax
80102196:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80102197:	89 f0                	mov    %esi,%eax
80102199:	ba f4 01 00 00       	mov    $0x1f4,%edx
8010219e:	c1 f8 08             	sar    $0x8,%eax
801021a1:	ee                   	out    %al,(%dx)
801021a2:	ba f5 01 00 00       	mov    $0x1f5,%edx
801021a7:	89 f8                	mov    %edi,%eax
801021a9:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
801021aa:	0f b6 43 04          	movzbl 0x4(%ebx),%eax
801021ae:	ba f6 01 00 00       	mov    $0x1f6,%edx
801021b3:	c1 e0 04             	shl    $0x4,%eax
801021b6:	83 e0 10             	and    $0x10,%eax
801021b9:	83 c8 e0             	or     $0xffffffe0,%eax
801021bc:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
801021bd:	f6 03 04             	testb  $0x4,(%ebx)
801021c0:	75 16                	jne    801021d8 <idestart+0x98>
801021c2:	b8 c4 ff ff ff       	mov    $0xffffffc4,%eax
801021c7:	89 ca                	mov    %ecx,%edx
801021c9:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
801021ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
801021cd:	5b                   	pop    %ebx
801021ce:	5e                   	pop    %esi
801021cf:	5f                   	pop    %edi
801021d0:	5d                   	pop    %ebp
801021d1:	c3                   	ret
801021d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801021d8:	b8 c5 ff ff ff       	mov    $0xffffffc5,%eax
801021dd:	89 ca                	mov    %ecx,%edx
801021df:	ee                   	out    %al,(%dx)
  asm volatile("cld; rep outsl" :
801021e0:	b9 18 01 00 00       	mov    $0x118,%ecx
    outsl(0x1f0, b->data, BSIZE/4);
801021e5:	8d 73 5c             	lea    0x5c(%ebx),%esi
801021e8:	ba f0 01 00 00       	mov    $0x1f0,%edx
801021ed:	fc                   	cld
801021ee:	f3 6f                	rep outsl %ds:(%esi),(%dx)
}
801021f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801021f3:	5b                   	pop    %ebx
801021f4:	5e                   	pop    %esi
801021f5:	5f                   	pop    %edi
801021f6:	5d                   	pop    %ebp
801021f7:	c3                   	ret
    panic("incorrect blockno");
801021f8:	83 ec 0c             	sub    $0xc,%esp
801021fb:	68 cd 75 10 80       	push   $0x801075cd
80102200:	e8 7b e1 ff ff       	call   80100380 <panic>
    panic("idestart");
80102205:	83 ec 0c             	sub    $0xc,%esp
80102208:	68 c4 75 10 80       	push   $0x801075c4
8010220d:	e8 6e e1 ff ff       	call   80100380 <panic>
80102212:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102219:	00 
8010221a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102220 <ideinit>:
{
80102220:	55                   	push   %ebp
80102221:	89 e5                	mov    %esp,%ebp
80102223:	83 ec 10             	sub    $0x10,%esp
  initlock(&idelock, "ide");
80102226:	68 df 75 10 80       	push   $0x801075df
8010222b:	68 00 69 11 80       	push   $0x80116900
80102230:	e8 cb 32 00 00       	call   80105500 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102235:	58                   	pop    %eax
80102236:	a1 84 6a 11 80       	mov    0x80116a84,%eax
8010223b:	5a                   	pop    %edx
8010223c:	83 e8 01             	sub    $0x1,%eax
8010223f:	50                   	push   %eax
80102240:	6a 0e                	push   $0xe
80102242:	e8 99 02 00 00       	call   801024e0 <ioapicenable>
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102247:	83 c4 10             	add    $0x10,%esp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010224a:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
8010224f:	90                   	nop
80102250:	89 ca                	mov    %ecx,%edx
80102252:	ec                   	in     (%dx),%al
80102253:	83 e0 c0             	and    $0xffffffc0,%eax
80102256:	3c 40                	cmp    $0x40,%al
80102258:	75 f6                	jne    80102250 <ideinit+0x30>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010225a:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010225f:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102264:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102265:	89 ca                	mov    %ecx,%edx
80102267:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102268:	84 c0                	test   %al,%al
8010226a:	75 1e                	jne    8010228a <ideinit+0x6a>
8010226c:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102271:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102276:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010227d:	00 
8010227e:	66 90                	xchg   %ax,%ax
  for(i=0; i<1000; i++){
80102280:	83 e9 01             	sub    $0x1,%ecx
80102283:	74 0f                	je     80102294 <ideinit+0x74>
80102285:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102286:	84 c0                	test   %al,%al
80102288:	74 f6                	je     80102280 <ideinit+0x60>
      havedisk1 = 1;
8010228a:	c7 05 e0 68 11 80 01 	movl   $0x1,0x801168e0
80102291:	00 00 00 
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102294:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102299:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010229e:	ee                   	out    %al,(%dx)
}
8010229f:	c9                   	leave
801022a0:	c3                   	ret
801022a1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801022a8:	00 
801022a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801022b0 <ideintr>:

// Interrupt handler.
void
ideintr(void)
{
801022b0:	55                   	push   %ebp
801022b1:	89 e5                	mov    %esp,%ebp
801022b3:	57                   	push   %edi
801022b4:	56                   	push   %esi
801022b5:	53                   	push   %ebx
801022b6:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
801022b9:	68 00 69 11 80       	push   $0x80116900
801022be:	e8 2d 34 00 00       	call   801056f0 <acquire>

  if((b = idequeue) == 0){
801022c3:	8b 1d e4 68 11 80    	mov    0x801168e4,%ebx
801022c9:	83 c4 10             	add    $0x10,%esp
801022cc:	85 db                	test   %ebx,%ebx
801022ce:	74 63                	je     80102333 <ideintr+0x83>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
801022d0:	8b 43 58             	mov    0x58(%ebx),%eax
801022d3:	a3 e4 68 11 80       	mov    %eax,0x801168e4

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
801022d8:	8b 33                	mov    (%ebx),%esi
801022da:	f7 c6 04 00 00 00    	test   $0x4,%esi
801022e0:	75 2f                	jne    80102311 <ideintr+0x61>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801022e2:	ba f7 01 00 00       	mov    $0x1f7,%edx
801022e7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801022ee:	00 
801022ef:	90                   	nop
801022f0:	ec                   	in     (%dx),%al
  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801022f1:	89 c1                	mov    %eax,%ecx
801022f3:	83 e1 c0             	and    $0xffffffc0,%ecx
801022f6:	80 f9 40             	cmp    $0x40,%cl
801022f9:	75 f5                	jne    801022f0 <ideintr+0x40>
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801022fb:	a8 21                	test   $0x21,%al
801022fd:	75 12                	jne    80102311 <ideintr+0x61>
    insl(0x1f0, b->data, BSIZE/4);
801022ff:	8d 7b 5c             	lea    0x5c(%ebx),%edi
  asm volatile("cld; rep insl" :
80102302:	b9 18 01 00 00       	mov    $0x118,%ecx
80102307:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010230c:	fc                   	cld
8010230d:	f3 6d                	rep insl (%dx),%es:(%edi)

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
8010230f:	8b 33                	mov    (%ebx),%esi
  b->flags &= ~B_DIRTY;
80102311:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
80102314:	83 ec 0c             	sub    $0xc,%esp
  b->flags &= ~B_DIRTY;
80102317:	83 ce 02             	or     $0x2,%esi
8010231a:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
8010231c:	53                   	push   %ebx
8010231d:	e8 1e 1e 00 00       	call   80104140 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102322:	a1 e4 68 11 80       	mov    0x801168e4,%eax
80102327:	83 c4 10             	add    $0x10,%esp
8010232a:	85 c0                	test   %eax,%eax
8010232c:	74 05                	je     80102333 <ideintr+0x83>
    idestart(idequeue);
8010232e:	e8 0d fe ff ff       	call   80102140 <idestart>
    release(&idelock);
80102333:	83 ec 0c             	sub    $0xc,%esp
80102336:	68 00 69 11 80       	push   $0x80116900
8010233b:	e8 50 33 00 00       	call   80105690 <release>

  release(&idelock);
}
80102340:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102343:	5b                   	pop    %ebx
80102344:	5e                   	pop    %esi
80102345:	5f                   	pop    %edi
80102346:	5d                   	pop    %ebp
80102347:	c3                   	ret
80102348:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010234f:	00 

80102350 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102350:	55                   	push   %ebp
80102351:	89 e5                	mov    %esp,%ebp
80102353:	53                   	push   %ebx
80102354:	83 ec 10             	sub    $0x10,%esp
80102357:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010235a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010235d:	50                   	push   %eax
8010235e:	e8 4d 31 00 00       	call   801054b0 <holdingsleep>
80102363:	83 c4 10             	add    $0x10,%esp
80102366:	85 c0                	test   %eax,%eax
80102368:	0f 84 c3 00 00 00    	je     80102431 <iderw+0xe1>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010236e:	8b 03                	mov    (%ebx),%eax
80102370:	83 e0 06             	and    $0x6,%eax
80102373:	83 f8 02             	cmp    $0x2,%eax
80102376:	0f 84 a8 00 00 00    	je     80102424 <iderw+0xd4>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010237c:	8b 53 04             	mov    0x4(%ebx),%edx
8010237f:	85 d2                	test   %edx,%edx
80102381:	74 0d                	je     80102390 <iderw+0x40>
80102383:	a1 e0 68 11 80       	mov    0x801168e0,%eax
80102388:	85 c0                	test   %eax,%eax
8010238a:	0f 84 87 00 00 00    	je     80102417 <iderw+0xc7>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102390:	83 ec 0c             	sub    $0xc,%esp
80102393:	68 00 69 11 80       	push   $0x80116900
80102398:	e8 53 33 00 00       	call   801056f0 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010239d:	a1 e4 68 11 80       	mov    0x801168e4,%eax
  b->qnext = 0;
801023a2:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801023a9:	83 c4 10             	add    $0x10,%esp
801023ac:	85 c0                	test   %eax,%eax
801023ae:	74 60                	je     80102410 <iderw+0xc0>
801023b0:	89 c2                	mov    %eax,%edx
801023b2:	8b 40 58             	mov    0x58(%eax),%eax
801023b5:	85 c0                	test   %eax,%eax
801023b7:	75 f7                	jne    801023b0 <iderw+0x60>
801023b9:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
801023bc:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
801023be:	39 1d e4 68 11 80    	cmp    %ebx,0x801168e4
801023c4:	74 3a                	je     80102400 <iderw+0xb0>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801023c6:	8b 03                	mov    (%ebx),%eax
801023c8:	83 e0 06             	and    $0x6,%eax
801023cb:	83 f8 02             	cmp    $0x2,%eax
801023ce:	74 1b                	je     801023eb <iderw+0x9b>
    sleep(b, &idelock);
801023d0:	83 ec 08             	sub    $0x8,%esp
801023d3:	68 00 69 11 80       	push   $0x80116900
801023d8:	53                   	push   %ebx
801023d9:	e8 a2 1c 00 00       	call   80104080 <sleep>
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801023de:	8b 03                	mov    (%ebx),%eax
801023e0:	83 c4 10             	add    $0x10,%esp
801023e3:	83 e0 06             	and    $0x6,%eax
801023e6:	83 f8 02             	cmp    $0x2,%eax
801023e9:	75 e5                	jne    801023d0 <iderw+0x80>
  }


  release(&idelock);
801023eb:	c7 45 08 00 69 11 80 	movl   $0x80116900,0x8(%ebp)
}
801023f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801023f5:	c9                   	leave
  release(&idelock);
801023f6:	e9 95 32 00 00       	jmp    80105690 <release>
801023fb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    idestart(b);
80102400:	89 d8                	mov    %ebx,%eax
80102402:	e8 39 fd ff ff       	call   80102140 <idestart>
80102407:	eb bd                	jmp    801023c6 <iderw+0x76>
80102409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
80102410:	ba e4 68 11 80       	mov    $0x801168e4,%edx
80102415:	eb a5                	jmp    801023bc <iderw+0x6c>
    panic("iderw: ide disk 1 not present");
80102417:	83 ec 0c             	sub    $0xc,%esp
8010241a:	68 0e 76 10 80       	push   $0x8010760e
8010241f:	e8 5c df ff ff       	call   80100380 <panic>
    panic("iderw: nothing to do");
80102424:	83 ec 0c             	sub    $0xc,%esp
80102427:	68 f9 75 10 80       	push   $0x801075f9
8010242c:	e8 4f df ff ff       	call   80100380 <panic>
    panic("iderw: buf not locked");
80102431:	83 ec 0c             	sub    $0xc,%esp
80102434:	68 e3 75 10 80       	push   $0x801075e3
80102439:	e8 42 df ff ff       	call   80100380 <panic>
8010243e:	66 90                	xchg   %ax,%ax

80102440 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102440:	55                   	push   %ebp
80102441:	89 e5                	mov    %esp,%ebp
80102443:	56                   	push   %esi
80102444:	53                   	push   %ebx
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
80102445:	c7 05 34 69 11 80 00 	movl   $0xfec00000,0x80116934
8010244c:	00 c0 fe 
  ioapic->reg = reg;
8010244f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102456:	00 00 00 
  return ioapic->data;
80102459:	8b 15 34 69 11 80    	mov    0x80116934,%edx
8010245f:	8b 72 10             	mov    0x10(%edx),%esi
  ioapic->reg = reg;
80102462:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
80102468:	8b 1d 34 69 11 80    	mov    0x80116934,%ebx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010246e:	0f b6 15 80 6a 11 80 	movzbl 0x80116a80,%edx
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102475:	c1 ee 10             	shr    $0x10,%esi
80102478:	89 f0                	mov    %esi,%eax
8010247a:	0f b6 f0             	movzbl %al,%esi
  return ioapic->data;
8010247d:	8b 43 10             	mov    0x10(%ebx),%eax
  id = ioapicread(REG_ID) >> 24;
80102480:	c1 e8 18             	shr    $0x18,%eax
  if(id != ioapicid)
80102483:	39 c2                	cmp    %eax,%edx
80102485:	74 16                	je     8010249d <ioapicinit+0x5d>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102487:	83 ec 0c             	sub    $0xc,%esp
8010248a:	68 a8 79 10 80       	push   $0x801079a8
8010248f:	e8 1c e2 ff ff       	call   801006b0 <cprintf>
  ioapic->reg = reg;
80102494:	8b 1d 34 69 11 80    	mov    0x80116934,%ebx
8010249a:	83 c4 10             	add    $0x10,%esp
{
8010249d:	ba 10 00 00 00       	mov    $0x10,%edx
801024a2:	31 c0                	xor    %eax,%eax
801024a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ioapic->reg = reg;
801024a8:	89 13                	mov    %edx,(%ebx)
801024aa:	8d 48 20             	lea    0x20(%eax),%ecx
  ioapic->data = data;
801024ad:	8b 1d 34 69 11 80    	mov    0x80116934,%ebx

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
801024b3:	83 c0 01             	add    $0x1,%eax
801024b6:	81 c9 00 00 01 00    	or     $0x10000,%ecx
  ioapic->data = data;
801024bc:	89 4b 10             	mov    %ecx,0x10(%ebx)
  ioapic->reg = reg;
801024bf:	8d 4a 01             	lea    0x1(%edx),%ecx
  for(i = 0; i <= maxintr; i++){
801024c2:	83 c2 02             	add    $0x2,%edx
  ioapic->reg = reg;
801024c5:	89 0b                	mov    %ecx,(%ebx)
  ioapic->data = data;
801024c7:	8b 1d 34 69 11 80    	mov    0x80116934,%ebx
801024cd:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
  for(i = 0; i <= maxintr; i++){
801024d4:	39 c6                	cmp    %eax,%esi
801024d6:	7d d0                	jge    801024a8 <ioapicinit+0x68>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
801024d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024db:	5b                   	pop    %ebx
801024dc:	5e                   	pop    %esi
801024dd:	5d                   	pop    %ebp
801024de:	c3                   	ret
801024df:	90                   	nop

801024e0 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
801024e0:	55                   	push   %ebp
  ioapic->reg = reg;
801024e1:	8b 0d 34 69 11 80    	mov    0x80116934,%ecx
{
801024e7:	89 e5                	mov    %esp,%ebp
801024e9:	8b 45 08             	mov    0x8(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
801024ec:	8d 50 20             	lea    0x20(%eax),%edx
801024ef:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
  ioapic->reg = reg;
801024f3:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801024f5:	8b 0d 34 69 11 80    	mov    0x80116934,%ecx
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801024fb:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
801024fe:	89 51 10             	mov    %edx,0x10(%ecx)
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102501:	8b 55 0c             	mov    0xc(%ebp),%edx
  ioapic->reg = reg;
80102504:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102506:	a1 34 69 11 80       	mov    0x80116934,%eax
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010250b:	c1 e2 18             	shl    $0x18,%edx
  ioapic->data = data;
8010250e:	89 50 10             	mov    %edx,0x10(%eax)
}
80102511:	5d                   	pop    %ebp
80102512:	c3                   	ret
80102513:	66 90                	xchg   %ax,%ax
80102515:	66 90                	xchg   %ax,%ax
80102517:	66 90                	xchg   %ax,%ax
80102519:	66 90                	xchg   %ax,%ax
8010251b:	66 90                	xchg   %ax,%ax
8010251d:	66 90                	xchg   %ax,%ax
8010251f:	90                   	nop

80102520 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102520:	55                   	push   %ebp
80102521:	89 e5                	mov    %esp,%ebp
80102523:	53                   	push   %ebx
80102524:	83 ec 04             	sub    $0x4,%esp
80102527:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
8010252a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102530:	75 76                	jne    801025a8 <kfree+0x88>
80102532:	81 fb d0 ac 11 80    	cmp    $0x8011acd0,%ebx
80102538:	72 6e                	jb     801025a8 <kfree+0x88>
8010253a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102540:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102545:	77 61                	ja     801025a8 <kfree+0x88>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102547:	83 ec 04             	sub    $0x4,%esp
8010254a:	68 00 10 00 00       	push   $0x1000
8010254f:	6a 01                	push   $0x1
80102551:	53                   	push   %ebx
80102552:	e8 99 32 00 00       	call   801057f0 <memset>

  if(kmem.use_lock)
80102557:	8b 15 74 69 11 80    	mov    0x80116974,%edx
8010255d:	83 c4 10             	add    $0x10,%esp
80102560:	85 d2                	test   %edx,%edx
80102562:	75 1c                	jne    80102580 <kfree+0x60>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102564:	a1 78 69 11 80       	mov    0x80116978,%eax
80102569:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
8010256b:	a1 74 69 11 80       	mov    0x80116974,%eax
  kmem.freelist = r;
80102570:	89 1d 78 69 11 80    	mov    %ebx,0x80116978
  if(kmem.use_lock)
80102576:	85 c0                	test   %eax,%eax
80102578:	75 1e                	jne    80102598 <kfree+0x78>
    release(&kmem.lock);
}
8010257a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010257d:	c9                   	leave
8010257e:	c3                   	ret
8010257f:	90                   	nop
    acquire(&kmem.lock);
80102580:	83 ec 0c             	sub    $0xc,%esp
80102583:	68 40 69 11 80       	push   $0x80116940
80102588:	e8 63 31 00 00       	call   801056f0 <acquire>
8010258d:	83 c4 10             	add    $0x10,%esp
80102590:	eb d2                	jmp    80102564 <kfree+0x44>
80102592:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    release(&kmem.lock);
80102598:	c7 45 08 40 69 11 80 	movl   $0x80116940,0x8(%ebp)
}
8010259f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801025a2:	c9                   	leave
    release(&kmem.lock);
801025a3:	e9 e8 30 00 00       	jmp    80105690 <release>
    panic("kfree");
801025a8:	83 ec 0c             	sub    $0xc,%esp
801025ab:	68 2c 76 10 80       	push   $0x8010762c
801025b0:	e8 cb dd ff ff       	call   80100380 <panic>
801025b5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801025bc:	00 
801025bd:	8d 76 00             	lea    0x0(%esi),%esi

801025c0 <freerange>:
{
801025c0:	55                   	push   %ebp
801025c1:	89 e5                	mov    %esp,%ebp
801025c3:	56                   	push   %esi
801025c4:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
801025c5:	8b 45 08             	mov    0x8(%ebp),%eax
{
801025c8:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
801025cb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801025d1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025d7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801025dd:	39 de                	cmp    %ebx,%esi
801025df:	72 23                	jb     80102604 <freerange+0x44>
801025e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
801025e8:	83 ec 0c             	sub    $0xc,%esp
801025eb:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025f1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801025f7:	50                   	push   %eax
801025f8:	e8 23 ff ff ff       	call   80102520 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025fd:	83 c4 10             	add    $0x10,%esp
80102600:	39 de                	cmp    %ebx,%esi
80102602:	73 e4                	jae    801025e8 <freerange+0x28>
}
80102604:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102607:	5b                   	pop    %ebx
80102608:	5e                   	pop    %esi
80102609:	5d                   	pop    %ebp
8010260a:	c3                   	ret
8010260b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80102610 <kinit2>:
{
80102610:	55                   	push   %ebp
80102611:	89 e5                	mov    %esp,%ebp
80102613:	56                   	push   %esi
80102614:	53                   	push   %ebx
  p = (char*)PGROUNDUP((uint)vstart);
80102615:	8b 45 08             	mov    0x8(%ebp),%eax
{
80102618:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
8010261b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102621:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102627:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010262d:	39 de                	cmp    %ebx,%esi
8010262f:	72 23                	jb     80102654 <kinit2+0x44>
80102631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102638:	83 ec 0c             	sub    $0xc,%esp
8010263b:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102641:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102647:	50                   	push   %eax
80102648:	e8 d3 fe ff ff       	call   80102520 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010264d:	83 c4 10             	add    $0x10,%esp
80102650:	39 de                	cmp    %ebx,%esi
80102652:	73 e4                	jae    80102638 <kinit2+0x28>
  kmem.use_lock = 1;
80102654:	c7 05 74 69 11 80 01 	movl   $0x1,0x80116974
8010265b:	00 00 00 
}
8010265e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102661:	5b                   	pop    %ebx
80102662:	5e                   	pop    %esi
80102663:	5d                   	pop    %ebp
80102664:	c3                   	ret
80102665:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010266c:	00 
8010266d:	8d 76 00             	lea    0x0(%esi),%esi

80102670 <kinit1>:
{
80102670:	55                   	push   %ebp
80102671:	89 e5                	mov    %esp,%ebp
80102673:	56                   	push   %esi
80102674:	53                   	push   %ebx
80102675:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
80102678:	83 ec 08             	sub    $0x8,%esp
8010267b:	68 32 76 10 80       	push   $0x80107632
80102680:	68 40 69 11 80       	push   $0x80116940
80102685:	e8 76 2e 00 00       	call   80105500 <initlock>
  p = (char*)PGROUNDUP((uint)vstart);
8010268a:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010268d:	83 c4 10             	add    $0x10,%esp
  kmem.use_lock = 0;
80102690:	c7 05 74 69 11 80 00 	movl   $0x0,0x80116974
80102697:	00 00 00 
  p = (char*)PGROUNDUP((uint)vstart);
8010269a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801026a0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801026a6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801026ac:	39 de                	cmp    %ebx,%esi
801026ae:	72 1c                	jb     801026cc <kinit1+0x5c>
    kfree(p);
801026b0:	83 ec 0c             	sub    $0xc,%esp
801026b3:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801026b9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801026bf:	50                   	push   %eax
801026c0:	e8 5b fe ff ff       	call   80102520 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801026c5:	83 c4 10             	add    $0x10,%esp
801026c8:	39 de                	cmp    %ebx,%esi
801026ca:	73 e4                	jae    801026b0 <kinit1+0x40>
}
801026cc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801026cf:	5b                   	pop    %ebx
801026d0:	5e                   	pop    %esi
801026d1:	5d                   	pop    %ebp
801026d2:	c3                   	ret
801026d3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801026da:	00 
801026db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801026e0 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
801026e0:	55                   	push   %ebp
801026e1:	89 e5                	mov    %esp,%ebp
801026e3:	53                   	push   %ebx
801026e4:	83 ec 04             	sub    $0x4,%esp
  struct run *r;

  if(kmem.use_lock)
801026e7:	a1 74 69 11 80       	mov    0x80116974,%eax
801026ec:	85 c0                	test   %eax,%eax
801026ee:	75 20                	jne    80102710 <kalloc+0x30>
    acquire(&kmem.lock);
  r = kmem.freelist;
801026f0:	8b 1d 78 69 11 80    	mov    0x80116978,%ebx
  if(r)
801026f6:	85 db                	test   %ebx,%ebx
801026f8:	74 07                	je     80102701 <kalloc+0x21>
    kmem.freelist = r->next;
801026fa:	8b 03                	mov    (%ebx),%eax
801026fc:	a3 78 69 11 80       	mov    %eax,0x80116978
  if(kmem.use_lock)
    release(&kmem.lock);
  return (char*)r;
}
80102701:	89 d8                	mov    %ebx,%eax
80102703:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102706:	c9                   	leave
80102707:	c3                   	ret
80102708:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010270f:	00 
    acquire(&kmem.lock);
80102710:	83 ec 0c             	sub    $0xc,%esp
80102713:	68 40 69 11 80       	push   $0x80116940
80102718:	e8 d3 2f 00 00       	call   801056f0 <acquire>
  r = kmem.freelist;
8010271d:	8b 1d 78 69 11 80    	mov    0x80116978,%ebx
  if(kmem.use_lock)
80102723:	a1 74 69 11 80       	mov    0x80116974,%eax
  if(r)
80102728:	83 c4 10             	add    $0x10,%esp
8010272b:	85 db                	test   %ebx,%ebx
8010272d:	74 08                	je     80102737 <kalloc+0x57>
    kmem.freelist = r->next;
8010272f:	8b 13                	mov    (%ebx),%edx
80102731:	89 15 78 69 11 80    	mov    %edx,0x80116978
  if(kmem.use_lock)
80102737:	85 c0                	test   %eax,%eax
80102739:	74 c6                	je     80102701 <kalloc+0x21>
    release(&kmem.lock);
8010273b:	83 ec 0c             	sub    $0xc,%esp
8010273e:	68 40 69 11 80       	push   $0x80116940
80102743:	e8 48 2f 00 00       	call   80105690 <release>
}
80102748:	89 d8                	mov    %ebx,%eax
    release(&kmem.lock);
8010274a:	83 c4 10             	add    $0x10,%esp
}
8010274d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102750:	c9                   	leave
80102751:	c3                   	ret
80102752:	66 90                	xchg   %ax,%ax
80102754:	66 90                	xchg   %ax,%ax
80102756:	66 90                	xchg   %ax,%ax
80102758:	66 90                	xchg   %ax,%ax
8010275a:	66 90                	xchg   %ax,%ax
8010275c:	66 90                	xchg   %ax,%ax
8010275e:	66 90                	xchg   %ax,%ax

80102760 <kbdgetc>:
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102760:	ba 64 00 00 00       	mov    $0x64,%edx
80102765:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102766:	a8 01                	test   $0x1,%al
80102768:	0f 84 c2 00 00 00    	je     80102830 <kbdgetc+0xd0>
{
8010276e:	55                   	push   %ebp
8010276f:	ba 60 00 00 00       	mov    $0x60,%edx
80102774:	89 e5                	mov    %esp,%ebp
80102776:	53                   	push   %ebx
80102777:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
80102778:	8b 1d 7c 69 11 80    	mov    0x8011697c,%ebx
  data = inb(KBDATAP);
8010277e:	0f b6 c8             	movzbl %al,%ecx
  if(data == 0xE0){
80102781:	3c e0                	cmp    $0xe0,%al
80102783:	74 5b                	je     801027e0 <kbdgetc+0x80>
    return 0;
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
80102785:	89 da                	mov    %ebx,%edx
80102787:	83 e2 40             	and    $0x40,%edx
  } else if(data & 0x80){
8010278a:	84 c0                	test   %al,%al
8010278c:	78 62                	js     801027f0 <kbdgetc+0x90>
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
8010278e:	85 d2                	test   %edx,%edx
80102790:	74 09                	je     8010279b <kbdgetc+0x3b>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102792:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
80102795:	83 e3 bf             	and    $0xffffffbf,%ebx
    data |= 0x80;
80102798:	0f b6 c8             	movzbl %al,%ecx
  }

  shift |= shiftcode[data];
8010279b:	0f b6 91 80 7c 10 80 	movzbl -0x7fef8380(%ecx),%edx
  shift ^= togglecode[data];
801027a2:	0f b6 81 80 7b 10 80 	movzbl -0x7fef8480(%ecx),%eax
  shift |= shiftcode[data];
801027a9:	09 da                	or     %ebx,%edx
  shift ^= togglecode[data];
801027ab:	31 c2                	xor    %eax,%edx
  c = charcode[shift & (CTL | SHIFT)][data];
801027ad:	89 d0                	mov    %edx,%eax
  shift ^= togglecode[data];
801027af:	89 15 7c 69 11 80    	mov    %edx,0x8011697c
  c = charcode[shift & (CTL | SHIFT)][data];
801027b5:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
801027b8:	83 e2 08             	and    $0x8,%edx
  c = charcode[shift & (CTL | SHIFT)][data];
801027bb:	8b 04 85 60 7b 10 80 	mov    -0x7fef84a0(,%eax,4),%eax
801027c2:	0f b6 04 08          	movzbl (%eax,%ecx,1),%eax
  if(shift & CAPSLOCK){
801027c6:	74 0b                	je     801027d3 <kbdgetc+0x73>
    if('a' <= c && c <= 'z')
801027c8:	8d 50 9f             	lea    -0x61(%eax),%edx
801027cb:	83 fa 19             	cmp    $0x19,%edx
801027ce:	77 48                	ja     80102818 <kbdgetc+0xb8>
      c += 'A' - 'a';
801027d0:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801027d3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801027d6:	c9                   	leave
801027d7:	c3                   	ret
801027d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801027df:	00 
    shift |= E0ESC;
801027e0:	83 cb 40             	or     $0x40,%ebx
    return 0;
801027e3:	31 c0                	xor    %eax,%eax
    shift |= E0ESC;
801027e5:	89 1d 7c 69 11 80    	mov    %ebx,0x8011697c
}
801027eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801027ee:	c9                   	leave
801027ef:	c3                   	ret
    data = (shift & E0ESC ? data : data & 0x7F);
801027f0:	83 e0 7f             	and    $0x7f,%eax
801027f3:	85 d2                	test   %edx,%edx
801027f5:	0f 44 c8             	cmove  %eax,%ecx
    shift &= ~(shiftcode[data] | E0ESC);
801027f8:	0f b6 81 80 7c 10 80 	movzbl -0x7fef8380(%ecx),%eax
801027ff:	83 c8 40             	or     $0x40,%eax
80102802:	0f b6 c0             	movzbl %al,%eax
80102805:	f7 d0                	not    %eax
80102807:	21 d8                	and    %ebx,%eax
80102809:	a3 7c 69 11 80       	mov    %eax,0x8011697c
    return 0;
8010280e:	31 c0                	xor    %eax,%eax
80102810:	eb d9                	jmp    801027eb <kbdgetc+0x8b>
80102812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    else if('A' <= c && c <= 'Z')
80102818:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
8010281b:	8d 50 20             	lea    0x20(%eax),%edx
}
8010281e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102821:	c9                   	leave
      c += 'a' - 'A';
80102822:	83 f9 1a             	cmp    $0x1a,%ecx
80102825:	0f 42 c2             	cmovb  %edx,%eax
}
80102828:	c3                   	ret
80102829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80102830:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80102835:	c3                   	ret
80102836:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010283d:	00 
8010283e:	66 90                	xchg   %ax,%ax

80102840 <kbdintr>:

void
kbdintr(void)
{
80102840:	55                   	push   %ebp
80102841:	89 e5                	mov    %esp,%ebp
80102843:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
80102846:	68 60 27 10 80       	push   $0x80102760
8010284b:	e8 50 e0 ff ff       	call   801008a0 <consoleintr>
}
80102850:	83 c4 10             	add    $0x10,%esp
80102853:	c9                   	leave
80102854:	c3                   	ret
80102855:	66 90                	xchg   %ax,%ax
80102857:	66 90                	xchg   %ax,%ax
80102859:	66 90                	xchg   %ax,%ax
8010285b:	66 90                	xchg   %ax,%ax
8010285d:	66 90                	xchg   %ax,%ax
8010285f:	90                   	nop

80102860 <lapicinit>:
}

void
lapicinit(void)
{
  if(!lapic)
80102860:	a1 80 69 11 80       	mov    0x80116980,%eax
80102865:	85 c0                	test   %eax,%eax
80102867:	0f 84 c3 00 00 00    	je     80102930 <lapicinit+0xd0>
  lapic[index] = value;
8010286d:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102874:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102877:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
8010287a:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102881:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102884:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102887:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
8010288e:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
80102891:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102894:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010289b:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
8010289e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801028a1:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
801028a8:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801028ab:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801028ae:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801028b5:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801028b8:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
801028bb:	8b 50 30             	mov    0x30(%eax),%edx
801028be:	81 e2 00 00 fc 00    	and    $0xfc0000,%edx
801028c4:	75 72                	jne    80102938 <lapicinit+0xd8>
  lapic[index] = value;
801028c6:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801028cd:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801028d0:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801028d3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801028da:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801028dd:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801028e0:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801028e7:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801028ea:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801028ed:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801028f4:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801028f7:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
801028fa:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102901:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102904:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102907:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
8010290e:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
80102911:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
80102914:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102918:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
8010291e:	80 e6 10             	and    $0x10,%dh
80102921:	75 f5                	jne    80102918 <lapicinit+0xb8>
  lapic[index] = value;
80102923:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
8010292a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010292d:	8b 40 20             	mov    0x20(%eax),%eax
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102930:	c3                   	ret
80102931:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  lapic[index] = value;
80102938:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
8010293f:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
80102942:	8b 50 20             	mov    0x20(%eax),%edx
}
80102945:	e9 7c ff ff ff       	jmp    801028c6 <lapicinit+0x66>
8010294a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102950 <lapicid>:

int
lapicid(void)
{
  if (!lapic)
80102950:	a1 80 69 11 80       	mov    0x80116980,%eax
80102955:	85 c0                	test   %eax,%eax
80102957:	74 07                	je     80102960 <lapicid+0x10>
    return 0;
  return lapic[ID] >> 24;
80102959:	8b 40 20             	mov    0x20(%eax),%eax
8010295c:	c1 e8 18             	shr    $0x18,%eax
8010295f:	c3                   	ret
    return 0;
80102960:	31 c0                	xor    %eax,%eax
}
80102962:	c3                   	ret
80102963:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010296a:	00 
8010296b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80102970 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102970:	a1 80 69 11 80       	mov    0x80116980,%eax
80102975:	85 c0                	test   %eax,%eax
80102977:	74 0d                	je     80102986 <lapiceoi+0x16>
  lapic[index] = value;
80102979:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102980:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102983:	8b 40 20             	mov    0x20(%eax),%eax
    lapicw(EOI, 0);
}
80102986:	c3                   	ret
80102987:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010298e:	00 
8010298f:	90                   	nop

80102990 <microdelay>:
// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
}
80102990:	c3                   	ret
80102991:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102998:	00 
80102999:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801029a0 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
801029a0:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801029a1:	b8 0f 00 00 00       	mov    $0xf,%eax
801029a6:	ba 70 00 00 00       	mov    $0x70,%edx
801029ab:	89 e5                	mov    %esp,%ebp
801029ad:	53                   	push   %ebx
801029ae:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801029b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801029b4:	ee                   	out    %al,(%dx)
801029b5:	b8 0a 00 00 00       	mov    $0xa,%eax
801029ba:	ba 71 00 00 00       	mov    $0x71,%edx
801029bf:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
801029c0:	31 c0                	xor    %eax,%eax
  lapic[index] = value;
801029c2:	c1 e3 18             	shl    $0x18,%ebx
  wrv[0] = 0;
801029c5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
801029cb:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
801029cd:	c1 e9 0c             	shr    $0xc,%ecx
  lapic[index] = value;
801029d0:	89 da                	mov    %ebx,%edx
  wrv[1] = addr >> 4;
801029d2:	c1 e8 04             	shr    $0x4,%eax
    lapicw(ICRLO, STARTUP | (addr>>12));
801029d5:	80 cd 06             	or     $0x6,%ch
  wrv[1] = addr >> 4;
801029d8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
  lapic[index] = value;
801029de:	a1 80 69 11 80       	mov    0x80116980,%eax
801029e3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801029e9:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801029ec:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801029f3:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
801029f6:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
801029f9:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102a00:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102a03:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102a06:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102a0c:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102a0f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102a15:	8b 58 20             	mov    0x20(%eax),%ebx
  lapic[index] = value;
80102a18:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102a1e:	8b 50 20             	mov    0x20(%eax),%edx
  lapic[index] = value;
80102a21:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102a27:	8b 40 20             	mov    0x20(%eax),%eax
    microdelay(200);
  }
}
80102a2a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102a2d:	c9                   	leave
80102a2e:	c3                   	ret
80102a2f:	90                   	nop

80102a30 <cmostime>:
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void
cmostime(struct rtcdate *r)
{
80102a30:	55                   	push   %ebp
80102a31:	b8 0b 00 00 00       	mov    $0xb,%eax
80102a36:	ba 70 00 00 00       	mov    $0x70,%edx
80102a3b:	89 e5                	mov    %esp,%ebp
80102a3d:	57                   	push   %edi
80102a3e:	56                   	push   %esi
80102a3f:	53                   	push   %ebx
80102a40:	83 ec 4c             	sub    $0x4c,%esp
80102a43:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a44:	ba 71 00 00 00       	mov    $0x71,%edx
80102a49:	ec                   	in     (%dx),%al
  struct rtcdate t1, t2;
  int sb, bcd;

  sb = cmos_read(CMOS_STATB);

  bcd = (sb & (1 << 2)) == 0;
80102a4a:	83 e0 04             	and    $0x4,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a4d:	bf 70 00 00 00       	mov    $0x70,%edi
80102a52:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102a55:	8d 76 00             	lea    0x0(%esi),%esi
80102a58:	31 c0                	xor    %eax,%eax
80102a5a:	89 fa                	mov    %edi,%edx
80102a5c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a5d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102a62:	89 ca                	mov    %ecx,%edx
80102a64:	ec                   	in     (%dx),%al
80102a65:	88 45 b7             	mov    %al,-0x49(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a68:	89 fa                	mov    %edi,%edx
80102a6a:	b8 02 00 00 00       	mov    $0x2,%eax
80102a6f:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a70:	89 ca                	mov    %ecx,%edx
80102a72:	ec                   	in     (%dx),%al
80102a73:	88 45 b6             	mov    %al,-0x4a(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a76:	89 fa                	mov    %edi,%edx
80102a78:	b8 04 00 00 00       	mov    $0x4,%eax
80102a7d:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a7e:	89 ca                	mov    %ecx,%edx
80102a80:	ec                   	in     (%dx),%al
80102a81:	88 45 b5             	mov    %al,-0x4b(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a84:	89 fa                	mov    %edi,%edx
80102a86:	b8 07 00 00 00       	mov    $0x7,%eax
80102a8b:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a8c:	89 ca                	mov    %ecx,%edx
80102a8e:	ec                   	in     (%dx),%al
80102a8f:	88 45 b4             	mov    %al,-0x4c(%ebp)
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a92:	89 fa                	mov    %edi,%edx
80102a94:	b8 08 00 00 00       	mov    $0x8,%eax
80102a99:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a9a:	89 ca                	mov    %ecx,%edx
80102a9c:	ec                   	in     (%dx),%al
80102a9d:	89 c6                	mov    %eax,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a9f:	89 fa                	mov    %edi,%edx
80102aa1:	b8 09 00 00 00       	mov    $0x9,%eax
80102aa6:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102aa7:	89 ca                	mov    %ecx,%edx
80102aa9:	ec                   	in     (%dx),%al
80102aaa:	0f b6 d8             	movzbl %al,%ebx
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102aad:	89 fa                	mov    %edi,%edx
80102aaf:	b8 0a 00 00 00       	mov    $0xa,%eax
80102ab4:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102ab5:	89 ca                	mov    %ecx,%edx
80102ab7:	ec                   	in     (%dx),%al

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102ab8:	84 c0                	test   %al,%al
80102aba:	78 9c                	js     80102a58 <cmostime+0x28>
  return inb(CMOS_RETURN);
80102abc:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
80102ac0:	89 f2                	mov    %esi,%edx
80102ac2:	89 5d cc             	mov    %ebx,-0x34(%ebp)
80102ac5:	0f b6 f2             	movzbl %dl,%esi
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102ac8:	89 fa                	mov    %edi,%edx
80102aca:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102acd:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
80102ad1:	89 75 c8             	mov    %esi,-0x38(%ebp)
80102ad4:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102ad7:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
80102adb:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102ade:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
80102ae2:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102ae5:	31 c0                	xor    %eax,%eax
80102ae7:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102ae8:	89 ca                	mov    %ecx,%edx
80102aea:	ec                   	in     (%dx),%al
80102aeb:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102aee:	89 fa                	mov    %edi,%edx
80102af0:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102af3:	b8 02 00 00 00       	mov    $0x2,%eax
80102af8:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102af9:	89 ca                	mov    %ecx,%edx
80102afb:	ec                   	in     (%dx),%al
80102afc:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102aff:	89 fa                	mov    %edi,%edx
80102b01:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102b04:	b8 04 00 00 00       	mov    $0x4,%eax
80102b09:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b0a:	89 ca                	mov    %ecx,%edx
80102b0c:	ec                   	in     (%dx),%al
80102b0d:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102b10:	89 fa                	mov    %edi,%edx
80102b12:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102b15:	b8 07 00 00 00       	mov    $0x7,%eax
80102b1a:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b1b:	89 ca                	mov    %ecx,%edx
80102b1d:	ec                   	in     (%dx),%al
80102b1e:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102b21:	89 fa                	mov    %edi,%edx
80102b23:	89 45 dc             	mov    %eax,-0x24(%ebp)
80102b26:	b8 08 00 00 00       	mov    $0x8,%eax
80102b2b:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b2c:	89 ca                	mov    %ecx,%edx
80102b2e:	ec                   	in     (%dx),%al
80102b2f:	0f b6 c0             	movzbl %al,%eax
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102b32:	89 fa                	mov    %edi,%edx
80102b34:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102b37:	b8 09 00 00 00       	mov    $0x9,%eax
80102b3c:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102b3d:	89 ca                	mov    %ecx,%edx
80102b3f:	ec                   	in     (%dx),%al
80102b40:	0f b6 c0             	movzbl %al,%eax
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102b43:	83 ec 04             	sub    $0x4,%esp
  return inb(CMOS_RETURN);
80102b46:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102b49:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102b4c:	6a 18                	push   $0x18
80102b4e:	50                   	push   %eax
80102b4f:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102b52:	50                   	push   %eax
80102b53:	e8 d8 2c 00 00       	call   80105830 <memcmp>
80102b58:	83 c4 10             	add    $0x10,%esp
80102b5b:	85 c0                	test   %eax,%eax
80102b5d:	0f 85 f5 fe ff ff    	jne    80102a58 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
80102b63:	0f b6 75 b3          	movzbl -0x4d(%ebp),%esi
80102b67:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102b6a:	89 f0                	mov    %esi,%eax
80102b6c:	84 c0                	test   %al,%al
80102b6e:	75 78                	jne    80102be8 <cmostime+0x1b8>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
80102b70:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102b73:	89 c2                	mov    %eax,%edx
80102b75:	83 e0 0f             	and    $0xf,%eax
80102b78:	c1 ea 04             	shr    $0x4,%edx
80102b7b:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b7e:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b81:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
80102b84:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102b87:	89 c2                	mov    %eax,%edx
80102b89:	83 e0 0f             	and    $0xf,%eax
80102b8c:	c1 ea 04             	shr    $0x4,%edx
80102b8f:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b92:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b95:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102b98:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102b9b:	89 c2                	mov    %eax,%edx
80102b9d:	83 e0 0f             	and    $0xf,%eax
80102ba0:	c1 ea 04             	shr    $0x4,%edx
80102ba3:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102ba6:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102ba9:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102bac:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102baf:	89 c2                	mov    %eax,%edx
80102bb1:	83 e0 0f             	and    $0xf,%eax
80102bb4:	c1 ea 04             	shr    $0x4,%edx
80102bb7:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102bba:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102bbd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
80102bc0:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102bc3:	89 c2                	mov    %eax,%edx
80102bc5:	83 e0 0f             	and    $0xf,%eax
80102bc8:	c1 ea 04             	shr    $0x4,%edx
80102bcb:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102bce:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102bd1:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
80102bd4:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102bd7:	89 c2                	mov    %eax,%edx
80102bd9:	83 e0 0f             	and    $0xf,%eax
80102bdc:	c1 ea 04             	shr    $0x4,%edx
80102bdf:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102be2:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102be5:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102be8:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102beb:	89 03                	mov    %eax,(%ebx)
80102bed:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102bf0:	89 43 04             	mov    %eax,0x4(%ebx)
80102bf3:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102bf6:	89 43 08             	mov    %eax,0x8(%ebx)
80102bf9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102bfc:	89 43 0c             	mov    %eax,0xc(%ebx)
80102bff:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102c02:	89 43 10             	mov    %eax,0x10(%ebx)
80102c05:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102c08:	89 43 14             	mov    %eax,0x14(%ebx)
  r->year += 2000;
80102c0b:	81 43 14 d0 07 00 00 	addl   $0x7d0,0x14(%ebx)
}
80102c12:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102c15:	5b                   	pop    %ebx
80102c16:	5e                   	pop    %esi
80102c17:	5f                   	pop    %edi
80102c18:	5d                   	pop    %ebp
80102c19:	c3                   	ret
80102c1a:	66 90                	xchg   %ax,%ax
80102c1c:	66 90                	xchg   %ax,%ax
80102c1e:	66 90                	xchg   %ax,%ax

80102c20 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c20:	8b 0d e8 69 11 80    	mov    0x801169e8,%ecx
80102c26:	85 c9                	test   %ecx,%ecx
80102c28:	0f 8e 8a 00 00 00    	jle    80102cb8 <install_trans+0x98>
{
80102c2e:	55                   	push   %ebp
80102c2f:	89 e5                	mov    %esp,%ebp
80102c31:	57                   	push   %edi
  for (tail = 0; tail < log.lh.n; tail++) {
80102c32:	31 ff                	xor    %edi,%edi
{
80102c34:	56                   	push   %esi
80102c35:	53                   	push   %ebx
80102c36:	83 ec 0c             	sub    $0xc,%esp
80102c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102c40:	a1 d4 69 11 80       	mov    0x801169d4,%eax
80102c45:	83 ec 08             	sub    $0x8,%esp
80102c48:	01 f8                	add    %edi,%eax
80102c4a:	83 c0 01             	add    $0x1,%eax
80102c4d:	50                   	push   %eax
80102c4e:	ff 35 e4 69 11 80    	push   0x801169e4
80102c54:	e8 77 d4 ff ff       	call   801000d0 <bread>
80102c59:	89 c6                	mov    %eax,%esi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102c5b:	58                   	pop    %eax
80102c5c:	5a                   	pop    %edx
80102c5d:	ff 34 bd ec 69 11 80 	push   -0x7fee9614(,%edi,4)
80102c64:	ff 35 e4 69 11 80    	push   0x801169e4
  for (tail = 0; tail < log.lh.n; tail++) {
80102c6a:	83 c7 01             	add    $0x1,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102c6d:	e8 5e d4 ff ff       	call   801000d0 <bread>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102c72:	83 c4 0c             	add    $0xc,%esp
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102c75:	89 c3                	mov    %eax,%ebx
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102c77:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c7a:	68 60 04 00 00       	push   $0x460
80102c7f:	50                   	push   %eax
80102c80:	8d 43 5c             	lea    0x5c(%ebx),%eax
80102c83:	50                   	push   %eax
80102c84:	e8 f7 2b 00 00       	call   80105880 <memmove>
    bwrite(dbuf);  // write dst to disk
80102c89:	89 1c 24             	mov    %ebx,(%esp)
80102c8c:	e8 1f d5 ff ff       	call   801001b0 <bwrite>
    brelse(lbuf);
80102c91:	89 34 24             	mov    %esi,(%esp)
80102c94:	e8 57 d5 ff ff       	call   801001f0 <brelse>
    brelse(dbuf);
80102c99:	89 1c 24             	mov    %ebx,(%esp)
80102c9c:	e8 4f d5 ff ff       	call   801001f0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102ca1:	83 c4 10             	add    $0x10,%esp
80102ca4:	39 3d e8 69 11 80    	cmp    %edi,0x801169e8
80102caa:	7f 94                	jg     80102c40 <install_trans+0x20>
  }
}
80102cac:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102caf:	5b                   	pop    %ebx
80102cb0:	5e                   	pop    %esi
80102cb1:	5f                   	pop    %edi
80102cb2:	5d                   	pop    %ebp
80102cb3:	c3                   	ret
80102cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102cb8:	c3                   	ret
80102cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102cc0 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102cc0:	55                   	push   %ebp
80102cc1:	89 e5                	mov    %esp,%ebp
80102cc3:	53                   	push   %ebx
80102cc4:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102cc7:	ff 35 d4 69 11 80    	push   0x801169d4
80102ccd:	ff 35 e4 69 11 80    	push   0x801169e4
80102cd3:	e8 f8 d3 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102cd8:	83 c4 10             	add    $0x10,%esp
  struct buf *buf = bread(log.dev, log.start);
80102cdb:	89 c3                	mov    %eax,%ebx
  hb->n = log.lh.n;
80102cdd:	a1 e8 69 11 80       	mov    0x801169e8,%eax
80102ce2:	89 43 5c             	mov    %eax,0x5c(%ebx)
  for (i = 0; i < log.lh.n; i++) {
80102ce5:	85 c0                	test   %eax,%eax
80102ce7:	7e 19                	jle    80102d02 <write_head+0x42>
80102ce9:	31 d2                	xor    %edx,%edx
80102ceb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102cf0:	8b 0c 95 ec 69 11 80 	mov    -0x7fee9614(,%edx,4),%ecx
80102cf7:	89 4c 93 60          	mov    %ecx,0x60(%ebx,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
80102cfb:	83 c2 01             	add    $0x1,%edx
80102cfe:	39 d0                	cmp    %edx,%eax
80102d00:	75 ee                	jne    80102cf0 <write_head+0x30>
  }
  bwrite(buf);
80102d02:	83 ec 0c             	sub    $0xc,%esp
80102d05:	53                   	push   %ebx
80102d06:	e8 a5 d4 ff ff       	call   801001b0 <bwrite>
  brelse(buf);
80102d0b:	89 1c 24             	mov    %ebx,(%esp)
80102d0e:	e8 dd d4 ff ff       	call   801001f0 <brelse>
}
80102d13:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102d16:	83 c4 10             	add    $0x10,%esp
80102d19:	c9                   	leave
80102d1a:	c3                   	ret
80102d1b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80102d20 <initlog>:
{
80102d20:	55                   	push   %ebp
80102d21:	89 e5                	mov    %esp,%ebp
80102d23:	53                   	push   %ebx
80102d24:	83 ec 2c             	sub    $0x2c,%esp
80102d27:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&log.lock, "log");
80102d2a:	68 37 76 10 80       	push   $0x80107637
80102d2f:	68 a0 69 11 80       	push   $0x801169a0
80102d34:	e8 c7 27 00 00       	call   80105500 <initlock>
  readsb(dev, &sb);
80102d39:	58                   	pop    %eax
80102d3a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102d3d:	5a                   	pop    %edx
80102d3e:	50                   	push   %eax
80102d3f:	53                   	push   %ebx
80102d40:	e8 1b e8 ff ff       	call   80101560 <readsb>
  log.start = sb.logstart;
80102d45:	8b 45 ec             	mov    -0x14(%ebp),%eax
  struct buf *buf = bread(log.dev, log.start);
80102d48:	59                   	pop    %ecx
  log.dev = dev;
80102d49:	89 1d e4 69 11 80    	mov    %ebx,0x801169e4
  log.size = sb.nlog;
80102d4f:	8b 55 e8             	mov    -0x18(%ebp),%edx
  log.start = sb.logstart;
80102d52:	a3 d4 69 11 80       	mov    %eax,0x801169d4
  log.size = sb.nlog;
80102d57:	89 15 d8 69 11 80    	mov    %edx,0x801169d8
  struct buf *buf = bread(log.dev, log.start);
80102d5d:	5a                   	pop    %edx
80102d5e:	50                   	push   %eax
80102d5f:	53                   	push   %ebx
80102d60:	e8 6b d3 ff ff       	call   801000d0 <bread>
  for (i = 0; i < log.lh.n; i++) {
80102d65:	83 c4 10             	add    $0x10,%esp
  log.lh.n = lh->n;
80102d68:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102d6b:	89 1d e8 69 11 80    	mov    %ebx,0x801169e8
  for (i = 0; i < log.lh.n; i++) {
80102d71:	85 db                	test   %ebx,%ebx
80102d73:	7e 1d                	jle    80102d92 <initlog+0x72>
80102d75:	31 d2                	xor    %edx,%edx
80102d77:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102d7e:	00 
80102d7f:	90                   	nop
    log.lh.block[i] = lh->block[i];
80102d80:	8b 4c 90 60          	mov    0x60(%eax,%edx,4),%ecx
80102d84:	89 0c 95 ec 69 11 80 	mov    %ecx,-0x7fee9614(,%edx,4)
  for (i = 0; i < log.lh.n; i++) {
80102d8b:	83 c2 01             	add    $0x1,%edx
80102d8e:	39 d3                	cmp    %edx,%ebx
80102d90:	75 ee                	jne    80102d80 <initlog+0x60>
  brelse(buf);
80102d92:	83 ec 0c             	sub    $0xc,%esp
80102d95:	50                   	push   %eax
80102d96:	e8 55 d4 ff ff       	call   801001f0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102d9b:	e8 80 fe ff ff       	call   80102c20 <install_trans>
  log.lh.n = 0;
80102da0:	c7 05 e8 69 11 80 00 	movl   $0x0,0x801169e8
80102da7:	00 00 00 
  write_head(); // clear the log
80102daa:	e8 11 ff ff ff       	call   80102cc0 <write_head>
}
80102daf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102db2:	83 c4 10             	add    $0x10,%esp
80102db5:	c9                   	leave
80102db6:	c3                   	ret
80102db7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102dbe:	00 
80102dbf:	90                   	nop

80102dc0 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102dc0:	55                   	push   %ebp
80102dc1:	89 e5                	mov    %esp,%ebp
80102dc3:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102dc6:	68 a0 69 11 80       	push   $0x801169a0
80102dcb:	e8 20 29 00 00       	call   801056f0 <acquire>
80102dd0:	83 c4 10             	add    $0x10,%esp
80102dd3:	eb 18                	jmp    80102ded <begin_op+0x2d>
80102dd5:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102dd8:	83 ec 08             	sub    $0x8,%esp
80102ddb:	68 a0 69 11 80       	push   $0x801169a0
80102de0:	68 a0 69 11 80       	push   $0x801169a0
80102de5:	e8 96 12 00 00       	call   80104080 <sleep>
80102dea:	83 c4 10             	add    $0x10,%esp
    if(log.committing){
80102ded:	a1 e0 69 11 80       	mov    0x801169e0,%eax
80102df2:	85 c0                	test   %eax,%eax
80102df4:	75 e2                	jne    80102dd8 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102df6:	a1 dc 69 11 80       	mov    0x801169dc,%eax
80102dfb:	8b 15 e8 69 11 80    	mov    0x801169e8,%edx
80102e01:	83 c0 01             	add    $0x1,%eax
80102e04:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102e07:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102e0a:	83 fa 1e             	cmp    $0x1e,%edx
80102e0d:	7f c9                	jg     80102dd8 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102e0f:	83 ec 0c             	sub    $0xc,%esp
      log.outstanding += 1;
80102e12:	a3 dc 69 11 80       	mov    %eax,0x801169dc
      release(&log.lock);
80102e17:	68 a0 69 11 80       	push   $0x801169a0
80102e1c:	e8 6f 28 00 00       	call   80105690 <release>
      break;
    }
  }
}
80102e21:	83 c4 10             	add    $0x10,%esp
80102e24:	c9                   	leave
80102e25:	c3                   	ret
80102e26:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102e2d:	00 
80102e2e:	66 90                	xchg   %ax,%ax

80102e30 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102e30:	55                   	push   %ebp
80102e31:	89 e5                	mov    %esp,%ebp
80102e33:	57                   	push   %edi
80102e34:	56                   	push   %esi
80102e35:	53                   	push   %ebx
80102e36:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102e39:	68 a0 69 11 80       	push   $0x801169a0
80102e3e:	e8 ad 28 00 00       	call   801056f0 <acquire>
  log.outstanding -= 1;
80102e43:	a1 dc 69 11 80       	mov    0x801169dc,%eax
  if(log.committing)
80102e48:	8b 35 e0 69 11 80    	mov    0x801169e0,%esi
80102e4e:	83 c4 10             	add    $0x10,%esp
  log.outstanding -= 1;
80102e51:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102e54:	89 1d dc 69 11 80    	mov    %ebx,0x801169dc
  if(log.committing)
80102e5a:	85 f6                	test   %esi,%esi
80102e5c:	0f 85 22 01 00 00    	jne    80102f84 <end_op+0x154>
    panic("log.committing");
  if(log.outstanding == 0){
80102e62:	85 db                	test   %ebx,%ebx
80102e64:	0f 85 f6 00 00 00    	jne    80102f60 <end_op+0x130>
    do_commit = 1;
    log.committing = 1;
80102e6a:	c7 05 e0 69 11 80 01 	movl   $0x1,0x801169e0
80102e71:	00 00 00 
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102e74:	83 ec 0c             	sub    $0xc,%esp
80102e77:	68 a0 69 11 80       	push   $0x801169a0
80102e7c:	e8 0f 28 00 00       	call   80105690 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102e81:	8b 0d e8 69 11 80    	mov    0x801169e8,%ecx
80102e87:	83 c4 10             	add    $0x10,%esp
80102e8a:	85 c9                	test   %ecx,%ecx
80102e8c:	7f 42                	jg     80102ed0 <end_op+0xa0>
    acquire(&log.lock);
80102e8e:	83 ec 0c             	sub    $0xc,%esp
80102e91:	68 a0 69 11 80       	push   $0x801169a0
80102e96:	e8 55 28 00 00       	call   801056f0 <acquire>
    log.committing = 0;
80102e9b:	c7 05 e0 69 11 80 00 	movl   $0x0,0x801169e0
80102ea2:	00 00 00 
    wakeup(&log);
80102ea5:	c7 04 24 a0 69 11 80 	movl   $0x801169a0,(%esp)
80102eac:	e8 8f 12 00 00       	call   80104140 <wakeup>
    release(&log.lock);
80102eb1:	c7 04 24 a0 69 11 80 	movl   $0x801169a0,(%esp)
80102eb8:	e8 d3 27 00 00       	call   80105690 <release>
80102ebd:	83 c4 10             	add    $0x10,%esp
}
80102ec0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ec3:	5b                   	pop    %ebx
80102ec4:	5e                   	pop    %esi
80102ec5:	5f                   	pop    %edi
80102ec6:	5d                   	pop    %ebp
80102ec7:	c3                   	ret
80102ec8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102ecf:	00 
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102ed0:	a1 d4 69 11 80       	mov    0x801169d4,%eax
80102ed5:	83 ec 08             	sub    $0x8,%esp
80102ed8:	01 d8                	add    %ebx,%eax
80102eda:	83 c0 01             	add    $0x1,%eax
80102edd:	50                   	push   %eax
80102ede:	ff 35 e4 69 11 80    	push   0x801169e4
80102ee4:	e8 e7 d1 ff ff       	call   801000d0 <bread>
80102ee9:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102eeb:	58                   	pop    %eax
80102eec:	5a                   	pop    %edx
80102eed:	ff 34 9d ec 69 11 80 	push   -0x7fee9614(,%ebx,4)
80102ef4:	ff 35 e4 69 11 80    	push   0x801169e4
  for (tail = 0; tail < log.lh.n; tail++) {
80102efa:	83 c3 01             	add    $0x1,%ebx
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102efd:	e8 ce d1 ff ff       	call   801000d0 <bread>
    memmove(to->data, from->data, BSIZE);
80102f02:	83 c4 0c             	add    $0xc,%esp
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102f05:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102f07:	8d 40 5c             	lea    0x5c(%eax),%eax
80102f0a:	68 60 04 00 00       	push   $0x460
80102f0f:	50                   	push   %eax
80102f10:	8d 46 5c             	lea    0x5c(%esi),%eax
80102f13:	50                   	push   %eax
80102f14:	e8 67 29 00 00       	call   80105880 <memmove>
    bwrite(to);  // write the log
80102f19:	89 34 24             	mov    %esi,(%esp)
80102f1c:	e8 8f d2 ff ff       	call   801001b0 <bwrite>
    brelse(from);
80102f21:	89 3c 24             	mov    %edi,(%esp)
80102f24:	e8 c7 d2 ff ff       	call   801001f0 <brelse>
    brelse(to);
80102f29:	89 34 24             	mov    %esi,(%esp)
80102f2c:	e8 bf d2 ff ff       	call   801001f0 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
80102f31:	83 c4 10             	add    $0x10,%esp
80102f34:	3b 1d e8 69 11 80    	cmp    0x801169e8,%ebx
80102f3a:	7c 94                	jl     80102ed0 <end_op+0xa0>
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102f3c:	e8 7f fd ff ff       	call   80102cc0 <write_head>
    install_trans(); // Now install writes to home locations
80102f41:	e8 da fc ff ff       	call   80102c20 <install_trans>
    log.lh.n = 0;
80102f46:	c7 05 e8 69 11 80 00 	movl   $0x0,0x801169e8
80102f4d:	00 00 00 
    write_head();    // Erase the transaction from the log
80102f50:	e8 6b fd ff ff       	call   80102cc0 <write_head>
80102f55:	e9 34 ff ff ff       	jmp    80102e8e <end_op+0x5e>
80102f5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    wakeup(&log);
80102f60:	83 ec 0c             	sub    $0xc,%esp
80102f63:	68 a0 69 11 80       	push   $0x801169a0
80102f68:	e8 d3 11 00 00       	call   80104140 <wakeup>
  release(&log.lock);
80102f6d:	c7 04 24 a0 69 11 80 	movl   $0x801169a0,(%esp)
80102f74:	e8 17 27 00 00       	call   80105690 <release>
80102f79:	83 c4 10             	add    $0x10,%esp
}
80102f7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102f7f:	5b                   	pop    %ebx
80102f80:	5e                   	pop    %esi
80102f81:	5f                   	pop    %edi
80102f82:	5d                   	pop    %ebp
80102f83:	c3                   	ret
    panic("log.committing");
80102f84:	83 ec 0c             	sub    $0xc,%esp
80102f87:	68 3b 76 10 80       	push   $0x8010763b
80102f8c:	e8 ef d3 ff ff       	call   80100380 <panic>
80102f91:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80102f98:	00 
80102f99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102fa0 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102fa0:	55                   	push   %ebp
80102fa1:	89 e5                	mov    %esp,%ebp
80102fa3:	53                   	push   %ebx
80102fa4:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102fa7:	8b 15 e8 69 11 80    	mov    0x801169e8,%edx
{
80102fad:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102fb0:	83 fa 1d             	cmp    $0x1d,%edx
80102fb3:	7f 7d                	jg     80103032 <log_write+0x92>
80102fb5:	a1 d8 69 11 80       	mov    0x801169d8,%eax
80102fba:	83 e8 01             	sub    $0x1,%eax
80102fbd:	39 c2                	cmp    %eax,%edx
80102fbf:	7d 71                	jge    80103032 <log_write+0x92>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102fc1:	a1 dc 69 11 80       	mov    0x801169dc,%eax
80102fc6:	85 c0                	test   %eax,%eax
80102fc8:	7e 75                	jle    8010303f <log_write+0x9f>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102fca:	83 ec 0c             	sub    $0xc,%esp
80102fcd:	68 a0 69 11 80       	push   $0x801169a0
80102fd2:	e8 19 27 00 00       	call   801056f0 <acquire>
  for (i = 0; i < log.lh.n; i++) {
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102fd7:	8b 4b 08             	mov    0x8(%ebx),%ecx
  for (i = 0; i < log.lh.n; i++) {
80102fda:	83 c4 10             	add    $0x10,%esp
80102fdd:	31 c0                	xor    %eax,%eax
80102fdf:	8b 15 e8 69 11 80    	mov    0x801169e8,%edx
80102fe5:	85 d2                	test   %edx,%edx
80102fe7:	7f 0e                	jg     80102ff7 <log_write+0x57>
80102fe9:	eb 15                	jmp    80103000 <log_write+0x60>
80102feb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80102ff0:	83 c0 01             	add    $0x1,%eax
80102ff3:	39 c2                	cmp    %eax,%edx
80102ff5:	74 29                	je     80103020 <log_write+0x80>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102ff7:	39 0c 85 ec 69 11 80 	cmp    %ecx,-0x7fee9614(,%eax,4)
80102ffe:	75 f0                	jne    80102ff0 <log_write+0x50>
      break;
  }
  log.lh.block[i] = b->blockno;
80103000:	89 0c 85 ec 69 11 80 	mov    %ecx,-0x7fee9614(,%eax,4)
  if (i == log.lh.n)
80103007:	39 c2                	cmp    %eax,%edx
80103009:	74 1c                	je     80103027 <log_write+0x87>
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
8010300b:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
}
8010300e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  release(&log.lock);
80103011:	c7 45 08 a0 69 11 80 	movl   $0x801169a0,0x8(%ebp)
}
80103018:	c9                   	leave
  release(&log.lock);
80103019:	e9 72 26 00 00       	jmp    80105690 <release>
8010301e:	66 90                	xchg   %ax,%ax
  log.lh.block[i] = b->blockno;
80103020:	89 0c 95 ec 69 11 80 	mov    %ecx,-0x7fee9614(,%edx,4)
    log.lh.n++;
80103027:	83 c2 01             	add    $0x1,%edx
8010302a:	89 15 e8 69 11 80    	mov    %edx,0x801169e8
80103030:	eb d9                	jmp    8010300b <log_write+0x6b>
    panic("too big a transaction");
80103032:	83 ec 0c             	sub    $0xc,%esp
80103035:	68 4a 76 10 80       	push   $0x8010764a
8010303a:	e8 41 d3 ff ff       	call   80100380 <panic>
    panic("log_write outside of trans");
8010303f:	83 ec 0c             	sub    $0xc,%esp
80103042:	68 60 76 10 80       	push   $0x80107660
80103047:	e8 34 d3 ff ff       	call   80100380 <panic>
8010304c:	66 90                	xchg   %ax,%ax
8010304e:	66 90                	xchg   %ax,%ax

80103050 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80103050:	55                   	push   %ebp
80103051:	89 e5                	mov    %esp,%ebp
80103053:	53                   	push   %ebx
80103054:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80103057:	e8 04 07 00 00       	call   80103760 <cpuid>
8010305c:	89 c3                	mov    %eax,%ebx
8010305e:	e8 fd 06 00 00       	call   80103760 <cpuid>
80103063:	83 ec 04             	sub    $0x4,%esp
80103066:	53                   	push   %ebx
80103067:	50                   	push   %eax
80103068:	68 7b 76 10 80       	push   $0x8010767b
8010306d:	e8 3e d6 ff ff       	call   801006b0 <cprintf>
  idtinit();       // load idt register
80103072:	e8 49 2a 00 00       	call   80105ac0 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80103077:	e8 84 06 00 00       	call   80103700 <mycpu>
8010307c:	89 c2                	mov    %eax,%edx
}

static inline uint xchg(volatile uint *addr, uint newval)
{
  uint result;
  asm volatile("lock; xchgl %0, %1" :
8010307e:	b8 01 00 00 00       	mov    $0x1,%eax
80103083:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
8010308a:	e8 21 0a 00 00       	call   80103ab0 <scheduler>
8010308f:	90                   	nop

80103090 <mpenter>:
{
80103090:	55                   	push   %ebp
80103091:	89 e5                	mov    %esp,%ebp
80103093:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80103096:	e8 25 3b 00 00       	call   80106bc0 <switchkvm>
  seginit();
8010309b:	e8 90 3a 00 00       	call   80106b30 <seginit>
  lapicinit();
801030a0:	e8 bb f7 ff ff       	call   80102860 <lapicinit>
  mpmain();
801030a5:	e8 a6 ff ff ff       	call   80103050 <mpmain>
801030aa:	66 90                	xchg   %ax,%ax
801030ac:	66 90                	xchg   %ax,%ax
801030ae:	66 90                	xchg   %ax,%ax

801030b0 <main>:
{
801030b0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
801030b4:	83 e4 f0             	and    $0xfffffff0,%esp
801030b7:	ff 71 fc             	push   -0x4(%ecx)
801030ba:	55                   	push   %ebp
801030bb:	89 e5                	mov    %esp,%ebp
801030bd:	53                   	push   %ebx
801030be:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
801030bf:	83 ec 08             	sub    $0x8,%esp
801030c2:	68 00 00 40 80       	push   $0x80400000
801030c7:	68 d0 ac 11 80       	push   $0x8011acd0
801030cc:	e8 9f f5 ff ff       	call   80102670 <kinit1>
  kvmalloc();      // kernel page table
801030d1:	e8 aa 3f 00 00       	call   80107080 <kvmalloc>
  mpinit();        // detect other processors
801030d6:	e8 05 01 00 00       	call   801031e0 <mpinit>
  lapicinit();     // interrupt controller
801030db:	e8 80 f7 ff ff       	call   80102860 <lapicinit>
  seginit();       // segment descriptors
801030e0:	e8 4b 3a 00 00       	call   80106b30 <seginit>
  picinit();       // disable pic
801030e5:	e8 26 01 00 00       	call   80103210 <picinit>
  ioapicinit();    // another interrupt controller
801030ea:	e8 51 f3 ff ff       	call   80102440 <ioapicinit>
  consoleinit();   // console hardware
801030ef:	e8 6c d9 ff ff       	call   80100a60 <consoleinit>
  uartinit();      // serial port
801030f4:	e8 a7 2c 00 00       	call   80105da0 <uartinit>
  pinit();         // process table
801030f9:	e8 e2 05 00 00       	call   801036e0 <pinit>
  tvinit();        // trap vectors
801030fe:	e8 3d 29 00 00       	call   80105a40 <tvinit>
  binit();         // buffer cache
80103103:	e8 38 cf ff ff       	call   80100040 <binit>
  fileinit();      // file table
80103108:	e8 23 dd ff ff       	call   80100e30 <fileinit>
  ideinit();       // disk 
8010310d:	e8 0e f1 ff ff       	call   80102220 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80103112:	83 c4 0c             	add    $0xc,%esp
80103115:	68 8a 00 00 00       	push   $0x8a
8010311a:	68 8c a4 10 80       	push   $0x8010a48c
8010311f:	68 00 70 00 80       	push   $0x80007000
80103124:	e8 57 27 00 00       	call   80105880 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80103129:	83 c4 10             	add    $0x10,%esp
8010312c:	69 05 84 6a 11 80 b0 	imul   $0xb0,0x80116a84,%eax
80103133:	00 00 00 
80103136:	05 a0 6a 11 80       	add    $0x80116aa0,%eax
8010313b:	3d a0 6a 11 80       	cmp    $0x80116aa0,%eax
80103140:	76 7e                	jbe    801031c0 <main+0x110>
80103142:	bb a0 6a 11 80       	mov    $0x80116aa0,%ebx
80103147:	eb 20                	jmp    80103169 <main+0xb9>
80103149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103150:	69 05 84 6a 11 80 b0 	imul   $0xb0,0x80116a84,%eax
80103157:	00 00 00 
8010315a:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80103160:	05 a0 6a 11 80       	add    $0x80116aa0,%eax
80103165:	39 c3                	cmp    %eax,%ebx
80103167:	73 57                	jae    801031c0 <main+0x110>
    if(c == mycpu())  // We've started already.
80103169:	e8 92 05 00 00       	call   80103700 <mycpu>
8010316e:	39 c3                	cmp    %eax,%ebx
80103170:	74 de                	je     80103150 <main+0xa0>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80103172:	e8 69 f5 ff ff       	call   801026e0 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void(**)(void))(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80103177:	83 ec 08             	sub    $0x8,%esp
    *(void(**)(void))(code-8) = mpenter;
8010317a:	c7 05 f8 6f 00 80 90 	movl   $0x80103090,0x80006ff8
80103181:	30 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80103184:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
8010318b:	90 10 00 
    *(void**)(code-4) = stack + KSTACKSIZE;
8010318e:	05 00 10 00 00       	add    $0x1000,%eax
80103193:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    lapicstartap(c->apicid, V2P(code));
80103198:	0f b6 03             	movzbl (%ebx),%eax
8010319b:	68 00 70 00 00       	push   $0x7000
801031a0:	50                   	push   %eax
801031a1:	e8 fa f7 ff ff       	call   801029a0 <lapicstartap>

    // wait for cpu to finish mpmain()
    while(c->started == 0)
801031a6:	83 c4 10             	add    $0x10,%esp
801031a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801031b0:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
801031b6:	85 c0                	test   %eax,%eax
801031b8:	74 f6                	je     801031b0 <main+0x100>
801031ba:	eb 94                	jmp    80103150 <main+0xa0>
801031bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
801031c0:	83 ec 08             	sub    $0x8,%esp
801031c3:	68 00 00 00 8e       	push   $0x8e000000
801031c8:	68 00 00 40 80       	push   $0x80400000
801031cd:	e8 3e f4 ff ff       	call   80102610 <kinit2>
  userinit();      // first user process
801031d2:	e8 49 06 00 00       	call   80103820 <userinit>
  mpmain();        // finish this processor's setup
801031d7:	e8 74 fe ff ff       	call   80103050 <mpmain>
801031dc:	66 90                	xchg   %ax,%ax
801031de:	66 90                	xchg   %ax,%ax

801031e0 <mpinit>:

  *pmp = mp;
  return conf;
}

void mpinit(void) {
801031e0:	55                   	push   %ebp
801031e1:	89 e5                	mov    %esp,%ebp
801031e3:	83 ec 14             	sub    $0x14,%esp
  cprintf("MP Floating Pointer Structure not found or invalid.\n");
801031e6:	68 dc 79 10 80       	push   $0x801079dc
801031eb:	e8 c0 d4 ff ff       	call   801006b0 <cprintf>
  struct mpioapic *ioapic;

  // Load the MP configuration table
  if ((conf = mpconfig(&mp)) == 0) 
  {
    cprintf("Warning: No SMP configuration found. Running as a single-processor system.\n");
801031f0:	c7 04 24 14 7a 10 80 	movl   $0x80107a14,(%esp)
801031f7:	e8 b4 d4 ff ff       	call   801006b0 <cprintf>
801031fc:	83 c4 10             	add    $0x10,%esp
  // Mask external interrupts if IMCR is present
  if (mp->imcrp) {
    outb(0x22, 0x70);   // Select AIMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
801031ff:	c9                   	leave
80103200:	c3                   	ret
80103201:	66 90                	xchg   %ax,%ax
80103203:	66 90                	xchg   %ax,%ax
80103205:	66 90                	xchg   %ax,%ax
80103207:	66 90                	xchg   %ax,%ax
80103209:	66 90                	xchg   %ax,%ax
8010320b:	66 90                	xchg   %ax,%ax
8010320d:	66 90                	xchg   %ax,%ax
8010320f:	90                   	nop

80103210 <picinit>:
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103210:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103215:	ba 21 00 00 00       	mov    $0x21,%edx
8010321a:	ee                   	out    %al,(%dx)
8010321b:	ba a1 00 00 00       	mov    $0xa1,%edx
80103220:	ee                   	out    %al,(%dx)
picinit(void)
{
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
80103221:	c3                   	ret
80103222:	66 90                	xchg   %ax,%ax
80103224:	66 90                	xchg   %ax,%ax
80103226:	66 90                	xchg   %ax,%ax
80103228:	66 90                	xchg   %ax,%ax
8010322a:	66 90                	xchg   %ax,%ax
8010322c:	66 90                	xchg   %ax,%ax
8010322e:	66 90                	xchg   %ax,%ax

80103230 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
80103230:	55                   	push   %ebp
80103231:	89 e5                	mov    %esp,%ebp
80103233:	57                   	push   %edi
80103234:	56                   	push   %esi
80103235:	53                   	push   %ebx
80103236:	83 ec 0c             	sub    $0xc,%esp
80103239:	8b 75 08             	mov    0x8(%ebp),%esi
8010323c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
8010323f:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80103245:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010324b:	e8 00 dc ff ff       	call   80100e50 <filealloc>
80103250:	89 06                	mov    %eax,(%esi)
80103252:	85 c0                	test   %eax,%eax
80103254:	0f 84 a5 00 00 00    	je     801032ff <pipealloc+0xcf>
8010325a:	e8 f1 db ff ff       	call   80100e50 <filealloc>
8010325f:	89 07                	mov    %eax,(%edi)
80103261:	85 c0                	test   %eax,%eax
80103263:	0f 84 84 00 00 00    	je     801032ed <pipealloc+0xbd>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103269:	e8 72 f4 ff ff       	call   801026e0 <kalloc>
8010326e:	89 c3                	mov    %eax,%ebx
80103270:	85 c0                	test   %eax,%eax
80103272:	0f 84 a0 00 00 00    	je     80103318 <pipealloc+0xe8>
    goto bad;
  p->readopen = 1;
80103278:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
8010327f:	00 00 00 
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
80103282:	83 ec 08             	sub    $0x8,%esp
  p->writeopen = 1;
80103285:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010328c:	00 00 00 
  p->nwrite = 0;
8010328f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103296:	00 00 00 
  p->nread = 0;
80103299:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801032a0:	00 00 00 
  initlock(&p->lock, "pipe");
801032a3:	68 8f 76 10 80       	push   $0x8010768f
801032a8:	50                   	push   %eax
801032a9:	e8 52 22 00 00       	call   80105500 <initlock>
  (*f0)->type = FD_PIPE;
801032ae:	8b 06                	mov    (%esi),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
801032b0:	83 c4 10             	add    $0x10,%esp
  (*f0)->type = FD_PIPE;
801032b3:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
801032b9:	8b 06                	mov    (%esi),%eax
801032bb:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
801032bf:	8b 06                	mov    (%esi),%eax
801032c1:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
801032c5:	8b 06                	mov    (%esi),%eax
801032c7:	89 58 0c             	mov    %ebx,0xc(%eax)
  (*f1)->type = FD_PIPE;
801032ca:	8b 07                	mov    (%edi),%eax
801032cc:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
801032d2:	8b 07                	mov    (%edi),%eax
801032d4:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
801032d8:	8b 07                	mov    (%edi),%eax
801032da:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
801032de:	8b 07                	mov    (%edi),%eax
801032e0:	89 58 0c             	mov    %ebx,0xc(%eax)
  return 0;
801032e3:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801032e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801032e8:	5b                   	pop    %ebx
801032e9:	5e                   	pop    %esi
801032ea:	5f                   	pop    %edi
801032eb:	5d                   	pop    %ebp
801032ec:	c3                   	ret
  if(*f0)
801032ed:	8b 06                	mov    (%esi),%eax
801032ef:	85 c0                	test   %eax,%eax
801032f1:	74 1e                	je     80103311 <pipealloc+0xe1>
    fileclose(*f0);
801032f3:	83 ec 0c             	sub    $0xc,%esp
801032f6:	50                   	push   %eax
801032f7:	e8 14 dc ff ff       	call   80100f10 <fileclose>
801032fc:	83 c4 10             	add    $0x10,%esp
  if(*f1)
801032ff:	8b 07                	mov    (%edi),%eax
80103301:	85 c0                	test   %eax,%eax
80103303:	74 0c                	je     80103311 <pipealloc+0xe1>
    fileclose(*f1);
80103305:	83 ec 0c             	sub    $0xc,%esp
80103308:	50                   	push   %eax
80103309:	e8 02 dc ff ff       	call   80100f10 <fileclose>
8010330e:	83 c4 10             	add    $0x10,%esp
  return -1;
80103311:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103316:	eb cd                	jmp    801032e5 <pipealloc+0xb5>
  if(*f0)
80103318:	8b 06                	mov    (%esi),%eax
8010331a:	85 c0                	test   %eax,%eax
8010331c:	75 d5                	jne    801032f3 <pipealloc+0xc3>
8010331e:	eb df                	jmp    801032ff <pipealloc+0xcf>

80103320 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
80103320:	55                   	push   %ebp
80103321:	89 e5                	mov    %esp,%ebp
80103323:	56                   	push   %esi
80103324:	53                   	push   %ebx
80103325:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103328:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
8010332b:	83 ec 0c             	sub    $0xc,%esp
8010332e:	53                   	push   %ebx
8010332f:	e8 bc 23 00 00       	call   801056f0 <acquire>
  if(writable){
80103334:	83 c4 10             	add    $0x10,%esp
80103337:	85 f6                	test   %esi,%esi
80103339:	74 65                	je     801033a0 <pipeclose+0x80>
    p->writeopen = 0;
    wakeup(&p->nread);
8010333b:	83 ec 0c             	sub    $0xc,%esp
8010333e:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
    p->writeopen = 0;
80103344:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010334b:	00 00 00 
    wakeup(&p->nread);
8010334e:	50                   	push   %eax
8010334f:	e8 ec 0d 00 00       	call   80104140 <wakeup>
80103354:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103357:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010335d:	85 d2                	test   %edx,%edx
8010335f:	75 0a                	jne    8010336b <pipeclose+0x4b>
80103361:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103367:	85 c0                	test   %eax,%eax
80103369:	74 15                	je     80103380 <pipeclose+0x60>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010336b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010336e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103371:	5b                   	pop    %ebx
80103372:	5e                   	pop    %esi
80103373:	5d                   	pop    %ebp
    release(&p->lock);
80103374:	e9 17 23 00 00       	jmp    80105690 <release>
80103379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    release(&p->lock);
80103380:	83 ec 0c             	sub    $0xc,%esp
80103383:	53                   	push   %ebx
80103384:	e8 07 23 00 00       	call   80105690 <release>
    kfree((char*)p);
80103389:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010338c:	83 c4 10             	add    $0x10,%esp
}
8010338f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103392:	5b                   	pop    %ebx
80103393:	5e                   	pop    %esi
80103394:	5d                   	pop    %ebp
    kfree((char*)p);
80103395:	e9 86 f1 ff ff       	jmp    80102520 <kfree>
8010339a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    wakeup(&p->nwrite);
801033a0:	83 ec 0c             	sub    $0xc,%esp
801033a3:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
    p->readopen = 0;
801033a9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801033b0:	00 00 00 
    wakeup(&p->nwrite);
801033b3:	50                   	push   %eax
801033b4:	e8 87 0d 00 00       	call   80104140 <wakeup>
801033b9:	83 c4 10             	add    $0x10,%esp
801033bc:	eb 99                	jmp    80103357 <pipeclose+0x37>
801033be:	66 90                	xchg   %ax,%ax

801033c0 <pipewrite>:

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
801033c0:	55                   	push   %ebp
801033c1:	89 e5                	mov    %esp,%ebp
801033c3:	57                   	push   %edi
801033c4:	56                   	push   %esi
801033c5:	53                   	push   %ebx
801033c6:	83 ec 28             	sub    $0x28,%esp
801033c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801033cc:	8b 7d 10             	mov    0x10(%ebp),%edi
  int i;

  acquire(&p->lock);
801033cf:	53                   	push   %ebx
801033d0:	e8 1b 23 00 00       	call   801056f0 <acquire>
  for(i = 0; i < n; i++){
801033d5:	83 c4 10             	add    $0x10,%esp
801033d8:	85 ff                	test   %edi,%edi
801033da:	0f 8e ce 00 00 00    	jle    801034ae <pipewrite+0xee>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801033e0:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801033e6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801033e9:	89 7d 10             	mov    %edi,0x10(%ebp)
801033ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801033ef:	8d 34 39             	lea    (%ecx,%edi,1),%esi
801033f2:	89 75 e0             	mov    %esi,-0x20(%ebp)
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801033f5:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801033fb:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103401:	8d bb 38 02 00 00    	lea    0x238(%ebx),%edi
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103407:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
8010340d:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
80103410:	0f 85 b6 00 00 00    	jne    801034cc <pipewrite+0x10c>
80103416:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103419:	eb 3b                	jmp    80103456 <pipewrite+0x96>
8010341b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      if(p->readopen == 0 || myproc()->killed){
80103420:	e8 cb 03 00 00       	call   801037f0 <myproc>
80103425:	8b 48 30             	mov    0x30(%eax),%ecx
80103428:	85 c9                	test   %ecx,%ecx
8010342a:	75 34                	jne    80103460 <pipewrite+0xa0>
      wakeup(&p->nread);
8010342c:	83 ec 0c             	sub    $0xc,%esp
8010342f:	56                   	push   %esi
80103430:	e8 0b 0d 00 00       	call   80104140 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
80103435:	58                   	pop    %eax
80103436:	5a                   	pop    %edx
80103437:	53                   	push   %ebx
80103438:	57                   	push   %edi
80103439:	e8 42 0c 00 00       	call   80104080 <sleep>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010343e:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103444:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010344a:	83 c4 10             	add    $0x10,%esp
8010344d:	05 00 02 00 00       	add    $0x200,%eax
80103452:	39 c2                	cmp    %eax,%edx
80103454:	75 2a                	jne    80103480 <pipewrite+0xc0>
      if(p->readopen == 0 || myproc()->killed){
80103456:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010345c:	85 c0                	test   %eax,%eax
8010345e:	75 c0                	jne    80103420 <pipewrite+0x60>
        release(&p->lock);
80103460:	83 ec 0c             	sub    $0xc,%esp
80103463:	53                   	push   %ebx
80103464:	e8 27 22 00 00       	call   80105690 <release>
        return -1;
80103469:	83 c4 10             	add    $0x10,%esp
8010346c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103471:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103474:	5b                   	pop    %ebx
80103475:	5e                   	pop    %esi
80103476:	5f                   	pop    %edi
80103477:	5d                   	pop    %ebp
80103478:	c3                   	ret
80103479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103480:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103483:	8d 42 01             	lea    0x1(%edx),%eax
80103486:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
  for(i = 0; i < n; i++){
8010348c:	83 c1 01             	add    $0x1,%ecx
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
8010348f:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103495:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103498:	0f b6 41 ff          	movzbl -0x1(%ecx),%eax
8010349c:	88 44 13 34          	mov    %al,0x34(%ebx,%edx,1)
  for(i = 0; i < n; i++){
801034a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
801034a3:	39 c1                	cmp    %eax,%ecx
801034a5:	0f 85 50 ff ff ff    	jne    801033fb <pipewrite+0x3b>
801034ab:	8b 7d 10             	mov    0x10(%ebp),%edi
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
801034ae:	83 ec 0c             	sub    $0xc,%esp
801034b1:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801034b7:	50                   	push   %eax
801034b8:	e8 83 0c 00 00       	call   80104140 <wakeup>
  release(&p->lock);
801034bd:	89 1c 24             	mov    %ebx,(%esp)
801034c0:	e8 cb 21 00 00       	call   80105690 <release>
  return n;
801034c5:	83 c4 10             	add    $0x10,%esp
801034c8:	89 f8                	mov    %edi,%eax
801034ca:	eb a5                	jmp    80103471 <pipewrite+0xb1>
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801034cc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801034cf:	eb b2                	jmp    80103483 <pipewrite+0xc3>
801034d1:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801034d8:	00 
801034d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801034e0 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
801034e0:	55                   	push   %ebp
801034e1:	89 e5                	mov    %esp,%ebp
801034e3:	57                   	push   %edi
801034e4:	56                   	push   %esi
801034e5:	53                   	push   %ebx
801034e6:	83 ec 18             	sub    $0x18,%esp
801034e9:	8b 75 08             	mov    0x8(%ebp),%esi
801034ec:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
801034ef:	56                   	push   %esi
801034f0:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
801034f6:	e8 f5 21 00 00       	call   801056f0 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801034fb:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103501:	83 c4 10             	add    $0x10,%esp
80103504:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
8010350a:	74 2f                	je     8010353b <piperead+0x5b>
8010350c:	eb 37                	jmp    80103545 <piperead+0x65>
8010350e:	66 90                	xchg   %ax,%ax
    if(myproc()->killed){
80103510:	e8 db 02 00 00       	call   801037f0 <myproc>
80103515:	8b 40 30             	mov    0x30(%eax),%eax
80103518:	85 c0                	test   %eax,%eax
8010351a:	0f 85 80 00 00 00    	jne    801035a0 <piperead+0xc0>
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
80103520:	83 ec 08             	sub    $0x8,%esp
80103523:	56                   	push   %esi
80103524:	53                   	push   %ebx
80103525:	e8 56 0b 00 00       	call   80104080 <sleep>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
8010352a:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103530:	83 c4 10             	add    $0x10,%esp
80103533:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
80103539:	75 0a                	jne    80103545 <piperead+0x65>
8010353b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103541:	85 d2                	test   %edx,%edx
80103543:	75 cb                	jne    80103510 <piperead+0x30>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103545:	8b 4d 10             	mov    0x10(%ebp),%ecx
80103548:	31 db                	xor    %ebx,%ebx
8010354a:	85 c9                	test   %ecx,%ecx
8010354c:	7f 26                	jg     80103574 <piperead+0x94>
8010354e:	eb 2c                	jmp    8010357c <piperead+0x9c>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103550:	8d 48 01             	lea    0x1(%eax),%ecx
80103553:	25 ff 01 00 00       	and    $0x1ff,%eax
80103558:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
8010355e:	0f b6 44 06 34       	movzbl 0x34(%esi,%eax,1),%eax
80103563:	88 04 1f             	mov    %al,(%edi,%ebx,1)
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103566:	83 c3 01             	add    $0x1,%ebx
80103569:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010356c:	74 0e                	je     8010357c <piperead+0x9c>
8010356e:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
    if(p->nread == p->nwrite)
80103574:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
8010357a:	75 d4                	jne    80103550 <piperead+0x70>
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
8010357c:	83 ec 0c             	sub    $0xc,%esp
8010357f:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103585:	50                   	push   %eax
80103586:	e8 b5 0b 00 00       	call   80104140 <wakeup>
  release(&p->lock);
8010358b:	89 34 24             	mov    %esi,(%esp)
8010358e:	e8 fd 20 00 00       	call   80105690 <release>
  return i;
80103593:	83 c4 10             	add    $0x10,%esp
}
80103596:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103599:	89 d8                	mov    %ebx,%eax
8010359b:	5b                   	pop    %ebx
8010359c:	5e                   	pop    %esi
8010359d:	5f                   	pop    %edi
8010359e:	5d                   	pop    %ebp
8010359f:	c3                   	ret
      release(&p->lock);
801035a0:	83 ec 0c             	sub    $0xc,%esp
      return -1;
801035a3:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
      release(&p->lock);
801035a8:	56                   	push   %esi
801035a9:	e8 e2 20 00 00       	call   80105690 <release>
      return -1;
801035ae:	83 c4 10             	add    $0x10,%esp
}
801035b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801035b4:	89 d8                	mov    %ebx,%eax
801035b6:	5b                   	pop    %ebx
801035b7:	5e                   	pop    %esi
801035b8:	5f                   	pop    %edi
801035b9:	5d                   	pop    %ebp
801035ba:	c3                   	ret
801035bb:	66 90                	xchg   %ax,%ax
801035bd:	66 90                	xchg   %ax,%ax
801035bf:	90                   	nop

801035c0 <allocproc>:
    release(&ptable.lock);

    return pid;
}
// Function to allocate a new process and initialize its context for scheduling
static struct proc* allocproc(void) {
801035c0:	55                   	push   %ebp
801035c1:	89 e5                	mov    %esp,%ebp
801035c3:	53                   	push   %ebx
    char *sp;

    acquire(&ptable.lock);

    // Look for an UNUSED process slot in the process table
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801035c4:	bb 54 70 11 80       	mov    $0x80117054,%ebx
static struct proc* allocproc(void) {
801035c9:	83 ec 10             	sub    $0x10,%esp
    acquire(&ptable.lock);
801035cc:	68 20 70 11 80       	push   $0x80117020
801035d1:	e8 1a 21 00 00       	call   801056f0 <acquire>
801035d6:	83 c4 10             	add    $0x10,%esp
801035d9:	eb 13                	jmp    801035ee <allocproc+0x2e>
801035db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801035e0:	81 c3 90 00 00 00    	add    $0x90,%ebx
801035e6:	81 fb 54 94 11 80    	cmp    $0x80119454,%ebx
801035ec:	74 7a                	je     80103668 <allocproc+0xa8>
        if (p->state == UNUSED) {
801035ee:	8b 43 18             	mov    0x18(%ebx),%eax
801035f1:	85 c0                	test   %eax,%eax
801035f3:	75 eb                	jne    801035e0 <allocproc+0x20>
    release(&ptable.lock);
    return 0;

found:
    p->state = EMBRYO;          // Set process state to EMBRYO (initial state)
    p->pid = nextpid++;         // Assign a unique PID
801035f5:	a1 08 a0 10 80       	mov    0x8010a008,%eax
    release(&ptable.lock);
801035fa:	83 ec 0c             	sub    $0xc,%esp
    p->state = EMBRYO;          // Set process state to EMBRYO (initial state)
801035fd:	c7 43 18 01 00 00 00 	movl   $0x1,0x18(%ebx)
    p->pid = nextpid++;         // Assign a unique PID
80103604:	89 43 1c             	mov    %eax,0x1c(%ebx)
80103607:	8d 50 01             	lea    0x1(%eax),%edx
    release(&ptable.lock);
8010360a:	68 20 70 11 80       	push   $0x80117020
    p->pid = nextpid++;         // Assign a unique PID
8010360f:	89 15 08 a0 10 80    	mov    %edx,0x8010a008
    release(&ptable.lock);
80103615:	e8 76 20 00 00       	call   80105690 <release>

    // Allocate kernel stack for this process
    if ((p->kstack = kalloc()) == 0) {
8010361a:	e8 c1 f0 ff ff       	call   801026e0 <kalloc>
8010361f:	83 c4 10             	add    $0x10,%esp
80103622:	89 43 14             	mov    %eax,0x14(%ebx)
80103625:	85 c0                	test   %eax,%eax
80103627:	74 58                	je     80103681 <allocproc+0xc1>
        return 0;
    }
    sp = p->kstack + KSTACKSIZE;

    // Leave room for trap frame and initialize it
    sp -= sizeof *p->tf;
80103629:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
    sp -= 4;
    *(uint*)sp = (uint)trapret;

    sp -= sizeof *p->context;
    p->context = (struct context*)sp;
    memset(p->context, 0, sizeof *p->context);
8010362f:	83 ec 04             	sub    $0x4,%esp
    sp -= sizeof *p->context;
80103632:	05 9c 0f 00 00       	add    $0xf9c,%eax
    sp -= sizeof *p->tf;
80103637:	89 53 24             	mov    %edx,0x24(%ebx)
    *(uint*)sp = (uint)trapret;
8010363a:	c7 40 14 28 5a 10 80 	movl   $0x80105a28,0x14(%eax)
    p->context = (struct context*)sp;
80103641:	89 43 28             	mov    %eax,0x28(%ebx)
    memset(p->context, 0, sizeof *p->context);
80103644:	6a 14                	push   $0x14
80103646:	6a 00                	push   $0x0
80103648:	50                   	push   %eax
80103649:	e8 a2 21 00 00       	call   801057f0 <memset>
    p->context->eip = (uint)forkret;
8010364e:	8b 43 28             	mov    0x28(%ebx),%eax

    return p;
80103651:	83 c4 10             	add    $0x10,%esp
    p->context->eip = (uint)forkret;
80103654:	c7 40 10 90 36 10 80 	movl   $0x80103690,0x10(%eax)
}
8010365b:	89 d8                	mov    %ebx,%eax
8010365d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103660:	c9                   	leave
80103661:	c3                   	ret
80103662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    release(&ptable.lock);
80103668:	83 ec 0c             	sub    $0xc,%esp
    return 0;
8010366b:	31 db                	xor    %ebx,%ebx
    release(&ptable.lock);
8010366d:	68 20 70 11 80       	push   $0x80117020
80103672:	e8 19 20 00 00       	call   80105690 <release>
    return 0;
80103677:	83 c4 10             	add    $0x10,%esp
}
8010367a:	89 d8                	mov    %ebx,%eax
8010367c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010367f:	c9                   	leave
80103680:	c3                   	ret
        p->state = UNUSED;
80103681:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
    return 0;
80103688:	31 db                	xor    %ebx,%ebx
8010368a:	eb ee                	jmp    8010367a <allocproc+0xba>
8010368c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103690 <forkret>:
    myproc()->state = RUNNABLE;
    sched();
    release(&ptable.lock);
}

void forkret(void) {
80103690:	55                   	push   %ebp
80103691:	89 e5                	mov    %esp,%ebp
80103693:	83 ec 14             	sub    $0x14,%esp
    static int first = 1;
    release(&ptable.lock);
80103696:	68 20 70 11 80       	push   $0x80117020
8010369b:	e8 f0 1f 00 00       	call   80105690 <release>

    if (first) {
801036a0:	a1 00 a0 10 80       	mov    0x8010a000,%eax
801036a5:	83 c4 10             	add    $0x10,%esp
801036a8:	85 c0                	test   %eax,%eax
801036aa:	75 04                	jne    801036b0 <forkret+0x20>
        first = 0;
        iinit(ROOTDEV);
        initlog(ROOTDEV);
    }
}
801036ac:	c9                   	leave
801036ad:	c3                   	ret
801036ae:	66 90                	xchg   %ax,%ax
        first = 0;
801036b0:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
801036b7:	00 00 00 
        iinit(ROOTDEV);
801036ba:	83 ec 0c             	sub    $0xc,%esp
801036bd:	6a 01                	push   $0x1
801036bf:	e8 dc de ff ff       	call   801015a0 <iinit>
        initlog(ROOTDEV);
801036c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801036cb:	e8 50 f6 ff ff       	call   80102d20 <initlog>
}
801036d0:	83 c4 10             	add    $0x10,%esp
801036d3:	c9                   	leave
801036d4:	c3                   	ret
801036d5:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801036dc:	00 
801036dd:	8d 76 00             	lea    0x0(%esi),%esi

801036e0 <pinit>:
void pinit(void) {
801036e0:	55                   	push   %ebp
801036e1:	89 e5                	mov    %esp,%ebp
801036e3:	83 ec 10             	sub    $0x10,%esp
    initlock(&ptable.lock, "ptable");
801036e6:	68 94 76 10 80       	push   $0x80107694
801036eb:	68 20 70 11 80       	push   $0x80117020
801036f0:	e8 0b 1e 00 00       	call   80105500 <initlock>
}
801036f5:	83 c4 10             	add    $0x10,%esp
801036f8:	c9                   	leave
801036f9:	c3                   	ret
801036fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103700 <mycpu>:
struct cpu* mycpu(void) {
80103700:	55                   	push   %ebp
80103701:	89 e5                	mov    %esp,%ebp
80103703:	56                   	push   %esi
80103704:	53                   	push   %ebx
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103705:	9c                   	pushf
80103706:	58                   	pop    %eax
    if (readeflags() & FL_IF)
80103707:	f6 c4 02             	test   $0x2,%ah
8010370a:	75 46                	jne    80103752 <mycpu+0x52>
    apicid = lapicid();
8010370c:	e8 3f f2 ff ff       	call   80102950 <lapicid>
    for (i = 0; i < ncpu; ++i) {
80103711:	8b 35 84 6a 11 80    	mov    0x80116a84,%esi
80103717:	85 f6                	test   %esi,%esi
80103719:	7e 2a                	jle    80103745 <mycpu+0x45>
8010371b:	31 d2                	xor    %edx,%edx
8010371d:	eb 08                	jmp    80103727 <mycpu+0x27>
8010371f:	90                   	nop
80103720:	83 c2 01             	add    $0x1,%edx
80103723:	39 f2                	cmp    %esi,%edx
80103725:	74 1e                	je     80103745 <mycpu+0x45>
        if (cpus[i].apicid == apicid)
80103727:	69 ca b0 00 00 00    	imul   $0xb0,%edx,%ecx
8010372d:	0f b6 99 a0 6a 11 80 	movzbl -0x7fee9560(%ecx),%ebx
80103734:	39 c3                	cmp    %eax,%ebx
80103736:	75 e8                	jne    80103720 <mycpu+0x20>
}
80103738:	8d 65 f8             	lea    -0x8(%ebp),%esp
            return &cpus[i];
8010373b:	8d 81 a0 6a 11 80    	lea    -0x7fee9560(%ecx),%eax
}
80103741:	5b                   	pop    %ebx
80103742:	5e                   	pop    %esi
80103743:	5d                   	pop    %ebp
80103744:	c3                   	ret
    panic("unknown apicid\n");
80103745:	83 ec 0c             	sub    $0xc,%esp
80103748:	68 9b 76 10 80       	push   $0x8010769b
8010374d:	e8 2e cc ff ff       	call   80100380 <panic>
        panic("mycpu called with interrupts enabled\n");
80103752:	83 ec 0c             	sub    $0xc,%esp
80103755:	68 60 7a 10 80       	push   $0x80107a60
8010375a:	e8 21 cc ff ff       	call   80100380 <panic>
8010375f:	90                   	nop

80103760 <cpuid>:
int cpuid() {
80103760:	55                   	push   %ebp
80103761:	89 e5                	mov    %esp,%ebp
80103763:	83 ec 08             	sub    $0x8,%esp
    return mycpu() - cpus;
80103766:	e8 95 ff ff ff       	call   80103700 <mycpu>
}
8010376b:	c9                   	leave
    return mycpu() - cpus;
8010376c:	2d a0 6a 11 80       	sub    $0x80116aa0,%eax
80103771:	c1 f8 04             	sar    $0x4,%eax
80103774:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010377a:	c3                   	ret
8010377b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80103780 <find_proc_by_pid>:
struct proc* find_proc_by_pid(int pid) {
80103780:	55                   	push   %ebp
80103781:	89 e5                	mov    %esp,%ebp
80103783:	56                   	push   %esi
80103784:	53                   	push   %ebx
80103785:	8b 75 08             	mov    0x8(%ebp),%esi
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103788:	bb 54 70 11 80       	mov    $0x80117054,%ebx
    acquire(&ptable.lock);
8010378d:	83 ec 0c             	sub    $0xc,%esp
80103790:	68 20 70 11 80       	push   $0x80117020
80103795:	e8 56 1f 00 00       	call   801056f0 <acquire>
8010379a:	83 c4 10             	add    $0x10,%esp
8010379d:	eb 0f                	jmp    801037ae <find_proc_by_pid+0x2e>
8010379f:	90                   	nop
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801037a0:	81 c3 90 00 00 00    	add    $0x90,%ebx
801037a6:	81 fb 54 94 11 80    	cmp    $0x80119454,%ebx
801037ac:	74 22                	je     801037d0 <find_proc_by_pid+0x50>
        if (p->pid == pid) {
801037ae:	39 73 1c             	cmp    %esi,0x1c(%ebx)
801037b1:	75 ed                	jne    801037a0 <find_proc_by_pid+0x20>
            release(&ptable.lock);
801037b3:	83 ec 0c             	sub    $0xc,%esp
801037b6:	68 20 70 11 80       	push   $0x80117020
801037bb:	e8 d0 1e 00 00       	call   80105690 <release>
            return p;
801037c0:	83 c4 10             	add    $0x10,%esp
}
801037c3:	8d 65 f8             	lea    -0x8(%ebp),%esp
801037c6:	89 d8                	mov    %ebx,%eax
801037c8:	5b                   	pop    %ebx
801037c9:	5e                   	pop    %esi
801037ca:	5d                   	pop    %ebp
801037cb:	c3                   	ret
801037cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    release(&ptable.lock);
801037d0:	83 ec 0c             	sub    $0xc,%esp
    return 0;  // Return NULL if the process is not found
801037d3:	31 db                	xor    %ebx,%ebx
    release(&ptable.lock);
801037d5:	68 20 70 11 80       	push   $0x80117020
801037da:	e8 b1 1e 00 00       	call   80105690 <release>
    return 0;  // Return NULL if the process is not found
801037df:	83 c4 10             	add    $0x10,%esp
}
801037e2:	8d 65 f8             	lea    -0x8(%ebp),%esp
801037e5:	89 d8                	mov    %ebx,%eax
801037e7:	5b                   	pop    %ebx
801037e8:	5e                   	pop    %esi
801037e9:	5d                   	pop    %ebp
801037ea:	c3                   	ret
801037eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801037f0 <myproc>:
struct proc* myproc(void) {
801037f0:	55                   	push   %ebp
801037f1:	89 e5                	mov    %esp,%ebp
801037f3:	53                   	push   %ebx
801037f4:	83 ec 04             	sub    $0x4,%esp
    pushcli();
801037f7:	e8 a4 1d 00 00       	call   801055a0 <pushcli>
    c = mycpu();
801037fc:	e8 ff fe ff ff       	call   80103700 <mycpu>
    p = c->proc;
80103801:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
    popcli();
80103807:	e8 e4 1d 00 00       	call   801055f0 <popcli>
}
8010380c:	89 d8                	mov    %ebx,%eax
8010380e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103811:	c9                   	leave
80103812:	c3                   	ret
80103813:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010381a:	00 
8010381b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80103820 <userinit>:
void userinit(void) {
80103820:	55                   	push   %ebp
80103821:	89 e5                	mov    %esp,%ebp
80103823:	53                   	push   %ebx
80103824:	83 ec 04             	sub    $0x4,%esp
    p = allocproc();
80103827:	e8 94 fd ff ff       	call   801035c0 <allocproc>
8010382c:	89 c3                	mov    %eax,%ebx
    initproc = p;
8010382e:	a3 54 94 11 80       	mov    %eax,0x80119454
    if ((p->pgdir = setupkvm()) == 0)
80103833:	e8 c8 37 00 00       	call   80107000 <setupkvm>
80103838:	89 43 10             	mov    %eax,0x10(%ebx)
8010383b:	85 c0                	test   %eax,%eax
8010383d:	0f 84 be 00 00 00    	je     80103901 <userinit+0xe1>
    inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103843:	83 ec 04             	sub    $0x4,%esp
80103846:	68 2c 00 00 00       	push   $0x2c
8010384b:	68 60 a4 10 80       	push   $0x8010a460
80103850:	50                   	push   %eax
80103851:	e8 8a 34 00 00       	call   80106ce0 <inituvm>
    memset(p->tf, 0, sizeof(*p->tf));
80103856:	83 c4 0c             	add    $0xc,%esp
    p->sz = PGSIZE;
80103859:	c7 43 0c 00 10 00 00 	movl   $0x1000,0xc(%ebx)
    memset(p->tf, 0, sizeof(*p->tf));
80103860:	6a 4c                	push   $0x4c
80103862:	6a 00                	push   $0x0
80103864:	ff 73 24             	push   0x24(%ebx)
80103867:	e8 84 1f 00 00       	call   801057f0 <memset>
    p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010386c:	8b 43 24             	mov    0x24(%ebx),%eax
8010386f:	ba 1b 00 00 00       	mov    $0x1b,%edx
    safestrcpy(p->name, "initcode", sizeof(p->name));
80103874:	83 c4 0c             	add    $0xc,%esp
    p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103877:	b9 23 00 00 00       	mov    $0x23,%ecx
    p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010387c:	66 89 50 3c          	mov    %dx,0x3c(%eax)
    p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103880:	8b 43 24             	mov    0x24(%ebx),%eax
80103883:	66 89 48 2c          	mov    %cx,0x2c(%eax)
    p->tf->es = p->tf->ds;
80103887:	8b 43 24             	mov    0x24(%ebx),%eax
8010388a:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010388e:	66 89 50 28          	mov    %dx,0x28(%eax)
    p->tf->ss = p->tf->ds;
80103892:	8b 43 24             	mov    0x24(%ebx),%eax
80103895:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103899:	66 89 50 48          	mov    %dx,0x48(%eax)
    p->tf->eflags = FL_IF;
8010389d:	8b 43 24             	mov    0x24(%ebx),%eax
801038a0:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
    p->tf->esp = PGSIZE;
801038a7:	8b 43 24             	mov    0x24(%ebx),%eax
801038aa:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
    p->tf->eip = 0;
801038b1:	8b 43 24             	mov    0x24(%ebx),%eax
801038b4:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
    safestrcpy(p->name, "initcode", sizeof(p->name));
801038bb:	8d 43 78             	lea    0x78(%ebx),%eax
801038be:	6a 10                	push   $0x10
801038c0:	68 c4 76 10 80       	push   $0x801076c4
801038c5:	50                   	push   %eax
801038c6:	e8 d5 20 00 00       	call   801059a0 <safestrcpy>
    p->cwd = namei("/");
801038cb:	c7 04 24 cd 76 10 80 	movl   $0x801076cd,(%esp)
801038d2:	e8 29 e8 ff ff       	call   80102100 <namei>
801038d7:	89 43 74             	mov    %eax,0x74(%ebx)
    acquire(&ptable.lock);
801038da:	c7 04 24 20 70 11 80 	movl   $0x80117020,(%esp)
801038e1:	e8 0a 1e 00 00       	call   801056f0 <acquire>
    p->state = RUNNABLE;
801038e6:	c7 43 18 03 00 00 00 	movl   $0x3,0x18(%ebx)
    release(&ptable.lock);
801038ed:	c7 04 24 20 70 11 80 	movl   $0x80117020,(%esp)
801038f4:	e8 97 1d 00 00       	call   80105690 <release>
}
801038f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038fc:	83 c4 10             	add    $0x10,%esp
801038ff:	c9                   	leave
80103900:	c3                   	ret
        panic("userinit: out of memory?");
80103901:	83 ec 0c             	sub    $0xc,%esp
80103904:	68 ab 76 10 80       	push   $0x801076ab
80103909:	e8 72 ca ff ff       	call   80100380 <panic>
8010390e:	66 90                	xchg   %ax,%ax

80103910 <growproc>:
int growproc(int n) {
80103910:	55                   	push   %ebp
80103911:	89 e5                	mov    %esp,%ebp
80103913:	56                   	push   %esi
80103914:	53                   	push   %ebx
80103915:	8b 75 08             	mov    0x8(%ebp),%esi
    pushcli();
80103918:	e8 83 1c 00 00       	call   801055a0 <pushcli>
    c = mycpu();
8010391d:	e8 de fd ff ff       	call   80103700 <mycpu>
    p = c->proc;
80103922:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
    popcli();
80103928:	e8 c3 1c 00 00       	call   801055f0 <popcli>
    sz = curproc->sz;
8010392d:	8b 43 0c             	mov    0xc(%ebx),%eax
    if (n > 0) {
80103930:	85 f6                	test   %esi,%esi
80103932:	7f 1c                	jg     80103950 <growproc+0x40>
    } else if (n < 0) {
80103934:	75 3a                	jne    80103970 <growproc+0x60>
    switchuvm(curproc);
80103936:	83 ec 0c             	sub    $0xc,%esp
    curproc->sz = sz;
80103939:	89 43 0c             	mov    %eax,0xc(%ebx)
    switchuvm(curproc);
8010393c:	53                   	push   %ebx
8010393d:	e8 8e 32 00 00       	call   80106bd0 <switchuvm>
    return 0;
80103942:	83 c4 10             	add    $0x10,%esp
80103945:	31 c0                	xor    %eax,%eax
}
80103947:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010394a:	5b                   	pop    %ebx
8010394b:	5e                   	pop    %esi
8010394c:	5d                   	pop    %ebp
8010394d:	c3                   	ret
8010394e:	66 90                	xchg   %ax,%ax
        if ((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103950:	83 ec 04             	sub    $0x4,%esp
80103953:	01 c6                	add    %eax,%esi
80103955:	56                   	push   %esi
80103956:	50                   	push   %eax
80103957:	ff 73 10             	push   0x10(%ebx)
8010395a:	e8 d1 34 00 00       	call   80106e30 <allocuvm>
8010395f:	83 c4 10             	add    $0x10,%esp
80103962:	85 c0                	test   %eax,%eax
80103964:	75 d0                	jne    80103936 <growproc+0x26>
            return -1;
80103966:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010396b:	eb da                	jmp    80103947 <growproc+0x37>
8010396d:	8d 76 00             	lea    0x0(%esi),%esi
        if ((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103970:	83 ec 04             	sub    $0x4,%esp
80103973:	01 c6                	add    %eax,%esi
80103975:	56                   	push   %esi
80103976:	50                   	push   %eax
80103977:	ff 73 10             	push   0x10(%ebx)
8010397a:	e8 d1 35 00 00       	call   80106f50 <deallocuvm>
8010397f:	83 c4 10             	add    $0x10,%esp
80103982:	85 c0                	test   %eax,%eax
80103984:	75 b0                	jne    80103936 <growproc+0x26>
80103986:	eb de                	jmp    80103966 <growproc+0x56>
80103988:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010398f:	00 

80103990 <fork>:
int fork(void) {
80103990:	55                   	push   %ebp
80103991:	89 e5                	mov    %esp,%ebp
80103993:	57                   	push   %edi
80103994:	56                   	push   %esi
80103995:	53                   	push   %ebx
80103996:	83 ec 1c             	sub    $0x1c,%esp
    pushcli();
80103999:	e8 02 1c 00 00       	call   801055a0 <pushcli>
    c = mycpu();
8010399e:	e8 5d fd ff ff       	call   80103700 <mycpu>
    p = c->proc;
801039a3:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
    popcli();
801039a9:	e8 42 1c 00 00       	call   801055f0 <popcli>
    if ((np = allocproc()) == 0) {
801039ae:	e8 0d fc ff ff       	call   801035c0 <allocproc>
801039b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801039b6:	85 c0                	test   %eax,%eax
801039b8:	0f 84 de 00 00 00    	je     80103a9c <fork+0x10c>
    if ((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0) {
801039be:	83 ec 08             	sub    $0x8,%esp
801039c1:	ff 73 0c             	push   0xc(%ebx)
801039c4:	89 c7                	mov    %eax,%edi
801039c6:	ff 73 10             	push   0x10(%ebx)
801039c9:	e8 22 37 00 00       	call   801070f0 <copyuvm>
801039ce:	83 c4 10             	add    $0x10,%esp
801039d1:	89 47 10             	mov    %eax,0x10(%edi)
801039d4:	85 c0                	test   %eax,%eax
801039d6:	0f 84 a1 00 00 00    	je     80103a7d <fork+0xed>
    np->sz = curproc->sz;
801039dc:	8b 43 0c             	mov    0xc(%ebx),%eax
801039df:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801039e2:	89 41 0c             	mov    %eax,0xc(%ecx)
    *np->tf = *curproc->tf;
801039e5:	8b 79 24             	mov    0x24(%ecx),%edi
    np->parent = curproc;
801039e8:	89 c8                	mov    %ecx,%eax
801039ea:	89 59 20             	mov    %ebx,0x20(%ecx)
    *np->tf = *curproc->tf;
801039ed:	b9 13 00 00 00       	mov    $0x13,%ecx
801039f2:	8b 73 24             	mov    0x24(%ebx),%esi
801039f5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    for (i = 0; i < NOFILE; i++)
801039f7:	31 f6                	xor    %esi,%esi
    np->tf->eax = 0;
801039f9:	8b 40 24             	mov    0x24(%eax),%eax
801039fc:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
    for (i = 0; i < NOFILE; i++)
80103a03:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        if (curproc->ofile[i])
80103a08:	8b 44 b3 34          	mov    0x34(%ebx,%esi,4),%eax
80103a0c:	85 c0                	test   %eax,%eax
80103a0e:	74 13                	je     80103a23 <fork+0x93>
            np->ofile[i] = filedup(curproc->ofile[i]);
80103a10:	83 ec 0c             	sub    $0xc,%esp
80103a13:	50                   	push   %eax
80103a14:	e8 a7 d4 ff ff       	call   80100ec0 <filedup>
80103a19:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103a1c:	83 c4 10             	add    $0x10,%esp
80103a1f:	89 44 b2 34          	mov    %eax,0x34(%edx,%esi,4)
    for (i = 0; i < NOFILE; i++)
80103a23:	83 c6 01             	add    $0x1,%esi
80103a26:	83 fe 10             	cmp    $0x10,%esi
80103a29:	75 dd                	jne    80103a08 <fork+0x78>
    np->cwd = idup(curproc->cwd);
80103a2b:	83 ec 0c             	sub    $0xc,%esp
80103a2e:	ff 73 74             	push   0x74(%ebx)
    safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103a31:	83 c3 78             	add    $0x78,%ebx
    np->cwd = idup(curproc->cwd);
80103a34:	e8 87 dd ff ff       	call   801017c0 <idup>
80103a39:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103a3c:	83 c4 0c             	add    $0xc,%esp
    np->cwd = idup(curproc->cwd);
80103a3f:	89 47 74             	mov    %eax,0x74(%edi)
    safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103a42:	8d 47 78             	lea    0x78(%edi),%eax
80103a45:	6a 10                	push   $0x10
80103a47:	53                   	push   %ebx
80103a48:	50                   	push   %eax
80103a49:	e8 52 1f 00 00       	call   801059a0 <safestrcpy>
    pid = np->pid;
80103a4e:	8b 5f 1c             	mov    0x1c(%edi),%ebx
    acquire(&ptable.lock);
80103a51:	c7 04 24 20 70 11 80 	movl   $0x80117020,(%esp)
80103a58:	e8 93 1c 00 00       	call   801056f0 <acquire>
    np->state = RUNNABLE;
80103a5d:	c7 47 18 03 00 00 00 	movl   $0x3,0x18(%edi)
    release(&ptable.lock);
80103a64:	c7 04 24 20 70 11 80 	movl   $0x80117020,(%esp)
80103a6b:	e8 20 1c 00 00       	call   80105690 <release>
    return pid;
80103a70:	83 c4 10             	add    $0x10,%esp
}
80103a73:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a76:	89 d8                	mov    %ebx,%eax
80103a78:	5b                   	pop    %ebx
80103a79:	5e                   	pop    %esi
80103a7a:	5f                   	pop    %edi
80103a7b:	5d                   	pop    %ebp
80103a7c:	c3                   	ret
        kfree(np->kstack);
80103a7d:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103a80:	83 ec 0c             	sub    $0xc,%esp
80103a83:	ff 73 14             	push   0x14(%ebx)
80103a86:	e8 95 ea ff ff       	call   80102520 <kfree>
        np->kstack = 0;
80103a8b:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        return -1;
80103a92:	83 c4 10             	add    $0x10,%esp
        np->state = UNUSED;
80103a95:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
        return -1;
80103a9c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103aa1:	eb d0                	jmp    80103a73 <fork+0xe3>
80103aa3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80103aaa:	00 
80103aab:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80103ab0 <scheduler>:
void scheduler(void) {
80103ab0:	55                   	push   %ebp
80103ab1:	89 e5                	mov    %esp,%ebp
80103ab3:	57                   	push   %edi
80103ab4:	56                   	push   %esi
80103ab5:	53                   	push   %ebx
80103ab6:	83 ec 0c             	sub    $0xc,%esp
    struct cpu *c = mycpu();
80103ab9:	e8 42 fc ff ff       	call   80103700 <mycpu>
    c->proc = 0;
80103abe:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103ac5:	00 00 00 
    struct cpu *c = mycpu();
80103ac8:	89 c6                	mov    %eax,%esi
    c->proc = 0;
80103aca:	8d 78 04             	lea    0x4(%eax),%edi
80103acd:	8d 76 00             	lea    0x0(%esi),%esi
  asm volatile("sti");
80103ad0:	fb                   	sti
        acquire(&ptable.lock);
80103ad1:	83 ec 0c             	sub    $0xc,%esp
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103ad4:	bb 54 70 11 80       	mov    $0x80117054,%ebx
        acquire(&ptable.lock);
80103ad9:	68 20 70 11 80       	push   $0x80117020
80103ade:	e8 0d 1c 00 00       	call   801056f0 <acquire>
80103ae3:	83 c4 10             	add    $0x10,%esp
80103ae6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80103aed:	00 
80103aee:	66 90                	xchg   %ax,%ax
            if (p->state != RUNNABLE)
80103af0:	83 7b 18 03          	cmpl   $0x3,0x18(%ebx)
80103af4:	75 33                	jne    80103b29 <scheduler+0x79>
            switchuvm(p);
80103af6:	83 ec 0c             	sub    $0xc,%esp
            c->proc = p;
80103af9:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
            switchuvm(p);
80103aff:	53                   	push   %ebx
80103b00:	e8 cb 30 00 00       	call   80106bd0 <switchuvm>
            swtch(&(c->scheduler), p->context);
80103b05:	58                   	pop    %eax
80103b06:	5a                   	pop    %edx
80103b07:	ff 73 28             	push   0x28(%ebx)
80103b0a:	57                   	push   %edi
            p->state = RUNNING;
80103b0b:	c7 43 18 04 00 00 00 	movl   $0x4,0x18(%ebx)
            swtch(&(c->scheduler), p->context);
80103b12:	e8 e4 1e 00 00       	call   801059fb <swtch>
            switchkvm();
80103b17:	e8 a4 30 00 00       	call   80106bc0 <switchkvm>
            c->proc = 0;
80103b1c:	83 c4 10             	add    $0x10,%esp
80103b1f:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103b26:	00 00 00 
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103b29:	81 c3 90 00 00 00    	add    $0x90,%ebx
80103b2f:	81 fb 54 94 11 80    	cmp    $0x80119454,%ebx
80103b35:	75 b9                	jne    80103af0 <scheduler+0x40>
        release(&ptable.lock);
80103b37:	83 ec 0c             	sub    $0xc,%esp
80103b3a:	68 20 70 11 80       	push   $0x80117020
80103b3f:	e8 4c 1b 00 00       	call   80105690 <release>
        sti();
80103b44:	83 c4 10             	add    $0x10,%esp
80103b47:	eb 87                	jmp    80103ad0 <scheduler+0x20>
80103b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103b50 <sched>:
void sched(void) {
80103b50:	55                   	push   %ebp
80103b51:	89 e5                	mov    %esp,%ebp
80103b53:	56                   	push   %esi
80103b54:	53                   	push   %ebx
    pushcli();
80103b55:	e8 46 1a 00 00       	call   801055a0 <pushcli>
    c = mycpu();
80103b5a:	e8 a1 fb ff ff       	call   80103700 <mycpu>
    p = c->proc;
80103b5f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
    popcli();
80103b65:	e8 86 1a 00 00       	call   801055f0 <popcli>
    if (!holding(&ptable.lock))
80103b6a:	83 ec 0c             	sub    $0xc,%esp
80103b6d:	68 20 70 11 80       	push   $0x80117020
80103b72:	e8 d9 1a 00 00       	call   80105650 <holding>
80103b77:	83 c4 10             	add    $0x10,%esp
80103b7a:	85 c0                	test   %eax,%eax
80103b7c:	74 4f                	je     80103bcd <sched+0x7d>
    if (mycpu()->ncli != 1)
80103b7e:	e8 7d fb ff ff       	call   80103700 <mycpu>
80103b83:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103b8a:	75 68                	jne    80103bf4 <sched+0xa4>
    if (p->state == RUNNING)
80103b8c:	83 7b 18 04          	cmpl   $0x4,0x18(%ebx)
80103b90:	74 55                	je     80103be7 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103b92:	9c                   	pushf
80103b93:	58                   	pop    %eax
    if (readeflags() & FL_IF)
80103b94:	f6 c4 02             	test   $0x2,%ah
80103b97:	75 41                	jne    80103bda <sched+0x8a>
    intena = mycpu()->intena;
80103b99:	e8 62 fb ff ff       	call   80103700 <mycpu>
    swtch(&p->context, mycpu()->scheduler);
80103b9e:	83 c3 28             	add    $0x28,%ebx
    intena = mycpu()->intena;
80103ba1:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
    swtch(&p->context, mycpu()->scheduler);
80103ba7:	e8 54 fb ff ff       	call   80103700 <mycpu>
80103bac:	83 ec 08             	sub    $0x8,%esp
80103baf:	ff 70 04             	push   0x4(%eax)
80103bb2:	53                   	push   %ebx
80103bb3:	e8 43 1e 00 00       	call   801059fb <swtch>
    mycpu()->intena = intena;
80103bb8:	e8 43 fb ff ff       	call   80103700 <mycpu>
}
80103bbd:	83 c4 10             	add    $0x10,%esp
    mycpu()->intena = intena;
80103bc0:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103bc6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103bc9:	5b                   	pop    %ebx
80103bca:	5e                   	pop    %esi
80103bcb:	5d                   	pop    %ebp
80103bcc:	c3                   	ret
        panic("sched ptable.lock");
80103bcd:	83 ec 0c             	sub    $0xc,%esp
80103bd0:	68 cf 76 10 80       	push   $0x801076cf
80103bd5:	e8 a6 c7 ff ff       	call   80100380 <panic>
        panic("sched interruptible");
80103bda:	83 ec 0c             	sub    $0xc,%esp
80103bdd:	68 fb 76 10 80       	push   $0x801076fb
80103be2:	e8 99 c7 ff ff       	call   80100380 <panic>
        panic("sched running");
80103be7:	83 ec 0c             	sub    $0xc,%esp
80103bea:	68 ed 76 10 80       	push   $0x801076ed
80103bef:	e8 8c c7 ff ff       	call   80100380 <panic>
        panic("sched locks");
80103bf4:	83 ec 0c             	sub    $0xc,%esp
80103bf7:	68 e1 76 10 80       	push   $0x801076e1
80103bfc:	e8 7f c7 ff ff       	call   80100380 <panic>
80103c01:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80103c08:	00 
80103c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103c10 <exit>:
void exit(void) {
80103c10:	55                   	push   %ebp
80103c11:	89 e5                	mov    %esp,%ebp
80103c13:	57                   	push   %edi
80103c14:	56                   	push   %esi
80103c15:	53                   	push   %ebx
80103c16:	83 ec 0c             	sub    $0xc,%esp
    struct proc *curproc = myproc();
80103c19:	e8 d2 fb ff ff       	call   801037f0 <myproc>
    if (curproc == initproc)
80103c1e:	39 05 54 94 11 80    	cmp    %eax,0x80119454
80103c24:	0f 84 07 01 00 00    	je     80103d31 <exit+0x121>
80103c2a:	89 c3                	mov    %eax,%ebx
80103c2c:	8d 70 34             	lea    0x34(%eax),%esi
80103c2f:	8d 78 74             	lea    0x74(%eax),%edi
80103c32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        if (curproc->ofile[fd]) {
80103c38:	8b 06                	mov    (%esi),%eax
80103c3a:	85 c0                	test   %eax,%eax
80103c3c:	74 12                	je     80103c50 <exit+0x40>
            fileclose(curproc->ofile[fd]);
80103c3e:	83 ec 0c             	sub    $0xc,%esp
80103c41:	50                   	push   %eax
80103c42:	e8 c9 d2 ff ff       	call   80100f10 <fileclose>
            curproc->ofile[fd] = 0;
80103c47:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103c4d:	83 c4 10             	add    $0x10,%esp
    for (fd = 0; fd < NOFILE; fd++) {
80103c50:	83 c6 04             	add    $0x4,%esi
80103c53:	39 f7                	cmp    %esi,%edi
80103c55:	75 e1                	jne    80103c38 <exit+0x28>
    begin_op();
80103c57:	e8 64 f1 ff ff       	call   80102dc0 <begin_op>
    iput(curproc->cwd);
80103c5c:	83 ec 0c             	sub    $0xc,%esp
80103c5f:	ff 73 74             	push   0x74(%ebx)
80103c62:	e8 c9 dc ff ff       	call   80101930 <iput>
    end_op();
80103c67:	e8 c4 f1 ff ff       	call   80102e30 <end_op>
    curproc->cwd = 0;
80103c6c:	c7 43 74 00 00 00 00 	movl   $0x0,0x74(%ebx)
    acquire(&ptable.lock);
80103c73:	c7 04 24 20 70 11 80 	movl   $0x80117020,(%esp)
80103c7a:	e8 71 1a 00 00       	call   801056f0 <acquire>
    wakeup1(curproc->parent);
80103c7f:	8b 53 20             	mov    0x20(%ebx),%edx
80103c82:	83 c4 10             	add    $0x10,%esp
    }
}

static void wakeup1(void *chan) {
    struct proc *p;
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103c85:	b8 54 70 11 80       	mov    $0x80117054,%eax
80103c8a:	eb 10                	jmp    80103c9c <exit+0x8c>
80103c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c90:	05 90 00 00 00       	add    $0x90,%eax
80103c95:	3d 54 94 11 80       	cmp    $0x80119454,%eax
80103c9a:	74 1e                	je     80103cba <exit+0xaa>
        if (p->state == SLEEPING && p->chan == chan)
80103c9c:	83 78 18 02          	cmpl   $0x2,0x18(%eax)
80103ca0:	75 ee                	jne    80103c90 <exit+0x80>
80103ca2:	3b 50 2c             	cmp    0x2c(%eax),%edx
80103ca5:	75 e9                	jne    80103c90 <exit+0x80>
            p->state = RUNNABLE;
80103ca7:	c7 40 18 03 00 00 00 	movl   $0x3,0x18(%eax)
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103cae:	05 90 00 00 00       	add    $0x90,%eax
80103cb3:	3d 54 94 11 80       	cmp    $0x80119454,%eax
80103cb8:	75 e2                	jne    80103c9c <exit+0x8c>
            p->parent = initproc;
80103cba:	8b 0d 54 94 11 80    	mov    0x80119454,%ecx
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103cc0:	ba 54 70 11 80       	mov    $0x80117054,%edx
80103cc5:	eb 17                	jmp    80103cde <exit+0xce>
80103cc7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80103cce:	00 
80103ccf:	90                   	nop
80103cd0:	81 c2 90 00 00 00    	add    $0x90,%edx
80103cd6:	81 fa 54 94 11 80    	cmp    $0x80119454,%edx
80103cdc:	74 3a                	je     80103d18 <exit+0x108>
        if (p->parent == curproc) {
80103cde:	39 5a 20             	cmp    %ebx,0x20(%edx)
80103ce1:	75 ed                	jne    80103cd0 <exit+0xc0>
            if (p->state == ZOMBIE)
80103ce3:	83 7a 18 05          	cmpl   $0x5,0x18(%edx)
            p->parent = initproc;
80103ce7:	89 4a 20             	mov    %ecx,0x20(%edx)
            if (p->state == ZOMBIE)
80103cea:	75 e4                	jne    80103cd0 <exit+0xc0>
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103cec:	b8 54 70 11 80       	mov    $0x80117054,%eax
80103cf1:	eb 11                	jmp    80103d04 <exit+0xf4>
80103cf3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80103cf8:	05 90 00 00 00       	add    $0x90,%eax
80103cfd:	3d 54 94 11 80       	cmp    $0x80119454,%eax
80103d02:	74 cc                	je     80103cd0 <exit+0xc0>
        if (p->state == SLEEPING && p->chan == chan)
80103d04:	83 78 18 02          	cmpl   $0x2,0x18(%eax)
80103d08:	75 ee                	jne    80103cf8 <exit+0xe8>
80103d0a:	3b 48 2c             	cmp    0x2c(%eax),%ecx
80103d0d:	75 e9                	jne    80103cf8 <exit+0xe8>
            p->state = RUNNABLE;
80103d0f:	c7 40 18 03 00 00 00 	movl   $0x3,0x18(%eax)
80103d16:	eb e0                	jmp    80103cf8 <exit+0xe8>
    curproc->state = ZOMBIE;
80103d18:	c7 43 18 05 00 00 00 	movl   $0x5,0x18(%ebx)
    sched();
80103d1f:	e8 2c fe ff ff       	call   80103b50 <sched>
    panic("zombie exit");
80103d24:	83 ec 0c             	sub    $0xc,%esp
80103d27:	68 1c 77 10 80       	push   $0x8010771c
80103d2c:	e8 4f c6 ff ff       	call   80100380 <panic>
        panic("init exiting");
80103d31:	83 ec 0c             	sub    $0xc,%esp
80103d34:	68 0f 77 10 80       	push   $0x8010770f
80103d39:	e8 42 c6 ff ff       	call   80100380 <panic>
80103d3e:	66 90                	xchg   %ax,%ax

80103d40 <waitpid>:
int waitpid(void) {
80103d40:	55                   	push   %ebp
80103d41:	89 e5                	mov    %esp,%ebp
80103d43:	57                   	push   %edi
80103d44:	56                   	push   %esi
    if(argint(0, &pid) < 0 || argptr(1, (char**)&status, sizeof(int)) < 0)
80103d45:	8d 45 e0             	lea    -0x20(%ebp),%eax
int waitpid(void) {
80103d48:	53                   	push   %ebx
80103d49:	83 ec 34             	sub    $0x34,%esp
    if(argint(0, &pid) < 0 || argptr(1, (char**)&status, sizeof(int)) < 0)
80103d4c:	50                   	push   %eax
80103d4d:	6a 00                	push   $0x0
80103d4f:	e8 ac 06 00 00       	call   80104400 <argint>
80103d54:	83 c4 10             	add    $0x10,%esp
80103d57:	85 c0                	test   %eax,%eax
80103d59:	0f 88 86 01 00 00    	js     80103ee5 <waitpid+0x1a5>
80103d5f:	83 ec 04             	sub    $0x4,%esp
80103d62:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80103d65:	6a 04                	push   $0x4
80103d67:	50                   	push   %eax
80103d68:	6a 01                	push   $0x1
80103d6a:	e8 e1 06 00 00       	call   80104450 <argptr>
80103d6f:	83 c4 10             	add    $0x10,%esp
80103d72:	85 c0                	test   %eax,%eax
80103d74:	0f 88 6b 01 00 00    	js     80103ee5 <waitpid+0x1a5>
    acquire(&ptable.lock);
80103d7a:	83 ec 0c             	sub    $0xc,%esp
80103d7d:	68 20 70 11 80       	push   $0x80117020
80103d82:	e8 69 19 00 00       	call   801056f0 <acquire>
80103d87:	83 c4 10             	add    $0x10,%esp
        pid_found = 0;
80103d8a:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103d91:	bf 54 70 11 80       	mov    $0x80117054,%edi
        havekids = 0;
80103d96:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
80103d9d:	eb 0f                	jmp    80103dae <waitpid+0x6e>
80103d9f:	90                   	nop
        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103da0:	81 c7 90 00 00 00    	add    $0x90,%edi
80103da6:	81 ff 54 94 11 80    	cmp    $0x80119454,%edi
80103dac:	74 52                	je     80103e00 <waitpid+0xc0>
            if(p->parent != myproc())
80103dae:	8b 5f 20             	mov    0x20(%edi),%ebx
    pushcli();
80103db1:	e8 ea 17 00 00       	call   801055a0 <pushcli>
    c = mycpu();
80103db6:	e8 45 f9 ff ff       	call   80103700 <mycpu>
    p = c->proc;
80103dbb:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
    popcli();
80103dc1:	e8 2a 18 00 00       	call   801055f0 <popcli>
            if(p->parent != myproc())
80103dc6:	39 f3                	cmp    %esi,%ebx
80103dc8:	75 d6                	jne    80103da0 <waitpid+0x60>
            havekids = 1;
80103dca:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
            if(p->pid == pid) {
80103dd1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103dd4:	39 47 1c             	cmp    %eax,0x1c(%edi)
80103dd7:	75 c7                	jne    80103da0 <waitpid+0x60>
                if(p->state == ZOMBIE){
80103dd9:	83 7f 18 05          	cmpl   $0x5,0x18(%edi)
80103ddd:	0f 84 9e 00 00 00    	je     80103e81 <waitpid+0x141>
        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103de3:	81 c7 90 00 00 00    	add    $0x90,%edi
                pid_found = 1;
80103de9:	c7 45 d0 01 00 00 00 	movl   $0x1,-0x30(%ebp)
        for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103df0:	81 ff 54 94 11 80    	cmp    $0x80119454,%edi
80103df6:	75 b6                	jne    80103dae <waitpid+0x6e>
80103df8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80103dff:	00 
        if(!havekids || !pid_found || myproc()->killed){
80103e00:	8b 75 d4             	mov    -0x2c(%ebp),%esi
80103e03:	8b 7d d0             	mov    -0x30(%ebp),%edi
80103e06:	83 f6 01             	xor    $0x1,%esi
80103e09:	83 f7 01             	xor    $0x1,%edi
80103e0c:	09 fe                	or     %edi,%esi
80103e0e:	0f 85 c1 00 00 00    	jne    80103ed5 <waitpid+0x195>
    pushcli();
80103e14:	e8 87 17 00 00       	call   801055a0 <pushcli>
    c = mycpu();
80103e19:	e8 e2 f8 ff ff       	call   80103700 <mycpu>
    p = c->proc;
80103e1e:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
    popcli();
80103e24:	e8 c7 17 00 00       	call   801055f0 <popcli>
        if(!havekids || !pid_found || myproc()->killed){
80103e29:	8b 43 30             	mov    0x30(%ebx),%eax
80103e2c:	85 c0                	test   %eax,%eax
80103e2e:	0f 85 a1 00 00 00    	jne    80103ed5 <waitpid+0x195>
    pushcli();
80103e34:	e8 67 17 00 00       	call   801055a0 <pushcli>
    c = mycpu();
80103e39:	e8 c2 f8 ff ff       	call   80103700 <mycpu>
    p = c->proc;
80103e3e:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
    popcli();
80103e44:	e8 a7 17 00 00       	call   801055f0 <popcli>
    pushcli();
80103e49:	e8 52 17 00 00       	call   801055a0 <pushcli>
    c = mycpu();
80103e4e:	e8 ad f8 ff ff       	call   80103700 <mycpu>
    p = c->proc;
80103e53:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
    popcli();
80103e59:	e8 92 17 00 00       	call   801055f0 <popcli>
    if (p == 0)
80103e5e:	85 db                	test   %ebx,%ebx
80103e60:	0f 84 8c 00 00 00    	je     80103ef2 <waitpid+0x1b2>
    p->chan = chan;
80103e66:	89 73 2c             	mov    %esi,0x2c(%ebx)
    p->state = SLEEPING;
80103e69:	c7 43 18 02 00 00 00 	movl   $0x2,0x18(%ebx)
    sched();
80103e70:	e8 db fc ff ff       	call   80103b50 <sched>
    p->chan = 0;
80103e75:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
}
80103e7c:	e9 09 ff ff ff       	jmp    80103d8a <waitpid+0x4a>
                    *status = p->state;  // Save the exit status
80103e81:	8b 45 e4             	mov    -0x1c(%ebp),%eax
                    kfree(p->kstack);
80103e84:	83 ec 0c             	sub    $0xc,%esp
                    *status = p->state;  // Save the exit status
80103e87:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
                    pid = p->pid;
80103e8d:	8b 47 1c             	mov    0x1c(%edi),%eax
80103e90:	89 45 e0             	mov    %eax,-0x20(%ebp)
                    kfree(p->kstack);
80103e93:	ff 77 14             	push   0x14(%edi)
80103e96:	e8 85 e6 ff ff       	call   80102520 <kfree>
                    p->kstack = 0;
80103e9b:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
                    p->state = UNUSED;
80103ea2:	c7 47 18 00 00 00 00 	movl   $0x0,0x18(%edi)
                    p->pid = 0;
80103ea9:	c7 47 1c 00 00 00 00 	movl   $0x0,0x1c(%edi)
                    p->parent = 0;
80103eb0:	c7 47 20 00 00 00 00 	movl   $0x0,0x20(%edi)
                    p->name[0] = 0;
80103eb7:	c6 47 78 00          	movb   $0x0,0x78(%edi)
                    release(&ptable.lock);
80103ebb:	c7 04 24 20 70 11 80 	movl   $0x80117020,(%esp)
80103ec2:	e8 c9 17 00 00       	call   80105690 <release>
                    return pid;
80103ec7:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103eca:	83 c4 10             	add    $0x10,%esp
}
80103ecd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103ed0:	5b                   	pop    %ebx
80103ed1:	5e                   	pop    %esi
80103ed2:	5f                   	pop    %edi
80103ed3:	5d                   	pop    %ebp
80103ed4:	c3                   	ret
            release(&ptable.lock);
80103ed5:	83 ec 0c             	sub    $0xc,%esp
80103ed8:	68 20 70 11 80       	push   $0x80117020
80103edd:	e8 ae 17 00 00       	call   80105690 <release>
            return -1;
80103ee2:	83 c4 10             	add    $0x10,%esp
}
80103ee5:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return -1;
80103ee8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103eed:	5b                   	pop    %ebx
80103eee:	5e                   	pop    %esi
80103eef:	5f                   	pop    %edi
80103ef0:	5d                   	pop    %ebp
80103ef1:	c3                   	ret
        panic("sleep");
80103ef2:	83 ec 0c             	sub    $0xc,%esp
80103ef5:	68 28 77 10 80       	push   $0x80107728
80103efa:	e8 81 c4 ff ff       	call   80100380 <panic>
80103eff:	90                   	nop

80103f00 <wait>:
int wait(void) {
80103f00:	55                   	push   %ebp
80103f01:	89 e5                	mov    %esp,%ebp
80103f03:	56                   	push   %esi
80103f04:	53                   	push   %ebx
    pushcli();
80103f05:	e8 96 16 00 00       	call   801055a0 <pushcli>
    c = mycpu();
80103f0a:	e8 f1 f7 ff ff       	call   80103700 <mycpu>
    p = c->proc;
80103f0f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
    popcli();
80103f15:	e8 d6 16 00 00       	call   801055f0 <popcli>
    acquire(&ptable.lock);
80103f1a:	83 ec 0c             	sub    $0xc,%esp
80103f1d:	68 20 70 11 80       	push   $0x80117020
80103f22:	e8 c9 17 00 00       	call   801056f0 <acquire>
80103f27:	83 c4 10             	add    $0x10,%esp
        havekids = 0;
80103f2a:	31 c0                	xor    %eax,%eax
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103f2c:	bb 54 70 11 80       	mov    $0x80117054,%ebx
80103f31:	eb 13                	jmp    80103f46 <wait+0x46>
80103f33:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80103f38:	81 c3 90 00 00 00    	add    $0x90,%ebx
80103f3e:	81 fb 54 94 11 80    	cmp    $0x80119454,%ebx
80103f44:	74 1e                	je     80103f64 <wait+0x64>
            if (p->parent != curproc)
80103f46:	39 73 20             	cmp    %esi,0x20(%ebx)
80103f49:	75 ed                	jne    80103f38 <wait+0x38>
            if (p->state == ZOMBIE) {
80103f4b:	83 7b 18 05          	cmpl   $0x5,0x18(%ebx)
80103f4f:	74 5f                	je     80103fb0 <wait+0xb0>
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103f51:	81 c3 90 00 00 00    	add    $0x90,%ebx
            havekids = 1;
80103f57:	b8 01 00 00 00       	mov    $0x1,%eax
        for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103f5c:	81 fb 54 94 11 80    	cmp    $0x80119454,%ebx
80103f62:	75 e2                	jne    80103f46 <wait+0x46>
        if (!havekids || curproc->killed) {
80103f64:	85 c0                	test   %eax,%eax
80103f66:	0f 84 9a 00 00 00    	je     80104006 <wait+0x106>
80103f6c:	8b 46 30             	mov    0x30(%esi),%eax
80103f6f:	85 c0                	test   %eax,%eax
80103f71:	0f 85 8f 00 00 00    	jne    80104006 <wait+0x106>
    pushcli();
80103f77:	e8 24 16 00 00       	call   801055a0 <pushcli>
    c = mycpu();
80103f7c:	e8 7f f7 ff ff       	call   80103700 <mycpu>
    p = c->proc;
80103f81:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
    popcli();
80103f87:	e8 64 16 00 00       	call   801055f0 <popcli>
    if (p == 0)
80103f8c:	85 db                	test   %ebx,%ebx
80103f8e:	0f 84 89 00 00 00    	je     8010401d <wait+0x11d>
    p->chan = chan;
80103f94:	89 73 2c             	mov    %esi,0x2c(%ebx)
    p->state = SLEEPING;
80103f97:	c7 43 18 02 00 00 00 	movl   $0x2,0x18(%ebx)
    sched();
80103f9e:	e8 ad fb ff ff       	call   80103b50 <sched>
    p->chan = 0;
80103fa3:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
}
80103faa:	e9 7b ff ff ff       	jmp    80103f2a <wait+0x2a>
80103faf:	90                   	nop
                kfree(p->kstack);
80103fb0:	83 ec 0c             	sub    $0xc,%esp
                pid = p->pid;
80103fb3:	8b 73 1c             	mov    0x1c(%ebx),%esi
                kfree(p->kstack);
80103fb6:	ff 73 14             	push   0x14(%ebx)
80103fb9:	e8 62 e5 ff ff       	call   80102520 <kfree>
                p->kstack = 0;
80103fbe:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
                freevm(p->pgdir);
80103fc5:	5a                   	pop    %edx
80103fc6:	ff 73 10             	push   0x10(%ebx)
80103fc9:	e8 b2 2f 00 00       	call   80106f80 <freevm>
                p->pid = 0;
80103fce:	c7 43 1c 00 00 00 00 	movl   $0x0,0x1c(%ebx)
                p->parent = 0;
80103fd5:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
                p->name[0] = 0;
80103fdc:	c6 43 78 00          	movb   $0x0,0x78(%ebx)
                p->killed = 0;
80103fe0:	c7 43 30 00 00 00 00 	movl   $0x0,0x30(%ebx)
                p->state = UNUSED;
80103fe7:	c7 43 18 00 00 00 00 	movl   $0x0,0x18(%ebx)
                release(&ptable.lock);
80103fee:	c7 04 24 20 70 11 80 	movl   $0x80117020,(%esp)
80103ff5:	e8 96 16 00 00       	call   80105690 <release>
                return pid;
80103ffa:	83 c4 10             	add    $0x10,%esp
}
80103ffd:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104000:	89 f0                	mov    %esi,%eax
80104002:	5b                   	pop    %ebx
80104003:	5e                   	pop    %esi
80104004:	5d                   	pop    %ebp
80104005:	c3                   	ret
            release(&ptable.lock);
80104006:	83 ec 0c             	sub    $0xc,%esp
            return -1;
80104009:	be ff ff ff ff       	mov    $0xffffffff,%esi
            release(&ptable.lock);
8010400e:	68 20 70 11 80       	push   $0x80117020
80104013:	e8 78 16 00 00       	call   80105690 <release>
            return -1;
80104018:	83 c4 10             	add    $0x10,%esp
8010401b:	eb e0                	jmp    80103ffd <wait+0xfd>
        panic("sleep");
8010401d:	83 ec 0c             	sub    $0xc,%esp
80104020:	68 28 77 10 80       	push   $0x80107728
80104025:	e8 56 c3 ff ff       	call   80100380 <panic>
8010402a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104030 <yield>:
void yield(void) {
80104030:	55                   	push   %ebp
80104031:	89 e5                	mov    %esp,%ebp
80104033:	53                   	push   %ebx
80104034:	83 ec 10             	sub    $0x10,%esp
    acquire(&ptable.lock);
80104037:	68 20 70 11 80       	push   $0x80117020
8010403c:	e8 af 16 00 00       	call   801056f0 <acquire>
    pushcli();
80104041:	e8 5a 15 00 00       	call   801055a0 <pushcli>
    c = mycpu();
80104046:	e8 b5 f6 ff ff       	call   80103700 <mycpu>
    p = c->proc;
8010404b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
    popcli();
80104051:	e8 9a 15 00 00       	call   801055f0 <popcli>
    myproc()->state = RUNNABLE;
80104056:	c7 43 18 03 00 00 00 	movl   $0x3,0x18(%ebx)
    sched();
8010405d:	e8 ee fa ff ff       	call   80103b50 <sched>
    release(&ptable.lock);
80104062:	c7 04 24 20 70 11 80 	movl   $0x80117020,(%esp)
80104069:	e8 22 16 00 00       	call   80105690 <release>
}
8010406e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104071:	83 c4 10             	add    $0x10,%esp
80104074:	c9                   	leave
80104075:	c3                   	ret
80104076:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010407d:	00 
8010407e:	66 90                	xchg   %ax,%ax

80104080 <sleep>:
void sleep(void *chan, struct spinlock *lk) {
80104080:	55                   	push   %ebp
80104081:	89 e5                	mov    %esp,%ebp
80104083:	57                   	push   %edi
80104084:	56                   	push   %esi
80104085:	53                   	push   %ebx
80104086:	83 ec 0c             	sub    $0xc,%esp
80104089:	8b 7d 08             	mov    0x8(%ebp),%edi
8010408c:	8b 75 0c             	mov    0xc(%ebp),%esi
    pushcli();
8010408f:	e8 0c 15 00 00       	call   801055a0 <pushcli>
    c = mycpu();
80104094:	e8 67 f6 ff ff       	call   80103700 <mycpu>
    p = c->proc;
80104099:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
    popcli();
8010409f:	e8 4c 15 00 00       	call   801055f0 <popcli>
    if (p == 0)
801040a4:	85 db                	test   %ebx,%ebx
801040a6:	0f 84 87 00 00 00    	je     80104133 <sleep+0xb3>
    if (lk == 0)
801040ac:	85 f6                	test   %esi,%esi
801040ae:	74 76                	je     80104126 <sleep+0xa6>
    if (lk != &ptable.lock) {
801040b0:	81 fe 20 70 11 80    	cmp    $0x80117020,%esi
801040b6:	74 50                	je     80104108 <sleep+0x88>
        acquire(&ptable.lock);
801040b8:	83 ec 0c             	sub    $0xc,%esp
801040bb:	68 20 70 11 80       	push   $0x80117020
801040c0:	e8 2b 16 00 00       	call   801056f0 <acquire>
        release(lk);
801040c5:	89 34 24             	mov    %esi,(%esp)
801040c8:	e8 c3 15 00 00       	call   80105690 <release>
    p->chan = chan;
801040cd:	89 7b 2c             	mov    %edi,0x2c(%ebx)
    p->state = SLEEPING;
801040d0:	c7 43 18 02 00 00 00 	movl   $0x2,0x18(%ebx)
    sched();
801040d7:	e8 74 fa ff ff       	call   80103b50 <sched>
    p->chan = 0;
801040dc:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
        release(&ptable.lock);
801040e3:	c7 04 24 20 70 11 80 	movl   $0x80117020,(%esp)
801040ea:	e8 a1 15 00 00       	call   80105690 <release>
        acquire(lk);
801040ef:	89 75 08             	mov    %esi,0x8(%ebp)
801040f2:	83 c4 10             	add    $0x10,%esp
}
801040f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801040f8:	5b                   	pop    %ebx
801040f9:	5e                   	pop    %esi
801040fa:	5f                   	pop    %edi
801040fb:	5d                   	pop    %ebp
        acquire(lk);
801040fc:	e9 ef 15 00 00       	jmp    801056f0 <acquire>
80104101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    p->chan = chan;
80104108:	89 7b 2c             	mov    %edi,0x2c(%ebx)
    p->state = SLEEPING;
8010410b:	c7 43 18 02 00 00 00 	movl   $0x2,0x18(%ebx)
    sched();
80104112:	e8 39 fa ff ff       	call   80103b50 <sched>
    p->chan = 0;
80104117:	c7 43 2c 00 00 00 00 	movl   $0x0,0x2c(%ebx)
}
8010411e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104121:	5b                   	pop    %ebx
80104122:	5e                   	pop    %esi
80104123:	5f                   	pop    %edi
80104124:	5d                   	pop    %ebp
80104125:	c3                   	ret
        panic("sleep without lk");
80104126:	83 ec 0c             	sub    $0xc,%esp
80104129:	68 2e 77 10 80       	push   $0x8010772e
8010412e:	e8 4d c2 ff ff       	call   80100380 <panic>
        panic("sleep");
80104133:	83 ec 0c             	sub    $0xc,%esp
80104136:	68 28 77 10 80       	push   $0x80107728
8010413b:	e8 40 c2 ff ff       	call   80100380 <panic>

80104140 <wakeup>:
    }
}

void wakeup(void *chan) {
80104140:	55                   	push   %ebp
80104141:	89 e5                	mov    %esp,%ebp
80104143:	53                   	push   %ebx
80104144:	83 ec 10             	sub    $0x10,%esp
80104147:	8b 5d 08             	mov    0x8(%ebp),%ebx
    acquire(&ptable.lock);
8010414a:	68 20 70 11 80       	push   $0x80117020
8010414f:	e8 9c 15 00 00       	call   801056f0 <acquire>
80104154:	83 c4 10             	add    $0x10,%esp
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80104157:	b8 54 70 11 80       	mov    $0x80117054,%eax
8010415c:	eb 0e                	jmp    8010416c <wakeup+0x2c>
8010415e:	66 90                	xchg   %ax,%ax
80104160:	05 90 00 00 00       	add    $0x90,%eax
80104165:	3d 54 94 11 80       	cmp    $0x80119454,%eax
8010416a:	74 1e                	je     8010418a <wakeup+0x4a>
        if (p->state == SLEEPING && p->chan == chan)
8010416c:	83 78 18 02          	cmpl   $0x2,0x18(%eax)
80104170:	75 ee                	jne    80104160 <wakeup+0x20>
80104172:	3b 58 2c             	cmp    0x2c(%eax),%ebx
80104175:	75 e9                	jne    80104160 <wakeup+0x20>
            p->state = RUNNABLE;
80104177:	c7 40 18 03 00 00 00 	movl   $0x3,0x18(%eax)
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
8010417e:	05 90 00 00 00       	add    $0x90,%eax
80104183:	3d 54 94 11 80       	cmp    $0x80119454,%eax
80104188:	75 e2                	jne    8010416c <wakeup+0x2c>
    wakeup1(chan);
    release(&ptable.lock);
8010418a:	c7 45 08 20 70 11 80 	movl   $0x80117020,0x8(%ebp)
}
80104191:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104194:	c9                   	leave
    release(&ptable.lock);
80104195:	e9 f6 14 00 00       	jmp    80105690 <release>
8010419a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801041a0 <kill>:

int kill(int pid) {
801041a0:	55                   	push   %ebp
801041a1:	89 e5                	mov    %esp,%ebp
801041a3:	53                   	push   %ebx
801041a4:	83 ec 10             	sub    $0x10,%esp
801041a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    struct proc *p;
    acquire(&ptable.lock);
801041aa:	68 20 70 11 80       	push   $0x80117020
801041af:	e8 3c 15 00 00       	call   801056f0 <acquire>
801041b4:	83 c4 10             	add    $0x10,%esp
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
801041b7:	b8 54 70 11 80       	mov    $0x80117054,%eax
801041bc:	eb 0e                	jmp    801041cc <kill+0x2c>
801041be:	66 90                	xchg   %ax,%ax
801041c0:	05 90 00 00 00       	add    $0x90,%eax
801041c5:	3d 54 94 11 80       	cmp    $0x80119454,%eax
801041ca:	74 34                	je     80104200 <kill+0x60>
        if (p->pid == pid) {
801041cc:	39 58 1c             	cmp    %ebx,0x1c(%eax)
801041cf:	75 ef                	jne    801041c0 <kill+0x20>
            p->killed = 1;
            if (p->state == SLEEPING)
801041d1:	83 78 18 02          	cmpl   $0x2,0x18(%eax)
            p->killed = 1;
801041d5:	c7 40 30 01 00 00 00 	movl   $0x1,0x30(%eax)
            if (p->state == SLEEPING)
801041dc:	75 07                	jne    801041e5 <kill+0x45>
                p->state = RUNNABLE;
801041de:	c7 40 18 03 00 00 00 	movl   $0x3,0x18(%eax)
            release(&ptable.lock);
801041e5:	83 ec 0c             	sub    $0xc,%esp
801041e8:	68 20 70 11 80       	push   $0x80117020
801041ed:	e8 9e 14 00 00       	call   80105690 <release>
            return 0;
        }
    }
    release(&ptable.lock);
    return -1;
}
801041f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
            return 0;
801041f5:	83 c4 10             	add    $0x10,%esp
801041f8:	31 c0                	xor    %eax,%eax
}
801041fa:	c9                   	leave
801041fb:	c3                   	ret
801041fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    release(&ptable.lock);
80104200:	83 ec 0c             	sub    $0xc,%esp
80104203:	68 20 70 11 80       	push   $0x80117020
80104208:	e8 83 14 00 00       	call   80105690 <release>
}
8010420d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return -1;
80104210:	83 c4 10             	add    $0x10,%esp
80104213:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104218:	c9                   	leave
80104219:	c3                   	ret
8010421a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104220 <procdump>:

void procdump(void) {
80104220:	55                   	push   %ebp
80104221:	89 e5                	mov    %esp,%ebp
80104223:	57                   	push   %edi
80104224:	56                   	push   %esi
80104225:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104228:	53                   	push   %ebx
80104229:	bb cc 70 11 80       	mov    $0x801170cc,%ebx
8010422e:	83 ec 3c             	sub    $0x3c,%esp
80104231:	eb 27                	jmp    8010425a <procdump+0x3a>
80104233:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        if (p->state == SLEEPING) {
            getcallerpcs((uint*)p->context->ebp + 2, pc);
            for (i = 0; i < 10 && pc[i] != 0; i++)
                cprintf(" %p", pc[i]);
        }
        cprintf("\n");
80104238:	83 ec 0c             	sub    $0xc,%esp
8010423b:	68 ed 78 10 80       	push   $0x801078ed
80104240:	e8 6b c4 ff ff       	call   801006b0 <cprintf>
80104245:	83 c4 10             	add    $0x10,%esp
    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80104248:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010424e:	81 fb cc 94 11 80    	cmp    $0x801194cc,%ebx
80104254:	0f 84 7e 00 00 00    	je     801042d8 <procdump+0xb8>
        if (p->state == UNUSED)
8010425a:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010425d:	85 c0                	test   %eax,%eax
8010425f:	74 e7                	je     80104248 <procdump+0x28>
            state = "???";
80104261:	ba 3f 77 10 80       	mov    $0x8010773f,%edx
        if (p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104266:	83 f8 05             	cmp    $0x5,%eax
80104269:	77 11                	ja     8010427c <procdump+0x5c>
8010426b:	8b 14 85 80 7d 10 80 	mov    -0x7fef8280(,%eax,4),%edx
            state = "???";
80104272:	b8 3f 77 10 80       	mov    $0x8010773f,%eax
80104277:	85 d2                	test   %edx,%edx
80104279:	0f 44 d0             	cmove  %eax,%edx
        cprintf("%d %s %s", p->pid, state, p->name);
8010427c:	53                   	push   %ebx
8010427d:	52                   	push   %edx
8010427e:	ff 73 a4             	push   -0x5c(%ebx)
80104281:	68 43 77 10 80       	push   $0x80107743
80104286:	e8 25 c4 ff ff       	call   801006b0 <cprintf>
        if (p->state == SLEEPING) {
8010428b:	83 c4 10             	add    $0x10,%esp
8010428e:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
80104292:	75 a4                	jne    80104238 <procdump+0x18>
            getcallerpcs((uint*)p->context->ebp + 2, pc);
80104294:	83 ec 08             	sub    $0x8,%esp
80104297:	8d 45 c0             	lea    -0x40(%ebp),%eax
8010429a:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010429d:	50                   	push   %eax
8010429e:	8b 43 b0             	mov    -0x50(%ebx),%eax
801042a1:	8b 40 0c             	mov    0xc(%eax),%eax
801042a4:	83 c0 08             	add    $0x8,%eax
801042a7:	50                   	push   %eax
801042a8:	e8 73 12 00 00       	call   80105520 <getcallerpcs>
            for (i = 0; i < 10 && pc[i] != 0; i++)
801042ad:	83 c4 10             	add    $0x10,%esp
801042b0:	8b 17                	mov    (%edi),%edx
801042b2:	85 d2                	test   %edx,%edx
801042b4:	74 82                	je     80104238 <procdump+0x18>
                cprintf(" %p", pc[i]);
801042b6:	83 ec 08             	sub    $0x8,%esp
            for (i = 0; i < 10 && pc[i] != 0; i++)
801042b9:	83 c7 04             	add    $0x4,%edi
                cprintf(" %p", pc[i]);
801042bc:	52                   	push   %edx
801042bd:	68 a1 74 10 80       	push   $0x801074a1
801042c2:	e8 e9 c3 ff ff       	call   801006b0 <cprintf>
            for (i = 0; i < 10 && pc[i] != 0; i++)
801042c7:	83 c4 10             	add    $0x10,%esp
801042ca:	39 f7                	cmp    %esi,%edi
801042cc:	75 e2                	jne    801042b0 <procdump+0x90>
801042ce:	e9 65 ff ff ff       	jmp    80104238 <procdump+0x18>
801042d3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    }
}
801042d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801042db:	5b                   	pop    %ebx
801042dc:	5e                   	pop    %esi
801042dd:	5f                   	pop    %edi
801042de:	5d                   	pop    %ebp
801042df:	c3                   	ret

801042e0 <spawn>:
#include <stdlib.h>
#include "types.h"
#include "user.h"
#include "fcntl.h"

int spawn(char *filename, int priority) { // Make this match user.h
801042e0:	55                   	push   %ebp
801042e1:	89 e5                	mov    %esp,%ebp
801042e3:	83 ec 08             	sub    $0x8,%esp
    // Implementation of spawn function
    // Use `priority` as needed within the function
    int pid = fork();
801042e6:	e8 a5 f6 ff ff       	call   80103990 <fork>
    if (pid == 0) {
801042eb:	85 c0                	test   %eax,%eax
801042ed:	74 0a                	je     801042f9 <spawn+0x19>
        return pid;
    } else {
        // Error occurred
        return -1;
    }
}
801042ef:	c9                   	leave
        return -1;
801042f0:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801042f5:	0f 4e c2             	cmovle %edx,%eax
}
801042f8:	c3                   	ret
        exec(filename, (char **)0);
801042f9:	50                   	push   %eax
801042fa:	50                   	push   %eax
801042fb:	6a 00                	push   $0x0
801042fd:	ff 75 08             	push   0x8(%ebp)
80104300:	e8 ab c7 ff ff       	call   80100ab0 <exec>
        exit(0);
80104305:	31 d2                	xor    %edx,%edx
80104307:	89 14 24             	mov    %edx,(%esp)
8010430a:	e8 01 f9 ff ff       	call   80103c10 <exit>
8010430f:	90                   	nop

80104310 <sys_shm_open>:
#include "syscall.h"

#include "defs.h"
#include "memlayout.h"

int sys_shm_open(void) {
80104310:	55                   	push   %ebp
80104311:	89 e5                	mov    %esp,%ebp
80104313:	83 ec 20             	sub    $0x20,%esp
    int size;
    if (argint(0, &size) < 0)
80104316:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104319:	50                   	push   %eax
8010431a:	6a 00                	push   $0x0
8010431c:	e8 df 00 00 00       	call   80104400 <argint>
80104321:	83 c4 10             	add    $0x10,%esp
80104324:	85 c0                	test   %eax,%eax
80104326:	78 10                	js     80104338 <sys_shm_open+0x28>
        return -1;
    
    void *shmem = kalloc();  // Allocates memory for shared memory
80104328:	e8 b3 e3 ff ff       	call   801026e0 <kalloc>
    if (!shmem)
8010432d:	85 c0                	test   %eax,%eax
8010432f:	74 07                	je     80104338 <sys_shm_open+0x28>
        return -1;

    // Additional shared memory initialization if necessary
    return (int)shmem;  // Return memory address as identifier
}
80104331:	c9                   	leave
80104332:	c3                   	ret
80104333:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80104338:	c9                   	leave
        return -1;
80104339:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010433e:	c3                   	ret
8010433f:	90                   	nop

80104340 <sys_shm_attach>:

int sys_shm_attach(void) {
80104340:	55                   	push   %ebp
80104341:	89 e5                	mov    %esp,%ebp
80104343:	83 ec 20             	sub    $0x20,%esp
    int shmid;
    if (argint(0, &shmid) < 0)
80104346:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104349:	50                   	push   %eax
8010434a:	6a 00                	push   $0x0
8010434c:	e8 af 00 00 00       	call   80104400 <argint>
80104351:	83 c4 10             	add    $0x10,%esp
80104354:	85 c0                	test   %eax,%eax
80104356:	78 05                	js     8010435d <sys_shm_attach+0x1d>
        return -1;

    // Attach shared memory segment here
    return shmid;
80104358:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
8010435b:	c9                   	leave
8010435c:	c3                   	ret
8010435d:	c9                   	leave
        return -1;
8010435e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104363:	c3                   	ret
80104364:	66 90                	xchg   %ax,%ax
80104366:	66 90                	xchg   %ax,%ax
80104368:	66 90                	xchg   %ax,%ax
8010436a:	66 90                	xchg   %ax,%ax
8010436c:	66 90                	xchg   %ax,%ax
8010436e:	66 90                	xchg   %ax,%ax

80104370 <fetchint>:
// library system call function. The saved user %esp points
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int fetchint(uint addr, int *ip)
{
80104370:	55                   	push   %ebp
80104371:	89 e5                	mov    %esp,%ebp
80104373:	53                   	push   %ebx
80104374:	83 ec 04             	sub    $0x4,%esp
80104377:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
8010437a:	e8 71 f4 ff ff       	call   801037f0 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010437f:	8b 40 0c             	mov    0xc(%eax),%eax
80104382:	39 c3                	cmp    %eax,%ebx
80104384:	73 1a                	jae    801043a0 <fetchint+0x30>
80104386:	8d 53 04             	lea    0x4(%ebx),%edx
80104389:	39 d0                	cmp    %edx,%eax
8010438b:	72 13                	jb     801043a0 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
8010438d:	8b 45 0c             	mov    0xc(%ebp),%eax
80104390:	8b 13                	mov    (%ebx),%edx
80104392:	89 10                	mov    %edx,(%eax)
  return 0;
80104394:	31 c0                	xor    %eax,%eax
}
80104396:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104399:	c9                   	leave
8010439a:	c3                   	ret
8010439b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return -1;
801043a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801043a5:	eb ef                	jmp    80104396 <fetchint+0x26>
801043a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801043ae:	00 
801043af:	90                   	nop

801043b0 <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int fetchstr(uint addr, char **pp)
{
801043b0:	55                   	push   %ebp
801043b1:	89 e5                	mov    %esp,%ebp
801043b3:	53                   	push   %ebx
801043b4:	83 ec 04             	sub    $0x4,%esp
801043b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
801043ba:	e8 31 f4 ff ff       	call   801037f0 <myproc>

  if(addr >= curproc->sz)
801043bf:	3b 58 0c             	cmp    0xc(%eax),%ebx
801043c2:	73 2c                	jae    801043f0 <fetchstr+0x40>
    return -1;
  *pp = (char*)addr;
801043c4:	8b 55 0c             	mov    0xc(%ebp),%edx
801043c7:	89 1a                	mov    %ebx,(%edx)
  ep = (char*)curproc->sz;
801043c9:	8b 50 0c             	mov    0xc(%eax),%edx
  for(s = *pp; s < ep; s++){
801043cc:	39 d3                	cmp    %edx,%ebx
801043ce:	73 20                	jae    801043f0 <fetchstr+0x40>
801043d0:	89 d8                	mov    %ebx,%eax
801043d2:	eb 0b                	jmp    801043df <fetchstr+0x2f>
801043d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801043d8:	83 c0 01             	add    $0x1,%eax
801043db:	39 d0                	cmp    %edx,%eax
801043dd:	73 11                	jae    801043f0 <fetchstr+0x40>
    if(*s == 0)
801043df:	80 38 00             	cmpb   $0x0,(%eax)
801043e2:	75 f4                	jne    801043d8 <fetchstr+0x28>
      return s - *pp;
801043e4:	29 d8                	sub    %ebx,%eax
  }
  return -1;
}
801043e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801043e9:	c9                   	leave
801043ea:	c3                   	ret
801043eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
801043f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return -1;
801043f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801043f8:	c9                   	leave
801043f9:	c3                   	ret
801043fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104400 <argint>:

// Fetch the nth 32-bit system call argument.
int argint(int n, int *ip)
{
80104400:	55                   	push   %ebp
80104401:	89 e5                	mov    %esp,%ebp
80104403:	56                   	push   %esi
80104404:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104405:	e8 e6 f3 ff ff       	call   801037f0 <myproc>
8010440a:	8b 55 08             	mov    0x8(%ebp),%edx
8010440d:	8b 40 24             	mov    0x24(%eax),%eax
80104410:	8b 40 44             	mov    0x44(%eax),%eax
80104413:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
80104416:	e8 d5 f3 ff ff       	call   801037f0 <myproc>
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
8010441b:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010441e:	8b 40 0c             	mov    0xc(%eax),%eax
80104421:	39 c6                	cmp    %eax,%esi
80104423:	73 1b                	jae    80104440 <argint+0x40>
80104425:	8d 53 08             	lea    0x8(%ebx),%edx
80104428:	39 d0                	cmp    %edx,%eax
8010442a:	72 14                	jb     80104440 <argint+0x40>
  *ip = *(int*)(addr);
8010442c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010442f:	8b 53 04             	mov    0x4(%ebx),%edx
80104432:	89 10                	mov    %edx,(%eax)
  return 0;
80104434:	31 c0                	xor    %eax,%eax
}
80104436:	5b                   	pop    %ebx
80104437:	5e                   	pop    %esi
80104438:	5d                   	pop    %ebp
80104439:	c3                   	ret
8010443a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80104440:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104445:	eb ef                	jmp    80104436 <argint+0x36>
80104447:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010444e:	00 
8010444f:	90                   	nop

80104450 <argptr>:

// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int argptr(int n, char **pp, int size)
{
80104450:	55                   	push   %ebp
80104451:	89 e5                	mov    %esp,%ebp
80104453:	57                   	push   %edi
80104454:	56                   	push   %esi
80104455:	53                   	push   %ebx
80104456:	83 ec 0c             	sub    $0xc,%esp
  int i;
  struct proc *curproc = myproc();
80104459:	e8 92 f3 ff ff       	call   801037f0 <myproc>
8010445e:	89 c6                	mov    %eax,%esi
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104460:	e8 8b f3 ff ff       	call   801037f0 <myproc>
80104465:	8b 55 08             	mov    0x8(%ebp),%edx
80104468:	8b 40 24             	mov    0x24(%eax),%eax
8010446b:	8b 40 44             	mov    0x44(%eax),%eax
8010446e:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
80104471:	e8 7a f3 ff ff       	call   801037f0 <myproc>
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104476:	8d 7b 04             	lea    0x4(%ebx),%edi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
80104479:	8b 40 0c             	mov    0xc(%eax),%eax
8010447c:	39 c7                	cmp    %eax,%edi
8010447e:	73 30                	jae    801044b0 <argptr+0x60>
80104480:	8d 4b 08             	lea    0x8(%ebx),%ecx
80104483:	39 c8                	cmp    %ecx,%eax
80104485:	72 29                	jb     801044b0 <argptr+0x60>
 
  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104487:	8b 55 10             	mov    0x10(%ebp),%edx
  *ip = *(int*)(addr);
8010448a:	8b 43 04             	mov    0x4(%ebx),%eax
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
8010448d:	85 d2                	test   %edx,%edx
8010448f:	78 1f                	js     801044b0 <argptr+0x60>
80104491:	8b 56 0c             	mov    0xc(%esi),%edx
80104494:	39 d0                	cmp    %edx,%eax
80104496:	73 18                	jae    801044b0 <argptr+0x60>
80104498:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010449b:	01 c3                	add    %eax,%ebx
8010449d:	39 da                	cmp    %ebx,%edx
8010449f:	72 0f                	jb     801044b0 <argptr+0x60>
    return -1;
  *pp = (char*)i;
801044a1:	8b 55 0c             	mov    0xc(%ebp),%edx
801044a4:	89 02                	mov    %eax,(%edx)
  return 0;
801044a6:	31 c0                	xor    %eax,%eax
}
801044a8:	83 c4 0c             	add    $0xc,%esp
801044ab:	5b                   	pop    %ebx
801044ac:	5e                   	pop    %esi
801044ad:	5f                   	pop    %edi
801044ae:	5d                   	pop    %ebp
801044af:	c3                   	ret
    return -1;
801044b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801044b5:	eb f1                	jmp    801044a8 <argptr+0x58>
801044b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801044be:	00 
801044bf:	90                   	nop

801044c0 <argstr>:
// Fetch the nth word-sized system call argument as a string pointer.
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int argstr(int n, char **pp)
{
801044c0:	55                   	push   %ebp
801044c1:	89 e5                	mov    %esp,%ebp
801044c3:	56                   	push   %esi
801044c4:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801044c5:	e8 26 f3 ff ff       	call   801037f0 <myproc>
801044ca:	8b 55 08             	mov    0x8(%ebp),%edx
801044cd:	8b 40 24             	mov    0x24(%eax),%eax
801044d0:	8b 40 44             	mov    0x44(%eax),%eax
801044d3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
801044d6:	e8 15 f3 ff ff       	call   801037f0 <myproc>
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801044db:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
801044de:	8b 40 0c             	mov    0xc(%eax),%eax
801044e1:	39 c6                	cmp    %eax,%esi
801044e3:	73 43                	jae    80104528 <argstr+0x68>
801044e5:	8d 53 08             	lea    0x8(%ebx),%edx
801044e8:	39 d0                	cmp    %edx,%eax
801044ea:	72 3c                	jb     80104528 <argstr+0x68>
  *ip = *(int*)(addr);
801044ec:	8b 5b 04             	mov    0x4(%ebx),%ebx
  struct proc *curproc = myproc();
801044ef:	e8 fc f2 ff ff       	call   801037f0 <myproc>
  if(addr >= curproc->sz)
801044f4:	3b 58 0c             	cmp    0xc(%eax),%ebx
801044f7:	73 2f                	jae    80104528 <argstr+0x68>
  *pp = (char*)addr;
801044f9:	8b 55 0c             	mov    0xc(%ebp),%edx
801044fc:	89 1a                	mov    %ebx,(%edx)
  ep = (char*)curproc->sz;
801044fe:	8b 50 0c             	mov    0xc(%eax),%edx
  for(s = *pp; s < ep; s++){
80104501:	39 d3                	cmp    %edx,%ebx
80104503:	73 23                	jae    80104528 <argstr+0x68>
80104505:	89 d8                	mov    %ebx,%eax
80104507:	eb 0e                	jmp    80104517 <argstr+0x57>
80104509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104510:	83 c0 01             	add    $0x1,%eax
80104513:	39 d0                	cmp    %edx,%eax
80104515:	73 11                	jae    80104528 <argstr+0x68>
    if(*s == 0)
80104517:	80 38 00             	cmpb   $0x0,(%eax)
8010451a:	75 f4                	jne    80104510 <argstr+0x50>
      return s - *pp;
8010451c:	29 d8                	sub    %ebx,%eax
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
8010451e:	5b                   	pop    %ebx
8010451f:	5e                   	pop    %esi
80104520:	5d                   	pop    %ebp
80104521:	c3                   	ret
80104522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104528:	5b                   	pop    %ebx
    return -1;
80104529:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010452e:	5e                   	pop    %esi
8010452f:	5d                   	pop    %ebp
80104530:	c3                   	ret
80104531:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104538:	00 
80104539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104540 <syscall>:
    [SYS_thread_join]    sys_thread_join
};


void syscall(void)
{
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	53                   	push   %ebx
80104544:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
80104547:	e8 a4 f2 ff ff       	call   801037f0 <myproc>
8010454c:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
8010454e:	8b 40 24             	mov    0x24(%eax),%eax
80104551:	8b 40 1c             	mov    0x1c(%eax),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104554:	8d 50 ff             	lea    -0x1(%eax),%edx
80104557:	83 fa 1c             	cmp    $0x1c,%edx
8010455a:	77 24                	ja     80104580 <syscall+0x40>
8010455c:	8b 14 85 a0 7d 10 80 	mov    -0x7fef8260(,%eax,4),%edx
80104563:	85 d2                	test   %edx,%edx
80104565:	74 19                	je     80104580 <syscall+0x40>
    curproc->tf->eax = syscalls[num]();
80104567:	ff d2                	call   *%edx
80104569:	89 c2                	mov    %eax,%edx
8010456b:	8b 43 24             	mov    0x24(%ebx),%eax
8010456e:	89 50 1c             	mov    %edx,0x1c(%eax)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
80104571:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104574:	c9                   	leave
80104575:	c3                   	ret
80104576:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010457d:	00 
8010457e:	66 90                	xchg   %ax,%ax
    cprintf("%d %s: unknown sys call %d\n",
80104580:	50                   	push   %eax
            curproc->pid, curproc->name, num);
80104581:	8d 43 78             	lea    0x78(%ebx),%eax
    cprintf("%d %s: unknown sys call %d\n",
80104584:	50                   	push   %eax
80104585:	ff 73 1c             	push   0x1c(%ebx)
80104588:	68 76 77 10 80       	push   $0x80107776
8010458d:	e8 1e c1 ff ff       	call   801006b0 <cprintf>
    curproc->tf->eax = -1;
80104592:	8b 43 24             	mov    0x24(%ebx),%eax
80104595:	83 c4 10             	add    $0x10,%esp
80104598:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
8010459f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801045a2:	c9                   	leave
801045a3:	c3                   	ret
801045a4:	66 90                	xchg   %ax,%ax
801045a6:	66 90                	xchg   %ax,%ax
801045a8:	66 90                	xchg   %ax,%ax
801045aa:	66 90                	xchg   %ax,%ax
801045ac:	66 90                	xchg   %ax,%ax
801045ae:	66 90                	xchg   %ax,%ax

801045b0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801045b0:	55                   	push   %ebp
801045b1:	89 e5                	mov    %esp,%ebp
801045b3:	57                   	push   %edi
801045b4:	56                   	push   %esi
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801045b5:	8d 7d da             	lea    -0x26(%ebp),%edi
{
801045b8:	53                   	push   %ebx
801045b9:	83 ec 34             	sub    $0x34,%esp
801045bc:	89 4d d0             	mov    %ecx,-0x30(%ebp)
801045bf:	8b 4d 08             	mov    0x8(%ebp),%ecx
801045c2:	89 55 d4             	mov    %edx,-0x2c(%ebp)
801045c5:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  if((dp = nameiparent(path, name)) == 0)
801045c8:	57                   	push   %edi
801045c9:	50                   	push   %eax
801045ca:	e8 51 db ff ff       	call   80102120 <nameiparent>
801045cf:	83 c4 10             	add    $0x10,%esp
801045d2:	85 c0                	test   %eax,%eax
801045d4:	74 5e                	je     80104634 <create+0x84>
    return 0;
  ilock(dp);
801045d6:	83 ec 0c             	sub    $0xc,%esp
801045d9:	89 c3                	mov    %eax,%ebx
801045db:	50                   	push   %eax
801045dc:	e8 0f d2 ff ff       	call   801017f0 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
801045e1:	83 c4 0c             	add    $0xc,%esp
801045e4:	6a 00                	push   $0x0
801045e6:	57                   	push   %edi
801045e7:	53                   	push   %ebx
801045e8:	e8 83 d7 ff ff       	call   80101d70 <dirlookup>
801045ed:	83 c4 10             	add    $0x10,%esp
801045f0:	89 c6                	mov    %eax,%esi
801045f2:	85 c0                	test   %eax,%eax
801045f4:	74 4a                	je     80104640 <create+0x90>
    iunlockput(dp);
801045f6:	83 ec 0c             	sub    $0xc,%esp
801045f9:	53                   	push   %ebx
801045fa:	e8 91 d4 ff ff       	call   80101a90 <iunlockput>
    ilock(ip);
801045ff:	89 34 24             	mov    %esi,(%esp)
80104602:	e8 e9 d1 ff ff       	call   801017f0 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104607:	83 c4 10             	add    $0x10,%esp
8010460a:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
8010460f:	75 17                	jne    80104628 <create+0x78>
80104611:	66 83 7e 50 02       	cmpw   $0x2,0x50(%esi)
80104616:	75 10                	jne    80104628 <create+0x78>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104618:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010461b:	89 f0                	mov    %esi,%eax
8010461d:	5b                   	pop    %ebx
8010461e:	5e                   	pop    %esi
8010461f:	5f                   	pop    %edi
80104620:	5d                   	pop    %ebp
80104621:	c3                   	ret
80104622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iunlockput(ip);
80104628:	83 ec 0c             	sub    $0xc,%esp
8010462b:	56                   	push   %esi
8010462c:	e8 5f d4 ff ff       	call   80101a90 <iunlockput>
    return 0;
80104631:	83 c4 10             	add    $0x10,%esp
}
80104634:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
80104637:	31 f6                	xor    %esi,%esi
}
80104639:	5b                   	pop    %ebx
8010463a:	89 f0                	mov    %esi,%eax
8010463c:	5e                   	pop    %esi
8010463d:	5f                   	pop    %edi
8010463e:	5d                   	pop    %ebp
8010463f:	c3                   	ret
  if((ip = ialloc(dp->dev, type)) == 0)
80104640:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104644:	83 ec 08             	sub    $0x8,%esp
80104647:	50                   	push   %eax
80104648:	ff 33                	push   (%ebx)
8010464a:	e8 01 d0 ff ff       	call   80101650 <ialloc>
8010464f:	83 c4 10             	add    $0x10,%esp
80104652:	89 c6                	mov    %eax,%esi
80104654:	85 c0                	test   %eax,%eax
80104656:	0f 84 bc 00 00 00    	je     80104718 <create+0x168>
  ilock(ip);
8010465c:	83 ec 0c             	sub    $0xc,%esp
8010465f:	50                   	push   %eax
80104660:	e8 8b d1 ff ff       	call   801017f0 <ilock>
  ip->major = major;
80104665:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104669:	66 89 46 52          	mov    %ax,0x52(%esi)
  ip->minor = minor;
8010466d:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
80104671:	66 89 46 54          	mov    %ax,0x54(%esi)
  ip->nlink = 1;
80104675:	b8 01 00 00 00       	mov    $0x1,%eax
8010467a:	66 89 46 56          	mov    %ax,0x56(%esi)
  iupdate(ip);
8010467e:	89 34 24             	mov    %esi,(%esp)
80104681:	e8 9a d0 ff ff       	call   80101720 <iupdate>
  if(type == T_DIR){  // Create . and .. entries.
80104686:	83 c4 10             	add    $0x10,%esp
80104689:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
8010468e:	74 30                	je     801046c0 <create+0x110>
  if(dirlink(dp, name, ip->inum) < 0)
80104690:	83 ec 04             	sub    $0x4,%esp
80104693:	ff 76 04             	push   0x4(%esi)
80104696:	57                   	push   %edi
80104697:	53                   	push   %ebx
80104698:	e8 a3 d9 ff ff       	call   80102040 <dirlink>
8010469d:	83 c4 10             	add    $0x10,%esp
801046a0:	85 c0                	test   %eax,%eax
801046a2:	78 67                	js     8010470b <create+0x15b>
  iunlockput(dp);
801046a4:	83 ec 0c             	sub    $0xc,%esp
801046a7:	53                   	push   %ebx
801046a8:	e8 e3 d3 ff ff       	call   80101a90 <iunlockput>
  return ip;
801046ad:	83 c4 10             	add    $0x10,%esp
}
801046b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801046b3:	89 f0                	mov    %esi,%eax
801046b5:	5b                   	pop    %ebx
801046b6:	5e                   	pop    %esi
801046b7:	5f                   	pop    %edi
801046b8:	5d                   	pop    %ebp
801046b9:	c3                   	ret
801046ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iupdate(dp);
801046c0:	83 ec 0c             	sub    $0xc,%esp
    dp->nlink++;  // for ".."
801046c3:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
    iupdate(dp);
801046c8:	53                   	push   %ebx
801046c9:	e8 52 d0 ff ff       	call   80101720 <iupdate>
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
801046ce:	83 c4 0c             	add    $0xc,%esp
801046d1:	ff 76 04             	push   0x4(%esi)
801046d4:	68 ae 77 10 80       	push   $0x801077ae
801046d9:	56                   	push   %esi
801046da:	e8 61 d9 ff ff       	call   80102040 <dirlink>
801046df:	83 c4 10             	add    $0x10,%esp
801046e2:	85 c0                	test   %eax,%eax
801046e4:	78 18                	js     801046fe <create+0x14e>
801046e6:	83 ec 04             	sub    $0x4,%esp
801046e9:	ff 73 04             	push   0x4(%ebx)
801046ec:	68 ad 77 10 80       	push   $0x801077ad
801046f1:	56                   	push   %esi
801046f2:	e8 49 d9 ff ff       	call   80102040 <dirlink>
801046f7:	83 c4 10             	add    $0x10,%esp
801046fa:	85 c0                	test   %eax,%eax
801046fc:	79 92                	jns    80104690 <create+0xe0>
      panic("create dots");
801046fe:	83 ec 0c             	sub    $0xc,%esp
80104701:	68 a1 77 10 80       	push   $0x801077a1
80104706:	e8 75 bc ff ff       	call   80100380 <panic>
    panic("create: dirlink");
8010470b:	83 ec 0c             	sub    $0xc,%esp
8010470e:	68 b0 77 10 80       	push   $0x801077b0
80104713:	e8 68 bc ff ff       	call   80100380 <panic>
    panic("create: ialloc");
80104718:	83 ec 0c             	sub    $0xc,%esp
8010471b:	68 92 77 10 80       	push   $0x80107792
80104720:	e8 5b bc ff ff       	call   80100380 <panic>
80104725:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010472c:	00 
8010472d:	8d 76 00             	lea    0x0(%esi),%esi

80104730 <sys_dup>:
{
80104730:	55                   	push   %ebp
80104731:	89 e5                	mov    %esp,%ebp
80104733:	56                   	push   %esi
80104734:	53                   	push   %ebx
  if(argint(n, &fd) < 0)
80104735:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80104738:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
8010473b:	50                   	push   %eax
8010473c:	6a 00                	push   $0x0
8010473e:	e8 bd fc ff ff       	call   80104400 <argint>
80104743:	83 c4 10             	add    $0x10,%esp
80104746:	85 c0                	test   %eax,%eax
80104748:	78 36                	js     80104780 <sys_dup+0x50>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
8010474a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010474e:	77 30                	ja     80104780 <sys_dup+0x50>
80104750:	e8 9b f0 ff ff       	call   801037f0 <myproc>
80104755:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104758:	8b 74 90 34          	mov    0x34(%eax,%edx,4),%esi
8010475c:	85 f6                	test   %esi,%esi
8010475e:	74 20                	je     80104780 <sys_dup+0x50>
  struct proc *curproc = myproc();
80104760:	e8 8b f0 ff ff       	call   801037f0 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
80104765:	31 db                	xor    %ebx,%ebx
80104767:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010476e:	00 
8010476f:	90                   	nop
    if(curproc->ofile[fd] == 0){
80104770:	8b 54 98 34          	mov    0x34(%eax,%ebx,4),%edx
80104774:	85 d2                	test   %edx,%edx
80104776:	74 18                	je     80104790 <sys_dup+0x60>
  for(fd = 0; fd < NOFILE; fd++){
80104778:	83 c3 01             	add    $0x1,%ebx
8010477b:	83 fb 10             	cmp    $0x10,%ebx
8010477e:	75 f0                	jne    80104770 <sys_dup+0x40>
}
80104780:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return -1;
80104783:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
}
80104788:	89 d8                	mov    %ebx,%eax
8010478a:	5b                   	pop    %ebx
8010478b:	5e                   	pop    %esi
8010478c:	5d                   	pop    %ebp
8010478d:	c3                   	ret
8010478e:	66 90                	xchg   %ax,%ax
  filedup(f);
80104790:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
80104793:	89 74 98 34          	mov    %esi,0x34(%eax,%ebx,4)
  filedup(f);
80104797:	56                   	push   %esi
80104798:	e8 23 c7 ff ff       	call   80100ec0 <filedup>
  return fd;
8010479d:	83 c4 10             	add    $0x10,%esp
}
801047a0:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047a3:	89 d8                	mov    %ebx,%eax
801047a5:	5b                   	pop    %ebx
801047a6:	5e                   	pop    %esi
801047a7:	5d                   	pop    %ebp
801047a8:	c3                   	ret
801047a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801047b0 <sys_read>:
{
801047b0:	55                   	push   %ebp
801047b1:	89 e5                	mov    %esp,%ebp
801047b3:	56                   	push   %esi
801047b4:	53                   	push   %ebx
  if(argint(n, &fd) < 0)
801047b5:	8d 5d f4             	lea    -0xc(%ebp),%ebx
{
801047b8:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
801047bb:	53                   	push   %ebx
801047bc:	6a 00                	push   $0x0
801047be:	e8 3d fc ff ff       	call   80104400 <argint>
801047c3:	83 c4 10             	add    $0x10,%esp
801047c6:	85 c0                	test   %eax,%eax
801047c8:	78 5e                	js     80104828 <sys_read+0x78>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
801047ca:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
801047ce:	77 58                	ja     80104828 <sys_read+0x78>
801047d0:	e8 1b f0 ff ff       	call   801037f0 <myproc>
801047d5:	8b 55 f4             	mov    -0xc(%ebp),%edx
801047d8:	8b 74 90 34          	mov    0x34(%eax,%edx,4),%esi
801047dc:	85 f6                	test   %esi,%esi
801047de:	74 48                	je     80104828 <sys_read+0x78>
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
801047e0:	83 ec 08             	sub    $0x8,%esp
801047e3:	8d 45 f0             	lea    -0x10(%ebp),%eax
801047e6:	50                   	push   %eax
801047e7:	6a 02                	push   $0x2
801047e9:	e8 12 fc ff ff       	call   80104400 <argint>
801047ee:	83 c4 10             	add    $0x10,%esp
801047f1:	85 c0                	test   %eax,%eax
801047f3:	78 33                	js     80104828 <sys_read+0x78>
801047f5:	83 ec 04             	sub    $0x4,%esp
801047f8:	ff 75 f0             	push   -0x10(%ebp)
801047fb:	53                   	push   %ebx
801047fc:	6a 01                	push   $0x1
801047fe:	e8 4d fc ff ff       	call   80104450 <argptr>
80104803:	83 c4 10             	add    $0x10,%esp
80104806:	85 c0                	test   %eax,%eax
80104808:	78 1e                	js     80104828 <sys_read+0x78>
  return fileread(f, p, n);
8010480a:	83 ec 04             	sub    $0x4,%esp
8010480d:	ff 75 f0             	push   -0x10(%ebp)
80104810:	ff 75 f4             	push   -0xc(%ebp)
80104813:	56                   	push   %esi
80104814:	e8 27 c8 ff ff       	call   80101040 <fileread>
80104819:	83 c4 10             	add    $0x10,%esp
}
8010481c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010481f:	5b                   	pop    %ebx
80104820:	5e                   	pop    %esi
80104821:	5d                   	pop    %ebp
80104822:	c3                   	ret
80104823:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return -1;
80104828:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010482d:	eb ed                	jmp    8010481c <sys_read+0x6c>
8010482f:	90                   	nop

80104830 <sys_write>:
{
80104830:	55                   	push   %ebp
80104831:	89 e5                	mov    %esp,%ebp
80104833:	56                   	push   %esi
80104834:	53                   	push   %ebx
  if(argint(n, &fd) < 0)
80104835:	8d 5d f4             	lea    -0xc(%ebp),%ebx
{
80104838:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
8010483b:	53                   	push   %ebx
8010483c:	6a 00                	push   $0x0
8010483e:	e8 bd fb ff ff       	call   80104400 <argint>
80104843:	83 c4 10             	add    $0x10,%esp
80104846:	85 c0                	test   %eax,%eax
80104848:	78 5e                	js     801048a8 <sys_write+0x78>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
8010484a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010484e:	77 58                	ja     801048a8 <sys_write+0x78>
80104850:	e8 9b ef ff ff       	call   801037f0 <myproc>
80104855:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104858:	8b 74 90 34          	mov    0x34(%eax,%edx,4),%esi
8010485c:	85 f6                	test   %esi,%esi
8010485e:	74 48                	je     801048a8 <sys_write+0x78>
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104860:	83 ec 08             	sub    $0x8,%esp
80104863:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104866:	50                   	push   %eax
80104867:	6a 02                	push   $0x2
80104869:	e8 92 fb ff ff       	call   80104400 <argint>
8010486e:	83 c4 10             	add    $0x10,%esp
80104871:	85 c0                	test   %eax,%eax
80104873:	78 33                	js     801048a8 <sys_write+0x78>
80104875:	83 ec 04             	sub    $0x4,%esp
80104878:	ff 75 f0             	push   -0x10(%ebp)
8010487b:	53                   	push   %ebx
8010487c:	6a 01                	push   $0x1
8010487e:	e8 cd fb ff ff       	call   80104450 <argptr>
80104883:	83 c4 10             	add    $0x10,%esp
80104886:	85 c0                	test   %eax,%eax
80104888:	78 1e                	js     801048a8 <sys_write+0x78>
  return filewrite(f, p, n);
8010488a:	83 ec 04             	sub    $0x4,%esp
8010488d:	ff 75 f0             	push   -0x10(%ebp)
80104890:	ff 75 f4             	push   -0xc(%ebp)
80104893:	56                   	push   %esi
80104894:	e8 37 c8 ff ff       	call   801010d0 <filewrite>
80104899:	83 c4 10             	add    $0x10,%esp
}
8010489c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010489f:	5b                   	pop    %ebx
801048a0:	5e                   	pop    %esi
801048a1:	5d                   	pop    %ebp
801048a2:	c3                   	ret
801048a3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    return -1;
801048a8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801048ad:	eb ed                	jmp    8010489c <sys_write+0x6c>
801048af:	90                   	nop

801048b0 <sys_close>:
{
801048b0:	55                   	push   %ebp
801048b1:	89 e5                	mov    %esp,%ebp
801048b3:	56                   	push   %esi
801048b4:	53                   	push   %ebx
  if(argint(n, &fd) < 0)
801048b5:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
801048b8:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
801048bb:	50                   	push   %eax
801048bc:	6a 00                	push   $0x0
801048be:	e8 3d fb ff ff       	call   80104400 <argint>
801048c3:	83 c4 10             	add    $0x10,%esp
801048c6:	85 c0                	test   %eax,%eax
801048c8:	78 3e                	js     80104908 <sys_close+0x58>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
801048ca:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
801048ce:	77 38                	ja     80104908 <sys_close+0x58>
801048d0:	e8 1b ef ff ff       	call   801037f0 <myproc>
801048d5:	8b 55 f4             	mov    -0xc(%ebp),%edx
801048d8:	8d 5a 0c             	lea    0xc(%edx),%ebx
801048db:	8b 74 98 04          	mov    0x4(%eax,%ebx,4),%esi
801048df:	85 f6                	test   %esi,%esi
801048e1:	74 25                	je     80104908 <sys_close+0x58>
  myproc()->ofile[fd] = 0;
801048e3:	e8 08 ef ff ff       	call   801037f0 <myproc>
  fileclose(f);
801048e8:	83 ec 0c             	sub    $0xc,%esp
  myproc()->ofile[fd] = 0;
801048eb:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
801048f2:	00 
  fileclose(f);
801048f3:	56                   	push   %esi
801048f4:	e8 17 c6 ff ff       	call   80100f10 <fileclose>
  return 0;
801048f9:	83 c4 10             	add    $0x10,%esp
801048fc:	31 c0                	xor    %eax,%eax
}
801048fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104901:	5b                   	pop    %ebx
80104902:	5e                   	pop    %esi
80104903:	5d                   	pop    %ebp
80104904:	c3                   	ret
80104905:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80104908:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010490d:	eb ef                	jmp    801048fe <sys_close+0x4e>
8010490f:	90                   	nop

80104910 <sys_fstat>:
{
80104910:	55                   	push   %ebp
80104911:	89 e5                	mov    %esp,%ebp
80104913:	56                   	push   %esi
80104914:	53                   	push   %ebx
  if(argint(n, &fd) < 0)
80104915:	8d 5d f4             	lea    -0xc(%ebp),%ebx
{
80104918:	83 ec 18             	sub    $0x18,%esp
  if(argint(n, &fd) < 0)
8010491b:	53                   	push   %ebx
8010491c:	6a 00                	push   $0x0
8010491e:	e8 dd fa ff ff       	call   80104400 <argint>
80104923:	83 c4 10             	add    $0x10,%esp
80104926:	85 c0                	test   %eax,%eax
80104928:	78 46                	js     80104970 <sys_fstat+0x60>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
8010492a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010492e:	77 40                	ja     80104970 <sys_fstat+0x60>
80104930:	e8 bb ee ff ff       	call   801037f0 <myproc>
80104935:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104938:	8b 74 90 34          	mov    0x34(%eax,%edx,4),%esi
8010493c:	85 f6                	test   %esi,%esi
8010493e:	74 30                	je     80104970 <sys_fstat+0x60>
  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104940:	83 ec 04             	sub    $0x4,%esp
80104943:	6a 10                	push   $0x10
80104945:	53                   	push   %ebx
80104946:	6a 01                	push   $0x1
80104948:	e8 03 fb ff ff       	call   80104450 <argptr>
8010494d:	83 c4 10             	add    $0x10,%esp
80104950:	85 c0                	test   %eax,%eax
80104952:	78 1c                	js     80104970 <sys_fstat+0x60>
  return filestat(f, st);
80104954:	83 ec 08             	sub    $0x8,%esp
80104957:	ff 75 f4             	push   -0xc(%ebp)
8010495a:	56                   	push   %esi
8010495b:	e8 90 c6 ff ff       	call   80100ff0 <filestat>
80104960:	83 c4 10             	add    $0x10,%esp
}
80104963:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104966:	5b                   	pop    %ebx
80104967:	5e                   	pop    %esi
80104968:	5d                   	pop    %ebp
80104969:	c3                   	ret
8010496a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80104970:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104975:	eb ec                	jmp    80104963 <sys_fstat+0x53>
80104977:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010497e:	00 
8010497f:	90                   	nop

80104980 <sys_link>:
{
80104980:	55                   	push   %ebp
80104981:	89 e5                	mov    %esp,%ebp
80104983:	57                   	push   %edi
80104984:	56                   	push   %esi
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104985:	8d 45 d4             	lea    -0x2c(%ebp),%eax
{
80104988:	53                   	push   %ebx
80104989:	83 ec 34             	sub    $0x34,%esp
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
8010498c:	50                   	push   %eax
8010498d:	6a 00                	push   $0x0
8010498f:	e8 2c fb ff ff       	call   801044c0 <argstr>
80104994:	83 c4 10             	add    $0x10,%esp
80104997:	85 c0                	test   %eax,%eax
80104999:	0f 88 fb 00 00 00    	js     80104a9a <sys_link+0x11a>
8010499f:	83 ec 08             	sub    $0x8,%esp
801049a2:	8d 45 d0             	lea    -0x30(%ebp),%eax
801049a5:	50                   	push   %eax
801049a6:	6a 01                	push   $0x1
801049a8:	e8 13 fb ff ff       	call   801044c0 <argstr>
801049ad:	83 c4 10             	add    $0x10,%esp
801049b0:	85 c0                	test   %eax,%eax
801049b2:	0f 88 e2 00 00 00    	js     80104a9a <sys_link+0x11a>
  begin_op();
801049b8:	e8 03 e4 ff ff       	call   80102dc0 <begin_op>
  if((ip = namei(old)) == 0){
801049bd:	83 ec 0c             	sub    $0xc,%esp
801049c0:	ff 75 d4             	push   -0x2c(%ebp)
801049c3:	e8 38 d7 ff ff       	call   80102100 <namei>
801049c8:	83 c4 10             	add    $0x10,%esp
801049cb:	89 c3                	mov    %eax,%ebx
801049cd:	85 c0                	test   %eax,%eax
801049cf:	0f 84 df 00 00 00    	je     80104ab4 <sys_link+0x134>
  ilock(ip);
801049d5:	83 ec 0c             	sub    $0xc,%esp
801049d8:	50                   	push   %eax
801049d9:	e8 12 ce ff ff       	call   801017f0 <ilock>
  if(ip->type == T_DIR){
801049de:	83 c4 10             	add    $0x10,%esp
801049e1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801049e6:	0f 84 b5 00 00 00    	je     80104aa1 <sys_link+0x121>
  iupdate(ip);
801049ec:	83 ec 0c             	sub    $0xc,%esp
  ip->nlink++;
801049ef:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  if((dp = nameiparent(new, name)) == 0)
801049f4:	8d 7d da             	lea    -0x26(%ebp),%edi
  iupdate(ip);
801049f7:	53                   	push   %ebx
801049f8:	e8 23 cd ff ff       	call   80101720 <iupdate>
  iunlock(ip);
801049fd:	89 1c 24             	mov    %ebx,(%esp)
80104a00:	e8 db ce ff ff       	call   801018e0 <iunlock>
  if((dp = nameiparent(new, name)) == 0)
80104a05:	58                   	pop    %eax
80104a06:	5a                   	pop    %edx
80104a07:	57                   	push   %edi
80104a08:	ff 75 d0             	push   -0x30(%ebp)
80104a0b:	e8 10 d7 ff ff       	call   80102120 <nameiparent>
80104a10:	83 c4 10             	add    $0x10,%esp
80104a13:	89 c6                	mov    %eax,%esi
80104a15:	85 c0                	test   %eax,%eax
80104a17:	74 5b                	je     80104a74 <sys_link+0xf4>
  ilock(dp);
80104a19:	83 ec 0c             	sub    $0xc,%esp
80104a1c:	50                   	push   %eax
80104a1d:	e8 ce cd ff ff       	call   801017f0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104a22:	8b 03                	mov    (%ebx),%eax
80104a24:	83 c4 10             	add    $0x10,%esp
80104a27:	39 06                	cmp    %eax,(%esi)
80104a29:	75 3d                	jne    80104a68 <sys_link+0xe8>
80104a2b:	83 ec 04             	sub    $0x4,%esp
80104a2e:	ff 73 04             	push   0x4(%ebx)
80104a31:	57                   	push   %edi
80104a32:	56                   	push   %esi
80104a33:	e8 08 d6 ff ff       	call   80102040 <dirlink>
80104a38:	83 c4 10             	add    $0x10,%esp
80104a3b:	85 c0                	test   %eax,%eax
80104a3d:	78 29                	js     80104a68 <sys_link+0xe8>
  iunlockput(dp);
80104a3f:	83 ec 0c             	sub    $0xc,%esp
80104a42:	56                   	push   %esi
80104a43:	e8 48 d0 ff ff       	call   80101a90 <iunlockput>
  iput(ip);
80104a48:	89 1c 24             	mov    %ebx,(%esp)
80104a4b:	e8 e0 ce ff ff       	call   80101930 <iput>
  end_op();
80104a50:	e8 db e3 ff ff       	call   80102e30 <end_op>
  return 0;
80104a55:	83 c4 10             	add    $0x10,%esp
80104a58:	31 c0                	xor    %eax,%eax
}
80104a5a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a5d:	5b                   	pop    %ebx
80104a5e:	5e                   	pop    %esi
80104a5f:	5f                   	pop    %edi
80104a60:	5d                   	pop    %ebp
80104a61:	c3                   	ret
80104a62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    iunlockput(dp);
80104a68:	83 ec 0c             	sub    $0xc,%esp
80104a6b:	56                   	push   %esi
80104a6c:	e8 1f d0 ff ff       	call   80101a90 <iunlockput>
    goto bad;
80104a71:	83 c4 10             	add    $0x10,%esp
  ilock(ip);
80104a74:	83 ec 0c             	sub    $0xc,%esp
80104a77:	53                   	push   %ebx
80104a78:	e8 73 cd ff ff       	call   801017f0 <ilock>
  ip->nlink--;
80104a7d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104a82:	89 1c 24             	mov    %ebx,(%esp)
80104a85:	e8 96 cc ff ff       	call   80101720 <iupdate>
  iunlockput(ip);
80104a8a:	89 1c 24             	mov    %ebx,(%esp)
80104a8d:	e8 fe cf ff ff       	call   80101a90 <iunlockput>
  end_op();
80104a92:	e8 99 e3 ff ff       	call   80102e30 <end_op>
  return -1;
80104a97:	83 c4 10             	add    $0x10,%esp
    return -1;
80104a9a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a9f:	eb b9                	jmp    80104a5a <sys_link+0xda>
    iunlockput(ip);
80104aa1:	83 ec 0c             	sub    $0xc,%esp
80104aa4:	53                   	push   %ebx
80104aa5:	e8 e6 cf ff ff       	call   80101a90 <iunlockput>
    end_op();
80104aaa:	e8 81 e3 ff ff       	call   80102e30 <end_op>
    return -1;
80104aaf:	83 c4 10             	add    $0x10,%esp
80104ab2:	eb e6                	jmp    80104a9a <sys_link+0x11a>
    end_op();
80104ab4:	e8 77 e3 ff ff       	call   80102e30 <end_op>
    return -1;
80104ab9:	eb df                	jmp    80104a9a <sys_link+0x11a>
80104abb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80104ac0 <sys_unlink>:
{
80104ac0:	55                   	push   %ebp
80104ac1:	89 e5                	mov    %esp,%ebp
80104ac3:	57                   	push   %edi
80104ac4:	56                   	push   %esi
  if(argstr(0, &path) < 0)
80104ac5:	8d 45 c0             	lea    -0x40(%ebp),%eax
{
80104ac8:	53                   	push   %ebx
80104ac9:	83 ec 54             	sub    $0x54,%esp
  if(argstr(0, &path) < 0)
80104acc:	50                   	push   %eax
80104acd:	6a 00                	push   $0x0
80104acf:	e8 ec f9 ff ff       	call   801044c0 <argstr>
80104ad4:	83 c4 10             	add    $0x10,%esp
80104ad7:	85 c0                	test   %eax,%eax
80104ad9:	0f 88 54 01 00 00    	js     80104c33 <sys_unlink+0x173>
  begin_op();
80104adf:	e8 dc e2 ff ff       	call   80102dc0 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104ae4:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104ae7:	83 ec 08             	sub    $0x8,%esp
80104aea:	53                   	push   %ebx
80104aeb:	ff 75 c0             	push   -0x40(%ebp)
80104aee:	e8 2d d6 ff ff       	call   80102120 <nameiparent>
80104af3:	83 c4 10             	add    $0x10,%esp
80104af6:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104af9:	85 c0                	test   %eax,%eax
80104afb:	0f 84 58 01 00 00    	je     80104c59 <sys_unlink+0x199>
  ilock(dp);
80104b01:	8b 7d b4             	mov    -0x4c(%ebp),%edi
80104b04:	83 ec 0c             	sub    $0xc,%esp
80104b07:	57                   	push   %edi
80104b08:	e8 e3 cc ff ff       	call   801017f0 <ilock>
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104b0d:	58                   	pop    %eax
80104b0e:	5a                   	pop    %edx
80104b0f:	68 ae 77 10 80       	push   $0x801077ae
80104b14:	53                   	push   %ebx
80104b15:	e8 36 d2 ff ff       	call   80101d50 <namecmp>
80104b1a:	83 c4 10             	add    $0x10,%esp
80104b1d:	85 c0                	test   %eax,%eax
80104b1f:	0f 84 fb 00 00 00    	je     80104c20 <sys_unlink+0x160>
80104b25:	83 ec 08             	sub    $0x8,%esp
80104b28:	68 ad 77 10 80       	push   $0x801077ad
80104b2d:	53                   	push   %ebx
80104b2e:	e8 1d d2 ff ff       	call   80101d50 <namecmp>
80104b33:	83 c4 10             	add    $0x10,%esp
80104b36:	85 c0                	test   %eax,%eax
80104b38:	0f 84 e2 00 00 00    	je     80104c20 <sys_unlink+0x160>
  if((ip = dirlookup(dp, name, &off)) == 0)
80104b3e:	83 ec 04             	sub    $0x4,%esp
80104b41:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104b44:	50                   	push   %eax
80104b45:	53                   	push   %ebx
80104b46:	57                   	push   %edi
80104b47:	e8 24 d2 ff ff       	call   80101d70 <dirlookup>
80104b4c:	83 c4 10             	add    $0x10,%esp
80104b4f:	89 c3                	mov    %eax,%ebx
80104b51:	85 c0                	test   %eax,%eax
80104b53:	0f 84 c7 00 00 00    	je     80104c20 <sys_unlink+0x160>
  ilock(ip);
80104b59:	83 ec 0c             	sub    $0xc,%esp
80104b5c:	50                   	push   %eax
80104b5d:	e8 8e cc ff ff       	call   801017f0 <ilock>
  if(ip->nlink < 1)
80104b62:	83 c4 10             	add    $0x10,%esp
80104b65:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104b6a:	0f 8e 0a 01 00 00    	jle    80104c7a <sys_unlink+0x1ba>
  if(ip->type == T_DIR && !isdirempty(ip)){
80104b70:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104b75:	8d 7d d8             	lea    -0x28(%ebp),%edi
80104b78:	74 66                	je     80104be0 <sys_unlink+0x120>
  memset(&de, 0, sizeof(de));
80104b7a:	83 ec 04             	sub    $0x4,%esp
80104b7d:	6a 10                	push   $0x10
80104b7f:	6a 00                	push   $0x0
80104b81:	57                   	push   %edi
80104b82:	e8 69 0c 00 00       	call   801057f0 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104b87:	6a 10                	push   $0x10
80104b89:	ff 75 c4             	push   -0x3c(%ebp)
80104b8c:	57                   	push   %edi
80104b8d:	ff 75 b4             	push   -0x4c(%ebp)
80104b90:	e8 8b d0 ff ff       	call   80101c20 <writei>
80104b95:	83 c4 20             	add    $0x20,%esp
80104b98:	83 f8 10             	cmp    $0x10,%eax
80104b9b:	0f 85 cc 00 00 00    	jne    80104c6d <sys_unlink+0x1ad>
  if(ip->type == T_DIR){
80104ba1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104ba6:	0f 84 94 00 00 00    	je     80104c40 <sys_unlink+0x180>
  iunlockput(dp);
80104bac:	83 ec 0c             	sub    $0xc,%esp
80104baf:	ff 75 b4             	push   -0x4c(%ebp)
80104bb2:	e8 d9 ce ff ff       	call   80101a90 <iunlockput>
  ip->nlink--;
80104bb7:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104bbc:	89 1c 24             	mov    %ebx,(%esp)
80104bbf:	e8 5c cb ff ff       	call   80101720 <iupdate>
  iunlockput(ip);
80104bc4:	89 1c 24             	mov    %ebx,(%esp)
80104bc7:	e8 c4 ce ff ff       	call   80101a90 <iunlockput>
  end_op();
80104bcc:	e8 5f e2 ff ff       	call   80102e30 <end_op>
  return 0;
80104bd1:	83 c4 10             	add    $0x10,%esp
80104bd4:	31 c0                	xor    %eax,%eax
}
80104bd6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104bd9:	5b                   	pop    %ebx
80104bda:	5e                   	pop    %esi
80104bdb:	5f                   	pop    %edi
80104bdc:	5d                   	pop    %ebp
80104bdd:	c3                   	ret
80104bde:	66 90                	xchg   %ax,%ax
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80104be0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104be4:	76 94                	jbe    80104b7a <sys_unlink+0xba>
80104be6:	be 20 00 00 00       	mov    $0x20,%esi
80104beb:	eb 0b                	jmp    80104bf8 <sys_unlink+0x138>
80104bed:	8d 76 00             	lea    0x0(%esi),%esi
80104bf0:	83 c6 10             	add    $0x10,%esi
80104bf3:	3b 73 58             	cmp    0x58(%ebx),%esi
80104bf6:	73 82                	jae    80104b7a <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104bf8:	6a 10                	push   $0x10
80104bfa:	56                   	push   %esi
80104bfb:	57                   	push   %edi
80104bfc:	53                   	push   %ebx
80104bfd:	e8 0e cf ff ff       	call   80101b10 <readi>
80104c02:	83 c4 10             	add    $0x10,%esp
80104c05:	83 f8 10             	cmp    $0x10,%eax
80104c08:	75 56                	jne    80104c60 <sys_unlink+0x1a0>
    if(de.inum != 0)
80104c0a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104c0f:	74 df                	je     80104bf0 <sys_unlink+0x130>
    iunlockput(ip);
80104c11:	83 ec 0c             	sub    $0xc,%esp
80104c14:	53                   	push   %ebx
80104c15:	e8 76 ce ff ff       	call   80101a90 <iunlockput>
    goto bad;
80104c1a:	83 c4 10             	add    $0x10,%esp
80104c1d:	8d 76 00             	lea    0x0(%esi),%esi
  iunlockput(dp);
80104c20:	83 ec 0c             	sub    $0xc,%esp
80104c23:	ff 75 b4             	push   -0x4c(%ebp)
80104c26:	e8 65 ce ff ff       	call   80101a90 <iunlockput>
  end_op();
80104c2b:	e8 00 e2 ff ff       	call   80102e30 <end_op>
  return -1;
80104c30:	83 c4 10             	add    $0x10,%esp
    return -1;
80104c33:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c38:	eb 9c                	jmp    80104bd6 <sys_unlink+0x116>
80104c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    dp->nlink--;
80104c40:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
80104c43:	83 ec 0c             	sub    $0xc,%esp
    dp->nlink--;
80104c46:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80104c4b:	50                   	push   %eax
80104c4c:	e8 cf ca ff ff       	call   80101720 <iupdate>
80104c51:	83 c4 10             	add    $0x10,%esp
80104c54:	e9 53 ff ff ff       	jmp    80104bac <sys_unlink+0xec>
    end_op();
80104c59:	e8 d2 e1 ff ff       	call   80102e30 <end_op>
    return -1;
80104c5e:	eb d3                	jmp    80104c33 <sys_unlink+0x173>
      panic("isdirempty: readi");
80104c60:	83 ec 0c             	sub    $0xc,%esp
80104c63:	68 d2 77 10 80       	push   $0x801077d2
80104c68:	e8 13 b7 ff ff       	call   80100380 <panic>
    panic("unlink: writei");
80104c6d:	83 ec 0c             	sub    $0xc,%esp
80104c70:	68 e4 77 10 80       	push   $0x801077e4
80104c75:	e8 06 b7 ff ff       	call   80100380 <panic>
    panic("unlink: nlink < 1");
80104c7a:	83 ec 0c             	sub    $0xc,%esp
80104c7d:	68 c0 77 10 80       	push   $0x801077c0
80104c82:	e8 f9 b6 ff ff       	call   80100380 <panic>
80104c87:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104c8e:	00 
80104c8f:	90                   	nop

80104c90 <sys_open>:

int
sys_open(void)
{
80104c90:	55                   	push   %ebp
80104c91:	89 e5                	mov    %esp,%ebp
80104c93:	57                   	push   %edi
80104c94:	56                   	push   %esi
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80104c95:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
80104c98:	53                   	push   %ebx
80104c99:	83 ec 24             	sub    $0x24,%esp
  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80104c9c:	50                   	push   %eax
80104c9d:	6a 00                	push   $0x0
80104c9f:	e8 1c f8 ff ff       	call   801044c0 <argstr>
80104ca4:	83 c4 10             	add    $0x10,%esp
80104ca7:	85 c0                	test   %eax,%eax
80104ca9:	0f 88 8e 00 00 00    	js     80104d3d <sys_open+0xad>
80104caf:	83 ec 08             	sub    $0x8,%esp
80104cb2:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104cb5:	50                   	push   %eax
80104cb6:	6a 01                	push   $0x1
80104cb8:	e8 43 f7 ff ff       	call   80104400 <argint>
80104cbd:	83 c4 10             	add    $0x10,%esp
80104cc0:	85 c0                	test   %eax,%eax
80104cc2:	78 79                	js     80104d3d <sys_open+0xad>
    return -1;

  begin_op();
80104cc4:	e8 f7 e0 ff ff       	call   80102dc0 <begin_op>

  if(omode & O_CREATE){
80104cc9:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80104ccd:	75 79                	jne    80104d48 <sys_open+0xb8>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80104ccf:	83 ec 0c             	sub    $0xc,%esp
80104cd2:	ff 75 e0             	push   -0x20(%ebp)
80104cd5:	e8 26 d4 ff ff       	call   80102100 <namei>
80104cda:	83 c4 10             	add    $0x10,%esp
80104cdd:	89 c6                	mov    %eax,%esi
80104cdf:	85 c0                	test   %eax,%eax
80104ce1:	0f 84 7e 00 00 00    	je     80104d65 <sys_open+0xd5>
      end_op();
      return -1;
    }
    ilock(ip);
80104ce7:	83 ec 0c             	sub    $0xc,%esp
80104cea:	50                   	push   %eax
80104ceb:	e8 00 cb ff ff       	call   801017f0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80104cf0:	83 c4 10             	add    $0x10,%esp
80104cf3:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80104cf8:	0f 84 ba 00 00 00    	je     80104db8 <sys_open+0x128>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80104cfe:	e8 4d c1 ff ff       	call   80100e50 <filealloc>
80104d03:	89 c7                	mov    %eax,%edi
80104d05:	85 c0                	test   %eax,%eax
80104d07:	74 23                	je     80104d2c <sys_open+0x9c>
  struct proc *curproc = myproc();
80104d09:	e8 e2 ea ff ff       	call   801037f0 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
80104d0e:	31 db                	xor    %ebx,%ebx
    if(curproc->ofile[fd] == 0){
80104d10:	8b 54 98 34          	mov    0x34(%eax,%ebx,4),%edx
80104d14:	85 d2                	test   %edx,%edx
80104d16:	74 58                	je     80104d70 <sys_open+0xe0>
  for(fd = 0; fd < NOFILE; fd++){
80104d18:	83 c3 01             	add    $0x1,%ebx
80104d1b:	83 fb 10             	cmp    $0x10,%ebx
80104d1e:	75 f0                	jne    80104d10 <sys_open+0x80>
    if(f)
      fileclose(f);
80104d20:	83 ec 0c             	sub    $0xc,%esp
80104d23:	57                   	push   %edi
80104d24:	e8 e7 c1 ff ff       	call   80100f10 <fileclose>
80104d29:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
80104d2c:	83 ec 0c             	sub    $0xc,%esp
80104d2f:	56                   	push   %esi
80104d30:	e8 5b cd ff ff       	call   80101a90 <iunlockput>
    end_op();
80104d35:	e8 f6 e0 ff ff       	call   80102e30 <end_op>
    return -1;
80104d3a:	83 c4 10             	add    $0x10,%esp
    return -1;
80104d3d:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104d42:	eb 65                	jmp    80104da9 <sys_open+0x119>
80104d44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ip = create(path, T_FILE, 0, 0);
80104d48:	83 ec 0c             	sub    $0xc,%esp
80104d4b:	31 c9                	xor    %ecx,%ecx
80104d4d:	ba 02 00 00 00       	mov    $0x2,%edx
80104d52:	6a 00                	push   $0x0
80104d54:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104d57:	e8 54 f8 ff ff       	call   801045b0 <create>
    if(ip == 0){
80104d5c:	83 c4 10             	add    $0x10,%esp
    ip = create(path, T_FILE, 0, 0);
80104d5f:	89 c6                	mov    %eax,%esi
    if(ip == 0){
80104d61:	85 c0                	test   %eax,%eax
80104d63:	75 99                	jne    80104cfe <sys_open+0x6e>
      end_op();
80104d65:	e8 c6 e0 ff ff       	call   80102e30 <end_op>
      return -1;
80104d6a:	eb d1                	jmp    80104d3d <sys_open+0xad>
80104d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
  iunlock(ip);
80104d70:	83 ec 0c             	sub    $0xc,%esp
      curproc->ofile[fd] = f;
80104d73:	89 7c 98 34          	mov    %edi,0x34(%eax,%ebx,4)
  iunlock(ip);
80104d77:	56                   	push   %esi
80104d78:	e8 63 cb ff ff       	call   801018e0 <iunlock>
  end_op();
80104d7d:	e8 ae e0 ff ff       	call   80102e30 <end_op>

  f->type = FD_INODE;
80104d82:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80104d88:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104d8b:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
80104d8e:	89 77 10             	mov    %esi,0x10(%edi)
  f->readable = !(omode & O_WRONLY);
80104d91:	89 d0                	mov    %edx,%eax
  f->off = 0;
80104d93:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
80104d9a:	f7 d0                	not    %eax
80104d9c:	83 e0 01             	and    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104d9f:	83 e2 03             	and    $0x3,%edx
  f->readable = !(omode & O_WRONLY);
80104da2:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104da5:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
}
80104da9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104dac:	89 d8                	mov    %ebx,%eax
80104dae:	5b                   	pop    %ebx
80104daf:	5e                   	pop    %esi
80104db0:	5f                   	pop    %edi
80104db1:	5d                   	pop    %ebp
80104db2:	c3                   	ret
80104db3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(ip->type == T_DIR && omode != O_RDONLY){
80104db8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80104dbb:	85 c9                	test   %ecx,%ecx
80104dbd:	0f 84 3b ff ff ff    	je     80104cfe <sys_open+0x6e>
80104dc3:	e9 64 ff ff ff       	jmp    80104d2c <sys_open+0x9c>
80104dc8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104dcf:	00 

80104dd0 <sys_mkdir>:

int
sys_mkdir(void)
{
80104dd0:	55                   	push   %ebp
80104dd1:	89 e5                	mov    %esp,%ebp
80104dd3:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80104dd6:	e8 e5 df ff ff       	call   80102dc0 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
80104ddb:	83 ec 08             	sub    $0x8,%esp
80104dde:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104de1:	50                   	push   %eax
80104de2:	6a 00                	push   $0x0
80104de4:	e8 d7 f6 ff ff       	call   801044c0 <argstr>
80104de9:	83 c4 10             	add    $0x10,%esp
80104dec:	85 c0                	test   %eax,%eax
80104dee:	78 30                	js     80104e20 <sys_mkdir+0x50>
80104df0:	83 ec 0c             	sub    $0xc,%esp
80104df3:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104df6:	31 c9                	xor    %ecx,%ecx
80104df8:	ba 01 00 00 00       	mov    $0x1,%edx
80104dfd:	6a 00                	push   $0x0
80104dff:	e8 ac f7 ff ff       	call   801045b0 <create>
80104e04:	83 c4 10             	add    $0x10,%esp
80104e07:	85 c0                	test   %eax,%eax
80104e09:	74 15                	je     80104e20 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
80104e0b:	83 ec 0c             	sub    $0xc,%esp
80104e0e:	50                   	push   %eax
80104e0f:	e8 7c cc ff ff       	call   80101a90 <iunlockput>
  end_op();
80104e14:	e8 17 e0 ff ff       	call   80102e30 <end_op>
  return 0;
80104e19:	83 c4 10             	add    $0x10,%esp
80104e1c:	31 c0                	xor    %eax,%eax
}
80104e1e:	c9                   	leave
80104e1f:	c3                   	ret
    end_op();
80104e20:	e8 0b e0 ff ff       	call   80102e30 <end_op>
    return -1;
80104e25:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e2a:	c9                   	leave
80104e2b:	c3                   	ret
80104e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104e30 <sys_mknod>:

int
sys_mknod(void)
{
80104e30:	55                   	push   %ebp
80104e31:	89 e5                	mov    %esp,%ebp
80104e33:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80104e36:	e8 85 df ff ff       	call   80102dc0 <begin_op>
  if((argstr(0, &path)) < 0 ||
80104e3b:	83 ec 08             	sub    $0x8,%esp
80104e3e:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104e41:	50                   	push   %eax
80104e42:	6a 00                	push   $0x0
80104e44:	e8 77 f6 ff ff       	call   801044c0 <argstr>
80104e49:	83 c4 10             	add    $0x10,%esp
80104e4c:	85 c0                	test   %eax,%eax
80104e4e:	78 60                	js     80104eb0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80104e50:	83 ec 08             	sub    $0x8,%esp
80104e53:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e56:	50                   	push   %eax
80104e57:	6a 01                	push   $0x1
80104e59:	e8 a2 f5 ff ff       	call   80104400 <argint>
  if((argstr(0, &path)) < 0 ||
80104e5e:	83 c4 10             	add    $0x10,%esp
80104e61:	85 c0                	test   %eax,%eax
80104e63:	78 4b                	js     80104eb0 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
80104e65:	83 ec 08             	sub    $0x8,%esp
80104e68:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e6b:	50                   	push   %eax
80104e6c:	6a 02                	push   $0x2
80104e6e:	e8 8d f5 ff ff       	call   80104400 <argint>
     argint(1, &major) < 0 ||
80104e73:	83 c4 10             	add    $0x10,%esp
80104e76:	85 c0                	test   %eax,%eax
80104e78:	78 36                	js     80104eb0 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
80104e7a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
80104e7e:	83 ec 0c             	sub    $0xc,%esp
80104e81:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80104e85:	ba 03 00 00 00       	mov    $0x3,%edx
80104e8a:	50                   	push   %eax
80104e8b:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104e8e:	e8 1d f7 ff ff       	call   801045b0 <create>
     argint(2, &minor) < 0 ||
80104e93:	83 c4 10             	add    $0x10,%esp
80104e96:	85 c0                	test   %eax,%eax
80104e98:	74 16                	je     80104eb0 <sys_mknod+0x80>
    end_op();
    return -1;
  }
  iunlockput(ip);
80104e9a:	83 ec 0c             	sub    $0xc,%esp
80104e9d:	50                   	push   %eax
80104e9e:	e8 ed cb ff ff       	call   80101a90 <iunlockput>
  end_op();
80104ea3:	e8 88 df ff ff       	call   80102e30 <end_op>
  return 0;
80104ea8:	83 c4 10             	add    $0x10,%esp
80104eab:	31 c0                	xor    %eax,%eax
}
80104ead:	c9                   	leave
80104eae:	c3                   	ret
80104eaf:	90                   	nop
    end_op();
80104eb0:	e8 7b df ff ff       	call   80102e30 <end_op>
    return -1;
80104eb5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104eba:	c9                   	leave
80104ebb:	c3                   	ret
80104ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104ec0 <sys_chdir>:

int
sys_chdir(void)
{
80104ec0:	55                   	push   %ebp
80104ec1:	89 e5                	mov    %esp,%ebp
80104ec3:	56                   	push   %esi
80104ec4:	53                   	push   %ebx
80104ec5:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80104ec8:	e8 23 e9 ff ff       	call   801037f0 <myproc>
80104ecd:	89 c6                	mov    %eax,%esi
  
  begin_op();
80104ecf:	e8 ec de ff ff       	call   80102dc0 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80104ed4:	83 ec 08             	sub    $0x8,%esp
80104ed7:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104eda:	50                   	push   %eax
80104edb:	6a 00                	push   $0x0
80104edd:	e8 de f5 ff ff       	call   801044c0 <argstr>
80104ee2:	83 c4 10             	add    $0x10,%esp
80104ee5:	85 c0                	test   %eax,%eax
80104ee7:	78 77                	js     80104f60 <sys_chdir+0xa0>
80104ee9:	83 ec 0c             	sub    $0xc,%esp
80104eec:	ff 75 f4             	push   -0xc(%ebp)
80104eef:	e8 0c d2 ff ff       	call   80102100 <namei>
80104ef4:	83 c4 10             	add    $0x10,%esp
80104ef7:	89 c3                	mov    %eax,%ebx
80104ef9:	85 c0                	test   %eax,%eax
80104efb:	74 63                	je     80104f60 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
80104efd:	83 ec 0c             	sub    $0xc,%esp
80104f00:	50                   	push   %eax
80104f01:	e8 ea c8 ff ff       	call   801017f0 <ilock>
  if(ip->type != T_DIR){
80104f06:	83 c4 10             	add    $0x10,%esp
80104f09:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f0e:	75 30                	jne    80104f40 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80104f10:	83 ec 0c             	sub    $0xc,%esp
80104f13:	53                   	push   %ebx
80104f14:	e8 c7 c9 ff ff       	call   801018e0 <iunlock>
  iput(curproc->cwd);
80104f19:	58                   	pop    %eax
80104f1a:	ff 76 74             	push   0x74(%esi)
80104f1d:	e8 0e ca ff ff       	call   80101930 <iput>
  end_op();
80104f22:	e8 09 df ff ff       	call   80102e30 <end_op>
  curproc->cwd = ip;
80104f27:	89 5e 74             	mov    %ebx,0x74(%esi)
  return 0;
80104f2a:	83 c4 10             	add    $0x10,%esp
80104f2d:	31 c0                	xor    %eax,%eax
}
80104f2f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104f32:	5b                   	pop    %ebx
80104f33:	5e                   	pop    %esi
80104f34:	5d                   	pop    %ebp
80104f35:	c3                   	ret
80104f36:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104f3d:	00 
80104f3e:	66 90                	xchg   %ax,%ax
    iunlockput(ip);
80104f40:	83 ec 0c             	sub    $0xc,%esp
80104f43:	53                   	push   %ebx
80104f44:	e8 47 cb ff ff       	call   80101a90 <iunlockput>
    end_op();
80104f49:	e8 e2 de ff ff       	call   80102e30 <end_op>
    return -1;
80104f4e:	83 c4 10             	add    $0x10,%esp
    return -1;
80104f51:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f56:	eb d7                	jmp    80104f2f <sys_chdir+0x6f>
80104f58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104f5f:	00 
    end_op();
80104f60:	e8 cb de ff ff       	call   80102e30 <end_op>
    return -1;
80104f65:	eb ea                	jmp    80104f51 <sys_chdir+0x91>
80104f67:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104f6e:	00 
80104f6f:	90                   	nop

80104f70 <sys_exec>:

int
sys_exec(void)
{
80104f70:	55                   	push   %ebp
80104f71:	89 e5                	mov    %esp,%ebp
80104f73:	57                   	push   %edi
80104f74:	56                   	push   %esi
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80104f75:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
{
80104f7b:	53                   	push   %ebx
80104f7c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80104f82:	50                   	push   %eax
80104f83:	6a 00                	push   $0x0
80104f85:	e8 36 f5 ff ff       	call   801044c0 <argstr>
80104f8a:	83 c4 10             	add    $0x10,%esp
80104f8d:	85 c0                	test   %eax,%eax
80104f8f:	0f 88 87 00 00 00    	js     8010501c <sys_exec+0xac>
80104f95:	83 ec 08             	sub    $0x8,%esp
80104f98:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80104f9e:	50                   	push   %eax
80104f9f:	6a 01                	push   $0x1
80104fa1:	e8 5a f4 ff ff       	call   80104400 <argint>
80104fa6:	83 c4 10             	add    $0x10,%esp
80104fa9:	85 c0                	test   %eax,%eax
80104fab:	78 6f                	js     8010501c <sys_exec+0xac>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80104fad:	83 ec 04             	sub    $0x4,%esp
80104fb0:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
  for(i=0;; i++){
80104fb6:	31 db                	xor    %ebx,%ebx
  memset(argv, 0, sizeof(argv));
80104fb8:	68 80 00 00 00       	push   $0x80
80104fbd:	6a 00                	push   $0x0
80104fbf:	56                   	push   %esi
80104fc0:	e8 2b 08 00 00       	call   801057f0 <memset>
80104fc5:	83 c4 10             	add    $0x10,%esp
80104fc8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80104fcf:	00 
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80104fd0:	83 ec 08             	sub    $0x8,%esp
80104fd3:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
80104fd9:	8d 3c 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edi
80104fe0:	50                   	push   %eax
80104fe1:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80104fe7:	01 f8                	add    %edi,%eax
80104fe9:	50                   	push   %eax
80104fea:	e8 81 f3 ff ff       	call   80104370 <fetchint>
80104fef:	83 c4 10             	add    $0x10,%esp
80104ff2:	85 c0                	test   %eax,%eax
80104ff4:	78 26                	js     8010501c <sys_exec+0xac>
      return -1;
    if(uarg == 0){
80104ff6:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80104ffc:	85 c0                	test   %eax,%eax
80104ffe:	74 30                	je     80105030 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80105000:	83 ec 08             	sub    $0x8,%esp
80105003:	8d 14 3e             	lea    (%esi,%edi,1),%edx
80105006:	52                   	push   %edx
80105007:	50                   	push   %eax
80105008:	e8 a3 f3 ff ff       	call   801043b0 <fetchstr>
8010500d:	83 c4 10             	add    $0x10,%esp
80105010:	85 c0                	test   %eax,%eax
80105012:	78 08                	js     8010501c <sys_exec+0xac>
  for(i=0;; i++){
80105014:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
80105017:	83 fb 20             	cmp    $0x20,%ebx
8010501a:	75 b4                	jne    80104fd0 <sys_exec+0x60>
      return -1;
  }
  return exec(path, argv);
}
8010501c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return -1;
8010501f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105024:	5b                   	pop    %ebx
80105025:	5e                   	pop    %esi
80105026:	5f                   	pop    %edi
80105027:	5d                   	pop    %ebp
80105028:	c3                   	ret
80105029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      argv[i] = 0;
80105030:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105037:	00 00 00 00 
  return exec(path, argv);
8010503b:	83 ec 08             	sub    $0x8,%esp
8010503e:	56                   	push   %esi
8010503f:	ff b5 5c ff ff ff    	push   -0xa4(%ebp)
80105045:	e8 66 ba ff ff       	call   80100ab0 <exec>
8010504a:	83 c4 10             	add    $0x10,%esp
}
8010504d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105050:	5b                   	pop    %ebx
80105051:	5e                   	pop    %esi
80105052:	5f                   	pop    %edi
80105053:	5d                   	pop    %ebp
80105054:	c3                   	ret
80105055:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010505c:	00 
8010505d:	8d 76 00             	lea    0x0(%esi),%esi

80105060 <sys_pipe>:

int
sys_pipe(void)
{
80105060:	55                   	push   %ebp
80105061:	89 e5                	mov    %esp,%ebp
80105063:	57                   	push   %edi
80105064:	56                   	push   %esi
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105065:	8d 45 dc             	lea    -0x24(%ebp),%eax
{
80105068:	53                   	push   %ebx
80105069:	83 ec 20             	sub    $0x20,%esp
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010506c:	6a 08                	push   $0x8
8010506e:	50                   	push   %eax
8010506f:	6a 00                	push   $0x0
80105071:	e8 da f3 ff ff       	call   80104450 <argptr>
80105076:	83 c4 10             	add    $0x10,%esp
80105079:	85 c0                	test   %eax,%eax
8010507b:	0f 88 8b 00 00 00    	js     8010510c <sys_pipe+0xac>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
80105081:	83 ec 08             	sub    $0x8,%esp
80105084:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105087:	50                   	push   %eax
80105088:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010508b:	50                   	push   %eax
8010508c:	e8 9f e1 ff ff       	call   80103230 <pipealloc>
80105091:	83 c4 10             	add    $0x10,%esp
80105094:	85 c0                	test   %eax,%eax
80105096:	78 74                	js     8010510c <sys_pipe+0xac>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105098:	8b 7d e0             	mov    -0x20(%ebp),%edi
  for(fd = 0; fd < NOFILE; fd++){
8010509b:	31 db                	xor    %ebx,%ebx
  struct proc *curproc = myproc();
8010509d:	e8 4e e7 ff ff       	call   801037f0 <myproc>
    if(curproc->ofile[fd] == 0){
801050a2:	8b 74 98 34          	mov    0x34(%eax,%ebx,4),%esi
801050a6:	85 f6                	test   %esi,%esi
801050a8:	74 16                	je     801050c0 <sys_pipe+0x60>
801050aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(fd = 0; fd < NOFILE; fd++){
801050b0:	83 c3 01             	add    $0x1,%ebx
801050b3:	83 fb 10             	cmp    $0x10,%ebx
801050b6:	74 3d                	je     801050f5 <sys_pipe+0x95>
    if(curproc->ofile[fd] == 0){
801050b8:	8b 74 98 34          	mov    0x34(%eax,%ebx,4),%esi
801050bc:	85 f6                	test   %esi,%esi
801050be:	75 f0                	jne    801050b0 <sys_pipe+0x50>
      curproc->ofile[fd] = f;
801050c0:	8d 73 0c             	lea    0xc(%ebx),%esi
801050c3:	89 7c b0 04          	mov    %edi,0x4(%eax,%esi,4)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801050c7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  struct proc *curproc = myproc();
801050ca:	e8 21 e7 ff ff       	call   801037f0 <myproc>
  for(fd = 0; fd < NOFILE; fd++){
801050cf:	31 d2                	xor    %edx,%edx
801050d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[fd] == 0){
801050d8:	8b 4c 90 34          	mov    0x34(%eax,%edx,4),%ecx
801050dc:	85 c9                	test   %ecx,%ecx
801050de:	74 38                	je     80105118 <sys_pipe+0xb8>
  for(fd = 0; fd < NOFILE; fd++){
801050e0:	83 c2 01             	add    $0x1,%edx
801050e3:	83 fa 10             	cmp    $0x10,%edx
801050e6:	75 f0                	jne    801050d8 <sys_pipe+0x78>
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
801050e8:	e8 03 e7 ff ff       	call   801037f0 <myproc>
801050ed:	c7 44 b0 04 00 00 00 	movl   $0x0,0x4(%eax,%esi,4)
801050f4:	00 
    fileclose(rf);
801050f5:	83 ec 0c             	sub    $0xc,%esp
801050f8:	ff 75 e0             	push   -0x20(%ebp)
801050fb:	e8 10 be ff ff       	call   80100f10 <fileclose>
    fileclose(wf);
80105100:	58                   	pop    %eax
80105101:	ff 75 e4             	push   -0x1c(%ebp)
80105104:	e8 07 be ff ff       	call   80100f10 <fileclose>
    return -1;
80105109:	83 c4 10             	add    $0x10,%esp
    return -1;
8010510c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105111:	eb 16                	jmp    80105129 <sys_pipe+0xc9>
80105113:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      curproc->ofile[fd] = f;
80105118:	89 7c 90 34          	mov    %edi,0x34(%eax,%edx,4)
  }
  fd[0] = fd0;
8010511c:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010511f:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
80105121:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105124:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
80105127:	31 c0                	xor    %eax,%eax
}
80105129:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010512c:	5b                   	pop    %ebx
8010512d:	5e                   	pop    %esi
8010512e:	5f                   	pop    %edi
8010512f:	5d                   	pop    %ebp
80105130:	c3                   	ret
80105131:	66 90                	xchg   %ax,%ax
80105133:	66 90                	xchg   %ax,%ax
80105135:	66 90                	xchg   %ax,%ax
80105137:	66 90                	xchg   %ax,%ax
80105139:	66 90                	xchg   %ax,%ax
8010513b:	66 90                	xchg   %ax,%ax
8010513d:	66 90                	xchg   %ax,%ax
8010513f:	90                   	nop

80105140 <sys_fork>:

// Project-specific function prototypes

// System call implementations
int sys_fork(void) {
  return fork();
80105140:	e9 4b e8 ff ff       	jmp    80103990 <fork>
80105145:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010514c:	00 
8010514d:	8d 76 00             	lea    0x0(%esi),%esi

80105150 <sys_exit>:
}

int sys_exit(void) {
80105150:	55                   	push   %ebp
80105151:	89 e5                	mov    %esp,%ebp
80105153:	83 ec 08             	sub    $0x8,%esp
  exit();
80105156:	e8 b5 ea ff ff       	call   80103c10 <exit>
  return 0;  // not reached
}
8010515b:	31 c0                	xor    %eax,%eax
8010515d:	c9                   	leave
8010515e:	c3                   	ret
8010515f:	90                   	nop

80105160 <sys_wait>:

int sys_wait(void) {
  return wait();
80105160:	e9 9b ed ff ff       	jmp    80103f00 <wait>
80105165:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010516c:	00 
8010516d:	8d 76 00             	lea    0x0(%esi),%esi

80105170 <sys_kill>:
}

int sys_kill(void) {
80105170:	55                   	push   %ebp
80105171:	89 e5                	mov    %esp,%ebp
80105173:	83 ec 20             	sub    $0x20,%esp
  int pid;
  if (argint(0, &pid) < 0)
80105176:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105179:	50                   	push   %eax
8010517a:	6a 00                	push   $0x0
8010517c:	e8 7f f2 ff ff       	call   80104400 <argint>
80105181:	83 c4 10             	add    $0x10,%esp
80105184:	85 c0                	test   %eax,%eax
80105186:	78 18                	js     801051a0 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105188:	83 ec 0c             	sub    $0xc,%esp
8010518b:	ff 75 f4             	push   -0xc(%ebp)
8010518e:	e8 0d f0 ff ff       	call   801041a0 <kill>
80105193:	83 c4 10             	add    $0x10,%esp
}
80105196:	c9                   	leave
80105197:	c3                   	ret
80105198:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010519f:	00 
801051a0:	c9                   	leave
    return -1;
801051a1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801051a6:	c3                   	ret
801051a7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801051ae:	00 
801051af:	90                   	nop

801051b0 <sys_getpid>:

int sys_getpid(void) {
801051b0:	55                   	push   %ebp
801051b1:	89 e5                	mov    %esp,%ebp
801051b3:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
801051b6:	e8 35 e6 ff ff       	call   801037f0 <myproc>
801051bb:	8b 40 1c             	mov    0x1c(%eax),%eax
}
801051be:	c9                   	leave
801051bf:	c3                   	ret

801051c0 <sys_sbrk>:

int sys_sbrk(void) {
801051c0:	55                   	push   %ebp
801051c1:	89 e5                	mov    %esp,%ebp
801051c3:	53                   	push   %ebx
  int addr;
  int n;
  if (argint(0, &n) < 0)
801051c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
int sys_sbrk(void) {
801051c7:	83 ec 1c             	sub    $0x1c,%esp
  if (argint(0, &n) < 0)
801051ca:	50                   	push   %eax
801051cb:	6a 00                	push   $0x0
801051cd:	e8 2e f2 ff ff       	call   80104400 <argint>
801051d2:	83 c4 10             	add    $0x10,%esp
801051d5:	85 c0                	test   %eax,%eax
801051d7:	78 27                	js     80105200 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
801051d9:	e8 12 e6 ff ff       	call   801037f0 <myproc>
  if (growproc(n) < 0)
801051de:	83 ec 0c             	sub    $0xc,%esp
  addr = myproc()->sz;
801051e1:	8b 58 0c             	mov    0xc(%eax),%ebx
  if (growproc(n) < 0)
801051e4:	ff 75 f4             	push   -0xc(%ebp)
801051e7:	e8 24 e7 ff ff       	call   80103910 <growproc>
801051ec:	83 c4 10             	add    $0x10,%esp
801051ef:	85 c0                	test   %eax,%eax
801051f1:	78 0d                	js     80105200 <sys_sbrk+0x40>
    return -1;
  return addr;
}
801051f3:	89 d8                	mov    %ebx,%eax
801051f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801051f8:	c9                   	leave
801051f9:	c3                   	ret
801051fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
80105200:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105205:	eb ec                	jmp    801051f3 <sys_sbrk+0x33>
80105207:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010520e:	00 
8010520f:	90                   	nop

80105210 <sys_sleep>:

int sys_sleep(void) {
80105210:	55                   	push   %ebp
80105211:	89 e5                	mov    %esp,%ebp
80105213:	53                   	push   %ebx
  int n;
  uint ticks0;
  if (argint(0, &n) < 0)
80105214:	8d 45 f4             	lea    -0xc(%ebp),%eax
int sys_sleep(void) {
80105217:	83 ec 1c             	sub    $0x1c,%esp
  if (argint(0, &n) < 0)
8010521a:	50                   	push   %eax
8010521b:	6a 00                	push   $0x0
8010521d:	e8 de f1 ff ff       	call   80104400 <argint>
80105222:	83 c4 10             	add    $0x10,%esp
80105225:	85 c0                	test   %eax,%eax
80105227:	78 64                	js     8010528d <sys_sleep+0x7d>
    return -1;
  acquire(&tickslock);
80105229:	83 ec 0c             	sub    $0xc,%esp
8010522c:	68 80 94 11 80       	push   $0x80119480
80105231:	e8 ba 04 00 00       	call   801056f0 <acquire>
  ticks0 = ticks;
  while (ticks - ticks0 < n) {
80105236:	8b 55 f4             	mov    -0xc(%ebp),%edx
  ticks0 = ticks;
80105239:	8b 1d 60 94 11 80    	mov    0x80119460,%ebx
  while (ticks - ticks0 < n) {
8010523f:	83 c4 10             	add    $0x10,%esp
80105242:	85 d2                	test   %edx,%edx
80105244:	75 2b                	jne    80105271 <sys_sleep+0x61>
80105246:	eb 58                	jmp    801052a0 <sys_sleep+0x90>
80105248:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010524f:	00 
    if (myproc()->killed) {
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105250:	83 ec 08             	sub    $0x8,%esp
80105253:	68 80 94 11 80       	push   $0x80119480
80105258:	68 60 94 11 80       	push   $0x80119460
8010525d:	e8 1e ee ff ff       	call   80104080 <sleep>
  while (ticks - ticks0 < n) {
80105262:	a1 60 94 11 80       	mov    0x80119460,%eax
80105267:	83 c4 10             	add    $0x10,%esp
8010526a:	29 d8                	sub    %ebx,%eax
8010526c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010526f:	73 2f                	jae    801052a0 <sys_sleep+0x90>
    if (myproc()->killed) {
80105271:	e8 7a e5 ff ff       	call   801037f0 <myproc>
80105276:	8b 40 30             	mov    0x30(%eax),%eax
80105279:	85 c0                	test   %eax,%eax
8010527b:	74 d3                	je     80105250 <sys_sleep+0x40>
      release(&tickslock);
8010527d:	83 ec 0c             	sub    $0xc,%esp
80105280:	68 80 94 11 80       	push   $0x80119480
80105285:	e8 06 04 00 00       	call   80105690 <release>
      return -1;
8010528a:	83 c4 10             	add    $0x10,%esp
  }
  release(&tickslock);
  return 0;
}
8010528d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return -1;
80105290:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105295:	c9                   	leave
80105296:	c3                   	ret
80105297:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010529e:	00 
8010529f:	90                   	nop
  release(&tickslock);
801052a0:	83 ec 0c             	sub    $0xc,%esp
801052a3:	68 80 94 11 80       	push   $0x80119480
801052a8:	e8 e3 03 00 00       	call   80105690 <release>
}
801052ad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  return 0;
801052b0:	83 c4 10             	add    $0x10,%esp
801052b3:	31 c0                	xor    %eax,%eax
}
801052b5:	c9                   	leave
801052b6:	c3                   	ret
801052b7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801052be:	00 
801052bf:	90                   	nop

801052c0 <sys_uptime>:

int sys_uptime(void) {
801052c0:	55                   	push   %ebp
801052c1:	89 e5                	mov    %esp,%ebp
801052c3:	53                   	push   %ebx
801052c4:	83 ec 10             	sub    $0x10,%esp
  uint xticks;
  acquire(&tickslock);
801052c7:	68 80 94 11 80       	push   $0x80119480
801052cc:	e8 1f 04 00 00       	call   801056f0 <acquire>
  xticks = ticks;
801052d1:	8b 1d 60 94 11 80    	mov    0x80119460,%ebx
  release(&tickslock);
801052d7:	c7 04 24 80 94 11 80 	movl   $0x80119480,(%esp)
801052de:	e8 ad 03 00 00       	call   80105690 <release>
  return xticks;
}
801052e3:	89 d8                	mov    %ebx,%eax
801052e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801052e8:	c9                   	leave
801052e9:	c3                   	ret
801052ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801052f0 <sys_spawn>:

// Project-specific system calls

int sys_spawn(void) {
801052f0:	55                   	push   %ebp
801052f1:	89 e5                	mov    %esp,%ebp
801052f3:	83 ec 20             	sub    $0x20,%esp
    char *name;
    int priority;

    // Get arguments from user space
    if (argstr(0, &name) < 0 || argint(1, &priority) < 0) {
801052f6:	8d 45 f0             	lea    -0x10(%ebp),%eax
801052f9:	50                   	push   %eax
801052fa:	6a 00                	push   $0x0
801052fc:	e8 bf f1 ff ff       	call   801044c0 <argstr>
80105301:	83 c4 10             	add    $0x10,%esp
80105304:	85 c0                	test   %eax,%eax
80105306:	78 28                	js     80105330 <sys_spawn+0x40>
80105308:	83 ec 08             	sub    $0x8,%esp
8010530b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010530e:	50                   	push   %eax
8010530f:	6a 01                	push   $0x1
80105311:	e8 ea f0 ff ff       	call   80104400 <argint>
80105316:	83 c4 10             	add    $0x10,%esp
80105319:	85 c0                	test   %eax,%eax
8010531b:	78 13                	js     80105330 <sys_spawn+0x40>
        return -1;
    }

    // Call your spawn function, which could be fork or a custom function.
    // Here it’s assumed spawn creates a new process or thread
    return spawn(name, priority);  // `spawn` is your own function, assuming you already have it
8010531d:	83 ec 08             	sub    $0x8,%esp
80105320:	ff 75 f4             	push   -0xc(%ebp)
80105323:	ff 75 f0             	push   -0x10(%ebp)
80105326:	e8 b5 ef ff ff       	call   801042e0 <spawn>
8010532b:	83 c4 10             	add    $0x10,%esp
}
8010532e:	c9                   	leave
8010532f:	c3                   	ret
80105330:	c9                   	leave
        return -1;
80105331:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105336:	c3                   	ret
80105337:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010533e:	00 
8010533f:	90                   	nop

80105340 <sys_thread_create>:

// Function to create a new thread
int sys_thread_create(void) {
80105340:	55                   	push   %ebp
80105341:	89 e5                	mov    %esp,%ebp
80105343:	83 ec 20             	sub    $0x20,%esp
    void (*start_routine)(void*);
    void *arg;

    // Get arguments from user space
    if (argint(0, (int*)&start_routine) < 0 || argint(1, (int*)&arg) < 0) {
80105346:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105349:	50                   	push   %eax
8010534a:	6a 00                	push   $0x0
8010534c:	e8 af f0 ff ff       	call   80104400 <argint>
80105351:	83 c4 10             	add    $0x10,%esp
80105354:	85 c0                	test   %eax,%eax
80105356:	78 28                	js     80105380 <sys_thread_create+0x40>
80105358:	83 ec 08             	sub    $0x8,%esp
8010535b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010535e:	50                   	push   %eax
8010535f:	6a 01                	push   $0x1
80105361:	e8 9a f0 ff ff       	call   80104400 <argint>
80105366:	83 c4 10             	add    $0x10,%esp
80105369:	85 c0                	test   %eax,%eax
8010536b:	78 13                	js     80105380 <sys_thread_create+0x40>
        return -1;
    }

    // Create a new thread
    return thread_create(start_routine, arg);  // `thread_create` is your custom thread creation function
8010536d:	83 ec 08             	sub    $0x8,%esp
80105370:	ff 75 f4             	push   -0xc(%ebp)
80105373:	ff 75 f0             	push   -0x10(%ebp)
80105376:	e8 05 20 00 00       	call   80107380 <thread_create>
8010537b:	83 c4 10             	add    $0x10,%esp
}
8010537e:	c9                   	leave
8010537f:	c3                   	ret
80105380:	c9                   	leave
        return -1;
80105381:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105386:	c3                   	ret
80105387:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010538e:	00 
8010538f:	90                   	nop

80105390 <sys_thread_join>:

int sys_thread_join(void) {
80105390:	55                   	push   %ebp
80105391:	89 e5                	mov    %esp,%ebp
80105393:	83 ec 20             	sub    $0x20,%esp
    int tid;
    
    // Get the thread ID from the user
    if (argint(0, &tid) < 0) {
80105396:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105399:	50                   	push   %eax
8010539a:	6a 00                	push   $0x0
8010539c:	e8 5f f0 ff ff       	call   80104400 <argint>
801053a1:	83 c4 10             	add    $0x10,%esp
801053a4:	85 c0                	test   %eax,%eax
801053a6:	78 18                	js     801053c0 <sys_thread_join+0x30>
        return -1;
    }

    // Wait for the thread to finish
    return thread_join(tid);  // `thread_join` is your custom function to join threads
801053a8:	83 ec 0c             	sub    $0xc,%esp
801053ab:	ff 75 f4             	push   -0xc(%ebp)
801053ae:	e8 0d 20 00 00       	call   801073c0 <thread_join>
801053b3:	83 c4 10             	add    $0x10,%esp
}
801053b6:	c9                   	leave
801053b7:	c3                   	ret
801053b8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801053bf:	00 
801053c0:	c9                   	leave
        return -1;
801053c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801053c6:	c3                   	ret
801053c7:	66 90                	xchg   %ax,%ax
801053c9:	66 90                	xchg   %ax,%ax
801053cb:	66 90                	xchg   %ax,%ax
801053cd:	66 90                	xchg   %ax,%ax
801053cf:	90                   	nop

801053d0 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
801053d0:	55                   	push   %ebp
801053d1:	89 e5                	mov    %esp,%ebp
801053d3:	53                   	push   %ebx
801053d4:	83 ec 0c             	sub    $0xc,%esp
801053d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
801053da:	68 f3 77 10 80       	push   $0x801077f3
801053df:	8d 43 04             	lea    0x4(%ebx),%eax
801053e2:	50                   	push   %eax
801053e3:	e8 18 01 00 00       	call   80105500 <initlock>
  lk->name = name;
801053e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
801053eb:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
801053f1:	83 c4 10             	add    $0x10,%esp
  lk->pid = 0;
801053f4:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  lk->name = name;
801053fb:	89 43 38             	mov    %eax,0x38(%ebx)
}
801053fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105401:	c9                   	leave
80105402:	c3                   	ret
80105403:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010540a:	00 
8010540b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80105410 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80105410:	55                   	push   %ebp
80105411:	89 e5                	mov    %esp,%ebp
80105413:	56                   	push   %esi
80105414:	53                   	push   %ebx
80105415:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80105418:	8d 73 04             	lea    0x4(%ebx),%esi
8010541b:	83 ec 0c             	sub    $0xc,%esp
8010541e:	56                   	push   %esi
8010541f:	e8 cc 02 00 00       	call   801056f0 <acquire>
  while (lk->locked) {
80105424:	8b 13                	mov    (%ebx),%edx
80105426:	83 c4 10             	add    $0x10,%esp
80105429:	85 d2                	test   %edx,%edx
8010542b:	74 16                	je     80105443 <acquiresleep+0x33>
8010542d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80105430:	83 ec 08             	sub    $0x8,%esp
80105433:	56                   	push   %esi
80105434:	53                   	push   %ebx
80105435:	e8 46 ec ff ff       	call   80104080 <sleep>
  while (lk->locked) {
8010543a:	8b 03                	mov    (%ebx),%eax
8010543c:	83 c4 10             	add    $0x10,%esp
8010543f:	85 c0                	test   %eax,%eax
80105441:	75 ed                	jne    80105430 <acquiresleep+0x20>
  }
  lk->locked = 1;
80105443:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80105449:	e8 a2 e3 ff ff       	call   801037f0 <myproc>
8010544e:	8b 40 1c             	mov    0x1c(%eax),%eax
80105451:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80105454:	89 75 08             	mov    %esi,0x8(%ebp)
}
80105457:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010545a:	5b                   	pop    %ebx
8010545b:	5e                   	pop    %esi
8010545c:	5d                   	pop    %ebp
  release(&lk->lk);
8010545d:	e9 2e 02 00 00       	jmp    80105690 <release>
80105462:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80105469:	00 
8010546a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105470 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
80105470:	55                   	push   %ebp
80105471:	89 e5                	mov    %esp,%ebp
80105473:	56                   	push   %esi
80105474:	53                   	push   %ebx
80105475:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80105478:	8d 73 04             	lea    0x4(%ebx),%esi
8010547b:	83 ec 0c             	sub    $0xc,%esp
8010547e:	56                   	push   %esi
8010547f:	e8 6c 02 00 00       	call   801056f0 <acquire>
  lk->locked = 0;
80105484:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010548a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80105491:	89 1c 24             	mov    %ebx,(%esp)
80105494:	e8 a7 ec ff ff       	call   80104140 <wakeup>
  release(&lk->lk);
80105499:	89 75 08             	mov    %esi,0x8(%ebp)
8010549c:	83 c4 10             	add    $0x10,%esp
}
8010549f:	8d 65 f8             	lea    -0x8(%ebp),%esp
801054a2:	5b                   	pop    %ebx
801054a3:	5e                   	pop    %esi
801054a4:	5d                   	pop    %ebp
  release(&lk->lk);
801054a5:	e9 e6 01 00 00       	jmp    80105690 <release>
801054aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801054b0 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
801054b0:	55                   	push   %ebp
801054b1:	89 e5                	mov    %esp,%ebp
801054b3:	57                   	push   %edi
801054b4:	31 ff                	xor    %edi,%edi
801054b6:	56                   	push   %esi
801054b7:	53                   	push   %ebx
801054b8:	83 ec 18             	sub    $0x18,%esp
801054bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int r;
  
  acquire(&lk->lk);
801054be:	8d 73 04             	lea    0x4(%ebx),%esi
801054c1:	56                   	push   %esi
801054c2:	e8 29 02 00 00       	call   801056f0 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
801054c7:	8b 03                	mov    (%ebx),%eax
801054c9:	83 c4 10             	add    $0x10,%esp
801054cc:	85 c0                	test   %eax,%eax
801054ce:	75 18                	jne    801054e8 <holdingsleep+0x38>
  release(&lk->lk);
801054d0:	83 ec 0c             	sub    $0xc,%esp
801054d3:	56                   	push   %esi
801054d4:	e8 b7 01 00 00       	call   80105690 <release>
  return r;
}
801054d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801054dc:	89 f8                	mov    %edi,%eax
801054de:	5b                   	pop    %ebx
801054df:	5e                   	pop    %esi
801054e0:	5f                   	pop    %edi
801054e1:	5d                   	pop    %ebp
801054e2:	c3                   	ret
801054e3:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  r = lk->locked && (lk->pid == myproc()->pid);
801054e8:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
801054eb:	e8 00 e3 ff ff       	call   801037f0 <myproc>
801054f0:	39 58 1c             	cmp    %ebx,0x1c(%eax)
801054f3:	0f 94 c0             	sete   %al
801054f6:	0f b6 c0             	movzbl %al,%eax
801054f9:	89 c7                	mov    %eax,%edi
801054fb:	eb d3                	jmp    801054d0 <holdingsleep+0x20>
801054fd:	66 90                	xchg   %ax,%ax
801054ff:	90                   	nop

80105500 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80105500:	55                   	push   %ebp
80105501:	89 e5                	mov    %esp,%ebp
80105503:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80105506:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80105509:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lk->name = name;
8010550f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->cpu = 0;
80105512:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80105519:	5d                   	pop    %ebp
8010551a:	c3                   	ret
8010551b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80105520 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80105520:	55                   	push   %ebp
80105521:	89 e5                	mov    %esp,%ebp
80105523:	53                   	push   %ebx
80105524:	8b 45 08             	mov    0x8(%ebp),%eax
80105527:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010552a:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
8010552d:	05 f8 ff ff 7f       	add    $0x7ffffff8,%eax
80105532:	3d fe ff ff 7f       	cmp    $0x7ffffffe,%eax
  for(i = 0; i < 10; i++){
80105537:	b8 00 00 00 00       	mov    $0x0,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
8010553c:	76 10                	jbe    8010554e <getcallerpcs+0x2e>
8010553e:	eb 28                	jmp    80105568 <getcallerpcs+0x48>
80105540:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80105546:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010554c:	77 1a                	ja     80105568 <getcallerpcs+0x48>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010554e:	8b 5a 04             	mov    0x4(%edx),%ebx
80105551:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
  for(i = 0; i < 10; i++){
80105554:	83 c0 01             	add    $0x1,%eax
    ebp = (uint*)ebp[0]; // saved %ebp
80105557:	8b 12                	mov    (%edx),%edx
  for(i = 0; i < 10; i++){
80105559:	83 f8 0a             	cmp    $0xa,%eax
8010555c:	75 e2                	jne    80105540 <getcallerpcs+0x20>
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010555e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105561:	c9                   	leave
80105562:	c3                   	ret
80105563:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80105568:	8d 04 81             	lea    (%ecx,%eax,4),%eax
8010556b:	83 c1 28             	add    $0x28,%ecx
8010556e:	89 ca                	mov    %ecx,%edx
80105570:	29 c2                	sub    %eax,%edx
80105572:	83 e2 04             	and    $0x4,%edx
80105575:	74 11                	je     80105588 <getcallerpcs+0x68>
    pcs[i] = 0;
80105577:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
8010557d:	83 c0 04             	add    $0x4,%eax
80105580:	39 c1                	cmp    %eax,%ecx
80105582:	74 da                	je     8010555e <getcallerpcs+0x3e>
80105584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pcs[i] = 0;
80105588:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
8010558e:	83 c0 08             	add    $0x8,%eax
    pcs[i] = 0;
80105591:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
  for(; i < 10; i++)
80105598:	39 c1                	cmp    %eax,%ecx
8010559a:	75 ec                	jne    80105588 <getcallerpcs+0x68>
8010559c:	eb c0                	jmp    8010555e <getcallerpcs+0x3e>
8010559e:	66 90                	xchg   %ax,%ax

801055a0 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
801055a0:	55                   	push   %ebp
801055a1:	89 e5                	mov    %esp,%ebp
801055a3:	53                   	push   %ebx
801055a4:	83 ec 04             	sub    $0x4,%esp
801055a7:	9c                   	pushf
801055a8:	5b                   	pop    %ebx
  asm volatile("cli");
801055a9:	fa                   	cli
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
801055aa:	e8 51 e1 ff ff       	call   80103700 <mycpu>
801055af:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801055b5:	85 c0                	test   %eax,%eax
801055b7:	74 17                	je     801055d0 <pushcli+0x30>
    mycpu()->intena = eflags & FL_IF;
  mycpu()->ncli += 1;
801055b9:	e8 42 e1 ff ff       	call   80103700 <mycpu>
801055be:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
801055c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801055c8:	c9                   	leave
801055c9:	c3                   	ret
801055ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    mycpu()->intena = eflags & FL_IF;
801055d0:	e8 2b e1 ff ff       	call   80103700 <mycpu>
801055d5:	81 e3 00 02 00 00    	and    $0x200,%ebx
801055db:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
801055e1:	eb d6                	jmp    801055b9 <pushcli+0x19>
801055e3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801055ea:	00 
801055eb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801055f0 <popcli>:

void
popcli(void)
{
801055f0:	55                   	push   %ebp
801055f1:	89 e5                	mov    %esp,%ebp
801055f3:	83 ec 08             	sub    $0x8,%esp
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801055f6:	9c                   	pushf
801055f7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801055f8:	f6 c4 02             	test   $0x2,%ah
801055fb:	75 35                	jne    80105632 <popcli+0x42>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
801055fd:	e8 fe e0 ff ff       	call   80103700 <mycpu>
80105602:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80105609:	78 34                	js     8010563f <popcli+0x4f>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
8010560b:	e8 f0 e0 ff ff       	call   80103700 <mycpu>
80105610:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80105616:	85 d2                	test   %edx,%edx
80105618:	74 06                	je     80105620 <popcli+0x30>
    sti();
}
8010561a:	c9                   	leave
8010561b:	c3                   	ret
8010561c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if(mycpu()->ncli == 0 && mycpu()->intena)
80105620:	e8 db e0 ff ff       	call   80103700 <mycpu>
80105625:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010562b:	85 c0                	test   %eax,%eax
8010562d:	74 eb                	je     8010561a <popcli+0x2a>
  asm volatile("sti");
8010562f:	fb                   	sti
}
80105630:	c9                   	leave
80105631:	c3                   	ret
    panic("popcli - interruptible");
80105632:	83 ec 0c             	sub    $0xc,%esp
80105635:	68 fe 77 10 80       	push   $0x801077fe
8010563a:	e8 41 ad ff ff       	call   80100380 <panic>
    panic("popcli");
8010563f:	83 ec 0c             	sub    $0xc,%esp
80105642:	68 15 78 10 80       	push   $0x80107815
80105647:	e8 34 ad ff ff       	call   80100380 <panic>
8010564c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105650 <holding>:
{
80105650:	55                   	push   %ebp
80105651:	89 e5                	mov    %esp,%ebp
80105653:	56                   	push   %esi
80105654:	53                   	push   %ebx
80105655:	8b 75 08             	mov    0x8(%ebp),%esi
80105658:	31 db                	xor    %ebx,%ebx
  pushcli();
8010565a:	e8 41 ff ff ff       	call   801055a0 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
8010565f:	8b 06                	mov    (%esi),%eax
80105661:	85 c0                	test   %eax,%eax
80105663:	75 0b                	jne    80105670 <holding+0x20>
  popcli();
80105665:	e8 86 ff ff ff       	call   801055f0 <popcli>
}
8010566a:	89 d8                	mov    %ebx,%eax
8010566c:	5b                   	pop    %ebx
8010566d:	5e                   	pop    %esi
8010566e:	5d                   	pop    %ebp
8010566f:	c3                   	ret
  r = lock->locked && lock->cpu == mycpu();
80105670:	8b 5e 08             	mov    0x8(%esi),%ebx
80105673:	e8 88 e0 ff ff       	call   80103700 <mycpu>
80105678:	39 c3                	cmp    %eax,%ebx
8010567a:	0f 94 c3             	sete   %bl
  popcli();
8010567d:	e8 6e ff ff ff       	call   801055f0 <popcli>
  r = lock->locked && lock->cpu == mycpu();
80105682:	0f b6 db             	movzbl %bl,%ebx
}
80105685:	89 d8                	mov    %ebx,%eax
80105687:	5b                   	pop    %ebx
80105688:	5e                   	pop    %esi
80105689:	5d                   	pop    %ebp
8010568a:	c3                   	ret
8010568b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80105690 <release>:
{
80105690:	55                   	push   %ebp
80105691:	89 e5                	mov    %esp,%ebp
80105693:	56                   	push   %esi
80105694:	53                   	push   %ebx
80105695:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
80105698:	e8 03 ff ff ff       	call   801055a0 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
8010569d:	8b 03                	mov    (%ebx),%eax
8010569f:	85 c0                	test   %eax,%eax
801056a1:	75 15                	jne    801056b8 <release+0x28>
  popcli();
801056a3:	e8 48 ff ff ff       	call   801055f0 <popcli>
    panic("release");
801056a8:	83 ec 0c             	sub    $0xc,%esp
801056ab:	68 1c 78 10 80       	push   $0x8010781c
801056b0:	e8 cb ac ff ff       	call   80100380 <panic>
801056b5:	8d 76 00             	lea    0x0(%esi),%esi
  r = lock->locked && lock->cpu == mycpu();
801056b8:	8b 73 08             	mov    0x8(%ebx),%esi
801056bb:	e8 40 e0 ff ff       	call   80103700 <mycpu>
801056c0:	39 c6                	cmp    %eax,%esi
801056c2:	75 df                	jne    801056a3 <release+0x13>
  popcli();
801056c4:	e8 27 ff ff ff       	call   801055f0 <popcli>
  lk->pcs[0] = 0;
801056c9:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
801056d0:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  __sync_synchronize();
801056d7:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
801056dc:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
}
801056e2:	8d 65 f8             	lea    -0x8(%ebp),%esp
801056e5:	5b                   	pop    %ebx
801056e6:	5e                   	pop    %esi
801056e7:	5d                   	pop    %ebp
  popcli();
801056e8:	e9 03 ff ff ff       	jmp    801055f0 <popcli>
801056ed:	8d 76 00             	lea    0x0(%esi),%esi

801056f0 <acquire>:
{
801056f0:	55                   	push   %ebp
801056f1:	89 e5                	mov    %esp,%ebp
801056f3:	53                   	push   %ebx
801056f4:	83 ec 04             	sub    $0x4,%esp
  pushcli(); // disable interrupts to avoid deadlock.
801056f7:	e8 a4 fe ff ff       	call   801055a0 <pushcli>
  if(holding(lk))
801056fc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
801056ff:	e8 9c fe ff ff       	call   801055a0 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
80105704:	8b 03                	mov    (%ebx),%eax
80105706:	85 c0                	test   %eax,%eax
80105708:	0f 85 b2 00 00 00    	jne    801057c0 <acquire+0xd0>
  popcli();
8010570e:	e8 dd fe ff ff       	call   801055f0 <popcli>
  asm volatile("lock; xchgl %0, %1" :
80105713:	b9 01 00 00 00       	mov    $0x1,%ecx
80105718:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010571f:	00 
  while(xchg(&lk->locked, 1) != 0)
80105720:	8b 55 08             	mov    0x8(%ebp),%edx
80105723:	89 c8                	mov    %ecx,%eax
80105725:	f0 87 02             	lock xchg %eax,(%edx)
80105728:	85 c0                	test   %eax,%eax
8010572a:	75 f4                	jne    80105720 <acquire+0x30>
  __sync_synchronize();
8010572c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
  lk->cpu = mycpu();
80105731:	8b 5d 08             	mov    0x8(%ebp),%ebx
80105734:	e8 c7 df ff ff       	call   80103700 <mycpu>
  getcallerpcs(&lk, lk->pcs);
80105739:	8b 4d 08             	mov    0x8(%ebp),%ecx
  for(i = 0; i < 10; i++){
8010573c:	31 d2                	xor    %edx,%edx
  lk->cpu = mycpu();
8010573e:	89 43 08             	mov    %eax,0x8(%ebx)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80105741:	8d 85 00 00 00 80    	lea    -0x80000000(%ebp),%eax
80105747:	3d fe ff ff 7f       	cmp    $0x7ffffffe,%eax
8010574c:	77 32                	ja     80105780 <acquire+0x90>
  ebp = (uint*)v - 2;
8010574e:	89 e8                	mov    %ebp,%eax
80105750:	eb 14                	jmp    80105766 <acquire+0x76>
80105752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80105758:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
8010575e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80105764:	77 1a                	ja     80105780 <acquire+0x90>
    pcs[i] = ebp[1];     // saved %eip
80105766:	8b 58 04             	mov    0x4(%eax),%ebx
80105769:	89 5c 91 0c          	mov    %ebx,0xc(%ecx,%edx,4)
  for(i = 0; i < 10; i++){
8010576d:	83 c2 01             	add    $0x1,%edx
    ebp = (uint*)ebp[0]; // saved %ebp
80105770:	8b 00                	mov    (%eax),%eax
  for(i = 0; i < 10; i++){
80105772:	83 fa 0a             	cmp    $0xa,%edx
80105775:	75 e1                	jne    80105758 <acquire+0x68>
}
80105777:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010577a:	c9                   	leave
8010577b:	c3                   	ret
8010577c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105780:	8d 44 91 0c          	lea    0xc(%ecx,%edx,4),%eax
80105784:	83 c1 34             	add    $0x34,%ecx
80105787:	89 ca                	mov    %ecx,%edx
80105789:	29 c2                	sub    %eax,%edx
8010578b:	83 e2 04             	and    $0x4,%edx
8010578e:	74 10                	je     801057a0 <acquire+0xb0>
    pcs[i] = 0;
80105790:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
80105796:	83 c0 04             	add    $0x4,%eax
80105799:	39 c1                	cmp    %eax,%ecx
8010579b:	74 da                	je     80105777 <acquire+0x87>
8010579d:	8d 76 00             	lea    0x0(%esi),%esi
    pcs[i] = 0;
801057a0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  for(; i < 10; i++)
801057a6:	83 c0 08             	add    $0x8,%eax
    pcs[i] = 0;
801057a9:	c7 40 fc 00 00 00 00 	movl   $0x0,-0x4(%eax)
  for(; i < 10; i++)
801057b0:	39 c1                	cmp    %eax,%ecx
801057b2:	75 ec                	jne    801057a0 <acquire+0xb0>
801057b4:	eb c1                	jmp    80105777 <acquire+0x87>
801057b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801057bd:	00 
801057be:	66 90                	xchg   %ax,%ax
  r = lock->locked && lock->cpu == mycpu();
801057c0:	8b 5b 08             	mov    0x8(%ebx),%ebx
801057c3:	e8 38 df ff ff       	call   80103700 <mycpu>
801057c8:	39 c3                	cmp    %eax,%ebx
801057ca:	0f 85 3e ff ff ff    	jne    8010570e <acquire+0x1e>
  popcli();
801057d0:	e8 1b fe ff ff       	call   801055f0 <popcli>
    panic("acquire");
801057d5:	83 ec 0c             	sub    $0xc,%esp
801057d8:	68 24 78 10 80       	push   $0x80107824
801057dd:	e8 9e ab ff ff       	call   80100380 <panic>
801057e2:	66 90                	xchg   %ax,%ax
801057e4:	66 90                	xchg   %ax,%ax
801057e6:	66 90                	xchg   %ax,%ax
801057e8:	66 90                	xchg   %ax,%ax
801057ea:	66 90                	xchg   %ax,%ax
801057ec:	66 90                	xchg   %ax,%ax
801057ee:	66 90                	xchg   %ax,%ax

801057f0 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
801057f0:	55                   	push   %ebp
801057f1:	89 e5                	mov    %esp,%ebp
801057f3:	57                   	push   %edi
801057f4:	8b 55 08             	mov    0x8(%ebp),%edx
801057f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
801057fa:	89 d0                	mov    %edx,%eax
801057fc:	09 c8                	or     %ecx,%eax
801057fe:	a8 03                	test   $0x3,%al
80105800:	75 1e                	jne    80105820 <memset+0x30>
    c &= 0xFF;
80105802:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
80105806:	c1 e9 02             	shr    $0x2,%ecx
  asm volatile("cld; rep stosl" :
80105809:	89 d7                	mov    %edx,%edi
8010580b:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
80105811:	fc                   	cld
80105812:	f3 ab                	rep stos %eax,%es:(%edi)
  } else
    stosb(dst, c, n);
  return dst;
}
80105814:	8b 7d fc             	mov    -0x4(%ebp),%edi
80105817:	89 d0                	mov    %edx,%eax
80105819:	c9                   	leave
8010581a:	c3                   	ret
8010581b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  asm volatile("cld; rep stosb" :
80105820:	8b 45 0c             	mov    0xc(%ebp),%eax
80105823:	89 d7                	mov    %edx,%edi
80105825:	fc                   	cld
80105826:	f3 aa                	rep stos %al,%es:(%edi)
80105828:	8b 7d fc             	mov    -0x4(%ebp),%edi
8010582b:	89 d0                	mov    %edx,%eax
8010582d:	c9                   	leave
8010582e:	c3                   	ret
8010582f:	90                   	nop

80105830 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80105830:	55                   	push   %ebp
80105831:	89 e5                	mov    %esp,%ebp
80105833:	56                   	push   %esi
80105834:	8b 75 10             	mov    0x10(%ebp),%esi
80105837:	8b 45 08             	mov    0x8(%ebp),%eax
8010583a:	53                   	push   %ebx
8010583b:	8b 55 0c             	mov    0xc(%ebp),%edx
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010583e:	85 f6                	test   %esi,%esi
80105840:	74 2e                	je     80105870 <memcmp+0x40>
80105842:	01 c6                	add    %eax,%esi
80105844:	eb 14                	jmp    8010585a <memcmp+0x2a>
80105846:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010584d:	00 
8010584e:	66 90                	xchg   %ax,%ax
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
80105850:	83 c0 01             	add    $0x1,%eax
80105853:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0){
80105856:	39 f0                	cmp    %esi,%eax
80105858:	74 16                	je     80105870 <memcmp+0x40>
    if(*s1 != *s2)
8010585a:	0f b6 08             	movzbl (%eax),%ecx
8010585d:	0f b6 1a             	movzbl (%edx),%ebx
80105860:	38 d9                	cmp    %bl,%cl
80105862:	74 ec                	je     80105850 <memcmp+0x20>
      return *s1 - *s2;
80105864:	0f b6 c1             	movzbl %cl,%eax
80105867:	29 d8                	sub    %ebx,%eax
  }

  return 0;
}
80105869:	5b                   	pop    %ebx
8010586a:	5e                   	pop    %esi
8010586b:	5d                   	pop    %ebp
8010586c:	c3                   	ret
8010586d:	8d 76 00             	lea    0x0(%esi),%esi
80105870:	5b                   	pop    %ebx
  return 0;
80105871:	31 c0                	xor    %eax,%eax
}
80105873:	5e                   	pop    %esi
80105874:	5d                   	pop    %ebp
80105875:	c3                   	ret
80105876:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010587d:	00 
8010587e:	66 90                	xchg   %ax,%ax

80105880 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80105880:	55                   	push   %ebp
80105881:	89 e5                	mov    %esp,%ebp
80105883:	57                   	push   %edi
80105884:	8b 55 08             	mov    0x8(%ebp),%edx
80105887:	8b 45 10             	mov    0x10(%ebp),%eax
8010588a:	56                   	push   %esi
8010588b:	8b 75 0c             	mov    0xc(%ebp),%esi
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
8010588e:	39 d6                	cmp    %edx,%esi
80105890:	73 26                	jae    801058b8 <memmove+0x38>
80105892:	8d 0c 06             	lea    (%esi,%eax,1),%ecx
80105895:	39 ca                	cmp    %ecx,%edx
80105897:	73 1f                	jae    801058b8 <memmove+0x38>
    s += n;
    d += n;
    while(n-- > 0)
80105899:	85 c0                	test   %eax,%eax
8010589b:	74 0f                	je     801058ac <memmove+0x2c>
8010589d:	83 e8 01             	sub    $0x1,%eax
      *--d = *--s;
801058a0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
801058a4:	88 0c 02             	mov    %cl,(%edx,%eax,1)
    while(n-- > 0)
801058a7:	83 e8 01             	sub    $0x1,%eax
801058aa:	73 f4                	jae    801058a0 <memmove+0x20>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
801058ac:	5e                   	pop    %esi
801058ad:	89 d0                	mov    %edx,%eax
801058af:	5f                   	pop    %edi
801058b0:	5d                   	pop    %ebp
801058b1:	c3                   	ret
801058b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    while(n-- > 0)
801058b8:	8d 0c 06             	lea    (%esi,%eax,1),%ecx
801058bb:	89 d7                	mov    %edx,%edi
801058bd:	85 c0                	test   %eax,%eax
801058bf:	74 eb                	je     801058ac <memmove+0x2c>
801058c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      *d++ = *s++;
801058c8:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    while(n-- > 0)
801058c9:	39 ce                	cmp    %ecx,%esi
801058cb:	75 fb                	jne    801058c8 <memmove+0x48>
}
801058cd:	5e                   	pop    %esi
801058ce:	89 d0                	mov    %edx,%eax
801058d0:	5f                   	pop    %edi
801058d1:	5d                   	pop    %ebp
801058d2:	c3                   	ret
801058d3:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801058da:	00 
801058db:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

801058e0 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
801058e0:	eb 9e                	jmp    80105880 <memmove>
801058e2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801058e9:	00 
801058ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801058f0 <strncmp>:
}

int
strncmp(const char *p, const char *q, uint n)
{
801058f0:	55                   	push   %ebp
801058f1:	89 e5                	mov    %esp,%ebp
801058f3:	53                   	push   %ebx
801058f4:	8b 55 10             	mov    0x10(%ebp),%edx
801058f7:	8b 45 08             	mov    0x8(%ebp),%eax
801058fa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(n > 0 && *p && *p == *q)
801058fd:	85 d2                	test   %edx,%edx
801058ff:	75 16                	jne    80105917 <strncmp+0x27>
80105901:	eb 2d                	jmp    80105930 <strncmp+0x40>
80105903:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80105908:	3a 19                	cmp    (%ecx),%bl
8010590a:	75 12                	jne    8010591e <strncmp+0x2e>
    n--, p++, q++;
8010590c:	83 c0 01             	add    $0x1,%eax
8010590f:	83 c1 01             	add    $0x1,%ecx
  while(n > 0 && *p && *p == *q)
80105912:	83 ea 01             	sub    $0x1,%edx
80105915:	74 19                	je     80105930 <strncmp+0x40>
80105917:	0f b6 18             	movzbl (%eax),%ebx
8010591a:	84 db                	test   %bl,%bl
8010591c:	75 ea                	jne    80105908 <strncmp+0x18>
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
8010591e:	0f b6 00             	movzbl (%eax),%eax
80105921:	0f b6 11             	movzbl (%ecx),%edx
}
80105924:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105927:	c9                   	leave
  return (uchar)*p - (uchar)*q;
80105928:	29 d0                	sub    %edx,%eax
}
8010592a:	c3                   	ret
8010592b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
80105930:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    return 0;
80105933:	31 c0                	xor    %eax,%eax
}
80105935:	c9                   	leave
80105936:	c3                   	ret
80105937:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010593e:	00 
8010593f:	90                   	nop

80105940 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80105940:	55                   	push   %ebp
80105941:	89 e5                	mov    %esp,%ebp
80105943:	57                   	push   %edi
80105944:	56                   	push   %esi
80105945:	8b 75 08             	mov    0x8(%ebp),%esi
80105948:	53                   	push   %ebx
80105949:	8b 55 10             	mov    0x10(%ebp),%edx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
8010594c:	89 f0                	mov    %esi,%eax
8010594e:	eb 15                	jmp    80105965 <strncpy+0x25>
80105950:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
80105954:	8b 7d 0c             	mov    0xc(%ebp),%edi
80105957:	83 c0 01             	add    $0x1,%eax
8010595a:	0f b6 4f ff          	movzbl -0x1(%edi),%ecx
8010595e:	88 48 ff             	mov    %cl,-0x1(%eax)
80105961:	84 c9                	test   %cl,%cl
80105963:	74 13                	je     80105978 <strncpy+0x38>
80105965:	89 d3                	mov    %edx,%ebx
80105967:	83 ea 01             	sub    $0x1,%edx
8010596a:	85 db                	test   %ebx,%ebx
8010596c:	7f e2                	jg     80105950 <strncpy+0x10>
    ;
  while(n-- > 0)
    *s++ = 0;
  return os;
}
8010596e:	5b                   	pop    %ebx
8010596f:	89 f0                	mov    %esi,%eax
80105971:	5e                   	pop    %esi
80105972:	5f                   	pop    %edi
80105973:	5d                   	pop    %ebp
80105974:	c3                   	ret
80105975:	8d 76 00             	lea    0x0(%esi),%esi
  while(n-- > 0)
80105978:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
8010597b:	83 e9 01             	sub    $0x1,%ecx
8010597e:	85 d2                	test   %edx,%edx
80105980:	74 ec                	je     8010596e <strncpy+0x2e>
80105982:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *s++ = 0;
80105988:	83 c0 01             	add    $0x1,%eax
8010598b:	89 ca                	mov    %ecx,%edx
8010598d:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
  while(n-- > 0)
80105991:	29 c2                	sub    %eax,%edx
80105993:	85 d2                	test   %edx,%edx
80105995:	7f f1                	jg     80105988 <strncpy+0x48>
}
80105997:	5b                   	pop    %ebx
80105998:	89 f0                	mov    %esi,%eax
8010599a:	5e                   	pop    %esi
8010599b:	5f                   	pop    %edi
8010599c:	5d                   	pop    %ebp
8010599d:	c3                   	ret
8010599e:	66 90                	xchg   %ax,%ax

801059a0 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
801059a0:	55                   	push   %ebp
801059a1:	89 e5                	mov    %esp,%ebp
801059a3:	56                   	push   %esi
801059a4:	8b 55 10             	mov    0x10(%ebp),%edx
801059a7:	8b 75 08             	mov    0x8(%ebp),%esi
801059aa:	53                   	push   %ebx
801059ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *os;

  os = s;
  if(n <= 0)
801059ae:	85 d2                	test   %edx,%edx
801059b0:	7e 25                	jle    801059d7 <safestrcpy+0x37>
801059b2:	8d 5c 10 ff          	lea    -0x1(%eax,%edx,1),%ebx
801059b6:	89 f2                	mov    %esi,%edx
801059b8:	eb 16                	jmp    801059d0 <safestrcpy+0x30>
801059ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
801059c0:	0f b6 08             	movzbl (%eax),%ecx
801059c3:	83 c0 01             	add    $0x1,%eax
801059c6:	83 c2 01             	add    $0x1,%edx
801059c9:	88 4a ff             	mov    %cl,-0x1(%edx)
801059cc:	84 c9                	test   %cl,%cl
801059ce:	74 04                	je     801059d4 <safestrcpy+0x34>
801059d0:	39 d8                	cmp    %ebx,%eax
801059d2:	75 ec                	jne    801059c0 <safestrcpy+0x20>
    ;
  *s = 0;
801059d4:	c6 02 00             	movb   $0x0,(%edx)
  return os;
}
801059d7:	89 f0                	mov    %esi,%eax
801059d9:	5b                   	pop    %ebx
801059da:	5e                   	pop    %esi
801059db:	5d                   	pop    %ebp
801059dc:	c3                   	ret
801059dd:	8d 76 00             	lea    0x0(%esi),%esi

801059e0 <strlen>:

int
strlen(const char *s)
{
801059e0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
801059e1:	31 c0                	xor    %eax,%eax
{
801059e3:	89 e5                	mov    %esp,%ebp
801059e5:	8b 55 08             	mov    0x8(%ebp),%edx
  for(n = 0; s[n]; n++)
801059e8:	80 3a 00             	cmpb   $0x0,(%edx)
801059eb:	74 0c                	je     801059f9 <strlen+0x19>
801059ed:	8d 76 00             	lea    0x0(%esi),%esi
801059f0:	83 c0 01             	add    $0x1,%eax
801059f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801059f7:	75 f7                	jne    801059f0 <strlen+0x10>
    ;
  return n;
}
801059f9:	5d                   	pop    %ebp
801059fa:	c3                   	ret

801059fb <swtch>:
# a struct context, and save its address in *old.
# Switch stacks to new and pop previously-saved registers.

.globl swtch
swtch:
  movl 4(%esp), %eax
801059fb:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
801059ff:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-saved registers
  pushl %ebp
80105a03:	55                   	push   %ebp
  pushl %ebx
80105a04:	53                   	push   %ebx
  pushl %esi
80105a05:	56                   	push   %esi
  pushl %edi
80105a06:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80105a07:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80105a09:	89 d4                	mov    %edx,%esp

  # Load new callee-saved registers
  popl %edi
80105a0b:	5f                   	pop    %edi
  popl %esi
80105a0c:	5e                   	pop    %esi
  popl %ebx
80105a0d:	5b                   	pop    %ebx
  popl %ebp
80105a0e:	5d                   	pop    %ebp
  ret
80105a0f:	c3                   	ret

80105a10 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
80105a10:	1e                   	push   %ds
  pushl %es
80105a11:	06                   	push   %es
  pushl %fs
80105a12:	0f a0                	push   %fs
  pushl %gs
80105a14:	0f a8                	push   %gs
  pushal
80105a16:	60                   	pusha
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
80105a17:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80105a1b:	8e d8                	mov    %eax,%ds
  movw %ax, %es
80105a1d:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
80105a1f:	54                   	push   %esp
  call trap
80105a20:	e8 cb 00 00 00       	call   80105af0 <trap>
  addl $4, %esp
80105a25:	83 c4 04             	add    $0x4,%esp

80105a28 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
80105a28:	61                   	popa
  popl %gs
80105a29:	0f a9                	pop    %gs
  popl %fs
80105a2b:	0f a1                	pop    %fs
  popl %es
80105a2d:	07                   	pop    %es
  popl %ds
80105a2e:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80105a2f:	83 c4 08             	add    $0x8,%esp
  iret
80105a32:	cf                   	iret
80105a33:	66 90                	xchg   %ax,%ax
80105a35:	66 90                	xchg   %ax,%ax
80105a37:	66 90                	xchg   %ax,%ax
80105a39:	66 90                	xchg   %ax,%ax
80105a3b:	66 90                	xchg   %ax,%ax
80105a3d:	66 90                	xchg   %ax,%ax
80105a3f:	90                   	nop

80105a40 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105a40:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
80105a41:	31 c0                	xor    %eax,%eax
{
80105a43:	89 e5                	mov    %esp,%ebp
80105a45:	83 ec 08             	sub    $0x8,%esp
80105a48:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80105a4f:	00 
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105a50:	8b 14 85 0c a0 10 80 	mov    -0x7fef5ff4(,%eax,4),%edx
80105a57:	c7 04 c5 c2 94 11 80 	movl   $0x8e000008,-0x7fee6b3e(,%eax,8)
80105a5e:	08 00 00 8e 
80105a62:	66 89 14 c5 c0 94 11 	mov    %dx,-0x7fee6b40(,%eax,8)
80105a69:	80 
80105a6a:	c1 ea 10             	shr    $0x10,%edx
80105a6d:	66 89 14 c5 c6 94 11 	mov    %dx,-0x7fee6b3a(,%eax,8)
80105a74:	80 
  for(i = 0; i < 256; i++)
80105a75:	83 c0 01             	add    $0x1,%eax
80105a78:	3d 00 01 00 00       	cmp    $0x100,%eax
80105a7d:	75 d1                	jne    80105a50 <tvinit+0x10>
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);

  initlock(&tickslock, "time");
80105a7f:	83 ec 08             	sub    $0x8,%esp
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a82:	a1 0c a1 10 80       	mov    0x8010a10c,%eax
80105a87:	c7 05 c2 96 11 80 08 	movl   $0xef000008,0x801196c2
80105a8e:	00 00 ef 
  initlock(&tickslock, "time");
80105a91:	68 2c 78 10 80       	push   $0x8010782c
80105a96:	68 80 94 11 80       	push   $0x80119480
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a9b:	66 a3 c0 96 11 80    	mov    %ax,0x801196c0
80105aa1:	c1 e8 10             	shr    $0x10,%eax
80105aa4:	66 a3 c6 96 11 80    	mov    %ax,0x801196c6
  initlock(&tickslock, "time");
80105aaa:	e8 51 fa ff ff       	call   80105500 <initlock>
}
80105aaf:	83 c4 10             	add    $0x10,%esp
80105ab2:	c9                   	leave
80105ab3:	c3                   	ret
80105ab4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80105abb:	00 
80105abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105ac0 <idtinit>:

void
idtinit(void)
{
80105ac0:	55                   	push   %ebp
  pd[0] = size - 1;
80105ac1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105ac6:	89 e5                	mov    %esp,%ebp
80105ac8:	83 ec 10             	sub    $0x10,%esp
80105acb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105acf:	b8 c0 94 11 80       	mov    $0x801194c0,%eax
80105ad4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105ad8:	c1 e8 10             	shr    $0x10,%eax
80105adb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
  asm volatile("lidt (%0)" : : "r" (pd));
80105adf:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105ae2:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105ae5:	c9                   	leave
80105ae6:	c3                   	ret
80105ae7:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80105aee:	00 
80105aef:	90                   	nop

80105af0 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105af0:	55                   	push   %ebp
80105af1:	89 e5                	mov    %esp,%ebp
80105af3:	57                   	push   %edi
80105af4:	56                   	push   %esi
80105af5:	53                   	push   %ebx
80105af6:	83 ec 1c             	sub    $0x1c,%esp
80105af9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
80105afc:	8b 43 30             	mov    0x30(%ebx),%eax
80105aff:	83 f8 40             	cmp    $0x40,%eax
80105b02:	0f 84 58 01 00 00    	je     80105c60 <trap+0x170>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105b08:	83 e8 20             	sub    $0x20,%eax
80105b0b:	83 f8 1f             	cmp    $0x1f,%eax
80105b0e:	0f 87 7c 00 00 00    	ja     80105b90 <trap+0xa0>
80105b14:	ff 24 85 18 7e 10 80 	jmp    *-0x7fef81e8(,%eax,4)
80105b1b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105b20:	e8 8b c7 ff ff       	call   801022b0 <ideintr>
    lapiceoi();
80105b25:	e8 46 ce ff ff       	call   80102970 <lapiceoi>
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105b2a:	e8 c1 dc ff ff       	call   801037f0 <myproc>
80105b2f:	85 c0                	test   %eax,%eax
80105b31:	74 1a                	je     80105b4d <trap+0x5d>
80105b33:	e8 b8 dc ff ff       	call   801037f0 <myproc>
80105b38:	8b 50 30             	mov    0x30(%eax),%edx
80105b3b:	85 d2                	test   %edx,%edx
80105b3d:	74 0e                	je     80105b4d <trap+0x5d>
80105b3f:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105b43:	f7 d0                	not    %eax
80105b45:	a8 03                	test   $0x3,%al
80105b47:	0f 84 db 01 00 00    	je     80105d28 <trap+0x238>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105b4d:	e8 9e dc ff ff       	call   801037f0 <myproc>
80105b52:	85 c0                	test   %eax,%eax
80105b54:	74 0f                	je     80105b65 <trap+0x75>
80105b56:	e8 95 dc ff ff       	call   801037f0 <myproc>
80105b5b:	83 78 18 04          	cmpl   $0x4,0x18(%eax)
80105b5f:	0f 84 ab 00 00 00    	je     80105c10 <trap+0x120>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105b65:	e8 86 dc ff ff       	call   801037f0 <myproc>
80105b6a:	85 c0                	test   %eax,%eax
80105b6c:	74 1a                	je     80105b88 <trap+0x98>
80105b6e:	e8 7d dc ff ff       	call   801037f0 <myproc>
80105b73:	8b 40 30             	mov    0x30(%eax),%eax
80105b76:	85 c0                	test   %eax,%eax
80105b78:	74 0e                	je     80105b88 <trap+0x98>
80105b7a:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105b7e:	f7 d0                	not    %eax
80105b80:	a8 03                	test   $0x3,%al
80105b82:	0f 84 05 01 00 00    	je     80105c8d <trap+0x19d>
    exit();
}
80105b88:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b8b:	5b                   	pop    %ebx
80105b8c:	5e                   	pop    %esi
80105b8d:	5f                   	pop    %edi
80105b8e:	5d                   	pop    %ebp
80105b8f:	c3                   	ret
    if(myproc() == 0 || (tf->cs&3) == 0){
80105b90:	e8 5b dc ff ff       	call   801037f0 <myproc>
80105b95:	8b 7b 38             	mov    0x38(%ebx),%edi
80105b98:	85 c0                	test   %eax,%eax
80105b9a:	0f 84 a2 01 00 00    	je     80105d42 <trap+0x252>
80105ba0:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105ba4:	0f 84 98 01 00 00    	je     80105d42 <trap+0x252>
}

static inline uint rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105baa:	0f 20 d1             	mov    %cr2,%ecx
80105bad:	89 4d d8             	mov    %ecx,-0x28(%ebp)
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105bb0:	e8 ab db ff ff       	call   80103760 <cpuid>
80105bb5:	8b 73 30             	mov    0x30(%ebx),%esi
80105bb8:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105bbb:	8b 43 34             	mov    0x34(%ebx),%eax
80105bbe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            myproc()->pid, myproc()->name, tf->trapno,
80105bc1:	e8 2a dc ff ff       	call   801037f0 <myproc>
80105bc6:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105bc9:	e8 22 dc ff ff       	call   801037f0 <myproc>
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105bce:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105bd1:	51                   	push   %ecx
80105bd2:	57                   	push   %edi
80105bd3:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105bd6:	52                   	push   %edx
80105bd7:	ff 75 e4             	push   -0x1c(%ebp)
80105bda:	56                   	push   %esi
            myproc()->pid, myproc()->name, tf->trapno,
80105bdb:	8b 75 e0             	mov    -0x20(%ebp),%esi
80105bde:	83 c6 78             	add    $0x78,%esi
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105be1:	56                   	push   %esi
80105be2:	ff 70 1c             	push   0x1c(%eax)
80105be5:	68 e0 7a 10 80       	push   $0x80107ae0
80105bea:	e8 c1 aa ff ff       	call   801006b0 <cprintf>
    myproc()->killed = 1;
80105bef:	83 c4 20             	add    $0x20,%esp
80105bf2:	e8 f9 db ff ff       	call   801037f0 <myproc>
80105bf7:	c7 40 30 01 00 00 00 	movl   $0x1,0x30(%eax)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105bfe:	e8 ed db ff ff       	call   801037f0 <myproc>
80105c03:	85 c0                	test   %eax,%eax
80105c05:	0f 85 28 ff ff ff    	jne    80105b33 <trap+0x43>
80105c0b:	e9 3d ff ff ff       	jmp    80105b4d <trap+0x5d>
  if(myproc() && myproc()->state == RUNNING &&
80105c10:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105c14:	0f 85 4b ff ff ff    	jne    80105b65 <trap+0x75>
    yield();
80105c1a:	e8 11 e4 ff ff       	call   80104030 <yield>
80105c1f:	e9 41 ff ff ff       	jmp    80105b65 <trap+0x75>
80105c24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105c28:	8b 7b 38             	mov    0x38(%ebx),%edi
80105c2b:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105c2f:	e8 2c db ff ff       	call   80103760 <cpuid>
80105c34:	57                   	push   %edi
80105c35:	56                   	push   %esi
80105c36:	50                   	push   %eax
80105c37:	68 88 7a 10 80       	push   $0x80107a88
80105c3c:	e8 6f aa ff ff       	call   801006b0 <cprintf>
    lapiceoi();
80105c41:	e8 2a cd ff ff       	call   80102970 <lapiceoi>
    break;
80105c46:	83 c4 10             	add    $0x10,%esp
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105c49:	e8 a2 db ff ff       	call   801037f0 <myproc>
80105c4e:	85 c0                	test   %eax,%eax
80105c50:	0f 85 dd fe ff ff    	jne    80105b33 <trap+0x43>
80105c56:	e9 f2 fe ff ff       	jmp    80105b4d <trap+0x5d>
80105c5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    if(myproc()->killed)
80105c60:	e8 8b db ff ff       	call   801037f0 <myproc>
80105c65:	8b 70 30             	mov    0x30(%eax),%esi
80105c68:	85 f6                	test   %esi,%esi
80105c6a:	0f 85 c8 00 00 00    	jne    80105d38 <trap+0x248>
    myproc()->tf = tf;
80105c70:	e8 7b db ff ff       	call   801037f0 <myproc>
80105c75:	89 58 24             	mov    %ebx,0x24(%eax)
    syscall();
80105c78:	e8 c3 e8 ff ff       	call   80104540 <syscall>
    if(myproc()->killed)
80105c7d:	e8 6e db ff ff       	call   801037f0 <myproc>
80105c82:	8b 48 30             	mov    0x30(%eax),%ecx
80105c85:	85 c9                	test   %ecx,%ecx
80105c87:	0f 84 fb fe ff ff    	je     80105b88 <trap+0x98>
}
80105c8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c90:	5b                   	pop    %ebx
80105c91:	5e                   	pop    %esi
80105c92:	5f                   	pop    %edi
80105c93:	5d                   	pop    %ebp
      exit();
80105c94:	e9 77 df ff ff       	jmp    80103c10 <exit>
80105c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    uartintr();
80105ca0:	e8 4b 02 00 00       	call   80105ef0 <uartintr>
    lapiceoi();
80105ca5:	e8 c6 cc ff ff       	call   80102970 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105caa:	e8 41 db ff ff       	call   801037f0 <myproc>
80105caf:	85 c0                	test   %eax,%eax
80105cb1:	0f 85 7c fe ff ff    	jne    80105b33 <trap+0x43>
80105cb7:	e9 91 fe ff ff       	jmp    80105b4d <trap+0x5d>
80105cbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    kbdintr();
80105cc0:	e8 7b cb ff ff       	call   80102840 <kbdintr>
    lapiceoi();
80105cc5:	e8 a6 cc ff ff       	call   80102970 <lapiceoi>
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105cca:	e8 21 db ff ff       	call   801037f0 <myproc>
80105ccf:	85 c0                	test   %eax,%eax
80105cd1:	0f 85 5c fe ff ff    	jne    80105b33 <trap+0x43>
80105cd7:	e9 71 fe ff ff       	jmp    80105b4d <trap+0x5d>
80105cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(cpuid() == 0){
80105ce0:	e8 7b da ff ff       	call   80103760 <cpuid>
80105ce5:	85 c0                	test   %eax,%eax
80105ce7:	0f 85 38 fe ff ff    	jne    80105b25 <trap+0x35>
      acquire(&tickslock);
80105ced:	83 ec 0c             	sub    $0xc,%esp
80105cf0:	68 80 94 11 80       	push   $0x80119480
80105cf5:	e8 f6 f9 ff ff       	call   801056f0 <acquire>
      ticks++;
80105cfa:	83 05 60 94 11 80 01 	addl   $0x1,0x80119460
      wakeup(&ticks);
80105d01:	c7 04 24 60 94 11 80 	movl   $0x80119460,(%esp)
80105d08:	e8 33 e4 ff ff       	call   80104140 <wakeup>
      release(&tickslock);
80105d0d:	c7 04 24 80 94 11 80 	movl   $0x80119480,(%esp)
80105d14:	e8 77 f9 ff ff       	call   80105690 <release>
80105d19:	83 c4 10             	add    $0x10,%esp
    lapiceoi();
80105d1c:	e9 04 fe ff ff       	jmp    80105b25 <trap+0x35>
80105d21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit();
80105d28:	e8 e3 de ff ff       	call   80103c10 <exit>
80105d2d:	e9 1b fe ff ff       	jmp    80105b4d <trap+0x5d>
80105d32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
80105d38:	e8 d3 de ff ff       	call   80103c10 <exit>
80105d3d:	e9 2e ff ff ff       	jmp    80105c70 <trap+0x180>
80105d42:	0f 20 d6             	mov    %cr2,%esi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105d45:	e8 16 da ff ff       	call   80103760 <cpuid>
80105d4a:	83 ec 0c             	sub    $0xc,%esp
80105d4d:	56                   	push   %esi
80105d4e:	57                   	push   %edi
80105d4f:	50                   	push   %eax
80105d50:	ff 73 30             	push   0x30(%ebx)
80105d53:	68 ac 7a 10 80       	push   $0x80107aac
80105d58:	e8 53 a9 ff ff       	call   801006b0 <cprintf>
      panic("trap");
80105d5d:	83 c4 14             	add    $0x14,%esp
80105d60:	68 31 78 10 80       	push   $0x80107831
80105d65:	e8 16 a6 ff ff       	call   80100380 <panic>
80105d6a:	66 90                	xchg   %ax,%ax
80105d6c:	66 90                	xchg   %ax,%ax
80105d6e:	66 90                	xchg   %ax,%ax

80105d70 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105d70:	a1 c0 9c 11 80       	mov    0x80119cc0,%eax
80105d75:	85 c0                	test   %eax,%eax
80105d77:	74 17                	je     80105d90 <uartgetc+0x20>
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105d79:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105d7e:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105d7f:	a8 01                	test   $0x1,%al
80105d81:	74 0d                	je     80105d90 <uartgetc+0x20>
80105d83:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d88:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105d89:	0f b6 c0             	movzbl %al,%eax
80105d8c:	c3                   	ret
80105d8d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
80105d90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105d95:	c3                   	ret
80105d96:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80105d9d:	00 
80105d9e:	66 90                	xchg   %ax,%ax

80105da0 <uartinit>:
{
80105da0:	55                   	push   %ebp
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105da1:	31 c9                	xor    %ecx,%ecx
80105da3:	89 c8                	mov    %ecx,%eax
80105da5:	89 e5                	mov    %esp,%ebp
80105da7:	57                   	push   %edi
80105da8:	bf fa 03 00 00       	mov    $0x3fa,%edi
80105dad:	56                   	push   %esi
80105dae:	89 fa                	mov    %edi,%edx
80105db0:	53                   	push   %ebx
80105db1:	83 ec 1c             	sub    $0x1c,%esp
80105db4:	ee                   	out    %al,(%dx)
80105db5:	be fb 03 00 00       	mov    $0x3fb,%esi
80105dba:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105dbf:	89 f2                	mov    %esi,%edx
80105dc1:	ee                   	out    %al,(%dx)
80105dc2:	b8 0c 00 00 00       	mov    $0xc,%eax
80105dc7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105dcc:	ee                   	out    %al,(%dx)
80105dcd:	bb f9 03 00 00       	mov    $0x3f9,%ebx
80105dd2:	89 c8                	mov    %ecx,%eax
80105dd4:	89 da                	mov    %ebx,%edx
80105dd6:	ee                   	out    %al,(%dx)
80105dd7:	b8 03 00 00 00       	mov    $0x3,%eax
80105ddc:	89 f2                	mov    %esi,%edx
80105dde:	ee                   	out    %al,(%dx)
80105ddf:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105de4:	89 c8                	mov    %ecx,%eax
80105de6:	ee                   	out    %al,(%dx)
80105de7:	b8 01 00 00 00       	mov    $0x1,%eax
80105dec:	89 da                	mov    %ebx,%edx
80105dee:	ee                   	out    %al,(%dx)
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105def:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105df4:	ec                   	in     (%dx),%al
  if(inb(COM1+5) == 0xFF)
80105df5:	3c ff                	cmp    $0xff,%al
80105df7:	0f 84 7c 00 00 00    	je     80105e79 <uartinit+0xd9>
  uart = 1;
80105dfd:	c7 05 c0 9c 11 80 01 	movl   $0x1,0x80119cc0
80105e04:	00 00 00 
80105e07:	89 fa                	mov    %edi,%edx
80105e09:	ec                   	in     (%dx),%al
80105e0a:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105e0f:	ec                   	in     (%dx),%al
  ioapicenable(IRQ_COM1, 0);
80105e10:	83 ec 08             	sub    $0x8,%esp
  for(p="xv6...\n"; *p; p++)
80105e13:	bf 36 78 10 80       	mov    $0x80107836,%edi
80105e18:	be fd 03 00 00       	mov    $0x3fd,%esi
  ioapicenable(IRQ_COM1, 0);
80105e1d:	6a 00                	push   $0x0
80105e1f:	6a 04                	push   $0x4
80105e21:	e8 ba c6 ff ff       	call   801024e0 <ioapicenable>
  for(p="xv6...\n"; *p; p++)
80105e26:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
  ioapicenable(IRQ_COM1, 0);
80105e2a:	83 c4 10             	add    $0x10,%esp
80105e2d:	8d 76 00             	lea    0x0(%esi),%esi
  if(!uart)
80105e30:	a1 c0 9c 11 80       	mov    0x80119cc0,%eax
80105e35:	85 c0                	test   %eax,%eax
80105e37:	74 32                	je     80105e6b <uartinit+0xcb>
80105e39:	89 f2                	mov    %esi,%edx
80105e3b:	ec                   	in     (%dx),%al
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105e3c:	a8 20                	test   $0x20,%al
80105e3e:	75 21                	jne    80105e61 <uartinit+0xc1>
80105e40:	bb 80 00 00 00       	mov    $0x80,%ebx
80105e45:	8d 76 00             	lea    0x0(%esi),%esi
    microdelay(10);
80105e48:	83 ec 0c             	sub    $0xc,%esp
80105e4b:	6a 0a                	push   $0xa
80105e4d:	e8 3e cb ff ff       	call   80102990 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105e52:	83 c4 10             	add    $0x10,%esp
80105e55:	83 eb 01             	sub    $0x1,%ebx
80105e58:	74 07                	je     80105e61 <uartinit+0xc1>
80105e5a:	89 f2                	mov    %esi,%edx
80105e5c:	ec                   	in     (%dx),%al
80105e5d:	a8 20                	test   $0x20,%al
80105e5f:	74 e7                	je     80105e48 <uartinit+0xa8>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105e61:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105e66:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
80105e6a:	ee                   	out    %al,(%dx)
  for(p="xv6...\n"; *p; p++)
80105e6b:	0f b6 47 01          	movzbl 0x1(%edi),%eax
80105e6f:	83 c7 01             	add    $0x1,%edi
80105e72:	88 45 e7             	mov    %al,-0x19(%ebp)
80105e75:	84 c0                	test   %al,%al
80105e77:	75 b7                	jne    80105e30 <uartinit+0x90>
}
80105e79:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105e7c:	5b                   	pop    %ebx
80105e7d:	5e                   	pop    %esi
80105e7e:	5f                   	pop    %edi
80105e7f:	5d                   	pop    %ebp
80105e80:	c3                   	ret
80105e81:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80105e88:	00 
80105e89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105e90 <uartputc>:
  if(!uart)
80105e90:	a1 c0 9c 11 80       	mov    0x80119cc0,%eax
80105e95:	85 c0                	test   %eax,%eax
80105e97:	74 4f                	je     80105ee8 <uartputc+0x58>
{
80105e99:	55                   	push   %ebp
  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105e9a:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105e9f:	89 e5                	mov    %esp,%ebp
80105ea1:	56                   	push   %esi
80105ea2:	53                   	push   %ebx
80105ea3:	ec                   	in     (%dx),%al
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105ea4:	a8 20                	test   $0x20,%al
80105ea6:	75 29                	jne    80105ed1 <uartputc+0x41>
80105ea8:	bb 80 00 00 00       	mov    $0x80,%ebx
80105ead:	be fd 03 00 00       	mov    $0x3fd,%esi
80105eb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    microdelay(10);
80105eb8:	83 ec 0c             	sub    $0xc,%esp
80105ebb:	6a 0a                	push   $0xa
80105ebd:	e8 ce ca ff ff       	call   80102990 <microdelay>
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105ec2:	83 c4 10             	add    $0x10,%esp
80105ec5:	83 eb 01             	sub    $0x1,%ebx
80105ec8:	74 07                	je     80105ed1 <uartputc+0x41>
80105eca:	89 f2                	mov    %esi,%edx
80105ecc:	ec                   	in     (%dx),%al
80105ecd:	a8 20                	test   $0x20,%al
80105ecf:	74 e7                	je     80105eb8 <uartputc+0x28>
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105ed1:	8b 45 08             	mov    0x8(%ebp),%eax
80105ed4:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105ed9:	ee                   	out    %al,(%dx)
}
80105eda:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105edd:	5b                   	pop    %ebx
80105ede:	5e                   	pop    %esi
80105edf:	5d                   	pop    %ebp
80105ee0:	c3                   	ret
80105ee1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105ee8:	c3                   	ret
80105ee9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105ef0 <uartintr>:

void
uartintr(void)
{
80105ef0:	55                   	push   %ebp
80105ef1:	89 e5                	mov    %esp,%ebp
80105ef3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105ef6:	68 70 5d 10 80       	push   $0x80105d70
80105efb:	e8 a0 a9 ff ff       	call   801008a0 <consoleintr>
}
80105f00:	83 c4 10             	add    $0x10,%esp
80105f03:	c9                   	leave
80105f04:	c3                   	ret

80105f05 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80105f05:	6a 00                	push   $0x0
  pushl $0
80105f07:	6a 00                	push   $0x0
  jmp alltraps
80105f09:	e9 02 fb ff ff       	jmp    80105a10 <alltraps>

80105f0e <vector1>:
.globl vector1
vector1:
  pushl $0
80105f0e:	6a 00                	push   $0x0
  pushl $1
80105f10:	6a 01                	push   $0x1
  jmp alltraps
80105f12:	e9 f9 fa ff ff       	jmp    80105a10 <alltraps>

80105f17 <vector2>:
.globl vector2
vector2:
  pushl $0
80105f17:	6a 00                	push   $0x0
  pushl $2
80105f19:	6a 02                	push   $0x2
  jmp alltraps
80105f1b:	e9 f0 fa ff ff       	jmp    80105a10 <alltraps>

80105f20 <vector3>:
.globl vector3
vector3:
  pushl $0
80105f20:	6a 00                	push   $0x0
  pushl $3
80105f22:	6a 03                	push   $0x3
  jmp alltraps
80105f24:	e9 e7 fa ff ff       	jmp    80105a10 <alltraps>

80105f29 <vector4>:
.globl vector4
vector4:
  pushl $0
80105f29:	6a 00                	push   $0x0
  pushl $4
80105f2b:	6a 04                	push   $0x4
  jmp alltraps
80105f2d:	e9 de fa ff ff       	jmp    80105a10 <alltraps>

80105f32 <vector5>:
.globl vector5
vector5:
  pushl $0
80105f32:	6a 00                	push   $0x0
  pushl $5
80105f34:	6a 05                	push   $0x5
  jmp alltraps
80105f36:	e9 d5 fa ff ff       	jmp    80105a10 <alltraps>

80105f3b <vector6>:
.globl vector6
vector6:
  pushl $0
80105f3b:	6a 00                	push   $0x0
  pushl $6
80105f3d:	6a 06                	push   $0x6
  jmp alltraps
80105f3f:	e9 cc fa ff ff       	jmp    80105a10 <alltraps>

80105f44 <vector7>:
.globl vector7
vector7:
  pushl $0
80105f44:	6a 00                	push   $0x0
  pushl $7
80105f46:	6a 07                	push   $0x7
  jmp alltraps
80105f48:	e9 c3 fa ff ff       	jmp    80105a10 <alltraps>

80105f4d <vector8>:
.globl vector8
vector8:
  pushl $8
80105f4d:	6a 08                	push   $0x8
  jmp alltraps
80105f4f:	e9 bc fa ff ff       	jmp    80105a10 <alltraps>

80105f54 <vector9>:
.globl vector9
vector9:
  pushl $0
80105f54:	6a 00                	push   $0x0
  pushl $9
80105f56:	6a 09                	push   $0x9
  jmp alltraps
80105f58:	e9 b3 fa ff ff       	jmp    80105a10 <alltraps>

80105f5d <vector10>:
.globl vector10
vector10:
  pushl $10
80105f5d:	6a 0a                	push   $0xa
  jmp alltraps
80105f5f:	e9 ac fa ff ff       	jmp    80105a10 <alltraps>

80105f64 <vector11>:
.globl vector11
vector11:
  pushl $11
80105f64:	6a 0b                	push   $0xb
  jmp alltraps
80105f66:	e9 a5 fa ff ff       	jmp    80105a10 <alltraps>

80105f6b <vector12>:
.globl vector12
vector12:
  pushl $12
80105f6b:	6a 0c                	push   $0xc
  jmp alltraps
80105f6d:	e9 9e fa ff ff       	jmp    80105a10 <alltraps>

80105f72 <vector13>:
.globl vector13
vector13:
  pushl $13
80105f72:	6a 0d                	push   $0xd
  jmp alltraps
80105f74:	e9 97 fa ff ff       	jmp    80105a10 <alltraps>

80105f79 <vector14>:
.globl vector14
vector14:
  pushl $14
80105f79:	6a 0e                	push   $0xe
  jmp alltraps
80105f7b:	e9 90 fa ff ff       	jmp    80105a10 <alltraps>

80105f80 <vector15>:
.globl vector15
vector15:
  pushl $0
80105f80:	6a 00                	push   $0x0
  pushl $15
80105f82:	6a 0f                	push   $0xf
  jmp alltraps
80105f84:	e9 87 fa ff ff       	jmp    80105a10 <alltraps>

80105f89 <vector16>:
.globl vector16
vector16:
  pushl $0
80105f89:	6a 00                	push   $0x0
  pushl $16
80105f8b:	6a 10                	push   $0x10
  jmp alltraps
80105f8d:	e9 7e fa ff ff       	jmp    80105a10 <alltraps>

80105f92 <vector17>:
.globl vector17
vector17:
  pushl $17
80105f92:	6a 11                	push   $0x11
  jmp alltraps
80105f94:	e9 77 fa ff ff       	jmp    80105a10 <alltraps>

80105f99 <vector18>:
.globl vector18
vector18:
  pushl $0
80105f99:	6a 00                	push   $0x0
  pushl $18
80105f9b:	6a 12                	push   $0x12
  jmp alltraps
80105f9d:	e9 6e fa ff ff       	jmp    80105a10 <alltraps>

80105fa2 <vector19>:
.globl vector19
vector19:
  pushl $0
80105fa2:	6a 00                	push   $0x0
  pushl $19
80105fa4:	6a 13                	push   $0x13
  jmp alltraps
80105fa6:	e9 65 fa ff ff       	jmp    80105a10 <alltraps>

80105fab <vector20>:
.globl vector20
vector20:
  pushl $0
80105fab:	6a 00                	push   $0x0
  pushl $20
80105fad:	6a 14                	push   $0x14
  jmp alltraps
80105faf:	e9 5c fa ff ff       	jmp    80105a10 <alltraps>

80105fb4 <vector21>:
.globl vector21
vector21:
  pushl $0
80105fb4:	6a 00                	push   $0x0
  pushl $21
80105fb6:	6a 15                	push   $0x15
  jmp alltraps
80105fb8:	e9 53 fa ff ff       	jmp    80105a10 <alltraps>

80105fbd <vector22>:
.globl vector22
vector22:
  pushl $0
80105fbd:	6a 00                	push   $0x0
  pushl $22
80105fbf:	6a 16                	push   $0x16
  jmp alltraps
80105fc1:	e9 4a fa ff ff       	jmp    80105a10 <alltraps>

80105fc6 <vector23>:
.globl vector23
vector23:
  pushl $0
80105fc6:	6a 00                	push   $0x0
  pushl $23
80105fc8:	6a 17                	push   $0x17
  jmp alltraps
80105fca:	e9 41 fa ff ff       	jmp    80105a10 <alltraps>

80105fcf <vector24>:
.globl vector24
vector24:
  pushl $0
80105fcf:	6a 00                	push   $0x0
  pushl $24
80105fd1:	6a 18                	push   $0x18
  jmp alltraps
80105fd3:	e9 38 fa ff ff       	jmp    80105a10 <alltraps>

80105fd8 <vector25>:
.globl vector25
vector25:
  pushl $0
80105fd8:	6a 00                	push   $0x0
  pushl $25
80105fda:	6a 19                	push   $0x19
  jmp alltraps
80105fdc:	e9 2f fa ff ff       	jmp    80105a10 <alltraps>

80105fe1 <vector26>:
.globl vector26
vector26:
  pushl $0
80105fe1:	6a 00                	push   $0x0
  pushl $26
80105fe3:	6a 1a                	push   $0x1a
  jmp alltraps
80105fe5:	e9 26 fa ff ff       	jmp    80105a10 <alltraps>

80105fea <vector27>:
.globl vector27
vector27:
  pushl $0
80105fea:	6a 00                	push   $0x0
  pushl $27
80105fec:	6a 1b                	push   $0x1b
  jmp alltraps
80105fee:	e9 1d fa ff ff       	jmp    80105a10 <alltraps>

80105ff3 <vector28>:
.globl vector28
vector28:
  pushl $0
80105ff3:	6a 00                	push   $0x0
  pushl $28
80105ff5:	6a 1c                	push   $0x1c
  jmp alltraps
80105ff7:	e9 14 fa ff ff       	jmp    80105a10 <alltraps>

80105ffc <vector29>:
.globl vector29
vector29:
  pushl $0
80105ffc:	6a 00                	push   $0x0
  pushl $29
80105ffe:	6a 1d                	push   $0x1d
  jmp alltraps
80106000:	e9 0b fa ff ff       	jmp    80105a10 <alltraps>

80106005 <vector30>:
.globl vector30
vector30:
  pushl $0
80106005:	6a 00                	push   $0x0
  pushl $30
80106007:	6a 1e                	push   $0x1e
  jmp alltraps
80106009:	e9 02 fa ff ff       	jmp    80105a10 <alltraps>

8010600e <vector31>:
.globl vector31
vector31:
  pushl $0
8010600e:	6a 00                	push   $0x0
  pushl $31
80106010:	6a 1f                	push   $0x1f
  jmp alltraps
80106012:	e9 f9 f9 ff ff       	jmp    80105a10 <alltraps>

80106017 <vector32>:
.globl vector32
vector32:
  pushl $0
80106017:	6a 00                	push   $0x0
  pushl $32
80106019:	6a 20                	push   $0x20
  jmp alltraps
8010601b:	e9 f0 f9 ff ff       	jmp    80105a10 <alltraps>

80106020 <vector33>:
.globl vector33
vector33:
  pushl $0
80106020:	6a 00                	push   $0x0
  pushl $33
80106022:	6a 21                	push   $0x21
  jmp alltraps
80106024:	e9 e7 f9 ff ff       	jmp    80105a10 <alltraps>

80106029 <vector34>:
.globl vector34
vector34:
  pushl $0
80106029:	6a 00                	push   $0x0
  pushl $34
8010602b:	6a 22                	push   $0x22
  jmp alltraps
8010602d:	e9 de f9 ff ff       	jmp    80105a10 <alltraps>

80106032 <vector35>:
.globl vector35
vector35:
  pushl $0
80106032:	6a 00                	push   $0x0
  pushl $35
80106034:	6a 23                	push   $0x23
  jmp alltraps
80106036:	e9 d5 f9 ff ff       	jmp    80105a10 <alltraps>

8010603b <vector36>:
.globl vector36
vector36:
  pushl $0
8010603b:	6a 00                	push   $0x0
  pushl $36
8010603d:	6a 24                	push   $0x24
  jmp alltraps
8010603f:	e9 cc f9 ff ff       	jmp    80105a10 <alltraps>

80106044 <vector37>:
.globl vector37
vector37:
  pushl $0
80106044:	6a 00                	push   $0x0
  pushl $37
80106046:	6a 25                	push   $0x25
  jmp alltraps
80106048:	e9 c3 f9 ff ff       	jmp    80105a10 <alltraps>

8010604d <vector38>:
.globl vector38
vector38:
  pushl $0
8010604d:	6a 00                	push   $0x0
  pushl $38
8010604f:	6a 26                	push   $0x26
  jmp alltraps
80106051:	e9 ba f9 ff ff       	jmp    80105a10 <alltraps>

80106056 <vector39>:
.globl vector39
vector39:
  pushl $0
80106056:	6a 00                	push   $0x0
  pushl $39
80106058:	6a 27                	push   $0x27
  jmp alltraps
8010605a:	e9 b1 f9 ff ff       	jmp    80105a10 <alltraps>

8010605f <vector40>:
.globl vector40
vector40:
  pushl $0
8010605f:	6a 00                	push   $0x0
  pushl $40
80106061:	6a 28                	push   $0x28
  jmp alltraps
80106063:	e9 a8 f9 ff ff       	jmp    80105a10 <alltraps>

80106068 <vector41>:
.globl vector41
vector41:
  pushl $0
80106068:	6a 00                	push   $0x0
  pushl $41
8010606a:	6a 29                	push   $0x29
  jmp alltraps
8010606c:	e9 9f f9 ff ff       	jmp    80105a10 <alltraps>

80106071 <vector42>:
.globl vector42
vector42:
  pushl $0
80106071:	6a 00                	push   $0x0
  pushl $42
80106073:	6a 2a                	push   $0x2a
  jmp alltraps
80106075:	e9 96 f9 ff ff       	jmp    80105a10 <alltraps>

8010607a <vector43>:
.globl vector43
vector43:
  pushl $0
8010607a:	6a 00                	push   $0x0
  pushl $43
8010607c:	6a 2b                	push   $0x2b
  jmp alltraps
8010607e:	e9 8d f9 ff ff       	jmp    80105a10 <alltraps>

80106083 <vector44>:
.globl vector44
vector44:
  pushl $0
80106083:	6a 00                	push   $0x0
  pushl $44
80106085:	6a 2c                	push   $0x2c
  jmp alltraps
80106087:	e9 84 f9 ff ff       	jmp    80105a10 <alltraps>

8010608c <vector45>:
.globl vector45
vector45:
  pushl $0
8010608c:	6a 00                	push   $0x0
  pushl $45
8010608e:	6a 2d                	push   $0x2d
  jmp alltraps
80106090:	e9 7b f9 ff ff       	jmp    80105a10 <alltraps>

80106095 <vector46>:
.globl vector46
vector46:
  pushl $0
80106095:	6a 00                	push   $0x0
  pushl $46
80106097:	6a 2e                	push   $0x2e
  jmp alltraps
80106099:	e9 72 f9 ff ff       	jmp    80105a10 <alltraps>

8010609e <vector47>:
.globl vector47
vector47:
  pushl $0
8010609e:	6a 00                	push   $0x0
  pushl $47
801060a0:	6a 2f                	push   $0x2f
  jmp alltraps
801060a2:	e9 69 f9 ff ff       	jmp    80105a10 <alltraps>

801060a7 <vector48>:
.globl vector48
vector48:
  pushl $0
801060a7:	6a 00                	push   $0x0
  pushl $48
801060a9:	6a 30                	push   $0x30
  jmp alltraps
801060ab:	e9 60 f9 ff ff       	jmp    80105a10 <alltraps>

801060b0 <vector49>:
.globl vector49
vector49:
  pushl $0
801060b0:	6a 00                	push   $0x0
  pushl $49
801060b2:	6a 31                	push   $0x31
  jmp alltraps
801060b4:	e9 57 f9 ff ff       	jmp    80105a10 <alltraps>

801060b9 <vector50>:
.globl vector50
vector50:
  pushl $0
801060b9:	6a 00                	push   $0x0
  pushl $50
801060bb:	6a 32                	push   $0x32
  jmp alltraps
801060bd:	e9 4e f9 ff ff       	jmp    80105a10 <alltraps>

801060c2 <vector51>:
.globl vector51
vector51:
  pushl $0
801060c2:	6a 00                	push   $0x0
  pushl $51
801060c4:	6a 33                	push   $0x33
  jmp alltraps
801060c6:	e9 45 f9 ff ff       	jmp    80105a10 <alltraps>

801060cb <vector52>:
.globl vector52
vector52:
  pushl $0
801060cb:	6a 00                	push   $0x0
  pushl $52
801060cd:	6a 34                	push   $0x34
  jmp alltraps
801060cf:	e9 3c f9 ff ff       	jmp    80105a10 <alltraps>

801060d4 <vector53>:
.globl vector53
vector53:
  pushl $0
801060d4:	6a 00                	push   $0x0
  pushl $53
801060d6:	6a 35                	push   $0x35
  jmp alltraps
801060d8:	e9 33 f9 ff ff       	jmp    80105a10 <alltraps>

801060dd <vector54>:
.globl vector54
vector54:
  pushl $0
801060dd:	6a 00                	push   $0x0
  pushl $54
801060df:	6a 36                	push   $0x36
  jmp alltraps
801060e1:	e9 2a f9 ff ff       	jmp    80105a10 <alltraps>

801060e6 <vector55>:
.globl vector55
vector55:
  pushl $0
801060e6:	6a 00                	push   $0x0
  pushl $55
801060e8:	6a 37                	push   $0x37
  jmp alltraps
801060ea:	e9 21 f9 ff ff       	jmp    80105a10 <alltraps>

801060ef <vector56>:
.globl vector56
vector56:
  pushl $0
801060ef:	6a 00                	push   $0x0
  pushl $56
801060f1:	6a 38                	push   $0x38
  jmp alltraps
801060f3:	e9 18 f9 ff ff       	jmp    80105a10 <alltraps>

801060f8 <vector57>:
.globl vector57
vector57:
  pushl $0
801060f8:	6a 00                	push   $0x0
  pushl $57
801060fa:	6a 39                	push   $0x39
  jmp alltraps
801060fc:	e9 0f f9 ff ff       	jmp    80105a10 <alltraps>

80106101 <vector58>:
.globl vector58
vector58:
  pushl $0
80106101:	6a 00                	push   $0x0
  pushl $58
80106103:	6a 3a                	push   $0x3a
  jmp alltraps
80106105:	e9 06 f9 ff ff       	jmp    80105a10 <alltraps>

8010610a <vector59>:
.globl vector59
vector59:
  pushl $0
8010610a:	6a 00                	push   $0x0
  pushl $59
8010610c:	6a 3b                	push   $0x3b
  jmp alltraps
8010610e:	e9 fd f8 ff ff       	jmp    80105a10 <alltraps>

80106113 <vector60>:
.globl vector60
vector60:
  pushl $0
80106113:	6a 00                	push   $0x0
  pushl $60
80106115:	6a 3c                	push   $0x3c
  jmp alltraps
80106117:	e9 f4 f8 ff ff       	jmp    80105a10 <alltraps>

8010611c <vector61>:
.globl vector61
vector61:
  pushl $0
8010611c:	6a 00                	push   $0x0
  pushl $61
8010611e:	6a 3d                	push   $0x3d
  jmp alltraps
80106120:	e9 eb f8 ff ff       	jmp    80105a10 <alltraps>

80106125 <vector62>:
.globl vector62
vector62:
  pushl $0
80106125:	6a 00                	push   $0x0
  pushl $62
80106127:	6a 3e                	push   $0x3e
  jmp alltraps
80106129:	e9 e2 f8 ff ff       	jmp    80105a10 <alltraps>

8010612e <vector63>:
.globl vector63
vector63:
  pushl $0
8010612e:	6a 00                	push   $0x0
  pushl $63
80106130:	6a 3f                	push   $0x3f
  jmp alltraps
80106132:	e9 d9 f8 ff ff       	jmp    80105a10 <alltraps>

80106137 <vector64>:
.globl vector64
vector64:
  pushl $0
80106137:	6a 00                	push   $0x0
  pushl $64
80106139:	6a 40                	push   $0x40
  jmp alltraps
8010613b:	e9 d0 f8 ff ff       	jmp    80105a10 <alltraps>

80106140 <vector65>:
.globl vector65
vector65:
  pushl $0
80106140:	6a 00                	push   $0x0
  pushl $65
80106142:	6a 41                	push   $0x41
  jmp alltraps
80106144:	e9 c7 f8 ff ff       	jmp    80105a10 <alltraps>

80106149 <vector66>:
.globl vector66
vector66:
  pushl $0
80106149:	6a 00                	push   $0x0
  pushl $66
8010614b:	6a 42                	push   $0x42
  jmp alltraps
8010614d:	e9 be f8 ff ff       	jmp    80105a10 <alltraps>

80106152 <vector67>:
.globl vector67
vector67:
  pushl $0
80106152:	6a 00                	push   $0x0
  pushl $67
80106154:	6a 43                	push   $0x43
  jmp alltraps
80106156:	e9 b5 f8 ff ff       	jmp    80105a10 <alltraps>

8010615b <vector68>:
.globl vector68
vector68:
  pushl $0
8010615b:	6a 00                	push   $0x0
  pushl $68
8010615d:	6a 44                	push   $0x44
  jmp alltraps
8010615f:	e9 ac f8 ff ff       	jmp    80105a10 <alltraps>

80106164 <vector69>:
.globl vector69
vector69:
  pushl $0
80106164:	6a 00                	push   $0x0
  pushl $69
80106166:	6a 45                	push   $0x45
  jmp alltraps
80106168:	e9 a3 f8 ff ff       	jmp    80105a10 <alltraps>

8010616d <vector70>:
.globl vector70
vector70:
  pushl $0
8010616d:	6a 00                	push   $0x0
  pushl $70
8010616f:	6a 46                	push   $0x46
  jmp alltraps
80106171:	e9 9a f8 ff ff       	jmp    80105a10 <alltraps>

80106176 <vector71>:
.globl vector71
vector71:
  pushl $0
80106176:	6a 00                	push   $0x0
  pushl $71
80106178:	6a 47                	push   $0x47
  jmp alltraps
8010617a:	e9 91 f8 ff ff       	jmp    80105a10 <alltraps>

8010617f <vector72>:
.globl vector72
vector72:
  pushl $0
8010617f:	6a 00                	push   $0x0
  pushl $72
80106181:	6a 48                	push   $0x48
  jmp alltraps
80106183:	e9 88 f8 ff ff       	jmp    80105a10 <alltraps>

80106188 <vector73>:
.globl vector73
vector73:
  pushl $0
80106188:	6a 00                	push   $0x0
  pushl $73
8010618a:	6a 49                	push   $0x49
  jmp alltraps
8010618c:	e9 7f f8 ff ff       	jmp    80105a10 <alltraps>

80106191 <vector74>:
.globl vector74
vector74:
  pushl $0
80106191:	6a 00                	push   $0x0
  pushl $74
80106193:	6a 4a                	push   $0x4a
  jmp alltraps
80106195:	e9 76 f8 ff ff       	jmp    80105a10 <alltraps>

8010619a <vector75>:
.globl vector75
vector75:
  pushl $0
8010619a:	6a 00                	push   $0x0
  pushl $75
8010619c:	6a 4b                	push   $0x4b
  jmp alltraps
8010619e:	e9 6d f8 ff ff       	jmp    80105a10 <alltraps>

801061a3 <vector76>:
.globl vector76
vector76:
  pushl $0
801061a3:	6a 00                	push   $0x0
  pushl $76
801061a5:	6a 4c                	push   $0x4c
  jmp alltraps
801061a7:	e9 64 f8 ff ff       	jmp    80105a10 <alltraps>

801061ac <vector77>:
.globl vector77
vector77:
  pushl $0
801061ac:	6a 00                	push   $0x0
  pushl $77
801061ae:	6a 4d                	push   $0x4d
  jmp alltraps
801061b0:	e9 5b f8 ff ff       	jmp    80105a10 <alltraps>

801061b5 <vector78>:
.globl vector78
vector78:
  pushl $0
801061b5:	6a 00                	push   $0x0
  pushl $78
801061b7:	6a 4e                	push   $0x4e
  jmp alltraps
801061b9:	e9 52 f8 ff ff       	jmp    80105a10 <alltraps>

801061be <vector79>:
.globl vector79
vector79:
  pushl $0
801061be:	6a 00                	push   $0x0
  pushl $79
801061c0:	6a 4f                	push   $0x4f
  jmp alltraps
801061c2:	e9 49 f8 ff ff       	jmp    80105a10 <alltraps>

801061c7 <vector80>:
.globl vector80
vector80:
  pushl $0
801061c7:	6a 00                	push   $0x0
  pushl $80
801061c9:	6a 50                	push   $0x50
  jmp alltraps
801061cb:	e9 40 f8 ff ff       	jmp    80105a10 <alltraps>

801061d0 <vector81>:
.globl vector81
vector81:
  pushl $0
801061d0:	6a 00                	push   $0x0
  pushl $81
801061d2:	6a 51                	push   $0x51
  jmp alltraps
801061d4:	e9 37 f8 ff ff       	jmp    80105a10 <alltraps>

801061d9 <vector82>:
.globl vector82
vector82:
  pushl $0
801061d9:	6a 00                	push   $0x0
  pushl $82
801061db:	6a 52                	push   $0x52
  jmp alltraps
801061dd:	e9 2e f8 ff ff       	jmp    80105a10 <alltraps>

801061e2 <vector83>:
.globl vector83
vector83:
  pushl $0
801061e2:	6a 00                	push   $0x0
  pushl $83
801061e4:	6a 53                	push   $0x53
  jmp alltraps
801061e6:	e9 25 f8 ff ff       	jmp    80105a10 <alltraps>

801061eb <vector84>:
.globl vector84
vector84:
  pushl $0
801061eb:	6a 00                	push   $0x0
  pushl $84
801061ed:	6a 54                	push   $0x54
  jmp alltraps
801061ef:	e9 1c f8 ff ff       	jmp    80105a10 <alltraps>

801061f4 <vector85>:
.globl vector85
vector85:
  pushl $0
801061f4:	6a 00                	push   $0x0
  pushl $85
801061f6:	6a 55                	push   $0x55
  jmp alltraps
801061f8:	e9 13 f8 ff ff       	jmp    80105a10 <alltraps>

801061fd <vector86>:
.globl vector86
vector86:
  pushl $0
801061fd:	6a 00                	push   $0x0
  pushl $86
801061ff:	6a 56                	push   $0x56
  jmp alltraps
80106201:	e9 0a f8 ff ff       	jmp    80105a10 <alltraps>

80106206 <vector87>:
.globl vector87
vector87:
  pushl $0
80106206:	6a 00                	push   $0x0
  pushl $87
80106208:	6a 57                	push   $0x57
  jmp alltraps
8010620a:	e9 01 f8 ff ff       	jmp    80105a10 <alltraps>

8010620f <vector88>:
.globl vector88
vector88:
  pushl $0
8010620f:	6a 00                	push   $0x0
  pushl $88
80106211:	6a 58                	push   $0x58
  jmp alltraps
80106213:	e9 f8 f7 ff ff       	jmp    80105a10 <alltraps>

80106218 <vector89>:
.globl vector89
vector89:
  pushl $0
80106218:	6a 00                	push   $0x0
  pushl $89
8010621a:	6a 59                	push   $0x59
  jmp alltraps
8010621c:	e9 ef f7 ff ff       	jmp    80105a10 <alltraps>

80106221 <vector90>:
.globl vector90
vector90:
  pushl $0
80106221:	6a 00                	push   $0x0
  pushl $90
80106223:	6a 5a                	push   $0x5a
  jmp alltraps
80106225:	e9 e6 f7 ff ff       	jmp    80105a10 <alltraps>

8010622a <vector91>:
.globl vector91
vector91:
  pushl $0
8010622a:	6a 00                	push   $0x0
  pushl $91
8010622c:	6a 5b                	push   $0x5b
  jmp alltraps
8010622e:	e9 dd f7 ff ff       	jmp    80105a10 <alltraps>

80106233 <vector92>:
.globl vector92
vector92:
  pushl $0
80106233:	6a 00                	push   $0x0
  pushl $92
80106235:	6a 5c                	push   $0x5c
  jmp alltraps
80106237:	e9 d4 f7 ff ff       	jmp    80105a10 <alltraps>

8010623c <vector93>:
.globl vector93
vector93:
  pushl $0
8010623c:	6a 00                	push   $0x0
  pushl $93
8010623e:	6a 5d                	push   $0x5d
  jmp alltraps
80106240:	e9 cb f7 ff ff       	jmp    80105a10 <alltraps>

80106245 <vector94>:
.globl vector94
vector94:
  pushl $0
80106245:	6a 00                	push   $0x0
  pushl $94
80106247:	6a 5e                	push   $0x5e
  jmp alltraps
80106249:	e9 c2 f7 ff ff       	jmp    80105a10 <alltraps>

8010624e <vector95>:
.globl vector95
vector95:
  pushl $0
8010624e:	6a 00                	push   $0x0
  pushl $95
80106250:	6a 5f                	push   $0x5f
  jmp alltraps
80106252:	e9 b9 f7 ff ff       	jmp    80105a10 <alltraps>

80106257 <vector96>:
.globl vector96
vector96:
  pushl $0
80106257:	6a 00                	push   $0x0
  pushl $96
80106259:	6a 60                	push   $0x60
  jmp alltraps
8010625b:	e9 b0 f7 ff ff       	jmp    80105a10 <alltraps>

80106260 <vector97>:
.globl vector97
vector97:
  pushl $0
80106260:	6a 00                	push   $0x0
  pushl $97
80106262:	6a 61                	push   $0x61
  jmp alltraps
80106264:	e9 a7 f7 ff ff       	jmp    80105a10 <alltraps>

80106269 <vector98>:
.globl vector98
vector98:
  pushl $0
80106269:	6a 00                	push   $0x0
  pushl $98
8010626b:	6a 62                	push   $0x62
  jmp alltraps
8010626d:	e9 9e f7 ff ff       	jmp    80105a10 <alltraps>

80106272 <vector99>:
.globl vector99
vector99:
  pushl $0
80106272:	6a 00                	push   $0x0
  pushl $99
80106274:	6a 63                	push   $0x63
  jmp alltraps
80106276:	e9 95 f7 ff ff       	jmp    80105a10 <alltraps>

8010627b <vector100>:
.globl vector100
vector100:
  pushl $0
8010627b:	6a 00                	push   $0x0
  pushl $100
8010627d:	6a 64                	push   $0x64
  jmp alltraps
8010627f:	e9 8c f7 ff ff       	jmp    80105a10 <alltraps>

80106284 <vector101>:
.globl vector101
vector101:
  pushl $0
80106284:	6a 00                	push   $0x0
  pushl $101
80106286:	6a 65                	push   $0x65
  jmp alltraps
80106288:	e9 83 f7 ff ff       	jmp    80105a10 <alltraps>

8010628d <vector102>:
.globl vector102
vector102:
  pushl $0
8010628d:	6a 00                	push   $0x0
  pushl $102
8010628f:	6a 66                	push   $0x66
  jmp alltraps
80106291:	e9 7a f7 ff ff       	jmp    80105a10 <alltraps>

80106296 <vector103>:
.globl vector103
vector103:
  pushl $0
80106296:	6a 00                	push   $0x0
  pushl $103
80106298:	6a 67                	push   $0x67
  jmp alltraps
8010629a:	e9 71 f7 ff ff       	jmp    80105a10 <alltraps>

8010629f <vector104>:
.globl vector104
vector104:
  pushl $0
8010629f:	6a 00                	push   $0x0
  pushl $104
801062a1:	6a 68                	push   $0x68
  jmp alltraps
801062a3:	e9 68 f7 ff ff       	jmp    80105a10 <alltraps>

801062a8 <vector105>:
.globl vector105
vector105:
  pushl $0
801062a8:	6a 00                	push   $0x0
  pushl $105
801062aa:	6a 69                	push   $0x69
  jmp alltraps
801062ac:	e9 5f f7 ff ff       	jmp    80105a10 <alltraps>

801062b1 <vector106>:
.globl vector106
vector106:
  pushl $0
801062b1:	6a 00                	push   $0x0
  pushl $106
801062b3:	6a 6a                	push   $0x6a
  jmp alltraps
801062b5:	e9 56 f7 ff ff       	jmp    80105a10 <alltraps>

801062ba <vector107>:
.globl vector107
vector107:
  pushl $0
801062ba:	6a 00                	push   $0x0
  pushl $107
801062bc:	6a 6b                	push   $0x6b
  jmp alltraps
801062be:	e9 4d f7 ff ff       	jmp    80105a10 <alltraps>

801062c3 <vector108>:
.globl vector108
vector108:
  pushl $0
801062c3:	6a 00                	push   $0x0
  pushl $108
801062c5:	6a 6c                	push   $0x6c
  jmp alltraps
801062c7:	e9 44 f7 ff ff       	jmp    80105a10 <alltraps>

801062cc <vector109>:
.globl vector109
vector109:
  pushl $0
801062cc:	6a 00                	push   $0x0
  pushl $109
801062ce:	6a 6d                	push   $0x6d
  jmp alltraps
801062d0:	e9 3b f7 ff ff       	jmp    80105a10 <alltraps>

801062d5 <vector110>:
.globl vector110
vector110:
  pushl $0
801062d5:	6a 00                	push   $0x0
  pushl $110
801062d7:	6a 6e                	push   $0x6e
  jmp alltraps
801062d9:	e9 32 f7 ff ff       	jmp    80105a10 <alltraps>

801062de <vector111>:
.globl vector111
vector111:
  pushl $0
801062de:	6a 00                	push   $0x0
  pushl $111
801062e0:	6a 6f                	push   $0x6f
  jmp alltraps
801062e2:	e9 29 f7 ff ff       	jmp    80105a10 <alltraps>

801062e7 <vector112>:
.globl vector112
vector112:
  pushl $0
801062e7:	6a 00                	push   $0x0
  pushl $112
801062e9:	6a 70                	push   $0x70
  jmp alltraps
801062eb:	e9 20 f7 ff ff       	jmp    80105a10 <alltraps>

801062f0 <vector113>:
.globl vector113
vector113:
  pushl $0
801062f0:	6a 00                	push   $0x0
  pushl $113
801062f2:	6a 71                	push   $0x71
  jmp alltraps
801062f4:	e9 17 f7 ff ff       	jmp    80105a10 <alltraps>

801062f9 <vector114>:
.globl vector114
vector114:
  pushl $0
801062f9:	6a 00                	push   $0x0
  pushl $114
801062fb:	6a 72                	push   $0x72
  jmp alltraps
801062fd:	e9 0e f7 ff ff       	jmp    80105a10 <alltraps>

80106302 <vector115>:
.globl vector115
vector115:
  pushl $0
80106302:	6a 00                	push   $0x0
  pushl $115
80106304:	6a 73                	push   $0x73
  jmp alltraps
80106306:	e9 05 f7 ff ff       	jmp    80105a10 <alltraps>

8010630b <vector116>:
.globl vector116
vector116:
  pushl $0
8010630b:	6a 00                	push   $0x0
  pushl $116
8010630d:	6a 74                	push   $0x74
  jmp alltraps
8010630f:	e9 fc f6 ff ff       	jmp    80105a10 <alltraps>

80106314 <vector117>:
.globl vector117
vector117:
  pushl $0
80106314:	6a 00                	push   $0x0
  pushl $117
80106316:	6a 75                	push   $0x75
  jmp alltraps
80106318:	e9 f3 f6 ff ff       	jmp    80105a10 <alltraps>

8010631d <vector118>:
.globl vector118
vector118:
  pushl $0
8010631d:	6a 00                	push   $0x0
  pushl $118
8010631f:	6a 76                	push   $0x76
  jmp alltraps
80106321:	e9 ea f6 ff ff       	jmp    80105a10 <alltraps>

80106326 <vector119>:
.globl vector119
vector119:
  pushl $0
80106326:	6a 00                	push   $0x0
  pushl $119
80106328:	6a 77                	push   $0x77
  jmp alltraps
8010632a:	e9 e1 f6 ff ff       	jmp    80105a10 <alltraps>

8010632f <vector120>:
.globl vector120
vector120:
  pushl $0
8010632f:	6a 00                	push   $0x0
  pushl $120
80106331:	6a 78                	push   $0x78
  jmp alltraps
80106333:	e9 d8 f6 ff ff       	jmp    80105a10 <alltraps>

80106338 <vector121>:
.globl vector121
vector121:
  pushl $0
80106338:	6a 00                	push   $0x0
  pushl $121
8010633a:	6a 79                	push   $0x79
  jmp alltraps
8010633c:	e9 cf f6 ff ff       	jmp    80105a10 <alltraps>

80106341 <vector122>:
.globl vector122
vector122:
  pushl $0
80106341:	6a 00                	push   $0x0
  pushl $122
80106343:	6a 7a                	push   $0x7a
  jmp alltraps
80106345:	e9 c6 f6 ff ff       	jmp    80105a10 <alltraps>

8010634a <vector123>:
.globl vector123
vector123:
  pushl $0
8010634a:	6a 00                	push   $0x0
  pushl $123
8010634c:	6a 7b                	push   $0x7b
  jmp alltraps
8010634e:	e9 bd f6 ff ff       	jmp    80105a10 <alltraps>

80106353 <vector124>:
.globl vector124
vector124:
  pushl $0
80106353:	6a 00                	push   $0x0
  pushl $124
80106355:	6a 7c                	push   $0x7c
  jmp alltraps
80106357:	e9 b4 f6 ff ff       	jmp    80105a10 <alltraps>

8010635c <vector125>:
.globl vector125
vector125:
  pushl $0
8010635c:	6a 00                	push   $0x0
  pushl $125
8010635e:	6a 7d                	push   $0x7d
  jmp alltraps
80106360:	e9 ab f6 ff ff       	jmp    80105a10 <alltraps>

80106365 <vector126>:
.globl vector126
vector126:
  pushl $0
80106365:	6a 00                	push   $0x0
  pushl $126
80106367:	6a 7e                	push   $0x7e
  jmp alltraps
80106369:	e9 a2 f6 ff ff       	jmp    80105a10 <alltraps>

8010636e <vector127>:
.globl vector127
vector127:
  pushl $0
8010636e:	6a 00                	push   $0x0
  pushl $127
80106370:	6a 7f                	push   $0x7f
  jmp alltraps
80106372:	e9 99 f6 ff ff       	jmp    80105a10 <alltraps>

80106377 <vector128>:
.globl vector128
vector128:
  pushl $0
80106377:	6a 00                	push   $0x0
  pushl $128
80106379:	68 80 00 00 00       	push   $0x80
  jmp alltraps
8010637e:	e9 8d f6 ff ff       	jmp    80105a10 <alltraps>

80106383 <vector129>:
.globl vector129
vector129:
  pushl $0
80106383:	6a 00                	push   $0x0
  pushl $129
80106385:	68 81 00 00 00       	push   $0x81
  jmp alltraps
8010638a:	e9 81 f6 ff ff       	jmp    80105a10 <alltraps>

8010638f <vector130>:
.globl vector130
vector130:
  pushl $0
8010638f:	6a 00                	push   $0x0
  pushl $130
80106391:	68 82 00 00 00       	push   $0x82
  jmp alltraps
80106396:	e9 75 f6 ff ff       	jmp    80105a10 <alltraps>

8010639b <vector131>:
.globl vector131
vector131:
  pushl $0
8010639b:	6a 00                	push   $0x0
  pushl $131
8010639d:	68 83 00 00 00       	push   $0x83
  jmp alltraps
801063a2:	e9 69 f6 ff ff       	jmp    80105a10 <alltraps>

801063a7 <vector132>:
.globl vector132
vector132:
  pushl $0
801063a7:	6a 00                	push   $0x0
  pushl $132
801063a9:	68 84 00 00 00       	push   $0x84
  jmp alltraps
801063ae:	e9 5d f6 ff ff       	jmp    80105a10 <alltraps>

801063b3 <vector133>:
.globl vector133
vector133:
  pushl $0
801063b3:	6a 00                	push   $0x0
  pushl $133
801063b5:	68 85 00 00 00       	push   $0x85
  jmp alltraps
801063ba:	e9 51 f6 ff ff       	jmp    80105a10 <alltraps>

801063bf <vector134>:
.globl vector134
vector134:
  pushl $0
801063bf:	6a 00                	push   $0x0
  pushl $134
801063c1:	68 86 00 00 00       	push   $0x86
  jmp alltraps
801063c6:	e9 45 f6 ff ff       	jmp    80105a10 <alltraps>

801063cb <vector135>:
.globl vector135
vector135:
  pushl $0
801063cb:	6a 00                	push   $0x0
  pushl $135
801063cd:	68 87 00 00 00       	push   $0x87
  jmp alltraps
801063d2:	e9 39 f6 ff ff       	jmp    80105a10 <alltraps>

801063d7 <vector136>:
.globl vector136
vector136:
  pushl $0
801063d7:	6a 00                	push   $0x0
  pushl $136
801063d9:	68 88 00 00 00       	push   $0x88
  jmp alltraps
801063de:	e9 2d f6 ff ff       	jmp    80105a10 <alltraps>

801063e3 <vector137>:
.globl vector137
vector137:
  pushl $0
801063e3:	6a 00                	push   $0x0
  pushl $137
801063e5:	68 89 00 00 00       	push   $0x89
  jmp alltraps
801063ea:	e9 21 f6 ff ff       	jmp    80105a10 <alltraps>

801063ef <vector138>:
.globl vector138
vector138:
  pushl $0
801063ef:	6a 00                	push   $0x0
  pushl $138
801063f1:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
801063f6:	e9 15 f6 ff ff       	jmp    80105a10 <alltraps>

801063fb <vector139>:
.globl vector139
vector139:
  pushl $0
801063fb:	6a 00                	push   $0x0
  pushl $139
801063fd:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80106402:	e9 09 f6 ff ff       	jmp    80105a10 <alltraps>

80106407 <vector140>:
.globl vector140
vector140:
  pushl $0
80106407:	6a 00                	push   $0x0
  pushl $140
80106409:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
8010640e:	e9 fd f5 ff ff       	jmp    80105a10 <alltraps>

80106413 <vector141>:
.globl vector141
vector141:
  pushl $0
80106413:	6a 00                	push   $0x0
  pushl $141
80106415:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
8010641a:	e9 f1 f5 ff ff       	jmp    80105a10 <alltraps>

8010641f <vector142>:
.globl vector142
vector142:
  pushl $0
8010641f:	6a 00                	push   $0x0
  pushl $142
80106421:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80106426:	e9 e5 f5 ff ff       	jmp    80105a10 <alltraps>

8010642b <vector143>:
.globl vector143
vector143:
  pushl $0
8010642b:	6a 00                	push   $0x0
  pushl $143
8010642d:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106432:	e9 d9 f5 ff ff       	jmp    80105a10 <alltraps>

80106437 <vector144>:
.globl vector144
vector144:
  pushl $0
80106437:	6a 00                	push   $0x0
  pushl $144
80106439:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010643e:	e9 cd f5 ff ff       	jmp    80105a10 <alltraps>

80106443 <vector145>:
.globl vector145
vector145:
  pushl $0
80106443:	6a 00                	push   $0x0
  pushl $145
80106445:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010644a:	e9 c1 f5 ff ff       	jmp    80105a10 <alltraps>

8010644f <vector146>:
.globl vector146
vector146:
  pushl $0
8010644f:	6a 00                	push   $0x0
  pushl $146
80106451:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80106456:	e9 b5 f5 ff ff       	jmp    80105a10 <alltraps>

8010645b <vector147>:
.globl vector147
vector147:
  pushl $0
8010645b:	6a 00                	push   $0x0
  pushl $147
8010645d:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80106462:	e9 a9 f5 ff ff       	jmp    80105a10 <alltraps>

80106467 <vector148>:
.globl vector148
vector148:
  pushl $0
80106467:	6a 00                	push   $0x0
  pushl $148
80106469:	68 94 00 00 00       	push   $0x94
  jmp alltraps
8010646e:	e9 9d f5 ff ff       	jmp    80105a10 <alltraps>

80106473 <vector149>:
.globl vector149
vector149:
  pushl $0
80106473:	6a 00                	push   $0x0
  pushl $149
80106475:	68 95 00 00 00       	push   $0x95
  jmp alltraps
8010647a:	e9 91 f5 ff ff       	jmp    80105a10 <alltraps>

8010647f <vector150>:
.globl vector150
vector150:
  pushl $0
8010647f:	6a 00                	push   $0x0
  pushl $150
80106481:	68 96 00 00 00       	push   $0x96
  jmp alltraps
80106486:	e9 85 f5 ff ff       	jmp    80105a10 <alltraps>

8010648b <vector151>:
.globl vector151
vector151:
  pushl $0
8010648b:	6a 00                	push   $0x0
  pushl $151
8010648d:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80106492:	e9 79 f5 ff ff       	jmp    80105a10 <alltraps>

80106497 <vector152>:
.globl vector152
vector152:
  pushl $0
80106497:	6a 00                	push   $0x0
  pushl $152
80106499:	68 98 00 00 00       	push   $0x98
  jmp alltraps
8010649e:	e9 6d f5 ff ff       	jmp    80105a10 <alltraps>

801064a3 <vector153>:
.globl vector153
vector153:
  pushl $0
801064a3:	6a 00                	push   $0x0
  pushl $153
801064a5:	68 99 00 00 00       	push   $0x99
  jmp alltraps
801064aa:	e9 61 f5 ff ff       	jmp    80105a10 <alltraps>

801064af <vector154>:
.globl vector154
vector154:
  pushl $0
801064af:	6a 00                	push   $0x0
  pushl $154
801064b1:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
801064b6:	e9 55 f5 ff ff       	jmp    80105a10 <alltraps>

801064bb <vector155>:
.globl vector155
vector155:
  pushl $0
801064bb:	6a 00                	push   $0x0
  pushl $155
801064bd:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
801064c2:	e9 49 f5 ff ff       	jmp    80105a10 <alltraps>

801064c7 <vector156>:
.globl vector156
vector156:
  pushl $0
801064c7:	6a 00                	push   $0x0
  pushl $156
801064c9:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
801064ce:	e9 3d f5 ff ff       	jmp    80105a10 <alltraps>

801064d3 <vector157>:
.globl vector157
vector157:
  pushl $0
801064d3:	6a 00                	push   $0x0
  pushl $157
801064d5:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
801064da:	e9 31 f5 ff ff       	jmp    80105a10 <alltraps>

801064df <vector158>:
.globl vector158
vector158:
  pushl $0
801064df:	6a 00                	push   $0x0
  pushl $158
801064e1:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
801064e6:	e9 25 f5 ff ff       	jmp    80105a10 <alltraps>

801064eb <vector159>:
.globl vector159
vector159:
  pushl $0
801064eb:	6a 00                	push   $0x0
  pushl $159
801064ed:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
801064f2:	e9 19 f5 ff ff       	jmp    80105a10 <alltraps>

801064f7 <vector160>:
.globl vector160
vector160:
  pushl $0
801064f7:	6a 00                	push   $0x0
  pushl $160
801064f9:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
801064fe:	e9 0d f5 ff ff       	jmp    80105a10 <alltraps>

80106503 <vector161>:
.globl vector161
vector161:
  pushl $0
80106503:	6a 00                	push   $0x0
  pushl $161
80106505:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
8010650a:	e9 01 f5 ff ff       	jmp    80105a10 <alltraps>

8010650f <vector162>:
.globl vector162
vector162:
  pushl $0
8010650f:	6a 00                	push   $0x0
  pushl $162
80106511:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
80106516:	e9 f5 f4 ff ff       	jmp    80105a10 <alltraps>

8010651b <vector163>:
.globl vector163
vector163:
  pushl $0
8010651b:	6a 00                	push   $0x0
  pushl $163
8010651d:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80106522:	e9 e9 f4 ff ff       	jmp    80105a10 <alltraps>

80106527 <vector164>:
.globl vector164
vector164:
  pushl $0
80106527:	6a 00                	push   $0x0
  pushl $164
80106529:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
8010652e:	e9 dd f4 ff ff       	jmp    80105a10 <alltraps>

80106533 <vector165>:
.globl vector165
vector165:
  pushl $0
80106533:	6a 00                	push   $0x0
  pushl $165
80106535:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010653a:	e9 d1 f4 ff ff       	jmp    80105a10 <alltraps>

8010653f <vector166>:
.globl vector166
vector166:
  pushl $0
8010653f:	6a 00                	push   $0x0
  pushl $166
80106541:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106546:	e9 c5 f4 ff ff       	jmp    80105a10 <alltraps>

8010654b <vector167>:
.globl vector167
vector167:
  pushl $0
8010654b:	6a 00                	push   $0x0
  pushl $167
8010654d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80106552:	e9 b9 f4 ff ff       	jmp    80105a10 <alltraps>

80106557 <vector168>:
.globl vector168
vector168:
  pushl $0
80106557:	6a 00                	push   $0x0
  pushl $168
80106559:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
8010655e:	e9 ad f4 ff ff       	jmp    80105a10 <alltraps>

80106563 <vector169>:
.globl vector169
vector169:
  pushl $0
80106563:	6a 00                	push   $0x0
  pushl $169
80106565:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
8010656a:	e9 a1 f4 ff ff       	jmp    80105a10 <alltraps>

8010656f <vector170>:
.globl vector170
vector170:
  pushl $0
8010656f:	6a 00                	push   $0x0
  pushl $170
80106571:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
80106576:	e9 95 f4 ff ff       	jmp    80105a10 <alltraps>

8010657b <vector171>:
.globl vector171
vector171:
  pushl $0
8010657b:	6a 00                	push   $0x0
  pushl $171
8010657d:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80106582:	e9 89 f4 ff ff       	jmp    80105a10 <alltraps>

80106587 <vector172>:
.globl vector172
vector172:
  pushl $0
80106587:	6a 00                	push   $0x0
  pushl $172
80106589:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
8010658e:	e9 7d f4 ff ff       	jmp    80105a10 <alltraps>

80106593 <vector173>:
.globl vector173
vector173:
  pushl $0
80106593:	6a 00                	push   $0x0
  pushl $173
80106595:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
8010659a:	e9 71 f4 ff ff       	jmp    80105a10 <alltraps>

8010659f <vector174>:
.globl vector174
vector174:
  pushl $0
8010659f:	6a 00                	push   $0x0
  pushl $174
801065a1:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
801065a6:	e9 65 f4 ff ff       	jmp    80105a10 <alltraps>

801065ab <vector175>:
.globl vector175
vector175:
  pushl $0
801065ab:	6a 00                	push   $0x0
  pushl $175
801065ad:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
801065b2:	e9 59 f4 ff ff       	jmp    80105a10 <alltraps>

801065b7 <vector176>:
.globl vector176
vector176:
  pushl $0
801065b7:	6a 00                	push   $0x0
  pushl $176
801065b9:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
801065be:	e9 4d f4 ff ff       	jmp    80105a10 <alltraps>

801065c3 <vector177>:
.globl vector177
vector177:
  pushl $0
801065c3:	6a 00                	push   $0x0
  pushl $177
801065c5:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
801065ca:	e9 41 f4 ff ff       	jmp    80105a10 <alltraps>

801065cf <vector178>:
.globl vector178
vector178:
  pushl $0
801065cf:	6a 00                	push   $0x0
  pushl $178
801065d1:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
801065d6:	e9 35 f4 ff ff       	jmp    80105a10 <alltraps>

801065db <vector179>:
.globl vector179
vector179:
  pushl $0
801065db:	6a 00                	push   $0x0
  pushl $179
801065dd:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
801065e2:	e9 29 f4 ff ff       	jmp    80105a10 <alltraps>

801065e7 <vector180>:
.globl vector180
vector180:
  pushl $0
801065e7:	6a 00                	push   $0x0
  pushl $180
801065e9:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
801065ee:	e9 1d f4 ff ff       	jmp    80105a10 <alltraps>

801065f3 <vector181>:
.globl vector181
vector181:
  pushl $0
801065f3:	6a 00                	push   $0x0
  pushl $181
801065f5:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
801065fa:	e9 11 f4 ff ff       	jmp    80105a10 <alltraps>

801065ff <vector182>:
.globl vector182
vector182:
  pushl $0
801065ff:	6a 00                	push   $0x0
  pushl $182
80106601:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
80106606:	e9 05 f4 ff ff       	jmp    80105a10 <alltraps>

8010660b <vector183>:
.globl vector183
vector183:
  pushl $0
8010660b:	6a 00                	push   $0x0
  pushl $183
8010660d:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80106612:	e9 f9 f3 ff ff       	jmp    80105a10 <alltraps>

80106617 <vector184>:
.globl vector184
vector184:
  pushl $0
80106617:	6a 00                	push   $0x0
  pushl $184
80106619:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
8010661e:	e9 ed f3 ff ff       	jmp    80105a10 <alltraps>

80106623 <vector185>:
.globl vector185
vector185:
  pushl $0
80106623:	6a 00                	push   $0x0
  pushl $185
80106625:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
8010662a:	e9 e1 f3 ff ff       	jmp    80105a10 <alltraps>

8010662f <vector186>:
.globl vector186
vector186:
  pushl $0
8010662f:	6a 00                	push   $0x0
  pushl $186
80106631:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106636:	e9 d5 f3 ff ff       	jmp    80105a10 <alltraps>

8010663b <vector187>:
.globl vector187
vector187:
  pushl $0
8010663b:	6a 00                	push   $0x0
  pushl $187
8010663d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106642:	e9 c9 f3 ff ff       	jmp    80105a10 <alltraps>

80106647 <vector188>:
.globl vector188
vector188:
  pushl $0
80106647:	6a 00                	push   $0x0
  pushl $188
80106649:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010664e:	e9 bd f3 ff ff       	jmp    80105a10 <alltraps>

80106653 <vector189>:
.globl vector189
vector189:
  pushl $0
80106653:	6a 00                	push   $0x0
  pushl $189
80106655:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
8010665a:	e9 b1 f3 ff ff       	jmp    80105a10 <alltraps>

8010665f <vector190>:
.globl vector190
vector190:
  pushl $0
8010665f:	6a 00                	push   $0x0
  pushl $190
80106661:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
80106666:	e9 a5 f3 ff ff       	jmp    80105a10 <alltraps>

8010666b <vector191>:
.globl vector191
vector191:
  pushl $0
8010666b:	6a 00                	push   $0x0
  pushl $191
8010666d:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80106672:	e9 99 f3 ff ff       	jmp    80105a10 <alltraps>

80106677 <vector192>:
.globl vector192
vector192:
  pushl $0
80106677:	6a 00                	push   $0x0
  pushl $192
80106679:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
8010667e:	e9 8d f3 ff ff       	jmp    80105a10 <alltraps>

80106683 <vector193>:
.globl vector193
vector193:
  pushl $0
80106683:	6a 00                	push   $0x0
  pushl $193
80106685:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
8010668a:	e9 81 f3 ff ff       	jmp    80105a10 <alltraps>

8010668f <vector194>:
.globl vector194
vector194:
  pushl $0
8010668f:	6a 00                	push   $0x0
  pushl $194
80106691:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80106696:	e9 75 f3 ff ff       	jmp    80105a10 <alltraps>

8010669b <vector195>:
.globl vector195
vector195:
  pushl $0
8010669b:	6a 00                	push   $0x0
  pushl $195
8010669d:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
801066a2:	e9 69 f3 ff ff       	jmp    80105a10 <alltraps>

801066a7 <vector196>:
.globl vector196
vector196:
  pushl $0
801066a7:	6a 00                	push   $0x0
  pushl $196
801066a9:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
801066ae:	e9 5d f3 ff ff       	jmp    80105a10 <alltraps>

801066b3 <vector197>:
.globl vector197
vector197:
  pushl $0
801066b3:	6a 00                	push   $0x0
  pushl $197
801066b5:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
801066ba:	e9 51 f3 ff ff       	jmp    80105a10 <alltraps>

801066bf <vector198>:
.globl vector198
vector198:
  pushl $0
801066bf:	6a 00                	push   $0x0
  pushl $198
801066c1:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
801066c6:	e9 45 f3 ff ff       	jmp    80105a10 <alltraps>

801066cb <vector199>:
.globl vector199
vector199:
  pushl $0
801066cb:	6a 00                	push   $0x0
  pushl $199
801066cd:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
801066d2:	e9 39 f3 ff ff       	jmp    80105a10 <alltraps>

801066d7 <vector200>:
.globl vector200
vector200:
  pushl $0
801066d7:	6a 00                	push   $0x0
  pushl $200
801066d9:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
801066de:	e9 2d f3 ff ff       	jmp    80105a10 <alltraps>

801066e3 <vector201>:
.globl vector201
vector201:
  pushl $0
801066e3:	6a 00                	push   $0x0
  pushl $201
801066e5:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
801066ea:	e9 21 f3 ff ff       	jmp    80105a10 <alltraps>

801066ef <vector202>:
.globl vector202
vector202:
  pushl $0
801066ef:	6a 00                	push   $0x0
  pushl $202
801066f1:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
801066f6:	e9 15 f3 ff ff       	jmp    80105a10 <alltraps>

801066fb <vector203>:
.globl vector203
vector203:
  pushl $0
801066fb:	6a 00                	push   $0x0
  pushl $203
801066fd:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80106702:	e9 09 f3 ff ff       	jmp    80105a10 <alltraps>

80106707 <vector204>:
.globl vector204
vector204:
  pushl $0
80106707:	6a 00                	push   $0x0
  pushl $204
80106709:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
8010670e:	e9 fd f2 ff ff       	jmp    80105a10 <alltraps>

80106713 <vector205>:
.globl vector205
vector205:
  pushl $0
80106713:	6a 00                	push   $0x0
  pushl $205
80106715:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
8010671a:	e9 f1 f2 ff ff       	jmp    80105a10 <alltraps>

8010671f <vector206>:
.globl vector206
vector206:
  pushl $0
8010671f:	6a 00                	push   $0x0
  pushl $206
80106721:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80106726:	e9 e5 f2 ff ff       	jmp    80105a10 <alltraps>

8010672b <vector207>:
.globl vector207
vector207:
  pushl $0
8010672b:	6a 00                	push   $0x0
  pushl $207
8010672d:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106732:	e9 d9 f2 ff ff       	jmp    80105a10 <alltraps>

80106737 <vector208>:
.globl vector208
vector208:
  pushl $0
80106737:	6a 00                	push   $0x0
  pushl $208
80106739:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
8010673e:	e9 cd f2 ff ff       	jmp    80105a10 <alltraps>

80106743 <vector209>:
.globl vector209
vector209:
  pushl $0
80106743:	6a 00                	push   $0x0
  pushl $209
80106745:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
8010674a:	e9 c1 f2 ff ff       	jmp    80105a10 <alltraps>

8010674f <vector210>:
.globl vector210
vector210:
  pushl $0
8010674f:	6a 00                	push   $0x0
  pushl $210
80106751:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
80106756:	e9 b5 f2 ff ff       	jmp    80105a10 <alltraps>

8010675b <vector211>:
.globl vector211
vector211:
  pushl $0
8010675b:	6a 00                	push   $0x0
  pushl $211
8010675d:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
80106762:	e9 a9 f2 ff ff       	jmp    80105a10 <alltraps>

80106767 <vector212>:
.globl vector212
vector212:
  pushl $0
80106767:	6a 00                	push   $0x0
  pushl $212
80106769:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
8010676e:	e9 9d f2 ff ff       	jmp    80105a10 <alltraps>

80106773 <vector213>:
.globl vector213
vector213:
  pushl $0
80106773:	6a 00                	push   $0x0
  pushl $213
80106775:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
8010677a:	e9 91 f2 ff ff       	jmp    80105a10 <alltraps>

8010677f <vector214>:
.globl vector214
vector214:
  pushl $0
8010677f:	6a 00                	push   $0x0
  pushl $214
80106781:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80106786:	e9 85 f2 ff ff       	jmp    80105a10 <alltraps>

8010678b <vector215>:
.globl vector215
vector215:
  pushl $0
8010678b:	6a 00                	push   $0x0
  pushl $215
8010678d:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80106792:	e9 79 f2 ff ff       	jmp    80105a10 <alltraps>

80106797 <vector216>:
.globl vector216
vector216:
  pushl $0
80106797:	6a 00                	push   $0x0
  pushl $216
80106799:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
8010679e:	e9 6d f2 ff ff       	jmp    80105a10 <alltraps>

801067a3 <vector217>:
.globl vector217
vector217:
  pushl $0
801067a3:	6a 00                	push   $0x0
  pushl $217
801067a5:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
801067aa:	e9 61 f2 ff ff       	jmp    80105a10 <alltraps>

801067af <vector218>:
.globl vector218
vector218:
  pushl $0
801067af:	6a 00                	push   $0x0
  pushl $218
801067b1:	68 da 00 00 00       	push   $0xda
  jmp alltraps
801067b6:	e9 55 f2 ff ff       	jmp    80105a10 <alltraps>

801067bb <vector219>:
.globl vector219
vector219:
  pushl $0
801067bb:	6a 00                	push   $0x0
  pushl $219
801067bd:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
801067c2:	e9 49 f2 ff ff       	jmp    80105a10 <alltraps>

801067c7 <vector220>:
.globl vector220
vector220:
  pushl $0
801067c7:	6a 00                	push   $0x0
  pushl $220
801067c9:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
801067ce:	e9 3d f2 ff ff       	jmp    80105a10 <alltraps>

801067d3 <vector221>:
.globl vector221
vector221:
  pushl $0
801067d3:	6a 00                	push   $0x0
  pushl $221
801067d5:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
801067da:	e9 31 f2 ff ff       	jmp    80105a10 <alltraps>

801067df <vector222>:
.globl vector222
vector222:
  pushl $0
801067df:	6a 00                	push   $0x0
  pushl $222
801067e1:	68 de 00 00 00       	push   $0xde
  jmp alltraps
801067e6:	e9 25 f2 ff ff       	jmp    80105a10 <alltraps>

801067eb <vector223>:
.globl vector223
vector223:
  pushl $0
801067eb:	6a 00                	push   $0x0
  pushl $223
801067ed:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
801067f2:	e9 19 f2 ff ff       	jmp    80105a10 <alltraps>

801067f7 <vector224>:
.globl vector224
vector224:
  pushl $0
801067f7:	6a 00                	push   $0x0
  pushl $224
801067f9:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
801067fe:	e9 0d f2 ff ff       	jmp    80105a10 <alltraps>

80106803 <vector225>:
.globl vector225
vector225:
  pushl $0
80106803:	6a 00                	push   $0x0
  pushl $225
80106805:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
8010680a:	e9 01 f2 ff ff       	jmp    80105a10 <alltraps>

8010680f <vector226>:
.globl vector226
vector226:
  pushl $0
8010680f:	6a 00                	push   $0x0
  pushl $226
80106811:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106816:	e9 f5 f1 ff ff       	jmp    80105a10 <alltraps>

8010681b <vector227>:
.globl vector227
vector227:
  pushl $0
8010681b:	6a 00                	push   $0x0
  pushl $227
8010681d:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106822:	e9 e9 f1 ff ff       	jmp    80105a10 <alltraps>

80106827 <vector228>:
.globl vector228
vector228:
  pushl $0
80106827:	6a 00                	push   $0x0
  pushl $228
80106829:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
8010682e:	e9 dd f1 ff ff       	jmp    80105a10 <alltraps>

80106833 <vector229>:
.globl vector229
vector229:
  pushl $0
80106833:	6a 00                	push   $0x0
  pushl $229
80106835:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
8010683a:	e9 d1 f1 ff ff       	jmp    80105a10 <alltraps>

8010683f <vector230>:
.globl vector230
vector230:
  pushl $0
8010683f:	6a 00                	push   $0x0
  pushl $230
80106841:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106846:	e9 c5 f1 ff ff       	jmp    80105a10 <alltraps>

8010684b <vector231>:
.globl vector231
vector231:
  pushl $0
8010684b:	6a 00                	push   $0x0
  pushl $231
8010684d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80106852:	e9 b9 f1 ff ff       	jmp    80105a10 <alltraps>

80106857 <vector232>:
.globl vector232
vector232:
  pushl $0
80106857:	6a 00                	push   $0x0
  pushl $232
80106859:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
8010685e:	e9 ad f1 ff ff       	jmp    80105a10 <alltraps>

80106863 <vector233>:
.globl vector233
vector233:
  pushl $0
80106863:	6a 00                	push   $0x0
  pushl $233
80106865:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
8010686a:	e9 a1 f1 ff ff       	jmp    80105a10 <alltraps>

8010686f <vector234>:
.globl vector234
vector234:
  pushl $0
8010686f:	6a 00                	push   $0x0
  pushl $234
80106871:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106876:	e9 95 f1 ff ff       	jmp    80105a10 <alltraps>

8010687b <vector235>:
.globl vector235
vector235:
  pushl $0
8010687b:	6a 00                	push   $0x0
  pushl $235
8010687d:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80106882:	e9 89 f1 ff ff       	jmp    80105a10 <alltraps>

80106887 <vector236>:
.globl vector236
vector236:
  pushl $0
80106887:	6a 00                	push   $0x0
  pushl $236
80106889:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
8010688e:	e9 7d f1 ff ff       	jmp    80105a10 <alltraps>

80106893 <vector237>:
.globl vector237
vector237:
  pushl $0
80106893:	6a 00                	push   $0x0
  pushl $237
80106895:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
8010689a:	e9 71 f1 ff ff       	jmp    80105a10 <alltraps>

8010689f <vector238>:
.globl vector238
vector238:
  pushl $0
8010689f:	6a 00                	push   $0x0
  pushl $238
801068a1:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
801068a6:	e9 65 f1 ff ff       	jmp    80105a10 <alltraps>

801068ab <vector239>:
.globl vector239
vector239:
  pushl $0
801068ab:	6a 00                	push   $0x0
  pushl $239
801068ad:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
801068b2:	e9 59 f1 ff ff       	jmp    80105a10 <alltraps>

801068b7 <vector240>:
.globl vector240
vector240:
  pushl $0
801068b7:	6a 00                	push   $0x0
  pushl $240
801068b9:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
801068be:	e9 4d f1 ff ff       	jmp    80105a10 <alltraps>

801068c3 <vector241>:
.globl vector241
vector241:
  pushl $0
801068c3:	6a 00                	push   $0x0
  pushl $241
801068c5:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
801068ca:	e9 41 f1 ff ff       	jmp    80105a10 <alltraps>

801068cf <vector242>:
.globl vector242
vector242:
  pushl $0
801068cf:	6a 00                	push   $0x0
  pushl $242
801068d1:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
801068d6:	e9 35 f1 ff ff       	jmp    80105a10 <alltraps>

801068db <vector243>:
.globl vector243
vector243:
  pushl $0
801068db:	6a 00                	push   $0x0
  pushl $243
801068dd:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
801068e2:	e9 29 f1 ff ff       	jmp    80105a10 <alltraps>

801068e7 <vector244>:
.globl vector244
vector244:
  pushl $0
801068e7:	6a 00                	push   $0x0
  pushl $244
801068e9:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
801068ee:	e9 1d f1 ff ff       	jmp    80105a10 <alltraps>

801068f3 <vector245>:
.globl vector245
vector245:
  pushl $0
801068f3:	6a 00                	push   $0x0
  pushl $245
801068f5:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
801068fa:	e9 11 f1 ff ff       	jmp    80105a10 <alltraps>

801068ff <vector246>:
.globl vector246
vector246:
  pushl $0
801068ff:	6a 00                	push   $0x0
  pushl $246
80106901:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106906:	e9 05 f1 ff ff       	jmp    80105a10 <alltraps>

8010690b <vector247>:
.globl vector247
vector247:
  pushl $0
8010690b:	6a 00                	push   $0x0
  pushl $247
8010690d:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106912:	e9 f9 f0 ff ff       	jmp    80105a10 <alltraps>

80106917 <vector248>:
.globl vector248
vector248:
  pushl $0
80106917:	6a 00                	push   $0x0
  pushl $248
80106919:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
8010691e:	e9 ed f0 ff ff       	jmp    80105a10 <alltraps>

80106923 <vector249>:
.globl vector249
vector249:
  pushl $0
80106923:	6a 00                	push   $0x0
  pushl $249
80106925:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
8010692a:	e9 e1 f0 ff ff       	jmp    80105a10 <alltraps>

8010692f <vector250>:
.globl vector250
vector250:
  pushl $0
8010692f:	6a 00                	push   $0x0
  pushl $250
80106931:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106936:	e9 d5 f0 ff ff       	jmp    80105a10 <alltraps>

8010693b <vector251>:
.globl vector251
vector251:
  pushl $0
8010693b:	6a 00                	push   $0x0
  pushl $251
8010693d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106942:	e9 c9 f0 ff ff       	jmp    80105a10 <alltraps>

80106947 <vector252>:
.globl vector252
vector252:
  pushl $0
80106947:	6a 00                	push   $0x0
  pushl $252
80106949:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
8010694e:	e9 bd f0 ff ff       	jmp    80105a10 <alltraps>

80106953 <vector253>:
.globl vector253
vector253:
  pushl $0
80106953:	6a 00                	push   $0x0
  pushl $253
80106955:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
8010695a:	e9 b1 f0 ff ff       	jmp    80105a10 <alltraps>

8010695f <vector254>:
.globl vector254
vector254:
  pushl $0
8010695f:	6a 00                	push   $0x0
  pushl $254
80106961:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106966:	e9 a5 f0 ff ff       	jmp    80105a10 <alltraps>

8010696b <vector255>:
.globl vector255
vector255:
  pushl $0
8010696b:	6a 00                	push   $0x0
  pushl $255
8010696d:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106972:	e9 99 f0 ff ff       	jmp    80105a10 <alltraps>
80106977:	66 90                	xchg   %ax,%ax
80106979:	66 90                	xchg   %ax,%ax
8010697b:	66 90                	xchg   %ax,%ax
8010697d:	66 90                	xchg   %ax,%ax
8010697f:	90                   	nop

80106980 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106980:	55                   	push   %ebp
80106981:	89 e5                	mov    %esp,%ebp
80106983:	57                   	push   %edi
80106984:	56                   	push   %esi
80106985:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106986:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
8010698c:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106992:	83 ec 1c             	sub    $0x1c,%esp
  for(; a  < oldsz; a += PGSIZE){
80106995:	39 d3                	cmp    %edx,%ebx
80106997:	73 56                	jae    801069ef <deallocuvm.part.0+0x6f>
80106999:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010699c:	89 c6                	mov    %eax,%esi
8010699e:	89 d7                	mov    %edx,%edi
801069a0:	eb 12                	jmp    801069b4 <deallocuvm.part.0+0x34>
801069a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
801069a8:	83 c2 01             	add    $0x1,%edx
801069ab:	89 d3                	mov    %edx,%ebx
801069ad:	c1 e3 16             	shl    $0x16,%ebx
  for(; a  < oldsz; a += PGSIZE){
801069b0:	39 fb                	cmp    %edi,%ebx
801069b2:	73 38                	jae    801069ec <deallocuvm.part.0+0x6c>
  pde = &pgdir[PDX(va)];
801069b4:	89 da                	mov    %ebx,%edx
801069b6:	c1 ea 16             	shr    $0x16,%edx
  if(*pde & PTE_P){
801069b9:	8b 04 96             	mov    (%esi,%edx,4),%eax
801069bc:	a8 01                	test   $0x1,%al
801069be:	74 e8                	je     801069a8 <deallocuvm.part.0+0x28>
  return &pgtab[PTX(va)];
801069c0:	89 d9                	mov    %ebx,%ecx
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801069c2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  return &pgtab[PTX(va)];
801069c7:	c1 e9 0a             	shr    $0xa,%ecx
801069ca:	81 e1 fc 0f 00 00    	and    $0xffc,%ecx
801069d0:	8d 84 08 00 00 00 80 	lea    -0x80000000(%eax,%ecx,1),%eax
    if(!pte)
801069d7:	85 c0                	test   %eax,%eax
801069d9:	74 cd                	je     801069a8 <deallocuvm.part.0+0x28>
    else if((*pte & PTE_P) != 0){
801069db:	8b 10                	mov    (%eax),%edx
801069dd:	f6 c2 01             	test   $0x1,%dl
801069e0:	75 1e                	jne    80106a00 <deallocuvm.part.0+0x80>
  for(; a  < oldsz; a += PGSIZE){
801069e2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801069e8:	39 fb                	cmp    %edi,%ebx
801069ea:	72 c8                	jb     801069b4 <deallocuvm.part.0+0x34>
801069ec:	8b 4d e0             	mov    -0x20(%ebp),%ecx
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
801069ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
801069f2:	89 c8                	mov    %ecx,%eax
801069f4:	5b                   	pop    %ebx
801069f5:	5e                   	pop    %esi
801069f6:	5f                   	pop    %edi
801069f7:	5d                   	pop    %ebp
801069f8:	c3                   	ret
801069f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(pa == 0)
80106a00:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106a06:	74 26                	je     80106a2e <deallocuvm.part.0+0xae>
      kfree(v);
80106a08:	83 ec 0c             	sub    $0xc,%esp
      char *v = P2V(pa);
80106a0b:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106a11:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(; a  < oldsz; a += PGSIZE){
80106a14:	81 c3 00 10 00 00    	add    $0x1000,%ebx
      kfree(v);
80106a1a:	52                   	push   %edx
80106a1b:	e8 00 bb ff ff       	call   80102520 <kfree>
      *pte = 0;
80106a20:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  for(; a  < oldsz; a += PGSIZE){
80106a23:	83 c4 10             	add    $0x10,%esp
      *pte = 0;
80106a26:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80106a2c:	eb 82                	jmp    801069b0 <deallocuvm.part.0+0x30>
        panic("kfree");
80106a2e:	83 ec 0c             	sub    $0xc,%esp
80106a31:	68 2c 76 10 80       	push   $0x8010762c
80106a36:	e8 45 99 ff ff       	call   80100380 <panic>
80106a3b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80106a40 <mappages>:
{
80106a40:	55                   	push   %ebp
80106a41:	89 e5                	mov    %esp,%ebp
80106a43:	57                   	push   %edi
80106a44:	56                   	push   %esi
80106a45:	53                   	push   %ebx
  a = (char*)PGROUNDDOWN((uint)va);
80106a46:	89 d3                	mov    %edx,%ebx
80106a48:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
{
80106a4e:	83 ec 1c             	sub    $0x1c,%esp
80106a51:	89 45 e0             	mov    %eax,-0x20(%ebp)
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106a54:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106a58:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106a5d:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106a60:	8b 45 08             	mov    0x8(%ebp),%eax
80106a63:	29 d8                	sub    %ebx,%eax
80106a65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106a68:	eb 3f                	jmp    80106aa9 <mappages+0x69>
80106a6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return &pgtab[PTX(va)];
80106a70:	89 da                	mov    %ebx,%edx
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106a72:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  return &pgtab[PTX(va)];
80106a77:	c1 ea 0a             	shr    $0xa,%edx
80106a7a:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106a80:	8d 84 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%eax
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106a87:	85 c0                	test   %eax,%eax
80106a89:	74 75                	je     80106b00 <mappages+0xc0>
    if(*pte & PTE_P)
80106a8b:	f6 00 01             	testb  $0x1,(%eax)
80106a8e:	0f 85 86 00 00 00    	jne    80106b1a <mappages+0xda>
    *pte = pa | perm | PTE_P;
80106a94:	0b 75 0c             	or     0xc(%ebp),%esi
80106a97:	83 ce 01             	or     $0x1,%esi
80106a9a:	89 30                	mov    %esi,(%eax)
    if(a == last)
80106a9c:	8b 45 dc             	mov    -0x24(%ebp),%eax
80106a9f:	39 c3                	cmp    %eax,%ebx
80106aa1:	74 6d                	je     80106b10 <mappages+0xd0>
    a += PGSIZE;
80106aa3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  for(;;){
80106aa9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  pde = &pgdir[PDX(va)];
80106aac:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80106aaf:	8d 34 03             	lea    (%ebx,%eax,1),%esi
80106ab2:	89 d8                	mov    %ebx,%eax
80106ab4:	c1 e8 16             	shr    $0x16,%eax
80106ab7:	8d 3c 81             	lea    (%ecx,%eax,4),%edi
  if(*pde & PTE_P){
80106aba:	8b 07                	mov    (%edi),%eax
80106abc:	a8 01                	test   $0x1,%al
80106abe:	75 b0                	jne    80106a70 <mappages+0x30>
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106ac0:	e8 1b bc ff ff       	call   801026e0 <kalloc>
80106ac5:	85 c0                	test   %eax,%eax
80106ac7:	74 37                	je     80106b00 <mappages+0xc0>
    memset(pgtab, 0, PGSIZE);
80106ac9:	83 ec 04             	sub    $0x4,%esp
80106acc:	68 00 10 00 00       	push   $0x1000
80106ad1:	6a 00                	push   $0x0
80106ad3:	50                   	push   %eax
80106ad4:	89 45 d8             	mov    %eax,-0x28(%ebp)
80106ad7:	e8 14 ed ff ff       	call   801057f0 <memset>
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106adc:	8b 55 d8             	mov    -0x28(%ebp),%edx
  return &pgtab[PTX(va)];
80106adf:	83 c4 10             	add    $0x10,%esp
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106ae2:	8d 82 00 00 00 80    	lea    -0x80000000(%edx),%eax
80106ae8:	83 c8 07             	or     $0x7,%eax
80106aeb:	89 07                	mov    %eax,(%edi)
  return &pgtab[PTX(va)];
80106aed:	89 d8                	mov    %ebx,%eax
80106aef:	c1 e8 0a             	shr    $0xa,%eax
80106af2:	25 fc 0f 00 00       	and    $0xffc,%eax
80106af7:	01 d0                	add    %edx,%eax
80106af9:	eb 90                	jmp    80106a8b <mappages+0x4b>
80106afb:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
}
80106b00:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106b03:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106b08:	5b                   	pop    %ebx
80106b09:	5e                   	pop    %esi
80106b0a:	5f                   	pop    %edi
80106b0b:	5d                   	pop    %ebp
80106b0c:	c3                   	ret
80106b0d:	8d 76 00             	lea    0x0(%esi),%esi
80106b10:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106b13:	31 c0                	xor    %eax,%eax
}
80106b15:	5b                   	pop    %ebx
80106b16:	5e                   	pop    %esi
80106b17:	5f                   	pop    %edi
80106b18:	5d                   	pop    %ebp
80106b19:	c3                   	ret
      panic("remap");
80106b1a:	83 ec 0c             	sub    $0xc,%esp
80106b1d:	68 3e 78 10 80       	push   $0x8010783e
80106b22:	e8 59 98 ff ff       	call   80100380 <panic>
80106b27:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106b2e:	00 
80106b2f:	90                   	nop

80106b30 <seginit>:
{
80106b30:	55                   	push   %ebp
80106b31:	89 e5                	mov    %esp,%ebp
80106b33:	83 ec 18             	sub    $0x18,%esp
  c = &cpus[cpuid()];
80106b36:	e8 25 cc ff ff       	call   80103760 <cpuid>
  pd[0] = size - 1;
80106b3b:	ba 2f 00 00 00       	mov    $0x2f,%edx
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106b40:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106b46:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
80106b4a:	c7 80 18 6b 11 80 ff 	movl   $0xffff,-0x7fee94e8(%eax)
80106b51:	ff 00 00 
80106b54:	c7 80 1c 6b 11 80 00 	movl   $0xcf9a00,-0x7fee94e4(%eax)
80106b5b:	9a cf 00 
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b5e:	c7 80 20 6b 11 80 ff 	movl   $0xffff,-0x7fee94e0(%eax)
80106b65:	ff 00 00 
80106b68:	c7 80 24 6b 11 80 00 	movl   $0xcf9200,-0x7fee94dc(%eax)
80106b6f:	92 cf 00 
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b72:	c7 80 28 6b 11 80 ff 	movl   $0xffff,-0x7fee94d8(%eax)
80106b79:	ff 00 00 
80106b7c:	c7 80 2c 6b 11 80 00 	movl   $0xcffa00,-0x7fee94d4(%eax)
80106b83:	fa cf 00 
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b86:	c7 80 30 6b 11 80 ff 	movl   $0xffff,-0x7fee94d0(%eax)
80106b8d:	ff 00 00 
80106b90:	c7 80 34 6b 11 80 00 	movl   $0xcff200,-0x7fee94cc(%eax)
80106b97:	f2 cf 00 
  lgdt(c->gdt, sizeof(c->gdt));
80106b9a:	05 10 6b 11 80       	add    $0x80116b10,%eax
  pd[1] = (uint)p;
80106b9f:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106ba3:	c1 e8 10             	shr    $0x10,%eax
80106ba6:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
  asm volatile("lgdt (%0)" : : "r" (pd));
80106baa:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106bad:	0f 01 10             	lgdtl  (%eax)
}
80106bb0:	c9                   	leave
80106bb1:	c3                   	ret
80106bb2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106bb9:	00 
80106bba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106bc0 <switchkvm>:
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106bc0:	a1 c4 9c 11 80       	mov    0x80119cc4,%eax
80106bc5:	05 00 00 00 80       	add    $0x80000000,%eax
  return val;
}

static inline void lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106bca:	0f 22 d8             	mov    %eax,%cr3
}
80106bcd:	c3                   	ret
80106bce:	66 90                	xchg   %ax,%ax

80106bd0 <switchuvm>:
{
80106bd0:	55                   	push   %ebp
80106bd1:	89 e5                	mov    %esp,%ebp
80106bd3:	57                   	push   %edi
80106bd4:	56                   	push   %esi
80106bd5:	53                   	push   %ebx
80106bd6:	83 ec 1c             	sub    $0x1c,%esp
80106bd9:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
80106bdc:	85 f6                	test   %esi,%esi
80106bde:	0f 84 cb 00 00 00    	je     80106caf <switchuvm+0xdf>
  if(p->kstack == 0)
80106be4:	8b 46 14             	mov    0x14(%esi),%eax
80106be7:	85 c0                	test   %eax,%eax
80106be9:	0f 84 da 00 00 00    	je     80106cc9 <switchuvm+0xf9>
  if(p->pgdir == 0)
80106bef:	8b 46 10             	mov    0x10(%esi),%eax
80106bf2:	85 c0                	test   %eax,%eax
80106bf4:	0f 84 c2 00 00 00    	je     80106cbc <switchuvm+0xec>
  pushcli();
80106bfa:	e8 a1 e9 ff ff       	call   801055a0 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106bff:	e8 fc ca ff ff       	call   80103700 <mycpu>
80106c04:	89 c3                	mov    %eax,%ebx
80106c06:	e8 f5 ca ff ff       	call   80103700 <mycpu>
80106c0b:	89 c7                	mov    %eax,%edi
80106c0d:	e8 ee ca ff ff       	call   80103700 <mycpu>
80106c12:	83 c7 08             	add    $0x8,%edi
80106c15:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106c18:	e8 e3 ca ff ff       	call   80103700 <mycpu>
80106c1d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106c20:	ba 67 00 00 00       	mov    $0x67,%edx
80106c25:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106c2c:	83 c0 08             	add    $0x8,%eax
80106c2f:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106c36:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
80106c3b:	83 c1 08             	add    $0x8,%ecx
80106c3e:	c1 e8 18             	shr    $0x18,%eax
80106c41:	c1 e9 10             	shr    $0x10,%ecx
80106c44:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106c4a:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
80106c50:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106c55:	66 89 8b 9d 00 00 00 	mov    %cx,0x9d(%ebx)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106c5c:	bb 10 00 00 00       	mov    $0x10,%ebx
  mycpu()->gdt[SEG_TSS].s = 0;
80106c61:	e8 9a ca ff ff       	call   80103700 <mycpu>
80106c66:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
80106c6d:	e8 8e ca ff ff       	call   80103700 <mycpu>
80106c72:	66 89 58 10          	mov    %bx,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106c76:	8b 5e 14             	mov    0x14(%esi),%ebx
80106c79:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c7f:	e8 7c ca ff ff       	call   80103700 <mycpu>
80106c84:	89 58 0c             	mov    %ebx,0xc(%eax)
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106c87:	e8 74 ca ff ff       	call   80103700 <mycpu>
80106c8c:	66 89 78 6e          	mov    %di,0x6e(%eax)
  asm volatile("ltr %0" : : "r" (sel));
80106c90:	b8 28 00 00 00       	mov    $0x28,%eax
80106c95:	0f 00 d8             	ltr    %eax
  lcr3(V2P(p->pgdir));  // switch to process's address space
80106c98:	8b 46 10             	mov    0x10(%esi),%eax
80106c9b:	05 00 00 00 80       	add    $0x80000000,%eax
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106ca0:	0f 22 d8             	mov    %eax,%cr3
}
80106ca3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ca6:	5b                   	pop    %ebx
80106ca7:	5e                   	pop    %esi
80106ca8:	5f                   	pop    %edi
80106ca9:	5d                   	pop    %ebp
  popcli();
80106caa:	e9 41 e9 ff ff       	jmp    801055f0 <popcli>
    panic("switchuvm: no process");
80106caf:	83 ec 0c             	sub    $0xc,%esp
80106cb2:	68 44 78 10 80       	push   $0x80107844
80106cb7:	e8 c4 96 ff ff       	call   80100380 <panic>
    panic("switchuvm: no pgdir");
80106cbc:	83 ec 0c             	sub    $0xc,%esp
80106cbf:	68 6f 78 10 80       	push   $0x8010786f
80106cc4:	e8 b7 96 ff ff       	call   80100380 <panic>
    panic("switchuvm: no kstack");
80106cc9:	83 ec 0c             	sub    $0xc,%esp
80106ccc:	68 5a 78 10 80       	push   $0x8010785a
80106cd1:	e8 aa 96 ff ff       	call   80100380 <panic>
80106cd6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106cdd:	00 
80106cde:	66 90                	xchg   %ax,%ax

80106ce0 <inituvm>:
{
80106ce0:	55                   	push   %ebp
80106ce1:	89 e5                	mov    %esp,%ebp
80106ce3:	57                   	push   %edi
80106ce4:	56                   	push   %esi
80106ce5:	53                   	push   %ebx
80106ce6:	83 ec 1c             	sub    $0x1c,%esp
80106ce9:	8b 45 08             	mov    0x8(%ebp),%eax
80106cec:	8b 75 10             	mov    0x10(%ebp),%esi
80106cef:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106cf2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(sz >= PGSIZE)
80106cf5:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106cfb:	77 49                	ja     80106d46 <inituvm+0x66>
  mem = kalloc();
80106cfd:	e8 de b9 ff ff       	call   801026e0 <kalloc>
  memset(mem, 0, PGSIZE);
80106d02:	83 ec 04             	sub    $0x4,%esp
80106d05:	68 00 10 00 00       	push   $0x1000
  mem = kalloc();
80106d0a:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106d0c:	6a 00                	push   $0x0
80106d0e:	50                   	push   %eax
80106d0f:	e8 dc ea ff ff       	call   801057f0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106d14:	58                   	pop    %eax
80106d15:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106d1b:	5a                   	pop    %edx
80106d1c:	6a 06                	push   $0x6
80106d1e:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106d23:	31 d2                	xor    %edx,%edx
80106d25:	50                   	push   %eax
80106d26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106d29:	e8 12 fd ff ff       	call   80106a40 <mappages>
  memmove(mem, init, sz);
80106d2e:	89 75 10             	mov    %esi,0x10(%ebp)
80106d31:	83 c4 10             	add    $0x10,%esp
80106d34:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106d37:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106d3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d3d:	5b                   	pop    %ebx
80106d3e:	5e                   	pop    %esi
80106d3f:	5f                   	pop    %edi
80106d40:	5d                   	pop    %ebp
  memmove(mem, init, sz);
80106d41:	e9 3a eb ff ff       	jmp    80105880 <memmove>
    panic("inituvm: more than a page");
80106d46:	83 ec 0c             	sub    $0xc,%esp
80106d49:	68 83 78 10 80       	push   $0x80107883
80106d4e:	e8 2d 96 ff ff       	call   80100380 <panic>
80106d53:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106d5a:	00 
80106d5b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi

80106d60 <loaduvm>:
{
80106d60:	55                   	push   %ebp
80106d61:	89 e5                	mov    %esp,%ebp
80106d63:	57                   	push   %edi
80106d64:	56                   	push   %esi
80106d65:	53                   	push   %ebx
80106d66:	83 ec 0c             	sub    $0xc,%esp
  if((uint) addr % PGSIZE != 0)
80106d69:	8b 75 0c             	mov    0xc(%ebp),%esi
{
80106d6c:	8b 7d 18             	mov    0x18(%ebp),%edi
  if((uint) addr % PGSIZE != 0)
80106d6f:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
80106d75:	0f 85 a2 00 00 00    	jne    80106e1d <loaduvm+0xbd>
  for(i = 0; i < sz; i += PGSIZE){
80106d7b:	85 ff                	test   %edi,%edi
80106d7d:	74 7d                	je     80106dfc <loaduvm+0x9c>
80106d7f:	90                   	nop
  pde = &pgdir[PDX(va)];
80106d80:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(*pde & PTE_P){
80106d83:	8b 55 08             	mov    0x8(%ebp),%edx
80106d86:	01 f0                	add    %esi,%eax
  pde = &pgdir[PDX(va)];
80106d88:	89 c1                	mov    %eax,%ecx
80106d8a:	c1 e9 16             	shr    $0x16,%ecx
  if(*pde & PTE_P){
80106d8d:	8b 0c 8a             	mov    (%edx,%ecx,4),%ecx
80106d90:	f6 c1 01             	test   $0x1,%cl
80106d93:	75 13                	jne    80106da8 <loaduvm+0x48>
      panic("loaduvm: address should exist");
80106d95:	83 ec 0c             	sub    $0xc,%esp
80106d98:	68 9d 78 10 80       	push   $0x8010789d
80106d9d:	e8 de 95 ff ff       	call   80100380 <panic>
80106da2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return &pgtab[PTX(va)];
80106da8:	c1 e8 0a             	shr    $0xa,%eax
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106dab:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
  return &pgtab[PTX(va)];
80106db1:	25 fc 0f 00 00       	and    $0xffc,%eax
80106db6:	8d 8c 01 00 00 00 80 	lea    -0x80000000(%ecx,%eax,1),%ecx
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106dbd:	85 c9                	test   %ecx,%ecx
80106dbf:	74 d4                	je     80106d95 <loaduvm+0x35>
    if(sz - i < PGSIZE)
80106dc1:	89 fb                	mov    %edi,%ebx
80106dc3:	b8 00 10 00 00       	mov    $0x1000,%eax
80106dc8:	29 f3                	sub    %esi,%ebx
80106dca:	39 c3                	cmp    %eax,%ebx
80106dcc:	0f 47 d8             	cmova  %eax,%ebx
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106dcf:	53                   	push   %ebx
80106dd0:	8b 45 14             	mov    0x14(%ebp),%eax
80106dd3:	01 f0                	add    %esi,%eax
80106dd5:	50                   	push   %eax
    pa = PTE_ADDR(*pte);
80106dd6:	8b 01                	mov    (%ecx),%eax
80106dd8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106ddd:	05 00 00 00 80       	add    $0x80000000,%eax
80106de2:	50                   	push   %eax
80106de3:	ff 75 10             	push   0x10(%ebp)
80106de6:	e8 25 ad ff ff       	call   80101b10 <readi>
80106deb:	83 c4 10             	add    $0x10,%esp
80106dee:	39 d8                	cmp    %ebx,%eax
80106df0:	75 1e                	jne    80106e10 <loaduvm+0xb0>
  for(i = 0; i < sz; i += PGSIZE){
80106df2:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106df8:	39 fe                	cmp    %edi,%esi
80106dfa:	72 84                	jb     80106d80 <loaduvm+0x20>
}
80106dfc:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
80106dff:	31 c0                	xor    %eax,%eax
}
80106e01:	5b                   	pop    %ebx
80106e02:	5e                   	pop    %esi
80106e03:	5f                   	pop    %edi
80106e04:	5d                   	pop    %ebp
80106e05:	c3                   	ret
80106e06:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106e0d:	00 
80106e0e:	66 90                	xchg   %ax,%ax
80106e10:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
80106e13:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80106e18:	5b                   	pop    %ebx
80106e19:	5e                   	pop    %esi
80106e1a:	5f                   	pop    %edi
80106e1b:	5d                   	pop    %ebp
80106e1c:	c3                   	ret
    panic("loaduvm: addr must be page aligned");
80106e1d:	83 ec 0c             	sub    $0xc,%esp
80106e20:	68 24 7b 10 80       	push   $0x80107b24
80106e25:	e8 56 95 ff ff       	call   80100380 <panic>
80106e2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106e30 <allocuvm>:
{
80106e30:	55                   	push   %ebp
80106e31:	89 e5                	mov    %esp,%ebp
80106e33:	57                   	push   %edi
80106e34:	56                   	push   %esi
80106e35:	53                   	push   %ebx
80106e36:	83 ec 1c             	sub    $0x1c,%esp
80106e39:	8b 75 10             	mov    0x10(%ebp),%esi
  if(newsz >= KERNBASE)
80106e3c:	85 f6                	test   %esi,%esi
80106e3e:	0f 88 98 00 00 00    	js     80106edc <allocuvm+0xac>
80106e44:	89 f2                	mov    %esi,%edx
  if(newsz < oldsz)
80106e46:	3b 75 0c             	cmp    0xc(%ebp),%esi
80106e49:	0f 82 a1 00 00 00    	jb     80106ef0 <allocuvm+0xc0>
  a = PGROUNDUP(oldsz);
80106e4f:	8b 45 0c             	mov    0xc(%ebp),%eax
80106e52:	05 ff 0f 00 00       	add    $0xfff,%eax
80106e57:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106e5c:	89 c7                	mov    %eax,%edi
  for(; a < newsz; a += PGSIZE){
80106e5e:	39 f0                	cmp    %esi,%eax
80106e60:	0f 83 8d 00 00 00    	jae    80106ef3 <allocuvm+0xc3>
80106e66:	89 75 e4             	mov    %esi,-0x1c(%ebp)
80106e69:	eb 44                	jmp    80106eaf <allocuvm+0x7f>
80106e6b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
    memset(mem, 0, PGSIZE);
80106e70:	83 ec 04             	sub    $0x4,%esp
80106e73:	68 00 10 00 00       	push   $0x1000
80106e78:	6a 00                	push   $0x0
80106e7a:	50                   	push   %eax
80106e7b:	e8 70 e9 ff ff       	call   801057f0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106e80:	58                   	pop    %eax
80106e81:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106e87:	5a                   	pop    %edx
80106e88:	6a 06                	push   $0x6
80106e8a:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106e8f:	89 fa                	mov    %edi,%edx
80106e91:	50                   	push   %eax
80106e92:	8b 45 08             	mov    0x8(%ebp),%eax
80106e95:	e8 a6 fb ff ff       	call   80106a40 <mappages>
80106e9a:	83 c4 10             	add    $0x10,%esp
80106e9d:	85 c0                	test   %eax,%eax
80106e9f:	78 5f                	js     80106f00 <allocuvm+0xd0>
  for(; a < newsz; a += PGSIZE){
80106ea1:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106ea7:	39 f7                	cmp    %esi,%edi
80106ea9:	0f 83 89 00 00 00    	jae    80106f38 <allocuvm+0x108>
    mem = kalloc();
80106eaf:	e8 2c b8 ff ff       	call   801026e0 <kalloc>
80106eb4:	89 c3                	mov    %eax,%ebx
    if(mem == 0){
80106eb6:	85 c0                	test   %eax,%eax
80106eb8:	75 b6                	jne    80106e70 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
80106eba:	83 ec 0c             	sub    $0xc,%esp
80106ebd:	68 bb 78 10 80       	push   $0x801078bb
80106ec2:	e8 e9 97 ff ff       	call   801006b0 <cprintf>
  if(newsz >= oldsz)
80106ec7:	83 c4 10             	add    $0x10,%esp
80106eca:	3b 75 0c             	cmp    0xc(%ebp),%esi
80106ecd:	74 0d                	je     80106edc <allocuvm+0xac>
80106ecf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106ed2:	8b 45 08             	mov    0x8(%ebp),%eax
80106ed5:	89 f2                	mov    %esi,%edx
80106ed7:	e8 a4 fa ff ff       	call   80106980 <deallocuvm.part.0>
    return 0;
80106edc:	31 d2                	xor    %edx,%edx
}
80106ede:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ee1:	89 d0                	mov    %edx,%eax
80106ee3:	5b                   	pop    %ebx
80106ee4:	5e                   	pop    %esi
80106ee5:	5f                   	pop    %edi
80106ee6:	5d                   	pop    %ebp
80106ee7:	c3                   	ret
80106ee8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106eef:	00 
    return oldsz;
80106ef0:	8b 55 0c             	mov    0xc(%ebp),%edx
}
80106ef3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ef6:	89 d0                	mov    %edx,%eax
80106ef8:	5b                   	pop    %ebx
80106ef9:	5e                   	pop    %esi
80106efa:	5f                   	pop    %edi
80106efb:	5d                   	pop    %ebp
80106efc:	c3                   	ret
80106efd:	8d 76 00             	lea    0x0(%esi),%esi
      cprintf("allocuvm out of memory (2)\n");
80106f00:	83 ec 0c             	sub    $0xc,%esp
80106f03:	68 d3 78 10 80       	push   $0x801078d3
80106f08:	e8 a3 97 ff ff       	call   801006b0 <cprintf>
  if(newsz >= oldsz)
80106f0d:	83 c4 10             	add    $0x10,%esp
80106f10:	3b 75 0c             	cmp    0xc(%ebp),%esi
80106f13:	74 0d                	je     80106f22 <allocuvm+0xf2>
80106f15:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106f18:	8b 45 08             	mov    0x8(%ebp),%eax
80106f1b:	89 f2                	mov    %esi,%edx
80106f1d:	e8 5e fa ff ff       	call   80106980 <deallocuvm.part.0>
      kfree(mem);
80106f22:	83 ec 0c             	sub    $0xc,%esp
80106f25:	53                   	push   %ebx
80106f26:	e8 f5 b5 ff ff       	call   80102520 <kfree>
      return 0;
80106f2b:	83 c4 10             	add    $0x10,%esp
    return 0;
80106f2e:	31 d2                	xor    %edx,%edx
80106f30:	eb ac                	jmp    80106ede <allocuvm+0xae>
80106f32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106f38:	8b 55 e4             	mov    -0x1c(%ebp),%edx
}
80106f3b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f3e:	5b                   	pop    %ebx
80106f3f:	5e                   	pop    %esi
80106f40:	89 d0                	mov    %edx,%eax
80106f42:	5f                   	pop    %edi
80106f43:	5d                   	pop    %ebp
80106f44:	c3                   	ret
80106f45:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106f4c:	00 
80106f4d:	8d 76 00             	lea    0x0(%esi),%esi

80106f50 <deallocuvm>:
{
80106f50:	55                   	push   %ebp
80106f51:	89 e5                	mov    %esp,%ebp
80106f53:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f56:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106f59:	8b 45 08             	mov    0x8(%ebp),%eax
  if(newsz >= oldsz)
80106f5c:	39 d1                	cmp    %edx,%ecx
80106f5e:	73 10                	jae    80106f70 <deallocuvm+0x20>
}
80106f60:	5d                   	pop    %ebp
80106f61:	e9 1a fa ff ff       	jmp    80106980 <deallocuvm.part.0>
80106f66:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106f6d:	00 
80106f6e:	66 90                	xchg   %ax,%ax
80106f70:	89 d0                	mov    %edx,%eax
80106f72:	5d                   	pop    %ebp
80106f73:	c3                   	ret
80106f74:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106f7b:	00 
80106f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106f80 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106f80:	55                   	push   %ebp
80106f81:	89 e5                	mov    %esp,%ebp
80106f83:	57                   	push   %edi
80106f84:	56                   	push   %esi
80106f85:	53                   	push   %ebx
80106f86:	83 ec 0c             	sub    $0xc,%esp
80106f89:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106f8c:	85 f6                	test   %esi,%esi
80106f8e:	74 59                	je     80106fe9 <freevm+0x69>
  if(newsz >= oldsz)
80106f90:	31 c9                	xor    %ecx,%ecx
80106f92:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106f97:	89 f0                	mov    %esi,%eax
80106f99:	89 f3                	mov    %esi,%ebx
80106f9b:	e8 e0 f9 ff ff       	call   80106980 <deallocuvm.part.0>
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106fa0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106fa6:	eb 0f                	jmp    80106fb7 <freevm+0x37>
80106fa8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106faf:	00 
80106fb0:	83 c3 04             	add    $0x4,%ebx
80106fb3:	39 fb                	cmp    %edi,%ebx
80106fb5:	74 23                	je     80106fda <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106fb7:	8b 03                	mov    (%ebx),%eax
80106fb9:	a8 01                	test   $0x1,%al
80106fbb:	74 f3                	je     80106fb0 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106fbd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
      kfree(v);
80106fc2:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < NPDENTRIES; i++){
80106fc5:	83 c3 04             	add    $0x4,%ebx
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106fc8:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
80106fcd:	50                   	push   %eax
80106fce:	e8 4d b5 ff ff       	call   80102520 <kfree>
80106fd3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < NPDENTRIES; i++){
80106fd6:	39 fb                	cmp    %edi,%ebx
80106fd8:	75 dd                	jne    80106fb7 <freevm+0x37>
    }
  }
  kfree((char*)pgdir);
80106fda:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106fdd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106fe0:	5b                   	pop    %ebx
80106fe1:	5e                   	pop    %esi
80106fe2:	5f                   	pop    %edi
80106fe3:	5d                   	pop    %ebp
  kfree((char*)pgdir);
80106fe4:	e9 37 b5 ff ff       	jmp    80102520 <kfree>
    panic("freevm: no pgdir");
80106fe9:	83 ec 0c             	sub    $0xc,%esp
80106fec:	68 ef 78 10 80       	push   $0x801078ef
80106ff1:	e8 8a 93 ff ff       	call   80100380 <panic>
80106ff6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80106ffd:	00 
80106ffe:	66 90                	xchg   %ax,%ax

80107000 <setupkvm>:
{
80107000:	55                   	push   %ebp
80107001:	89 e5                	mov    %esp,%ebp
80107003:	56                   	push   %esi
80107004:	53                   	push   %ebx
  if((pgdir = (pde_t*)kalloc()) == 0)
80107005:	e8 d6 b6 ff ff       	call   801026e0 <kalloc>
8010700a:	85 c0                	test   %eax,%eax
8010700c:	74 5e                	je     8010706c <setupkvm+0x6c>
  memset(pgdir, 0, PGSIZE);
8010700e:	83 ec 04             	sub    $0x4,%esp
80107011:	89 c6                	mov    %eax,%esi
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107013:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  memset(pgdir, 0, PGSIZE);
80107018:	68 00 10 00 00       	push   $0x1000
8010701d:	6a 00                	push   $0x0
8010701f:	50                   	push   %eax
80107020:	e8 cb e7 ff ff       	call   801057f0 <memset>
80107025:	83 c4 10             	add    $0x10,%esp
                (uint)k->phys_start, k->perm) < 0) {
80107028:	8b 43 04             	mov    0x4(%ebx),%eax
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
8010702b:	83 ec 08             	sub    $0x8,%esp
8010702e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80107031:	8b 13                	mov    (%ebx),%edx
80107033:	ff 73 0c             	push   0xc(%ebx)
80107036:	50                   	push   %eax
80107037:	29 c1                	sub    %eax,%ecx
80107039:	89 f0                	mov    %esi,%eax
8010703b:	e8 00 fa ff ff       	call   80106a40 <mappages>
80107040:	83 c4 10             	add    $0x10,%esp
80107043:	85 c0                	test   %eax,%eax
80107045:	78 19                	js     80107060 <setupkvm+0x60>
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80107047:	83 c3 10             	add    $0x10,%ebx
8010704a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80107050:	75 d6                	jne    80107028 <setupkvm+0x28>
}
80107052:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107055:	89 f0                	mov    %esi,%eax
80107057:	5b                   	pop    %ebx
80107058:	5e                   	pop    %esi
80107059:	5d                   	pop    %ebp
8010705a:	c3                   	ret
8010705b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
      freevm(pgdir);
80107060:	83 ec 0c             	sub    $0xc,%esp
80107063:	56                   	push   %esi
80107064:	e8 17 ff ff ff       	call   80106f80 <freevm>
      return 0;
80107069:	83 c4 10             	add    $0x10,%esp
}
8010706c:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return 0;
8010706f:	31 f6                	xor    %esi,%esi
}
80107071:	89 f0                	mov    %esi,%eax
80107073:	5b                   	pop    %ebx
80107074:	5e                   	pop    %esi
80107075:	5d                   	pop    %ebp
80107076:	c3                   	ret
80107077:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010707e:	00 
8010707f:	90                   	nop

80107080 <kvmalloc>:
{
80107080:	55                   	push   %ebp
80107081:	89 e5                	mov    %esp,%ebp
80107083:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80107086:	e8 75 ff ff ff       	call   80107000 <setupkvm>
8010708b:	a3 c4 9c 11 80       	mov    %eax,0x80119cc4
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80107090:	05 00 00 00 80       	add    $0x80000000,%eax
80107095:	0f 22 d8             	mov    %eax,%cr3
}
80107098:	c9                   	leave
80107099:	c3                   	ret
8010709a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801070a0 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
801070a0:	55                   	push   %ebp
801070a1:	89 e5                	mov    %esp,%ebp
801070a3:	83 ec 08             	sub    $0x8,%esp
801070a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(*pde & PTE_P){
801070a9:	8b 55 08             	mov    0x8(%ebp),%edx
  pde = &pgdir[PDX(va)];
801070ac:	89 c1                	mov    %eax,%ecx
801070ae:	c1 e9 16             	shr    $0x16,%ecx
  if(*pde & PTE_P){
801070b1:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
801070b4:	f6 c2 01             	test   $0x1,%dl
801070b7:	75 17                	jne    801070d0 <clearpteu+0x30>
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
801070b9:	83 ec 0c             	sub    $0xc,%esp
801070bc:	68 00 79 10 80       	push   $0x80107900
801070c1:	e8 ba 92 ff ff       	call   80100380 <panic>
801070c6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
801070cd:	00 
801070ce:	66 90                	xchg   %ax,%ax
  return &pgtab[PTX(va)];
801070d0:	c1 e8 0a             	shr    $0xa,%eax
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801070d3:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  return &pgtab[PTX(va)];
801070d9:	25 fc 0f 00 00       	and    $0xffc,%eax
801070de:	8d 84 02 00 00 00 80 	lea    -0x80000000(%edx,%eax,1),%eax
  if(pte == 0)
801070e5:	85 c0                	test   %eax,%eax
801070e7:	74 d0                	je     801070b9 <clearpteu+0x19>
  *pte &= ~PTE_U;
801070e9:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
801070ec:	c9                   	leave
801070ed:	c3                   	ret
801070ee:	66 90                	xchg   %ax,%ax

801070f0 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
801070f0:	55                   	push   %ebp
801070f1:	89 e5                	mov    %esp,%ebp
801070f3:	57                   	push   %edi
801070f4:	56                   	push   %esi
801070f5:	53                   	push   %ebx
801070f6:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
801070f9:	e8 02 ff ff ff       	call   80107000 <setupkvm>
801070fe:	89 45 e0             	mov    %eax,-0x20(%ebp)
80107101:	85 c0                	test   %eax,%eax
80107103:	0f 84 e9 00 00 00    	je     801071f2 <copyuvm+0x102>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107109:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010710c:	85 c9                	test   %ecx,%ecx
8010710e:	0f 84 b2 00 00 00    	je     801071c6 <copyuvm+0xd6>
80107114:	31 f6                	xor    %esi,%esi
80107116:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010711d:	00 
8010711e:	66 90                	xchg   %ax,%ax
  if(*pde & PTE_P){
80107120:	8b 4d 08             	mov    0x8(%ebp),%ecx
  pde = &pgdir[PDX(va)];
80107123:	89 f0                	mov    %esi,%eax
80107125:	c1 e8 16             	shr    $0x16,%eax
  if(*pde & PTE_P){
80107128:	8b 04 81             	mov    (%ecx,%eax,4),%eax
8010712b:	a8 01                	test   $0x1,%al
8010712d:	75 11                	jne    80107140 <copyuvm+0x50>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
8010712f:	83 ec 0c             	sub    $0xc,%esp
80107132:	68 0a 79 10 80       	push   $0x8010790a
80107137:	e8 44 92 ff ff       	call   80100380 <panic>
8010713c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return &pgtab[PTX(va)];
80107140:	89 f2                	mov    %esi,%edx
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80107142:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  return &pgtab[PTX(va)];
80107147:	c1 ea 0a             	shr    $0xa,%edx
8010714a:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80107150:	8d 84 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%eax
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80107157:	85 c0                	test   %eax,%eax
80107159:	74 d4                	je     8010712f <copyuvm+0x3f>
    if(!(*pte & PTE_P))
8010715b:	8b 00                	mov    (%eax),%eax
8010715d:	a8 01                	test   $0x1,%al
8010715f:	0f 84 9f 00 00 00    	je     80107204 <copyuvm+0x114>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80107165:	89 c7                	mov    %eax,%edi
    flags = PTE_FLAGS(*pte);
80107167:	25 ff 0f 00 00       	and    $0xfff,%eax
8010716c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    pa = PTE_ADDR(*pte);
8010716f:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    if((mem = kalloc()) == 0)
80107175:	e8 66 b5 ff ff       	call   801026e0 <kalloc>
8010717a:	89 c3                	mov    %eax,%ebx
8010717c:	85 c0                	test   %eax,%eax
8010717e:	74 64                	je     801071e4 <copyuvm+0xf4>
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80107180:	83 ec 04             	sub    $0x4,%esp
80107183:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80107189:	68 00 10 00 00       	push   $0x1000
8010718e:	57                   	push   %edi
8010718f:	50                   	push   %eax
80107190:	e8 eb e6 ff ff       	call   80105880 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80107195:	58                   	pop    %eax
80107196:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
8010719c:	5a                   	pop    %edx
8010719d:	ff 75 e4             	push   -0x1c(%ebp)
801071a0:	b9 00 10 00 00       	mov    $0x1000,%ecx
801071a5:	89 f2                	mov    %esi,%edx
801071a7:	50                   	push   %eax
801071a8:	8b 45 e0             	mov    -0x20(%ebp),%eax
801071ab:	e8 90 f8 ff ff       	call   80106a40 <mappages>
801071b0:	83 c4 10             	add    $0x10,%esp
801071b3:	85 c0                	test   %eax,%eax
801071b5:	78 21                	js     801071d8 <copyuvm+0xe8>
  for(i = 0; i < sz; i += PGSIZE){
801071b7:	81 c6 00 10 00 00    	add    $0x1000,%esi
801071bd:	3b 75 0c             	cmp    0xc(%ebp),%esi
801071c0:	0f 82 5a ff ff ff    	jb     80107120 <copyuvm+0x30>
  return d;

bad:
  freevm(d);
  return 0;
}
801071c6:	8b 45 e0             	mov    -0x20(%ebp),%eax
801071c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071cc:	5b                   	pop    %ebx
801071cd:	5e                   	pop    %esi
801071ce:	5f                   	pop    %edi
801071cf:	5d                   	pop    %ebp
801071d0:	c3                   	ret
801071d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      kfree(mem);
801071d8:	83 ec 0c             	sub    $0xc,%esp
801071db:	53                   	push   %ebx
801071dc:	e8 3f b3 ff ff       	call   80102520 <kfree>
      goto bad;
801071e1:	83 c4 10             	add    $0x10,%esp
  freevm(d);
801071e4:	83 ec 0c             	sub    $0xc,%esp
801071e7:	ff 75 e0             	push   -0x20(%ebp)
801071ea:	e8 91 fd ff ff       	call   80106f80 <freevm>
  return 0;
801071ef:	83 c4 10             	add    $0x10,%esp
    return 0;
801071f2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
}
801071f9:	8b 45 e0             	mov    -0x20(%ebp),%eax
801071fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071ff:	5b                   	pop    %ebx
80107200:	5e                   	pop    %esi
80107201:	5f                   	pop    %edi
80107202:	5d                   	pop    %ebp
80107203:	c3                   	ret
      panic("copyuvm: page not present");
80107204:	83 ec 0c             	sub    $0xc,%esp
80107207:	68 24 79 10 80       	push   $0x80107924
8010720c:	e8 6f 91 ff ff       	call   80100380 <panic>
80107211:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
80107218:	00 
80107219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107220 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107220:	55                   	push   %ebp
80107221:	89 e5                	mov    %esp,%ebp
80107223:	8b 45 0c             	mov    0xc(%ebp),%eax
  if(*pde & PTE_P){
80107226:	8b 55 08             	mov    0x8(%ebp),%edx
  pde = &pgdir[PDX(va)];
80107229:	89 c1                	mov    %eax,%ecx
8010722b:	c1 e9 16             	shr    $0x16,%ecx
  if(*pde & PTE_P){
8010722e:	8b 14 8a             	mov    (%edx,%ecx,4),%edx
80107231:	f6 c2 01             	test   $0x1,%dl
80107234:	0f 84 f8 00 00 00    	je     80107332 <uva2ka.cold>
  return &pgtab[PTX(va)];
8010723a:	c1 e8 0c             	shr    $0xc,%eax
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
8010723d:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}
80107243:	5d                   	pop    %ebp
  return &pgtab[PTX(va)];
80107244:	25 ff 03 00 00       	and    $0x3ff,%eax
  if((*pte & PTE_P) == 0)
80107249:	8b 94 82 00 00 00 80 	mov    -0x80000000(%edx,%eax,4),%edx
  return (char*)P2V(PTE_ADDR(*pte));
80107250:	89 d0                	mov    %edx,%eax
80107252:	f7 d2                	not    %edx
80107254:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107259:	05 00 00 00 80       	add    $0x80000000,%eax
8010725e:	83 e2 05             	and    $0x5,%edx
80107261:	ba 00 00 00 00       	mov    $0x0,%edx
80107266:	0f 45 c2             	cmovne %edx,%eax
}
80107269:	c3                   	ret
8010726a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107270 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107270:	55                   	push   %ebp
80107271:	89 e5                	mov    %esp,%ebp
80107273:	57                   	push   %edi
80107274:	56                   	push   %esi
80107275:	53                   	push   %ebx
80107276:	83 ec 0c             	sub    $0xc,%esp
80107279:	8b 75 14             	mov    0x14(%ebp),%esi
8010727c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010727f:	8b 55 10             	mov    0x10(%ebp),%edx
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107282:	85 f6                	test   %esi,%esi
80107284:	75 51                	jne    801072d7 <copyout+0x67>
80107286:	e9 9d 00 00 00       	jmp    80107328 <copyout+0xb8>
8010728b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  return (char*)P2V(PTE_ADDR(*pte));
80107290:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80107296:	8d 8b 00 00 00 80    	lea    -0x80000000(%ebx),%ecx
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
8010729c:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
801072a2:	74 74                	je     80107318 <copyout+0xa8>
      return -1;
    n = PGSIZE - (va - va0);
801072a4:	89 fb                	mov    %edi,%ebx
801072a6:	29 c3                	sub    %eax,%ebx
801072a8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    if(n > len)
801072ae:	39 f3                	cmp    %esi,%ebx
801072b0:	0f 47 de             	cmova  %esi,%ebx
      n = len;
    memmove(pa0 + (va - va0), buf, n);
801072b3:	29 f8                	sub    %edi,%eax
801072b5:	83 ec 04             	sub    $0x4,%esp
801072b8:	01 c1                	add    %eax,%ecx
801072ba:	53                   	push   %ebx
801072bb:	52                   	push   %edx
801072bc:	89 55 10             	mov    %edx,0x10(%ebp)
801072bf:	51                   	push   %ecx
801072c0:	e8 bb e5 ff ff       	call   80105880 <memmove>
    len -= n;
    buf += n;
801072c5:	8b 55 10             	mov    0x10(%ebp),%edx
    va = va0 + PGSIZE;
801072c8:	8d 87 00 10 00 00    	lea    0x1000(%edi),%eax
  while(len > 0){
801072ce:	83 c4 10             	add    $0x10,%esp
    buf += n;
801072d1:	01 da                	add    %ebx,%edx
  while(len > 0){
801072d3:	29 de                	sub    %ebx,%esi
801072d5:	74 51                	je     80107328 <copyout+0xb8>
  if(*pde & PTE_P){
801072d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pde = &pgdir[PDX(va)];
801072da:	89 c1                	mov    %eax,%ecx
    va0 = (uint)PGROUNDDOWN(va);
801072dc:	89 c7                	mov    %eax,%edi
  pde = &pgdir[PDX(va)];
801072de:	c1 e9 16             	shr    $0x16,%ecx
    va0 = (uint)PGROUNDDOWN(va);
801072e1:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
  if(*pde & PTE_P){
801072e7:	8b 0c 8b             	mov    (%ebx,%ecx,4),%ecx
801072ea:	f6 c1 01             	test   $0x1,%cl
801072ed:	0f 84 46 00 00 00    	je     80107339 <copyout.cold>
  return &pgtab[PTX(va)];
801072f3:	89 fb                	mov    %edi,%ebx
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801072f5:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
  return &pgtab[PTX(va)];
801072fb:	c1 eb 0c             	shr    $0xc,%ebx
801072fe:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
  if((*pte & PTE_P) == 0)
80107304:	8b 9c 99 00 00 00 80 	mov    -0x80000000(%ecx,%ebx,4),%ebx
  if((*pte & PTE_U) == 0)
8010730b:	89 d9                	mov    %ebx,%ecx
8010730d:	f7 d1                	not    %ecx
8010730f:	83 e1 05             	and    $0x5,%ecx
80107312:	0f 84 78 ff ff ff    	je     80107290 <copyout+0x20>
  }
  return 0;
}
80107318:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return -1;
8010731b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80107320:	5b                   	pop    %ebx
80107321:	5e                   	pop    %esi
80107322:	5f                   	pop    %edi
80107323:	5d                   	pop    %ebp
80107324:	c3                   	ret
80107325:	8d 76 00             	lea    0x0(%esi),%esi
80107328:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;
8010732b:	31 c0                	xor    %eax,%eax
}
8010732d:	5b                   	pop    %ebx
8010732e:	5e                   	pop    %esi
8010732f:	5f                   	pop    %edi
80107330:	5d                   	pop    %ebp
80107331:	c3                   	ret

80107332 <uva2ka.cold>:
  if((*pte & PTE_P) == 0)
80107332:	a1 00 00 00 00       	mov    0x0,%eax
80107337:	0f 0b                	ud2

80107339 <copyout.cold>:
80107339:	a1 00 00 00 00       	mov    0x0,%eax
8010733e:	0f 0b                	ud2

80107340 <shm_open>:

// Define a static pointer for shared memory
static char *shm_ptr = 0;

void* shm_open(int size) {
    if (shm_ptr == 0) {
80107340:	a1 c8 9c 11 80       	mov    0x80119cc8,%eax
80107345:	85 c0                	test   %eax,%eax
80107347:	74 07                	je     80107350 <shm_open+0x10>
        if (shm_ptr == 0) return 0; // Allocation failed
    }
    
    // Return the shared memory address
    return shm_ptr;
}
80107349:	c3                   	ret
8010734a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
void* shm_open(int size) {
80107350:	55                   	push   %ebp
80107351:	89 e5                	mov    %esp,%ebp
80107353:	83 ec 08             	sub    $0x8,%esp
        shm_ptr = kalloc(); // Allocate one page for simplicity
80107356:	e8 85 b3 ff ff       	call   801026e0 <kalloc>
8010735b:	a3 c8 9c 11 80       	mov    %eax,0x80119cc8
}
80107360:	c9                   	leave
80107361:	c3                   	ret
80107362:	66 90                	xchg   %ax,%ax
80107364:	66 90                	xchg   %ax,%ax
80107366:	66 90                	xchg   %ax,%ax
80107368:	66 90                	xchg   %ax,%ax
8010736a:	66 90                	xchg   %ax,%ax
8010736c:	66 90                	xchg   %ax,%ax
8010736e:	66 90                	xchg   %ax,%ax

80107370 <shm_attach>:
#include "mmu.h"
#include "proc.h"
#include "x86.h"

// Attach to an existing shared memory segment
char* shm_attach(int shmid) {
80107370:	55                   	push   %ebp
80107371:	89 e5                	mov    %esp,%ebp
    // Replace this with actual implementation logic as required
    void* address = (void*)shmid;  // Dummy implementation for example
    return address;
}
80107373:	8b 45 08             	mov    0x8(%ebp),%eax
80107376:	5d                   	pop    %ebp
80107377:	c3                   	ret
80107378:	66 90                	xchg   %ax,%ax
8010737a:	66 90                	xchg   %ax,%ax
8010737c:	66 90                	xchg   %ax,%ax
8010737e:	66 90                	xchg   %ax,%ax

80107380 <thread_create>:
#include "user.h"
#include "x86.h"
#include "proc.h"

// Simple thread creation function
int thread_create(void (*start_routine)(void*), void *arg) {
80107380:	55                   	push   %ebp
80107381:	89 e5                	mov    %esp,%ebp
80107383:	53                   	push   %ebx
80107384:	83 ec 04             	sub    $0x4,%esp
    int pid = fork();
80107387:	e8 04 c6 ff ff       	call   80103990 <fork>
8010738c:	89 c3                	mov    %eax,%ebx
    if (pid == 0) {
8010738e:	85 c0                	test   %eax,%eax
80107390:	75 18                	jne    801073aa <thread_create+0x2a>
        // New thread, run the start routine
        start_routine(arg);
80107392:	83 ec 0c             	sub    $0xc,%esp
80107395:	ff 75 0c             	push   0xc(%ebp)
80107398:	ff 55 08             	call   *0x8(%ebp)
        exit(0);
8010739b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801073a2:	e8 69 c8 ff ff       	call   80103c10 <exit>
801073a7:	83 c4 10             	add    $0x10,%esp
    }
    return pid;
}
801073aa:	89 d8                	mov    %ebx,%eax
801073ac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801073af:	c9                   	leave
801073b0:	c3                   	ret
801073b1:	66 90                	xchg   %ax,%ax
801073b3:	66 90                	xchg   %ax,%ax
801073b5:	66 90                	xchg   %ax,%ax
801073b7:	66 90                	xchg   %ax,%ax
801073b9:	66 90                	xchg   %ax,%ax
801073bb:	66 90                	xchg   %ax,%ax
801073bd:	66 90                	xchg   %ax,%ax
801073bf:	90                   	nop

801073c0 <thread_join>:
#include "types.h"
#include "user.h"
#include "proc.h"

// Wait for the specified thread to finish execution
int thread_join(int pid) {
801073c0:	55                   	push   %ebp
801073c1:	89 e5                	mov    %esp,%ebp
801073c3:	83 ec 1c             	sub    $0x1c,%esp
    int status;
    if (waitpid(pid, &status, 0) < 0) {
801073c6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801073c9:	6a 00                	push   $0x0
801073cb:	50                   	push   %eax
801073cc:	ff 75 08             	push   0x8(%ebp)
801073cf:	e8 6c c9 ff ff       	call   80103d40 <waitpid>
801073d4:	83 c4 10             	add    $0x10,%esp
801073d7:	85 c0                	test   %eax,%eax
801073d9:	78 05                	js     801073e0 <thread_join+0x20>
        return -1; // Error if waiting failed
    }
    return status; // Return the exit status of the thread
801073db:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
801073de:	c9                   	leave
801073df:	c3                   	ret
801073e0:	c9                   	leave
        return -1; // Error if waiting failed
801073e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801073e6:	c3                   	ret
801073e7:	66 90                	xchg   %ax,%ax
801073e9:	66 90                	xchg   %ax,%ax
801073eb:	66 90                	xchg   %ax,%ax
801073ed:	66 90                	xchg   %ax,%ax
801073ef:	90                   	nop

801073f0 <sys_signal>:
#include "proc.h"
#include "x86.h"
#include "syscall.h"

// Send a signal to a process by setting the signal flag
int sys_signal(void) {
801073f0:	55                   	push   %ebp
801073f1:	89 e5                	mov    %esp,%ebp
801073f3:	83 ec 20             	sub    $0x20,%esp
    int pid, sig;
    if (argint(0, &pid) < 0 || argint(1, &sig) < 0)
801073f6:	8d 45 f0             	lea    -0x10(%ebp),%eax
801073f9:	50                   	push   %eax
801073fa:	6a 00                	push   $0x0
801073fc:	e8 ff cf ff ff       	call   80104400 <argint>
80107401:	83 c4 10             	add    $0x10,%esp
80107404:	85 c0                	test   %eax,%eax
80107406:	78 48                	js     80107450 <sys_signal+0x60>
80107408:	83 ec 08             	sub    $0x8,%esp
8010740b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010740e:	50                   	push   %eax
8010740f:	6a 01                	push   $0x1
80107411:	e8 ea cf ff ff       	call   80104400 <argint>
80107416:	83 c4 10             	add    $0x10,%esp
80107419:	85 c0                	test   %eax,%eax
8010741b:	78 33                	js     80107450 <sys_signal+0x60>
        return -1;

    // Retrieve process by PID
    struct proc *p = find_proc_by_pid(pid);
8010741d:	83 ec 0c             	sub    $0xc,%esp
80107420:	ff 75 f0             	push   -0x10(%ebp)
80107423:	e8 58 c3 ff ff       	call   80103780 <find_proc_by_pid>
    if (p != 0) {
80107428:	83 c4 10             	add    $0x10,%esp
8010742b:	85 c0                	test   %eax,%eax
8010742d:	74 21                	je     80107450 <sys_signal+0x60>
        if (sig >= 0 && sig < 32) { // Ensure signal is within valid range
8010742f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
80107432:	83 f9 1f             	cmp    $0x1f,%ecx
80107435:	77 19                	ja     80107450 <sys_signal+0x60>
            p->pending_signals |= (1 << sig);  // Set the bit for this signal
80107437:	ba 01 00 00 00       	mov    $0x1,%edx
8010743c:	d3 e2                	shl    %cl,%edx
8010743e:	09 90 88 00 00 00    	or     %edx,0x88(%eax)
            return 0;
80107444:	31 c0                	xor    %eax,%eax
        }
    }
    return -1;  // PID not found or invalid signal
}
80107446:	c9                   	leave
80107447:	c3                   	ret
80107448:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
8010744f:	00 
80107450:	c9                   	leave
        return -1;
80107451:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80107456:	c3                   	ret
