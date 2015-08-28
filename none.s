
out/bin/none:     file format elf32-i386


Disassembly of section .text:

00361000 <_start>:
  361000:	eb 22                	jmp    361024 <start>
  361002:	66 90                	xchg   %ax,%ax

00361004 <multiboot_header>:
  361004:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  36100a:	00 00                	add    %al,(%eax)
  36100c:	fb                   	sti    
  36100d:	4f                   	dec    %edi
  36100e:	52                   	push   %edx
  36100f:	e4 04                	in     $0x4,%al
  361011:	10 36                	adc    %dh,(%esi)
  361013:	00 00                	add    %al,(%eax)
  361015:	10 36                	adc    %dh,(%esi)
  361017:	00 94 31 37 00 00 49 	add    %dl,0x49000037(%ecx,%esi,1)
  36101e:	37                   	aaa    
  36101f:	00 00                	add    %al,(%eax)
  361021:	10 36                	adc    %dh,(%esi)
	...

00361024 <start>:
  361024:	fa                   	cli    
  361025:	89 1d 00 30 37 00    	mov    %ebx,0x373000
  36102b:	0f 20 c0             	mov    %cr0,%eax
  36102e:	83 c8 20             	or     $0x20,%eax
  361031:	0f 22 c0             	mov    %eax,%cr0
  361034:	bf 00 09 02 00       	mov    $0x20900,%edi
  361039:	be 10 30 37 00       	mov    $0x373010,%esi
  36103e:	b9 40 00 00 00       	mov    $0x40,%ecx
  361043:	c1 e9 02             	shr    $0x2,%ecx
  361046:	fc                   	cld    
  361047:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  361049:	0f 01 15 04 30 37 00 	lgdtl  0x373004
  361050:	0f 01 1d 0a 30 37 00 	lidtl  0x37300a
  361057:	ea 5e 10 36 00 08 00 	ljmp   $0x8,$0x36105e

0036105e <new_env>:
  36105e:	b8 10 00 00 00       	mov    $0x10,%eax
  361063:	8e d8                	mov    %eax,%ds
  361065:	8e c0                	mov    %eax,%es
  361067:	8e d0                	mov    %eax,%ss
  361069:	8e e0                	mov    %eax,%fs
  36106b:	8e e8                	mov    %eax,%gs
  36106d:	bc f0 ff 3f 00       	mov    $0x3ffff0,%esp
  361072:	e8 5c a5 00 00       	call   36b5d3 <main>
  361077:	fb                   	sti    
  361078:	eb fe                	jmp    361078 <new_env+0x1a>

0036107a <divide_error>:
  36107a:	6a 00                	push   $0x0
  36107c:	68 be 93 36 00       	push   $0x3693be

00361081 <error_code>:
  361081:	87 44 24 04          	xchg   %eax,0x4(%esp)
  361085:	87 0c 24             	xchg   %ecx,(%esp)
  361088:	52                   	push   %edx
  361089:	53                   	push   %ebx
  36108a:	55                   	push   %ebp
  36108b:	56                   	push   %esi
  36108c:	57                   	push   %edi
  36108d:	06                   	push   %es
  36108e:	1e                   	push   %ds
  36108f:	0f a0                	push   %fs
  361091:	0f a8                	push   %gs
  361093:	54                   	push   %esp
  361094:	50                   	push   %eax
  361095:	b8 10 00 00 00       	mov    $0x10,%eax
  36109a:	8e d8                	mov    %eax,%ds
  36109c:	8e c0                	mov    %eax,%es
  36109e:	8e e0                	mov    %eax,%fs
  3610a0:	ff d1                	call   *%ecx
  3610a2:	83 c4 08             	add    $0x8,%esp
  3610a5:	0f a9                	pop    %gs
  3610a7:	0f a1                	pop    %fs
  3610a9:	1f                   	pop    %ds
  3610aa:	07                   	pop    %es
  3610ab:	5f                   	pop    %edi
  3610ac:	5e                   	pop    %esi
  3610ad:	5d                   	pop    %ebp
  3610ae:	5b                   	pop    %ebx
  3610af:	5a                   	pop    %edx
  3610b0:	59                   	pop    %ecx
  3610b1:	58                   	pop    %eax
  3610b2:	cf                   	iret   

003610b3 <single_step_exception>:
  3610b3:	6a 00                	push   $0x0
  3610b5:	68 dc 93 36 00       	push   $0x3693dc
  3610ba:	eb c5                	jmp    361081 <error_code>

003610bc <nmi>:
  3610bc:	6a 00                	push   $0x0
  3610be:	68 0a 94 36 00       	push   $0x36940a
  3610c3:	eb bc                	jmp    361081 <error_code>

003610c5 <breakpoint_exception>:
  3610c5:	6a 00                	push   $0x0
  3610c7:	68 28 94 36 00       	push   $0x369428
  3610cc:	eb b3                	jmp    361081 <error_code>

003610ce <overflow>:
  3610ce:	6a 00                	push   $0x0
  3610d0:	68 56 94 36 00       	push   $0x369456
  3610d5:	eb aa                	jmp    361081 <error_code>

003610d7 <bounds_check>:
  3610d7:	6a 00                	push   $0x0
  3610d9:	68 74 94 36 00       	push   $0x369474
  3610de:	eb a1                	jmp    361081 <error_code>

003610e0 <inval_opcode>:
  3610e0:	6a 00                	push   $0x0
  3610e2:	68 92 94 36 00       	push   $0x369492
  3610e7:	eb 98                	jmp    361081 <error_code>

003610e9 <copr_not_available>:
  3610e9:	6a 00                	push   $0x0
  3610eb:	68 b0 94 36 00       	push   $0x3694b0
  3610f0:	eb 8f                	jmp    361081 <error_code>

003610f2 <double_fault>:
  3610f2:	68 ce 94 36 00       	push   $0x3694ce
  3610f7:	eb 88                	jmp    361081 <error_code>

003610f9 <copr_seg_overrun>:
  3610f9:	6a 00                	push   $0x0
  3610fb:	68 ec 94 36 00       	push   $0x3694ec
  361100:	e9 7c ff ff ff       	jmp    361081 <error_code>

00361105 <inval_tss>:
  361105:	68 0a 95 36 00       	push   $0x36950a
  36110a:	e9 72 ff ff ff       	jmp    361081 <error_code>

0036110f <segment_not_present>:
  36110f:	68 28 95 36 00       	push   $0x369528
  361114:	e9 68 ff ff ff       	jmp    361081 <error_code>

00361119 <stack_exception>:
  361119:	68 46 95 36 00       	push   $0x369546
  36111e:	e9 5e ff ff ff       	jmp    361081 <error_code>

00361123 <general_protection>:
  361123:	68 64 95 36 00       	push   $0x369564
  361128:	e9 54 ff ff ff       	jmp    361081 <error_code>

0036112d <page_fault>:
  36112d:	68 82 95 36 00       	push   $0x369582
  361132:	e9 4a ff ff ff       	jmp    361081 <error_code>

00361137 <copr_error>:
  361137:	6a 00                	push   $0x0
  361139:	68 f7 95 36 00       	push   $0x3695f7
  36113e:	e9 3e ff ff ff       	jmp    361081 <error_code>

00361143 <none>:
  361143:	6a 00                	push   $0x0
  361145:	68 15 96 36 00       	push   $0x369615
  36114a:	e9 32 ff ff ff       	jmp    361081 <error_code>

0036114f <switch_task>:
  36114f:	60                   	pusha  
  361150:	06                   	push   %es
  361151:	1e                   	push   %ds
  361152:	0f a0                	push   %fs
  361154:	0f a8                	push   %gs
  361156:	b8 10 00 00 00       	mov    $0x10,%eax
  36115b:	8e d8                	mov    %eax,%ds
  36115d:	8e c0                	mov    %eax,%es
  36115f:	8e e0                	mov    %eax,%fs
  361161:	8e e8                	mov    %eax,%gs
  361163:	8b 1d c4 37 37 00    	mov    0x3737c4,%ebx
  361169:	89 a3 00 01 00 00    	mov    %esp,0x100(%ebx)
  36116f:	e8 7e 8d 00 00       	call   369ef2 <sched>
  361174:	8b 1d c4 37 37 00    	mov    0x3737c4,%ebx
  36117a:	8b a3 00 01 00 00    	mov    0x100(%ebx),%esp
  361180:	8b 83 04 01 00 00    	mov    0x104(%ebx),%eax
  361186:	0f 22 d8             	mov    %eax,%cr3
  361189:	0f a9                	pop    %gs
  36118b:	0f a1                	pop    %fs
  36118d:	1f                   	pop    %ds
  36118e:	07                   	pop    %es
  36118f:	61                   	popa   
  361190:	cf                   	iret   

00361191 <hwint00>:
  361191:	60                   	pusha  
  361192:	06                   	push   %es
  361193:	1e                   	push   %ds
  361194:	0f a0                	push   %fs
  361196:	0f a8                	push   %gs
  361198:	b8 10 00 00 00       	mov    $0x10,%eax
  36119d:	8e d8                	mov    %eax,%ds
  36119f:	8e c0                	mov    %eax,%es
  3611a1:	8e e0                	mov    %eax,%fs
  3611a3:	8e e8                	mov    %eax,%gs
  3611a5:	e4 21                	in     $0x21,%al
  3611a7:	0a 05 01 00 00 00    	or     0x1,%al
  3611ad:	e6 21                	out    %al,$0x21
  3611af:	b0 20                	mov    $0x20,%al
  3611b1:	e6 20                	out    %al,$0x20
  3611b3:	ff 05 00 38 37 00    	incl   0x373800
  3611b9:	8b 1d c4 37 37 00    	mov    0x3737c4,%ebx
  3611bf:	8b 83 f8 00 00 00    	mov    0xf8(%ebx),%eax
  3611c5:	85 c0                	test   %eax,%eax
  3611c7:	74 06                	je     3611cf <hwint00+0x3e>
  3611c9:	ff 8b f8 00 00 00    	decl   0xf8(%ebx)
  3611cf:	a1 00 38 37 00       	mov    0x373800,%eax
  3611d4:	25 ff 03 00 00       	and    $0x3ff,%eax
  3611d9:	74 0a                	je     3611e5 <hwint00+0x54>
  3611db:	6a 00                	push   $0x0
  3611dd:	e8 60 85 00 00       	call   369742 <irq_handler>
  3611e2:	83 c4 04             	add    $0x4,%esp
  3611e5:	8b 1d c4 37 37 00    	mov    0x3737c4,%ebx
  3611eb:	89 a3 00 01 00 00    	mov    %esp,0x100(%ebx)
  3611f1:	e8 fc 8c 00 00       	call   369ef2 <sched>
  3611f6:	8b 1d c4 37 37 00    	mov    0x3737c4,%ebx
  3611fc:	8b a3 00 01 00 00    	mov    0x100(%ebx),%esp
  361202:	8b 83 04 01 00 00    	mov    0x104(%ebx),%eax
  361208:	0f 22 d8             	mov    %eax,%cr3
  36120b:	e4 21                	in     $0x21,%al
  36120d:	24 fe                	and    $0xfe,%al
  36120f:	e6 21                	out    %al,$0x21
  361211:	0f a9                	pop    %gs
  361213:	0f a1                	pop    %fs
  361215:	1f                   	pop    %ds
  361216:	07                   	pop    %es
  361217:	61                   	popa   
  361218:	cf                   	iret   

00361219 <hwint01>:
  361219:	60                   	pusha  
  36121a:	06                   	push   %es
  36121b:	1e                   	push   %ds
  36121c:	0f a0                	push   %fs
  36121e:	0f a8                	push   %gs
  361220:	b8 10 00 00 00       	mov    $0x10,%eax
  361225:	8e d8                	mov    %eax,%ds
  361227:	8e c0                	mov    %eax,%es
  361229:	8e e0                	mov    %eax,%fs
  36122b:	8e e8                	mov    %eax,%gs
  36122d:	e4 21                	in     $0x21,%al
  36122f:	0c 02                	or     $0x2,%al
  361231:	e6 21                	out    %al,$0x21
  361233:	b0 20                	mov    $0x20,%al
  361235:	e6 20                	out    %al,$0x20
  361237:	fb                   	sti    
  361238:	6a 01                	push   $0x1
  36123a:	e8 03 85 00 00       	call   369742 <irq_handler>
  36123f:	83 c4 04             	add    $0x4,%esp
  361242:	fa                   	cli    
  361243:	e4 21                	in     $0x21,%al
  361245:	24 fd                	and    $0xfd,%al
  361247:	e6 21                	out    %al,$0x21
  361249:	0f a9                	pop    %gs
  36124b:	0f a1                	pop    %fs
  36124d:	1f                   	pop    %ds
  36124e:	07                   	pop    %es
  36124f:	61                   	popa   
  361250:	cf                   	iret   

00361251 <hwint02>:
  361251:	60                   	pusha  
  361252:	06                   	push   %es
  361253:	1e                   	push   %ds
  361254:	0f a0                	push   %fs
  361256:	0f a8                	push   %gs
  361258:	b8 10 00 00 00       	mov    $0x10,%eax
  36125d:	8e d8                	mov    %eax,%ds
  36125f:	8e c0                	mov    %eax,%es
  361261:	8e e0                	mov    %eax,%fs
  361263:	8e e8                	mov    %eax,%gs
  361265:	e4 21                	in     $0x21,%al
  361267:	0c 04                	or     $0x4,%al
  361269:	e6 21                	out    %al,$0x21
  36126b:	b0 20                	mov    $0x20,%al
  36126d:	e6 20                	out    %al,$0x20
  36126f:	fb                   	sti    
  361270:	6a 02                	push   $0x2
  361272:	e8 cb 84 00 00       	call   369742 <irq_handler>
  361277:	83 c4 04             	add    $0x4,%esp
  36127a:	fa                   	cli    
  36127b:	e4 21                	in     $0x21,%al
  36127d:	24 fb                	and    $0xfb,%al
  36127f:	e6 21                	out    %al,$0x21
  361281:	0f a9                	pop    %gs
  361283:	0f a1                	pop    %fs
  361285:	1f                   	pop    %ds
  361286:	07                   	pop    %es
  361287:	61                   	popa   
  361288:	cf                   	iret   

00361289 <hwint03>:
  361289:	60                   	pusha  
  36128a:	06                   	push   %es
  36128b:	1e                   	push   %ds
  36128c:	0f a0                	push   %fs
  36128e:	0f a8                	push   %gs
  361290:	b8 10 00 00 00       	mov    $0x10,%eax
  361295:	8e d8                	mov    %eax,%ds
  361297:	8e c0                	mov    %eax,%es
  361299:	8e e0                	mov    %eax,%fs
  36129b:	8e e8                	mov    %eax,%gs
  36129d:	e4 21                	in     $0x21,%al
  36129f:	0c 08                	or     $0x8,%al
  3612a1:	e6 21                	out    %al,$0x21
  3612a3:	b0 20                	mov    $0x20,%al
  3612a5:	e6 20                	out    %al,$0x20
  3612a7:	fb                   	sti    
  3612a8:	6a 03                	push   $0x3
  3612aa:	e8 93 84 00 00       	call   369742 <irq_handler>
  3612af:	83 c4 04             	add    $0x4,%esp
  3612b2:	fa                   	cli    
  3612b3:	e4 21                	in     $0x21,%al
  3612b5:	24 f7                	and    $0xf7,%al
  3612b7:	e6 21                	out    %al,$0x21
  3612b9:	0f a9                	pop    %gs
  3612bb:	0f a1                	pop    %fs
  3612bd:	1f                   	pop    %ds
  3612be:	07                   	pop    %es
  3612bf:	61                   	popa   
  3612c0:	cf                   	iret   

003612c1 <hwint04>:
  3612c1:	60                   	pusha  
  3612c2:	06                   	push   %es
  3612c3:	1e                   	push   %ds
  3612c4:	0f a0                	push   %fs
  3612c6:	0f a8                	push   %gs
  3612c8:	b8 10 00 00 00       	mov    $0x10,%eax
  3612cd:	8e d8                	mov    %eax,%ds
  3612cf:	8e c0                	mov    %eax,%es
  3612d1:	8e e0                	mov    %eax,%fs
  3612d3:	8e e8                	mov    %eax,%gs
  3612d5:	e4 21                	in     $0x21,%al
  3612d7:	0c 10                	or     $0x10,%al
  3612d9:	e6 21                	out    %al,$0x21
  3612db:	b0 20                	mov    $0x20,%al
  3612dd:	e6 20                	out    %al,$0x20
  3612df:	fb                   	sti    
  3612e0:	6a 04                	push   $0x4
  3612e2:	e8 5b 84 00 00       	call   369742 <irq_handler>
  3612e7:	83 c4 04             	add    $0x4,%esp
  3612ea:	fa                   	cli    
  3612eb:	e4 21                	in     $0x21,%al
  3612ed:	24 ef                	and    $0xef,%al
  3612ef:	e6 21                	out    %al,$0x21
  3612f1:	0f a9                	pop    %gs
  3612f3:	0f a1                	pop    %fs
  3612f5:	1f                   	pop    %ds
  3612f6:	07                   	pop    %es
  3612f7:	61                   	popa   
  3612f8:	cf                   	iret   

003612f9 <hwint05>:
  3612f9:	60                   	pusha  
  3612fa:	06                   	push   %es
  3612fb:	1e                   	push   %ds
  3612fc:	0f a0                	push   %fs
  3612fe:	0f a8                	push   %gs
  361300:	b8 10 00 00 00       	mov    $0x10,%eax
  361305:	8e d8                	mov    %eax,%ds
  361307:	8e c0                	mov    %eax,%es
  361309:	8e e0                	mov    %eax,%fs
  36130b:	8e e8                	mov    %eax,%gs
  36130d:	e4 21                	in     $0x21,%al
  36130f:	0c 20                	or     $0x20,%al
  361311:	e6 21                	out    %al,$0x21
  361313:	b0 20                	mov    $0x20,%al
  361315:	e6 20                	out    %al,$0x20
  361317:	fb                   	sti    
  361318:	6a 05                	push   $0x5
  36131a:	e8 23 84 00 00       	call   369742 <irq_handler>
  36131f:	83 c4 04             	add    $0x4,%esp
  361322:	fa                   	cli    
  361323:	e4 21                	in     $0x21,%al
  361325:	24 df                	and    $0xdf,%al
  361327:	e6 21                	out    %al,$0x21
  361329:	0f a9                	pop    %gs
  36132b:	0f a1                	pop    %fs
  36132d:	1f                   	pop    %ds
  36132e:	07                   	pop    %es
  36132f:	61                   	popa   
  361330:	cf                   	iret   

00361331 <hwint06>:
  361331:	60                   	pusha  
  361332:	06                   	push   %es
  361333:	1e                   	push   %ds
  361334:	0f a0                	push   %fs
  361336:	0f a8                	push   %gs
  361338:	b8 10 00 00 00       	mov    $0x10,%eax
  36133d:	8e d8                	mov    %eax,%ds
  36133f:	8e c0                	mov    %eax,%es
  361341:	8e e0                	mov    %eax,%fs
  361343:	8e e8                	mov    %eax,%gs
  361345:	e4 21                	in     $0x21,%al
  361347:	0c 40                	or     $0x40,%al
  361349:	e6 21                	out    %al,$0x21
  36134b:	b0 20                	mov    $0x20,%al
  36134d:	e6 20                	out    %al,$0x20
  36134f:	fb                   	sti    
  361350:	6a 06                	push   $0x6
  361352:	e8 eb 83 00 00       	call   369742 <irq_handler>
  361357:	83 c4 04             	add    $0x4,%esp
  36135a:	fa                   	cli    
  36135b:	e4 21                	in     $0x21,%al
  36135d:	24 bf                	and    $0xbf,%al
  36135f:	e6 21                	out    %al,$0x21
  361361:	0f a9                	pop    %gs
  361363:	0f a1                	pop    %fs
  361365:	1f                   	pop    %ds
  361366:	07                   	pop    %es
  361367:	61                   	popa   
  361368:	cf                   	iret   

00361369 <hwint07>:
  361369:	60                   	pusha  
  36136a:	06                   	push   %es
  36136b:	1e                   	push   %ds
  36136c:	0f a0                	push   %fs
  36136e:	0f a8                	push   %gs
  361370:	b8 10 00 00 00       	mov    $0x10,%eax
  361375:	8e d8                	mov    %eax,%ds
  361377:	8e c0                	mov    %eax,%es
  361379:	8e e0                	mov    %eax,%fs
  36137b:	8e e8                	mov    %eax,%gs
  36137d:	e4 21                	in     $0x21,%al
  36137f:	0c 80                	or     $0x80,%al
  361381:	e6 21                	out    %al,$0x21
  361383:	b0 20                	mov    $0x20,%al
  361385:	e6 20                	out    %al,$0x20
  361387:	fb                   	sti    
  361388:	6a 07                	push   $0x7
  36138a:	e8 b3 83 00 00       	call   369742 <irq_handler>
  36138f:	83 c4 04             	add    $0x4,%esp
  361392:	fa                   	cli    
  361393:	e4 21                	in     $0x21,%al
  361395:	24 7f                	and    $0x7f,%al
  361397:	e6 21                	out    %al,$0x21
  361399:	0f a9                	pop    %gs
  36139b:	0f a1                	pop    %fs
  36139d:	1f                   	pop    %ds
  36139e:	07                   	pop    %es
  36139f:	61                   	popa   
  3613a0:	cf                   	iret   

003613a1 <hwint08>:
  3613a1:	60                   	pusha  
  3613a2:	06                   	push   %es
  3613a3:	1e                   	push   %ds
  3613a4:	0f a0                	push   %fs
  3613a6:	0f a8                	push   %gs
  3613a8:	b8 10 00 00 00       	mov    $0x10,%eax
  3613ad:	8e d8                	mov    %eax,%ds
  3613af:	8e c0                	mov    %eax,%es
  3613b1:	8e e0                	mov    %eax,%fs
  3613b3:	8e e8                	mov    %eax,%gs
  3613b5:	e4 a1                	in     $0xa1,%al
  3613b7:	0c 01                	or     $0x1,%al
  3613b9:	e6 a1                	out    %al,$0xa1
  3613bb:	b0 20                	mov    $0x20,%al
  3613bd:	e6 20                	out    %al,$0x20
  3613bf:	eb 00                	jmp    3613c1 <hwint08+0x20>
  3613c1:	e6 a0                	out    %al,$0xa0
  3613c3:	fb                   	sti    
  3613c4:	6a 08                	push   $0x8
  3613c6:	e8 77 83 00 00       	call   369742 <irq_handler>
  3613cb:	83 c4 04             	add    $0x4,%esp
  3613ce:	fa                   	cli    
  3613cf:	e4 a1                	in     $0xa1,%al
  3613d1:	24 fe                	and    $0xfe,%al
  3613d3:	e6 a1                	out    %al,$0xa1
  3613d5:	0f a9                	pop    %gs
  3613d7:	0f a1                	pop    %fs
  3613d9:	1f                   	pop    %ds
  3613da:	07                   	pop    %es
  3613db:	61                   	popa   
  3613dc:	cf                   	iret   

003613dd <hwint09>:
  3613dd:	60                   	pusha  
  3613de:	06                   	push   %es
  3613df:	1e                   	push   %ds
  3613e0:	0f a0                	push   %fs
  3613e2:	0f a8                	push   %gs
  3613e4:	b8 10 00 00 00       	mov    $0x10,%eax
  3613e9:	8e d8                	mov    %eax,%ds
  3613eb:	8e c0                	mov    %eax,%es
  3613ed:	8e e0                	mov    %eax,%fs
  3613ef:	8e e8                	mov    %eax,%gs
  3613f1:	e4 a1                	in     $0xa1,%al
  3613f3:	0c 02                	or     $0x2,%al
  3613f5:	e6 a1                	out    %al,$0xa1
  3613f7:	b0 20                	mov    $0x20,%al
  3613f9:	e6 20                	out    %al,$0x20
  3613fb:	eb 00                	jmp    3613fd <hwint09+0x20>
  3613fd:	e6 a0                	out    %al,$0xa0
  3613ff:	fb                   	sti    
  361400:	6a 09                	push   $0x9
  361402:	e8 3b 83 00 00       	call   369742 <irq_handler>
  361407:	83 c4 04             	add    $0x4,%esp
  36140a:	fa                   	cli    
  36140b:	e4 a1                	in     $0xa1,%al
  36140d:	24 fd                	and    $0xfd,%al
  36140f:	e6 a1                	out    %al,$0xa1
  361411:	0f a9                	pop    %gs
  361413:	0f a1                	pop    %fs
  361415:	1f                   	pop    %ds
  361416:	07                   	pop    %es
  361417:	61                   	popa   
  361418:	cf                   	iret   

00361419 <hwint10>:
  361419:	60                   	pusha  
  36141a:	06                   	push   %es
  36141b:	1e                   	push   %ds
  36141c:	0f a0                	push   %fs
  36141e:	0f a8                	push   %gs
  361420:	b8 10 00 00 00       	mov    $0x10,%eax
  361425:	8e d8                	mov    %eax,%ds
  361427:	8e c0                	mov    %eax,%es
  361429:	8e e0                	mov    %eax,%fs
  36142b:	8e e8                	mov    %eax,%gs
  36142d:	e4 a1                	in     $0xa1,%al
  36142f:	0c 04                	or     $0x4,%al
  361431:	e6 a1                	out    %al,$0xa1
  361433:	b0 20                	mov    $0x20,%al
  361435:	e6 20                	out    %al,$0x20
  361437:	eb 00                	jmp    361439 <hwint10+0x20>
  361439:	e6 a0                	out    %al,$0xa0
  36143b:	fb                   	sti    
  36143c:	6a 0a                	push   $0xa
  36143e:	e8 ff 82 00 00       	call   369742 <irq_handler>
  361443:	83 c4 04             	add    $0x4,%esp
  361446:	fa                   	cli    
  361447:	e4 a1                	in     $0xa1,%al
  361449:	24 fb                	and    $0xfb,%al
  36144b:	e6 a1                	out    %al,$0xa1
  36144d:	0f a9                	pop    %gs
  36144f:	0f a1                	pop    %fs
  361451:	1f                   	pop    %ds
  361452:	07                   	pop    %es
  361453:	61                   	popa   
  361454:	cf                   	iret   

00361455 <hwint11>:
  361455:	60                   	pusha  
  361456:	06                   	push   %es
  361457:	1e                   	push   %ds
  361458:	0f a0                	push   %fs
  36145a:	0f a8                	push   %gs
  36145c:	b8 10 00 00 00       	mov    $0x10,%eax
  361461:	8e d8                	mov    %eax,%ds
  361463:	8e c0                	mov    %eax,%es
  361465:	8e e0                	mov    %eax,%fs
  361467:	8e e8                	mov    %eax,%gs
  361469:	e4 a1                	in     $0xa1,%al
  36146b:	0c 08                	or     $0x8,%al
  36146d:	e6 a1                	out    %al,$0xa1
  36146f:	b0 20                	mov    $0x20,%al
  361471:	e6 20                	out    %al,$0x20
  361473:	eb 00                	jmp    361475 <hwint11+0x20>
  361475:	e6 a0                	out    %al,$0xa0
  361477:	fb                   	sti    
  361478:	6a 0b                	push   $0xb
  36147a:	e8 c3 82 00 00       	call   369742 <irq_handler>
  36147f:	83 c4 04             	add    $0x4,%esp
  361482:	fa                   	cli    
  361483:	e4 a1                	in     $0xa1,%al
  361485:	24 f7                	and    $0xf7,%al
  361487:	e6 a1                	out    %al,$0xa1
  361489:	0f a9                	pop    %gs
  36148b:	0f a1                	pop    %fs
  36148d:	1f                   	pop    %ds
  36148e:	07                   	pop    %es
  36148f:	61                   	popa   
  361490:	cf                   	iret   

00361491 <hwint12>:
  361491:	60                   	pusha  
  361492:	06                   	push   %es
  361493:	1e                   	push   %ds
  361494:	0f a0                	push   %fs
  361496:	0f a8                	push   %gs
  361498:	b8 10 00 00 00       	mov    $0x10,%eax
  36149d:	8e d8                	mov    %eax,%ds
  36149f:	8e c0                	mov    %eax,%es
  3614a1:	8e e0                	mov    %eax,%fs
  3614a3:	8e e8                	mov    %eax,%gs
  3614a5:	e4 a1                	in     $0xa1,%al
  3614a7:	0c 10                	or     $0x10,%al
  3614a9:	e6 a1                	out    %al,$0xa1
  3614ab:	b0 20                	mov    $0x20,%al
  3614ad:	e6 20                	out    %al,$0x20
  3614af:	eb 00                	jmp    3614b1 <hwint12+0x20>
  3614b1:	e6 a0                	out    %al,$0xa0
  3614b3:	fb                   	sti    
  3614b4:	6a 0c                	push   $0xc
  3614b6:	e8 87 82 00 00       	call   369742 <irq_handler>
  3614bb:	83 c4 04             	add    $0x4,%esp
  3614be:	fa                   	cli    
  3614bf:	e4 a1                	in     $0xa1,%al
  3614c1:	24 ef                	and    $0xef,%al
  3614c3:	e6 a1                	out    %al,$0xa1
  3614c5:	0f a9                	pop    %gs
  3614c7:	0f a1                	pop    %fs
  3614c9:	1f                   	pop    %ds
  3614ca:	07                   	pop    %es
  3614cb:	61                   	popa   
  3614cc:	cf                   	iret   

003614cd <hwint13>:
  3614cd:	60                   	pusha  
  3614ce:	06                   	push   %es
  3614cf:	1e                   	push   %ds
  3614d0:	0f a0                	push   %fs
  3614d2:	0f a8                	push   %gs
  3614d4:	b8 10 00 00 00       	mov    $0x10,%eax
  3614d9:	8e d8                	mov    %eax,%ds
  3614db:	8e c0                	mov    %eax,%es
  3614dd:	8e e0                	mov    %eax,%fs
  3614df:	8e e8                	mov    %eax,%gs
  3614e1:	e4 a1                	in     $0xa1,%al
  3614e3:	0c 20                	or     $0x20,%al
  3614e5:	e6 a1                	out    %al,$0xa1
  3614e7:	b0 20                	mov    $0x20,%al
  3614e9:	e6 20                	out    %al,$0x20
  3614eb:	eb 00                	jmp    3614ed <hwint13+0x20>
  3614ed:	e6 a0                	out    %al,$0xa0
  3614ef:	fb                   	sti    
  3614f0:	6a 0d                	push   $0xd
  3614f2:	e8 4b 82 00 00       	call   369742 <irq_handler>
  3614f7:	83 c4 04             	add    $0x4,%esp
  3614fa:	fa                   	cli    
  3614fb:	e4 a1                	in     $0xa1,%al
  3614fd:	24 df                	and    $0xdf,%al
  3614ff:	e6 a1                	out    %al,$0xa1
  361501:	0f a9                	pop    %gs
  361503:	0f a1                	pop    %fs
  361505:	1f                   	pop    %ds
  361506:	07                   	pop    %es
  361507:	61                   	popa   
  361508:	cf                   	iret   

00361509 <hwint14>:
  361509:	60                   	pusha  
  36150a:	06                   	push   %es
  36150b:	1e                   	push   %ds
  36150c:	0f a0                	push   %fs
  36150e:	0f a8                	push   %gs
  361510:	b8 10 00 00 00       	mov    $0x10,%eax
  361515:	8e d8                	mov    %eax,%ds
  361517:	8e c0                	mov    %eax,%es
  361519:	8e e0                	mov    %eax,%fs
  36151b:	8e e8                	mov    %eax,%gs
  36151d:	e4 a1                	in     $0xa1,%al
  36151f:	0c 40                	or     $0x40,%al
  361521:	e6 a1                	out    %al,$0xa1
  361523:	b0 20                	mov    $0x20,%al
  361525:	e6 20                	out    %al,$0x20
  361527:	eb 00                	jmp    361529 <hwint14+0x20>
  361529:	e6 a0                	out    %al,$0xa0
  36152b:	fb                   	sti    
  36152c:	6a 0e                	push   $0xe
  36152e:	e8 0f 82 00 00       	call   369742 <irq_handler>
  361533:	83 c4 04             	add    $0x4,%esp
  361536:	fa                   	cli    
  361537:	e4 a1                	in     $0xa1,%al
  361539:	24 bf                	and    $0xbf,%al
  36153b:	e6 a1                	out    %al,$0xa1
  36153d:	0f a9                	pop    %gs
  36153f:	0f a1                	pop    %fs
  361541:	1f                   	pop    %ds
  361542:	07                   	pop    %es
  361543:	61                   	popa   
  361544:	cf                   	iret   

00361545 <hwint15>:
  361545:	60                   	pusha  
  361546:	06                   	push   %es
  361547:	1e                   	push   %ds
  361548:	0f a0                	push   %fs
  36154a:	0f a8                	push   %gs
  36154c:	b8 10 00 00 00       	mov    $0x10,%eax
  361551:	8e d8                	mov    %eax,%ds
  361553:	8e c0                	mov    %eax,%es
  361555:	8e e0                	mov    %eax,%fs
  361557:	8e e8                	mov    %eax,%gs
  361559:	e4 a1                	in     $0xa1,%al
  36155b:	0c 80                	or     $0x80,%al
  36155d:	e6 a1                	out    %al,$0xa1
  36155f:	b0 20                	mov    $0x20,%al
  361561:	e6 20                	out    %al,$0x20
  361563:	eb 00                	jmp    361565 <hwint15+0x20>
  361565:	e6 a0                	out    %al,$0xa0
  361567:	fb                   	sti    
  361568:	6a 0f                	push   $0xf
  36156a:	e8 d3 81 00 00       	call   369742 <irq_handler>
  36156f:	83 c4 04             	add    $0x4,%esp
  361572:	fa                   	cli    
  361573:	e4 a1                	in     $0xa1,%al
  361575:	24 7f                	and    $0x7f,%al
  361577:	e6 a1                	out    %al,$0xa1
  361579:	0f a9                	pop    %gs
  36157b:	0f a1                	pop    %fs
  36157d:	1f                   	pop    %ds
  36157e:	07                   	pop    %es
  36157f:	61                   	popa   
  361580:	cf                   	iret   

00361581 <bad_sys_call>:
  361581:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  361586:	fb                   	sti    
  361587:	cf                   	iret   

00361588 <method>:
  361588:	56                   	push   %esi
  361589:	57                   	push   %edi
  36158a:	52                   	push   %edx
  36158b:	51                   	push   %ecx
  36158c:	53                   	push   %ebx
  36158d:	ff d0                	call   *%eax
  36158f:	83 c4 14             	add    $0x14,%esp
  361592:	b8 00 00 00 00       	mov    $0x0,%eax
  361597:	cd 80                	int    $0x80

00361599 <_workloop>:
  361599:	1e                   	push   %ds
  36159a:	06                   	push   %es
  36159b:	b8 10 00 00 00       	mov    $0x10,%eax
  3615a0:	8e d8                	mov    %eax,%ds
  3615a2:	8e c0                	mov    %eax,%es
  3615a4:	e8 b6 8e 00 00       	call   36a45f <doloop>
  3615a9:	07                   	pop    %es
  3615aa:	1f                   	pop    %ds
  3615ab:	83 c4 04             	add    $0x4,%esp
  3615ae:	68 88 15 36 00       	push   $0x361588
  3615b3:	fb                   	sti    
  3615b4:	cf                   	iret   

003615b5 <sys_call>:
  3615b5:	fa                   	cli    
  3615b6:	3b 05 94 30 37 00    	cmp    0x373094,%eax
  3615bc:	73 c3                	jae    361581 <bad_sys_call>
  3615be:	83 f8 00             	cmp    $0x0,%eax
  3615c1:	74 d6                	je     361599 <_workloop>
  3615c3:	1e                   	push   %ds
  3615c4:	06                   	push   %es
  3615c5:	0f a0                	push   %fs
  3615c7:	56                   	push   %esi
  3615c8:	57                   	push   %edi
  3615c9:	52                   	push   %edx
  3615ca:	51                   	push   %ecx
  3615cb:	53                   	push   %ebx
  3615cc:	50                   	push   %eax
  3615cd:	b8 10 00 00 00       	mov    $0x10,%eax
  3615d2:	8e d8                	mov    %eax,%ds
  3615d4:	8e c0                	mov    %eax,%es
  3615d6:	8e e0                	mov    %eax,%fs
  3615d8:	58                   	pop    %eax
  3615d9:	ff 14 85 80 30 37 00 	call   *0x373080(,%eax,4)

003615e0 <ret_from_sys_call>:
  3615e0:	5b                   	pop    %ebx
  3615e1:	59                   	pop    %ecx
  3615e2:	5a                   	pop    %edx
  3615e3:	5f                   	pop    %edi
  3615e4:	5e                   	pop    %esi
  3615e5:	0f a1                	pop    %fs
  3615e7:	07                   	pop    %es
  3615e8:	1f                   	pop    %ds
  3615e9:	fb                   	sti    
  3615ea:	cf                   	iret   

003615eb <INIT_LIST_HEAD>:
  3615eb:	55                   	push   %ebp
  3615ec:	89 e5                	mov    %esp,%ebp
  3615ee:	8b 45 08             	mov    0x8(%ebp),%eax
  3615f1:	8b 55 08             	mov    0x8(%ebp),%edx
  3615f4:	89 10                	mov    %edx,(%eax)
  3615f6:	8b 45 08             	mov    0x8(%ebp),%eax
  3615f9:	8b 55 08             	mov    0x8(%ebp),%edx
  3615fc:	89 50 04             	mov    %edx,0x4(%eax)
  3615ff:	5d                   	pop    %ebp
  361600:	c3                   	ret    

00361601 <__list_add>:
  361601:	55                   	push   %ebp
  361602:	89 e5                	mov    %esp,%ebp
  361604:	8b 45 10             	mov    0x10(%ebp),%eax
  361607:	8b 55 08             	mov    0x8(%ebp),%edx
  36160a:	89 50 04             	mov    %edx,0x4(%eax)
  36160d:	8b 45 08             	mov    0x8(%ebp),%eax
  361610:	8b 55 10             	mov    0x10(%ebp),%edx
  361613:	89 10                	mov    %edx,(%eax)
  361615:	8b 45 08             	mov    0x8(%ebp),%eax
  361618:	8b 55 0c             	mov    0xc(%ebp),%edx
  36161b:	89 50 04             	mov    %edx,0x4(%eax)
  36161e:	8b 45 0c             	mov    0xc(%ebp),%eax
  361621:	8b 55 08             	mov    0x8(%ebp),%edx
  361624:	89 10                	mov    %edx,(%eax)
  361626:	5d                   	pop    %ebp
  361627:	c3                   	ret    

00361628 <list_add>:
  361628:	55                   	push   %ebp
  361629:	89 e5                	mov    %esp,%ebp
  36162b:	8b 45 0c             	mov    0xc(%ebp),%eax
  36162e:	8b 00                	mov    (%eax),%eax
  361630:	50                   	push   %eax
  361631:	ff 75 0c             	pushl  0xc(%ebp)
  361634:	ff 75 08             	pushl  0x8(%ebp)
  361637:	e8 c5 ff ff ff       	call   361601 <__list_add>
  36163c:	83 c4 0c             	add    $0xc,%esp
  36163f:	c9                   	leave  
  361640:	c3                   	ret    

00361641 <strcpy>:
  361641:	55                   	push   %ebp
  361642:	89 e5                	mov    %esp,%ebp
  361644:	57                   	push   %edi
  361645:	56                   	push   %esi
  361646:	8b 55 0c             	mov    0xc(%ebp),%edx
  361649:	8b 4d 08             	mov    0x8(%ebp),%ecx
  36164c:	89 d6                	mov    %edx,%esi
  36164e:	89 cf                	mov    %ecx,%edi
  361650:	fc                   	cld    
  361651:	ac                   	lods   %ds:(%esi),%al
  361652:	aa                   	stos   %al,%es:(%edi)
  361653:	84 c0                	test   %al,%al
  361655:	75 fa                	jne    361651 <strcpy+0x10>
  361657:	8b 45 08             	mov    0x8(%ebp),%eax
  36165a:	5e                   	pop    %esi
  36165b:	5f                   	pop    %edi
  36165c:	5d                   	pop    %ebp
  36165d:	c3                   	ret    

0036165e <memcpy>:
  36165e:	55                   	push   %ebp
  36165f:	89 e5                	mov    %esp,%ebp
  361661:	57                   	push   %edi
  361662:	56                   	push   %esi
  361663:	53                   	push   %ebx
  361664:	8b 45 10             	mov    0x10(%ebp),%eax
  361667:	8b 55 0c             	mov    0xc(%ebp),%edx
  36166a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36166d:	89 c1                	mov    %eax,%ecx
  36166f:	89 d6                	mov    %edx,%esi
  361671:	89 df                	mov    %ebx,%edi
  361673:	fc                   	cld    
  361674:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  361676:	8b 45 08             	mov    0x8(%ebp),%eax
  361679:	5b                   	pop    %ebx
  36167a:	5e                   	pop    %esi
  36167b:	5f                   	pop    %edi
  36167c:	5d                   	pop    %ebp
  36167d:	c3                   	ret    

0036167e <mkvm>:
  36167e:	55                   	push   %ebp
  36167f:	89 e5                	mov    %esp,%ebp
  361681:	57                   	push   %edi
  361682:	81 ec b4 00 00 00    	sub    $0xb4,%esp
  361688:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  36168f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  361696:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36169d:	8b 45 0c             	mov    0xc(%ebp),%eax
  3616a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3616a3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  3616aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3616ad:	8b 00                	mov    (%eax),%eax
  3616af:	50                   	push   %eax
  3616b0:	ff 75 18             	pushl  0x18(%ebp)
  3616b3:	e8 89 ff ff ff       	call   361641 <strcpy>
  3616b8:	83 c4 08             	add    $0x8,%esp
  3616bb:	83 ec 04             	sub    $0x4,%esp
  3616be:	6a 34                	push   $0x34
  3616c0:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
  3616c6:	50                   	push   %eax
  3616c7:	ff 75 08             	pushl  0x8(%ebp)
  3616ca:	e8 0f a6 00 00       	call   36bcde <read>
  3616cf:	83 c4 10             	add    $0x10,%esp
  3616d2:	89 45 dc             	mov    %eax,-0x24(%ebp)
  3616d5:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  3616d9:	79 1c                	jns    3616f7 <mkvm+0x79>
  3616db:	83 ec 04             	sub    $0x4,%esp
  3616de:	6a 19                	push   $0x19
  3616e0:	68 80 cf 36 00       	push   $0x36cf80
  3616e5:	68 88 cf 36 00       	push   $0x36cf88
  3616ea:	e8 99 79 00 00       	call   369088 <printk>
  3616ef:	83 c4 10             	add    $0x10,%esp
  3616f2:	e9 72 02 00 00       	jmp    361969 <mkvm+0x2eb>
  3616f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3616fa:	89 45 e0             	mov    %eax,-0x20(%ebp)
  3616fd:	8d 55 84             	lea    -0x7c(%ebp),%edx
  361700:	b8 00 00 00 00       	mov    $0x0,%eax
  361705:	b9 11 00 00 00       	mov    $0x11,%ecx
  36170a:	89 d7                	mov    %edx,%edi
  36170c:	f3 ab                	rep stos %eax,%es:(%edi)
  36170e:	c7 45 84 10 00 00 00 	movl   $0x10,-0x7c(%ebp)
  361715:	c7 45 88 10 00 00 00 	movl   $0x10,-0x78(%ebp)
  36171c:	c7 45 8c 10 00 00 00 	movl   $0x10,-0x74(%ebp)
  361723:	c7 45 90 10 00 00 00 	movl   $0x10,-0x70(%ebp)
  36172a:	8b 45 10             	mov    0x10(%ebp),%eax
  36172d:	89 45 ac             	mov    %eax,-0x54(%ebp)
  361730:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  361733:	89 45 b0             	mov    %eax,-0x50(%ebp)
  361736:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
  36173c:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  36173f:	c7 45 b8 08 00 00 00 	movl   $0x8,-0x48(%ebp)
  361746:	c7 45 bc 00 02 00 00 	movl   $0x200,-0x44(%ebp)
  36174d:	83 ec 04             	sub    $0x4,%esp
  361750:	6a 44                	push   $0x44
  361752:	8d 45 84             	lea    -0x7c(%ebp),%eax
  361755:	50                   	push   %eax
  361756:	ff 75 14             	pushl  0x14(%ebp)
  361759:	e8 00 ff ff ff       	call   36165e <memcpy>
  36175e:	83 c4 10             	add    $0x10,%esp
  361761:	0f b7 85 7a ff ff ff 	movzwl -0x86(%ebp),%eax
  361768:	0f b7 d0             	movzwl %ax,%edx
  36176b:	0f b7 85 7c ff ff ff 	movzwl -0x84(%ebp),%eax
  361772:	0f b7 c0             	movzwl %ax,%eax
  361775:	0f af c2             	imul   %edx,%eax
  361778:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36177b:	83 ec 0c             	sub    $0xc,%esp
  36177e:	ff 75 e8             	pushl  -0x18(%ebp)
  361781:	e8 ad 9f 00 00       	call   36b733 <kalloc>
  361786:	83 c4 10             	add    $0x10,%esp
  361789:	89 45 d8             	mov    %eax,-0x28(%ebp)
  36178c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  361790:	75 1c                	jne    3617ae <mkvm+0x130>
  361792:	83 ec 04             	sub    $0x4,%esp
  361795:	6a 26                	push   $0x26
  361797:	68 80 cf 36 00       	push   $0x36cf80
  36179c:	68 b8 cf 36 00       	push   $0x36cfb8
  3617a1:	e8 e2 78 00 00       	call   369088 <printk>
  3617a6:	83 c4 10             	add    $0x10,%esp
  3617a9:	e9 bb 01 00 00       	jmp    361969 <mkvm+0x2eb>
  3617ae:	8b 45 d8             	mov    -0x28(%ebp),%eax
  3617b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3617b4:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
  3617ba:	83 ec 04             	sub    $0x4,%esp
  3617bd:	6a 00                	push   $0x0
  3617bf:	50                   	push   %eax
  3617c0:	ff 75 08             	pushl  0x8(%ebp)
  3617c3:	e8 8e a4 00 00       	call   36bc56 <lseek>
  3617c8:	83 c4 10             	add    $0x10,%esp
  3617cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3617ce:	83 ec 04             	sub    $0x4,%esp
  3617d1:	50                   	push   %eax
  3617d2:	ff 75 ec             	pushl  -0x14(%ebp)
  3617d5:	ff 75 08             	pushl  0x8(%ebp)
  3617d8:	e8 01 a5 00 00       	call   36bcde <read>
  3617dd:	83 c4 10             	add    $0x10,%esp
  3617e0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  3617e3:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  3617e7:	79 1c                	jns    361805 <mkvm+0x187>
  3617e9:	83 ec 04             	sub    $0x4,%esp
  3617ec:	6a 28                	push   $0x28
  3617ee:	68 80 cf 36 00       	push   $0x36cf80
  3617f3:	68 dc cf 36 00       	push   $0x36cfdc
  3617f8:	e8 8b 78 00 00       	call   369088 <printk>
  3617fd:	83 c4 10             	add    $0x10,%esp
  361800:	e9 64 01 00 00       	jmp    361969 <mkvm+0x2eb>
  361805:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  361808:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36180b:	83 ec 0c             	sub    $0xc,%esp
  36180e:	6a 10                	push   $0x10
  361810:	e8 1e 9f 00 00       	call   36b733 <kalloc>
  361815:	83 c4 10             	add    $0x10,%esp
  361818:	89 45 d0             	mov    %eax,-0x30(%ebp)
  36181b:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  36181f:	75 1c                	jne    36183d <mkvm+0x1bf>
  361821:	83 ec 04             	sub    $0x4,%esp
  361824:	6a 2a                	push   $0x2a
  361826:	68 80 cf 36 00       	push   $0x36cf80
  36182b:	68 04 d0 36 00       	push   $0x36d004
  361830:	e8 53 78 00 00       	call   369088 <printk>
  361835:	83 c4 10             	add    $0x10,%esp
  361838:	e9 2c 01 00 00       	jmp    361969 <mkvm+0x2eb>
  36183d:	8b 45 d0             	mov    -0x30(%ebp),%eax
  361840:	89 45 f4             	mov    %eax,-0xc(%ebp)
  361843:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361846:	8b 55 08             	mov    0x8(%ebp),%edx
  361849:	89 50 04             	mov    %edx,0x4(%eax)
  36184c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36184f:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  361855:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361858:	83 c0 08             	add    $0x8,%eax
  36185b:	83 ec 0c             	sub    $0xc,%esp
  36185e:	50                   	push   %eax
  36185f:	e8 87 fd ff ff       	call   3615eb <INIT_LIST_HEAD>
  361864:	83 c4 10             	add    $0x10,%esp
  361867:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  36186e:	e9 de 00 00 00       	jmp    361951 <mkvm+0x2d3>
  361873:	8b 45 f0             	mov    -0x10(%ebp),%eax
  361876:	c1 e0 05             	shl    $0x5,%eax
  361879:	89 c2                	mov    %eax,%edx
  36187b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36187e:	01 d0                	add    %edx,%eax
  361880:	8b 00                	mov    (%eax),%eax
  361882:	83 f8 01             	cmp    $0x1,%eax
  361885:	0f 85 c2 00 00 00    	jne    36194d <mkvm+0x2cf>
  36188b:	83 ec 0c             	sub    $0xc,%esp
  36188e:	6a 1c                	push   $0x1c
  361890:	e8 9e 9e 00 00       	call   36b733 <kalloc>
  361895:	83 c4 10             	add    $0x10,%esp
  361898:	89 45 cc             	mov    %eax,-0x34(%ebp)
  36189b:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
  36189f:	75 1c                	jne    3618bd <mkvm+0x23f>
  3618a1:	83 ec 04             	sub    $0x4,%esp
  3618a4:	6a 30                	push   $0x30
  3618a6:	68 80 cf 36 00       	push   $0x36cf80
  3618ab:	68 30 d0 36 00       	push   $0x36d030
  3618b0:	e8 d3 77 00 00       	call   369088 <printk>
  3618b5:	83 c4 10             	add    $0x10,%esp
  3618b8:	e9 ac 00 00 00       	jmp    361969 <mkvm+0x2eb>
  3618bd:	8b 45 cc             	mov    -0x34(%ebp),%eax
  3618c0:	89 45 c8             	mov    %eax,-0x38(%ebp)
  3618c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3618c6:	c1 e0 05             	shl    $0x5,%eax
  3618c9:	89 c2                	mov    %eax,%edx
  3618cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3618ce:	01 d0                	add    %edx,%eax
  3618d0:	8b 50 18             	mov    0x18(%eax),%edx
  3618d3:	8b 45 c8             	mov    -0x38(%ebp),%eax
  3618d6:	89 10                	mov    %edx,(%eax)
  3618d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3618db:	c1 e0 05             	shl    $0x5,%eax
  3618de:	89 c2                	mov    %eax,%edx
  3618e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3618e3:	01 d0                	add    %edx,%eax
  3618e5:	8b 40 08             	mov    0x8(%eax),%eax
  3618e8:	89 c2                	mov    %eax,%edx
  3618ea:	8b 45 c8             	mov    -0x38(%ebp),%eax
  3618ed:	89 50 04             	mov    %edx,0x4(%eax)
  3618f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3618f3:	c1 e0 05             	shl    $0x5,%eax
  3618f6:	89 c2                	mov    %eax,%edx
  3618f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3618fb:	01 d0                	add    %edx,%eax
  3618fd:	8b 40 04             	mov    0x4(%eax),%eax
  361900:	89 c2                	mov    %eax,%edx
  361902:	8b 45 c8             	mov    -0x38(%ebp),%eax
  361905:	89 50 10             	mov    %edx,0x10(%eax)
  361908:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36190b:	c1 e0 05             	shl    $0x5,%eax
  36190e:	89 c2                	mov    %eax,%edx
  361910:	8b 45 ec             	mov    -0x14(%ebp),%eax
  361913:	01 d0                	add    %edx,%eax
  361915:	8b 50 14             	mov    0x14(%eax),%edx
  361918:	8b 45 c8             	mov    -0x38(%ebp),%eax
  36191b:	89 50 08             	mov    %edx,0x8(%eax)
  36191e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  361921:	c1 e0 05             	shl    $0x5,%eax
  361924:	89 c2                	mov    %eax,%edx
  361926:	8b 45 ec             	mov    -0x14(%ebp),%eax
  361929:	01 d0                	add    %edx,%eax
  36192b:	8b 50 10             	mov    0x10(%eax),%edx
  36192e:	8b 45 c8             	mov    -0x38(%ebp),%eax
  361931:	89 50 0c             	mov    %edx,0xc(%eax)
  361934:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361937:	8d 50 08             	lea    0x8(%eax),%edx
  36193a:	8b 45 c8             	mov    -0x38(%ebp),%eax
  36193d:	83 c0 14             	add    $0x14,%eax
  361940:	83 ec 08             	sub    $0x8,%esp
  361943:	52                   	push   %edx
  361944:	50                   	push   %eax
  361945:	e8 de fc ff ff       	call   361628 <list_add>
  36194a:	83 c4 10             	add    $0x10,%esp
  36194d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  361951:	0f b7 85 7c ff ff ff 	movzwl -0x84(%ebp),%eax
  361958:	0f b7 c0             	movzwl %ax,%eax
  36195b:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  36195e:	0f 8f 0f ff ff ff    	jg     361873 <mkvm+0x1f5>
  361964:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361967:	eb 30                	jmp    361999 <mkvm+0x31b>
  361969:	83 ec 0c             	sub    $0xc,%esp
  36196c:	ff 75 f4             	pushl  -0xc(%ebp)
  36196f:	e8 2a 00 00 00       	call   36199e <delvm>
  361974:	83 c4 10             	add    $0x10,%esp
  361977:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36197b:	74 10                	je     36198d <mkvm+0x30f>
  36197d:	83 ec 08             	sub    $0x8,%esp
  361980:	6a 00                	push   $0x0
  361982:	ff 75 f4             	pushl  -0xc(%ebp)
  361985:	e8 15 9f 00 00       	call   36b89f <kfree_s>
  36198a:	83 c4 10             	add    $0x10,%esp
  36198d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  361994:	b8 00 00 00 00       	mov    $0x0,%eax
  361999:	8b 7d fc             	mov    -0x4(%ebp),%edi
  36199c:	c9                   	leave  
  36199d:	c3                   	ret    

0036199e <delvm>:
  36199e:	55                   	push   %ebp
  36199f:	89 e5                	mov    %esp,%ebp
  3619a1:	83 ec 18             	sub    $0x18,%esp
  3619a4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  3619a8:	74 79                	je     361a23 <delvm+0x85>
  3619aa:	8b 45 08             	mov    0x8(%ebp),%eax
  3619ad:	8b 00                	mov    (%eax),%eax
  3619af:	8d 50 ff             	lea    -0x1(%eax),%edx
  3619b2:	8b 45 08             	mov    0x8(%ebp),%eax
  3619b5:	89 10                	mov    %edx,(%eax)
  3619b7:	8b 45 08             	mov    0x8(%ebp),%eax
  3619ba:	8b 00                	mov    (%eax),%eax
  3619bc:	85 c0                	test   %eax,%eax
  3619be:	75 63                	jne    361a23 <delvm+0x85>
  3619c0:	8b 45 08             	mov    0x8(%ebp),%eax
  3619c3:	8b 40 04             	mov    0x4(%eax),%eax
  3619c6:	83 ec 0c             	sub    $0xc,%esp
  3619c9:	50                   	push   %eax
  3619ca:	e8 4c ab 00 00       	call   36c51b <close>
  3619cf:	83 c4 10             	add    $0x10,%esp
  3619d2:	8b 45 08             	mov    0x8(%ebp),%eax
  3619d5:	83 c0 08             	add    $0x8,%eax
  3619d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3619db:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3619de:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3619e1:	eb 28                	jmp    361a0b <delvm+0x6d>
  3619e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3619e6:	8b 00                	mov    (%eax),%eax
  3619e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3619eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3619ee:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3619f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3619f4:	83 e8 14             	sub    $0x14,%eax
  3619f7:	83 ec 08             	sub    $0x8,%esp
  3619fa:	6a 00                	push   $0x0
  3619fc:	50                   	push   %eax
  3619fd:	e8 9d 9e 00 00       	call   36b89f <kfree_s>
  361a02:	83 c4 10             	add    $0x10,%esp
  361a05:	8b 45 ec             	mov    -0x14(%ebp),%eax
  361a08:	89 45 f4             	mov    %eax,-0xc(%ebp)
  361a0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361a0e:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  361a11:	75 d0                	jne    3619e3 <delvm+0x45>
  361a13:	83 ec 08             	sub    $0x8,%esp
  361a16:	6a 00                	push   $0x0
  361a18:	ff 75 08             	pushl  0x8(%ebp)
  361a1b:	e8 7f 9e 00 00       	call   36b89f <kfree_s>
  361a20:	83 c4 10             	add    $0x10,%esp
  361a23:	c9                   	leave  
  361a24:	c3                   	ret    

00361a25 <copyvm>:
  361a25:	55                   	push   %ebp
  361a26:	89 e5                	mov    %esp,%ebp
  361a28:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  361a2c:	74 0d                	je     361a3b <copyvm+0x16>
  361a2e:	8b 45 08             	mov    0x8(%ebp),%eax
  361a31:	8b 00                	mov    (%eax),%eax
  361a33:	8d 50 ff             	lea    -0x1(%eax),%edx
  361a36:	8b 45 08             	mov    0x8(%ebp),%eax
  361a39:	89 10                	mov    %edx,(%eax)
  361a3b:	5d                   	pop    %ebp
  361a3c:	c3                   	ret    

00361a3d <clr>:
  361a3d:	55                   	push   %ebp
  361a3e:	89 e5                	mov    %esp,%ebp
  361a40:	83 ec 10             	sub    $0x10,%esp
  361a43:	8b 55 0c             	mov    0xc(%ebp),%edx
  361a46:	8b 45 08             	mov    0x8(%ebp),%eax
  361a49:	8b 40 04             	mov    0x4(%eax),%eax
  361a4c:	29 c2                	sub    %eax,%edx
  361a4e:	89 d0                	mov    %edx,%eax
  361a50:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  361a55:	89 45 fc             	mov    %eax,-0x4(%ebp)
  361a58:	8b 55 fc             	mov    -0x4(%ebp),%edx
  361a5b:	8b 45 08             	mov    0x8(%ebp),%eax
  361a5e:	8b 40 0c             	mov    0xc(%eax),%eax
  361a61:	39 c2                	cmp    %eax,%edx
  361a63:	76 07                	jbe    361a6c <clr+0x2f>
  361a65:	b8 00 00 00 00       	mov    $0x0,%eax
  361a6a:	eb 26                	jmp    361a92 <clr+0x55>
  361a6c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  361a6f:	05 00 10 00 00       	add    $0x1000,%eax
  361a74:	89 c2                	mov    %eax,%edx
  361a76:	8b 45 08             	mov    0x8(%ebp),%eax
  361a79:	8b 40 0c             	mov    0xc(%eax),%eax
  361a7c:	39 c2                	cmp    %eax,%edx
  361a7e:	76 0d                	jbe    361a8d <clr+0x50>
  361a80:	8b 45 08             	mov    0x8(%ebp),%eax
  361a83:	8b 40 0c             	mov    0xc(%eax),%eax
  361a86:	25 ff 0f 00 00       	and    $0xfff,%eax
  361a8b:	eb 05                	jmp    361a92 <clr+0x55>
  361a8d:	b8 00 10 00 00       	mov    $0x1000,%eax
  361a92:	c9                   	leave  
  361a93:	c3                   	ret    

00361a94 <dovm>:
  361a94:	55                   	push   %ebp
  361a95:	89 e5                	mov    %esp,%ebp
  361a97:	83 ec 28             	sub    $0x28,%esp
  361a9a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  361a9e:	0f 84 23 01 00 00    	je     361bc7 <dovm+0x133>
  361aa4:	e8 6c 97 00 00       	call   36b215 <get_free_page>
  361aa9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  361aac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  361ab0:	75 1c                	jne    361ace <dovm+0x3a>
  361ab2:	83 ec 04             	sub    $0x4,%esp
  361ab5:	6a 60                	push   $0x60
  361ab7:	68 80 cf 36 00       	push   $0x36cf80
  361abc:	68 58 d0 36 00       	push   $0x36d058
  361ac1:	e8 c2 75 00 00       	call   369088 <printk>
  361ac6:	83 c4 10             	add    $0x10,%esp
  361ac9:	e9 f9 00 00 00       	jmp    361bc7 <dovm+0x133>
  361ace:	8b 45 f0             	mov    -0x10(%ebp),%eax
  361ad1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  361ad4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  361adb:	8b 45 08             	mov    0x8(%ebp),%eax
  361ade:	83 c0 08             	add    $0x8,%eax
  361ae1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  361ae4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  361ae7:	8b 00                	mov    (%eax),%eax
  361ae9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  361aec:	e9 c5 00 00 00       	jmp    361bb6 <dovm+0x122>
  361af1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361af4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  361af7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  361afa:	83 e8 14             	sub    $0x14,%eax
  361afd:	89 45 dc             	mov    %eax,-0x24(%ebp)
  361b00:	8b 45 dc             	mov    -0x24(%ebp),%eax
  361b03:	8b 40 04             	mov    0x4(%eax),%eax
  361b06:	3b 45 0c             	cmp    0xc(%ebp),%eax
  361b09:	0f 87 9f 00 00 00    	ja     361bae <dovm+0x11a>
  361b0f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  361b12:	8b 50 04             	mov    0x4(%eax),%edx
  361b15:	8b 45 dc             	mov    -0x24(%ebp),%eax
  361b18:	8b 40 08             	mov    0x8(%eax),%eax
  361b1b:	01 d0                	add    %edx,%eax
  361b1d:	3b 45 0c             	cmp    0xc(%ebp),%eax
  361b20:	0f 86 88 00 00 00    	jbe    361bae <dovm+0x11a>
  361b26:	83 ec 08             	sub    $0x8,%esp
  361b29:	ff 75 0c             	pushl  0xc(%ebp)
  361b2c:	ff 75 dc             	pushl  -0x24(%ebp)
  361b2f:	e8 09 ff ff ff       	call   361a3d <clr>
  361b34:	83 c4 10             	add    $0x10,%esp
  361b37:	89 45 e8             	mov    %eax,-0x18(%ebp)
  361b3a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  361b3e:	74 6c                	je     361bac <dovm+0x118>
  361b40:	8b 45 dc             	mov    -0x24(%ebp),%eax
  361b43:	8b 50 10             	mov    0x10(%eax),%edx
  361b46:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  361b49:	8b 45 dc             	mov    -0x24(%ebp),%eax
  361b4c:	8b 40 04             	mov    0x4(%eax),%eax
  361b4f:	29 c1                	sub    %eax,%ecx
  361b51:	89 c8                	mov    %ecx,%eax
  361b53:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  361b58:	01 c2                	add    %eax,%edx
  361b5a:	8b 45 08             	mov    0x8(%ebp),%eax
  361b5d:	8b 40 04             	mov    0x4(%eax),%eax
  361b60:	83 ec 04             	sub    $0x4,%esp
  361b63:	6a 00                	push   $0x0
  361b65:	52                   	push   %edx
  361b66:	50                   	push   %eax
  361b67:	e8 ea a0 00 00       	call   36bc56 <lseek>
  361b6c:	83 c4 10             	add    $0x10,%esp
  361b6f:	8b 55 e8             	mov    -0x18(%ebp),%edx
  361b72:	8b 45 08             	mov    0x8(%ebp),%eax
  361b75:	8b 40 04             	mov    0x4(%eax),%eax
  361b78:	83 ec 04             	sub    $0x4,%esp
  361b7b:	52                   	push   %edx
  361b7c:	ff 75 ec             	pushl  -0x14(%ebp)
  361b7f:	50                   	push   %eax
  361b80:	e8 59 a1 00 00       	call   36bcde <read>
  361b85:	83 c4 10             	add    $0x10,%esp
  361b88:	89 45 d8             	mov    %eax,-0x28(%ebp)
  361b8b:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  361b8f:	79 19                	jns    361baa <dovm+0x116>
  361b91:	83 ec 04             	sub    $0x4,%esp
  361b94:	6a 69                	push   $0x69
  361b96:	68 80 cf 36 00       	push   $0x36cf80
  361b9b:	68 7c d0 36 00       	push   $0x36d07c
  361ba0:	e8 e3 74 00 00       	call   369088 <printk>
  361ba5:	83 c4 10             	add    $0x10,%esp
  361ba8:	eb 1d                	jmp    361bc7 <dovm+0x133>
  361baa:	eb 16                	jmp    361bc2 <dovm+0x12e>
  361bac:	eb 14                	jmp    361bc2 <dovm+0x12e>
  361bae:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361bb1:	8b 00                	mov    (%eax),%eax
  361bb3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  361bb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361bb9:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  361bbc:	0f 85 2f ff ff ff    	jne    361af1 <dovm+0x5d>
  361bc2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  361bc5:	eb 05                	jmp    361bcc <dovm+0x138>
  361bc7:	b8 00 00 00 00       	mov    $0x0,%eax
  361bcc:	c9                   	leave  
  361bcd:	c3                   	ret    

00361bce <strcpy>:
  361bce:	55                   	push   %ebp
  361bcf:	89 e5                	mov    %esp,%ebp
  361bd1:	57                   	push   %edi
  361bd2:	56                   	push   %esi
  361bd3:	8b 55 0c             	mov    0xc(%ebp),%edx
  361bd6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  361bd9:	89 d6                	mov    %edx,%esi
  361bdb:	89 cf                	mov    %ecx,%edi
  361bdd:	fc                   	cld    
  361bde:	ac                   	lods   %ds:(%esi),%al
  361bdf:	aa                   	stos   %al,%es:(%edi)
  361be0:	84 c0                	test   %al,%al
  361be2:	75 fa                	jne    361bde <strcpy+0x10>
  361be4:	8b 45 08             	mov    0x8(%ebp),%eax
  361be7:	5e                   	pop    %esi
  361be8:	5f                   	pop    %edi
  361be9:	5d                   	pop    %ebp
  361bea:	c3                   	ret    

00361beb <memcpy>:
  361beb:	55                   	push   %ebp
  361bec:	89 e5                	mov    %esp,%ebp
  361bee:	57                   	push   %edi
  361bef:	56                   	push   %esi
  361bf0:	53                   	push   %ebx
  361bf1:	8b 45 10             	mov    0x10(%ebp),%eax
  361bf4:	8b 55 0c             	mov    0xc(%ebp),%edx
  361bf7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  361bfa:	89 c1                	mov    %eax,%ecx
  361bfc:	89 d6                	mov    %edx,%esi
  361bfe:	89 df                	mov    %ebx,%edi
  361c00:	fc                   	cld    
  361c01:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  361c03:	8b 45 08             	mov    0x8(%ebp),%eax
  361c06:	5b                   	pop    %ebx
  361c07:	5e                   	pop    %esi
  361c08:	5f                   	pop    %edi
  361c09:	5d                   	pop    %ebp
  361c0a:	c3                   	ret    

00361c0b <memset>:
  361c0b:	55                   	push   %ebp
  361c0c:	89 e5                	mov    %esp,%ebp
  361c0e:	57                   	push   %edi
  361c0f:	8b 45 0c             	mov    0xc(%ebp),%eax
  361c12:	8b 55 08             	mov    0x8(%ebp),%edx
  361c15:	8b 4d 10             	mov    0x10(%ebp),%ecx
  361c18:	89 d7                	mov    %edx,%edi
  361c1a:	fc                   	cld    
  361c1b:	f3 aa                	rep stos %al,%es:(%edi)
  361c1d:	8b 45 08             	mov    0x8(%ebp),%eax
  361c20:	5f                   	pop    %edi
  361c21:	5d                   	pop    %ebp
  361c22:	c3                   	ret    

00361c23 <share_items>:
  361c23:	55                   	push   %ebp
  361c24:	89 e5                	mov    %esp,%ebp
  361c26:	83 ec 18             	sub    $0x18,%esp
  361c29:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  361c30:	eb 3a                	jmp    361c6c <share_items+0x49>
  361c32:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361c35:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  361c3c:	8b 45 08             	mov    0x8(%ebp),%eax
  361c3f:	01 d0                	add    %edx,%eax
  361c41:	0f b6 00             	movzbl (%eax),%eax
  361c44:	83 e0 01             	and    $0x1,%eax
  361c47:	84 c0                	test   %al,%al
  361c49:	74 1d                	je     361c68 <share_items+0x45>
  361c4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361c4e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  361c55:	8b 45 08             	mov    0x8(%ebp),%eax
  361c58:	01 d0                	add    %edx,%eax
  361c5a:	8b 00                	mov    (%eax),%eax
  361c5c:	83 ec 0c             	sub    $0xc,%esp
  361c5f:	50                   	push   %eax
  361c60:	e8 83 96 00 00       	call   36b2e8 <share_page>
  361c65:	83 c4 10             	add    $0x10,%esp
  361c68:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  361c6c:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  361c73:	7e bd                	jle    361c32 <share_items+0xf>
  361c75:	c9                   	leave  
  361c76:	c3                   	ret    

00361c77 <copy_dir>:
  361c77:	55                   	push   %ebp
  361c78:	89 e5                	mov    %esp,%ebp
  361c7a:	57                   	push   %edi
  361c7b:	56                   	push   %esi
  361c7c:	83 ec 10             	sub    $0x10,%esp
  361c7f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  361c86:	e8 8a 95 00 00       	call   36b215 <get_free_page>
  361c8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  361c8e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  361c92:	75 10                	jne    361ca4 <copy_dir+0x2d>
  361c94:	83 ec 0c             	sub    $0xc,%esp
  361c97:	68 b0 d0 36 00       	push   $0x36d0b0
  361c9c:	e8 cb 73 00 00       	call   36906c <panic>
  361ca1:	83 c4 10             	add    $0x10,%esp
  361ca4:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
  361cab:	eb 73                	jmp    361d20 <copy_dir+0xa9>
  361cad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361cb0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  361cb7:	8b 45 08             	mov    0x8(%ebp),%eax
  361cba:	01 d0                	add    %edx,%eax
  361cbc:	0f b6 10             	movzbl (%eax),%edx
  361cbf:	83 e2 fd             	and    $0xfffffffd,%edx
  361cc2:	88 10                	mov    %dl,(%eax)
  361cc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361cc7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  361cce:	8b 45 08             	mov    0x8(%ebp),%eax
  361cd1:	01 d0                	add    %edx,%eax
  361cd3:	0f b6 00             	movzbl (%eax),%eax
  361cd6:	83 e0 01             	and    $0x1,%eax
  361cd9:	84 c0                	test   %al,%al
  361cdb:	74 3f                	je     361d1c <copy_dir+0xa5>
  361cdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361ce0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  361ce7:	8b 45 08             	mov    0x8(%ebp),%eax
  361cea:	01 d0                	add    %edx,%eax
  361cec:	8b 00                	mov    (%eax),%eax
  361cee:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  361cf3:	83 ec 0c             	sub    $0xc,%esp
  361cf6:	50                   	push   %eax
  361cf7:	e8 27 ff ff ff       	call   361c23 <share_items>
  361cfc:	83 c4 10             	add    $0x10,%esp
  361cff:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361d02:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  361d09:	8b 45 08             	mov    0x8(%ebp),%eax
  361d0c:	01 d0                	add    %edx,%eax
  361d0e:	8b 00                	mov    (%eax),%eax
  361d10:	83 ec 0c             	sub    $0xc,%esp
  361d13:	50                   	push   %eax
  361d14:	e8 cf 95 00 00       	call   36b2e8 <share_page>
  361d19:	83 c4 10             	add    $0x10,%esp
  361d1c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  361d20:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  361d27:	7e 84                	jle    361cad <copy_dir+0x36>
  361d29:	8b 45 08             	mov    0x8(%ebp),%eax
  361d2c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  361d2f:	b9 00 04 00 00       	mov    $0x400,%ecx
  361d34:	89 c6                	mov    %eax,%esi
  361d36:	89 d7                	mov    %edx,%edi
  361d38:	fc                   	cld    
  361d39:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  361d3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  361d3e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  361d41:	5e                   	pop    %esi
  361d42:	5f                   	pop    %edi
  361d43:	5d                   	pop    %ebp
  361d44:	c3                   	ret    

00361d45 <put_item>:
  361d45:	55                   	push   %ebp
  361d46:	89 e5                	mov    %esp,%ebp
  361d48:	8b 45 10             	mov    0x10(%ebp),%eax
  361d4b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  361d52:	8b 45 08             	mov    0x8(%ebp),%eax
  361d55:	01 d0                	add    %edx,%eax
  361d57:	8b 55 0c             	mov    0xc(%ebp),%edx
  361d5a:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  361d60:	83 ca 07             	or     $0x7,%edx
  361d63:	89 10                	mov    %edx,(%eax)
  361d65:	5d                   	pop    %ebp
  361d66:	c3                   	ret    

00361d67 <clone_space>:
  361d67:	55                   	push   %ebp
  361d68:	89 e5                	mov    %esp,%ebp
  361d6a:	57                   	push   %edi
  361d6b:	56                   	push   %esi
  361d6c:	83 ec 10             	sub    $0x10,%esp
  361d6f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  361d76:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  361d7d:	8b 45 08             	mov    0x8(%ebp),%eax
  361d80:	8b 00                	mov    (%eax),%eax
  361d82:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  361d87:	89 45 ec             	mov    %eax,-0x14(%ebp)
  361d8a:	83 ec 0c             	sub    $0xc,%esp
  361d8d:	ff 75 08             	pushl  0x8(%ebp)
  361d90:	e8 e2 fe ff ff       	call   361c77 <copy_dir>
  361d95:	83 c4 10             	add    $0x10,%esp
  361d98:	89 45 f4             	mov    %eax,-0xc(%ebp)
  361d9b:	e8 75 94 00 00       	call   36b215 <get_free_page>
  361da0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  361da3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  361da7:	75 17                	jne    361dc0 <clone_space+0x59>
  361da9:	83 ec 04             	sub    $0x4,%esp
  361dac:	6a 49                	push   $0x49
  361dae:	68 ce d0 36 00       	push   $0x36d0ce
  361db3:	68 d8 d0 36 00       	push   $0x36d0d8
  361db8:	e8 cb 72 00 00       	call   369088 <printk>
  361dbd:	83 c4 10             	add    $0x10,%esp
  361dc0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  361dc3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  361dc6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  361dc9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  361dcc:	b9 00 04 00 00       	mov    $0x400,%ecx
  361dd1:	89 c6                	mov    %eax,%esi
  361dd3:	89 d7                	mov    %edx,%edi
  361dd5:	fc                   	cld    
  361dd6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  361dd8:	6a 07                	push   $0x7
  361dda:	6a 02                	push   $0x2
  361ddc:	ff 75 0c             	pushl  0xc(%ebp)
  361ddf:	ff 75 f0             	pushl  -0x10(%ebp)
  361de2:	e8 5e ff ff ff       	call   361d45 <put_item>
  361de7:	83 c4 10             	add    $0x10,%esp
  361dea:	6a 07                	push   $0x7
  361dec:	6a 00                	push   $0x0
  361dee:	ff 75 f0             	pushl  -0x10(%ebp)
  361df1:	ff 75 f4             	pushl  -0xc(%ebp)
  361df4:	e8 4c ff ff ff       	call   361d45 <put_item>
  361df9:	83 c4 10             	add    $0x10,%esp
  361dfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361dff:	8d 65 f8             	lea    -0x8(%ebp),%esp
  361e02:	5e                   	pop    %esi
  361e03:	5f                   	pop    %edi
  361e04:	5d                   	pop    %ebp
  361e05:	c3                   	ret    

00361e06 <clone>:
  361e06:	55                   	push   %ebp
  361e07:	89 e5                	mov    %esp,%ebp
  361e09:	57                   	push   %edi
  361e0a:	56                   	push   %esi
  361e0b:	53                   	push   %ebx
  361e0c:	83 ec 2c             	sub    $0x2c,%esp
  361e0f:	8b 45 08             	mov    0x8(%ebp),%eax
  361e12:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  361e15:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
  361e19:	7f 18                	jg     361e33 <clone+0x2d>
  361e1b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  361e1f:	78 12                	js     361e33 <clone+0x2d>
  361e21:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  361e26:	8b 55 08             	mov    0x8(%ebp),%edx
  361e29:	83 c2 0c             	add    $0xc,%edx
  361e2c:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  361e30:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  361e33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  361e36:	8b 04 85 00 3d 37 00 	mov    0x373d00(,%eax,4),%eax
  361e3d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  361e40:	8b 45 e0             	mov    -0x20(%ebp),%eax
  361e43:	89 45 dc             	mov    %eax,-0x24(%ebp)
  361e46:	83 ec 0c             	sub    $0xc,%esp
  361e49:	ff 75 dc             	pushl  -0x24(%ebp)
  361e4c:	e8 0c 98 00 00       	call   36b65d <cloneObject>
  361e51:	83 c4 10             	add    $0x10,%esp
  361e54:	89 45 d8             	mov    %eax,-0x28(%ebp)
  361e57:	8b 45 d8             	mov    -0x28(%ebp),%eax
  361e5a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  361e5d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  361e61:	75 23                	jne    361e86 <clone+0x80>
  361e63:	b8 02 00 00 00       	mov    $0x2,%eax
  361e68:	8b 5d 08             	mov    0x8(%ebp),%ebx
  361e6b:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  361e70:	ba f4 ff ff ff       	mov    $0xfffffff4,%edx
  361e75:	be 00 00 00 00       	mov    $0x0,%esi
  361e7a:	bf 00 00 00 00       	mov    $0x0,%edi
  361e7f:	cd 80                	int    $0x80
  361e81:	89 45 d0             	mov    %eax,-0x30(%ebp)
  361e84:	eb 7c                	jmp    361f02 <clone+0xfc>
  361e86:	8b 45 dc             	mov    -0x24(%ebp),%eax
  361e89:	8b 80 04 01 00 00    	mov    0x104(%eax),%eax
  361e8f:	83 ec 08             	sub    $0x8,%esp
  361e92:	ff 75 d4             	pushl  -0x2c(%ebp)
  361e95:	50                   	push   %eax
  361e96:	e8 cc fe ff ff       	call   361d67 <clone_space>
  361e9b:	83 c4 10             	add    $0x10,%esp
  361e9e:	89 c2                	mov    %eax,%edx
  361ea0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  361ea3:	89 90 04 01 00 00    	mov    %edx,0x104(%eax)
  361ea9:	8b 45 dc             	mov    -0x24(%ebp),%eax
  361eac:	8b 80 f0 00 00 00    	mov    0xf0(%eax),%eax
  361eb2:	83 ec 0c             	sub    $0xc,%esp
  361eb5:	50                   	push   %eax
  361eb6:	e8 6a fb ff ff       	call   361a25 <copyvm>
  361ebb:	83 c4 10             	add    $0x10,%esp
  361ebe:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  361ec1:	8b 18                	mov    (%eax),%ebx
  361ec3:	b8 02 00 00 00       	mov    $0x2,%eax
  361ec8:	b9 00 00 00 00       	mov    $0x0,%ecx
  361ecd:	ba 00 00 00 00       	mov    $0x0,%edx
  361ed2:	be 00 00 00 00       	mov    $0x0,%esi
  361ed7:	bf 00 00 00 00       	mov    $0x0,%edi
  361edc:	cd 80                	int    $0x80
  361ede:	89 45 cc             	mov    %eax,-0x34(%ebp)
  361ee1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  361ee4:	8b 08                	mov    (%eax),%ecx
  361ee6:	b8 02 00 00 00       	mov    $0x2,%eax
  361eeb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  361eee:	ba 00 00 00 00       	mov    $0x0,%edx
  361ef3:	be 00 00 00 00       	mov    $0x0,%esi
  361ef8:	bf 00 00 00 00       	mov    $0x0,%edi
  361efd:	cd 80                	int    $0x80
  361eff:	89 45 c8             	mov    %eax,-0x38(%ebp)
  361f02:	8d 65 f4             	lea    -0xc(%ebp),%esp
  361f05:	5b                   	pop    %ebx
  361f06:	5e                   	pop    %esi
  361f07:	5f                   	pop    %edi
  361f08:	5d                   	pop    %ebp
  361f09:	c3                   	ret    

00361f0a <delete_table>:
  361f0a:	55                   	push   %ebp
  361f0b:	89 e5                	mov    %esp,%ebp
  361f0d:	83 ec 18             	sub    $0x18,%esp
  361f10:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  361f17:	e9 8d 00 00 00       	jmp    361fa9 <delete_table+0x9f>
  361f1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361f1f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  361f26:	8b 45 08             	mov    0x8(%ebp),%eax
  361f29:	01 d0                	add    %edx,%eax
  361f2b:	0f b6 00             	movzbl (%eax),%eax
  361f2e:	83 e0 01             	and    $0x1,%eax
  361f31:	84 c0                	test   %al,%al
  361f33:	74 70                	je     361fa5 <delete_table+0x9b>
  361f35:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361f38:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  361f3f:	8b 45 08             	mov    0x8(%ebp),%eax
  361f42:	01 d0                	add    %edx,%eax
  361f44:	8b 00                	mov    (%eax),%eax
  361f46:	83 ec 0c             	sub    $0xc,%esp
  361f49:	50                   	push   %eax
  361f4a:	e8 f6 93 00 00       	call   36b345 <free_page>
  361f4f:	83 c4 10             	add    $0x10,%esp
  361f52:	89 45 f0             	mov    %eax,-0x10(%ebp)
  361f55:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  361f59:	75 4a                	jne    361fa5 <delete_table+0x9b>
  361f5b:	83 ec 04             	sub    $0x4,%esp
  361f5e:	6a 64                	push   $0x64
  361f60:	68 ce d0 36 00       	push   $0x36d0ce
  361f65:	68 fc d0 36 00       	push   $0x36d0fc
  361f6a:	e8 19 71 00 00       	call   369088 <printk>
  361f6f:	83 c4 10             	add    $0x10,%esp
  361f72:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361f75:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  361f7c:	8b 45 08             	mov    0x8(%ebp),%eax
  361f7f:	01 d0                	add    %edx,%eax
  361f81:	8b 00                	mov    (%eax),%eax
  361f83:	83 ec 0c             	sub    $0xc,%esp
  361f86:	6a 64                	push   $0x64
  361f88:	68 ce d0 36 00       	push   $0x36d0ce
  361f8d:	50                   	push   %eax
  361f8e:	ff 75 f4             	pushl  -0xc(%ebp)
  361f91:	68 2c d1 36 00       	push   $0x36d12c
  361f96:	e8 ed 70 00 00       	call   369088 <printk>
  361f9b:	83 c4 20             	add    $0x20,%esp
  361f9e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  361fa3:	eb 16                	jmp    361fbb <delete_table+0xb1>
  361fa5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  361fa9:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  361fb0:	0f 8e 66 ff ff ff    	jle    361f1c <delete_table+0x12>
  361fb6:	b8 00 00 00 00       	mov    $0x0,%eax
  361fbb:	c9                   	leave  
  361fbc:	c3                   	ret    

00361fbd <_delete>:
  361fbd:	55                   	push   %ebp
  361fbe:	89 e5                	mov    %esp,%ebp
  361fc0:	83 ec 18             	sub    $0x18,%esp
  361fc3:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
  361fca:	e9 bd 00 00 00       	jmp    36208c <_delete+0xcf>
  361fcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361fd2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  361fd9:	8b 45 08             	mov    0x8(%ebp),%eax
  361fdc:	01 d0                	add    %edx,%eax
  361fde:	0f b6 00             	movzbl (%eax),%eax
  361fe1:	83 e0 01             	and    $0x1,%eax
  361fe4:	84 c0                	test   %al,%al
  361fe6:	0f 84 9c 00 00 00    	je     362088 <_delete+0xcb>
  361fec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  361fef:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  361ff6:	8b 45 08             	mov    0x8(%ebp),%eax
  361ff9:	01 d0                	add    %edx,%eax
  361ffb:	8b 00                	mov    (%eax),%eax
  361ffd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  362002:	83 ec 0c             	sub    $0xc,%esp
  362005:	50                   	push   %eax
  362006:	e8 ff fe ff ff       	call   361f0a <delete_table>
  36200b:	83 c4 10             	add    $0x10,%esp
  36200e:	83 f8 ff             	cmp    $0xffffffff,%eax
  362011:	74 22                	je     362035 <_delete+0x78>
  362013:	8b 45 f4             	mov    -0xc(%ebp),%eax
  362016:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  36201d:	8b 45 08             	mov    0x8(%ebp),%eax
  362020:	01 d0                	add    %edx,%eax
  362022:	8b 00                	mov    (%eax),%eax
  362024:	83 ec 0c             	sub    $0xc,%esp
  362027:	50                   	push   %eax
  362028:	e8 18 93 00 00       	call   36b345 <free_page>
  36202d:	83 c4 10             	add    $0x10,%esp
  362030:	83 f8 ff             	cmp    $0xffffffff,%eax
  362033:	75 3c                	jne    362071 <_delete+0xb4>
  362035:	8b 45 f4             	mov    -0xc(%ebp),%eax
  362038:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  36203f:	8b 45 08             	mov    0x8(%ebp),%eax
  362042:	01 d0                	add    %edx,%eax
  362044:	8b 00                	mov    (%eax),%eax
  362046:	83 ec 0c             	sub    $0xc,%esp
  362049:	6a 71                	push   $0x71
  36204b:	68 ce d0 36 00       	push   $0x36d0ce
  362050:	50                   	push   %eax
  362051:	ff 75 f4             	pushl  -0xc(%ebp)
  362054:	68 54 d1 36 00       	push   $0x36d154
  362059:	e8 2a 70 00 00       	call   369088 <printk>
  36205e:	83 c4 20             	add    $0x20,%esp
  362061:	83 ec 0c             	sub    $0xc,%esp
  362064:	68 7a d1 36 00       	push   $0x36d17a
  362069:	e8 fe 6f 00 00       	call   36906c <panic>
  36206e:	83 c4 10             	add    $0x10,%esp
  362071:	8b 45 f4             	mov    -0xc(%ebp),%eax
  362074:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  36207b:	8b 45 08             	mov    0x8(%ebp),%eax
  36207e:	01 d0                	add    %edx,%eax
  362080:	0f b6 10             	movzbl (%eax),%edx
  362083:	83 e2 fe             	and    $0xfffffffe,%edx
  362086:	88 10                	mov    %dl,(%eax)
  362088:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36208c:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  362093:	0f 8e 36 ff ff ff    	jle    361fcf <_delete+0x12>
  362099:	c9                   	leave  
  36209a:	c3                   	ret    

0036209b <delete>:
  36209b:	55                   	push   %ebp
  36209c:	89 e5                	mov    %esp,%ebp
  36209e:	57                   	push   %edi
  36209f:	56                   	push   %esi
  3620a0:	53                   	push   %ebx
  3620a1:	83 ec 2c             	sub    $0x2c,%esp
  3620a4:	8b 45 08             	mov    0x8(%ebp),%eax
  3620a7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3620aa:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
  3620ae:	7f 18                	jg     3620c8 <delete+0x2d>
  3620b0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  3620b4:	78 12                	js     3620c8 <delete+0x2d>
  3620b6:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  3620bb:	8b 55 08             	mov    0x8(%ebp),%edx
  3620be:	83 c2 0c             	add    $0xc,%edx
  3620c1:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  3620c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3620c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3620cb:	8b 04 85 00 3d 37 00 	mov    0x373d00(,%eax,4),%eax
  3620d2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  3620d5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3620d8:	89 45 dc             	mov    %eax,-0x24(%ebp)
  3620db:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3620de:	8b 80 04 01 00 00    	mov    0x104(%eax),%eax
  3620e4:	89 45 d8             	mov    %eax,-0x28(%ebp)
  3620e7:	83 ec 0c             	sub    $0xc,%esp
  3620ea:	ff 75 d8             	pushl  -0x28(%ebp)
  3620ed:	e8 cb fe ff ff       	call   361fbd <_delete>
  3620f2:	83 c4 10             	add    $0x10,%esp
  3620f5:	8b 45 d8             	mov    -0x28(%ebp),%eax
  3620f8:	83 ec 0c             	sub    $0xc,%esp
  3620fb:	50                   	push   %eax
  3620fc:	e8 44 92 00 00       	call   36b345 <free_page>
  362101:	83 c4 10             	add    $0x10,%esp
  362104:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  362107:	83 7d d4 ff          	cmpl   $0xffffffff,-0x2c(%ebp)
  36210b:	75 27                	jne    362134 <delete+0x99>
  36210d:	83 ec 04             	sub    $0x4,%esp
  362110:	6a 7f                	push   $0x7f
  362112:	68 ce d0 36 00       	push   $0x36d0ce
  362117:	68 8c d1 36 00       	push   $0x36d18c
  36211c:	e8 67 6f 00 00       	call   369088 <printk>
  362121:	83 c4 10             	add    $0x10,%esp
  362124:	83 ec 0c             	sub    $0xc,%esp
  362127:	68 7a d1 36 00       	push   $0x36d17a
  36212c:	e8 3b 6f 00 00       	call   36906c <panic>
  362131:	83 c4 10             	add    $0x10,%esp
  362134:	8b 45 dc             	mov    -0x24(%ebp),%eax
  362137:	8b 80 f0 00 00 00    	mov    0xf0(%eax),%eax
  36213d:	83 ec 0c             	sub    $0xc,%esp
  362140:	50                   	push   %eax
  362141:	e8 58 f8 ff ff       	call   36199e <delvm>
  362146:	83 c4 10             	add    $0x10,%esp
  362149:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36214c:	c7 80 f0 00 00 00 00 	movl   $0x0,0xf0(%eax)
  362153:	00 00 00 
  362156:	8b 45 dc             	mov    -0x24(%ebp),%eax
  362159:	8b 58 0c             	mov    0xc(%eax),%ebx
  36215c:	b8 02 00 00 00       	mov    $0x2,%eax
  362161:	8b 4d 08             	mov    0x8(%ebp),%ecx
  362164:	ba 00 00 00 00       	mov    $0x0,%edx
  362169:	be 00 00 00 00       	mov    $0x0,%esi
  36216e:	bf 00 00 00 00       	mov    $0x0,%edi
  362173:	cd 80                	int    $0x80
  362175:	89 45 d0             	mov    %eax,-0x30(%ebp)
  362178:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36217b:	5b                   	pop    %ebx
  36217c:	5e                   	pop    %esi
  36217d:	5f                   	pop    %edi
  36217e:	5d                   	pop    %ebp
  36217f:	c3                   	ret    

00362180 <put_page>:
  362180:	55                   	push   %ebp
  362181:	89 e5                	mov    %esp,%ebp
  362183:	83 ec 18             	sub    $0x18,%esp
  362186:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36218d:	8b 45 0c             	mov    0xc(%ebp),%eax
  362190:	c1 e8 16             	shr    $0x16,%eax
  362193:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  36219a:	8b 45 08             	mov    0x8(%ebp),%eax
  36219d:	01 d0                	add    %edx,%eax
  36219f:	0f b6 00             	movzbl (%eax),%eax
  3621a2:	83 e0 01             	and    $0x1,%eax
  3621a5:	84 c0                	test   %al,%al
  3621a7:	75 2c                	jne    3621d5 <put_page+0x55>
  3621a9:	e8 67 90 00 00       	call   36b215 <get_free_page>
  3621ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3621b1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3621b5:	75 07                	jne    3621be <put_page+0x3e>
  3621b7:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  3621bc:	eb 61                	jmp    36221f <put_page+0x9f>
  3621be:	8b 45 0c             	mov    0xc(%ebp),%eax
  3621c1:	c1 e8 16             	shr    $0x16,%eax
  3621c4:	6a 07                	push   $0x7
  3621c6:	50                   	push   %eax
  3621c7:	ff 75 f4             	pushl  -0xc(%ebp)
  3621ca:	ff 75 08             	pushl  0x8(%ebp)
  3621cd:	e8 73 fb ff ff       	call   361d45 <put_item>
  3621d2:	83 c4 10             	add    $0x10,%esp
  3621d5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  3621d9:	75 07                	jne    3621e2 <put_page+0x62>
  3621db:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  3621e0:	eb 3d                	jmp    36221f <put_page+0x9f>
  3621e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  3621e5:	c1 e8 16             	shr    $0x16,%eax
  3621e8:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3621ef:	8b 45 08             	mov    0x8(%ebp),%eax
  3621f2:	01 d0                	add    %edx,%eax
  3621f4:	8b 00                	mov    (%eax),%eax
  3621f6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  3621fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3621fe:	8b 45 0c             	mov    0xc(%ebp),%eax
  362201:	c1 e8 0c             	shr    $0xc,%eax
  362204:	25 ff 03 00 00       	and    $0x3ff,%eax
  362209:	6a 07                	push   $0x7
  36220b:	50                   	push   %eax
  36220c:	ff 75 10             	pushl  0x10(%ebp)
  36220f:	ff 75 f4             	pushl  -0xc(%ebp)
  362212:	e8 2e fb ff ff       	call   361d45 <put_item>
  362217:	83 c4 10             	add    $0x10,%esp
  36221a:	b8 00 00 00 00       	mov    $0x0,%eax
  36221f:	c9                   	leave  
  362220:	c3                   	ret    

00362221 <np_page>:
  362221:	55                   	push   %ebp
  362222:	89 e5                	mov    %esp,%ebp
  362224:	57                   	push   %edi
  362225:	56                   	push   %esi
  362226:	53                   	push   %ebx
  362227:	83 ec 2c             	sub    $0x2c,%esp
  36222a:	8b 45 08             	mov    0x8(%ebp),%eax
  36222d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  362230:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
  362234:	7f 18                	jg     36224e <np_page+0x2d>
  362236:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  36223a:	78 12                	js     36224e <np_page+0x2d>
  36223c:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  362241:	8b 55 08             	mov    0x8(%ebp),%edx
  362244:	83 c2 0c             	add    $0xc,%edx
  362247:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  36224b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36224e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  362251:	8b 04 85 00 3d 37 00 	mov    0x373d00(,%eax,4),%eax
  362258:	89 45 dc             	mov    %eax,-0x24(%ebp)
  36225b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36225e:	89 45 d8             	mov    %eax,-0x28(%ebp)
  362261:	8b 45 d8             	mov    -0x28(%ebp),%eax
  362264:	8b 80 f0 00 00 00    	mov    0xf0(%eax),%eax
  36226a:	83 ec 08             	sub    $0x8,%esp
  36226d:	ff 75 0c             	pushl  0xc(%ebp)
  362270:	50                   	push   %eax
  362271:	e8 1e f8 ff ff       	call   361a94 <dovm>
  362276:	83 c4 10             	add    $0x10,%esp
  362279:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  36227c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  362283:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  362287:	75 09                	jne    362292 <np_page+0x71>
  362289:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  362290:	eb 47                	jmp    3622d9 <np_page+0xb8>
  362292:	8b 45 d8             	mov    -0x28(%ebp),%eax
  362295:	8b 80 04 01 00 00    	mov    0x104(%eax),%eax
  36229b:	83 ec 04             	sub    $0x4,%esp
  36229e:	ff 75 d4             	pushl  -0x2c(%ebp)
  3622a1:	ff 75 0c             	pushl  0xc(%ebp)
  3622a4:	50                   	push   %eax
  3622a5:	e8 d6 fe ff ff       	call   362180 <put_page>
  3622aa:	83 c4 10             	add    $0x10,%esp
  3622ad:	89 45 e0             	mov    %eax,-0x20(%ebp)
  3622b0:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  3622b4:	79 02                	jns    3622b8 <np_page+0x97>
  3622b6:	eb 21                	jmp    3622d9 <np_page+0xb8>
  3622b8:	b8 02 00 00 00       	mov    $0x2,%eax
  3622bd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3622c0:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  3622c3:	ba 00 00 00 00       	mov    $0x0,%edx
  3622c8:	be 00 00 00 00       	mov    $0x0,%esi
  3622cd:	bf 00 00 00 00       	mov    $0x0,%edi
  3622d2:	cd 80                	int    $0x80
  3622d4:	89 45 d0             	mov    %eax,-0x30(%ebp)
  3622d7:	eb 1f                	jmp    3622f8 <np_page+0xd7>
  3622d9:	b8 02 00 00 00       	mov    $0x2,%eax
  3622de:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3622e1:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  3622e6:	8b 55 e0             	mov    -0x20(%ebp),%edx
  3622e9:	be 00 00 00 00       	mov    $0x0,%esi
  3622ee:	bf 00 00 00 00       	mov    $0x0,%edi
  3622f3:	cd 80                	int    $0x80
  3622f5:	89 45 cc             	mov    %eax,-0x34(%ebp)
  3622f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
  3622fb:	5b                   	pop    %ebx
  3622fc:	5e                   	pop    %esi
  3622fd:	5f                   	pop    %edi
  3622fe:	5d                   	pop    %ebp
  3622ff:	c3                   	ret    

00362300 <_un_table>:
  362300:	55                   	push   %ebp
  362301:	89 e5                	mov    %esp,%ebp
  362303:	57                   	push   %edi
  362304:	56                   	push   %esi
  362305:	83 ec 10             	sub    $0x10,%esp
  362308:	8b 45 0c             	mov    0xc(%ebp),%eax
  36230b:	c1 e8 16             	shr    $0x16,%eax
  36230e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  362315:	8b 45 08             	mov    0x8(%ebp),%eax
  362318:	01 d0                	add    %edx,%eax
  36231a:	8b 00                	mov    (%eax),%eax
  36231c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  362321:	89 45 f4             	mov    %eax,-0xc(%ebp)
  362324:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  36232b:	8b 45 0c             	mov    0xc(%ebp),%eax
  36232e:	c1 e8 16             	shr    $0x16,%eax
  362331:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  362338:	8b 45 08             	mov    0x8(%ebp),%eax
  36233b:	01 d0                	add    %edx,%eax
  36233d:	0f b6 00             	movzbl (%eax),%eax
  362340:	83 e0 01             	and    $0x1,%eax
  362343:	84 c0                	test   %al,%al
  362345:	75 24                	jne    36236b <_un_table+0x6b>
  362347:	68 ac 00 00 00       	push   $0xac
  36234c:	68 ce d0 36 00       	push   $0x36d0ce
  362351:	ff 75 0c             	pushl  0xc(%ebp)
  362354:	68 bc d1 36 00       	push   $0x36d1bc
  362359:	e8 2a 6d 00 00       	call   369088 <printk>
  36235e:	83 c4 10             	add    $0x10,%esp
  362361:	b8 00 00 00 00       	mov    $0x0,%eax
  362366:	e9 fc 00 00 00       	jmp    362467 <_un_table+0x167>
  36236b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  362372:	eb 34                	jmp    3623a8 <_un_table+0xa8>
  362374:	8b 45 f0             	mov    -0x10(%ebp),%eax
  362377:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  36237e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  362381:	01 d0                	add    %edx,%eax
  362383:	0f b6 00             	movzbl (%eax),%eax
  362386:	83 e0 01             	and    $0x1,%eax
  362389:	84 c0                	test   %al,%al
  36238b:	74 17                	je     3623a4 <_un_table+0xa4>
  36238d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  362390:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  362397:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36239a:	01 d0                	add    %edx,%eax
  36239c:	0f b6 10             	movzbl (%eax),%edx
  36239f:	83 e2 fd             	and    $0xfffffffd,%edx
  3623a2:	88 10                	mov    %dl,(%eax)
  3623a4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  3623a8:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
  3623af:	7e c3                	jle    362374 <_un_table+0x74>
  3623b1:	8b 45 0c             	mov    0xc(%ebp),%eax
  3623b4:	c1 e8 16             	shr    $0x16,%eax
  3623b7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3623be:	8b 45 08             	mov    0x8(%ebp),%eax
  3623c1:	01 d0                	add    %edx,%eax
  3623c3:	8b 00                	mov    (%eax),%eax
  3623c5:	83 ec 0c             	sub    $0xc,%esp
  3623c8:	50                   	push   %eax
  3623c9:	e8 5f 8f 00 00       	call   36b32d <page_share_nr>
  3623ce:	83 c4 10             	add    $0x10,%esp
  3623d1:	83 f8 01             	cmp    $0x1,%eax
  3623d4:	0f 8e 8a 00 00 00    	jle    362464 <_un_table+0x164>
  3623da:	8b 45 0c             	mov    0xc(%ebp),%eax
  3623dd:	c1 e8 16             	shr    $0x16,%eax
  3623e0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3623e7:	8b 45 08             	mov    0x8(%ebp),%eax
  3623ea:	01 d0                	add    %edx,%eax
  3623ec:	8b 00                	mov    (%eax),%eax
  3623ee:	83 ec 0c             	sub    $0xc,%esp
  3623f1:	50                   	push   %eax
  3623f2:	e8 4e 8f 00 00       	call   36b345 <free_page>
  3623f7:	83 c4 10             	add    $0x10,%esp
  3623fa:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3623fd:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%ebp)
  362401:	75 34                	jne    362437 <_un_table+0x137>
  362403:	83 ec 04             	sub    $0x4,%esp
  362406:	68 b9 00 00 00       	push   $0xb9
  36240b:	68 ce d0 36 00       	push   $0x36d0ce
  362410:	68 f4 d1 36 00       	push   $0x36d1f4
  362415:	e8 6e 6c 00 00       	call   369088 <printk>
  36241a:	83 c4 10             	add    $0x10,%esp
  36241d:	68 b9 00 00 00       	push   $0xb9
  362422:	68 ce d0 36 00       	push   $0x36d0ce
  362427:	ff 75 0c             	pushl  0xc(%ebp)
  36242a:	68 38 d2 36 00       	push   $0x36d238
  36242f:	e8 54 6c 00 00       	call   369088 <printk>
  362434:	83 c4 10             	add    $0x10,%esp
  362437:	e8 d9 8d 00 00       	call   36b215 <get_free_page>
  36243c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36243f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  362443:	75 07                	jne    36244c <_un_table+0x14c>
  362445:	b8 00 00 00 00       	mov    $0x0,%eax
  36244a:	eb 1b                	jmp    362467 <_un_table+0x167>
  36244c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36244f:	8b 55 ec             	mov    -0x14(%ebp),%edx
  362452:	b9 00 04 00 00       	mov    $0x400,%ecx
  362457:	89 c6                	mov    %eax,%esi
  362459:	89 d7                	mov    %edx,%edi
  36245b:	fc                   	cld    
  36245c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  36245e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  362461:	89 45 f4             	mov    %eax,-0xc(%ebp)
  362464:	8b 45 f4             	mov    -0xc(%ebp),%eax
  362467:	8d 65 f8             	lea    -0x8(%ebp),%esp
  36246a:	5e                   	pop    %esi
  36246b:	5f                   	pop    %edi
  36246c:	5d                   	pop    %ebp
  36246d:	c3                   	ret    

0036246e <_un_page>:
  36246e:	55                   	push   %ebp
  36246f:	89 e5                	mov    %esp,%ebp
  362471:	57                   	push   %edi
  362472:	56                   	push   %esi
  362473:	83 ec 10             	sub    $0x10,%esp
  362476:	8b 45 0c             	mov    0xc(%ebp),%eax
  362479:	c1 e8 0c             	shr    $0xc,%eax
  36247c:	25 ff 03 00 00       	and    $0x3ff,%eax
  362481:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  362488:	8b 45 08             	mov    0x8(%ebp),%eax
  36248b:	01 d0                	add    %edx,%eax
  36248d:	8b 00                	mov    (%eax),%eax
  36248f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  362494:	89 45 f4             	mov    %eax,-0xc(%ebp)
  362497:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  36249e:	8b 45 0c             	mov    0xc(%ebp),%eax
  3624a1:	c1 e8 0c             	shr    $0xc,%eax
  3624a4:	25 ff 03 00 00       	and    $0x3ff,%eax
  3624a9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3624b0:	8b 45 08             	mov    0x8(%ebp),%eax
  3624b3:	01 d0                	add    %edx,%eax
  3624b5:	0f b6 00             	movzbl (%eax),%eax
  3624b8:	83 e0 01             	and    $0x1,%eax
  3624bb:	84 c0                	test   %al,%al
  3624bd:	75 24                	jne    3624e3 <_un_page+0x75>
  3624bf:	68 c9 00 00 00       	push   $0xc9
  3624c4:	68 ce d0 36 00       	push   $0x36d0ce
  3624c9:	ff 75 0c             	pushl  0xc(%ebp)
  3624cc:	68 7c d2 36 00       	push   $0x36d27c
  3624d1:	e8 b2 6b 00 00       	call   369088 <printk>
  3624d6:	83 c4 10             	add    $0x10,%esp
  3624d9:	b8 00 00 00 00       	mov    $0x0,%eax
  3624de:	e9 c0 00 00 00       	jmp    3625a3 <_un_page+0x135>
  3624e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  3624e6:	c1 e8 0c             	shr    $0xc,%eax
  3624e9:	25 ff 03 00 00       	and    $0x3ff,%eax
  3624ee:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3624f5:	8b 45 08             	mov    0x8(%ebp),%eax
  3624f8:	01 d0                	add    %edx,%eax
  3624fa:	8b 00                	mov    (%eax),%eax
  3624fc:	83 ec 0c             	sub    $0xc,%esp
  3624ff:	50                   	push   %eax
  362500:	e8 28 8e 00 00       	call   36b32d <page_share_nr>
  362505:	83 c4 10             	add    $0x10,%esp
  362508:	83 f8 01             	cmp    $0x1,%eax
  36250b:	0f 8e 8f 00 00 00    	jle    3625a0 <_un_page+0x132>
  362511:	8b 45 0c             	mov    0xc(%ebp),%eax
  362514:	c1 e8 0c             	shr    $0xc,%eax
  362517:	25 ff 03 00 00       	and    $0x3ff,%eax
  36251c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  362523:	8b 45 08             	mov    0x8(%ebp),%eax
  362526:	01 d0                	add    %edx,%eax
  362528:	8b 00                	mov    (%eax),%eax
  36252a:	83 ec 0c             	sub    $0xc,%esp
  36252d:	50                   	push   %eax
  36252e:	e8 12 8e 00 00       	call   36b345 <free_page>
  362533:	83 c4 10             	add    $0x10,%esp
  362536:	89 45 ec             	mov    %eax,-0x14(%ebp)
  362539:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  36253d:	75 34                	jne    362573 <_un_page+0x105>
  36253f:	83 ec 04             	sub    $0x4,%esp
  362542:	68 d0 00 00 00       	push   $0xd0
  362547:	68 ce d0 36 00       	push   $0x36d0ce
  36254c:	68 a8 d2 36 00       	push   $0x36d2a8
  362551:	e8 32 6b 00 00       	call   369088 <printk>
  362556:	83 c4 10             	add    $0x10,%esp
  362559:	68 d0 00 00 00       	push   $0xd0
  36255e:	68 ce d0 36 00       	push   $0x36d0ce
  362563:	ff 75 0c             	pushl  0xc(%ebp)
  362566:	68 38 d2 36 00       	push   $0x36d238
  36256b:	e8 18 6b 00 00       	call   369088 <printk>
  362570:	83 c4 10             	add    $0x10,%esp
  362573:	e8 9d 8c 00 00       	call   36b215 <get_free_page>
  362578:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36257b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  36257f:	75 07                	jne    362588 <_un_page+0x11a>
  362581:	b8 00 00 00 00       	mov    $0x0,%eax
  362586:	eb 1b                	jmp    3625a3 <_un_page+0x135>
  362588:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36258b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  36258e:	b9 00 04 00 00       	mov    $0x400,%ecx
  362593:	89 c6                	mov    %eax,%esi
  362595:	89 d7                	mov    %edx,%edi
  362597:	fc                   	cld    
  362598:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  36259a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36259d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3625a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3625a3:	8d 65 f8             	lea    -0x8(%ebp),%esp
  3625a6:	5e                   	pop    %esi
  3625a7:	5f                   	pop    %edi
  3625a8:	5d                   	pop    %ebp
  3625a9:	c3                   	ret    

003625aa <nw_page>:
  3625aa:	55                   	push   %ebp
  3625ab:	89 e5                	mov    %esp,%ebp
  3625ad:	57                   	push   %edi
  3625ae:	56                   	push   %esi
  3625af:	53                   	push   %ebx
  3625b0:	83 ec 2c             	sub    $0x2c,%esp
  3625b3:	8b 45 08             	mov    0x8(%ebp),%eax
  3625b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3625b9:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
  3625bd:	7f 18                	jg     3625d7 <nw_page+0x2d>
  3625bf:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  3625c3:	78 12                	js     3625d7 <nw_page+0x2d>
  3625c5:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  3625ca:	8b 55 08             	mov    0x8(%ebp),%edx
  3625cd:	83 c2 0c             	add    $0xc,%edx
  3625d0:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  3625d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3625d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3625da:	8b 04 85 00 3d 37 00 	mov    0x373d00(,%eax,4),%eax
  3625e1:	89 45 dc             	mov    %eax,-0x24(%ebp)
  3625e4:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3625e7:	89 45 d8             	mov    %eax,-0x28(%ebp)
  3625ea:	8b 45 d8             	mov    -0x28(%ebp),%eax
  3625ed:	8b 80 04 01 00 00    	mov    0x104(%eax),%eax
  3625f3:	83 ec 08             	sub    $0x8,%esp
  3625f6:	ff 75 0c             	pushl  0xc(%ebp)
  3625f9:	50                   	push   %eax
  3625fa:	e8 01 fd ff ff       	call   362300 <_un_table>
  3625ff:	83 c4 10             	add    $0x10,%esp
  362602:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  362605:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  36260c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  362610:	75 0c                	jne    36261e <nw_page+0x74>
  362612:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  362619:	e9 82 00 00 00       	jmp    3626a0 <nw_page+0xf6>
  36261e:	8b 45 0c             	mov    0xc(%ebp),%eax
  362621:	c1 e8 16             	shr    $0x16,%eax
  362624:	89 c2                	mov    %eax,%edx
  362626:	8b 45 d8             	mov    -0x28(%ebp),%eax
  362629:	8b 80 04 01 00 00    	mov    0x104(%eax),%eax
  36262f:	6a 07                	push   $0x7
  362631:	52                   	push   %edx
  362632:	ff 75 d4             	pushl  -0x2c(%ebp)
  362635:	50                   	push   %eax
  362636:	e8 0a f7 ff ff       	call   361d45 <put_item>
  36263b:	83 c4 10             	add    $0x10,%esp
  36263e:	83 ec 08             	sub    $0x8,%esp
  362641:	ff 75 0c             	pushl  0xc(%ebp)
  362644:	ff 75 d4             	pushl  -0x2c(%ebp)
  362647:	e8 22 fe ff ff       	call   36246e <_un_page>
  36264c:	83 c4 10             	add    $0x10,%esp
  36264f:	89 45 d0             	mov    %eax,-0x30(%ebp)
  362652:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  362656:	75 09                	jne    362661 <nw_page+0xb7>
  362658:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  36265f:	eb 3f                	jmp    3626a0 <nw_page+0xf6>
  362661:	8b 45 0c             	mov    0xc(%ebp),%eax
  362664:	c1 e8 0c             	shr    $0xc,%eax
  362667:	25 ff 03 00 00       	and    $0x3ff,%eax
  36266c:	6a 07                	push   $0x7
  36266e:	50                   	push   %eax
  36266f:	ff 75 d0             	pushl  -0x30(%ebp)
  362672:	ff 75 d4             	pushl  -0x2c(%ebp)
  362675:	e8 cb f6 ff ff       	call   361d45 <put_item>
  36267a:	83 c4 10             	add    $0x10,%esp
  36267d:	b8 02 00 00 00       	mov    $0x2,%eax
  362682:	8b 5d 08             	mov    0x8(%ebp),%ebx
  362685:	b9 00 00 00 00       	mov    $0x0,%ecx
  36268a:	ba 00 00 00 00       	mov    $0x0,%edx
  36268f:	be 00 00 00 00       	mov    $0x0,%esi
  362694:	bf 00 00 00 00       	mov    $0x0,%edi
  362699:	cd 80                	int    $0x80
  36269b:	89 45 cc             	mov    %eax,-0x34(%ebp)
  36269e:	eb 1f                	jmp    3626bf <nw_page+0x115>
  3626a0:	b8 02 00 00 00       	mov    $0x2,%eax
  3626a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3626a8:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  3626ad:	8b 55 e0             	mov    -0x20(%ebp),%edx
  3626b0:	be 00 00 00 00       	mov    $0x0,%esi
  3626b5:	bf 00 00 00 00       	mov    $0x0,%edi
  3626ba:	cd 80                	int    $0x80
  3626bc:	89 45 c8             	mov    %eax,-0x38(%ebp)
  3626bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
  3626c2:	5b                   	pop    %ebx
  3626c3:	5e                   	pop    %esi
  3626c4:	5f                   	pop    %edi
  3626c5:	5d                   	pop    %ebp
  3626c6:	c3                   	ret    

003626c7 <__va>:
  3626c7:	55                   	push   %ebp
  3626c8:	89 e5                	mov    %esp,%ebp
  3626ca:	83 ec 10             	sub    $0x10,%esp
  3626cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  3626d0:	c1 e8 16             	shr    $0x16,%eax
  3626d3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3626da:	8b 45 08             	mov    0x8(%ebp),%eax
  3626dd:	01 d0                	add    %edx,%eax
  3626df:	8b 00                	mov    (%eax),%eax
  3626e1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  3626e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  3626e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  3626ec:	c1 e8 0c             	shr    $0xc,%eax
  3626ef:	25 ff 03 00 00       	and    $0x3ff,%eax
  3626f4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3626fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3626fe:	01 d0                	add    %edx,%eax
  362700:	8b 00                	mov    (%eax),%eax
  362702:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  362707:	89 c2                	mov    %eax,%edx
  362709:	8b 45 0c             	mov    0xc(%ebp),%eax
  36270c:	25 ff 0f 00 00       	and    $0xfff,%eax
  362711:	01 d0                	add    %edx,%eax
  362713:	c9                   	leave  
  362714:	c3                   	ret    

00362715 <mm_execvp>:
  362715:	55                   	push   %ebp
  362716:	89 e5                	mov    %esp,%ebp
  362718:	57                   	push   %edi
  362719:	56                   	push   %esi
  36271a:	53                   	push   %ebx
  36271b:	83 ec 2c             	sub    $0x2c,%esp
  36271e:	8b 45 08             	mov    0x8(%ebp),%eax
  362721:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  362724:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
  362728:	7f 18                	jg     362742 <mm_execvp+0x2d>
  36272a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  36272e:	78 12                	js     362742 <mm_execvp+0x2d>
  362730:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  362735:	8b 55 08             	mov    0x8(%ebp),%edx
  362738:	83 c2 0c             	add    $0xc,%edx
  36273b:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  36273f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  362742:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  362745:	8b 04 85 00 3d 37 00 	mov    0x373d00(,%eax,4),%eax
  36274c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36274f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  362752:	89 45 dc             	mov    %eax,-0x24(%ebp)
  362755:	8b 45 dc             	mov    -0x24(%ebp),%eax
  362758:	c7 80 00 01 00 00 bc 	movl   $0x2fbc,0x100(%eax)
  36275f:	2f 00 00 
  362762:	8b 45 dc             	mov    -0x24(%ebp),%eax
  362765:	8b 80 00 01 00 00    	mov    0x100(%eax),%eax
  36276b:	8b 55 dc             	mov    -0x24(%ebp),%edx
  36276e:	8b 92 04 01 00 00    	mov    0x104(%edx),%edx
  362774:	50                   	push   %eax
  362775:	52                   	push   %edx
  362776:	e8 4c ff ff ff       	call   3626c7 <__va>
  36277b:	83 c4 08             	add    $0x8,%esp
  36277e:	89 45 d8             	mov    %eax,-0x28(%ebp)
  362781:	8b 45 dc             	mov    -0x24(%ebp),%eax
  362784:	8b 80 f0 00 00 00    	mov    0xf0(%eax),%eax
  36278a:	83 ec 0c             	sub    $0xc,%esp
  36278d:	50                   	push   %eax
  36278e:	e8 0b f2 ff ff       	call   36199e <delvm>
  362793:	83 c4 10             	add    $0x10,%esp
  362796:	8b 45 dc             	mov    -0x24(%ebp),%eax
  362799:	83 c0 14             	add    $0x14,%eax
  36279c:	83 ec 0c             	sub    $0xc,%esp
  36279f:	50                   	push   %eax
  3627a0:	ff 75 d8             	pushl  -0x28(%ebp)
  3627a3:	ff 75 14             	pushl  0x14(%ebp)
  3627a6:	ff 75 10             	pushl  0x10(%ebp)
  3627a9:	ff 75 0c             	pushl  0xc(%ebp)
  3627ac:	e8 cd ee ff ff       	call   36167e <mkvm>
  3627b1:	83 c4 20             	add    $0x20,%esp
  3627b4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  3627b7:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  3627bb:	75 1a                	jne    3627d7 <mm_execvp+0xc2>
  3627bd:	83 ec 04             	sub    $0x4,%esp
  3627c0:	68 fb 00 00 00       	push   $0xfb
  3627c5:	68 ce d0 36 00       	push   $0x36d0ce
  3627ca:	68 f0 d2 36 00       	push   $0x36d2f0
  3627cf:	e8 b4 68 00 00       	call   369088 <printk>
  3627d4:	83 c4 10             	add    $0x10,%esp
  3627d7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  3627da:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3627dd:	89 90 f0 00 00 00    	mov    %edx,0xf0(%eax)
  3627e3:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3627e6:	8b 80 04 01 00 00    	mov    0x104(%eax),%eax
  3627ec:	83 ec 0c             	sub    $0xc,%esp
  3627ef:	50                   	push   %eax
  3627f0:	e8 c8 f7 ff ff       	call   361fbd <_delete>
  3627f5:	83 c4 10             	add    $0x10,%esp
  3627f8:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3627fb:	83 c0 50             	add    $0x50,%eax
  3627fe:	83 ec 04             	sub    $0x4,%esp
  362801:	68 80 00 00 00       	push   $0x80
  362806:	6a 00                	push   $0x0
  362808:	50                   	push   %eax
  362809:	e8 fd f3 ff ff       	call   361c0b <memset>
  36280e:	83 c4 10             	add    $0x10,%esp
  362811:	b8 02 00 00 00       	mov    $0x2,%eax
  362816:	8b 5d 08             	mov    0x8(%ebp),%ebx
  362819:	b9 00 00 00 00       	mov    $0x0,%ecx
  36281e:	ba 00 00 00 00       	mov    $0x0,%edx
  362823:	be 00 00 00 00       	mov    $0x0,%esi
  362828:	bf 00 00 00 00       	mov    $0x0,%edi
  36282d:	cd 80                	int    $0x80
  36282f:	89 45 d0             	mov    %eax,-0x30(%ebp)
  362832:	8d 65 f4             	lea    -0xc(%ebp),%esp
  362835:	5b                   	pop    %ebx
  362836:	5e                   	pop    %esi
  362837:	5f                   	pop    %edi
  362838:	5d                   	pop    %ebp
  362839:	c3                   	ret    

0036283a <_wait>:
  36283a:	55                   	push   %ebp
  36283b:	89 e5                	mov    %esp,%ebp
  36283d:	5d                   	pop    %ebp
  36283e:	c3                   	ret    

0036283f <__clone_space__>:
  36283f:	55                   	push   %ebp
  362840:	89 e5                	mov    %esp,%ebp
  362842:	57                   	push   %edi
  362843:	56                   	push   %esi
  362844:	83 ec 10             	sub    $0x10,%esp
  362847:	e8 c9 89 00 00       	call   36b215 <get_free_page>
  36284c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36284f:	e8 c1 89 00 00       	call   36b215 <get_free_page>
  362854:	89 45 ec             	mov    %eax,-0x14(%ebp)
  362857:	8b 45 08             	mov    0x8(%ebp),%eax
  36285a:	8b 00                	mov    (%eax),%eax
  36285c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  362861:	89 45 e8             	mov    %eax,-0x18(%ebp)
  362864:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  362868:	74 06                	je     362870 <__clone_space__+0x31>
  36286a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  36286e:	75 10                	jne    362880 <__clone_space__+0x41>
  362870:	83 ec 0c             	sub    $0xc,%esp
  362873:	68 2c d3 36 00       	push   $0x36d32c
  362878:	e8 ef 67 00 00       	call   36906c <panic>
  36287d:	83 c4 10             	add    $0x10,%esp
  362880:	8b 45 08             	mov    0x8(%ebp),%eax
  362883:	8b 55 f0             	mov    -0x10(%ebp),%edx
  362886:	b9 00 04 00 00       	mov    $0x400,%ecx
  36288b:	89 c6                	mov    %eax,%esi
  36288d:	89 d7                	mov    %edx,%edi
  36288f:	fc                   	cld    
  362890:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  362892:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
  362899:	eb 1b                	jmp    3628b6 <__clone_space__+0x77>
  36289b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36289e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3628a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3628a8:	01 d0                	add    %edx,%eax
  3628aa:	0f b6 10             	movzbl (%eax),%edx
  3628ad:	83 e2 fe             	and    $0xfffffffe,%edx
  3628b0:	88 10                	mov    %dl,(%eax)
  3628b2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3628b6:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
  3628bd:	7e dc                	jle    36289b <__clone_space__+0x5c>
  3628bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3628c2:	8b 55 ec             	mov    -0x14(%ebp),%edx
  3628c5:	b9 00 04 00 00       	mov    $0x400,%ecx
  3628ca:	89 c6                	mov    %eax,%esi
  3628cc:	89 d7                	mov    %edx,%edi
  3628ce:	fc                   	cld    
  3628cf:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  3628d1:	6a 07                	push   $0x7
  3628d3:	6a 02                	push   $0x2
  3628d5:	ff 75 0c             	pushl  0xc(%ebp)
  3628d8:	ff 75 ec             	pushl  -0x14(%ebp)
  3628db:	e8 65 f4 ff ff       	call   361d45 <put_item>
  3628e0:	83 c4 10             	add    $0x10,%esp
  3628e3:	6a 07                	push   $0x7
  3628e5:	6a 00                	push   $0x0
  3628e7:	ff 75 ec             	pushl  -0x14(%ebp)
  3628ea:	ff 75 f0             	pushl  -0x10(%ebp)
  3628ed:	e8 53 f4 ff ff       	call   361d45 <put_item>
  3628f2:	83 c4 10             	add    $0x10,%esp
  3628f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3628f8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  3628fb:	5e                   	pop    %esi
  3628fc:	5f                   	pop    %edi
  3628fd:	5d                   	pop    %ebp
  3628fe:	c3                   	ret    

003628ff <make_task>:
  3628ff:	55                   	push   %ebp
  362900:	89 e5                	mov    %esp,%ebp
  362902:	57                   	push   %edi
  362903:	83 ec 54             	sub    $0x54,%esp
  362906:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36290b:	83 ec 0c             	sub    $0xc,%esp
  36290e:	50                   	push   %eax
  36290f:	e8 49 8d 00 00       	call   36b65d <cloneObject>
  362914:	83 c4 10             	add    $0x10,%esp
  362917:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36291a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36291d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  362920:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  362925:	89 45 ec             	mov    %eax,-0x14(%ebp)
  362928:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36292b:	8b 80 04 01 00 00    	mov    0x104(%eax),%eax
  362931:	83 ec 08             	sub    $0x8,%esp
  362934:	ff 75 f0             	pushl  -0x10(%ebp)
  362937:	50                   	push   %eax
  362938:	e8 02 ff ff ff       	call   36283f <__clone_space__>
  36293d:	83 c4 10             	add    $0x10,%esp
  362940:	89 c2                	mov    %eax,%edx
  362942:	8b 45 f0             	mov    -0x10(%ebp),%eax
  362945:	89 90 04 01 00 00    	mov    %edx,0x104(%eax)
  36294b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36294e:	c7 80 00 01 00 00 bc 	movl   $0x2fbc,0x100(%eax)
  362955:	2f 00 00 
  362958:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36295b:	c7 80 fc 00 00 00 00 	movl   $0x0,0xfc(%eax)
  362962:	00 00 00 
  362965:	8b 45 f0             	mov    -0x10(%ebp),%eax
  362968:	c7 80 f4 00 00 00 14 	movl   $0x14,0xf4(%eax)
  36296f:	00 00 00 
  362972:	8b 45 f0             	mov    -0x10(%ebp),%eax
  362975:	c7 80 f8 00 00 00 14 	movl   $0x14,0xf8(%eax)
  36297c:	00 00 00 
  36297f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  362982:	83 c0 14             	add    $0x14,%eax
  362985:	83 ec 08             	sub    $0x8,%esp
  362988:	ff 75 08             	pushl  0x8(%ebp)
  36298b:	50                   	push   %eax
  36298c:	e8 3d f2 ff ff       	call   361bce <strcpy>
  362991:	83 c4 10             	add    $0x10,%esp
  362994:	8d 55 a8             	lea    -0x58(%ebp),%edx
  362997:	b8 00 00 00 00       	mov    $0x0,%eax
  36299c:	b9 11 00 00 00       	mov    $0x11,%ecx
  3629a1:	89 d7                	mov    %edx,%edi
  3629a3:	f3 ab                	rep stos %eax,%es:(%edi)
  3629a5:	c7 45 a8 10 00 00 00 	movl   $0x10,-0x58(%ebp)
  3629ac:	c7 45 ac 10 00 00 00 	movl   $0x10,-0x54(%ebp)
  3629b3:	c7 45 b0 10 00 00 00 	movl   $0x10,-0x50(%ebp)
  3629ba:	c7 45 b4 10 00 00 00 	movl   $0x10,-0x4c(%ebp)
  3629c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  3629c4:	89 45 d8             	mov    %eax,-0x28(%ebp)
  3629c7:	c7 45 dc 08 00 00 00 	movl   $0x8,-0x24(%ebp)
  3629ce:	c7 45 e0 00 02 00 00 	movl   $0x200,-0x20(%ebp)
  3629d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3629d8:	8d 90 bc 0f 00 00    	lea    0xfbc(%eax),%edx
  3629de:	83 ec 04             	sub    $0x4,%esp
  3629e1:	6a 44                	push   $0x44
  3629e3:	8d 45 a8             	lea    -0x58(%ebp),%eax
  3629e6:	50                   	push   %eax
  3629e7:	52                   	push   %edx
  3629e8:	e8 fe f1 ff ff       	call   361beb <memcpy>
  3629ed:	83 c4 10             	add    $0x10,%esp
  3629f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3629f3:	8b 7d fc             	mov    -0x4(%ebp),%edi
  3629f6:	c9                   	leave  
  3629f7:	c3                   	ret    

003629f8 <_mm_init>:
  3629f8:	55                   	push   %ebp
  3629f9:	89 e5                	mov    %esp,%ebp
  3629fb:	57                   	push   %edi
  3629fc:	56                   	push   %esi
  3629fd:	53                   	push   %ebx
  3629fe:	83 ec 2c             	sub    $0x2c,%esp
  362a01:	b8 03 00 00 00       	mov    $0x3,%eax
  362a06:	bb 03 00 00 00       	mov    $0x3,%ebx
  362a0b:	b9 06 1e 36 00       	mov    $0x361e06,%ecx
  362a10:	ba 00 00 00 00       	mov    $0x0,%edx
  362a15:	be 00 00 00 00       	mov    $0x0,%esi
  362a1a:	bf 00 00 00 00       	mov    $0x0,%edi
  362a1f:	cd 80                	int    $0x80
  362a21:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  362a24:	b8 03 00 00 00       	mov    $0x3,%eax
  362a29:	bb 01 00 00 00       	mov    $0x1,%ebx
  362a2e:	b9 9b 20 36 00       	mov    $0x36209b,%ecx
  362a33:	ba 00 00 00 00       	mov    $0x0,%edx
  362a38:	be 00 00 00 00       	mov    $0x0,%esi
  362a3d:	bf 00 00 00 00       	mov    $0x0,%edi
  362a42:	cd 80                	int    $0x80
  362a44:	89 45 e0             	mov    %eax,-0x20(%ebp)
  362a47:	b8 03 00 00 00       	mov    $0x3,%eax
  362a4c:	bb 10 00 00 00       	mov    $0x10,%ebx
  362a51:	b9 21 22 36 00       	mov    $0x362221,%ecx
  362a56:	ba 00 00 00 00       	mov    $0x0,%edx
  362a5b:	be 00 00 00 00       	mov    $0x0,%esi
  362a60:	bf 00 00 00 00       	mov    $0x0,%edi
  362a65:	cd 80                	int    $0x80
  362a67:	89 45 dc             	mov    %eax,-0x24(%ebp)
  362a6a:	b8 03 00 00 00       	mov    $0x3,%eax
  362a6f:	bb 11 00 00 00       	mov    $0x11,%ebx
  362a74:	b9 aa 25 36 00       	mov    $0x3625aa,%ecx
  362a79:	ba 00 00 00 00       	mov    $0x0,%edx
  362a7e:	be 00 00 00 00       	mov    $0x0,%esi
  362a83:	bf 00 00 00 00       	mov    $0x0,%edi
  362a88:	cd 80                	int    $0x80
  362a8a:	89 45 d8             	mov    %eax,-0x28(%ebp)
  362a8d:	b8 03 00 00 00       	mov    $0x3,%eax
  362a92:	bb 12 00 00 00       	mov    $0x12,%ebx
  362a97:	b9 15 27 36 00       	mov    $0x362715,%ecx
  362a9c:	ba 00 00 00 00       	mov    $0x0,%edx
  362aa1:	be 00 00 00 00       	mov    $0x0,%esi
  362aa6:	bf 00 00 00 00       	mov    $0x0,%edi
  362aab:	cd 80                	int    $0x80
  362aad:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  362ab0:	b8 03 00 00 00       	mov    $0x3,%eax
  362ab5:	bb 13 00 00 00       	mov    $0x13,%ebx
  362aba:	b9 3a 28 36 00       	mov    $0x36283a,%ecx
  362abf:	ba 00 00 00 00       	mov    $0x0,%edx
  362ac4:	be 00 00 00 00       	mov    $0x0,%esi
  362ac9:	bf 00 00 00 00       	mov    $0x0,%edi
  362ace:	cd 80                	int    $0x80
  362ad0:	89 45 d0             	mov    %eax,-0x30(%ebp)
  362ad3:	83 ec 08             	sub    $0x8,%esp
  362ad6:	68 ad ab 36 00       	push   $0x36abad
  362adb:	68 45 d3 36 00       	push   $0x36d345
  362ae0:	e8 1a fe ff ff       	call   3628ff <make_task>
  362ae5:	83 c4 10             	add    $0x10,%esp
  362ae8:	89 45 cc             	mov    %eax,-0x34(%ebp)
  362aeb:	8b 15 c4 37 37 00    	mov    0x3737c4,%edx
  362af1:	8b 45 cc             	mov    -0x34(%ebp),%eax
  362af4:	89 90 d8 00 00 00    	mov    %edx,0xd8(%eax)
  362afa:	8b 45 cc             	mov    -0x34(%ebp),%eax
  362afd:	8b 18                	mov    (%eax),%ebx
  362aff:	b8 02 00 00 00       	mov    $0x2,%eax
  362b04:	b9 00 00 00 00       	mov    $0x0,%ecx
  362b09:	ba 00 00 00 00       	mov    $0x0,%edx
  362b0e:	be 00 00 00 00       	mov    $0x0,%esi
  362b13:	bf 00 00 00 00       	mov    $0x0,%edi
  362b18:	cd 80                	int    $0x80
  362b1a:	89 45 c8             	mov    %eax,-0x38(%ebp)
  362b1d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  362b20:	5b                   	pop    %ebx
  362b21:	5e                   	pop    %esi
  362b22:	5f                   	pop    %edi
  362b23:	5d                   	pop    %ebp
  362b24:	c3                   	ret    

00362b25 <mm_main>:
  362b25:	55                   	push   %ebp
  362b26:	89 e5                	mov    %esp,%ebp
  362b28:	57                   	push   %edi
  362b29:	56                   	push   %esi
  362b2a:	53                   	push   %ebx
  362b2b:	83 ec 1c             	sub    $0x1c,%esp
  362b2e:	e8 c5 fe ff ff       	call   3629f8 <_mm_init>
  362b33:	b8 00 00 00 00       	mov    $0x0,%eax
  362b38:	bb 00 00 00 00       	mov    $0x0,%ebx
  362b3d:	b9 00 00 00 00       	mov    $0x0,%ecx
  362b42:	ba 00 00 00 00       	mov    $0x0,%edx
  362b47:	be 00 00 00 00       	mov    $0x0,%esi
  362b4c:	bf 00 00 00 00       	mov    $0x0,%edi
  362b51:	cd 80                	int    $0x80
  362b53:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  362b56:	b8 00 00 00 00       	mov    $0x0,%eax
  362b5b:	83 c4 1c             	add    $0x1c,%esp
  362b5e:	5b                   	pop    %ebx
  362b5f:	5e                   	pop    %esi
  362b60:	5f                   	pop    %edi
  362b61:	5d                   	pop    %ebp
  362b62:	c3                   	ret    

00362b63 <outb>:
  362b63:	55                   	push   %ebp
  362b64:	89 e5                	mov    %esp,%ebp
  362b66:	83 ec 08             	sub    $0x8,%esp
  362b69:	8b 55 08             	mov    0x8(%ebp),%edx
  362b6c:	8b 45 0c             	mov    0xc(%ebp),%eax
  362b6f:	88 55 fc             	mov    %dl,-0x4(%ebp)
  362b72:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  362b76:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  362b7a:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  362b7e:	ee                   	out    %al,(%dx)
  362b7f:	c9                   	leave  
  362b80:	c3                   	ret    

00362b81 <inb>:
  362b81:	55                   	push   %ebp
  362b82:	89 e5                	mov    %esp,%ebp
  362b84:	83 ec 14             	sub    $0x14,%esp
  362b87:	8b 45 08             	mov    0x8(%ebp),%eax
  362b8a:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  362b8e:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  362b92:	89 c2                	mov    %eax,%edx
  362b94:	ec                   	in     (%dx),%al
  362b95:	88 45 ff             	mov    %al,-0x1(%ebp)
  362b98:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  362b9c:	c9                   	leave  
  362b9d:	c3                   	ret    

00362b9e <io_delay>:
  362b9e:	55                   	push   %ebp
  362b9f:	89 e5                	mov    %esp,%ebp
  362ba1:	83 ec 10             	sub    $0x10,%esp
  362ba4:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
  362baa:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  362bae:	89 c2                	mov    %eax,%edx
  362bb0:	ee                   	out    %al,(%dx)
  362bb1:	c9                   	leave  
  362bb2:	c3                   	ret    

00362bb3 <outb_p>:
  362bb3:	55                   	push   %ebp
  362bb4:	89 e5                	mov    %esp,%ebp
  362bb6:	83 ec 08             	sub    $0x8,%esp
  362bb9:	8b 55 08             	mov    0x8(%ebp),%edx
  362bbc:	8b 45 0c             	mov    0xc(%ebp),%eax
  362bbf:	88 55 fc             	mov    %dl,-0x4(%ebp)
  362bc2:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  362bc6:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  362bca:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  362bce:	52                   	push   %edx
  362bcf:	50                   	push   %eax
  362bd0:	e8 8e ff ff ff       	call   362b63 <outb>
  362bd5:	83 c4 08             	add    $0x8,%esp
  362bd8:	e8 c1 ff ff ff       	call   362b9e <io_delay>
  362bdd:	c9                   	leave  
  362bde:	c3                   	ret    

00362bdf <inb_p>:
  362bdf:	55                   	push   %ebp
  362be0:	89 e5                	mov    %esp,%ebp
  362be2:	83 ec 14             	sub    $0x14,%esp
  362be5:	8b 45 08             	mov    0x8(%ebp),%eax
  362be8:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  362bec:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  362bf0:	50                   	push   %eax
  362bf1:	e8 8b ff ff ff       	call   362b81 <inb>
  362bf6:	83 c4 04             	add    $0x4,%esp
  362bf9:	88 45 ff             	mov    %al,-0x1(%ebp)
  362bfc:	e8 9d ff ff ff       	call   362b9e <io_delay>
  362c01:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  362c05:	c9                   	leave  
  362c06:	c3                   	ret    

00362c07 <_add>:
  362c07:	55                   	push   %ebp
  362c08:	89 e5                	mov    %esp,%ebp
  362c0a:	83 ec 10             	sub    $0x10,%esp
  362c0d:	a1 cc 31 37 00       	mov    0x3731cc,%eax
  362c12:	85 c0                	test   %eax,%eax
  362c14:	75 26                	jne    362c3c <_add+0x35>
  362c16:	8b 45 08             	mov    0x8(%ebp),%eax
  362c19:	a3 cc 31 37 00       	mov    %eax,0x3731cc
  362c1e:	a1 cc 31 37 00       	mov    0x3731cc,%eax
  362c23:	8b 15 cc 31 37 00    	mov    0x3731cc,%edx
  362c29:	89 50 14             	mov    %edx,0x14(%eax)
  362c2c:	a1 cc 31 37 00       	mov    0x3731cc,%eax
  362c31:	8b 15 cc 31 37 00    	mov    0x3731cc,%edx
  362c37:	89 50 18             	mov    %edx,0x18(%eax)
  362c3a:	eb 6c                	jmp    362ca8 <_add+0xa1>
  362c3c:	a1 cc 31 37 00       	mov    0x3731cc,%eax
  362c41:	89 45 fc             	mov    %eax,-0x4(%ebp)
  362c44:	8b 45 08             	mov    0x8(%ebp),%eax
  362c47:	8b 50 08             	mov    0x8(%eax),%edx
  362c4a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  362c4d:	8b 40 08             	mov    0x8(%eax),%eax
  362c50:	39 c2                	cmp    %eax,%edx
  362c52:	7d 02                	jge    362c56 <_add+0x4f>
  362c54:	eb 13                	jmp    362c69 <_add+0x62>
  362c56:	8b 45 fc             	mov    -0x4(%ebp),%eax
  362c59:	8b 40 14             	mov    0x14(%eax),%eax
  362c5c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  362c5f:	a1 cc 31 37 00       	mov    0x3731cc,%eax
  362c64:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  362c67:	75 db                	jne    362c44 <_add+0x3d>
  362c69:	8b 45 08             	mov    0x8(%ebp),%eax
  362c6c:	8b 55 fc             	mov    -0x4(%ebp),%edx
  362c6f:	89 50 14             	mov    %edx,0x14(%eax)
  362c72:	8b 45 fc             	mov    -0x4(%ebp),%eax
  362c75:	8b 50 18             	mov    0x18(%eax),%edx
  362c78:	8b 45 08             	mov    0x8(%ebp),%eax
  362c7b:	89 50 18             	mov    %edx,0x18(%eax)
  362c7e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  362c81:	8b 55 08             	mov    0x8(%ebp),%edx
  362c84:	89 50 18             	mov    %edx,0x18(%eax)
  362c87:	a1 cc 31 37 00       	mov    0x3731cc,%eax
  362c8c:	8b 50 08             	mov    0x8(%eax),%edx
  362c8f:	8b 45 08             	mov    0x8(%ebp),%eax
  362c92:	8b 40 08             	mov    0x8(%eax),%eax
  362c95:	39 c2                	cmp    %eax,%edx
  362c97:	7e 05                	jle    362c9e <_add+0x97>
  362c99:	8b 45 08             	mov    0x8(%ebp),%eax
  362c9c:	eb 05                	jmp    362ca3 <_add+0x9c>
  362c9e:	a1 cc 31 37 00       	mov    0x3731cc,%eax
  362ca3:	a3 cc 31 37 00       	mov    %eax,0x3731cc
  362ca8:	c9                   	leave  
  362ca9:	c3                   	ret    

00362caa <_sub>:
  362caa:	55                   	push   %ebp
  362cab:	89 e5                	mov    %esp,%ebp
  362cad:	83 ec 18             	sub    $0x18,%esp
  362cb0:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  362cb5:	85 c0                	test   %eax,%eax
  362cb7:	74 61                	je     362d1a <_sub+0x70>
  362cb9:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  362cbe:	8b 40 14             	mov    0x14(%eax),%eax
  362cc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  362cc4:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  362cc9:	8b 40 18             	mov    0x18(%eax),%eax
  362ccc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  362ccf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  362cd2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  362cd5:	89 50 18             	mov    %edx,0x18(%eax)
  362cd8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  362cdb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  362cde:	89 50 14             	mov    %edx,0x14(%eax)
  362ce1:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  362ce6:	83 ec 08             	sub    $0x8,%esp
  362ce9:	6a 00                	push   $0x0
  362ceb:	50                   	push   %eax
  362cec:	e8 ae 8b 00 00       	call   36b89f <kfree_s>
  362cf1:	83 c4 10             	add    $0x10,%esp
  362cf4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  362cf7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  362cfa:	74 0a                	je     362d06 <_sub+0x5c>
  362cfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  362cff:	a3 d0 31 37 00       	mov    %eax,0x3731d0
  362d04:	eb 14                	jmp    362d1a <_sub+0x70>
  362d06:	c7 05 d0 31 37 00 00 	movl   $0x0,0x3731d0
  362d0d:	00 00 00 
  362d10:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  362d15:	a3 cc 31 37 00       	mov    %eax,0x3731cc
  362d1a:	c9                   	leave  
  362d1b:	c3                   	ret    

00362d1c <at_isbusy>:
  362d1c:	55                   	push   %ebp
  362d1d:	89 e5                	mov    %esp,%ebp
  362d1f:	83 ec 18             	sub    $0x18,%esp
  362d22:	c7 45 f4 50 c3 00 00 	movl   $0xc350,-0xc(%ebp)
  362d29:	eb 25                	jmp    362d50 <at_isbusy+0x34>
  362d2b:	68 f7 01 00 00       	push   $0x1f7
  362d30:	e8 aa fe ff ff       	call   362bdf <inb_p>
  362d35:	83 c4 04             	add    $0x4,%esp
  362d38:	88 45 f3             	mov    %al,-0xd(%ebp)
  362d3b:	80 65 f3 d0          	andb   $0xd0,-0xd(%ebp)
  362d3f:	80 7d f3 50          	cmpb   $0x50,-0xd(%ebp)
  362d43:	75 07                	jne    362d4c <at_isbusy+0x30>
  362d45:	b8 00 00 00 00       	mov    $0x0,%eax
  362d4a:	eb 24                	jmp    362d70 <at_isbusy+0x54>
  362d4c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  362d50:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  362d54:	75 d5                	jne    362d2b <at_isbusy+0xf>
  362d56:	83 ec 08             	sub    $0x8,%esp
  362d59:	68 4c d3 36 00       	push   $0x36d34c
  362d5e:	68 54 d3 36 00       	push   $0x36d354
  362d63:	e8 20 63 00 00       	call   369088 <printk>
  362d68:	83 c4 10             	add    $0x10,%esp
  362d6b:	b8 01 00 00 00       	mov    $0x1,%eax
  362d70:	c9                   	leave  
  362d71:	c3                   	ret    

00362d72 <at_cmd>:
  362d72:	55                   	push   %ebp
  362d73:	89 e5                	mov    %esp,%ebp
  362d75:	53                   	push   %ebx
  362d76:	83 ec 2c             	sub    $0x2c,%esp
  362d79:	8b 5d 08             	mov    0x8(%ebp),%ebx
  362d7c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  362d7f:	8b 55 10             	mov    0x10(%ebp),%edx
  362d82:	8b 45 1c             	mov    0x1c(%ebp),%eax
  362d85:	88 5d e4             	mov    %bl,-0x1c(%ebp)
  362d88:	88 4d e0             	mov    %cl,-0x20(%ebp)
  362d8b:	88 55 dc             	mov    %dl,-0x24(%ebp)
  362d8e:	8b 55 14             	mov    0x14(%ebp),%edx
  362d91:	89 55 d0             	mov    %edx,-0x30(%ebp)
  362d94:	8b 55 18             	mov    0x18(%ebp),%edx
  362d97:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  362d9a:	88 45 d8             	mov    %al,-0x28(%ebp)
  362d9d:	c6 45 f7 e0          	movb   $0xe0,-0x9(%ebp)
  362da1:	80 7d d8 00          	cmpb   $0x0,-0x28(%ebp)
  362da5:	74 04                	je     362dab <at_cmd+0x39>
  362da7:	80 4d f7 10          	orb    $0x10,-0x9(%ebp)
  362dab:	8b 45 d0             	mov    -0x30(%ebp),%eax
  362dae:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  362db1:	0f ac d0 18          	shrd   $0x18,%edx,%eax
  362db5:	c1 ea 18             	shr    $0x18,%edx
  362db8:	83 e0 0f             	and    $0xf,%eax
  362dbb:	08 45 f7             	or     %al,-0x9(%ebp)
  362dbe:	8b 45 d0             	mov    -0x30(%ebp),%eax
  362dc1:	88 45 f6             	mov    %al,-0xa(%ebp)
  362dc4:	8b 45 d0             	mov    -0x30(%ebp),%eax
  362dc7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  362dca:	0f ac d0 08          	shrd   $0x8,%edx,%eax
  362dce:	c1 ea 08             	shr    $0x8,%edx
  362dd1:	88 45 f5             	mov    %al,-0xb(%ebp)
  362dd4:	8b 45 d0             	mov    -0x30(%ebp),%eax
  362dd7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  362dda:	0f ac d0 10          	shrd   $0x10,%edx,%eax
  362dde:	c1 ea 10             	shr    $0x10,%edx
  362de1:	88 45 f4             	mov    %al,-0xc(%ebp)
  362de4:	68 f6 03 00 00       	push   $0x3f6
  362de9:	6a 00                	push   $0x0
  362deb:	e8 c3 fd ff ff       	call   362bb3 <outb_p>
  362df0:	83 c4 08             	add    $0x8,%esp
  362df3:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  362df7:	68 f1 01 00 00       	push   $0x1f1
  362dfc:	50                   	push   %eax
  362dfd:	e8 b1 fd ff ff       	call   362bb3 <outb_p>
  362e02:	83 c4 08             	add    $0x8,%esp
  362e05:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  362e09:	68 f2 01 00 00       	push   $0x1f2
  362e0e:	50                   	push   %eax
  362e0f:	e8 9f fd ff ff       	call   362bb3 <outb_p>
  362e14:	83 c4 08             	add    $0x8,%esp
  362e17:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  362e1b:	68 f3 01 00 00       	push   $0x1f3
  362e20:	50                   	push   %eax
  362e21:	e8 8d fd ff ff       	call   362bb3 <outb_p>
  362e26:	83 c4 08             	add    $0x8,%esp
  362e29:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  362e2d:	68 f4 01 00 00       	push   $0x1f4
  362e32:	50                   	push   %eax
  362e33:	e8 7b fd ff ff       	call   362bb3 <outb_p>
  362e38:	83 c4 08             	add    $0x8,%esp
  362e3b:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
  362e3f:	68 f5 01 00 00       	push   $0x1f5
  362e44:	50                   	push   %eax
  362e45:	e8 69 fd ff ff       	call   362bb3 <outb_p>
  362e4a:	83 c4 08             	add    $0x8,%esp
  362e4d:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  362e51:	68 f6 01 00 00       	push   $0x1f6
  362e56:	50                   	push   %eax
  362e57:	e8 57 fd ff ff       	call   362bb3 <outb_p>
  362e5c:	83 c4 08             	add    $0x8,%esp
  362e5f:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  362e63:	68 f7 01 00 00       	push   $0x1f7
  362e68:	50                   	push   %eax
  362e69:	e8 45 fd ff ff       	call   362bb3 <outb_p>
  362e6e:	83 c4 08             	add    $0x8,%esp
  362e71:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  362e74:	c9                   	leave  
  362e75:	c3                   	ret    

00362e76 <_doio>:
  362e76:	55                   	push   %ebp
  362e77:	89 e5                	mov    %esp,%ebp
  362e79:	57                   	push   %edi
  362e7a:	56                   	push   %esi
  362e7b:	53                   	push   %ebx
  362e7c:	83 ec 2c             	sub    $0x2c,%esp
  362e7f:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  362e84:	8b 40 04             	mov    0x4(%eax),%eax
  362e87:	89 45 e0             	mov    %eax,-0x20(%ebp)
  362e8a:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  362e8f:	8b 40 0c             	mov    0xc(%eax),%eax
  362e92:	89 45 dc             	mov    %eax,-0x24(%ebp)
  362e95:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  362e9a:	8b 40 08             	mov    0x8(%eax),%eax
  362e9d:	89 45 d8             	mov    %eax,-0x28(%ebp)
  362ea0:	8b 45 d8             	mov    -0x28(%ebp),%eax
  362ea3:	99                   	cltd   
  362ea4:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  362ea7:	0f b6 d9             	movzbl %cl,%ebx
  362eaa:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  362ead:	0f b6 c9             	movzbl %cl,%ecx
  362eb0:	6a 00                	push   $0x0
  362eb2:	52                   	push   %edx
  362eb3:	50                   	push   %eax
  362eb4:	53                   	push   %ebx
  362eb5:	6a 00                	push   $0x0
  362eb7:	51                   	push   %ecx
  362eb8:	e8 b5 fe ff ff       	call   362d72 <at_cmd>
  362ebd:	83 c4 18             	add    $0x18,%esp
  362ec0:	e8 57 fe ff ff       	call   362d1c <at_isbusy>
  362ec5:	84 c0                	test   %al,%al
  362ec7:	74 2a                	je     362ef3 <_doio+0x7d>
  362ec9:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  362ece:	8b 18                	mov    (%eax),%ebx
  362ed0:	b8 02 00 00 00       	mov    $0x2,%eax
  362ed5:	b9 f0 ff ff ff       	mov    $0xfffffff0,%ecx
  362eda:	ba 00 00 00 00       	mov    $0x0,%edx
  362edf:	be 00 00 00 00       	mov    $0x0,%esi
  362ee4:	bf 00 00 00 00       	mov    $0x0,%edi
  362ee9:	cd 80                	int    $0x80
  362eeb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  362eee:	e8 b7 fd ff ff       	call   362caa <_sub>
  362ef3:	83 7d e0 30          	cmpl   $0x30,-0x20(%ebp)
  362ef7:	75 70                	jne    362f69 <_doio+0xf3>
  362ef9:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  362efe:	8b 40 10             	mov    0x10(%eax),%eax
  362f01:	89 45 d0             	mov    %eax,-0x30(%ebp)
  362f04:	c7 45 e4 50 c3 00 00 	movl   $0xc350,-0x1c(%ebp)
  362f0b:	eb 04                	jmp    362f11 <_doio+0x9b>
  362f0d:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  362f11:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  362f15:	74 1a                	je     362f31 <_doio+0xbb>
  362f17:	83 ec 0c             	sub    $0xc,%esp
  362f1a:	68 f7 01 00 00       	push   $0x1f7
  362f1f:	e8 bb fc ff ff       	call   362bdf <inb_p>
  362f24:	83 c4 10             	add    $0x10,%esp
  362f27:	0f b6 c0             	movzbl %al,%eax
  362f2a:	83 e0 08             	and    $0x8,%eax
  362f2d:	85 c0                	test   %eax,%eax
  362f2f:	74 dc                	je     362f0d <_doio+0x97>
  362f31:	ba f0 01 00 00       	mov    $0x1f0,%edx
  362f36:	8b 45 d0             	mov    -0x30(%ebp),%eax
  362f39:	b9 00 01 00 00       	mov    $0x100,%ecx
  362f3e:	89 c6                	mov    %eax,%esi
  362f40:	fc                   	cld    
  362f41:	f3 66 6f             	rep outsw %ds:(%esi),(%dx)
  362f44:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  362f49:	8b 50 0c             	mov    0xc(%eax),%edx
  362f4c:	83 ea 01             	sub    $0x1,%edx
  362f4f:	89 50 0c             	mov    %edx,0xc(%eax)
  362f52:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  362f57:	8b 15 d0 31 37 00    	mov    0x3731d0,%edx
  362f5d:	8b 52 10             	mov    0x10(%edx),%edx
  362f60:	81 c2 00 02 00 00    	add    $0x200,%edx
  362f66:	89 50 10             	mov    %edx,0x10(%eax)
  362f69:	8d 65 f4             	lea    -0xc(%ebp),%esp
  362f6c:	5b                   	pop    %ebx
  362f6d:	5e                   	pop    %esi
  362f6e:	5f                   	pop    %edi
  362f6f:	5d                   	pop    %ebp
  362f70:	c3                   	ret    

00362f71 <_rw>:
  362f71:	55                   	push   %ebp
  362f72:	89 e5                	mov    %esp,%ebp
  362f74:	57                   	push   %edi
  362f75:	56                   	push   %esi
  362f76:	53                   	push   %ebx
  362f77:	83 ec 1c             	sub    $0x1c,%esp
  362f7a:	83 ec 0c             	sub    $0xc,%esp
  362f7d:	6a 1c                	push   $0x1c
  362f7f:	e8 af 87 00 00       	call   36b733 <kalloc>
  362f84:	83 c4 10             	add    $0x10,%esp
  362f87:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  362f8a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  362f8e:	74 52                	je     362fe2 <_rw+0x71>
  362f90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  362f93:	8b 55 08             	mov    0x8(%ebp),%edx
  362f96:	89 10                	mov    %edx,(%eax)
  362f98:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  362f9b:	8b 55 0c             	mov    0xc(%ebp),%edx
  362f9e:	89 50 04             	mov    %edx,0x4(%eax)
  362fa1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  362fa4:	8b 55 14             	mov    0x14(%ebp),%edx
  362fa7:	89 50 08             	mov    %edx,0x8(%eax)
  362faa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  362fad:	8b 55 18             	mov    0x18(%ebp),%edx
  362fb0:	89 50 0c             	mov    %edx,0xc(%eax)
  362fb3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  362fb6:	8b 55 10             	mov    0x10(%ebp),%edx
  362fb9:	89 50 10             	mov    %edx,0x10(%eax)
  362fbc:	83 ec 0c             	sub    $0xc,%esp
  362fbf:	ff 75 e4             	pushl  -0x1c(%ebp)
  362fc2:	e8 40 fc ff ff       	call   362c07 <_add>
  362fc7:	83 c4 10             	add    $0x10,%esp
  362fca:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  362fcf:	85 c0                	test   %eax,%eax
  362fd1:	75 30                	jne    363003 <_rw+0x92>
  362fd3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  362fd6:	a3 d0 31 37 00       	mov    %eax,0x3731d0
  362fdb:	e8 96 fe ff ff       	call   362e76 <_doio>
  362fe0:	eb 21                	jmp    363003 <_rw+0x92>
  362fe2:	b8 02 00 00 00       	mov    $0x2,%eax
  362fe7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  362fea:	b9 f4 ff ff ff       	mov    $0xfffffff4,%ecx
  362fef:	ba 00 00 00 00       	mov    $0x0,%edx
  362ff4:	be 00 00 00 00       	mov    $0x0,%esi
  362ff9:	bf 00 00 00 00       	mov    $0x0,%edi
  362ffe:	cd 80                	int    $0x80
  363000:	89 45 e0             	mov    %eax,-0x20(%ebp)
  363003:	8d 65 f4             	lea    -0xc(%ebp),%esp
  363006:	5b                   	pop    %ebx
  363007:	5e                   	pop    %esi
  363008:	5f                   	pop    %edi
  363009:	5d                   	pop    %ebp
  36300a:	c3                   	ret    

0036300b <at_readpage>:
  36300b:	55                   	push   %ebp
  36300c:	89 e5                	mov    %esp,%ebp
  36300e:	83 ec 08             	sub    $0x8,%esp
  363011:	8b 45 10             	mov    0x10(%ebp),%eax
  363014:	8d 14 00             	lea    (%eax,%eax,1),%edx
  363017:	8b 45 14             	mov    0x14(%ebp),%eax
  36301a:	01 c0                	add    %eax,%eax
  36301c:	83 ec 0c             	sub    $0xc,%esp
  36301f:	52                   	push   %edx
  363020:	50                   	push   %eax
  363021:	ff 75 0c             	pushl  0xc(%ebp)
  363024:	6a 20                	push   $0x20
  363026:	ff 75 08             	pushl  0x8(%ebp)
  363029:	e8 43 ff ff ff       	call   362f71 <_rw>
  36302e:	83 c4 20             	add    $0x20,%esp
  363031:	c9                   	leave  
  363032:	c3                   	ret    

00363033 <at_writepage>:
  363033:	55                   	push   %ebp
  363034:	89 e5                	mov    %esp,%ebp
  363036:	83 ec 08             	sub    $0x8,%esp
  363039:	8b 45 10             	mov    0x10(%ebp),%eax
  36303c:	8d 14 00             	lea    (%eax,%eax,1),%edx
  36303f:	8b 45 14             	mov    0x14(%ebp),%eax
  363042:	01 c0                	add    %eax,%eax
  363044:	83 ec 0c             	sub    $0xc,%esp
  363047:	52                   	push   %edx
  363048:	50                   	push   %eax
  363049:	ff 75 0c             	pushl  0xc(%ebp)
  36304c:	6a 30                	push   $0x30
  36304e:	ff 75 08             	pushl  0x8(%ebp)
  363051:	e8 1b ff ff ff       	call   362f71 <_rw>
  363056:	83 c4 20             	add    $0x20,%esp
  363059:	c9                   	leave  
  36305a:	c3                   	ret    

0036305b <_io>:
  36305b:	55                   	push   %ebp
  36305c:	89 e5                	mov    %esp,%ebp
  36305e:	57                   	push   %edi
  36305f:	56                   	push   %esi
  363060:	53                   	push   %ebx
  363061:	83 ec 2c             	sub    $0x2c,%esp
  363064:	68 f7 01 00 00       	push   $0x1f7
  363069:	e8 13 fb ff ff       	call   362b81 <inb>
  36306e:	83 c4 04             	add    $0x4,%esp
  363071:	0f b6 c0             	movzbl %al,%eax
  363074:	89 45 e0             	mov    %eax,-0x20(%ebp)
  363077:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  36307c:	85 c0                	test   %eax,%eax
  36307e:	0f 84 4f 01 00 00    	je     3631d3 <_io+0x178>
  363084:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  363089:	8b 40 10             	mov    0x10(%eax),%eax
  36308c:	89 45 dc             	mov    %eax,-0x24(%ebp)
  36308f:	e8 88 fc ff ff       	call   362d1c <at_isbusy>
  363094:	84 c0                	test   %al,%al
  363096:	74 25                	je     3630bd <_io+0x62>
  363098:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  36309d:	8b 18                	mov    (%eax),%ebx
  36309f:	b8 02 00 00 00       	mov    $0x2,%eax
  3630a4:	b9 f0 ff ff ff       	mov    $0xfffffff0,%ecx
  3630a9:	ba 00 00 00 00       	mov    $0x0,%edx
  3630ae:	be 00 00 00 00       	mov    $0x0,%esi
  3630b3:	bf 00 00 00 00       	mov    $0x0,%edi
  3630b8:	cd 80                	int    $0x80
  3630ba:	89 45 d8             	mov    %eax,-0x28(%ebp)
  3630bd:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3630c0:	83 e0 40             	and    $0x40,%eax
  3630c3:	85 c0                	test   %eax,%eax
  3630c5:	0f 84 c4 00 00 00    	je     36318f <_io+0x134>
  3630cb:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  3630d0:	8b 40 04             	mov    0x4(%eax),%eax
  3630d3:	83 f8 20             	cmp    $0x20,%eax
  3630d6:	75 15                	jne    3630ed <_io+0x92>
  3630d8:	ba f0 01 00 00       	mov    $0x1f0,%edx
  3630dd:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3630e0:	b9 00 01 00 00       	mov    $0x100,%ecx
  3630e5:	89 c7                	mov    %eax,%edi
  3630e7:	fc                   	cld    
  3630e8:	f3 66 6d             	rep insw (%dx),%es:(%edi)
  3630eb:	eb 7d                	jmp    36316a <_io+0x10f>
  3630ed:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  3630f2:	8b 40 04             	mov    0x4(%eax),%eax
  3630f5:	83 f8 30             	cmp    $0x30,%eax
  3630f8:	75 42                	jne    36313c <_io+0xe1>
  3630fa:	c7 45 e4 50 c3 00 00 	movl   $0xc350,-0x1c(%ebp)
  363101:	eb 04                	jmp    363107 <_io+0xac>
  363103:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  363107:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  36310b:	74 1a                	je     363127 <_io+0xcc>
  36310d:	83 ec 0c             	sub    $0xc,%esp
  363110:	68 f7 01 00 00       	push   $0x1f7
  363115:	e8 c5 fa ff ff       	call   362bdf <inb_p>
  36311a:	83 c4 10             	add    $0x10,%esp
  36311d:	0f b6 c0             	movzbl %al,%eax
  363120:	83 e0 08             	and    $0x8,%eax
  363123:	85 c0                	test   %eax,%eax
  363125:	74 dc                	je     363103 <_io+0xa8>
  363127:	ba f0 01 00 00       	mov    $0x1f0,%edx
  36312c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36312f:	b9 00 01 00 00       	mov    $0x100,%ecx
  363134:	89 c6                	mov    %eax,%esi
  363136:	fc                   	cld    
  363137:	f3 66 6f             	rep outsw %ds:(%esi),(%dx)
  36313a:	eb 2e                	jmp    36316a <_io+0x10f>
  36313c:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  363141:	8b 40 04             	mov    0x4(%eax),%eax
  363144:	83 ec 04             	sub    $0x4,%esp
  363147:	50                   	push   %eax
  363148:	68 4c d3 36 00       	push   $0x36d34c
  36314d:	68 80 d3 36 00       	push   $0x36d380
  363152:	e8 31 5f 00 00       	call   369088 <printk>
  363157:	83 c4 10             	add    $0x10,%esp
  36315a:	83 ec 0c             	sub    $0xc,%esp
  36315d:	68 a4 d3 36 00       	push   $0x36d3a4
  363162:	e8 05 5f 00 00       	call   36906c <panic>
  363167:	83 c4 10             	add    $0x10,%esp
  36316a:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  36316f:	8b 15 d0 31 37 00    	mov    0x3731d0,%edx
  363175:	8b 52 10             	mov    0x10(%edx),%edx
  363178:	81 c2 00 02 00 00    	add    $0x200,%edx
  36317e:	89 50 10             	mov    %edx,0x10(%eax)
  363181:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  363186:	8b 50 0c             	mov    0xc(%eax),%edx
  363189:	83 ea 01             	sub    $0x1,%edx
  36318c:	89 50 0c             	mov    %edx,0xc(%eax)
  36318f:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  363194:	8b 40 0c             	mov    0xc(%eax),%eax
  363197:	85 c0                	test   %eax,%eax
  363199:	75 38                	jne    3631d3 <_io+0x178>
  36319b:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  3631a0:	8b 18                	mov    (%eax),%ebx
  3631a2:	b8 02 00 00 00       	mov    $0x2,%eax
  3631a7:	b9 00 00 00 00       	mov    $0x0,%ecx
  3631ac:	ba 00 00 00 00       	mov    $0x0,%edx
  3631b1:	be 00 00 00 00       	mov    $0x0,%esi
  3631b6:	bf 00 00 00 00       	mov    $0x0,%edi
  3631bb:	cd 80                	int    $0x80
  3631bd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  3631c0:	e8 e5 fa ff ff       	call   362caa <_sub>
  3631c5:	a1 d0 31 37 00       	mov    0x3731d0,%eax
  3631ca:	85 c0                	test   %eax,%eax
  3631cc:	74 05                	je     3631d3 <_io+0x178>
  3631ce:	e8 a3 fc ff ff       	call   362e76 <_doio>
  3631d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  3631d6:	5b                   	pop    %ebx
  3631d7:	5e                   	pop    %esi
  3631d8:	5f                   	pop    %edi
  3631d9:	5d                   	pop    %ebp
  3631da:	c3                   	ret    

003631db <at_init>:
  3631db:	55                   	push   %ebp
  3631dc:	89 e5                	mov    %esp,%ebp
  3631de:	57                   	push   %edi
  3631df:	56                   	push   %esi
  3631e0:	53                   	push   %ebx
  3631e1:	83 ec 1c             	sub    $0x1c,%esp
  3631e4:	83 ec 08             	sub    $0x8,%esp
  3631e7:	68 4c d3 36 00       	push   $0x36d34c
  3631ec:	68 c0 d3 36 00       	push   $0x36d3c0
  3631f1:	e8 92 5e 00 00       	call   369088 <printk>
  3631f6:	83 c4 10             	add    $0x10,%esp
  3631f9:	b8 03 00 00 00       	mov    $0x3,%eax
  3631fe:	bb 08 00 00 00       	mov    $0x8,%ebx
  363203:	b9 33 30 36 00       	mov    $0x363033,%ecx
  363208:	ba 00 00 00 00       	mov    $0x0,%edx
  36320d:	be 00 00 00 00       	mov    $0x0,%esi
  363212:	bf 00 00 00 00       	mov    $0x0,%edi
  363217:	cd 80                	int    $0x80
  363219:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36321c:	b8 03 00 00 00       	mov    $0x3,%eax
  363221:	bb 07 00 00 00       	mov    $0x7,%ebx
  363226:	b9 0b 30 36 00       	mov    $0x36300b,%ecx
  36322b:	ba 00 00 00 00       	mov    $0x0,%edx
  363230:	be 00 00 00 00       	mov    $0x0,%esi
  363235:	bf 00 00 00 00       	mov    $0x0,%edi
  36323a:	cd 80                	int    $0x80
  36323c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36323f:	b8 03 00 00 00       	mov    $0x3,%eax
  363244:	bb 0a 00 00 00       	mov    $0xa,%ebx
  363249:	b9 5b 30 36 00       	mov    $0x36305b,%ecx
  36324e:	ba 00 00 00 00       	mov    $0x0,%edx
  363253:	be 00 00 00 00       	mov    $0x0,%esi
  363258:	bf 00 00 00 00       	mov    $0x0,%edi
  36325d:	cd 80                	int    $0x80
  36325f:	89 45 dc             	mov    %eax,-0x24(%ebp)
  363262:	b8 01 00 00 00       	mov    $0x1,%eax
  363267:	bb 04 00 00 00       	mov    $0x4,%ebx
  36326c:	b9 13 00 00 00       	mov    $0x13,%ecx
  363271:	ba 0e 00 00 00       	mov    $0xe,%edx
  363276:	be 00 00 00 00       	mov    $0x0,%esi
  36327b:	bf 00 00 00 00       	mov    $0x0,%edi
  363280:	cd 80                	int    $0x80
  363282:	89 45 d8             	mov    %eax,-0x28(%ebp)
  363285:	83 ec 08             	sub    $0x8,%esp
  363288:	68 f6 03 00 00       	push   $0x3f6
  36328d:	6a 0c                	push   $0xc
  36328f:	e8 1f f9 ff ff       	call   362bb3 <outb_p>
  363294:	83 c4 10             	add    $0x10,%esp
  363297:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36329a:	5b                   	pop    %ebx
  36329b:	5e                   	pop    %esi
  36329c:	5f                   	pop    %edi
  36329d:	5d                   	pop    %ebp
  36329e:	c3                   	ret    

0036329f <at_main>:
  36329f:	55                   	push   %ebp
  3632a0:	89 e5                	mov    %esp,%ebp
  3632a2:	57                   	push   %edi
  3632a3:	56                   	push   %esi
  3632a4:	53                   	push   %ebx
  3632a5:	83 ec 1c             	sub    $0x1c,%esp
  3632a8:	e8 2e ff ff ff       	call   3631db <at_init>
  3632ad:	83 ec 08             	sub    $0x8,%esp
  3632b0:	68 4c d3 36 00       	push   $0x36d34c
  3632b5:	68 d6 d3 36 00       	push   $0x36d3d6
  3632ba:	e8 c9 5d 00 00       	call   369088 <printk>
  3632bf:	83 c4 10             	add    $0x10,%esp
  3632c2:	b8 00 00 00 00       	mov    $0x0,%eax
  3632c7:	bb 00 00 00 00       	mov    $0x0,%ebx
  3632cc:	b9 00 00 00 00       	mov    $0x0,%ecx
  3632d1:	ba 00 00 00 00       	mov    $0x0,%edx
  3632d6:	be 00 00 00 00       	mov    $0x0,%esi
  3632db:	bf 00 00 00 00       	mov    $0x0,%edi
  3632e0:	cd 80                	int    $0x80
  3632e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3632e5:	b8 00 00 00 00       	mov    $0x0,%eax
  3632ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
  3632ed:	5b                   	pop    %ebx
  3632ee:	5e                   	pop    %esi
  3632ef:	5f                   	pop    %edi
  3632f0:	5d                   	pop    %ebp
  3632f1:	c3                   	ret    

003632f2 <memcpy>:
  3632f2:	55                   	push   %ebp
  3632f3:	89 e5                	mov    %esp,%ebp
  3632f5:	57                   	push   %edi
  3632f6:	56                   	push   %esi
  3632f7:	53                   	push   %ebx
  3632f8:	8b 45 10             	mov    0x10(%ebp),%eax
  3632fb:	8b 55 0c             	mov    0xc(%ebp),%edx
  3632fe:	8b 5d 08             	mov    0x8(%ebp),%ebx
  363301:	89 c1                	mov    %eax,%ecx
  363303:	89 d6                	mov    %edx,%esi
  363305:	89 df                	mov    %ebx,%edi
  363307:	fc                   	cld    
  363308:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  36330a:	8b 45 08             	mov    0x8(%ebp),%eax
  36330d:	5b                   	pop    %ebx
  36330e:	5e                   	pop    %esi
  36330f:	5f                   	pop    %edi
  363310:	5d                   	pop    %ebp
  363311:	c3                   	ret    

00363312 <ramdisk_readpage>:
  363312:	55                   	push   %ebp
  363313:	89 e5                	mov    %esp,%ebp
  363315:	57                   	push   %edi
  363316:	56                   	push   %esi
  363317:	53                   	push   %ebx
  363318:	83 ec 10             	sub    $0x10,%esp
  36331b:	8b 45 14             	mov    0x14(%ebp),%eax
  36331e:	c1 e0 0a             	shl    $0xa,%eax
  363321:	89 45 f0             	mov    %eax,-0x10(%ebp)
  363324:	8b 45 10             	mov    0x10(%ebp),%eax
  363327:	c1 e0 0a             	shl    $0xa,%eax
  36332a:	89 c2                	mov    %eax,%edx
  36332c:	8b 0d dc 3c 37 00    	mov    0x373cdc,%ecx
  363332:	8b 45 f0             	mov    -0x10(%ebp),%eax
  363335:	29 c1                	sub    %eax,%ecx
  363337:	89 c8                	mov    %ecx,%eax
  363339:	39 c2                	cmp    %eax,%edx
  36333b:	0f 46 c2             	cmovbe %edx,%eax
  36333e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  363341:	8b 55 f0             	mov    -0x10(%ebp),%edx
  363344:	a1 dc 3c 37 00       	mov    0x373cdc,%eax
  363349:	39 c2                	cmp    %eax,%edx
  36334b:	76 23                	jbe    363370 <ramdisk_readpage+0x5e>
  36334d:	b8 02 00 00 00       	mov    $0x2,%eax
  363352:	8b 5d 08             	mov    0x8(%ebp),%ebx
  363355:	b9 e4 ff ff ff       	mov    $0xffffffe4,%ecx
  36335a:	ba 00 00 00 00       	mov    $0x0,%edx
  36335f:	be 00 00 00 00       	mov    $0x0,%esi
  363364:	bf 00 00 00 00       	mov    $0x0,%edi
  363369:	cd 80                	int    $0x80
  36336b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36336e:	eb 3c                	jmp    3633ac <ramdisk_readpage+0x9a>
  363370:	8b 45 ec             	mov    -0x14(%ebp),%eax
  363373:	8b 0d d8 31 37 00    	mov    0x3731d8,%ecx
  363379:	8b 55 f0             	mov    -0x10(%ebp),%edx
  36337c:	01 ca                	add    %ecx,%edx
  36337e:	50                   	push   %eax
  36337f:	52                   	push   %edx
  363380:	ff 75 0c             	pushl  0xc(%ebp)
  363383:	e8 6a ff ff ff       	call   3632f2 <memcpy>
  363388:	83 c4 0c             	add    $0xc,%esp
  36338b:	b8 02 00 00 00       	mov    $0x2,%eax
  363390:	8b 5d 08             	mov    0x8(%ebp),%ebx
  363393:	b9 00 00 00 00       	mov    $0x0,%ecx
  363398:	ba 00 00 00 00       	mov    $0x0,%edx
  36339d:	be 00 00 00 00       	mov    $0x0,%esi
  3633a2:	bf 00 00 00 00       	mov    $0x0,%edi
  3633a7:	cd 80                	int    $0x80
  3633a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3633ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
  3633af:	5b                   	pop    %ebx
  3633b0:	5e                   	pop    %esi
  3633b1:	5f                   	pop    %edi
  3633b2:	5d                   	pop    %ebp
  3633b3:	c3                   	ret    

003633b4 <ramdisk_writepage>:
  3633b4:	55                   	push   %ebp
  3633b5:	89 e5                	mov    %esp,%ebp
  3633b7:	57                   	push   %edi
  3633b8:	56                   	push   %esi
  3633b9:	53                   	push   %ebx
  3633ba:	83 ec 10             	sub    $0x10,%esp
  3633bd:	8b 45 14             	mov    0x14(%ebp),%eax
  3633c0:	c1 e0 0a             	shl    $0xa,%eax
  3633c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3633c6:	8b 45 10             	mov    0x10(%ebp),%eax
  3633c9:	c1 e0 0a             	shl    $0xa,%eax
  3633cc:	89 c2                	mov    %eax,%edx
  3633ce:	8b 0d dc 3c 37 00    	mov    0x373cdc,%ecx
  3633d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3633d7:	29 c1                	sub    %eax,%ecx
  3633d9:	89 c8                	mov    %ecx,%eax
  3633db:	39 c2                	cmp    %eax,%edx
  3633dd:	0f 46 c2             	cmovbe %edx,%eax
  3633e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3633e3:	8b 55 f0             	mov    -0x10(%ebp),%edx
  3633e6:	a1 dc 3c 37 00       	mov    0x373cdc,%eax
  3633eb:	39 c2                	cmp    %eax,%edx
  3633ed:	76 23                	jbe    363412 <ramdisk_writepage+0x5e>
  3633ef:	b8 02 00 00 00       	mov    $0x2,%eax
  3633f4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3633f7:	b9 e4 ff ff ff       	mov    $0xffffffe4,%ecx
  3633fc:	ba 00 00 00 00       	mov    $0x0,%edx
  363401:	be 00 00 00 00       	mov    $0x0,%esi
  363406:	bf 00 00 00 00       	mov    $0x0,%edi
  36340b:	cd 80                	int    $0x80
  36340d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  363410:	eb 3c                	jmp    36344e <ramdisk_writepage+0x9a>
  363412:	8b 45 ec             	mov    -0x14(%ebp),%eax
  363415:	8b 0d d8 31 37 00    	mov    0x3731d8,%ecx
  36341b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  36341e:	01 ca                	add    %ecx,%edx
  363420:	50                   	push   %eax
  363421:	ff 75 0c             	pushl  0xc(%ebp)
  363424:	52                   	push   %edx
  363425:	e8 c8 fe ff ff       	call   3632f2 <memcpy>
  36342a:	83 c4 0c             	add    $0xc,%esp
  36342d:	b8 02 00 00 00       	mov    $0x2,%eax
  363432:	8b 5d 08             	mov    0x8(%ebp),%ebx
  363435:	b9 00 00 00 00       	mov    $0x0,%ecx
  36343a:	ba 00 00 00 00       	mov    $0x0,%edx
  36343f:	be 00 00 00 00       	mov    $0x0,%esi
  363444:	bf 00 00 00 00       	mov    $0x0,%edi
  363449:	cd 80                	int    $0x80
  36344b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36344e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  363451:	5b                   	pop    %ebx
  363452:	5e                   	pop    %esi
  363453:	5f                   	pop    %edi
  363454:	5d                   	pop    %ebp
  363455:	c3                   	ret    

00363456 <ramdisk_read>:
  363456:	55                   	push   %ebp
  363457:	89 e5                	mov    %esp,%ebp
  363459:	57                   	push   %edi
  36345a:	56                   	push   %esi
  36345b:	53                   	push   %ebx
  36345c:	83 ec 10             	sub    $0x10,%esp
  36345f:	a1 dc 3c 37 00       	mov    0x373cdc,%eax
  363464:	8b 15 dc 31 37 00    	mov    0x3731dc,%edx
  36346a:	29 d0                	sub    %edx,%eax
  36346c:	89 c2                	mov    %eax,%edx
  36346e:	8b 45 10             	mov    0x10(%ebp),%eax
  363471:	39 c2                	cmp    %eax,%edx
  363473:	0f 46 c2             	cmovbe %edx,%eax
  363476:	89 45 f0             	mov    %eax,-0x10(%ebp)
  363479:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36347c:	8b 15 d8 31 37 00    	mov    0x3731d8,%edx
  363482:	8b 0d dc 31 37 00    	mov    0x3731dc,%ecx
  363488:	01 ca                	add    %ecx,%edx
  36348a:	50                   	push   %eax
  36348b:	52                   	push   %edx
  36348c:	ff 75 0c             	pushl  0xc(%ebp)
  36348f:	e8 5e fe ff ff       	call   3632f2 <memcpy>
  363494:	83 c4 0c             	add    $0xc,%esp
  363497:	a1 dc 31 37 00       	mov    0x3731dc,%eax
  36349c:	89 c2                	mov    %eax,%edx
  36349e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3634a1:	01 d0                	add    %edx,%eax
  3634a3:	a3 dc 31 37 00       	mov    %eax,0x3731dc
  3634a8:	b8 02 00 00 00       	mov    $0x2,%eax
  3634ad:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3634b0:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  3634b3:	ba 00 00 00 00       	mov    $0x0,%edx
  3634b8:	be 00 00 00 00       	mov    $0x0,%esi
  3634bd:	bf 00 00 00 00       	mov    $0x0,%edi
  3634c2:	cd 80                	int    $0x80
  3634c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3634c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  3634ca:	5b                   	pop    %ebx
  3634cb:	5e                   	pop    %esi
  3634cc:	5f                   	pop    %edi
  3634cd:	5d                   	pop    %ebp
  3634ce:	c3                   	ret    

003634cf <ramdisk_write>:
  3634cf:	55                   	push   %ebp
  3634d0:	89 e5                	mov    %esp,%ebp
  3634d2:	57                   	push   %edi
  3634d3:	56                   	push   %esi
  3634d4:	53                   	push   %ebx
  3634d5:	83 ec 10             	sub    $0x10,%esp
  3634d8:	a1 dc 3c 37 00       	mov    0x373cdc,%eax
  3634dd:	8b 15 dc 31 37 00    	mov    0x3731dc,%edx
  3634e3:	29 d0                	sub    %edx,%eax
  3634e5:	89 c2                	mov    %eax,%edx
  3634e7:	8b 45 10             	mov    0x10(%ebp),%eax
  3634ea:	39 c2                	cmp    %eax,%edx
  3634ec:	0f 46 c2             	cmovbe %edx,%eax
  3634ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3634f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3634f5:	8b 15 d8 31 37 00    	mov    0x3731d8,%edx
  3634fb:	8b 0d dc 31 37 00    	mov    0x3731dc,%ecx
  363501:	01 ca                	add    %ecx,%edx
  363503:	50                   	push   %eax
  363504:	ff 75 0c             	pushl  0xc(%ebp)
  363507:	52                   	push   %edx
  363508:	e8 e5 fd ff ff       	call   3632f2 <memcpy>
  36350d:	83 c4 0c             	add    $0xc,%esp
  363510:	a1 dc 31 37 00       	mov    0x3731dc,%eax
  363515:	89 c2                	mov    %eax,%edx
  363517:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36351a:	01 d0                	add    %edx,%eax
  36351c:	a3 dc 31 37 00       	mov    %eax,0x3731dc
  363521:	b8 02 00 00 00       	mov    $0x2,%eax
  363526:	8b 5d 08             	mov    0x8(%ebp),%ebx
  363529:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  36352c:	ba 00 00 00 00       	mov    $0x0,%edx
  363531:	be 00 00 00 00       	mov    $0x0,%esi
  363536:	bf 00 00 00 00       	mov    $0x0,%edi
  36353b:	cd 80                	int    $0x80
  36353d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  363540:	8d 65 f4             	lea    -0xc(%ebp),%esp
  363543:	5b                   	pop    %ebx
  363544:	5e                   	pop    %esi
  363545:	5f                   	pop    %edi
  363546:	5d                   	pop    %ebp
  363547:	c3                   	ret    

00363548 <ramdisk_open>:
  363548:	55                   	push   %ebp
  363549:	89 e5                	mov    %esp,%ebp
  36354b:	57                   	push   %edi
  36354c:	56                   	push   %esi
  36354d:	53                   	push   %ebx
  36354e:	83 ec 10             	sub    $0x10,%esp
  363551:	b8 02 00 00 00       	mov    $0x2,%eax
  363556:	8b 5d 08             	mov    0x8(%ebp),%ebx
  363559:	b9 08 00 00 00       	mov    $0x8,%ecx
  36355e:	ba 00 00 00 00       	mov    $0x0,%edx
  363563:	be 00 00 00 00       	mov    $0x0,%esi
  363568:	bf 00 00 00 00       	mov    $0x0,%edi
  36356d:	cd 80                	int    $0x80
  36356f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  363572:	83 c4 10             	add    $0x10,%esp
  363575:	5b                   	pop    %ebx
  363576:	5e                   	pop    %esi
  363577:	5f                   	pop    %edi
  363578:	5d                   	pop    %ebp
  363579:	c3                   	ret    

0036357a <ramdisk_init>:
  36357a:	55                   	push   %ebp
  36357b:	89 e5                	mov    %esp,%ebp
  36357d:	57                   	push   %edi
  36357e:	56                   	push   %esi
  36357f:	53                   	push   %ebx
  363580:	83 ec 20             	sub    $0x20,%esp
  363583:	c7 05 d8 31 37 00 00 	movl   $0x200000,0x3731d8
  36358a:	00 20 00 
  36358d:	b8 03 00 00 00       	mov    $0x3,%eax
  363592:	bb 00 00 00 00       	mov    $0x0,%ebx
  363597:	b9 48 35 36 00       	mov    $0x363548,%ecx
  36359c:	ba 00 00 00 00       	mov    $0x0,%edx
  3635a1:	be 00 00 00 00       	mov    $0x0,%esi
  3635a6:	bf 00 00 00 00       	mov    $0x0,%edi
  3635ab:	cd 80                	int    $0x80
  3635ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3635b0:	b8 03 00 00 00       	mov    $0x3,%eax
  3635b5:	bb 05 00 00 00       	mov    $0x5,%ebx
  3635ba:	b9 56 34 36 00       	mov    $0x363456,%ecx
  3635bf:	ba 00 00 00 00       	mov    $0x0,%edx
  3635c4:	be 00 00 00 00       	mov    $0x0,%esi
  3635c9:	bf 00 00 00 00       	mov    $0x0,%edi
  3635ce:	cd 80                	int    $0x80
  3635d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3635d3:	b8 03 00 00 00       	mov    $0x3,%eax
  3635d8:	bb 06 00 00 00       	mov    $0x6,%ebx
  3635dd:	b9 cf 34 36 00       	mov    $0x3634cf,%ecx
  3635e2:	ba 00 00 00 00       	mov    $0x0,%edx
  3635e7:	be 00 00 00 00       	mov    $0x0,%esi
  3635ec:	bf 00 00 00 00       	mov    $0x0,%edi
  3635f1:	cd 80                	int    $0x80
  3635f3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3635f6:	b8 03 00 00 00       	mov    $0x3,%eax
  3635fb:	bb 07 00 00 00       	mov    $0x7,%ebx
  363600:	b9 12 33 36 00       	mov    $0x363312,%ecx
  363605:	ba 00 00 00 00       	mov    $0x0,%edx
  36360a:	be 00 00 00 00       	mov    $0x0,%esi
  36360f:	bf 00 00 00 00       	mov    $0x0,%edi
  363614:	cd 80                	int    $0x80
  363616:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  363619:	b8 03 00 00 00       	mov    $0x3,%eax
  36361e:	bb 08 00 00 00       	mov    $0x8,%ebx
  363623:	b9 b4 33 36 00       	mov    $0x3633b4,%ecx
  363628:	ba 00 00 00 00       	mov    $0x0,%edx
  36362d:	be 00 00 00 00       	mov    $0x0,%esi
  363632:	bf 00 00 00 00       	mov    $0x0,%edi
  363637:	cd 80                	int    $0x80
  363639:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36363c:	83 c4 20             	add    $0x20,%esp
  36363f:	5b                   	pop    %ebx
  363640:	5e                   	pop    %esi
  363641:	5f                   	pop    %edi
  363642:	5d                   	pop    %ebp
  363643:	c3                   	ret    

00363644 <ramdisk_main>:
  363644:	55                   	push   %ebp
  363645:	89 e5                	mov    %esp,%ebp
  363647:	57                   	push   %edi
  363648:	56                   	push   %esi
  363649:	53                   	push   %ebx
  36364a:	83 ec 10             	sub    $0x10,%esp
  36364d:	e8 28 ff ff ff       	call   36357a <ramdisk_init>
  363652:	b8 00 00 00 00       	mov    $0x0,%eax
  363657:	bb 00 00 00 00       	mov    $0x0,%ebx
  36365c:	b9 00 00 00 00       	mov    $0x0,%ecx
  363661:	ba 00 00 00 00       	mov    $0x0,%edx
  363666:	be 00 00 00 00       	mov    $0x0,%esi
  36366b:	bf 00 00 00 00       	mov    $0x0,%edi
  363670:	cd 80                	int    $0x80
  363672:	89 45 f0             	mov    %eax,-0x10(%ebp)
  363675:	b8 00 00 00 00       	mov    $0x0,%eax
  36367a:	83 c4 10             	add    $0x10,%esp
  36367d:	5b                   	pop    %ebx
  36367e:	5e                   	pop    %esi
  36367f:	5f                   	pop    %edi
  363680:	5d                   	pop    %ebp
  363681:	c3                   	ret    

00363682 <outb>:
  363682:	55                   	push   %ebp
  363683:	89 e5                	mov    %esp,%ebp
  363685:	83 ec 08             	sub    $0x8,%esp
  363688:	8b 55 08             	mov    0x8(%ebp),%edx
  36368b:	8b 45 0c             	mov    0xc(%ebp),%eax
  36368e:	88 55 fc             	mov    %dl,-0x4(%ebp)
  363691:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  363695:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  363699:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  36369d:	ee                   	out    %al,(%dx)
  36369e:	c9                   	leave  
  36369f:	c3                   	ret    

003636a0 <inb>:
  3636a0:	55                   	push   %ebp
  3636a1:	89 e5                	mov    %esp,%ebp
  3636a3:	83 ec 14             	sub    $0x14,%esp
  3636a6:	8b 45 08             	mov    0x8(%ebp),%eax
  3636a9:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  3636ad:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  3636b1:	89 c2                	mov    %eax,%edx
  3636b3:	ec                   	in     (%dx),%al
  3636b4:	88 45 ff             	mov    %al,-0x1(%ebp)
  3636b7:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  3636bb:	c9                   	leave  
  3636bc:	c3                   	ret    

003636bd <io_delay>:
  3636bd:	55                   	push   %ebp
  3636be:	89 e5                	mov    %esp,%ebp
  3636c0:	83 ec 10             	sub    $0x10,%esp
  3636c3:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
  3636c9:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  3636cd:	89 c2                	mov    %eax,%edx
  3636cf:	ee                   	out    %al,(%dx)
  3636d0:	c9                   	leave  
  3636d1:	c3                   	ret    

003636d2 <outb_p>:
  3636d2:	55                   	push   %ebp
  3636d3:	89 e5                	mov    %esp,%ebp
  3636d5:	83 ec 08             	sub    $0x8,%esp
  3636d8:	8b 55 08             	mov    0x8(%ebp),%edx
  3636db:	8b 45 0c             	mov    0xc(%ebp),%eax
  3636de:	88 55 fc             	mov    %dl,-0x4(%ebp)
  3636e1:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  3636e5:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  3636e9:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  3636ed:	52                   	push   %edx
  3636ee:	50                   	push   %eax
  3636ef:	e8 8e ff ff ff       	call   363682 <outb>
  3636f4:	83 c4 08             	add    $0x8,%esp
  3636f7:	e8 c1 ff ff ff       	call   3636bd <io_delay>
  3636fc:	c9                   	leave  
  3636fd:	c3                   	ret    

003636fe <inb_p>:
  3636fe:	55                   	push   %ebp
  3636ff:	89 e5                	mov    %esp,%ebp
  363701:	83 ec 14             	sub    $0x14,%esp
  363704:	8b 45 08             	mov    0x8(%ebp),%eax
  363707:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  36370b:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  36370f:	50                   	push   %eax
  363710:	e8 8b ff ff ff       	call   3636a0 <inb>
  363715:	83 c4 04             	add    $0x4,%esp
  363718:	88 45 ff             	mov    %al,-0x1(%ebp)
  36371b:	e8 9d ff ff ff       	call   3636bd <io_delay>
  363720:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  363724:	c9                   	leave  
  363725:	c3                   	ret    

00363726 <set_top>:
  363726:	55                   	push   %ebp
  363727:	89 e5                	mov    %esp,%ebp
  363729:	a1 f4 31 37 00       	mov    0x3731f4,%eax
  36372e:	39 45 08             	cmp    %eax,0x8(%ebp)
  363731:	74 05                	je     363738 <set_top+0x12>
  363733:	e9 89 00 00 00       	jmp    3637c1 <set_top+0x9b>
  363738:	68 d4 03 00 00       	push   $0x3d4
  36373d:	6a 0c                	push   $0xc
  36373f:	e8 8e ff ff ff       	call   3636d2 <outb_p>
  363744:	83 c4 08             	add    $0x8,%esp
  363747:	8b 45 08             	mov    0x8(%ebp),%eax
  36374a:	c1 e0 02             	shl    $0x2,%eax
  36374d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363754:	29 c2                	sub    %eax,%edx
  363756:	89 d0                	mov    %edx,%eax
  363758:	05 84 3c 37 00       	add    $0x373c84,%eax
  36375d:	8b 50 0c             	mov    0xc(%eax),%edx
  363760:	a1 e4 31 37 00       	mov    0x3731e4,%eax
  363765:	29 c2                	sub    %eax,%edx
  363767:	89 d0                	mov    %edx,%eax
  363769:	c1 e8 09             	shr    $0x9,%eax
  36376c:	0f b6 c0             	movzbl %al,%eax
  36376f:	68 d5 03 00 00       	push   $0x3d5
  363774:	50                   	push   %eax
  363775:	e8 58 ff ff ff       	call   3636d2 <outb_p>
  36377a:	83 c4 08             	add    $0x8,%esp
  36377d:	68 d4 03 00 00       	push   $0x3d4
  363782:	6a 0d                	push   $0xd
  363784:	e8 49 ff ff ff       	call   3636d2 <outb_p>
  363789:	83 c4 08             	add    $0x8,%esp
  36378c:	8b 45 08             	mov    0x8(%ebp),%eax
  36378f:	c1 e0 02             	shl    $0x2,%eax
  363792:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363799:	29 c2                	sub    %eax,%edx
  36379b:	89 d0                	mov    %edx,%eax
  36379d:	05 84 3c 37 00       	add    $0x373c84,%eax
  3637a2:	8b 50 0c             	mov    0xc(%eax),%edx
  3637a5:	a1 e4 31 37 00       	mov    0x3731e4,%eax
  3637aa:	29 c2                	sub    %eax,%edx
  3637ac:	89 d0                	mov    %edx,%eax
  3637ae:	d1 e8                	shr    %eax
  3637b0:	0f b6 c0             	movzbl %al,%eax
  3637b3:	68 d5 03 00 00       	push   $0x3d5
  3637b8:	50                   	push   %eax
  3637b9:	e8 14 ff ff ff       	call   3636d2 <outb_p>
  3637be:	83 c4 08             	add    $0x8,%esp
  3637c1:	c9                   	leave  
  3637c2:	c3                   	ret    

003637c3 <set_cur>:
  3637c3:	55                   	push   %ebp
  3637c4:	89 e5                	mov    %esp,%ebp
  3637c6:	a1 f4 31 37 00       	mov    0x3731f4,%eax
  3637cb:	39 45 08             	cmp    %eax,0x8(%ebp)
  3637ce:	74 05                	je     3637d5 <set_cur+0x12>
  3637d0:	e9 89 00 00 00       	jmp    36385e <set_cur+0x9b>
  3637d5:	68 d4 03 00 00       	push   $0x3d4
  3637da:	6a 0e                	push   $0xe
  3637dc:	e8 f1 fe ff ff       	call   3636d2 <outb_p>
  3637e1:	83 c4 08             	add    $0x8,%esp
  3637e4:	8b 45 08             	mov    0x8(%ebp),%eax
  3637e7:	c1 e0 02             	shl    $0x2,%eax
  3637ea:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3637f1:	29 c2                	sub    %eax,%edx
  3637f3:	89 d0                	mov    %edx,%eax
  3637f5:	05 94 3c 37 00       	add    $0x373c94,%eax
  3637fa:	8b 50 04             	mov    0x4(%eax),%edx
  3637fd:	a1 e4 31 37 00       	mov    0x3731e4,%eax
  363802:	29 c2                	sub    %eax,%edx
  363804:	89 d0                	mov    %edx,%eax
  363806:	c1 e8 09             	shr    $0x9,%eax
  363809:	0f b6 c0             	movzbl %al,%eax
  36380c:	68 d5 03 00 00       	push   $0x3d5
  363811:	50                   	push   %eax
  363812:	e8 bb fe ff ff       	call   3636d2 <outb_p>
  363817:	83 c4 08             	add    $0x8,%esp
  36381a:	68 d4 03 00 00       	push   $0x3d4
  36381f:	6a 0f                	push   $0xf
  363821:	e8 ac fe ff ff       	call   3636d2 <outb_p>
  363826:	83 c4 08             	add    $0x8,%esp
  363829:	8b 45 08             	mov    0x8(%ebp),%eax
  36382c:	c1 e0 02             	shl    $0x2,%eax
  36382f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363836:	29 c2                	sub    %eax,%edx
  363838:	89 d0                	mov    %edx,%eax
  36383a:	05 94 3c 37 00       	add    $0x373c94,%eax
  36383f:	8b 50 04             	mov    0x4(%eax),%edx
  363842:	a1 e4 31 37 00       	mov    0x3731e4,%eax
  363847:	29 c2                	sub    %eax,%edx
  363849:	89 d0                	mov    %edx,%eax
  36384b:	d1 e8                	shr    %eax
  36384d:	0f b6 c0             	movzbl %al,%eax
  363850:	68 d5 03 00 00       	push   $0x3d5
  363855:	50                   	push   %eax
  363856:	e8 77 fe ff ff       	call   3636d2 <outb_p>
  36385b:	83 c4 08             	add    $0x8,%esp
  36385e:	c9                   	leave  
  36385f:	c3                   	ret    

00363860 <scrup>:
  363860:	55                   	push   %ebp
  363861:	89 e5                	mov    %esp,%ebp
  363863:	8b 45 08             	mov    0x8(%ebp),%eax
  363866:	c1 e0 02             	shl    $0x2,%eax
  363869:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363870:	29 c2                	sub    %eax,%edx
  363872:	89 d0                	mov    %edx,%eax
  363874:	05 94 3c 37 00       	add    $0x373c94,%eax
  363879:	8b 10                	mov    (%eax),%edx
  36387b:	8b 45 08             	mov    0x8(%ebp),%eax
  36387e:	c1 e0 02             	shl    $0x2,%eax
  363881:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363888:	29 c1                	sub    %eax,%ecx
  36388a:	89 c8                	mov    %ecx,%eax
  36388c:	05 94 3c 37 00       	add    $0x373c94,%eax
  363891:	8b 40 04             	mov    0x4(%eax),%eax
  363894:	39 c2                	cmp    %eax,%edx
  363896:	76 02                	jbe    36389a <scrup+0x3a>
  363898:	eb 7b                	jmp    363915 <scrup+0xb5>
  36389a:	8b 45 08             	mov    0x8(%ebp),%eax
  36389d:	c1 e0 02             	shl    $0x2,%eax
  3638a0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3638a7:	29 c2                	sub    %eax,%edx
  3638a9:	89 d0                	mov    %edx,%eax
  3638ab:	05 84 3c 37 00       	add    $0x373c84,%eax
  3638b0:	8b 50 0c             	mov    0xc(%eax),%edx
  3638b3:	a1 f0 31 37 00       	mov    0x3731f0,%eax
  3638b8:	01 c2                	add    %eax,%edx
  3638ba:	8b 45 08             	mov    0x8(%ebp),%eax
  3638bd:	c1 e0 02             	shl    $0x2,%eax
  3638c0:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  3638c7:	29 c1                	sub    %eax,%ecx
  3638c9:	89 c8                	mov    %ecx,%eax
  3638cb:	05 84 3c 37 00       	add    $0x373c84,%eax
  3638d0:	89 50 0c             	mov    %edx,0xc(%eax)
  3638d3:	8b 45 08             	mov    0x8(%ebp),%eax
  3638d6:	c1 e0 02             	shl    $0x2,%eax
  3638d9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3638e0:	29 c2                	sub    %eax,%edx
  3638e2:	89 d0                	mov    %edx,%eax
  3638e4:	05 94 3c 37 00       	add    $0x373c94,%eax
  3638e9:	8b 10                	mov    (%eax),%edx
  3638eb:	a1 f0 31 37 00       	mov    0x3731f0,%eax
  3638f0:	01 c2                	add    %eax,%edx
  3638f2:	8b 45 08             	mov    0x8(%ebp),%eax
  3638f5:	c1 e0 02             	shl    $0x2,%eax
  3638f8:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  3638ff:	29 c1                	sub    %eax,%ecx
  363901:	89 c8                	mov    %ecx,%eax
  363903:	05 94 3c 37 00       	add    $0x373c94,%eax
  363908:	89 10                	mov    %edx,(%eax)
  36390a:	ff 75 08             	pushl  0x8(%ebp)
  36390d:	e8 14 fe ff ff       	call   363726 <set_top>
  363912:	83 c4 04             	add    $0x4,%esp
  363915:	c9                   	leave  
  363916:	c3                   	ret    

00363917 <scrtop>:
  363917:	55                   	push   %ebp
  363918:	89 e5                	mov    %esp,%ebp
  36391a:	57                   	push   %edi
  36391b:	56                   	push   %esi
  36391c:	53                   	push   %ebx
  36391d:	8b 45 08             	mov    0x8(%ebp),%eax
  363920:	c1 e0 02             	shl    $0x2,%eax
  363923:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  36392a:	29 c2                	sub    %eax,%edx
  36392c:	89 d0                	mov    %edx,%eax
  36392e:	05 94 3c 37 00       	add    $0x373c94,%eax
  363933:	8b 10                	mov    (%eax),%edx
  363935:	8b 45 08             	mov    0x8(%ebp),%eax
  363938:	c1 e0 02             	shl    $0x2,%eax
  36393b:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363942:	29 c1                	sub    %eax,%ecx
  363944:	89 c8                	mov    %ecx,%eax
  363946:	05 84 3c 37 00       	add    $0x373c84,%eax
  36394b:	8b 40 08             	mov    0x8(%eax),%eax
  36394e:	39 c2                	cmp    %eax,%edx
  363950:	0f 86 79 01 00 00    	jbe    363acf <scrtop+0x1b8>
  363956:	a1 ec 31 37 00       	mov    0x3731ec,%eax
  36395b:	8d 50 ff             	lea    -0x1(%eax),%edx
  36395e:	a1 f0 31 37 00       	mov    0x3731f0,%eax
  363963:	0f af c2             	imul   %edx,%eax
  363966:	c1 e8 02             	shr    $0x2,%eax
  363969:	89 c1                	mov    %eax,%ecx
  36396b:	8b 45 08             	mov    0x8(%ebp),%eax
  36396e:	c1 e0 02             	shl    $0x2,%eax
  363971:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363978:	29 c2                	sub    %eax,%edx
  36397a:	89 d0                	mov    %edx,%eax
  36397c:	05 84 3c 37 00       	add    $0x373c84,%eax
  363981:	8b 50 04             	mov    0x4(%eax),%edx
  363984:	8b 45 08             	mov    0x8(%ebp),%eax
  363987:	c1 e0 02             	shl    $0x2,%eax
  36398a:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  363991:	29 c3                	sub    %eax,%ebx
  363993:	89 d8                	mov    %ebx,%eax
  363995:	05 84 3c 37 00       	add    $0x373c84,%eax
  36399a:	8b 58 0c             	mov    0xc(%eax),%ebx
  36399d:	8b 45 08             	mov    0x8(%ebp),%eax
  3639a0:	c1 e0 02             	shl    $0x2,%eax
  3639a3:	8d 34 c5 00 00 00 00 	lea    0x0(,%eax,8),%esi
  3639aa:	29 c6                	sub    %eax,%esi
  3639ac:	89 f0                	mov    %esi,%eax
  3639ae:	05 84 3c 37 00       	add    $0x373c84,%eax
  3639b3:	0f b7 40 02          	movzwl 0x2(%eax),%eax
  3639b7:	89 d7                	mov    %edx,%edi
  3639b9:	89 de                	mov    %ebx,%esi
  3639bb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  3639bd:	8b 0d e8 31 37 00    	mov    0x3731e8,%ecx
  3639c3:	66 f3 ab             	rep stos %ax,%es:(%edi)
  3639c6:	8b 45 08             	mov    0x8(%ebp),%eax
  3639c9:	c1 e0 02             	shl    $0x2,%eax
  3639cc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3639d3:	29 c2                	sub    %eax,%edx
  3639d5:	89 d0                	mov    %edx,%eax
  3639d7:	05 94 3c 37 00       	add    $0x373c94,%eax
  3639dc:	8b 10                	mov    (%eax),%edx
  3639de:	8b 45 08             	mov    0x8(%ebp),%eax
  3639e1:	c1 e0 02             	shl    $0x2,%eax
  3639e4:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  3639eb:	29 c1                	sub    %eax,%ecx
  3639ed:	89 c8                	mov    %ecx,%eax
  3639ef:	05 84 3c 37 00       	add    $0x373c84,%eax
  3639f4:	8b 48 04             	mov    0x4(%eax),%ecx
  3639f7:	8b 45 08             	mov    0x8(%ebp),%eax
  3639fa:	c1 e0 02             	shl    $0x2,%eax
  3639fd:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  363a04:	29 c3                	sub    %eax,%ebx
  363a06:	89 d8                	mov    %ebx,%eax
  363a08:	05 84 3c 37 00       	add    $0x373c84,%eax
  363a0d:	8b 40 0c             	mov    0xc(%eax),%eax
  363a10:	29 c1                	sub    %eax,%ecx
  363a12:	89 c8                	mov    %ecx,%eax
  363a14:	01 c2                	add    %eax,%edx
  363a16:	8b 45 08             	mov    0x8(%ebp),%eax
  363a19:	c1 e0 02             	shl    $0x2,%eax
  363a1c:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363a23:	29 c1                	sub    %eax,%ecx
  363a25:	89 c8                	mov    %ecx,%eax
  363a27:	05 94 3c 37 00       	add    $0x373c94,%eax
  363a2c:	89 10                	mov    %edx,(%eax)
  363a2e:	8b 45 08             	mov    0x8(%ebp),%eax
  363a31:	c1 e0 02             	shl    $0x2,%eax
  363a34:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363a3b:	29 c2                	sub    %eax,%edx
  363a3d:	89 d0                	mov    %edx,%eax
  363a3f:	05 94 3c 37 00       	add    $0x373c94,%eax
  363a44:	8b 50 04             	mov    0x4(%eax),%edx
  363a47:	8b 45 08             	mov    0x8(%ebp),%eax
  363a4a:	c1 e0 02             	shl    $0x2,%eax
  363a4d:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363a54:	29 c1                	sub    %eax,%ecx
  363a56:	89 c8                	mov    %ecx,%eax
  363a58:	05 84 3c 37 00       	add    $0x373c84,%eax
  363a5d:	8b 48 04             	mov    0x4(%eax),%ecx
  363a60:	8b 45 08             	mov    0x8(%ebp),%eax
  363a63:	c1 e0 02             	shl    $0x2,%eax
  363a66:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  363a6d:	29 c3                	sub    %eax,%ebx
  363a6f:	89 d8                	mov    %ebx,%eax
  363a71:	05 84 3c 37 00       	add    $0x373c84,%eax
  363a76:	8b 40 0c             	mov    0xc(%eax),%eax
  363a79:	29 c1                	sub    %eax,%ecx
  363a7b:	89 c8                	mov    %ecx,%eax
  363a7d:	01 c2                	add    %eax,%edx
  363a7f:	8b 45 08             	mov    0x8(%ebp),%eax
  363a82:	c1 e0 02             	shl    $0x2,%eax
  363a85:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363a8c:	29 c1                	sub    %eax,%ecx
  363a8e:	89 c8                	mov    %ecx,%eax
  363a90:	05 94 3c 37 00       	add    $0x373c94,%eax
  363a95:	89 50 04             	mov    %edx,0x4(%eax)
  363a98:	8b 45 08             	mov    0x8(%ebp),%eax
  363a9b:	c1 e0 02             	shl    $0x2,%eax
  363a9e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363aa5:	29 c2                	sub    %eax,%edx
  363aa7:	89 d0                	mov    %edx,%eax
  363aa9:	05 84 3c 37 00       	add    $0x373c84,%eax
  363aae:	8b 50 04             	mov    0x4(%eax),%edx
  363ab1:	8b 45 08             	mov    0x8(%ebp),%eax
  363ab4:	c1 e0 02             	shl    $0x2,%eax
  363ab7:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363abe:	29 c1                	sub    %eax,%ecx
  363ac0:	89 c8                	mov    %ecx,%eax
  363ac2:	05 84 3c 37 00       	add    $0x373c84,%eax
  363ac7:	89 50 0c             	mov    %edx,0xc(%eax)
  363aca:	e9 ad 00 00 00       	jmp    363b7c <scrtop+0x265>
  363acf:	8b 45 08             	mov    0x8(%ebp),%eax
  363ad2:	c1 e0 02             	shl    $0x2,%eax
  363ad5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363adc:	29 c2                	sub    %eax,%edx
  363ade:	89 d0                	mov    %edx,%eax
  363ae0:	05 94 3c 37 00       	add    $0x373c94,%eax
  363ae5:	8b 10                	mov    (%eax),%edx
  363ae7:	8b 0d e8 31 37 00    	mov    0x3731e8,%ecx
  363aed:	8b 45 08             	mov    0x8(%ebp),%eax
  363af0:	c1 e0 02             	shl    $0x2,%eax
  363af3:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  363afa:	29 c3                	sub    %eax,%ebx
  363afc:	89 d8                	mov    %ebx,%eax
  363afe:	05 84 3c 37 00       	add    $0x373c84,%eax
  363b03:	0f b7 40 02          	movzwl 0x2(%eax),%eax
  363b07:	89 d7                	mov    %edx,%edi
  363b09:	66 f3 ab             	rep stos %ax,%es:(%edi)
  363b0c:	8b 45 08             	mov    0x8(%ebp),%eax
  363b0f:	c1 e0 02             	shl    $0x2,%eax
  363b12:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363b19:	29 c2                	sub    %eax,%edx
  363b1b:	89 d0                	mov    %edx,%eax
  363b1d:	05 84 3c 37 00       	add    $0x373c84,%eax
  363b22:	8b 50 0c             	mov    0xc(%eax),%edx
  363b25:	a1 f0 31 37 00       	mov    0x3731f0,%eax
  363b2a:	01 c2                	add    %eax,%edx
  363b2c:	8b 45 08             	mov    0x8(%ebp),%eax
  363b2f:	c1 e0 02             	shl    $0x2,%eax
  363b32:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363b39:	29 c1                	sub    %eax,%ecx
  363b3b:	89 c8                	mov    %ecx,%eax
  363b3d:	05 84 3c 37 00       	add    $0x373c84,%eax
  363b42:	89 50 0c             	mov    %edx,0xc(%eax)
  363b45:	8b 45 08             	mov    0x8(%ebp),%eax
  363b48:	c1 e0 02             	shl    $0x2,%eax
  363b4b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363b52:	29 c2                	sub    %eax,%edx
  363b54:	89 d0                	mov    %edx,%eax
  363b56:	05 94 3c 37 00       	add    $0x373c94,%eax
  363b5b:	8b 10                	mov    (%eax),%edx
  363b5d:	a1 f0 31 37 00       	mov    0x3731f0,%eax
  363b62:	01 c2                	add    %eax,%edx
  363b64:	8b 45 08             	mov    0x8(%ebp),%eax
  363b67:	c1 e0 02             	shl    $0x2,%eax
  363b6a:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363b71:	29 c1                	sub    %eax,%ecx
  363b73:	89 c8                	mov    %ecx,%eax
  363b75:	05 94 3c 37 00       	add    $0x373c94,%eax
  363b7a:	89 10                	mov    %edx,(%eax)
  363b7c:	ff 75 08             	pushl  0x8(%ebp)
  363b7f:	e8 a2 fb ff ff       	call   363726 <set_top>
  363b84:	83 c4 04             	add    $0x4,%esp
  363b87:	8d 65 f4             	lea    -0xc(%ebp),%esp
  363b8a:	5b                   	pop    %ebx
  363b8b:	5e                   	pop    %esi
  363b8c:	5f                   	pop    %edi
  363b8d:	5d                   	pop    %ebp
  363b8e:	c3                   	ret    

00363b8f <scrdown>:
  363b8f:	55                   	push   %ebp
  363b90:	89 e5                	mov    %esp,%ebp
  363b92:	8b 45 08             	mov    0x8(%ebp),%eax
  363b95:	c1 e0 02             	shl    $0x2,%eax
  363b98:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363b9f:	29 c2                	sub    %eax,%edx
  363ba1:	89 d0                	mov    %edx,%eax
  363ba3:	05 84 3c 37 00       	add    $0x373c84,%eax
  363ba8:	8b 50 0c             	mov    0xc(%eax),%edx
  363bab:	a1 f0 31 37 00       	mov    0x3731f0,%eax
  363bb0:	89 d1                	mov    %edx,%ecx
  363bb2:	29 c1                	sub    %eax,%ecx
  363bb4:	8b 45 08             	mov    0x8(%ebp),%eax
  363bb7:	c1 e0 02             	shl    $0x2,%eax
  363bba:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363bc1:	29 c2                	sub    %eax,%edx
  363bc3:	89 d0                	mov    %edx,%eax
  363bc5:	05 84 3c 37 00       	add    $0x373c84,%eax
  363bca:	8b 40 04             	mov    0x4(%eax),%eax
  363bcd:	39 c1                	cmp    %eax,%ecx
  363bcf:	77 02                	ja     363bd3 <scrdown+0x44>
  363bd1:	eb 7b                	jmp    363c4e <scrdown+0xbf>
  363bd3:	8b 45 08             	mov    0x8(%ebp),%eax
  363bd6:	c1 e0 02             	shl    $0x2,%eax
  363bd9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363be0:	29 c2                	sub    %eax,%edx
  363be2:	89 d0                	mov    %edx,%eax
  363be4:	05 84 3c 37 00       	add    $0x373c84,%eax
  363be9:	8b 50 0c             	mov    0xc(%eax),%edx
  363bec:	a1 f0 31 37 00       	mov    0x3731f0,%eax
  363bf1:	29 c2                	sub    %eax,%edx
  363bf3:	8b 45 08             	mov    0x8(%ebp),%eax
  363bf6:	c1 e0 02             	shl    $0x2,%eax
  363bf9:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363c00:	29 c1                	sub    %eax,%ecx
  363c02:	89 c8                	mov    %ecx,%eax
  363c04:	05 84 3c 37 00       	add    $0x373c84,%eax
  363c09:	89 50 0c             	mov    %edx,0xc(%eax)
  363c0c:	8b 45 08             	mov    0x8(%ebp),%eax
  363c0f:	c1 e0 02             	shl    $0x2,%eax
  363c12:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363c19:	29 c2                	sub    %eax,%edx
  363c1b:	89 d0                	mov    %edx,%eax
  363c1d:	05 94 3c 37 00       	add    $0x373c94,%eax
  363c22:	8b 10                	mov    (%eax),%edx
  363c24:	a1 f0 31 37 00       	mov    0x3731f0,%eax
  363c29:	29 c2                	sub    %eax,%edx
  363c2b:	8b 45 08             	mov    0x8(%ebp),%eax
  363c2e:	c1 e0 02             	shl    $0x2,%eax
  363c31:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363c38:	29 c1                	sub    %eax,%ecx
  363c3a:	89 c8                	mov    %ecx,%eax
  363c3c:	05 94 3c 37 00       	add    $0x373c94,%eax
  363c41:	89 10                	mov    %edx,(%eax)
  363c43:	ff 75 08             	pushl  0x8(%ebp)
  363c46:	e8 db fa ff ff       	call   363726 <set_top>
  363c4b:	83 c4 04             	add    $0x4,%esp
  363c4e:	c9                   	leave  
  363c4f:	c3                   	ret    

00363c50 <lf>:
  363c50:	55                   	push   %ebp
  363c51:	89 e5                	mov    %esp,%ebp
  363c53:	8b 45 08             	mov    0x8(%ebp),%eax
  363c56:	c1 e0 02             	shl    $0x2,%eax
  363c59:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363c60:	29 c2                	sub    %eax,%edx
  363c62:	89 d0                	mov    %edx,%eax
  363c64:	05 94 3c 37 00       	add    $0x373c94,%eax
  363c69:	8b 50 04             	mov    0x4(%eax),%edx
  363c6c:	a1 f0 31 37 00       	mov    0x3731f0,%eax
  363c71:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  363c74:	8b 45 08             	mov    0x8(%ebp),%eax
  363c77:	c1 e0 02             	shl    $0x2,%eax
  363c7a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363c81:	29 c2                	sub    %eax,%edx
  363c83:	89 d0                	mov    %edx,%eax
  363c85:	05 94 3c 37 00       	add    $0x373c94,%eax
  363c8a:	8b 00                	mov    (%eax),%eax
  363c8c:	39 c1                	cmp    %eax,%ecx
  363c8e:	76 0b                	jbe    363c9b <lf+0x4b>
  363c90:	ff 75 08             	pushl  0x8(%ebp)
  363c93:	e8 7f fc ff ff       	call   363917 <scrtop>
  363c98:	83 c4 04             	add    $0x4,%esp
  363c9b:	8b 45 08             	mov    0x8(%ebp),%eax
  363c9e:	c1 e0 02             	shl    $0x2,%eax
  363ca1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363ca8:	29 c2                	sub    %eax,%edx
  363caa:	89 d0                	mov    %edx,%eax
  363cac:	05 94 3c 37 00       	add    $0x373c94,%eax
  363cb1:	8b 50 04             	mov    0x4(%eax),%edx
  363cb4:	a1 f0 31 37 00       	mov    0x3731f0,%eax
  363cb9:	01 c2                	add    %eax,%edx
  363cbb:	8b 45 08             	mov    0x8(%ebp),%eax
  363cbe:	c1 e0 02             	shl    $0x2,%eax
  363cc1:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363cc8:	29 c1                	sub    %eax,%ecx
  363cca:	89 c8                	mov    %ecx,%eax
  363ccc:	05 94 3c 37 00       	add    $0x373c94,%eax
  363cd1:	89 50 04             	mov    %edx,0x4(%eax)
  363cd4:	ff 75 08             	pushl  0x8(%ebp)
  363cd7:	e8 e7 fa ff ff       	call   3637c3 <set_cur>
  363cdc:	83 c4 04             	add    $0x4,%esp
  363cdf:	c9                   	leave  
  363ce0:	c3                   	ret    

00363ce1 <cr>:
  363ce1:	55                   	push   %ebp
  363ce2:	89 e5                	mov    %esp,%ebp
  363ce4:	53                   	push   %ebx
  363ce5:	8b 45 08             	mov    0x8(%ebp),%eax
  363ce8:	c1 e0 02             	shl    $0x2,%eax
  363ceb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363cf2:	29 c2                	sub    %eax,%edx
  363cf4:	89 d0                	mov    %edx,%eax
  363cf6:	05 94 3c 37 00       	add    $0x373c94,%eax
  363cfb:	8b 48 04             	mov    0x4(%eax),%ecx
  363cfe:	8b 45 08             	mov    0x8(%ebp),%eax
  363d01:	c1 e0 02             	shl    $0x2,%eax
  363d04:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363d0b:	29 c2                	sub    %eax,%edx
  363d0d:	89 d0                	mov    %edx,%eax
  363d0f:	05 94 3c 37 00       	add    $0x373c94,%eax
  363d14:	8b 50 04             	mov    0x4(%eax),%edx
  363d17:	8b 45 08             	mov    0x8(%ebp),%eax
  363d1a:	c1 e0 02             	shl    $0x2,%eax
  363d1d:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
  363d24:	29 c3                	sub    %eax,%ebx
  363d26:	89 d8                	mov    %ebx,%eax
  363d28:	05 84 3c 37 00       	add    $0x373c84,%eax
  363d2d:	8b 40 04             	mov    0x4(%eax),%eax
  363d30:	29 c2                	sub    %eax,%edx
  363d32:	89 d0                	mov    %edx,%eax
  363d34:	8b 1d f0 31 37 00    	mov    0x3731f0,%ebx
  363d3a:	ba 00 00 00 00       	mov    $0x0,%edx
  363d3f:	f7 f3                	div    %ebx
  363d41:	89 d0                	mov    %edx,%eax
  363d43:	29 c1                	sub    %eax,%ecx
  363d45:	89 ca                	mov    %ecx,%edx
  363d47:	8b 45 08             	mov    0x8(%ebp),%eax
  363d4a:	c1 e0 02             	shl    $0x2,%eax
  363d4d:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363d54:	29 c1                	sub    %eax,%ecx
  363d56:	89 c8                	mov    %ecx,%eax
  363d58:	05 94 3c 37 00       	add    $0x373c94,%eax
  363d5d:	89 50 04             	mov    %edx,0x4(%eax)
  363d60:	ff 75 08             	pushl  0x8(%ebp)
  363d63:	e8 5b fa ff ff       	call   3637c3 <set_cur>
  363d68:	83 c4 04             	add    $0x4,%esp
  363d6b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  363d6e:	c9                   	leave  
  363d6f:	c3                   	ret    

00363d70 <del>:
  363d70:	55                   	push   %ebp
  363d71:	89 e5                	mov    %esp,%ebp
  363d73:	8b 45 08             	mov    0x8(%ebp),%eax
  363d76:	c1 e0 02             	shl    $0x2,%eax
  363d79:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363d80:	29 c2                	sub    %eax,%edx
  363d82:	89 d0                	mov    %edx,%eax
  363d84:	05 94 3c 37 00       	add    $0x373c94,%eax
  363d89:	8b 50 04             	mov    0x4(%eax),%edx
  363d8c:	8b 45 08             	mov    0x8(%ebp),%eax
  363d8f:	c1 e0 02             	shl    $0x2,%eax
  363d92:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363d99:	29 c1                	sub    %eax,%ecx
  363d9b:	89 c8                	mov    %ecx,%eax
  363d9d:	05 84 3c 37 00       	add    $0x373c84,%eax
  363da2:	8b 40 04             	mov    0x4(%eax),%eax
  363da5:	29 c2                	sub    %eax,%edx
  363da7:	89 d0                	mov    %edx,%eax
  363da9:	8b 0d f0 31 37 00    	mov    0x3731f0,%ecx
  363daf:	ba 00 00 00 00       	mov    $0x0,%edx
  363db4:	f7 f1                	div    %ecx
  363db6:	89 d0                	mov    %edx,%eax
  363db8:	85 c0                	test   %eax,%eax
  363dba:	74 6d                	je     363e29 <del+0xb9>
  363dbc:	8b 45 08             	mov    0x8(%ebp),%eax
  363dbf:	c1 e0 02             	shl    $0x2,%eax
  363dc2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363dc9:	29 c2                	sub    %eax,%edx
  363dcb:	89 d0                	mov    %edx,%eax
  363dcd:	05 94 3c 37 00       	add    $0x373c94,%eax
  363dd2:	8b 40 04             	mov    0x4(%eax),%eax
  363dd5:	8d 50 fe             	lea    -0x2(%eax),%edx
  363dd8:	8b 45 08             	mov    0x8(%ebp),%eax
  363ddb:	c1 e0 02             	shl    $0x2,%eax
  363dde:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363de5:	29 c1                	sub    %eax,%ecx
  363de7:	89 c8                	mov    %ecx,%eax
  363de9:	05 94 3c 37 00       	add    $0x373c94,%eax
  363dee:	89 50 04             	mov    %edx,0x4(%eax)
  363df1:	8b 45 08             	mov    0x8(%ebp),%eax
  363df4:	c1 e0 02             	shl    $0x2,%eax
  363df7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363dfe:	29 c2                	sub    %eax,%edx
  363e00:	89 d0                	mov    %edx,%eax
  363e02:	05 94 3c 37 00       	add    $0x373c94,%eax
  363e07:	8b 40 04             	mov    0x4(%eax),%eax
  363e0a:	89 c1                	mov    %eax,%ecx
  363e0c:	8b 45 08             	mov    0x8(%ebp),%eax
  363e0f:	c1 e0 02             	shl    $0x2,%eax
  363e12:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363e19:	29 c2                	sub    %eax,%edx
  363e1b:	89 d0                	mov    %edx,%eax
  363e1d:	05 84 3c 37 00       	add    $0x373c84,%eax
  363e22:	0f b7 40 02          	movzwl 0x2(%eax),%eax
  363e26:	66 89 01             	mov    %ax,(%ecx)
  363e29:	ff 75 08             	pushl  0x8(%ebp)
  363e2c:	e8 92 f9 ff ff       	call   3637c3 <set_cur>
  363e31:	83 c4 04             	add    $0x4,%esp
  363e34:	c9                   	leave  
  363e35:	c3                   	ret    

00363e36 <insert>:
  363e36:	55                   	push   %ebp
  363e37:	89 e5                	mov    %esp,%ebp
  363e39:	53                   	push   %ebx
  363e3a:	83 ec 04             	sub    $0x4,%esp
  363e3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  363e40:	88 45 f8             	mov    %al,-0x8(%ebp)
  363e43:	8b 45 08             	mov    0x8(%ebp),%eax
  363e46:	c1 e0 02             	shl    $0x2,%eax
  363e49:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363e50:	29 c2                	sub    %eax,%edx
  363e52:	89 d0                	mov    %edx,%eax
  363e54:	05 94 3c 37 00       	add    $0x373c94,%eax
  363e59:	8b 40 04             	mov    0x4(%eax),%eax
  363e5c:	89 c3                	mov    %eax,%ebx
  363e5e:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
  363e62:	8b 45 08             	mov    0x8(%ebp),%eax
  363e65:	c1 e0 02             	shl    $0x2,%eax
  363e68:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363e6f:	29 c1                	sub    %eax,%ecx
  363e71:	89 c8                	mov    %ecx,%eax
  363e73:	05 84 3c 37 00       	add    $0x373c84,%eax
  363e78:	0f b6 00             	movzbl (%eax),%eax
  363e7b:	0f b6 c0             	movzbl %al,%eax
  363e7e:	c1 e0 08             	shl    $0x8,%eax
  363e81:	09 d0                	or     %edx,%eax
  363e83:	66 89 03             	mov    %ax,(%ebx)
  363e86:	8b 45 08             	mov    0x8(%ebp),%eax
  363e89:	c1 e0 02             	shl    $0x2,%eax
  363e8c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363e93:	29 c2                	sub    %eax,%edx
  363e95:	89 d0                	mov    %edx,%eax
  363e97:	05 94 3c 37 00       	add    $0x373c94,%eax
  363e9c:	8b 40 04             	mov    0x4(%eax),%eax
  363e9f:	8d 48 02             	lea    0x2(%eax),%ecx
  363ea2:	8b 45 08             	mov    0x8(%ebp),%eax
  363ea5:	c1 e0 02             	shl    $0x2,%eax
  363ea8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363eaf:	29 c2                	sub    %eax,%edx
  363eb1:	89 d0                	mov    %edx,%eax
  363eb3:	05 94 3c 37 00       	add    $0x373c94,%eax
  363eb8:	8b 00                	mov    (%eax),%eax
  363eba:	39 c1                	cmp    %eax,%ecx
  363ebc:	76 0b                	jbe    363ec9 <insert+0x93>
  363ebe:	ff 75 08             	pushl  0x8(%ebp)
  363ec1:	e8 9a f9 ff ff       	call   363860 <scrup>
  363ec6:	83 c4 04             	add    $0x4,%esp
  363ec9:	8b 45 08             	mov    0x8(%ebp),%eax
  363ecc:	c1 e0 02             	shl    $0x2,%eax
  363ecf:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363ed6:	29 c2                	sub    %eax,%edx
  363ed8:	89 d0                	mov    %edx,%eax
  363eda:	05 94 3c 37 00       	add    $0x373c94,%eax
  363edf:	8b 40 04             	mov    0x4(%eax),%eax
  363ee2:	8d 50 02             	lea    0x2(%eax),%edx
  363ee5:	8b 45 08             	mov    0x8(%ebp),%eax
  363ee8:	c1 e0 02             	shl    $0x2,%eax
  363eeb:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363ef2:	29 c1                	sub    %eax,%ecx
  363ef4:	89 c8                	mov    %ecx,%eax
  363ef6:	05 94 3c 37 00       	add    $0x373c94,%eax
  363efb:	89 50 04             	mov    %edx,0x4(%eax)
  363efe:	ff 75 08             	pushl  0x8(%ebp)
  363f01:	e8 bd f8 ff ff       	call   3637c3 <set_cur>
  363f06:	83 c4 04             	add    $0x4,%esp
  363f09:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  363f0c:	c9                   	leave  
  363f0d:	c3                   	ret    

00363f0e <cons_print>:
  363f0e:	55                   	push   %ebp
  363f0f:	89 e5                	mov    %esp,%ebp
  363f11:	83 ec 10             	sub    $0x10,%esp
  363f14:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  363f1b:	e9 a5 05 00 00       	jmp    3644c5 <cons_print+0x5b7>
  363f20:	8b 55 fc             	mov    -0x4(%ebp),%edx
  363f23:	8b 45 0c             	mov    0xc(%ebp),%eax
  363f26:	01 d0                	add    %edx,%eax
  363f28:	0f b6 00             	movzbl (%eax),%eax
  363f2b:	88 45 fb             	mov    %al,-0x5(%ebp)
  363f2e:	8b 45 08             	mov    0x8(%ebp),%eax
  363f31:	c1 e0 02             	shl    $0x2,%eax
  363f34:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363f3b:	29 c2                	sub    %eax,%edx
  363f3d:	89 d0                	mov    %edx,%eax
  363f3f:	05 94 3c 37 00       	add    $0x373c94,%eax
  363f44:	8b 40 08             	mov    0x8(%eax),%eax
  363f47:	83 f8 01             	cmp    $0x1,%eax
  363f4a:	0f 85 0b 05 00 00    	jne    36445b <cons_print+0x54d>
  363f50:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  363f54:	83 e8 42             	sub    $0x42,%eax
  363f57:	83 f8 37             	cmp    $0x37,%eax
  363f5a:	0f 87 dc 04 00 00    	ja     36443c <cons_print+0x52e>
  363f60:	8b 04 85 ec d3 36 00 	mov    0x36d3ec(,%eax,4),%eax
  363f67:	ff e0                	jmp    *%eax
  363f69:	8b 45 08             	mov    0x8(%ebp),%eax
  363f6c:	c1 e0 02             	shl    $0x2,%eax
  363f6f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363f76:	29 c2                	sub    %eax,%edx
  363f78:	89 d0                	mov    %edx,%eax
  363f7a:	05 84 3c 37 00       	add    $0x373c84,%eax
  363f7f:	0f b6 00             	movzbl (%eax),%eax
  363f82:	83 e0 f8             	and    $0xfffffff8,%eax
  363f85:	89 c2                	mov    %eax,%edx
  363f87:	8b 45 08             	mov    0x8(%ebp),%eax
  363f8a:	c1 e0 02             	shl    $0x2,%eax
  363f8d:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363f94:	29 c1                	sub    %eax,%ecx
  363f96:	89 c8                	mov    %ecx,%eax
  363f98:	05 84 3c 37 00       	add    $0x373c84,%eax
  363f9d:	88 10                	mov    %dl,(%eax)
  363f9f:	e9 98 04 00 00       	jmp    36443c <cons_print+0x52e>
  363fa4:	8b 45 08             	mov    0x8(%ebp),%eax
  363fa7:	c1 e0 02             	shl    $0x2,%eax
  363faa:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363fb1:	29 c2                	sub    %eax,%edx
  363fb3:	89 d0                	mov    %edx,%eax
  363fb5:	05 84 3c 37 00       	add    $0x373c84,%eax
  363fba:	0f b6 00             	movzbl (%eax),%eax
  363fbd:	83 e0 8f             	and    $0xffffff8f,%eax
  363fc0:	89 c2                	mov    %eax,%edx
  363fc2:	8b 45 08             	mov    0x8(%ebp),%eax
  363fc5:	c1 e0 02             	shl    $0x2,%eax
  363fc8:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  363fcf:	29 c1                	sub    %eax,%ecx
  363fd1:	89 c8                	mov    %ecx,%eax
  363fd3:	05 84 3c 37 00       	add    $0x373c84,%eax
  363fd8:	88 10                	mov    %dl,(%eax)
  363fda:	e9 5d 04 00 00       	jmp    36443c <cons_print+0x52e>
  363fdf:	8b 45 08             	mov    0x8(%ebp),%eax
  363fe2:	c1 e0 02             	shl    $0x2,%eax
  363fe5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  363fec:	29 c2                	sub    %eax,%edx
  363fee:	89 d0                	mov    %edx,%eax
  363ff0:	05 84 3c 37 00       	add    $0x373c84,%eax
  363ff5:	0f b6 00             	movzbl (%eax),%eax
  363ff8:	83 e0 f8             	and    $0xfffffff8,%eax
  363ffb:	83 c8 01             	or     $0x1,%eax
  363ffe:	89 c1                	mov    %eax,%ecx
  364000:	8b 45 08             	mov    0x8(%ebp),%eax
  364003:	c1 e0 02             	shl    $0x2,%eax
  364006:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  36400d:	29 c2                	sub    %eax,%edx
  36400f:	89 d0                	mov    %edx,%eax
  364011:	05 84 3c 37 00       	add    $0x373c84,%eax
  364016:	88 08                	mov    %cl,(%eax)
  364018:	e9 1f 04 00 00       	jmp    36443c <cons_print+0x52e>
  36401d:	8b 45 08             	mov    0x8(%ebp),%eax
  364020:	c1 e0 02             	shl    $0x2,%eax
  364023:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  36402a:	29 c2                	sub    %eax,%edx
  36402c:	89 d0                	mov    %edx,%eax
  36402e:	05 84 3c 37 00       	add    $0x373c84,%eax
  364033:	0f b6 00             	movzbl (%eax),%eax
  364036:	83 e0 8f             	and    $0xffffff8f,%eax
  364039:	83 c8 10             	or     $0x10,%eax
  36403c:	89 c1                	mov    %eax,%ecx
  36403e:	8b 45 08             	mov    0x8(%ebp),%eax
  364041:	c1 e0 02             	shl    $0x2,%eax
  364044:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  36404b:	29 c2                	sub    %eax,%edx
  36404d:	89 d0                	mov    %edx,%eax
  36404f:	05 84 3c 37 00       	add    $0x373c84,%eax
  364054:	88 08                	mov    %cl,(%eax)
  364056:	e9 e1 03 00 00       	jmp    36443c <cons_print+0x52e>
  36405b:	8b 45 08             	mov    0x8(%ebp),%eax
  36405e:	c1 e0 02             	shl    $0x2,%eax
  364061:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364068:	29 c2                	sub    %eax,%edx
  36406a:	89 d0                	mov    %edx,%eax
  36406c:	05 84 3c 37 00       	add    $0x373c84,%eax
  364071:	0f b6 00             	movzbl (%eax),%eax
  364074:	83 e0 f8             	and    $0xfffffff8,%eax
  364077:	83 c8 02             	or     $0x2,%eax
  36407a:	89 c1                	mov    %eax,%ecx
  36407c:	8b 45 08             	mov    0x8(%ebp),%eax
  36407f:	c1 e0 02             	shl    $0x2,%eax
  364082:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364089:	29 c2                	sub    %eax,%edx
  36408b:	89 d0                	mov    %edx,%eax
  36408d:	05 84 3c 37 00       	add    $0x373c84,%eax
  364092:	88 08                	mov    %cl,(%eax)
  364094:	e9 a3 03 00 00       	jmp    36443c <cons_print+0x52e>
  364099:	8b 45 08             	mov    0x8(%ebp),%eax
  36409c:	c1 e0 02             	shl    $0x2,%eax
  36409f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3640a6:	29 c2                	sub    %eax,%edx
  3640a8:	89 d0                	mov    %edx,%eax
  3640aa:	05 84 3c 37 00       	add    $0x373c84,%eax
  3640af:	0f b6 00             	movzbl (%eax),%eax
  3640b2:	83 e0 8f             	and    $0xffffff8f,%eax
  3640b5:	83 c8 20             	or     $0x20,%eax
  3640b8:	89 c1                	mov    %eax,%ecx
  3640ba:	8b 45 08             	mov    0x8(%ebp),%eax
  3640bd:	c1 e0 02             	shl    $0x2,%eax
  3640c0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3640c7:	29 c2                	sub    %eax,%edx
  3640c9:	89 d0                	mov    %edx,%eax
  3640cb:	05 84 3c 37 00       	add    $0x373c84,%eax
  3640d0:	88 08                	mov    %cl,(%eax)
  3640d2:	e9 65 03 00 00       	jmp    36443c <cons_print+0x52e>
  3640d7:	8b 45 08             	mov    0x8(%ebp),%eax
  3640da:	c1 e0 02             	shl    $0x2,%eax
  3640dd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3640e4:	29 c2                	sub    %eax,%edx
  3640e6:	89 d0                	mov    %edx,%eax
  3640e8:	05 84 3c 37 00       	add    $0x373c84,%eax
  3640ed:	0f b6 00             	movzbl (%eax),%eax
  3640f0:	83 e0 f8             	and    $0xfffffff8,%eax
  3640f3:	83 c8 03             	or     $0x3,%eax
  3640f6:	89 c1                	mov    %eax,%ecx
  3640f8:	8b 45 08             	mov    0x8(%ebp),%eax
  3640fb:	c1 e0 02             	shl    $0x2,%eax
  3640fe:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364105:	29 c2                	sub    %eax,%edx
  364107:	89 d0                	mov    %edx,%eax
  364109:	05 84 3c 37 00       	add    $0x373c84,%eax
  36410e:	88 08                	mov    %cl,(%eax)
  364110:	e9 27 03 00 00       	jmp    36443c <cons_print+0x52e>
  364115:	8b 45 08             	mov    0x8(%ebp),%eax
  364118:	c1 e0 02             	shl    $0x2,%eax
  36411b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364122:	29 c2                	sub    %eax,%edx
  364124:	89 d0                	mov    %edx,%eax
  364126:	05 84 3c 37 00       	add    $0x373c84,%eax
  36412b:	0f b6 00             	movzbl (%eax),%eax
  36412e:	83 e0 8f             	and    $0xffffff8f,%eax
  364131:	83 c8 30             	or     $0x30,%eax
  364134:	89 c1                	mov    %eax,%ecx
  364136:	8b 45 08             	mov    0x8(%ebp),%eax
  364139:	c1 e0 02             	shl    $0x2,%eax
  36413c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364143:	29 c2                	sub    %eax,%edx
  364145:	89 d0                	mov    %edx,%eax
  364147:	05 84 3c 37 00       	add    $0x373c84,%eax
  36414c:	88 08                	mov    %cl,(%eax)
  36414e:	e9 e9 02 00 00       	jmp    36443c <cons_print+0x52e>
  364153:	8b 45 08             	mov    0x8(%ebp),%eax
  364156:	c1 e0 02             	shl    $0x2,%eax
  364159:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364160:	29 c2                	sub    %eax,%edx
  364162:	89 d0                	mov    %edx,%eax
  364164:	05 84 3c 37 00       	add    $0x373c84,%eax
  364169:	0f b6 00             	movzbl (%eax),%eax
  36416c:	83 e0 f8             	and    $0xfffffff8,%eax
  36416f:	83 c8 04             	or     $0x4,%eax
  364172:	89 c1                	mov    %eax,%ecx
  364174:	8b 45 08             	mov    0x8(%ebp),%eax
  364177:	c1 e0 02             	shl    $0x2,%eax
  36417a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364181:	29 c2                	sub    %eax,%edx
  364183:	89 d0                	mov    %edx,%eax
  364185:	05 84 3c 37 00       	add    $0x373c84,%eax
  36418a:	88 08                	mov    %cl,(%eax)
  36418c:	e9 ab 02 00 00       	jmp    36443c <cons_print+0x52e>
  364191:	8b 45 08             	mov    0x8(%ebp),%eax
  364194:	c1 e0 02             	shl    $0x2,%eax
  364197:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  36419e:	29 c2                	sub    %eax,%edx
  3641a0:	89 d0                	mov    %edx,%eax
  3641a2:	05 84 3c 37 00       	add    $0x373c84,%eax
  3641a7:	0f b6 00             	movzbl (%eax),%eax
  3641aa:	83 e0 8f             	and    $0xffffff8f,%eax
  3641ad:	83 c8 40             	or     $0x40,%eax
  3641b0:	89 c1                	mov    %eax,%ecx
  3641b2:	8b 45 08             	mov    0x8(%ebp),%eax
  3641b5:	c1 e0 02             	shl    $0x2,%eax
  3641b8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3641bf:	29 c2                	sub    %eax,%edx
  3641c1:	89 d0                	mov    %edx,%eax
  3641c3:	05 84 3c 37 00       	add    $0x373c84,%eax
  3641c8:	88 08                	mov    %cl,(%eax)
  3641ca:	e9 6d 02 00 00       	jmp    36443c <cons_print+0x52e>
  3641cf:	8b 45 08             	mov    0x8(%ebp),%eax
  3641d2:	c1 e0 02             	shl    $0x2,%eax
  3641d5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3641dc:	29 c2                	sub    %eax,%edx
  3641de:	89 d0                	mov    %edx,%eax
  3641e0:	05 84 3c 37 00       	add    $0x373c84,%eax
  3641e5:	0f b6 00             	movzbl (%eax),%eax
  3641e8:	83 e0 f8             	and    $0xfffffff8,%eax
  3641eb:	83 c8 05             	or     $0x5,%eax
  3641ee:	89 c1                	mov    %eax,%ecx
  3641f0:	8b 45 08             	mov    0x8(%ebp),%eax
  3641f3:	c1 e0 02             	shl    $0x2,%eax
  3641f6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3641fd:	29 c2                	sub    %eax,%edx
  3641ff:	89 d0                	mov    %edx,%eax
  364201:	05 84 3c 37 00       	add    $0x373c84,%eax
  364206:	88 08                	mov    %cl,(%eax)
  364208:	e9 2f 02 00 00       	jmp    36443c <cons_print+0x52e>
  36420d:	8b 45 08             	mov    0x8(%ebp),%eax
  364210:	c1 e0 02             	shl    $0x2,%eax
  364213:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  36421a:	29 c2                	sub    %eax,%edx
  36421c:	89 d0                	mov    %edx,%eax
  36421e:	05 84 3c 37 00       	add    $0x373c84,%eax
  364223:	0f b6 00             	movzbl (%eax),%eax
  364226:	83 e0 8f             	and    $0xffffff8f,%eax
  364229:	83 c8 50             	or     $0x50,%eax
  36422c:	89 c1                	mov    %eax,%ecx
  36422e:	8b 45 08             	mov    0x8(%ebp),%eax
  364231:	c1 e0 02             	shl    $0x2,%eax
  364234:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  36423b:	29 c2                	sub    %eax,%edx
  36423d:	89 d0                	mov    %edx,%eax
  36423f:	05 84 3c 37 00       	add    $0x373c84,%eax
  364244:	88 08                	mov    %cl,(%eax)
  364246:	e9 f1 01 00 00       	jmp    36443c <cons_print+0x52e>
  36424b:	8b 45 08             	mov    0x8(%ebp),%eax
  36424e:	c1 e0 02             	shl    $0x2,%eax
  364251:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364258:	29 c2                	sub    %eax,%edx
  36425a:	89 d0                	mov    %edx,%eax
  36425c:	05 84 3c 37 00       	add    $0x373c84,%eax
  364261:	0f b6 00             	movzbl (%eax),%eax
  364264:	83 e0 f8             	and    $0xfffffff8,%eax
  364267:	83 c8 06             	or     $0x6,%eax
  36426a:	89 c1                	mov    %eax,%ecx
  36426c:	8b 45 08             	mov    0x8(%ebp),%eax
  36426f:	c1 e0 02             	shl    $0x2,%eax
  364272:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364279:	29 c2                	sub    %eax,%edx
  36427b:	89 d0                	mov    %edx,%eax
  36427d:	05 84 3c 37 00       	add    $0x373c84,%eax
  364282:	88 08                	mov    %cl,(%eax)
  364284:	e9 b3 01 00 00       	jmp    36443c <cons_print+0x52e>
  364289:	8b 45 08             	mov    0x8(%ebp),%eax
  36428c:	c1 e0 02             	shl    $0x2,%eax
  36428f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364296:	29 c2                	sub    %eax,%edx
  364298:	89 d0                	mov    %edx,%eax
  36429a:	05 84 3c 37 00       	add    $0x373c84,%eax
  36429f:	0f b6 00             	movzbl (%eax),%eax
  3642a2:	83 e0 8f             	and    $0xffffff8f,%eax
  3642a5:	83 c8 60             	or     $0x60,%eax
  3642a8:	89 c1                	mov    %eax,%ecx
  3642aa:	8b 45 08             	mov    0x8(%ebp),%eax
  3642ad:	c1 e0 02             	shl    $0x2,%eax
  3642b0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3642b7:	29 c2                	sub    %eax,%edx
  3642b9:	89 d0                	mov    %edx,%eax
  3642bb:	05 84 3c 37 00       	add    $0x373c84,%eax
  3642c0:	88 08                	mov    %cl,(%eax)
  3642c2:	e9 75 01 00 00       	jmp    36443c <cons_print+0x52e>
  3642c7:	8b 45 08             	mov    0x8(%ebp),%eax
  3642ca:	c1 e0 02             	shl    $0x2,%eax
  3642cd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3642d4:	29 c2                	sub    %eax,%edx
  3642d6:	89 d0                	mov    %edx,%eax
  3642d8:	05 84 3c 37 00       	add    $0x373c84,%eax
  3642dd:	0f b6 00             	movzbl (%eax),%eax
  3642e0:	83 c8 07             	or     $0x7,%eax
  3642e3:	89 c1                	mov    %eax,%ecx
  3642e5:	8b 45 08             	mov    0x8(%ebp),%eax
  3642e8:	c1 e0 02             	shl    $0x2,%eax
  3642eb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3642f2:	29 c2                	sub    %eax,%edx
  3642f4:	89 d0                	mov    %edx,%eax
  3642f6:	05 84 3c 37 00       	add    $0x373c84,%eax
  3642fb:	88 08                	mov    %cl,(%eax)
  3642fd:	e9 3a 01 00 00       	jmp    36443c <cons_print+0x52e>
  364302:	8b 45 08             	mov    0x8(%ebp),%eax
  364305:	c1 e0 02             	shl    $0x2,%eax
  364308:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  36430f:	29 c2                	sub    %eax,%edx
  364311:	89 d0                	mov    %edx,%eax
  364313:	05 84 3c 37 00       	add    $0x373c84,%eax
  364318:	0f b6 00             	movzbl (%eax),%eax
  36431b:	83 c8 70             	or     $0x70,%eax
  36431e:	89 c1                	mov    %eax,%ecx
  364320:	8b 45 08             	mov    0x8(%ebp),%eax
  364323:	c1 e0 02             	shl    $0x2,%eax
  364326:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  36432d:	29 c2                	sub    %eax,%edx
  36432f:	89 d0                	mov    %edx,%eax
  364331:	05 84 3c 37 00       	add    $0x373c84,%eax
  364336:	88 08                	mov    %cl,(%eax)
  364338:	e9 ff 00 00 00       	jmp    36443c <cons_print+0x52e>
  36433d:	8b 45 08             	mov    0x8(%ebp),%eax
  364340:	c1 e0 02             	shl    $0x2,%eax
  364343:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  36434a:	29 c2                	sub    %eax,%edx
  36434c:	89 d0                	mov    %edx,%eax
  36434e:	05 84 3c 37 00       	add    $0x373c84,%eax
  364353:	0f b6 00             	movzbl (%eax),%eax
  364356:	83 c8 08             	or     $0x8,%eax
  364359:	89 c1                	mov    %eax,%ecx
  36435b:	8b 45 08             	mov    0x8(%ebp),%eax
  36435e:	c1 e0 02             	shl    $0x2,%eax
  364361:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364368:	29 c2                	sub    %eax,%edx
  36436a:	89 d0                	mov    %edx,%eax
  36436c:	05 84 3c 37 00       	add    $0x373c84,%eax
  364371:	88 08                	mov    %cl,(%eax)
  364373:	e9 c4 00 00 00       	jmp    36443c <cons_print+0x52e>
  364378:	8b 45 08             	mov    0x8(%ebp),%eax
  36437b:	c1 e0 02             	shl    $0x2,%eax
  36437e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364385:	29 c2                	sub    %eax,%edx
  364387:	89 d0                	mov    %edx,%eax
  364389:	05 84 3c 37 00       	add    $0x373c84,%eax
  36438e:	0f b6 00             	movzbl (%eax),%eax
  364391:	83 e0 f7             	and    $0xfffffff7,%eax
  364394:	89 c2                	mov    %eax,%edx
  364396:	8b 45 08             	mov    0x8(%ebp),%eax
  364399:	c1 e0 02             	shl    $0x2,%eax
  36439c:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  3643a3:	29 c1                	sub    %eax,%ecx
  3643a5:	89 c8                	mov    %ecx,%eax
  3643a7:	05 84 3c 37 00       	add    $0x373c84,%eax
  3643ac:	88 10                	mov    %dl,(%eax)
  3643ae:	e9 89 00 00 00       	jmp    36443c <cons_print+0x52e>
  3643b3:	8b 45 08             	mov    0x8(%ebp),%eax
  3643b6:	c1 e0 02             	shl    $0x2,%eax
  3643b9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3643c0:	29 c2                	sub    %eax,%edx
  3643c2:	89 d0                	mov    %edx,%eax
  3643c4:	05 84 3c 37 00       	add    $0x373c84,%eax
  3643c9:	0f b6 00             	movzbl (%eax),%eax
  3643cc:	83 c8 80             	or     $0xffffff80,%eax
  3643cf:	89 c1                	mov    %eax,%ecx
  3643d1:	8b 45 08             	mov    0x8(%ebp),%eax
  3643d4:	c1 e0 02             	shl    $0x2,%eax
  3643d7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3643de:	29 c2                	sub    %eax,%edx
  3643e0:	89 d0                	mov    %edx,%eax
  3643e2:	05 84 3c 37 00       	add    $0x373c84,%eax
  3643e7:	88 08                	mov    %cl,(%eax)
  3643e9:	eb 51                	jmp    36443c <cons_print+0x52e>
  3643eb:	8b 45 08             	mov    0x8(%ebp),%eax
  3643ee:	c1 e0 02             	shl    $0x2,%eax
  3643f1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3643f8:	29 c2                	sub    %eax,%edx
  3643fa:	89 d0                	mov    %edx,%eax
  3643fc:	05 84 3c 37 00       	add    $0x373c84,%eax
  364401:	0f b6 00             	movzbl (%eax),%eax
  364404:	83 e0 7f             	and    $0x7f,%eax
  364407:	89 c2                	mov    %eax,%edx
  364409:	8b 45 08             	mov    0x8(%ebp),%eax
  36440c:	c1 e0 02             	shl    $0x2,%eax
  36440f:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  364416:	29 c1                	sub    %eax,%ecx
  364418:	89 c8                	mov    %ecx,%eax
  36441a:	05 84 3c 37 00       	add    $0x373c84,%eax
  36441f:	88 10                	mov    %dl,(%eax)
  364421:	eb 19                	jmp    36443c <cons_print+0x52e>
  364423:	ff 75 08             	pushl  0x8(%ebp)
  364426:	e8 64 f7 ff ff       	call   363b8f <scrdown>
  36442b:	83 c4 04             	add    $0x4,%esp
  36442e:	eb 0c                	jmp    36443c <cons_print+0x52e>
  364430:	ff 75 08             	pushl  0x8(%ebp)
  364433:	e8 28 f4 ff ff       	call   363860 <scrup>
  364438:	83 c4 04             	add    $0x4,%esp
  36443b:	90                   	nop
  36443c:	8b 45 08             	mov    0x8(%ebp),%eax
  36443f:	c1 e0 02             	shl    $0x2,%eax
  364442:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364449:	29 c2                	sub    %eax,%edx
  36444b:	89 d0                	mov    %edx,%eax
  36444d:	05 94 3c 37 00       	add    $0x373c94,%eax
  364452:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  364459:	eb 66                	jmp    3644c1 <cons_print+0x5b3>
  36445b:	80 7d fb 1b          	cmpb   $0x1b,-0x5(%ebp)
  36445f:	75 1f                	jne    364480 <cons_print+0x572>
  364461:	8b 45 08             	mov    0x8(%ebp),%eax
  364464:	c1 e0 02             	shl    $0x2,%eax
  364467:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  36446e:	29 c2                	sub    %eax,%edx
  364470:	89 d0                	mov    %edx,%eax
  364472:	05 94 3c 37 00       	add    $0x373c94,%eax
  364477:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
  36447e:	eb 41                	jmp    3644c1 <cons_print+0x5b3>
  364480:	80 7d fb 08          	cmpb   $0x8,-0x5(%ebp)
  364484:	75 0d                	jne    364493 <cons_print+0x585>
  364486:	ff 75 08             	pushl  0x8(%ebp)
  364489:	e8 e2 f8 ff ff       	call   363d70 <del>
  36448e:	83 c4 04             	add    $0x4,%esp
  364491:	eb 2e                	jmp    3644c1 <cons_print+0x5b3>
  364493:	80 7d fb 0a          	cmpb   $0xa,-0x5(%ebp)
  364497:	75 18                	jne    3644b1 <cons_print+0x5a3>
  364499:	ff 75 08             	pushl  0x8(%ebp)
  36449c:	e8 af f7 ff ff       	call   363c50 <lf>
  3644a1:	83 c4 04             	add    $0x4,%esp
  3644a4:	ff 75 08             	pushl  0x8(%ebp)
  3644a7:	e8 35 f8 ff ff       	call   363ce1 <cr>
  3644ac:	83 c4 04             	add    $0x4,%esp
  3644af:	eb 10                	jmp    3644c1 <cons_print+0x5b3>
  3644b1:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  3644b5:	50                   	push   %eax
  3644b6:	ff 75 08             	pushl  0x8(%ebp)
  3644b9:	e8 78 f9 ff ff       	call   363e36 <insert>
  3644be:	83 c4 08             	add    $0x8,%esp
  3644c1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  3644c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  3644c8:	3b 45 10             	cmp    0x10(%ebp),%eax
  3644cb:	0f 82 4f fa ff ff    	jb     363f20 <cons_print+0x12>
  3644d1:	c9                   	leave  
  3644d2:	c3                   	ret    

003644d3 <cons_init>:
  3644d3:	55                   	push   %ebp
  3644d4:	89 e5                	mov    %esp,%ebp
  3644d6:	53                   	push   %ebx
  3644d7:	83 ec 10             	sub    $0x10,%esp
  3644da:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  3644e1:	c7 05 f4 31 37 00 00 	movl   $0x0,0x3731f4
  3644e8:	00 00 00 
  3644eb:	c7 05 e4 31 37 00 00 	movl   $0xb8000,0x3731e4
  3644f2:	80 0b 00 
  3644f5:	c7 05 ec 31 37 00 19 	movl   $0x19,0x3731ec
  3644fc:	00 00 00 
  3644ff:	c7 05 e8 31 37 00 50 	movl   $0x50,0x3731e8
  364506:	00 00 00 
  364509:	a1 e8 31 37 00       	mov    0x3731e8,%eax
  36450e:	01 c0                	add    %eax,%eax
  364510:	a3 f0 31 37 00       	mov    %eax,0x3731f0
  364515:	8b 45 f8             	mov    -0x8(%ebp),%eax
  364518:	c1 e0 02             	shl    $0x2,%eax
  36451b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364522:	29 c2                	sub    %eax,%edx
  364524:	89 d0                	mov    %edx,%eax
  364526:	05 84 3c 37 00       	add    $0x373c84,%eax
  36452b:	c6 00 0f             	movb   $0xf,(%eax)
  36452e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  364531:	c1 e0 02             	shl    $0x2,%eax
  364534:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  36453b:	29 c2                	sub    %eax,%edx
  36453d:	89 d0                	mov    %edx,%eax
  36453f:	05 94 3c 37 00       	add    $0x373c94,%eax
  364544:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  36454b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36454e:	c1 e0 02             	shl    $0x2,%eax
  364551:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364558:	29 c2                	sub    %eax,%edx
  36455a:	89 d0                	mov    %edx,%eax
  36455c:	05 84 3c 37 00       	add    $0x373c84,%eax
  364561:	66 c7 40 02 20 0f    	movw   $0xf20,0x2(%eax)
  364567:	8b 15 e4 31 37 00    	mov    0x3731e4,%edx
  36456d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  364570:	c1 e0 02             	shl    $0x2,%eax
  364573:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  36457a:	29 c1                	sub    %eax,%ecx
  36457c:	89 c8                	mov    %ecx,%eax
  36457e:	05 84 3c 37 00       	add    $0x373c84,%eax
  364583:	89 50 04             	mov    %edx,0x4(%eax)
  364586:	8b 45 f8             	mov    -0x8(%ebp),%eax
  364589:	c1 e0 02             	shl    $0x2,%eax
  36458c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  364593:	29 c2                	sub    %eax,%edx
  364595:	89 d0                	mov    %edx,%eax
  364597:	05 84 3c 37 00       	add    $0x373c84,%eax
  36459c:	8b 40 04             	mov    0x4(%eax),%eax
  36459f:	8d 90 e0 2e 00 00    	lea    0x2ee0(%eax),%edx
  3645a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  3645a8:	c1 e0 02             	shl    $0x2,%eax
  3645ab:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  3645b2:	29 c1                	sub    %eax,%ecx
  3645b4:	89 c8                	mov    %ecx,%eax
  3645b6:	05 84 3c 37 00       	add    $0x373c84,%eax
  3645bb:	89 50 08             	mov    %edx,0x8(%eax)
  3645be:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
  3645c2:	68 d4 03 00 00       	push   $0x3d4
  3645c7:	6a 0c                	push   $0xc
  3645c9:	e8 04 f1 ff ff       	call   3636d2 <outb_p>
  3645ce:	83 c4 08             	add    $0x8,%esp
  3645d1:	68 d5 03 00 00       	push   $0x3d5
  3645d6:	e8 23 f1 ff ff       	call   3636fe <inb_p>
  3645db:	83 c4 04             	add    $0x4,%esp
  3645de:	88 45 f7             	mov    %al,-0x9(%ebp)
  3645e1:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  3645e5:	0f b6 c0             	movzbl %al,%eax
  3645e8:	c1 e0 09             	shl    $0x9,%eax
  3645eb:	89 c3                	mov    %eax,%ebx
  3645ed:	c6 45 f6 00          	movb   $0x0,-0xa(%ebp)
  3645f1:	68 d4 03 00 00       	push   $0x3d4
  3645f6:	6a 0d                	push   $0xd
  3645f8:	e8 d5 f0 ff ff       	call   3636d2 <outb_p>
  3645fd:	83 c4 08             	add    $0x8,%esp
  364600:	68 d5 03 00 00       	push   $0x3d5
  364605:	e8 f4 f0 ff ff       	call   3636fe <inb_p>
  36460a:	83 c4 04             	add    $0x4,%esp
  36460d:	88 45 f6             	mov    %al,-0xa(%ebp)
  364610:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  364614:	0f b6 c0             	movzbl %al,%eax
  364617:	01 c0                	add    %eax,%eax
  364619:	09 d8                	or     %ebx,%eax
  36461b:	89 c1                	mov    %eax,%ecx
  36461d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  364620:	c1 e0 02             	shl    $0x2,%eax
  364623:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  36462a:	29 c2                	sub    %eax,%edx
  36462c:	89 d0                	mov    %edx,%eax
  36462e:	05 84 3c 37 00       	add    $0x373c84,%eax
  364633:	8b 40 04             	mov    0x4(%eax),%eax
  364636:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  364639:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36463c:	c1 e0 02             	shl    $0x2,%eax
  36463f:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  364646:	29 c1                	sub    %eax,%ecx
  364648:	89 c8                	mov    %ecx,%eax
  36464a:	05 84 3c 37 00       	add    $0x373c84,%eax
  36464f:	89 50 0c             	mov    %edx,0xc(%eax)
  364652:	8b 45 f8             	mov    -0x8(%ebp),%eax
  364655:	c1 e0 02             	shl    $0x2,%eax
  364658:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  36465f:	29 c2                	sub    %eax,%edx
  364661:	89 d0                	mov    %edx,%eax
  364663:	05 84 3c 37 00       	add    $0x373c84,%eax
  364668:	8b 40 0c             	mov    0xc(%eax),%eax
  36466b:	8d 90 a0 0f 00 00    	lea    0xfa0(%eax),%edx
  364671:	8b 45 f8             	mov    -0x8(%ebp),%eax
  364674:	c1 e0 02             	shl    $0x2,%eax
  364677:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  36467e:	29 c1                	sub    %eax,%ecx
  364680:	89 c8                	mov    %ecx,%eax
  364682:	05 94 3c 37 00       	add    $0x373c94,%eax
  364687:	89 10                	mov    %edx,(%eax)
  364689:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
  36468d:	68 d4 03 00 00       	push   $0x3d4
  364692:	6a 0e                	push   $0xe
  364694:	e8 39 f0 ff ff       	call   3636d2 <outb_p>
  364699:	83 c4 08             	add    $0x8,%esp
  36469c:	68 d5 03 00 00       	push   $0x3d5
  3646a1:	e8 58 f0 ff ff       	call   3636fe <inb_p>
  3646a6:	83 c4 04             	add    $0x4,%esp
  3646a9:	88 45 f5             	mov    %al,-0xb(%ebp)
  3646ac:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  3646b0:	0f b6 c0             	movzbl %al,%eax
  3646b3:	c1 e0 09             	shl    $0x9,%eax
  3646b6:	89 c3                	mov    %eax,%ebx
  3646b8:	c6 45 f4 00          	movb   $0x0,-0xc(%ebp)
  3646bc:	68 d4 03 00 00       	push   $0x3d4
  3646c1:	6a 0f                	push   $0xf
  3646c3:	e8 0a f0 ff ff       	call   3636d2 <outb_p>
  3646c8:	83 c4 08             	add    $0x8,%esp
  3646cb:	68 d5 03 00 00       	push   $0x3d5
  3646d0:	e8 29 f0 ff ff       	call   3636fe <inb_p>
  3646d5:	83 c4 04             	add    $0x4,%esp
  3646d8:	88 45 f4             	mov    %al,-0xc(%ebp)
  3646db:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
  3646df:	0f b6 c0             	movzbl %al,%eax
  3646e2:	01 c0                	add    %eax,%eax
  3646e4:	09 d8                	or     %ebx,%eax
  3646e6:	89 c1                	mov    %eax,%ecx
  3646e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  3646eb:	c1 e0 02             	shl    $0x2,%eax
  3646ee:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3646f5:	29 c2                	sub    %eax,%edx
  3646f7:	89 d0                	mov    %edx,%eax
  3646f9:	05 84 3c 37 00       	add    $0x373c84,%eax
  3646fe:	8b 40 04             	mov    0x4(%eax),%eax
  364701:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  364704:	8b 45 f8             	mov    -0x8(%ebp),%eax
  364707:	c1 e0 02             	shl    $0x2,%eax
  36470a:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
  364711:	29 c1                	sub    %eax,%ecx
  364713:	89 c8                	mov    %ecx,%eax
  364715:	05 94 3c 37 00       	add    $0x373c94,%eax
  36471a:	89 50 04             	mov    %edx,0x4(%eax)
  36471d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  364720:	c9                   	leave  
  364721:	c3                   	ret    

00364722 <cons_write>:
  364722:	55                   	push   %ebp
  364723:	89 e5                	mov    %esp,%ebp
  364725:	57                   	push   %edi
  364726:	56                   	push   %esi
  364727:	53                   	push   %ebx
  364728:	83 ec 10             	sub    $0x10,%esp
  36472b:	ff 75 10             	pushl  0x10(%ebp)
  36472e:	ff 75 0c             	pushl  0xc(%ebp)
  364731:	6a 00                	push   $0x0
  364733:	e8 d6 f7 ff ff       	call   363f0e <cons_print>
  364738:	83 c4 0c             	add    $0xc,%esp
  36473b:	b8 02 00 00 00       	mov    $0x2,%eax
  364740:	8b 5d 08             	mov    0x8(%ebp),%ebx
  364743:	b9 00 00 00 00       	mov    $0x0,%ecx
  364748:	ba 00 00 00 00       	mov    $0x0,%edx
  36474d:	be 00 00 00 00       	mov    $0x0,%esi
  364752:	bf 00 00 00 00       	mov    $0x0,%edi
  364757:	cd 80                	int    $0x80
  364759:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36475c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36475f:	5b                   	pop    %ebx
  364760:	5e                   	pop    %esi
  364761:	5f                   	pop    %edi
  364762:	5d                   	pop    %ebp
  364763:	c3                   	ret    

00364764 <cons_read>:
  364764:	55                   	push   %ebp
  364765:	89 e5                	mov    %esp,%ebp
  364767:	83 ec 08             	sub    $0x8,%esp
  36476a:	83 ec 04             	sub    $0x4,%esp
  36476d:	ff 75 10             	pushl  0x10(%ebp)
  364770:	ff 75 0c             	pushl  0xc(%ebp)
  364773:	ff 75 08             	pushl  0x8(%ebp)
  364776:	e8 64 03 00 00       	call   364adf <copy_buffer>
  36477b:	83 c4 10             	add    $0x10,%esp
  36477e:	c9                   	leave  
  36477f:	c3                   	ret    

00364780 <cons_main>:
  364780:	55                   	push   %ebp
  364781:	89 e5                	mov    %esp,%ebp
  364783:	57                   	push   %edi
  364784:	56                   	push   %esi
  364785:	53                   	push   %ebx
  364786:	83 ec 1c             	sub    $0x1c,%esp
  364789:	83 ec 08             	sub    $0x8,%esp
  36478c:	68 cc d4 36 00       	push   $0x36d4cc
  364791:	68 d3 d4 36 00       	push   $0x36d4d3
  364796:	e8 ed 48 00 00       	call   369088 <printk>
  36479b:	83 c4 10             	add    $0x10,%esp
  36479e:	e8 30 fd ff ff       	call   3644d3 <cons_init>
  3647a3:	e8 bc 04 00 00       	call   364c64 <keyboard_init>
  3647a8:	b8 03 00 00 00       	mov    $0x3,%eax
  3647ad:	bb 05 00 00 00       	mov    $0x5,%ebx
  3647b2:	b9 64 47 36 00       	mov    $0x364764,%ecx
  3647b7:	ba 00 00 00 00       	mov    $0x0,%edx
  3647bc:	be 00 00 00 00       	mov    $0x0,%esi
  3647c1:	bf 00 00 00 00       	mov    $0x0,%edi
  3647c6:	cd 80                	int    $0x80
  3647c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3647cb:	b8 03 00 00 00       	mov    $0x3,%eax
  3647d0:	bb 06 00 00 00       	mov    $0x6,%ebx
  3647d5:	b9 22 47 36 00       	mov    $0x364722,%ecx
  3647da:	ba 00 00 00 00       	mov    $0x0,%edx
  3647df:	be 00 00 00 00       	mov    $0x0,%esi
  3647e4:	bf 00 00 00 00       	mov    $0x0,%edi
  3647e9:	cd 80                	int    $0x80
  3647eb:	89 45 e0             	mov    %eax,-0x20(%ebp)
  3647ee:	83 ec 08             	sub    $0x8,%esp
  3647f1:	68 cc d4 36 00       	push   $0x36d4cc
  3647f6:	68 e9 d4 36 00       	push   $0x36d4e9
  3647fb:	e8 88 48 00 00       	call   369088 <printk>
  364800:	83 c4 10             	add    $0x10,%esp
  364803:	b8 00 00 00 00       	mov    $0x0,%eax
  364808:	bb 00 00 00 00       	mov    $0x0,%ebx
  36480d:	b9 00 00 00 00       	mov    $0x0,%ecx
  364812:	ba 00 00 00 00       	mov    $0x0,%edx
  364817:	be 00 00 00 00       	mov    $0x0,%esi
  36481c:	bf 00 00 00 00       	mov    $0x0,%edi
  364821:	cd 80                	int    $0x80
  364823:	89 45 dc             	mov    %eax,-0x24(%ebp)
  364826:	b8 00 00 00 00       	mov    $0x0,%eax
  36482b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36482e:	5b                   	pop    %ebx
  36482f:	5e                   	pop    %esi
  364830:	5f                   	pop    %edi
  364831:	5d                   	pop    %ebp
  364832:	c3                   	ret    

00364833 <outb>:
  364833:	55                   	push   %ebp
  364834:	89 e5                	mov    %esp,%ebp
  364836:	83 ec 08             	sub    $0x8,%esp
  364839:	8b 55 08             	mov    0x8(%ebp),%edx
  36483c:	8b 45 0c             	mov    0xc(%ebp),%eax
  36483f:	88 55 fc             	mov    %dl,-0x4(%ebp)
  364842:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  364846:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  36484a:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  36484e:	ee                   	out    %al,(%dx)
  36484f:	c9                   	leave  
  364850:	c3                   	ret    

00364851 <inb>:
  364851:	55                   	push   %ebp
  364852:	89 e5                	mov    %esp,%ebp
  364854:	83 ec 14             	sub    $0x14,%esp
  364857:	8b 45 08             	mov    0x8(%ebp),%eax
  36485a:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  36485e:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  364862:	89 c2                	mov    %eax,%edx
  364864:	ec                   	in     (%dx),%al
  364865:	88 45 ff             	mov    %al,-0x1(%ebp)
  364868:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  36486c:	c9                   	leave  
  36486d:	c3                   	ret    

0036486e <io_delay>:
  36486e:	55                   	push   %ebp
  36486f:	89 e5                	mov    %esp,%ebp
  364871:	83 ec 10             	sub    $0x10,%esp
  364874:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
  36487a:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  36487e:	89 c2                	mov    %eax,%edx
  364880:	ee                   	out    %al,(%dx)
  364881:	c9                   	leave  
  364882:	c3                   	ret    

00364883 <outb_p>:
  364883:	55                   	push   %ebp
  364884:	89 e5                	mov    %esp,%ebp
  364886:	83 ec 08             	sub    $0x8,%esp
  364889:	8b 55 08             	mov    0x8(%ebp),%edx
  36488c:	8b 45 0c             	mov    0xc(%ebp),%eax
  36488f:	88 55 fc             	mov    %dl,-0x4(%ebp)
  364892:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  364896:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  36489a:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  36489e:	52                   	push   %edx
  36489f:	50                   	push   %eax
  3648a0:	e8 8e ff ff ff       	call   364833 <outb>
  3648a5:	83 c4 08             	add    $0x8,%esp
  3648a8:	e8 c1 ff ff ff       	call   36486e <io_delay>
  3648ad:	c9                   	leave  
  3648ae:	c3                   	ret    

003648af <memcpy>:
  3648af:	55                   	push   %ebp
  3648b0:	89 e5                	mov    %esp,%ebp
  3648b2:	57                   	push   %edi
  3648b3:	56                   	push   %esi
  3648b4:	53                   	push   %ebx
  3648b5:	8b 45 10             	mov    0x10(%ebp),%eax
  3648b8:	8b 55 0c             	mov    0xc(%ebp),%edx
  3648bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3648be:	89 c1                	mov    %eax,%ecx
  3648c0:	89 d6                	mov    %edx,%esi
  3648c2:	89 df                	mov    %ebx,%edi
  3648c4:	fc                   	cld    
  3648c5:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  3648c7:	8b 45 08             	mov    0x8(%ebp),%eax
  3648ca:	5b                   	pop    %ebx
  3648cb:	5e                   	pop    %esi
  3648cc:	5f                   	pop    %edi
  3648cd:	5d                   	pop    %ebp
  3648ce:	c3                   	ret    

003648cf <_ispress>:
  3648cf:	55                   	push   %ebp
  3648d0:	89 e5                	mov    %esp,%ebp
  3648d2:	57                   	push   %edi
  3648d3:	56                   	push   %esi
  3648d4:	53                   	push   %ebx
  3648d5:	83 ec 10             	sub    $0x10,%esp
  3648d8:	8b 0d 40 33 37 00    	mov    0x373340,%ecx
  3648de:	b8 02 00 00 00       	mov    $0x2,%eax
  3648e3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3648e6:	ba 00 00 00 00       	mov    $0x0,%edx
  3648eb:	be 00 00 00 00       	mov    $0x0,%esi
  3648f0:	bf 00 00 00 00       	mov    $0x0,%edi
  3648f5:	cd 80                	int    $0x80
  3648f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3648fa:	83 c4 10             	add    $0x10,%esp
  3648fd:	5b                   	pop    %ebx
  3648fe:	5e                   	pop    %esi
  3648ff:	5f                   	pop    %edi
  364900:	5d                   	pop    %ebp
  364901:	c3                   	ret    

00364902 <_input>:
  364902:	55                   	push   %ebp
  364903:	89 e5                	mov    %esp,%ebp
  364905:	83 ec 18             	sub    $0x18,%esp
  364908:	6a 60                	push   $0x60
  36490a:	e8 42 ff ff ff       	call   364851 <inb>
  36490f:	83 c4 04             	add    $0x4,%esp
  364912:	88 45 f7             	mov    %al,-0x9(%ebp)
  364915:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  364919:	83 f8 2a             	cmp    $0x2a,%eax
  36491c:	0f 84 87 00 00 00    	je     3649a9 <_input+0xa7>
  364922:	83 f8 2a             	cmp    $0x2a,%eax
  364925:	7f 39                	jg     364960 <_input+0x5e>
  364927:	83 f8 1b             	cmp    $0x1b,%eax
  36492a:	7f 1d                	jg     364949 <_input+0x47>
  36492c:	83 f8 0f             	cmp    $0xf,%eax
  36492f:	0f 8d c4 00 00 00    	jge    3649f9 <_input+0xf7>
  364935:	83 f8 01             	cmp    $0x1,%eax
  364938:	0f 8c 9f 01 00 00    	jl     364add <_input+0x1db>
  36493e:	83 f8 0d             	cmp    $0xd,%eax
  364941:	0f 8e b2 00 00 00    	jle    3649f9 <_input+0xf7>
  364947:	eb 7e                	jmp    3649c7 <_input+0xc5>
  364949:	83 f8 1c             	cmp    $0x1c,%eax
  36494c:	0f 84 05 01 00 00    	je     364a57 <_input+0x155>
  364952:	83 f8 1e             	cmp    $0x1e,%eax
  364955:	0f 8c 82 01 00 00    	jl     364add <_input+0x1db>
  36495b:	e9 99 00 00 00       	jmp    3649f9 <_input+0xf7>
  364960:	83 f8 39             	cmp    $0x39,%eax
  364963:	0f 84 90 00 00 00    	je     3649f9 <_input+0xf7>
  364969:	83 f8 39             	cmp    $0x39,%eax
  36496c:	7f 13                	jg     364981 <_input+0x7f>
  36496e:	83 f8 35             	cmp    $0x35,%eax
  364971:	0f 8e 82 00 00 00    	jle    3649f9 <_input+0xf7>
  364977:	83 f8 36             	cmp    $0x36,%eax
  36497a:	74 2d                	je     3649a9 <_input+0xa7>
  36497c:	e9 5c 01 00 00       	jmp    364add <_input+0x1db>
  364981:	3d aa 00 00 00       	cmp    $0xaa,%eax
  364986:	74 30                	je     3649b8 <_input+0xb6>
  364988:	3d aa 00 00 00       	cmp    $0xaa,%eax
  36498d:	7f 0e                	jg     36499d <_input+0x9b>
  36498f:	83 e8 47             	sub    $0x47,%eax
  364992:	83 f8 0c             	cmp    $0xc,%eax
  364995:	0f 87 42 01 00 00    	ja     364add <_input+0x1db>
  36499b:	eb 5c                	jmp    3649f9 <_input+0xf7>
  36499d:	3d b6 00 00 00       	cmp    $0xb6,%eax
  3649a2:	74 14                	je     3649b8 <_input+0xb6>
  3649a4:	e9 34 01 00 00       	jmp    364add <_input+0x1db>
  3649a9:	c7 05 50 30 37 00 00 	movl   $0x36d900,0x373050
  3649b0:	d9 36 00 
  3649b3:	e9 25 01 00 00       	jmp    364add <_input+0x1db>
  3649b8:	c7 05 50 30 37 00 00 	movl   $0x36d500,0x373050
  3649bf:	d5 36 00 
  3649c2:	e9 16 01 00 00       	jmp    364add <_input+0x1db>
  3649c7:	a1 40 33 37 00       	mov    0x373340,%eax
  3649cc:	85 c0                	test   %eax,%eax
  3649ce:	74 24                	je     3649f4 <_input+0xf2>
  3649d0:	a1 40 33 37 00       	mov    0x373340,%eax
  3649d5:	83 e8 01             	sub    $0x1,%eax
  3649d8:	a3 40 33 37 00       	mov    %eax,0x373340
  3649dd:	83 ec 08             	sub    $0x8,%esp
  3649e0:	6a 08                	push   $0x8
  3649e2:	68 00 dd 36 00       	push   $0x36dd00
  3649e7:	e8 9c 46 00 00       	call   369088 <printk>
  3649ec:	83 c4 10             	add    $0x10,%esp
  3649ef:	e9 e9 00 00 00       	jmp    364add <_input+0x1db>
  3649f4:	e9 e4 00 00 00       	jmp    364add <_input+0x1db>
  3649f9:	a1 40 33 37 00       	mov    0x373340,%eax
  3649fe:	3d fe 00 00 00       	cmp    $0xfe,%eax
  364a03:	77 4d                	ja     364a52 <_input+0x150>
  364a05:	a1 40 33 37 00       	mov    0x373340,%eax
  364a0a:	8d 50 01             	lea    0x1(%eax),%edx
  364a0d:	89 15 40 33 37 00    	mov    %edx,0x373340
  364a13:	8b 15 50 30 37 00    	mov    0x373050,%edx
  364a19:	0f b6 4d f7          	movzbl -0x9(%ebp),%ecx
  364a1d:	c1 e1 02             	shl    $0x2,%ecx
  364a20:	01 ca                	add    %ecx,%edx
  364a22:	8b 12                	mov    (%edx),%edx
  364a24:	88 90 40 32 37 00    	mov    %dl,0x373240(%eax)
  364a2a:	a1 40 33 37 00       	mov    0x373340,%eax
  364a2f:	83 e8 01             	sub    $0x1,%eax
  364a32:	0f b6 80 40 32 37 00 	movzbl 0x373240(%eax),%eax
  364a39:	0f be c0             	movsbl %al,%eax
  364a3c:	83 ec 08             	sub    $0x8,%esp
  364a3f:	50                   	push   %eax
  364a40:	68 00 dd 36 00       	push   $0x36dd00
  364a45:	e8 3e 46 00 00       	call   369088 <printk>
  364a4a:	83 c4 10             	add    $0x10,%esp
  364a4d:	e9 8b 00 00 00       	jmp    364add <_input+0x1db>
  364a52:	e9 86 00 00 00       	jmp    364add <_input+0x1db>
  364a57:	a1 40 33 37 00       	mov    0x373340,%eax
  364a5c:	3d fe 00 00 00       	cmp    $0xfe,%eax
  364a61:	77 48                	ja     364aab <_input+0x1a9>
  364a63:	a1 40 33 37 00       	mov    0x373340,%eax
  364a68:	8d 50 01             	lea    0x1(%eax),%edx
  364a6b:	89 15 40 33 37 00    	mov    %edx,0x373340
  364a71:	8b 15 50 30 37 00    	mov    0x373050,%edx
  364a77:	0f b6 4d f7          	movzbl -0x9(%ebp),%ecx
  364a7b:	c1 e1 02             	shl    $0x2,%ecx
  364a7e:	01 ca                	add    %ecx,%edx
  364a80:	8b 12                	mov    (%edx),%edx
  364a82:	88 90 40 32 37 00    	mov    %dl,0x373240(%eax)
  364a88:	a1 40 33 37 00       	mov    0x373340,%eax
  364a8d:	83 e8 01             	sub    $0x1,%eax
  364a90:	0f b6 80 40 32 37 00 	movzbl 0x373240(%eax),%eax
  364a97:	0f be c0             	movsbl %al,%eax
  364a9a:	83 ec 08             	sub    $0x8,%esp
  364a9d:	50                   	push   %eax
  364a9e:	68 00 dd 36 00       	push   $0x36dd00
  364aa3:	e8 e0 45 00 00       	call   369088 <printk>
  364aa8:	83 c4 10             	add    $0x10,%esp
  364aab:	a1 44 33 37 00       	mov    0x373344,%eax
  364ab0:	85 c0                	test   %eax,%eax
  364ab2:	74 28                	je     364adc <_input+0x1da>
  364ab4:	a1 40 33 37 00       	mov    0x373340,%eax
  364ab9:	85 c0                	test   %eax,%eax
  364abb:	74 1f                	je     364adc <_input+0x1da>
  364abd:	8b 0d 48 33 37 00    	mov    0x373348,%ecx
  364ac3:	8b 15 4c 33 37 00    	mov    0x37334c,%edx
  364ac9:	a1 44 33 37 00       	mov    0x373344,%eax
  364ace:	83 ec 04             	sub    $0x4,%esp
  364ad1:	51                   	push   %ecx
  364ad2:	52                   	push   %edx
  364ad3:	50                   	push   %eax
  364ad4:	e8 06 00 00 00       	call   364adf <copy_buffer>
  364ad9:	83 c4 10             	add    $0x10,%esp
  364adc:	90                   	nop
  364add:	c9                   	leave  
  364ade:	c3                   	ret    

00364adf <copy_buffer>:
  364adf:	55                   	push   %ebp
  364ae0:	89 e5                	mov    %esp,%ebp
  364ae2:	57                   	push   %edi
  364ae3:	56                   	push   %esi
  364ae4:	53                   	push   %ebx
  364ae5:	83 ec 10             	sub    $0x10,%esp
  364ae8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  364aef:	a1 40 33 37 00       	mov    0x373340,%eax
  364af4:	85 c0                	test   %eax,%eax
  364af6:	75 1d                	jne    364b15 <copy_buffer+0x36>
  364af8:	8b 45 08             	mov    0x8(%ebp),%eax
  364afb:	a3 44 33 37 00       	mov    %eax,0x373344
  364b00:	8b 45 10             	mov    0x10(%ebp),%eax
  364b03:	a3 48 33 37 00       	mov    %eax,0x373348
  364b08:	8b 45 0c             	mov    0xc(%ebp),%eax
  364b0b:	a3 4c 33 37 00       	mov    %eax,0x37334c
  364b10:	e9 b6 00 00 00       	jmp    364bcb <copy_buffer+0xec>
  364b15:	a1 40 33 37 00       	mov    0x373340,%eax
  364b1a:	39 45 10             	cmp    %eax,0x10(%ebp)
  364b1d:	72 2a                	jb     364b49 <copy_buffer+0x6a>
  364b1f:	a1 40 33 37 00       	mov    0x373340,%eax
  364b24:	50                   	push   %eax
  364b25:	68 40 32 37 00       	push   $0x373240
  364b2a:	ff 75 0c             	pushl  0xc(%ebp)
  364b2d:	e8 7d fd ff ff       	call   3648af <memcpy>
  364b32:	83 c4 0c             	add    $0xc,%esp
  364b35:	a1 40 33 37 00       	mov    0x373340,%eax
  364b3a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  364b3d:	c7 05 40 33 37 00 00 	movl   $0x0,0x373340
  364b44:	00 00 00 
  364b47:	eb 45                	jmp    364b8e <copy_buffer+0xaf>
  364b49:	8b 45 10             	mov    0x10(%ebp),%eax
  364b4c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  364b4f:	8b 45 10             	mov    0x10(%ebp),%eax
  364b52:	50                   	push   %eax
  364b53:	68 40 32 37 00       	push   $0x373240
  364b58:	ff 75 0c             	pushl  0xc(%ebp)
  364b5b:	e8 4f fd ff ff       	call   3648af <memcpy>
  364b60:	83 c4 0c             	add    $0xc,%esp
  364b63:	a1 40 33 37 00       	mov    0x373340,%eax
  364b68:	2b 45 10             	sub    0x10(%ebp),%eax
  364b6b:	a3 40 33 37 00       	mov    %eax,0x373340
  364b70:	a1 40 33 37 00       	mov    0x373340,%eax
  364b75:	89 c2                	mov    %eax,%edx
  364b77:	8b 45 10             	mov    0x10(%ebp),%eax
  364b7a:	05 40 32 37 00       	add    $0x373240,%eax
  364b7f:	52                   	push   %edx
  364b80:	50                   	push   %eax
  364b81:	68 40 32 37 00       	push   $0x373240
  364b86:	e8 24 fd ff ff       	call   3648af <memcpy>
  364b8b:	83 c4 0c             	add    $0xc,%esp
  364b8e:	b8 02 00 00 00       	mov    $0x2,%eax
  364b93:	8b 5d 08             	mov    0x8(%ebp),%ebx
  364b96:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  364b99:	ba 00 00 00 00       	mov    $0x0,%edx
  364b9e:	be 00 00 00 00       	mov    $0x0,%esi
  364ba3:	bf 00 00 00 00       	mov    $0x0,%edi
  364ba8:	cd 80                	int    $0x80
  364baa:	89 45 ec             	mov    %eax,-0x14(%ebp)
  364bad:	c7 05 44 33 37 00 00 	movl   $0x0,0x373344
  364bb4:	00 00 00 
  364bb7:	c7 05 48 33 37 00 00 	movl   $0x0,0x373348
  364bbe:	00 00 00 
  364bc1:	c7 05 4c 33 37 00 00 	movl   $0x0,0x37334c
  364bc8:	00 00 00 
  364bcb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  364bce:	5b                   	pop    %ebx
  364bcf:	5e                   	pop    %esi
  364bd0:	5f                   	pop    %edi
  364bd1:	5d                   	pop    %ebp
  364bd2:	c3                   	ret    

00364bd3 <_reset>:
  364bd3:	55                   	push   %ebp
  364bd4:	89 e5                	mov    %esp,%ebp
  364bd6:	57                   	push   %edi
  364bd7:	56                   	push   %esi
  364bd8:	53                   	push   %ebx
  364bd9:	83 ec 10             	sub    $0x10,%esp
  364bdc:	6a 64                	push   $0x64
  364bde:	68 fe 00 00 00       	push   $0xfe
  364be3:	e8 9b fc ff ff       	call   364883 <outb_p>
  364be8:	83 c4 08             	add    $0x8,%esp
  364beb:	b8 02 00 00 00       	mov    $0x2,%eax
  364bf0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  364bf3:	b9 00 00 00 00       	mov    $0x0,%ecx
  364bf8:	ba 00 00 00 00       	mov    $0x0,%edx
  364bfd:	be 00 00 00 00       	mov    $0x0,%esi
  364c02:	bf 00 00 00 00       	mov    $0x0,%edi
  364c07:	cd 80                	int    $0x80
  364c09:	89 45 f0             	mov    %eax,-0x10(%ebp)
  364c0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  364c0f:	5b                   	pop    %ebx
  364c10:	5e                   	pop    %esi
  364c11:	5f                   	pop    %edi
  364c12:	5d                   	pop    %ebp
  364c13:	c3                   	ret    

00364c14 <scan_keyboard>:
  364c14:	55                   	push   %ebp
  364c15:	89 e5                	mov    %esp,%ebp
  364c17:	83 ec 10             	sub    $0x10,%esp
  364c1a:	6a 60                	push   $0x60
  364c1c:	e8 30 fc ff ff       	call   364851 <inb>
  364c21:	83 c4 04             	add    $0x4,%esp
  364c24:	0f b6 c0             	movzbl %al,%eax
  364c27:	89 45 fc             	mov    %eax,-0x4(%ebp)
  364c2a:	6a 61                	push   $0x61
  364c2c:	e8 20 fc ff ff       	call   364851 <inb>
  364c31:	83 c4 04             	add    $0x4,%esp
  364c34:	0f b6 c0             	movzbl %al,%eax
  364c37:	89 45 f8             	mov    %eax,-0x8(%ebp)
  364c3a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  364c3d:	83 c8 80             	or     $0xffffff80,%eax
  364c40:	0f b6 c0             	movzbl %al,%eax
  364c43:	6a 61                	push   $0x61
  364c45:	50                   	push   %eax
  364c46:	e8 e8 fb ff ff       	call   364833 <outb>
  364c4b:	83 c4 08             	add    $0x8,%esp
  364c4e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  364c51:	0f b6 c0             	movzbl %al,%eax
  364c54:	6a 61                	push   $0x61
  364c56:	50                   	push   %eax
  364c57:	e8 d7 fb ff ff       	call   364833 <outb>
  364c5c:	83 c4 08             	add    $0x8,%esp
  364c5f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  364c62:	c9                   	leave  
  364c63:	c3                   	ret    

00364c64 <keyboard_init>:
  364c64:	55                   	push   %ebp
  364c65:	89 e5                	mov    %esp,%ebp
  364c67:	57                   	push   %edi
  364c68:	56                   	push   %esi
  364c69:	53                   	push   %ebx
  364c6a:	83 ec 10             	sub    $0x10,%esp
  364c6d:	c7 05 a4 3c 37 00 00 	movl   $0x0,0x373ca4
  364c74:	00 00 00 
  364c77:	a1 a4 3c 37 00       	mov    0x373ca4,%eax
  364c7c:	a3 a0 3c 37 00       	mov    %eax,0x373ca0
  364c81:	c6 05 a8 3c 37 00 00 	movb   $0x0,0x373ca8
  364c88:	e8 87 ff ff ff       	call   364c14 <scan_keyboard>
  364c8d:	b8 03 00 00 00       	mov    $0x3,%eax
  364c92:	bb 0a 00 00 00       	mov    $0xa,%ebx
  364c97:	b9 02 49 36 00       	mov    $0x364902,%ecx
  364c9c:	ba 00 00 00 00       	mov    $0x0,%edx
  364ca1:	be 00 00 00 00       	mov    $0x0,%esi
  364ca6:	bf 00 00 00 00       	mov    $0x0,%edi
  364cab:	cd 80                	int    $0x80
  364cad:	89 45 f0             	mov    %eax,-0x10(%ebp)
  364cb0:	b8 03 00 00 00       	mov    $0x3,%eax
  364cb5:	bb 01 00 00 00       	mov    $0x1,%ebx
  364cba:	b9 d3 4b 36 00       	mov    $0x364bd3,%ecx
  364cbf:	ba 00 00 00 00       	mov    $0x0,%edx
  364cc4:	be 00 00 00 00       	mov    $0x0,%esi
  364cc9:	bf 00 00 00 00       	mov    $0x0,%edi
  364cce:	cd 80                	int    $0x80
  364cd0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  364cd3:	b8 03 00 00 00       	mov    $0x3,%eax
  364cd8:	bb 10 00 00 00       	mov    $0x10,%ebx
  364cdd:	b9 cf 48 36 00       	mov    $0x3648cf,%ecx
  364ce2:	ba 00 00 00 00       	mov    $0x0,%edx
  364ce7:	be 00 00 00 00       	mov    $0x0,%esi
  364cec:	bf 00 00 00 00       	mov    $0x0,%edi
  364cf1:	cd 80                	int    $0x80
  364cf3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  364cf6:	b8 01 00 00 00       	mov    $0x1,%eax
  364cfb:	bb 04 00 00 00       	mov    $0x4,%ebx
  364d00:	b9 13 00 00 00       	mov    $0x13,%ecx
  364d05:	ba 01 00 00 00       	mov    $0x1,%edx
  364d0a:	be 00 00 00 00       	mov    $0x0,%esi
  364d0f:	bf 00 00 00 00       	mov    $0x0,%edi
  364d14:	cd 80                	int    $0x80
  364d16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  364d19:	83 c4 10             	add    $0x10,%esp
  364d1c:	5b                   	pop    %ebx
  364d1d:	5e                   	pop    %esi
  364d1e:	5f                   	pop    %edi
  364d1f:	5d                   	pop    %ebp
  364d20:	c3                   	ret    

00364d21 <sb_info>:
  364d21:	55                   	push   %ebp
  364d22:	89 e5                	mov    %esp,%ebp
  364d24:	8b 45 08             	mov    0x8(%ebp),%eax
  364d27:	83 c0 70             	add    $0x70,%eax
  364d2a:	5d                   	pop    %ebp
  364d2b:	c3                   	ret    

00364d2c <strcpy>:
  364d2c:	55                   	push   %ebp
  364d2d:	89 e5                	mov    %esp,%ebp
  364d2f:	57                   	push   %edi
  364d30:	56                   	push   %esi
  364d31:	8b 55 0c             	mov    0xc(%ebp),%edx
  364d34:	8b 4d 08             	mov    0x8(%ebp),%ecx
  364d37:	89 d6                	mov    %edx,%esi
  364d39:	89 cf                	mov    %ecx,%edi
  364d3b:	fc                   	cld    
  364d3c:	ac                   	lods   %ds:(%esi),%al
  364d3d:	aa                   	stos   %al,%es:(%edi)
  364d3e:	84 c0                	test   %al,%al
  364d40:	75 fa                	jne    364d3c <strcpy+0x10>
  364d42:	8b 45 08             	mov    0x8(%ebp),%eax
  364d45:	5e                   	pop    %esi
  364d46:	5f                   	pop    %edi
  364d47:	5d                   	pop    %ebp
  364d48:	c3                   	ret    

00364d49 <mount_open>:
  364d49:	55                   	push   %ebp
  364d4a:	89 e5                	mov    %esp,%ebp
  364d4c:	57                   	push   %edi
  364d4d:	56                   	push   %esi
  364d4e:	53                   	push   %ebx
  364d4f:	83 ec 10             	sub    $0x10,%esp
  364d52:	8b 45 08             	mov    0x8(%ebp),%eax
  364d55:	8b 58 14             	mov    0x14(%eax),%ebx
  364d58:	b8 01 00 00 00       	mov    $0x1,%eax
  364d5d:	b9 00 00 00 00       	mov    $0x0,%ecx
  364d62:	8b 55 0c             	mov    0xc(%ebp),%edx
  364d65:	be 00 00 00 00       	mov    $0x0,%esi
  364d6a:	8b 7d 10             	mov    0x10(%ebp),%edi
  364d6d:	cd 80                	int    $0x80
  364d6f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  364d72:	8b 45 f0             	mov    -0x10(%ebp),%eax
  364d75:	83 c4 10             	add    $0x10,%esp
  364d78:	5b                   	pop    %ebx
  364d79:	5e                   	pop    %esi
  364d7a:	5f                   	pop    %edi
  364d7b:	5d                   	pop    %ebp
  364d7c:	c3                   	ret    

00364d7d <minix_close>:
  364d7d:	55                   	push   %ebp
  364d7e:	89 e5                	mov    %esp,%ebp
  364d80:	57                   	push   %edi
  364d81:	56                   	push   %esi
  364d82:	53                   	push   %ebx
  364d83:	83 ec 1c             	sub    $0x1c,%esp
  364d86:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  364d8b:	8b 80 f0 00 00 00    	mov    0xf0(%eax),%eax
  364d91:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  364d94:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  364d97:	8b 00                	mov    (%eax),%eax
  364d99:	8d 50 ff             	lea    -0x1(%eax),%edx
  364d9c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  364d9f:	89 10                	mov    %edx,(%eax)
  364da1:	b8 02 00 00 00       	mov    $0x2,%eax
  364da6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  364da9:	b9 00 00 00 00       	mov    $0x0,%ecx
  364dae:	ba 00 00 00 00       	mov    $0x0,%edx
  364db3:	be 00 00 00 00       	mov    $0x0,%esi
  364db8:	bf 00 00 00 00       	mov    $0x0,%edi
  364dbd:	cd 80                	int    $0x80
  364dbf:	89 45 e0             	mov    %eax,-0x20(%ebp)
  364dc2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  364dc5:	8b 00                	mov    (%eax),%eax
  364dc7:	85 c0                	test   %eax,%eax
  364dc9:	75 4b                	jne    364e16 <minix_close+0x99>
  364dcb:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  364dd0:	8b 80 f0 00 00 00    	mov    0xf0(%eax),%eax
  364dd6:	83 ec 08             	sub    $0x8,%esp
  364dd9:	6a 00                	push   $0x0
  364ddb:	50                   	push   %eax
  364ddc:	e8 be 6a 00 00       	call   36b89f <kfree_s>
  364de1:	83 c4 10             	add    $0x10,%esp
  364de4:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  364de9:	c7 80 f0 00 00 00 00 	movl   $0x0,0xf0(%eax)
  364df0:	00 00 00 
  364df3:	b8 01 00 00 00       	mov    $0x1,%eax
  364df8:	bb 03 00 00 00       	mov    $0x3,%ebx
  364dfd:	b9 01 00 00 00       	mov    $0x1,%ecx
  364e02:	ba 00 00 00 00       	mov    $0x0,%edx
  364e07:	be 00 00 00 00       	mov    $0x0,%esi
  364e0c:	bf 00 00 00 00       	mov    $0x0,%edi
  364e11:	cd 80                	int    $0x80
  364e13:	89 45 dc             	mov    %eax,-0x24(%ebp)
  364e16:	8d 65 f4             	lea    -0xc(%ebp),%esp
  364e19:	5b                   	pop    %ebx
  364e1a:	5e                   	pop    %esi
  364e1b:	5f                   	pop    %edi
  364e1c:	5d                   	pop    %ebp
  364e1d:	c3                   	ret    

00364e1e <minix_open>:
  364e1e:	55                   	push   %ebp
  364e1f:	89 e5                	mov    %esp,%ebp
  364e21:	57                   	push   %edi
  364e22:	56                   	push   %esi
  364e23:	53                   	push   %ebx
  364e24:	83 ec 10             	sub    $0x10,%esp
  364e27:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  364e2c:	8b 80 f0 00 00 00    	mov    0xf0(%eax),%eax
  364e32:	89 45 f0             	mov    %eax,-0x10(%ebp)
  364e35:	8b 45 f0             	mov    -0x10(%ebp),%eax
  364e38:	8b 00                	mov    (%eax),%eax
  364e3a:	8d 50 01             	lea    0x1(%eax),%edx
  364e3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  364e40:	89 10                	mov    %edx,(%eax)
  364e42:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  364e47:	8b 08                	mov    (%eax),%ecx
  364e49:	b8 02 00 00 00       	mov    $0x2,%eax
  364e4e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  364e51:	ba 00 00 00 00       	mov    $0x0,%edx
  364e56:	be 00 00 00 00       	mov    $0x0,%esi
  364e5b:	bf 00 00 00 00       	mov    $0x0,%edi
  364e60:	cd 80                	int    $0x80
  364e62:	89 45 ec             	mov    %eax,-0x14(%ebp)
  364e65:	83 c4 10             	add    $0x10,%esp
  364e68:	5b                   	pop    %ebx
  364e69:	5e                   	pop    %esi
  364e6a:	5f                   	pop    %edi
  364e6b:	5d                   	pop    %ebp
  364e6c:	c3                   	ret    

00364e6d <normal_open>:
  364e6d:	55                   	push   %ebp
  364e6e:	89 e5                	mov    %esp,%ebp
  364e70:	57                   	push   %edi
  364e71:	56                   	push   %esi
  364e72:	53                   	push   %ebx
  364e73:	83 ec 3c             	sub    $0x3c,%esp
  364e76:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  364e7a:	0f 84 82 01 00 00    	je     365002 <normal_open+0x195>
  364e80:	e8 02 6e 00 00       	call   36bc87 <fork>
  364e85:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  364e88:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  364e8c:	0f 85 6b 01 00 00    	jne    364ffd <normal_open+0x190>
  364e92:	83 ec 0c             	sub    $0xc,%esp
  364e95:	6a 10                	push   $0x10
  364e97:	e8 97 68 00 00       	call   36b733 <kalloc>
  364e9c:	83 c4 10             	add    $0x10,%esp
  364e9f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  364ea2:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  364ea7:	83 c0 14             	add    $0x14,%eax
  364eaa:	83 ec 08             	sub    $0x8,%esp
  364ead:	ff 75 0c             	pushl  0xc(%ebp)
  364eb0:	50                   	push   %eax
  364eb1:	e8 76 fe ff ff       	call   364d2c <strcpy>
  364eb6:	83 c4 10             	add    $0x10,%esp
  364eb9:	8b 55 10             	mov    0x10(%ebp),%edx
  364ebc:	8b 45 e0             	mov    -0x20(%ebp),%eax
  364ebf:	89 50 0c             	mov    %edx,0xc(%eax)
  364ec2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  364ec5:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  364ecc:	8b 45 10             	mov    0x10(%ebp),%eax
  364ecf:	25 00 04 00 00       	and    $0x400,%eax
  364ed4:	85 c0                	test   %eax,%eax
  364ed6:	74 0e                	je     364ee6 <normal_open+0x79>
  364ed8:	8b 45 08             	mov    0x8(%ebp),%eax
  364edb:	8b 40 18             	mov    0x18(%eax),%eax
  364ede:	89 c2                	mov    %eax,%edx
  364ee0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  364ee3:	89 50 04             	mov    %edx,0x4(%eax)
  364ee6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  364ee9:	8b 55 08             	mov    0x8(%ebp),%edx
  364eec:	89 50 08             	mov    %edx,0x8(%eax)
  364eef:	8b 45 e0             	mov    -0x20(%ebp),%eax
  364ef2:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  364ef8:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  364efd:	8b 55 e0             	mov    -0x20(%ebp),%edx
  364f00:	89 90 f0 00 00 00    	mov    %edx,0xf0(%eax)
  364f06:	b8 03 00 00 00       	mov    $0x3,%eax
  364f0b:	bb 00 00 00 00       	mov    $0x0,%ebx
  364f10:	b9 1e 4e 36 00       	mov    $0x364e1e,%ecx
  364f15:	ba 00 00 00 00       	mov    $0x0,%edx
  364f1a:	be 00 00 00 00       	mov    $0x0,%esi
  364f1f:	bf 00 00 00 00       	mov    $0x0,%edi
  364f24:	cd 80                	int    $0x80
  364f26:	89 45 dc             	mov    %eax,-0x24(%ebp)
  364f29:	b8 03 00 00 00       	mov    $0x3,%eax
  364f2e:	bb 05 00 00 00       	mov    $0x5,%ebx
  364f33:	b9 71 5b 36 00       	mov    $0x365b71,%ecx
  364f38:	ba 00 00 00 00       	mov    $0x0,%edx
  364f3d:	be 00 00 00 00       	mov    $0x0,%esi
  364f42:	bf 00 00 00 00       	mov    $0x0,%edi
  364f47:	cd 80                	int    $0x80
  364f49:	89 45 d8             	mov    %eax,-0x28(%ebp)
  364f4c:	b8 03 00 00 00       	mov    $0x3,%eax
  364f51:	bb 06 00 00 00       	mov    $0x6,%ebx
  364f56:	b9 f9 5a 36 00       	mov    $0x365af9,%ecx
  364f5b:	ba 00 00 00 00       	mov    $0x0,%edx
  364f60:	be 00 00 00 00       	mov    $0x0,%esi
  364f65:	bf 00 00 00 00       	mov    $0x0,%edi
  364f6a:	cd 80                	int    $0x80
  364f6c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  364f6f:	b8 03 00 00 00       	mov    $0x3,%eax
  364f74:	bb 01 00 00 00       	mov    $0x1,%ebx
  364f79:	b9 7d 4d 36 00       	mov    $0x364d7d,%ecx
  364f7e:	ba 00 00 00 00       	mov    $0x0,%edx
  364f83:	be 00 00 00 00       	mov    $0x0,%esi
  364f88:	bf 00 00 00 00       	mov    $0x0,%edi
  364f8d:	cd 80                	int    $0x80
  364f8f:	89 45 d0             	mov    %eax,-0x30(%ebp)
  364f92:	b8 03 00 00 00       	mov    $0x3,%eax
  364f97:	bb 09 00 00 00       	mov    $0x9,%ebx
  364f9c:	b9 e0 cd 36 00       	mov    $0x36cde0,%ecx
  364fa1:	ba 00 00 00 00       	mov    $0x0,%edx
  364fa6:	be 00 00 00 00       	mov    $0x0,%esi
  364fab:	bf 00 00 00 00       	mov    $0x0,%edi
  364fb0:	cd 80                	int    $0x80
  364fb2:	89 45 cc             	mov    %eax,-0x34(%ebp)
  364fb5:	b8 03 00 00 00       	mov    $0x3,%eax
  364fba:	bb 0c 00 00 00       	mov    $0xc,%ebx
  364fbf:	b9 b4 ce 36 00       	mov    $0x36ceb4,%ecx
  364fc4:	ba 00 00 00 00       	mov    $0x0,%edx
  364fc9:	be 00 00 00 00       	mov    $0x0,%esi
  364fce:	bf 00 00 00 00       	mov    $0x0,%edi
  364fd3:	cd 80                	int    $0x80
  364fd5:	89 45 c8             	mov    %eax,-0x38(%ebp)
  364fd8:	b8 00 00 00 00       	mov    $0x0,%eax
  364fdd:	bb 00 00 00 00       	mov    $0x0,%ebx
  364fe2:	b9 00 00 00 00       	mov    $0x0,%ecx
  364fe7:	ba 00 00 00 00       	mov    $0x0,%edx
  364fec:	be 00 00 00 00       	mov    $0x0,%esi
  364ff1:	bf 00 00 00 00       	mov    $0x0,%edi
  364ff6:	cd 80                	int    $0x80
  364ff8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  364ffb:	eb 05                	jmp    365002 <normal_open+0x195>
  364ffd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  365000:	eb 05                	jmp    365007 <normal_open+0x19a>
  365002:	b8 e9 ff ff ff       	mov    $0xffffffe9,%eax
  365007:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36500a:	5b                   	pop    %ebx
  36500b:	5e                   	pop    %esi
  36500c:	5f                   	pop    %edi
  36500d:	5d                   	pop    %ebp
  36500e:	c3                   	ret    

0036500f <rootfs_open>:
  36500f:	55                   	push   %ebp
  365010:	89 e5                	mov    %esp,%ebp
  365012:	57                   	push   %edi
  365013:	56                   	push   %esi
  365014:	53                   	push   %ebx
  365015:	83 ec 1c             	sub    $0x1c,%esp
  365018:	a1 54 33 37 00       	mov    0x373354,%eax
  36501d:	8b 40 38             	mov    0x38(%eax),%eax
  365020:	83 ec 0c             	sub    $0xc,%esp
  365023:	8d 55 d8             	lea    -0x28(%ebp),%edx
  365026:	52                   	push   %edx
  365027:	ff 75 14             	pushl  0x14(%ebp)
  36502a:	ff 75 10             	pushl  0x10(%ebp)
  36502d:	ff 75 0c             	pushl  0xc(%ebp)
  365030:	50                   	push   %eax
  365031:	e8 05 14 00 00       	call   36643b <open_namei>
  365036:	83 c4 20             	add    $0x20,%esp
  365039:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36503c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  365040:	74 21                	je     365063 <rootfs_open+0x54>
  365042:	b8 02 00 00 00       	mov    $0x2,%eax
  365047:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36504a:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  36504f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  365052:	be 00 00 00 00       	mov    $0x0,%esi
  365057:	bf 00 00 00 00       	mov    $0x0,%edi
  36505c:	cd 80                	int    $0x80
  36505e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  365061:	eb 33                	jmp    365096 <rootfs_open+0x87>
  365063:	8b 45 d8             	mov    -0x28(%ebp),%eax
  365066:	ff 75 14             	pushl  0x14(%ebp)
  365069:	ff 75 10             	pushl  0x10(%ebp)
  36506c:	ff 75 0c             	pushl  0xc(%ebp)
  36506f:	50                   	push   %eax
  365070:	e8 f8 fd ff ff       	call   364e6d <normal_open>
  365075:	83 c4 10             	add    $0x10,%esp
  365078:	89 c1                	mov    %eax,%ecx
  36507a:	b8 02 00 00 00       	mov    $0x2,%eax
  36507f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  365082:	ba 00 00 00 00       	mov    $0x0,%edx
  365087:	be 00 00 00 00       	mov    $0x0,%esi
  36508c:	bf 00 00 00 00       	mov    $0x0,%edi
  365091:	cd 80                	int    $0x80
  365093:	89 45 dc             	mov    %eax,-0x24(%ebp)
  365096:	8d 65 f4             	lea    -0xc(%ebp),%esp
  365099:	5b                   	pop    %ebx
  36509a:	5e                   	pop    %esi
  36509b:	5f                   	pop    %edi
  36509c:	5d                   	pop    %ebp
  36509d:	c3                   	ret    

0036509e <rootfs_mkdir>:
  36509e:	55                   	push   %ebp
  36509f:	89 e5                	mov    %esp,%ebp
  3650a1:	57                   	push   %edi
  3650a2:	56                   	push   %esi
  3650a3:	53                   	push   %ebx
  3650a4:	83 ec 1c             	sub    $0x1c,%esp
  3650a7:	a1 54 33 37 00       	mov    0x373354,%eax
  3650ac:	8b 40 38             	mov    0x38(%eax),%eax
  3650af:	83 ec 04             	sub    $0x4,%esp
  3650b2:	ff 75 10             	pushl  0x10(%ebp)
  3650b5:	ff 75 0c             	pushl  0xc(%ebp)
  3650b8:	50                   	push   %eax
  3650b9:	e8 aa 16 00 00       	call   366768 <minix_mkdir>
  3650be:	83 c4 10             	add    $0x10,%esp
  3650c1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3650c4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  3650c8:	74 21                	je     3650eb <rootfs_mkdir+0x4d>
  3650ca:	b8 02 00 00 00       	mov    $0x2,%eax
  3650cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3650d2:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  3650d7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  3650da:	be 00 00 00 00       	mov    $0x0,%esi
  3650df:	bf 00 00 00 00       	mov    $0x0,%edi
  3650e4:	cd 80                	int    $0x80
  3650e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  3650e9:	eb 1f                	jmp    36510a <rootfs_mkdir+0x6c>
  3650eb:	b8 02 00 00 00       	mov    $0x2,%eax
  3650f0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3650f3:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  3650f6:	ba 00 00 00 00       	mov    $0x0,%edx
  3650fb:	be 00 00 00 00       	mov    $0x0,%esi
  365100:	bf 00 00 00 00       	mov    $0x0,%edi
  365105:	cd 80                	int    $0x80
  365107:	89 45 dc             	mov    %eax,-0x24(%ebp)
  36510a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36510d:	5b                   	pop    %ebx
  36510e:	5e                   	pop    %esi
  36510f:	5f                   	pop    %edi
  365110:	5d                   	pop    %ebp
  365111:	c3                   	ret    

00365112 <rootfs_rmdir>:
  365112:	55                   	push   %ebp
  365113:	89 e5                	mov    %esp,%ebp
  365115:	57                   	push   %edi
  365116:	56                   	push   %esi
  365117:	53                   	push   %ebx
  365118:	83 ec 1c             	sub    $0x1c,%esp
  36511b:	a1 54 33 37 00       	mov    0x373354,%eax
  365120:	8b 40 38             	mov    0x38(%eax),%eax
  365123:	83 ec 08             	sub    $0x8,%esp
  365126:	ff 75 0c             	pushl  0xc(%ebp)
  365129:	50                   	push   %eax
  36512a:	e8 02 1b 00 00       	call   366c31 <minix_rmdir>
  36512f:	83 c4 10             	add    $0x10,%esp
  365132:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  365135:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  365139:	74 21                	je     36515c <rootfs_rmdir+0x4a>
  36513b:	b8 02 00 00 00       	mov    $0x2,%eax
  365140:	8b 5d 08             	mov    0x8(%ebp),%ebx
  365143:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  365148:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  36514b:	be 00 00 00 00       	mov    $0x0,%esi
  365150:	bf 00 00 00 00       	mov    $0x0,%edi
  365155:	cd 80                	int    $0x80
  365157:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36515a:	eb 1f                	jmp    36517b <rootfs_rmdir+0x69>
  36515c:	b8 02 00 00 00       	mov    $0x2,%eax
  365161:	8b 5d 08             	mov    0x8(%ebp),%ebx
  365164:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  365167:	ba 00 00 00 00       	mov    $0x0,%edx
  36516c:	be 00 00 00 00       	mov    $0x0,%esi
  365171:	bf 00 00 00 00       	mov    $0x0,%edi
  365176:	cd 80                	int    $0x80
  365178:	89 45 dc             	mov    %eax,-0x24(%ebp)
  36517b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36517e:	5b                   	pop    %ebx
  36517f:	5e                   	pop    %esi
  365180:	5f                   	pop    %edi
  365181:	5d                   	pop    %ebp
  365182:	c3                   	ret    

00365183 <info_inode>:
  365183:	55                   	push   %ebp
  365184:	89 e5                	mov    %esp,%ebp
  365186:	83 ec 08             	sub    $0x8,%esp
  365189:	83 ec 08             	sub    $0x8,%esp
  36518c:	68 04 dd 36 00       	push   $0x36dd04
  365191:	68 0c dd 36 00       	push   $0x36dd0c
  365196:	e8 ed 3e 00 00       	call   369088 <printk>
  36519b:	83 c4 10             	add    $0x10,%esp
  36519e:	8b 45 08             	mov    0x8(%ebp),%eax
  3651a1:	8b 40 10             	mov    0x10(%eax),%eax
  3651a4:	83 ec 04             	sub    $0x4,%esp
  3651a7:	50                   	push   %eax
  3651a8:	68 04 dd 36 00       	push   $0x36dd04
  3651ad:	68 2d dd 36 00       	push   $0x36dd2d
  3651b2:	e8 d1 3e 00 00       	call   369088 <printk>
  3651b7:	83 c4 10             	add    $0x10,%esp
  3651ba:	8b 45 08             	mov    0x8(%ebp),%eax
  3651bd:	8b 40 18             	mov    0x18(%eax),%eax
  3651c0:	83 ec 04             	sub    $0x4,%esp
  3651c3:	50                   	push   %eax
  3651c4:	68 04 dd 36 00       	push   $0x36dd04
  3651c9:	68 44 dd 36 00       	push   $0x36dd44
  3651ce:	e8 b5 3e 00 00       	call   369088 <printk>
  3651d3:	83 c4 10             	add    $0x10,%esp
  3651d6:	8b 45 08             	mov    0x8(%ebp),%eax
  3651d9:	8b 00                	mov    (%eax),%eax
  3651db:	83 ec 04             	sub    $0x4,%esp
  3651de:	50                   	push   %eax
  3651df:	68 04 dd 36 00       	push   $0x36dd04
  3651e4:	68 5b dd 36 00       	push   $0x36dd5b
  3651e9:	e8 9a 3e 00 00       	call   369088 <printk>
  3651ee:	83 c4 10             	add    $0x10,%esp
  3651f1:	c9                   	leave  
  3651f2:	c3                   	ret    

003651f3 <info_super>:
  3651f3:	55                   	push   %ebp
  3651f4:	89 e5                	mov    %esp,%ebp
  3651f6:	83 ec 18             	sub    $0x18,%esp
  3651f9:	ff 75 08             	pushl  0x8(%ebp)
  3651fc:	e8 20 fb ff ff       	call   364d21 <sb_info>
  365201:	83 c4 04             	add    $0x4,%esp
  365204:	89 45 f4             	mov    %eax,-0xc(%ebp)
  365207:	83 ec 08             	sub    $0x8,%esp
  36520a:	68 04 dd 36 00       	push   $0x36dd04
  36520f:	68 74 dd 36 00       	push   $0x36dd74
  365214:	e8 6f 3e 00 00       	call   369088 <printk>
  365219:	83 c4 10             	add    $0x10,%esp
  36521c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36521f:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  365223:	66 83 f8 01          	cmp    $0x1,%ax
  365227:	74 1b                	je     365244 <info_super+0x51>
  365229:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36522c:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  365230:	66 83 f8 02          	cmp    $0x2,%ax
  365234:	75 07                	jne    36523d <info_super+0x4a>
  365236:	b8 a8 dd 36 00       	mov    $0x36dda8,%eax
  36523b:	eb 0c                	jmp    365249 <info_super+0x56>
  36523d:	b8 b1 dd 36 00       	mov    $0x36ddb1,%eax
  365242:	eb 05                	jmp    365249 <info_super+0x56>
  365244:	b8 b8 dd 36 00       	mov    $0x36ddb8,%eax
  365249:	83 ec 04             	sub    $0x4,%esp
  36524c:	50                   	push   %eax
  36524d:	68 04 dd 36 00       	push   $0x36dd04
  365252:	68 c4 dd 36 00       	push   $0x36ddc4
  365257:	e8 2c 3e 00 00       	call   369088 <printk>
  36525c:	83 c4 10             	add    $0x10,%esp
  36525f:	a1 54 33 37 00       	mov    0x373354,%eax
  365264:	8b 00                	mov    (%eax),%eax
  365266:	83 ec 04             	sub    $0x4,%esp
  365269:	50                   	push   %eax
  36526a:	68 04 dd 36 00       	push   $0x36dd04
  36526f:	68 e8 dd 36 00       	push   $0x36dde8
  365274:	e8 0f 3e 00 00       	call   369088 <printk>
  365279:	83 c4 10             	add    $0x10,%esp
  36527c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36527f:	8b 00                	mov    (%eax),%eax
  365281:	83 ec 04             	sub    $0x4,%esp
  365284:	50                   	push   %eax
  365285:	68 04 dd 36 00       	push   $0x36dd04
  36528a:	68 0c de 36 00       	push   $0x36de0c
  36528f:	e8 f4 3d 00 00       	call   369088 <printk>
  365294:	83 c4 10             	add    $0x10,%esp
  365297:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36529a:	8b 40 10             	mov    0x10(%eax),%eax
  36529d:	83 ec 04             	sub    $0x4,%esp
  3652a0:	50                   	push   %eax
  3652a1:	68 04 dd 36 00       	push   $0x36dd04
  3652a6:	68 30 de 36 00       	push   $0x36de30
  3652ab:	e8 d8 3d 00 00       	call   369088 <printk>
  3652b0:	83 c4 10             	add    $0x10,%esp
  3652b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3652b6:	8b 40 14             	mov    0x14(%eax),%eax
  3652b9:	83 ec 04             	sub    $0x4,%esp
  3652bc:	50                   	push   %eax
  3652bd:	68 04 dd 36 00       	push   $0x36dd04
  3652c2:	68 54 de 36 00       	push   $0x36de54
  3652c7:	e8 bc 3d 00 00       	call   369088 <printk>
  3652cc:	83 c4 10             	add    $0x10,%esp
  3652cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3652d2:	0f b7 40 26          	movzwl 0x26(%eax),%eax
  3652d6:	0f b7 c0             	movzwl %ax,%eax
  3652d9:	83 ec 04             	sub    $0x4,%esp
  3652dc:	50                   	push   %eax
  3652dd:	68 04 dd 36 00       	push   $0x36dd04
  3652e2:	68 78 de 36 00       	push   $0x36de78
  3652e7:	e8 9c 3d 00 00       	call   369088 <printk>
  3652ec:	83 c4 10             	add    $0x10,%esp
  3652ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3652f2:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  3652f6:	0f b7 c0             	movzwl %ax,%eax
  3652f9:	83 ec 04             	sub    $0x4,%esp
  3652fc:	50                   	push   %eax
  3652fd:	68 04 dd 36 00       	push   $0x36dd04
  365302:	68 9c de 36 00       	push   $0x36de9c
  365307:	e8 7c 3d 00 00       	call   369088 <printk>
  36530c:	83 c4 10             	add    $0x10,%esp
  36530f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  365312:	8b 40 08             	mov    0x8(%eax),%eax
  365315:	83 ec 04             	sub    $0x4,%esp
  365318:	50                   	push   %eax
  365319:	68 04 dd 36 00       	push   $0x36dd04
  36531e:	68 c0 de 36 00       	push   $0x36dec0
  365323:	e8 60 3d 00 00       	call   369088 <printk>
  365328:	83 c4 10             	add    $0x10,%esp
  36532b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36532e:	8b 40 0c             	mov    0xc(%eax),%eax
  365331:	83 ec 04             	sub    $0x4,%esp
  365334:	50                   	push   %eax
  365335:	68 04 dd 36 00       	push   $0x36dd04
  36533a:	68 e4 de 36 00       	push   $0x36dee4
  36533f:	e8 44 3d 00 00       	call   369088 <printk>
  365344:	83 c4 10             	add    $0x10,%esp
  365347:	c9                   	leave  
  365348:	c3                   	ret    

00365349 <rootfs_inode>:
  365349:	55                   	push   %ebp
  36534a:	89 e5                	mov    %esp,%ebp
  36534c:	57                   	push   %edi
  36534d:	56                   	push   %esi
  36534e:	53                   	push   %ebx
  36534f:	83 ec 1c             	sub    $0x1c,%esp
  365352:	a1 54 33 37 00       	mov    0x373354,%eax
  365357:	83 ec 08             	sub    $0x8,%esp
  36535a:	ff 75 0c             	pushl  0xc(%ebp)
  36535d:	50                   	push   %eax
  36535e:	e8 60 29 00 00       	call   367cc3 <minix_find_inode>
  365363:	83 c4 10             	add    $0x10,%esp
  365366:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  365369:	83 ec 0c             	sub    $0xc,%esp
  36536c:	ff 75 e4             	pushl  -0x1c(%ebp)
  36536f:	e8 0f fe ff ff       	call   365183 <info_inode>
  365374:	83 c4 10             	add    $0x10,%esp
  365377:	b8 02 00 00 00       	mov    $0x2,%eax
  36537c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36537f:	b9 00 00 00 00       	mov    $0x0,%ecx
  365384:	ba 00 00 00 00       	mov    $0x0,%edx
  365389:	be 00 00 00 00       	mov    $0x0,%esi
  36538e:	bf 00 00 00 00       	mov    $0x0,%edi
  365393:	cd 80                	int    $0x80
  365395:	89 45 e0             	mov    %eax,-0x20(%ebp)
  365398:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36539b:	5b                   	pop    %ebx
  36539c:	5e                   	pop    %esi
  36539d:	5f                   	pop    %edi
  36539e:	5d                   	pop    %ebp
  36539f:	c3                   	ret    

003653a0 <rootfs_super>:
  3653a0:	55                   	push   %ebp
  3653a1:	89 e5                	mov    %esp,%ebp
  3653a3:	57                   	push   %edi
  3653a4:	56                   	push   %esi
  3653a5:	53                   	push   %ebx
  3653a6:	83 ec 1c             	sub    $0x1c,%esp
  3653a9:	a1 54 33 37 00       	mov    0x373354,%eax
  3653ae:	83 ec 0c             	sub    $0xc,%esp
  3653b1:	50                   	push   %eax
  3653b2:	e8 3c fe ff ff       	call   3651f3 <info_super>
  3653b7:	83 c4 10             	add    $0x10,%esp
  3653ba:	b8 02 00 00 00       	mov    $0x2,%eax
  3653bf:	8b 5d 08             	mov    0x8(%ebp),%ebx
  3653c2:	b9 00 00 00 00       	mov    $0x0,%ecx
  3653c7:	ba 00 00 00 00       	mov    $0x0,%edx
  3653cc:	be 00 00 00 00       	mov    $0x0,%esi
  3653d1:	bf 00 00 00 00       	mov    $0x0,%edi
  3653d6:	cd 80                	int    $0x80
  3653d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3653db:	8d 65 f4             	lea    -0xc(%ebp),%esp
  3653de:	5b                   	pop    %ebx
  3653df:	5e                   	pop    %esi
  3653e0:	5f                   	pop    %edi
  3653e1:	5d                   	pop    %ebp
  3653e2:	c3                   	ret    

003653e3 <rootfs_init>:
  3653e3:	55                   	push   %ebp
  3653e4:	89 e5                	mov    %esp,%ebp
  3653e6:	57                   	push   %edi
  3653e7:	56                   	push   %esi
  3653e8:	53                   	push   %ebx
  3653e9:	83 ec 2c             	sub    $0x2c,%esp
  3653ec:	83 ec 08             	sub    $0x8,%esp
  3653ef:	68 04 dd 36 00       	push   $0x36dd04
  3653f4:	68 07 df 36 00       	push   $0x36df07
  3653f9:	e8 8a 3c 00 00       	call   369088 <printk>
  3653fe:	83 c4 10             	add    $0x10,%esp
  365401:	83 ec 08             	sub    $0x8,%esp
  365404:	8d 45 d0             	lea    -0x30(%ebp),%eax
  365407:	50                   	push   %eax
  365408:	6a 08                	push   $0x8
  36540a:	e8 9d 29 00 00       	call   367dac <minix_sget>
  36540f:	83 c4 10             	add    $0x10,%esp
  365412:	a3 54 33 37 00       	mov    %eax,0x373354
  365417:	a1 54 33 37 00       	mov    0x373354,%eax
  36541c:	85 c0                	test   %eax,%eax
  36541e:	75 10                	jne    365430 <rootfs_init+0x4d>
  365420:	83 ec 0c             	sub    $0xc,%esp
  365423:	68 1d df 36 00       	push   $0x36df1d
  365428:	e8 3f 3c 00 00       	call   36906c <panic>
  36542d:	83 c4 10             	add    $0x10,%esp
  365430:	b8 03 00 00 00       	mov    $0x3,%eax
  365435:	bb 00 00 00 00       	mov    $0x0,%ebx
  36543a:	b9 0f 50 36 00       	mov    $0x36500f,%ecx
  36543f:	ba 00 00 00 00       	mov    $0x0,%edx
  365444:	be 00 00 00 00       	mov    $0x0,%esi
  365449:	bf 00 00 00 00       	mov    $0x0,%edi
  36544e:	cd 80                	int    $0x80
  365450:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  365453:	b8 03 00 00 00       	mov    $0x3,%eax
  365458:	bb 10 00 00 00       	mov    $0x10,%ebx
  36545d:	b9 9e 50 36 00       	mov    $0x36509e,%ecx
  365462:	ba 00 00 00 00       	mov    $0x0,%edx
  365467:	be 00 00 00 00       	mov    $0x0,%esi
  36546c:	bf 00 00 00 00       	mov    $0x0,%edi
  365471:	cd 80                	int    $0x80
  365473:	89 45 e0             	mov    %eax,-0x20(%ebp)
  365476:	b8 03 00 00 00       	mov    $0x3,%eax
  36547b:	bb 11 00 00 00       	mov    $0x11,%ebx
  365480:	b9 12 51 36 00       	mov    $0x365112,%ecx
  365485:	ba 00 00 00 00       	mov    $0x0,%edx
  36548a:	be 00 00 00 00       	mov    $0x0,%esi
  36548f:	bf 00 00 00 00       	mov    $0x0,%edi
  365494:	cd 80                	int    $0x80
  365496:	89 45 dc             	mov    %eax,-0x24(%ebp)
  365499:	b8 03 00 00 00       	mov    $0x3,%eax
  36549e:	bb 1e 00 00 00       	mov    $0x1e,%ebx
  3654a3:	b9 49 53 36 00       	mov    $0x365349,%ecx
  3654a8:	ba 00 00 00 00       	mov    $0x0,%edx
  3654ad:	be 00 00 00 00       	mov    $0x0,%esi
  3654b2:	bf 00 00 00 00       	mov    $0x0,%edi
  3654b7:	cd 80                	int    $0x80
  3654b9:	89 45 d8             	mov    %eax,-0x28(%ebp)
  3654bc:	b8 03 00 00 00       	mov    $0x3,%eax
  3654c1:	bb 1d 00 00 00       	mov    $0x1d,%ebx
  3654c6:	b9 a0 53 36 00       	mov    $0x3653a0,%ecx
  3654cb:	ba 00 00 00 00       	mov    $0x0,%edx
  3654d0:	be 00 00 00 00       	mov    $0x0,%esi
  3654d5:	bf 00 00 00 00       	mov    $0x0,%edi
  3654da:	cd 80                	int    $0x80
  3654dc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  3654df:	8d 65 f4             	lea    -0xc(%ebp),%esp
  3654e2:	5b                   	pop    %ebx
  3654e3:	5e                   	pop    %esi
  3654e4:	5f                   	pop    %edi
  3654e5:	5d                   	pop    %ebp
  3654e6:	c3                   	ret    

003654e7 <rootfs_main>:
  3654e7:	55                   	push   %ebp
  3654e8:	89 e5                	mov    %esp,%ebp
  3654ea:	57                   	push   %edi
  3654eb:	56                   	push   %esi
  3654ec:	53                   	push   %ebx
  3654ed:	83 ec 1c             	sub    $0x1c,%esp
  3654f0:	e8 ee fe ff ff       	call   3653e3 <rootfs_init>
  3654f5:	83 ec 08             	sub    $0x8,%esp
  3654f8:	68 04 dd 36 00       	push   $0x36dd04
  3654fd:	68 36 df 36 00       	push   $0x36df36
  365502:	e8 81 3b 00 00       	call   369088 <printk>
  365507:	83 c4 10             	add    $0x10,%esp
  36550a:	b8 00 00 00 00       	mov    $0x0,%eax
  36550f:	bb 00 00 00 00       	mov    $0x0,%ebx
  365514:	b9 00 00 00 00       	mov    $0x0,%ecx
  365519:	ba 00 00 00 00       	mov    $0x0,%edx
  36551e:	be 00 00 00 00       	mov    $0x0,%esi
  365523:	bf 00 00 00 00       	mov    $0x0,%edi
  365528:	cd 80                	int    $0x80
  36552a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36552d:	b8 00 00 00 00       	mov    $0x0,%eax
  365532:	8d 65 f4             	lea    -0xc(%ebp),%esp
  365535:	5b                   	pop    %ebx
  365536:	5e                   	pop    %esi
  365537:	5f                   	pop    %edi
  365538:	5d                   	pop    %ebp
  365539:	c3                   	ret    

0036553a <blk_readpage>:
  36553a:	55                   	push   %ebp
  36553b:	89 e5                	mov    %esp,%ebp
  36553d:	83 ec 08             	sub    $0x8,%esp
  365540:	83 ec 0c             	sub    $0xc,%esp
  365543:	6a 01                	push   $0x1
  365545:	ff 75 10             	pushl  0x10(%ebp)
  365548:	ff 75 0c             	pushl  0xc(%ebp)
  36554b:	6a 07                	push   $0x7
  36554d:	ff 75 08             	pushl  0x8(%ebp)
  365550:	e8 1e 78 00 00       	call   36cd73 <blk_rw>
  365555:	83 c4 20             	add    $0x20,%esp
  365558:	c9                   	leave  
  365559:	c3                   	ret    

0036555a <blk_writepage>:
  36555a:	55                   	push   %ebp
  36555b:	89 e5                	mov    %esp,%ebp
  36555d:	83 ec 08             	sub    $0x8,%esp
  365560:	83 ec 0c             	sub    $0xc,%esp
  365563:	6a 01                	push   $0x1
  365565:	ff 75 10             	pushl  0x10(%ebp)
  365568:	ff 75 0c             	pushl  0xc(%ebp)
  36556b:	6a 08                	push   $0x8
  36556d:	ff 75 08             	pushl  0x8(%ebp)
  365570:	e8 fe 77 00 00       	call   36cd73 <blk_rw>
  365575:	83 c4 20             	add    $0x20,%esp
  365578:	c9                   	leave  
  365579:	c3                   	ret    

0036557a <inode_bread>:
  36557a:	55                   	push   %ebp
  36557b:	89 e5                	mov    %esp,%ebp
  36557d:	83 ec 18             	sub    $0x18,%esp
  365580:	8b 45 08             	mov    0x8(%ebp),%eax
  365583:	8b 40 14             	mov    0x14(%eax),%eax
  365586:	89 45 f4             	mov    %eax,-0xc(%ebp)
  365589:	83 ec 04             	sub    $0x4,%esp
  36558c:	6a 00                	push   $0x0
  36558e:	ff 75 10             	pushl  0x10(%ebp)
  365591:	ff 75 08             	pushl  0x8(%ebp)
  365594:	e8 9b 1c 00 00       	call   367234 <bmap>
  365599:	83 c4 10             	add    $0x10,%esp
  36559c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36559f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  3655a3:	75 07                	jne    3655ac <inode_bread+0x32>
  3655a5:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
  3655aa:	eb 14                	jmp    3655c0 <inode_bread+0x46>
  3655ac:	83 ec 04             	sub    $0x4,%esp
  3655af:	ff 75 f0             	pushl  -0x10(%ebp)
  3655b2:	ff 75 0c             	pushl  0xc(%ebp)
  3655b5:	ff 75 f4             	pushl  -0xc(%ebp)
  3655b8:	e8 7d ff ff ff       	call   36553a <blk_readpage>
  3655bd:	83 c4 10             	add    $0x10,%esp
  3655c0:	c9                   	leave  
  3655c1:	c3                   	ret    

003655c2 <inode_bwrite>:
  3655c2:	55                   	push   %ebp
  3655c3:	89 e5                	mov    %esp,%ebp
  3655c5:	83 ec 18             	sub    $0x18,%esp
  3655c8:	8b 45 08             	mov    0x8(%ebp),%eax
  3655cb:	8b 40 14             	mov    0x14(%eax),%eax
  3655ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3655d1:	83 ec 04             	sub    $0x4,%esp
  3655d4:	6a 01                	push   $0x1
  3655d6:	ff 75 10             	pushl  0x10(%ebp)
  3655d9:	ff 75 08             	pushl  0x8(%ebp)
  3655dc:	e8 53 1c 00 00       	call   367234 <bmap>
  3655e1:	83 c4 10             	add    $0x10,%esp
  3655e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3655e7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  3655eb:	75 07                	jne    3655f4 <inode_bwrite+0x32>
  3655ed:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
  3655f2:	eb 14                	jmp    365608 <inode_bwrite+0x46>
  3655f4:	83 ec 04             	sub    $0x4,%esp
  3655f7:	ff 75 f0             	pushl  -0x10(%ebp)
  3655fa:	ff 75 0c             	pushl  0xc(%ebp)
  3655fd:	ff 75 f4             	pushl  -0xc(%ebp)
  365600:	e8 55 ff ff ff       	call   36555a <blk_writepage>
  365605:	83 c4 10             	add    $0x10,%esp
  365608:	c9                   	leave  
  365609:	c3                   	ret    

0036560a <time>:
  36560a:	55                   	push   %ebp
  36560b:	89 e5                	mov    %esp,%ebp
  36560d:	57                   	push   %edi
  36560e:	56                   	push   %esi
  36560f:	53                   	push   %ebx
  365610:	83 ec 10             	sub    $0x10,%esp
  365613:	b8 01 00 00 00       	mov    $0x1,%eax
  365618:	bb 07 00 00 00       	mov    $0x7,%ebx
  36561d:	b9 10 00 00 00       	mov    $0x10,%ecx
  365622:	8b 55 08             	mov    0x8(%ebp),%edx
  365625:	be 00 00 00 00       	mov    $0x0,%esi
  36562a:	bf 00 00 00 00       	mov    $0x0,%edi
  36562f:	cd 80                	int    $0x80
  365631:	89 45 f0             	mov    %eax,-0x10(%ebp)
  365634:	8b 45 f0             	mov    -0x10(%ebp),%eax
  365637:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36563a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  36563e:	74 0e                	je     36564e <time+0x44>
  365640:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  365644:	7e 08                	jle    36564e <time+0x44>
  365646:	8b 45 08             	mov    0x8(%ebp),%eax
  365649:	8b 55 ec             	mov    -0x14(%ebp),%edx
  36564c:	89 10                	mov    %edx,(%eax)
  36564e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  365651:	83 c4 10             	add    $0x10,%esp
  365654:	5b                   	pop    %ebx
  365655:	5e                   	pop    %esi
  365656:	5f                   	pop    %edi
  365657:	5d                   	pop    %ebp
  365658:	c3                   	ret    

00365659 <memcpy>:
  365659:	55                   	push   %ebp
  36565a:	89 e5                	mov    %esp,%ebp
  36565c:	57                   	push   %edi
  36565d:	56                   	push   %esi
  36565e:	53                   	push   %ebx
  36565f:	8b 45 10             	mov    0x10(%ebp),%eax
  365662:	8b 55 0c             	mov    0xc(%ebp),%edx
  365665:	8b 5d 08             	mov    0x8(%ebp),%ebx
  365668:	89 c1                	mov    %eax,%ecx
  36566a:	89 d6                	mov    %edx,%esi
  36566c:	89 df                	mov    %ebx,%edi
  36566e:	fc                   	cld    
  36566f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  365671:	8b 45 08             	mov    0x8(%ebp),%eax
  365674:	5b                   	pop    %ebx
  365675:	5e                   	pop    %esi
  365676:	5f                   	pop    %edi
  365677:	5d                   	pop    %ebp
  365678:	c3                   	ret    

00365679 <v2_read>:
  365679:	55                   	push   %ebp
  36567a:	89 e5                	mov    %esp,%ebp
  36567c:	83 ec 28             	sub    $0x28,%esp
  36567f:	8b 45 10             	mov    0x10(%ebp),%eax
  365682:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  365688:	85 c0                	test   %eax,%eax
  36568a:	0f 48 c2             	cmovs  %edx,%eax
  36568d:	c1 f8 0a             	sar    $0xa,%eax
  365690:	89 45 f4             	mov    %eax,-0xc(%ebp)
  365693:	8b 45 10             	mov    0x10(%ebp),%eax
  365696:	99                   	cltd   
  365697:	c1 ea 16             	shr    $0x16,%edx
  36569a:	01 d0                	add    %edx,%eax
  36569c:	25 ff 03 00 00       	and    $0x3ff,%eax
  3656a1:	29 d0                	sub    %edx,%eax
  3656a3:	ba 00 04 00 00       	mov    $0x400,%edx
  3656a8:	29 c2                	sub    %eax,%edx
  3656aa:	89 d0                	mov    %edx,%eax
  3656ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3656af:	83 ec 0c             	sub    $0xc,%esp
  3656b2:	68 00 04 00 00       	push   $0x400
  3656b7:	e8 77 60 00 00       	call   36b733 <kalloc>
  3656bc:	83 c4 10             	add    $0x10,%esp
  3656bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3656c2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  3656c6:	75 0a                	jne    3656d2 <v2_read+0x59>
  3656c8:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  3656cd:	e9 8a 01 00 00       	jmp    36585c <v2_read+0x1e3>
  3656d2:	8b 45 08             	mov    0x8(%ebp),%eax
  3656d5:	8b 50 18             	mov    0x18(%eax),%edx
  3656d8:	8b 45 10             	mov    0x10(%ebp),%eax
  3656db:	29 c2                	sub    %eax,%edx
  3656dd:	8b 45 14             	mov    0x14(%ebp),%eax
  3656e0:	39 c2                	cmp    %eax,%edx
  3656e2:	0f 46 c2             	cmovbe %edx,%eax
  3656e5:	89 45 14             	mov    %eax,0x14(%ebp)
  3656e8:	8b 45 14             	mov    0x14(%ebp),%eax
  3656eb:	39 45 f0             	cmp    %eax,-0x10(%ebp)
  3656ee:	0f 46 45 f0          	cmovbe -0x10(%ebp),%eax
  3656f2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3656f5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  3656f9:	74 63                	je     36575e <v2_read+0xe5>
  3656fb:	83 ec 04             	sub    $0x4,%esp
  3656fe:	ff 75 f4             	pushl  -0xc(%ebp)
  365701:	ff 75 e8             	pushl  -0x18(%ebp)
  365704:	ff 75 08             	pushl  0x8(%ebp)
  365707:	e8 6e fe ff ff       	call   36557a <inode_bread>
  36570c:	83 c4 10             	add    $0x10,%esp
  36570f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  365712:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  365716:	79 1c                	jns    365734 <v2_read+0xbb>
  365718:	83 ec 04             	sub    $0x4,%esp
  36571b:	6a 11                	push   $0x11
  36571d:	68 4c df 36 00       	push   $0x36df4c
  365722:	68 58 df 36 00       	push   $0x36df58
  365727:	e8 5c 39 00 00       	call   369088 <printk>
  36572c:	83 c4 10             	add    $0x10,%esp
  36572f:	e9 15 01 00 00       	jmp    365849 <v2_read+0x1d0>
  365734:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  365737:	8b 45 10             	mov    0x10(%ebp),%eax
  36573a:	99                   	cltd   
  36573b:	c1 ea 16             	shr    $0x16,%edx
  36573e:	01 d0                	add    %edx,%eax
  365740:	25 ff 03 00 00       	and    $0x3ff,%eax
  365745:	29 d0                	sub    %edx,%eax
  365747:	89 c2                	mov    %eax,%edx
  365749:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36574c:	01 d0                	add    %edx,%eax
  36574e:	83 ec 04             	sub    $0x4,%esp
  365751:	51                   	push   %ecx
  365752:	50                   	push   %eax
  365753:	ff 75 0c             	pushl  0xc(%ebp)
  365756:	e8 fe fe ff ff       	call   365659 <memcpy>
  36575b:	83 c4 10             	add    $0x10,%esp
  36575e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  365761:	29 45 14             	sub    %eax,0x14(%ebp)
  365764:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  365768:	8b 45 14             	mov    0x14(%ebp),%eax
  36576b:	c1 e8 0a             	shr    $0xa,%eax
  36576e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  365771:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  365778:	eb 6a                	jmp    3657e4 <v2_read+0x16b>
  36577a:	83 ec 04             	sub    $0x4,%esp
  36577d:	ff 75 f4             	pushl  -0xc(%ebp)
  365780:	ff 75 e8             	pushl  -0x18(%ebp)
  365783:	ff 75 08             	pushl  0x8(%ebp)
  365786:	e8 ef fd ff ff       	call   36557a <inode_bread>
  36578b:	83 c4 10             	add    $0x10,%esp
  36578e:	89 45 dc             	mov    %eax,-0x24(%ebp)
  365791:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  365795:	79 1c                	jns    3657b3 <v2_read+0x13a>
  365797:	83 ec 04             	sub    $0x4,%esp
  36579a:	6a 19                	push   $0x19
  36579c:	68 4c df 36 00       	push   $0x36df4c
  3657a1:	68 58 df 36 00       	push   $0x36df58
  3657a6:	e8 dd 38 00 00       	call   369088 <printk>
  3657ab:	83 c4 10             	add    $0x10,%esp
  3657ae:	e9 96 00 00 00       	jmp    365849 <v2_read+0x1d0>
  3657b3:	8b 45 14             	mov    0x14(%ebp),%eax
  3657b6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  3657b9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  3657bc:	01 ca                	add    %ecx,%edx
  3657be:	83 ec 04             	sub    $0x4,%esp
  3657c1:	50                   	push   %eax
  3657c2:	ff 75 e8             	pushl  -0x18(%ebp)
  3657c5:	52                   	push   %edx
  3657c6:	e8 8e fe ff ff       	call   365659 <memcpy>
  3657cb:	83 c4 10             	add    $0x10,%esp
  3657ce:	81 6d 14 00 04 00 00 	subl   $0x400,0x14(%ebp)
  3657d5:	81 45 f0 00 04 00 00 	addl   $0x400,-0x10(%ebp)
  3657dc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3657e0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  3657e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3657e7:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  3657ea:	72 8e                	jb     36577a <v2_read+0x101>
  3657ec:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  3657f0:	74 57                	je     365849 <v2_read+0x1d0>
  3657f2:	83 ec 04             	sub    $0x4,%esp
  3657f5:	ff 75 f4             	pushl  -0xc(%ebp)
  3657f8:	ff 75 e8             	pushl  -0x18(%ebp)
  3657fb:	ff 75 08             	pushl  0x8(%ebp)
  3657fe:	e8 77 fd ff ff       	call   36557a <inode_bread>
  365803:	83 c4 10             	add    $0x10,%esp
  365806:	89 45 d8             	mov    %eax,-0x28(%ebp)
  365809:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  36580d:	79 19                	jns    365828 <v2_read+0x1af>
  36580f:	83 ec 04             	sub    $0x4,%esp
  365812:	6a 21                	push   $0x21
  365814:	68 4c df 36 00       	push   $0x36df4c
  365819:	68 58 df 36 00       	push   $0x36df58
  36581e:	e8 65 38 00 00       	call   369088 <printk>
  365823:	83 c4 10             	add    $0x10,%esp
  365826:	eb 21                	jmp    365849 <v2_read+0x1d0>
  365828:	8b 45 14             	mov    0x14(%ebp),%eax
  36582b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  36582e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  365831:	01 ca                	add    %ecx,%edx
  365833:	83 ec 04             	sub    $0x4,%esp
  365836:	50                   	push   %eax
  365837:	ff 75 e8             	pushl  -0x18(%ebp)
  36583a:	52                   	push   %edx
  36583b:	e8 19 fe ff ff       	call   365659 <memcpy>
  365840:	83 c4 10             	add    $0x10,%esp
  365843:	8b 45 14             	mov    0x14(%ebp),%eax
  365846:	01 45 f0             	add    %eax,-0x10(%ebp)
  365849:	83 ec 08             	sub    $0x8,%esp
  36584c:	6a 00                	push   $0x0
  36584e:	ff 75 e8             	pushl  -0x18(%ebp)
  365851:	e8 49 60 00 00       	call   36b89f <kfree_s>
  365856:	83 c4 10             	add    $0x10,%esp
  365859:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36585c:	c9                   	leave  
  36585d:	c3                   	ret    

0036585e <v2_write>:
  36585e:	55                   	push   %ebp
  36585f:	89 e5                	mov    %esp,%ebp
  365861:	83 ec 38             	sub    $0x38,%esp
  365864:	8b 45 10             	mov    0x10(%ebp),%eax
  365867:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  36586d:	85 c0                	test   %eax,%eax
  36586f:	0f 48 c2             	cmovs  %edx,%eax
  365872:	c1 f8 0a             	sar    $0xa,%eax
  365875:	89 45 f4             	mov    %eax,-0xc(%ebp)
  365878:	8b 45 10             	mov    0x10(%ebp),%eax
  36587b:	99                   	cltd   
  36587c:	c1 ea 16             	shr    $0x16,%edx
  36587f:	01 d0                	add    %edx,%eax
  365881:	25 ff 03 00 00       	and    $0x3ff,%eax
  365886:	29 d0                	sub    %edx,%eax
  365888:	ba 00 04 00 00       	mov    $0x400,%edx
  36588d:	29 c2                	sub    %eax,%edx
  36588f:	89 d0                	mov    %edx,%eax
  365891:	89 45 f0             	mov    %eax,-0x10(%ebp)
  365894:	83 ec 0c             	sub    $0xc,%esp
  365897:	68 00 04 00 00       	push   $0x400
  36589c:	e8 92 5e 00 00       	call   36b733 <kalloc>
  3658a1:	83 c4 10             	add    $0x10,%esp
  3658a4:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3658a7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  3658ab:	75 0a                	jne    3658b7 <v2_write+0x59>
  3658ad:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  3658b2:	e9 40 02 00 00       	jmp    365af7 <v2_write+0x299>
  3658b7:	8b 45 14             	mov    0x14(%ebp),%eax
  3658ba:	39 45 f0             	cmp    %eax,-0x10(%ebp)
  3658bd:	0f 46 45 f0          	cmovbe -0x10(%ebp),%eax
  3658c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3658c4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  3658c8:	0f 84 9c 00 00 00    	je     36596a <v2_write+0x10c>
  3658ce:	83 ec 04             	sub    $0x4,%esp
  3658d1:	ff 75 f4             	pushl  -0xc(%ebp)
  3658d4:	ff 75 e8             	pushl  -0x18(%ebp)
  3658d7:	ff 75 08             	pushl  0x8(%ebp)
  3658da:	e8 9b fc ff ff       	call   36557a <inode_bread>
  3658df:	83 c4 10             	add    $0x10,%esp
  3658e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3658e5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  3658e9:	79 1c                	jns    365907 <v2_write+0xa9>
  3658eb:	83 ec 04             	sub    $0x4,%esp
  3658ee:	6a 39                	push   $0x39
  3658f0:	68 4c df 36 00       	push   $0x36df4c
  3658f5:	68 58 df 36 00       	push   $0x36df58
  3658fa:	e8 89 37 00 00       	call   369088 <printk>
  3658ff:	83 c4 10             	add    $0x10,%esp
  365902:	e9 dd 01 00 00       	jmp    365ae4 <v2_write+0x286>
  365907:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  36590a:	8b 45 10             	mov    0x10(%ebp),%eax
  36590d:	99                   	cltd   
  36590e:	c1 ea 16             	shr    $0x16,%edx
  365911:	01 d0                	add    %edx,%eax
  365913:	25 ff 03 00 00       	and    $0x3ff,%eax
  365918:	29 d0                	sub    %edx,%eax
  36591a:	89 c2                	mov    %eax,%edx
  36591c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36591f:	01 d0                	add    %edx,%eax
  365921:	83 ec 04             	sub    $0x4,%esp
  365924:	51                   	push   %ecx
  365925:	ff 75 e8             	pushl  -0x18(%ebp)
  365928:	50                   	push   %eax
  365929:	e8 2b fd ff ff       	call   365659 <memcpy>
  36592e:	83 c4 10             	add    $0x10,%esp
  365931:	83 ec 04             	sub    $0x4,%esp
  365934:	ff 75 f4             	pushl  -0xc(%ebp)
  365937:	ff 75 e8             	pushl  -0x18(%ebp)
  36593a:	ff 75 08             	pushl  0x8(%ebp)
  36593d:	e8 80 fc ff ff       	call   3655c2 <inode_bwrite>
  365942:	83 c4 10             	add    $0x10,%esp
  365945:	89 45 e0             	mov    %eax,-0x20(%ebp)
  365948:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  36594c:	79 1c                	jns    36596a <v2_write+0x10c>
  36594e:	83 ec 04             	sub    $0x4,%esp
  365951:	6a 3b                	push   $0x3b
  365953:	68 4c df 36 00       	push   $0x36df4c
  365958:	68 88 df 36 00       	push   $0x36df88
  36595d:	e8 26 37 00 00       	call   369088 <printk>
  365962:	83 c4 10             	add    $0x10,%esp
  365965:	e9 7a 01 00 00       	jmp    365ae4 <v2_write+0x286>
  36596a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36596d:	29 45 14             	sub    %eax,0x14(%ebp)
  365970:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  365974:	8b 45 14             	mov    0x14(%ebp),%eax
  365977:	c1 e8 0a             	shr    $0xa,%eax
  36597a:	89 45 dc             	mov    %eax,-0x24(%ebp)
  36597d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  365984:	eb 6b                	jmp    3659f1 <v2_write+0x193>
  365986:	8b 55 0c             	mov    0xc(%ebp),%edx
  365989:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36598c:	01 d0                	add    %edx,%eax
  36598e:	83 ec 04             	sub    $0x4,%esp
  365991:	68 00 04 00 00       	push   $0x400
  365996:	50                   	push   %eax
  365997:	ff 75 e8             	pushl  -0x18(%ebp)
  36599a:	e8 ba fc ff ff       	call   365659 <memcpy>
  36599f:	83 c4 10             	add    $0x10,%esp
  3659a2:	83 ec 04             	sub    $0x4,%esp
  3659a5:	ff 75 f4             	pushl  -0xc(%ebp)
  3659a8:	ff 75 e8             	pushl  -0x18(%ebp)
  3659ab:	ff 75 08             	pushl  0x8(%ebp)
  3659ae:	e8 0f fc ff ff       	call   3655c2 <inode_bwrite>
  3659b3:	83 c4 10             	add    $0x10,%esp
  3659b6:	89 45 d8             	mov    %eax,-0x28(%ebp)
  3659b9:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  3659bd:	79 1c                	jns    3659db <v2_write+0x17d>
  3659bf:	83 ec 04             	sub    $0x4,%esp
  3659c2:	6a 43                	push   $0x43
  3659c4:	68 4c df 36 00       	push   $0x36df4c
  3659c9:	68 88 df 36 00       	push   $0x36df88
  3659ce:	e8 b5 36 00 00       	call   369088 <printk>
  3659d3:	83 c4 10             	add    $0x10,%esp
  3659d6:	e9 09 01 00 00       	jmp    365ae4 <v2_write+0x286>
  3659db:	81 6d 14 00 04 00 00 	subl   $0x400,0x14(%ebp)
  3659e2:	81 45 f0 00 04 00 00 	addl   $0x400,-0x10(%ebp)
  3659e9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3659ed:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  3659f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3659f4:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  3659f7:	72 8d                	jb     365986 <v2_write+0x128>
  3659f9:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  3659fd:	0f 84 92 00 00 00    	je     365a95 <v2_write+0x237>
  365a03:	83 ec 04             	sub    $0x4,%esp
  365a06:	ff 75 f4             	pushl  -0xc(%ebp)
  365a09:	ff 75 e8             	pushl  -0x18(%ebp)
  365a0c:	ff 75 08             	pushl  0x8(%ebp)
  365a0f:	e8 66 fb ff ff       	call   36557a <inode_bread>
  365a14:	83 c4 10             	add    $0x10,%esp
  365a17:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  365a1a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  365a1e:	79 1c                	jns    365a3c <v2_write+0x1de>
  365a20:	83 ec 04             	sub    $0x4,%esp
  365a23:	6a 4a                	push   $0x4a
  365a25:	68 4c df 36 00       	push   $0x36df4c
  365a2a:	68 58 df 36 00       	push   $0x36df58
  365a2f:	e8 54 36 00 00       	call   369088 <printk>
  365a34:	83 c4 10             	add    $0x10,%esp
  365a37:	e9 a8 00 00 00       	jmp    365ae4 <v2_write+0x286>
  365a3c:	8b 45 14             	mov    0x14(%ebp),%eax
  365a3f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  365a42:	8b 55 f0             	mov    -0x10(%ebp),%edx
  365a45:	01 ca                	add    %ecx,%edx
  365a47:	83 ec 04             	sub    $0x4,%esp
  365a4a:	50                   	push   %eax
  365a4b:	52                   	push   %edx
  365a4c:	ff 75 e8             	pushl  -0x18(%ebp)
  365a4f:	e8 05 fc ff ff       	call   365659 <memcpy>
  365a54:	83 c4 10             	add    $0x10,%esp
  365a57:	83 ec 04             	sub    $0x4,%esp
  365a5a:	ff 75 f4             	pushl  -0xc(%ebp)
  365a5d:	ff 75 e8             	pushl  -0x18(%ebp)
  365a60:	ff 75 08             	pushl  0x8(%ebp)
  365a63:	e8 5a fb ff ff       	call   3655c2 <inode_bwrite>
  365a68:	83 c4 10             	add    $0x10,%esp
  365a6b:	89 45 d0             	mov    %eax,-0x30(%ebp)
  365a6e:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  365a72:	79 19                	jns    365a8d <v2_write+0x22f>
  365a74:	83 ec 04             	sub    $0x4,%esp
  365a77:	6a 4c                	push   $0x4c
  365a79:	68 4c df 36 00       	push   $0x36df4c
  365a7e:	68 88 df 36 00       	push   $0x36df88
  365a83:	e8 00 36 00 00       	call   369088 <printk>
  365a88:	83 c4 10             	add    $0x10,%esp
  365a8b:	eb 57                	jmp    365ae4 <v2_write+0x286>
  365a8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  365a90:	01 c0                	add    %eax,%eax
  365a92:	89 45 f0             	mov    %eax,-0x10(%ebp)
  365a95:	8b 55 10             	mov    0x10(%ebp),%edx
  365a98:	8b 45 f0             	mov    -0x10(%ebp),%eax
  365a9b:	01 c2                	add    %eax,%edx
  365a9d:	8b 45 08             	mov    0x8(%ebp),%eax
  365aa0:	8b 40 18             	mov    0x18(%eax),%eax
  365aa3:	39 c2                	cmp    %eax,%edx
  365aa5:	76 0e                	jbe    365ab5 <v2_write+0x257>
  365aa7:	8b 55 10             	mov    0x10(%ebp),%edx
  365aaa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  365aad:	01 c2                	add    %eax,%edx
  365aaf:	8b 45 08             	mov    0x8(%ebp),%eax
  365ab2:	89 50 18             	mov    %edx,0x18(%eax)
  365ab5:	83 ec 0c             	sub    $0xc,%esp
  365ab8:	6a 00                	push   $0x0
  365aba:	e8 4b fb ff ff       	call   36560a <time>
  365abf:	83 c4 10             	add    $0x10,%esp
  365ac2:	89 c2                	mov    %eax,%edx
  365ac4:	8b 45 08             	mov    0x8(%ebp),%eax
  365ac7:	89 50 30             	mov    %edx,0x30(%eax)
  365aca:	8b 45 08             	mov    0x8(%ebp),%eax
  365acd:	8b 50 30             	mov    0x30(%eax),%edx
  365ad0:	8b 45 08             	mov    0x8(%ebp),%eax
  365ad3:	89 50 38             	mov    %edx,0x38(%eax)
  365ad6:	83 ec 0c             	sub    $0xc,%esp
  365ad9:	ff 75 08             	pushl  0x8(%ebp)
  365adc:	e8 93 1d 00 00       	call   367874 <minix_sync_inode>
  365ae1:	83 c4 10             	add    $0x10,%esp
  365ae4:	83 ec 08             	sub    $0x8,%esp
  365ae7:	6a 00                	push   $0x0
  365ae9:	ff 75 e8             	pushl  -0x18(%ebp)
  365aec:	e8 ae 5d 00 00       	call   36b89f <kfree_s>
  365af1:	83 c4 10             	add    $0x10,%esp
  365af4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  365af7:	c9                   	leave  
  365af8:	c3                   	ret    

00365af9 <minix_write>:
  365af9:	55                   	push   %ebp
  365afa:	89 e5                	mov    %esp,%ebp
  365afc:	57                   	push   %edi
  365afd:	56                   	push   %esi
  365afe:	53                   	push   %ebx
  365aff:	83 ec 1c             	sub    $0x1c,%esp
  365b02:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  365b07:	8b 80 f0 00 00 00    	mov    0xf0(%eax),%eax
  365b0d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  365b10:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  365b13:	8b 50 04             	mov    0x4(%eax),%edx
  365b16:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  365b19:	8b 40 08             	mov    0x8(%eax),%eax
  365b1c:	ff 75 10             	pushl  0x10(%ebp)
  365b1f:	52                   	push   %edx
  365b20:	ff 75 0c             	pushl  0xc(%ebp)
  365b23:	50                   	push   %eax
  365b24:	e8 35 fd ff ff       	call   36585e <v2_write>
  365b29:	83 c4 10             	add    $0x10,%esp
  365b2c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  365b2f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  365b33:	74 15                	je     365b4a <minix_write+0x51>
  365b35:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  365b38:	8b 40 04             	mov    0x4(%eax),%eax
  365b3b:	89 c2                	mov    %eax,%edx
  365b3d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  365b40:	01 d0                	add    %edx,%eax
  365b42:	89 c2                	mov    %eax,%edx
  365b44:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  365b47:	89 50 04             	mov    %edx,0x4(%eax)
  365b4a:	b8 02 00 00 00       	mov    $0x2,%eax
  365b4f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  365b52:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  365b55:	ba 00 00 00 00       	mov    $0x0,%edx
  365b5a:	be 00 00 00 00       	mov    $0x0,%esi
  365b5f:	bf 00 00 00 00       	mov    $0x0,%edi
  365b64:	cd 80                	int    $0x80
  365b66:	89 45 dc             	mov    %eax,-0x24(%ebp)
  365b69:	8d 65 f4             	lea    -0xc(%ebp),%esp
  365b6c:	5b                   	pop    %ebx
  365b6d:	5e                   	pop    %esi
  365b6e:	5f                   	pop    %edi
  365b6f:	5d                   	pop    %ebp
  365b70:	c3                   	ret    

00365b71 <minix_read>:
  365b71:	55                   	push   %ebp
  365b72:	89 e5                	mov    %esp,%ebp
  365b74:	57                   	push   %edi
  365b75:	56                   	push   %esi
  365b76:	53                   	push   %ebx
  365b77:	83 ec 1c             	sub    $0x1c,%esp
  365b7a:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  365b7f:	8b 80 f0 00 00 00    	mov    0xf0(%eax),%eax
  365b85:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  365b88:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  365b8b:	8b 50 04             	mov    0x4(%eax),%edx
  365b8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  365b91:	8b 40 08             	mov    0x8(%eax),%eax
  365b94:	ff 75 10             	pushl  0x10(%ebp)
  365b97:	52                   	push   %edx
  365b98:	ff 75 0c             	pushl  0xc(%ebp)
  365b9b:	50                   	push   %eax
  365b9c:	e8 d8 fa ff ff       	call   365679 <v2_read>
  365ba1:	83 c4 10             	add    $0x10,%esp
  365ba4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  365ba7:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  365bab:	74 15                	je     365bc2 <minix_read+0x51>
  365bad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  365bb0:	8b 40 04             	mov    0x4(%eax),%eax
  365bb3:	89 c2                	mov    %eax,%edx
  365bb5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  365bb8:	01 d0                	add    %edx,%eax
  365bba:	89 c2                	mov    %eax,%edx
  365bbc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  365bbf:	89 50 04             	mov    %edx,0x4(%eax)
  365bc2:	b8 02 00 00 00       	mov    $0x2,%eax
  365bc7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  365bca:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  365bcd:	ba 00 00 00 00       	mov    $0x0,%edx
  365bd2:	be 00 00 00 00       	mov    $0x0,%esi
  365bd7:	bf 00 00 00 00       	mov    $0x0,%edi
  365bdc:	cd 80                	int    $0x80
  365bde:	89 45 dc             	mov    %eax,-0x24(%ebp)
  365be1:	8d 65 f4             	lea    -0xc(%ebp),%esp
  365be4:	5b                   	pop    %ebx
  365be5:	5e                   	pop    %esi
  365be6:	5f                   	pop    %edi
  365be7:	5d                   	pop    %ebp
  365be8:	c3                   	ret    

00365be9 <time>:
  365be9:	55                   	push   %ebp
  365bea:	89 e5                	mov    %esp,%ebp
  365bec:	57                   	push   %edi
  365bed:	56                   	push   %esi
  365bee:	53                   	push   %ebx
  365bef:	83 ec 10             	sub    $0x10,%esp
  365bf2:	b8 01 00 00 00       	mov    $0x1,%eax
  365bf7:	bb 07 00 00 00       	mov    $0x7,%ebx
  365bfc:	b9 10 00 00 00       	mov    $0x10,%ecx
  365c01:	8b 55 08             	mov    0x8(%ebp),%edx
  365c04:	be 00 00 00 00       	mov    $0x0,%esi
  365c09:	bf 00 00 00 00       	mov    $0x0,%edi
  365c0e:	cd 80                	int    $0x80
  365c10:	89 45 f0             	mov    %eax,-0x10(%ebp)
  365c13:	8b 45 f0             	mov    -0x10(%ebp),%eax
  365c16:	89 45 ec             	mov    %eax,-0x14(%ebp)
  365c19:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  365c1d:	74 0e                	je     365c2d <time+0x44>
  365c1f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  365c23:	7e 08                	jle    365c2d <time+0x44>
  365c25:	8b 45 08             	mov    0x8(%ebp),%eax
  365c28:	8b 55 ec             	mov    -0x14(%ebp),%edx
  365c2b:	89 10                	mov    %edx,(%eax)
  365c2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  365c30:	83 c4 10             	add    $0x10,%esp
  365c33:	5b                   	pop    %ebx
  365c34:	5e                   	pop    %esi
  365c35:	5f                   	pop    %edi
  365c36:	5d                   	pop    %ebp
  365c37:	c3                   	ret    

00365c38 <sb_info>:
  365c38:	55                   	push   %ebp
  365c39:	89 e5                	mov    %esp,%ebp
  365c3b:	8b 45 08             	mov    0x8(%ebp),%eax
  365c3e:	83 c0 70             	add    $0x70,%eax
  365c41:	5d                   	pop    %ebp
  365c42:	c3                   	ret    

00365c43 <inode_info>:
  365c43:	55                   	push   %ebp
  365c44:	89 e5                	mov    %esp,%ebp
  365c46:	8b 45 08             	mov    0x8(%ebp),%eax
  365c49:	83 c0 60             	add    $0x60,%eax
  365c4c:	5d                   	pop    %ebp
  365c4d:	c3                   	ret    

00365c4e <inode_sb>:
  365c4e:	55                   	push   %ebp
  365c4f:	89 e5                	mov    %esp,%ebp
  365c51:	8b 45 08             	mov    0x8(%ebp),%eax
  365c54:	8b 40 1c             	mov    0x1c(%eax),%eax
  365c57:	5d                   	pop    %ebp
  365c58:	c3                   	ret    

00365c59 <strcpy>:
  365c59:	55                   	push   %ebp
  365c5a:	89 e5                	mov    %esp,%ebp
  365c5c:	57                   	push   %edi
  365c5d:	56                   	push   %esi
  365c5e:	8b 55 0c             	mov    0xc(%ebp),%edx
  365c61:	8b 4d 08             	mov    0x8(%ebp),%ecx
  365c64:	89 d6                	mov    %edx,%esi
  365c66:	89 cf                	mov    %ecx,%edi
  365c68:	fc                   	cld    
  365c69:	ac                   	lods   %ds:(%esi),%al
  365c6a:	aa                   	stos   %al,%es:(%edi)
  365c6b:	84 c0                	test   %al,%al
  365c6d:	75 fa                	jne    365c69 <strcpy+0x10>
  365c6f:	8b 45 08             	mov    0x8(%ebp),%eax
  365c72:	5e                   	pop    %esi
  365c73:	5f                   	pop    %edi
  365c74:	5d                   	pop    %ebp
  365c75:	c3                   	ret    

00365c76 <strcmp>:
  365c76:	55                   	push   %ebp
  365c77:	89 e5                	mov    %esp,%ebp
  365c79:	57                   	push   %edi
  365c7a:	56                   	push   %esi
  365c7b:	8b 45 08             	mov    0x8(%ebp),%eax
  365c7e:	8b 55 0c             	mov    0xc(%ebp),%edx
  365c81:	89 c7                	mov    %eax,%edi
  365c83:	89 d6                	mov    %edx,%esi
  365c85:	fc                   	cld    
  365c86:	ac                   	lods   %ds:(%esi),%al
  365c87:	ae                   	scas   %es:(%edi),%al
  365c88:	75 08                	jne    365c92 <strcmp+0x1c>
  365c8a:	84 c0                	test   %al,%al
  365c8c:	75 f8                	jne    365c86 <strcmp+0x10>
  365c8e:	31 c0                	xor    %eax,%eax
  365c90:	eb 09                	jmp    365c9b <strcmp+0x25>
  365c92:	b8 01 00 00 00       	mov    $0x1,%eax
  365c97:	7c 02                	jl     365c9b <strcmp+0x25>
  365c99:	f7 d8                	neg    %eax
  365c9b:	5e                   	pop    %esi
  365c9c:	5f                   	pop    %edi
  365c9d:	5d                   	pop    %ebp
  365c9e:	c3                   	ret    

00365c9f <memcpy>:
  365c9f:	55                   	push   %ebp
  365ca0:	89 e5                	mov    %esp,%ebp
  365ca2:	57                   	push   %edi
  365ca3:	56                   	push   %esi
  365ca4:	53                   	push   %ebx
  365ca5:	8b 45 10             	mov    0x10(%ebp),%eax
  365ca8:	8b 55 0c             	mov    0xc(%ebp),%edx
  365cab:	8b 5d 08             	mov    0x8(%ebp),%ebx
  365cae:	89 c1                	mov    %eax,%ecx
  365cb0:	89 d6                	mov    %edx,%esi
  365cb2:	89 df                	mov    %ebx,%edi
  365cb4:	fc                   	cld    
  365cb5:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  365cb7:	8b 45 08             	mov    0x8(%ebp),%eax
  365cba:	5b                   	pop    %ebx
  365cbb:	5e                   	pop    %esi
  365cbc:	5f                   	pop    %edi
  365cbd:	5d                   	pop    %ebp
  365cbe:	c3                   	ret    

00365cbf <memcmp>:
  365cbf:	55                   	push   %ebp
  365cc0:	89 e5                	mov    %esp,%ebp
  365cc2:	57                   	push   %edi
  365cc3:	56                   	push   %esi
  365cc4:	53                   	push   %ebx
  365cc5:	b8 00 00 00 00       	mov    $0x0,%eax
  365cca:	8b 55 08             	mov    0x8(%ebp),%edx
  365ccd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  365cd0:	8b 4d 10             	mov    0x10(%ebp),%ecx
  365cd3:	89 d7                	mov    %edx,%edi
  365cd5:	89 de                	mov    %ebx,%esi
  365cd7:	fc                   	cld    
  365cd8:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
  365cda:	74 09                	je     365ce5 <memcmp+0x26>
  365cdc:	b8 01 00 00 00       	mov    $0x1,%eax
  365ce1:	7c 02                	jl     365ce5 <memcmp+0x26>
  365ce3:	f7 d8                	neg    %eax
  365ce5:	5b                   	pop    %ebx
  365ce6:	5e                   	pop    %esi
  365ce7:	5f                   	pop    %edi
  365ce8:	5d                   	pop    %ebp
  365ce9:	c3                   	ret    

00365cea <memset>:
  365cea:	55                   	push   %ebp
  365ceb:	89 e5                	mov    %esp,%ebp
  365ced:	57                   	push   %edi
  365cee:	8b 45 0c             	mov    0xc(%ebp),%eax
  365cf1:	8b 55 08             	mov    0x8(%ebp),%edx
  365cf4:	8b 4d 10             	mov    0x10(%ebp),%ecx
  365cf7:	89 d7                	mov    %edx,%edi
  365cf9:	fc                   	cld    
  365cfa:	f3 aa                	rep stos %al,%es:(%edi)
  365cfc:	8b 45 08             	mov    0x8(%ebp),%eax
  365cff:	5f                   	pop    %edi
  365d00:	5d                   	pop    %ebp
  365d01:	c3                   	ret    

00365d02 <namecompare>:
  365d02:	55                   	push   %ebp
  365d03:	89 e5                	mov    %esp,%ebp
  365d05:	8b 45 08             	mov    0x8(%ebp),%eax
  365d08:	3b 45 0c             	cmp    0xc(%ebp),%eax
  365d0b:	7d 16                	jge    365d23 <namecompare+0x21>
  365d0d:	8b 55 08             	mov    0x8(%ebp),%edx
  365d10:	8b 45 14             	mov    0x14(%ebp),%eax
  365d13:	01 d0                	add    %edx,%eax
  365d15:	0f b6 00             	movzbl (%eax),%eax
  365d18:	84 c0                	test   %al,%al
  365d1a:	74 07                	je     365d23 <namecompare+0x21>
  365d1c:	b8 00 00 00 00       	mov    $0x0,%eax
  365d21:	eb 19                	jmp    365d3c <namecompare+0x3a>
  365d23:	ff 75 08             	pushl  0x8(%ebp)
  365d26:	ff 75 14             	pushl  0x14(%ebp)
  365d29:	ff 75 10             	pushl  0x10(%ebp)
  365d2c:	e8 8e ff ff ff       	call   365cbf <memcmp>
  365d31:	83 c4 0c             	add    $0xc,%esp
  365d34:	85 c0                	test   %eax,%eax
  365d36:	0f 94 c0             	sete   %al
  365d39:	0f b6 c0             	movzbl %al,%eax
  365d3c:	c9                   	leave  
  365d3d:	c3                   	ret    

00365d3e <minix_next_entry>:
  365d3e:	55                   	push   %ebp
  365d3f:	89 e5                	mov    %esp,%ebp
  365d41:	8b 45 0c             	mov    0xc(%ebp),%eax
  365d44:	0f b7 40 26          	movzwl 0x26(%eax),%eax
  365d48:	0f b7 d0             	movzwl %ax,%edx
  365d4b:	8b 45 08             	mov    0x8(%ebp),%eax
  365d4e:	01 d0                	add    %edx,%eax
  365d50:	5d                   	pop    %ebp
  365d51:	c3                   	ret    

00365d52 <permission>:
  365d52:	55                   	push   %ebp
  365d53:	89 e5                	mov    %esp,%ebp
  365d55:	83 ec 10             	sub    $0x10,%esp
  365d58:	8b 45 08             	mov    0x8(%ebp),%eax
  365d5b:	8b 00                	mov    (%eax),%eax
  365d5d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  365d60:	8b 45 08             	mov    0x8(%ebp),%eax
  365d63:	8b 40 14             	mov    0x14(%eax),%eax
  365d66:	85 c0                	test   %eax,%eax
  365d68:	74 11                	je     365d7b <permission+0x29>
  365d6a:	8b 45 08             	mov    0x8(%ebp),%eax
  365d6d:	8b 40 48             	mov    0x48(%eax),%eax
  365d70:	85 c0                	test   %eax,%eax
  365d72:	75 07                	jne    365d7b <permission+0x29>
  365d74:	b8 00 00 00 00       	mov    $0x0,%eax
  365d79:	eb 1e                	jmp    365d99 <permission+0x47>
  365d7b:	c1 6d fc 06          	shrl   $0x6,-0x4(%ebp)
  365d7f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  365d82:	23 45 0c             	and    0xc(%ebp),%eax
  365d85:	83 e0 07             	and    $0x7,%eax
  365d88:	3b 45 0c             	cmp    0xc(%ebp),%eax
  365d8b:	75 07                	jne    365d94 <permission+0x42>
  365d8d:	b8 01 00 00 00       	mov    $0x1,%eax
  365d92:	eb 05                	jmp    365d99 <permission+0x47>
  365d94:	b8 00 00 00 00       	mov    $0x0,%eax
  365d99:	c9                   	leave  
  365d9a:	c3                   	ret    

00365d9b <minix_find_entry>:
  365d9b:	55                   	push   %ebp
  365d9c:	89 e5                	mov    %esp,%ebp
  365d9e:	83 ec 28             	sub    $0x28,%esp
  365da1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  365da8:	ff 75 08             	pushl  0x8(%ebp)
  365dab:	e8 9e fe ff ff       	call   365c4e <inode_sb>
  365db0:	83 c4 04             	add    $0x4,%esp
  365db3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  365db6:	ff 75 e8             	pushl  -0x18(%ebp)
  365db9:	e8 7a fe ff ff       	call   365c38 <sb_info>
  365dbe:	83 c4 04             	add    $0x4,%esp
  365dc1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  365dc4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  365dc7:	8b 40 1c             	mov    0x1c(%eax),%eax
  365dca:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  365dcd:	0f b7 52 26          	movzwl 0x26(%edx),%edx
  365dd1:	0f b7 ca             	movzwl %dx,%ecx
  365dd4:	ba 00 00 00 00       	mov    $0x0,%edx
  365dd9:	f7 f1                	div    %ecx
  365ddb:	89 45 e0             	mov    %eax,-0x20(%ebp)
  365dde:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  365de2:	75 0a                	jne    365dee <minix_find_entry+0x53>
  365de4:	b8 00 00 00 00       	mov    $0x0,%eax
  365de9:	e9 71 01 00 00       	jmp    365f5f <minix_find_entry+0x1c4>
  365dee:	8b 45 e8             	mov    -0x18(%ebp),%eax
  365df1:	8b 40 1c             	mov    0x1c(%eax),%eax
  365df4:	83 ec 0c             	sub    $0xc,%esp
  365df7:	50                   	push   %eax
  365df8:	e8 36 59 00 00       	call   36b733 <kalloc>
  365dfd:	83 c4 10             	add    $0x10,%esp
  365e00:	89 45 dc             	mov    %eax,-0x24(%ebp)
  365e03:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  365e07:	75 0a                	jne    365e13 <minix_find_entry+0x78>
  365e09:	b8 00 00 00 00       	mov    $0x0,%eax
  365e0e:	e9 4c 01 00 00       	jmp    365f5f <minix_find_entry+0x1c4>
  365e13:	8b 45 08             	mov    0x8(%ebp),%eax
  365e16:	8b 40 18             	mov    0x18(%eax),%eax
  365e19:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  365e1c:	0f b7 52 26          	movzwl 0x26(%edx),%edx
  365e20:	0f b7 ca             	movzwl %dx,%ecx
  365e23:	ba 00 00 00 00       	mov    $0x0,%edx
  365e28:	f7 f1                	div    %ecx
  365e2a:	89 45 d8             	mov    %eax,-0x28(%ebp)
  365e2d:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
  365e31:	75 33                	jne    365e66 <minix_find_entry+0xcb>
  365e33:	8b 45 0c             	mov    0xc(%ebp),%eax
  365e36:	0f b6 00             	movzbl (%eax),%eax
  365e39:	3c 2e                	cmp    $0x2e,%al
  365e3b:	75 29                	jne    365e66 <minix_find_entry+0xcb>
  365e3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  365e40:	83 c0 01             	add    $0x1,%eax
  365e43:	0f b6 00             	movzbl (%eax),%eax
  365e46:	3c 2e                	cmp    $0x2e,%al
  365e48:	75 1c                	jne    365e66 <minix_find_entry+0xcb>
  365e4a:	83 ec 04             	sub    $0x4,%esp
  365e4d:	6a 33                	push   $0x33
  365e4f:	68 b8 df 36 00       	push   $0x36dfb8
  365e54:	68 c8 df 36 00       	push   $0x36dfc8
  365e59:	e8 2a 32 00 00       	call   369088 <printk>
  365e5e:	83 c4 10             	add    $0x10,%esp
  365e61:	e9 e4 00 00 00       	jmp    365f4a <minix_find_entry+0x1af>
  365e66:	83 ec 04             	sub    $0x4,%esp
  365e69:	6a 00                	push   $0x0
  365e6b:	ff 75 dc             	pushl  -0x24(%ebp)
  365e6e:	ff 75 08             	pushl  0x8(%ebp)
  365e71:	e8 04 f7 ff ff       	call   36557a <inode_bread>
  365e76:	83 c4 10             	add    $0x10,%esp
  365e79:	89 45 ec             	mov    %eax,-0x14(%ebp)
  365e7c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  365e80:	74 05                	je     365e87 <minix_find_entry+0xec>
  365e82:	e9 c3 00 00 00       	jmp    365f4a <minix_find_entry+0x1af>
  365e87:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  365e8e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  365e91:	89 45 f0             	mov    %eax,-0x10(%ebp)
  365e94:	e9 a5 00 00 00       	jmp    365f3e <minix_find_entry+0x1a3>
  365e99:	8b 45 e8             	mov    -0x18(%ebp),%eax
  365e9c:	8b 50 1c             	mov    0x1c(%eax),%edx
  365e9f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  365ea2:	01 d0                	add    %edx,%eax
  365ea4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  365ea7:	77 34                	ja     365edd <minix_find_entry+0x142>
  365ea9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  365eac:	ba 00 00 00 00       	mov    $0x0,%edx
  365eb1:	f7 75 e0             	divl   -0x20(%ebp)
  365eb4:	83 ec 04             	sub    $0x4,%esp
  365eb7:	50                   	push   %eax
  365eb8:	ff 75 dc             	pushl  -0x24(%ebp)
  365ebb:	ff 75 08             	pushl  0x8(%ebp)
  365ebe:	e8 b7 f6 ff ff       	call   36557a <inode_bread>
  365ec3:	83 c4 10             	add    $0x10,%esp
  365ec6:	85 c0                	test   %eax,%eax
  365ec8:	74 0d                	je     365ed7 <minix_find_entry+0x13c>
  365eca:	8b 55 f4             	mov    -0xc(%ebp),%edx
  365ecd:	8b 45 e0             	mov    -0x20(%ebp),%eax
  365ed0:	01 d0                	add    %edx,%eax
  365ed2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  365ed5:	eb 67                	jmp    365f3e <minix_find_entry+0x1a3>
  365ed7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  365eda:	89 45 f0             	mov    %eax,-0x10(%ebp)
  365edd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  365ee0:	8d 50 02             	lea    0x2(%eax),%edx
  365ee3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  365ee6:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  365eea:	0f b7 c0             	movzwl %ax,%eax
  365eed:	52                   	push   %edx
  365eee:	ff 75 0c             	pushl  0xc(%ebp)
  365ef1:	50                   	push   %eax
  365ef2:	ff 75 10             	pushl  0x10(%ebp)
  365ef5:	e8 08 fe ff ff       	call   365d02 <namecompare>
  365efa:	83 c4 10             	add    $0x10,%esp
  365efd:	85 c0                	test   %eax,%eax
  365eff:	74 25                	je     365f26 <minix_find_entry+0x18b>
  365f01:	8b 45 14             	mov    0x14(%ebp),%eax
  365f04:	8b 55 f0             	mov    -0x10(%ebp),%edx
  365f07:	89 10                	mov    %edx,(%eax)
  365f09:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
  365f0d:	74 12                	je     365f21 <minix_find_entry+0x186>
  365f0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  365f12:	ba 00 00 00 00       	mov    $0x0,%edx
  365f17:	f7 75 e0             	divl   -0x20(%ebp)
  365f1a:	89 c2                	mov    %eax,%edx
  365f1c:	8b 45 18             	mov    0x18(%ebp),%eax
  365f1f:	89 10                	mov    %edx,(%eax)
  365f21:	8b 45 dc             	mov    -0x24(%ebp),%eax
  365f24:	eb 39                	jmp    365f5f <minix_find_entry+0x1c4>
  365f26:	83 ec 08             	sub    $0x8,%esp
  365f29:	ff 75 e4             	pushl  -0x1c(%ebp)
  365f2c:	ff 75 f0             	pushl  -0x10(%ebp)
  365f2f:	e8 0a fe ff ff       	call   365d3e <minix_next_entry>
  365f34:	83 c4 10             	add    $0x10,%esp
  365f37:	89 45 f0             	mov    %eax,-0x10(%ebp)
  365f3a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  365f3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  365f41:	3b 45 d8             	cmp    -0x28(%ebp),%eax
  365f44:	0f 8c 4f ff ff ff    	jl     365e99 <minix_find_entry+0xfe>
  365f4a:	83 ec 08             	sub    $0x8,%esp
  365f4d:	6a 00                	push   $0x0
  365f4f:	ff 75 dc             	pushl  -0x24(%ebp)
  365f52:	e8 48 59 00 00       	call   36b89f <kfree_s>
  365f57:	83 c4 10             	add    $0x10,%esp
  365f5a:	b8 00 00 00 00       	mov    $0x0,%eax
  365f5f:	c9                   	leave  
  365f60:	c3                   	ret    

00365f61 <minix_add_entry>:
  365f61:	55                   	push   %ebp
  365f62:	89 e5                	mov    %esp,%ebp
  365f64:	83 ec 38             	sub    $0x38,%esp
  365f67:	ff 75 08             	pushl  0x8(%ebp)
  365f6a:	e8 df fc ff ff       	call   365c4e <inode_sb>
  365f6f:	83 c4 04             	add    $0x4,%esp
  365f72:	89 45 e8             	mov    %eax,-0x18(%ebp)
  365f75:	ff 75 e8             	pushl  -0x18(%ebp)
  365f78:	e8 bb fc ff ff       	call   365c38 <sb_info>
  365f7d:	83 c4 04             	add    $0x4,%esp
  365f80:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  365f83:	ff 75 08             	pushl  0x8(%ebp)
  365f86:	e8 b8 fc ff ff       	call   365c43 <inode_info>
  365f8b:	83 c4 04             	add    $0x4,%esp
  365f8e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  365f91:	8b 45 e0             	mov    -0x20(%ebp),%eax
  365f94:	8b 00                	mov    (%eax),%eax
  365f96:	89 45 f4             	mov    %eax,-0xc(%ebp)
  365f99:	8b 45 e8             	mov    -0x18(%ebp),%eax
  365f9c:	8b 40 1c             	mov    0x1c(%eax),%eax
  365f9f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  365fa2:	0f b7 52 26          	movzwl 0x26(%edx),%edx
  365fa6:	0f b7 ca             	movzwl %dx,%ecx
  365fa9:	ba 00 00 00 00       	mov    $0x0,%edx
  365fae:	f7 f1                	div    %ecx
  365fb0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  365fb3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  365fb6:	8b 40 1c             	mov    0x1c(%eax),%eax
  365fb9:	83 ec 0c             	sub    $0xc,%esp
  365fbc:	50                   	push   %eax
  365fbd:	e8 71 57 00 00       	call   36b733 <kalloc>
  365fc2:	83 c4 10             	add    $0x10,%esp
  365fc5:	89 45 d8             	mov    %eax,-0x28(%ebp)
  365fc8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  365fcc:	75 0a                	jne    365fd8 <minix_add_entry+0x77>
  365fce:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
  365fd3:	e9 e3 01 00 00       	jmp    3661bb <minix_add_entry+0x25a>
  365fd8:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  365fdc:	75 0a                	jne    365fe8 <minix_add_entry+0x87>
  365fde:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  365fe3:	e9 d3 01 00 00       	jmp    3661bb <minix_add_entry+0x25a>
  365fe8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  365feb:	83 ec 04             	sub    $0x4,%esp
  365fee:	50                   	push   %eax
  365fef:	ff 75 d8             	pushl  -0x28(%ebp)
  365ff2:	ff 75 e8             	pushl  -0x18(%ebp)
  365ff5:	e8 a6 6d 00 00       	call   36cda0 <sb_bread>
  365ffa:	83 c4 10             	add    $0x10,%esp
  365ffd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  366000:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  366004:	74 18                	je     36601e <minix_add_entry+0xbd>
  366006:	83 ec 08             	sub    $0x8,%esp
  366009:	6a 00                	push   $0x0
  36600b:	ff 75 d8             	pushl  -0x28(%ebp)
  36600e:	e8 8c 58 00 00       	call   36b89f <kfree_s>
  366013:	83 c4 10             	add    $0x10,%esp
  366016:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  366019:	e9 9d 01 00 00       	jmp    3661bb <minix_add_entry+0x25a>
  36601e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  366025:	8b 45 d8             	mov    -0x28(%ebp),%eax
  366028:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36602b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36602e:	8b 50 1c             	mov    0x1c(%eax),%edx
  366031:	8b 45 d8             	mov    -0x28(%ebp),%eax
  366034:	01 d0                	add    %edx,%eax
  366036:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  366039:	77 69                	ja     3660a4 <minix_add_entry+0x143>
  36603b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36603e:	ba 00 00 00 00       	mov    $0x0,%edx
  366043:	f7 75 dc             	divl   -0x24(%ebp)
  366046:	83 ec 04             	sub    $0x4,%esp
  366049:	6a 01                	push   $0x1
  36604b:	50                   	push   %eax
  36604c:	ff 75 08             	pushl  0x8(%ebp)
  36604f:	e8 e0 11 00 00       	call   367234 <bmap>
  366054:	83 c4 10             	add    $0x10,%esp
  366057:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36605a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36605e:	75 1a                	jne    36607a <minix_add_entry+0x119>
  366060:	83 ec 08             	sub    $0x8,%esp
  366063:	6a 00                	push   $0x0
  366065:	ff 75 d8             	pushl  -0x28(%ebp)
  366068:	e8 32 58 00 00       	call   36b89f <kfree_s>
  36606d:	83 c4 10             	add    $0x10,%esp
  366070:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
  366075:	e9 41 01 00 00       	jmp    3661bb <minix_add_entry+0x25a>
  36607a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36607d:	83 ec 04             	sub    $0x4,%esp
  366080:	50                   	push   %eax
  366081:	ff 75 d8             	pushl  -0x28(%ebp)
  366084:	ff 75 e8             	pushl  -0x18(%ebp)
  366087:	e8 14 6d 00 00       	call   36cda0 <sb_bread>
  36608c:	83 c4 10             	add    $0x10,%esp
  36608f:	85 c0                	test   %eax,%eax
  366091:	74 0b                	je     36609e <minix_add_entry+0x13d>
  366093:	8b 45 dc             	mov    -0x24(%ebp),%eax
  366096:	01 45 f0             	add    %eax,-0x10(%ebp)
  366099:	e9 18 01 00 00       	jmp    3661b6 <minix_add_entry+0x255>
  36609e:	8b 45 d8             	mov    -0x28(%ebp),%eax
  3660a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3660a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3660a7:	0f b7 40 26          	movzwl 0x26(%eax),%eax
  3660ab:	0f b7 c0             	movzwl %ax,%eax
  3660ae:	0f af 45 f0          	imul   -0x10(%ebp),%eax
  3660b2:	89 c2                	mov    %eax,%edx
  3660b4:	8b 45 08             	mov    0x8(%ebp),%eax
  3660b7:	8b 40 18             	mov    0x18(%eax),%eax
  3660ba:	39 c2                	cmp    %eax,%edx
  3660bc:	72 44                	jb     366102 <minix_add_entry+0x1a1>
  3660be:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3660c1:	66 c7 00 00 00       	movw   $0x0,(%eax)
  3660c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3660c9:	8d 50 01             	lea    0x1(%eax),%edx
  3660cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3660cf:	0f b7 40 26          	movzwl 0x26(%eax),%eax
  3660d3:	0f b7 c0             	movzwl %ax,%eax
  3660d6:	0f af d0             	imul   %eax,%edx
  3660d9:	8b 45 08             	mov    0x8(%ebp),%eax
  3660dc:	89 50 18             	mov    %edx,0x18(%eax)
  3660df:	83 ec 0c             	sub    $0xc,%esp
  3660e2:	6a 00                	push   $0x0
  3660e4:	e8 00 fb ff ff       	call   365be9 <time>
  3660e9:	83 c4 10             	add    $0x10,%esp
  3660ec:	89 c2                	mov    %eax,%edx
  3660ee:	8b 45 08             	mov    0x8(%ebp),%eax
  3660f1:	89 50 38             	mov    %edx,0x38(%eax)
  3660f4:	83 ec 0c             	sub    $0xc,%esp
  3660f7:	ff 75 08             	pushl  0x8(%ebp)
  3660fa:	e8 75 17 00 00       	call   367874 <minix_sync_inode>
  3660ff:	83 c4 10             	add    $0x10,%esp
  366102:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366105:	0f b7 00             	movzwl (%eax),%eax
  366108:	66 85 c0             	test   %ax,%ax
  36610b:	0f 85 8d 00 00 00    	jne    36619e <minix_add_entry+0x23d>
  366111:	8b 45 14             	mov    0x14(%ebp),%eax
  366114:	89 c2                	mov    %eax,%edx
  366116:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366119:	66 89 10             	mov    %dx,(%eax)
  36611c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36611f:	83 c0 02             	add    $0x2,%eax
  366122:	83 ec 04             	sub    $0x4,%esp
  366125:	ff 75 10             	pushl  0x10(%ebp)
  366128:	ff 75 0c             	pushl  0xc(%ebp)
  36612b:	50                   	push   %eax
  36612c:	e8 6e fb ff ff       	call   365c9f <memcpy>
  366131:	83 c4 10             	add    $0x10,%esp
  366134:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  366137:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  36613b:	0f b7 c0             	movzwl %ax,%eax
  36613e:	2b 45 10             	sub    0x10(%ebp),%eax
  366141:	89 c1                	mov    %eax,%ecx
  366143:	8b 55 10             	mov    0x10(%ebp),%edx
  366146:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366149:	01 d0                	add    %edx,%eax
  36614b:	83 c0 02             	add    $0x2,%eax
  36614e:	83 ec 04             	sub    $0x4,%esp
  366151:	51                   	push   %ecx
  366152:	6a 00                	push   $0x0
  366154:	50                   	push   %eax
  366155:	e8 90 fb ff ff       	call   365cea <memset>
  36615a:	83 c4 10             	add    $0x10,%esp
  36615d:	83 ec 0c             	sub    $0xc,%esp
  366160:	6a 00                	push   $0x0
  366162:	e8 82 fa ff ff       	call   365be9 <time>
  366167:	83 c4 10             	add    $0x10,%esp
  36616a:	89 c2                	mov    %eax,%edx
  36616c:	8b 45 08             	mov    0x8(%ebp),%eax
  36616f:	89 50 30             	mov    %edx,0x30(%eax)
  366172:	8b 45 f4             	mov    -0xc(%ebp),%eax
  366175:	83 ec 04             	sub    $0x4,%esp
  366178:	50                   	push   %eax
  366179:	ff 75 d8             	pushl  -0x28(%ebp)
  36617c:	ff 75 e8             	pushl  -0x18(%ebp)
  36617f:	e8 3c 6c 00 00       	call   36cdc0 <sb_bwrite>
  366184:	83 c4 10             	add    $0x10,%esp
  366187:	83 ec 08             	sub    $0x8,%esp
  36618a:	6a 00                	push   $0x0
  36618c:	ff 75 d8             	pushl  -0x28(%ebp)
  36618f:	e8 0b 57 00 00       	call   36b89f <kfree_s>
  366194:	83 c4 10             	add    $0x10,%esp
  366197:	b8 00 00 00 00       	mov    $0x0,%eax
  36619c:	eb 1d                	jmp    3661bb <minix_add_entry+0x25a>
  36619e:	83 ec 08             	sub    $0x8,%esp
  3661a1:	ff 75 e4             	pushl  -0x1c(%ebp)
  3661a4:	ff 75 ec             	pushl  -0x14(%ebp)
  3661a7:	e8 92 fb ff ff       	call   365d3e <minix_next_entry>
  3661ac:	83 c4 10             	add    $0x10,%esp
  3661af:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3661b2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  3661b6:	e9 70 fe ff ff       	jmp    36602b <minix_add_entry+0xca>
  3661bb:	c9                   	leave  
  3661bc:	c3                   	ret    

003661bd <minix_lookup>:
  3661bd:	55                   	push   %ebp
  3661be:	89 e5                	mov    %esp,%ebp
  3661c0:	83 ec 28             	sub    $0x28,%esp
  3661c3:	ff 75 08             	pushl  0x8(%ebp)
  3661c6:	e8 83 fa ff ff       	call   365c4e <inode_sb>
  3661cb:	83 c4 04             	add    $0x4,%esp
  3661ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3661d1:	ff 75 f0             	pushl  -0x10(%ebp)
  3661d4:	e8 5f fa ff ff       	call   365c38 <sb_info>
  3661d9:	83 c4 04             	add    $0x4,%esp
  3661dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3661df:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3661e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3661e9:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  3661ed:	0f b7 c0             	movzwl %ax,%eax
  3661f0:	3b 45 10             	cmp    0x10(%ebp),%eax
  3661f3:	73 07                	jae    3661fc <minix_lookup+0x3f>
  3661f5:	b8 00 00 00 00       	mov    $0x0,%eax
  3661fa:	eb 69                	jmp    366265 <minix_lookup+0xa8>
  3661fc:	8b 45 10             	mov    0x10(%ebp),%eax
  3661ff:	83 ec 0c             	sub    $0xc,%esp
  366202:	6a 00                	push   $0x0
  366204:	8d 55 e0             	lea    -0x20(%ebp),%edx
  366207:	52                   	push   %edx
  366208:	50                   	push   %eax
  366209:	ff 75 0c             	pushl  0xc(%ebp)
  36620c:	ff 75 08             	pushl  0x8(%ebp)
  36620f:	e8 87 fb ff ff       	call   365d9b <minix_find_entry>
  366214:	83 c4 20             	add    $0x20,%esp
  366217:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36621a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  36621e:	75 07                	jne    366227 <minix_lookup+0x6a>
  366220:	b8 00 00 00 00       	mov    $0x0,%eax
  366225:	eb 3e                	jmp    366265 <minix_lookup+0xa8>
  366227:	8b 45 e0             	mov    -0x20(%ebp),%eax
  36622a:	0f b7 00             	movzwl (%eax),%eax
  36622d:	0f b7 c0             	movzwl %ax,%eax
  366230:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  366233:	83 ec 08             	sub    $0x8,%esp
  366236:	6a 00                	push   $0x0
  366238:	ff 75 e8             	pushl  -0x18(%ebp)
  36623b:	e8 5f 56 00 00       	call   36b89f <kfree_s>
  366240:	83 c4 10             	add    $0x10,%esp
  366243:	8b 45 e0             	mov    -0x20(%ebp),%eax
  366246:	0f b7 00             	movzwl (%eax),%eax
  366249:	66 85 c0             	test   %ax,%ax
  36624c:	74 14                	je     366262 <minix_lookup+0xa5>
  36624e:	83 ec 08             	sub    $0x8,%esp
  366251:	ff 75 e4             	pushl  -0x1c(%ebp)
  366254:	ff 75 f0             	pushl  -0x10(%ebp)
  366257:	e8 67 1a 00 00       	call   367cc3 <minix_find_inode>
  36625c:	83 c4 10             	add    $0x10,%esp
  36625f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  366262:	8b 45 f4             	mov    -0xc(%ebp),%eax
  366265:	c9                   	leave  
  366266:	c3                   	ret    

00366267 <minix_get_dir>:
  366267:	55                   	push   %ebp
  366268:	89 e5                	mov    %esp,%ebp
  36626a:	83 ec 28             	sub    $0x28,%esp
  36626d:	ff 75 08             	pushl  0x8(%ebp)
  366270:	e8 d9 f9 ff ff       	call   365c4e <inode_sb>
  366275:	83 c4 04             	add    $0x4,%esp
  366278:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36627b:	ff 75 f0             	pushl  -0x10(%ebp)
  36627e:	e8 b5 f9 ff ff       	call   365c38 <sb_info>
  366283:	83 c4 04             	add    $0x4,%esp
  366286:	89 45 ec             	mov    %eax,-0x14(%ebp)
  366289:	8b 45 0c             	mov    0xc(%ebp),%eax
  36628c:	0f b6 00             	movzbl (%eax),%eax
  36628f:	3c 2f                	cmp    $0x2f,%al
  366291:	75 04                	jne    366297 <minix_get_dir+0x30>
  366293:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  366297:	8b 45 0c             	mov    0xc(%ebp),%eax
  36629a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36629d:	8b 45 08             	mov    0x8(%ebp),%eax
  3662a0:	8b 00                	mov    (%eax),%eax
  3662a2:	25 00 f0 00 00       	and    $0xf000,%eax
  3662a7:	3d 00 40 00 00       	cmp    $0x4000,%eax
  3662ac:	75 14                	jne    3662c2 <minix_get_dir+0x5b>
  3662ae:	6a 01                	push   $0x1
  3662b0:	ff 75 08             	pushl  0x8(%ebp)
  3662b3:	e8 9a fa ff ff       	call   365d52 <permission>
  3662b8:	83 c4 08             	add    $0x8,%esp
  3662bb:	83 f0 01             	xor    $0x1,%eax
  3662be:	84 c0                	test   %al,%al
  3662c0:	74 07                	je     3662c9 <minix_get_dir+0x62>
  3662c2:	b8 00 00 00 00       	mov    $0x0,%eax
  3662c7:	eb 5d                	jmp    366326 <minix_get_dir+0xbf>
  3662c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3662d0:	eb 04                	jmp    3662d6 <minix_get_dir+0x6f>
  3662d2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3662d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  3662d9:	8d 50 01             	lea    0x1(%eax),%edx
  3662dc:	89 55 0c             	mov    %edx,0xc(%ebp)
  3662df:	0f b6 00             	movzbl (%eax),%eax
  3662e2:	88 45 e7             	mov    %al,-0x19(%ebp)
  3662e5:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
  3662e9:	74 06                	je     3662f1 <minix_get_dir+0x8a>
  3662eb:	80 7d e7 2f          	cmpb   $0x2f,-0x19(%ebp)
  3662ef:	75 e1                	jne    3662d2 <minix_get_dir+0x6b>
  3662f1:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
  3662f5:	75 05                	jne    3662fc <minix_get_dir+0x95>
  3662f7:	8b 45 08             	mov    0x8(%ebp),%eax
  3662fa:	eb 2a                	jmp    366326 <minix_get_dir+0xbf>
  3662fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3662ff:	83 ec 04             	sub    $0x4,%esp
  366302:	50                   	push   %eax
  366303:	ff 75 e8             	pushl  -0x18(%ebp)
  366306:	ff 75 08             	pushl  0x8(%ebp)
  366309:	e8 af fe ff ff       	call   3661bd <minix_lookup>
  36630e:	83 c4 10             	add    $0x10,%esp
  366311:	89 45 08             	mov    %eax,0x8(%ebp)
  366314:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  366318:	75 07                	jne    366321 <minix_get_dir+0xba>
  36631a:	b8 00 00 00 00       	mov    $0x0,%eax
  36631f:	eb 05                	jmp    366326 <minix_get_dir+0xbf>
  366321:	e9 71 ff ff ff       	jmp    366297 <minix_get_dir+0x30>
  366326:	c9                   	leave  
  366327:	c3                   	ret    

00366328 <minix_dir_namei>:
  366328:	55                   	push   %ebp
  366329:	89 e5                	mov    %esp,%ebp
  36632b:	83 ec 18             	sub    $0x18,%esp
  36632e:	83 ec 08             	sub    $0x8,%esp
  366331:	ff 75 0c             	pushl  0xc(%ebp)
  366334:	ff 75 08             	pushl  0x8(%ebp)
  366337:	e8 2b ff ff ff       	call   366267 <minix_get_dir>
  36633c:	83 c4 10             	add    $0x10,%esp
  36633f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  366342:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  366346:	75 07                	jne    36634f <minix_dir_namei+0x27>
  366348:	b8 00 00 00 00       	mov    $0x0,%eax
  36634d:	eb 46                	jmp    366395 <minix_dir_namei+0x6d>
  36634f:	8b 45 0c             	mov    0xc(%ebp),%eax
  366352:	89 45 f4             	mov    %eax,-0xc(%ebp)
  366355:	eb 0c                	jmp    366363 <minix_dir_namei+0x3b>
  366357:	80 7d ef 2f          	cmpb   $0x2f,-0x11(%ebp)
  36635b:	75 06                	jne    366363 <minix_dir_namei+0x3b>
  36635d:	8b 45 0c             	mov    0xc(%ebp),%eax
  366360:	89 45 f4             	mov    %eax,-0xc(%ebp)
  366363:	8b 45 0c             	mov    0xc(%ebp),%eax
  366366:	8d 50 01             	lea    0x1(%eax),%edx
  366369:	89 55 0c             	mov    %edx,0xc(%ebp)
  36636c:	0f b6 00             	movzbl (%eax),%eax
  36636f:	88 45 ef             	mov    %al,-0x11(%ebp)
  366372:	80 7d ef 00          	cmpb   $0x0,-0x11(%ebp)
  366376:	75 df                	jne    366357 <minix_dir_namei+0x2f>
  366378:	8b 55 0c             	mov    0xc(%ebp),%edx
  36637b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36637e:	29 c2                	sub    %eax,%edx
  366380:	89 d0                	mov    %edx,%eax
  366382:	8d 50 ff             	lea    -0x1(%eax),%edx
  366385:	8b 45 10             	mov    0x10(%ebp),%eax
  366388:	89 10                	mov    %edx,(%eax)
  36638a:	8b 45 14             	mov    0x14(%ebp),%eax
  36638d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  366390:	89 10                	mov    %edx,(%eax)
  366392:	8b 45 f0             	mov    -0x10(%ebp),%eax
  366395:	c9                   	leave  
  366396:	c3                   	ret    

00366397 <minix_namei>:
  366397:	55                   	push   %ebp
  366398:	89 e5                	mov    %esp,%ebp
  36639a:	83 ec 28             	sub    $0x28,%esp
  36639d:	ff 75 08             	pushl  0x8(%ebp)
  3663a0:	e8 a9 f8 ff ff       	call   365c4e <inode_sb>
  3663a5:	83 c4 04             	add    $0x4,%esp
  3663a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3663ab:	ff 75 f4             	pushl  -0xc(%ebp)
  3663ae:	e8 85 f8 ff ff       	call   365c38 <sb_info>
  3663b3:	83 c4 04             	add    $0x4,%esp
  3663b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3663b9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  3663bc:	50                   	push   %eax
  3663bd:	8d 45 e8             	lea    -0x18(%ebp),%eax
  3663c0:	50                   	push   %eax
  3663c1:	ff 75 0c             	pushl  0xc(%ebp)
  3663c4:	ff 75 08             	pushl  0x8(%ebp)
  3663c7:	e8 5c ff ff ff       	call   366328 <minix_dir_namei>
  3663cc:	83 c4 10             	add    $0x10,%esp
  3663cf:	89 45 08             	mov    %eax,0x8(%ebp)
  3663d2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  3663d6:	75 07                	jne    3663df <minix_namei+0x48>
  3663d8:	b8 00 00 00 00       	mov    $0x0,%eax
  3663dd:	eb 5a                	jmp    366439 <minix_namei+0xa2>
  3663df:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3663e2:	85 c0                	test   %eax,%eax
  3663e4:	75 05                	jne    3663eb <minix_namei+0x54>
  3663e6:	8b 45 08             	mov    0x8(%ebp),%eax
  3663e9:	eb 4e                	jmp    366439 <minix_namei+0xa2>
  3663eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3663ee:	89 c2                	mov    %eax,%edx
  3663f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3663f3:	83 ec 04             	sub    $0x4,%esp
  3663f6:	52                   	push   %edx
  3663f7:	50                   	push   %eax
  3663f8:	ff 75 08             	pushl  0x8(%ebp)
  3663fb:	e8 bd fd ff ff       	call   3661bd <minix_lookup>
  366400:	83 c4 10             	add    $0x10,%esp
  366403:	89 45 ec             	mov    %eax,-0x14(%ebp)
  366406:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  36640a:	75 07                	jne    366413 <minix_namei+0x7c>
  36640c:	b8 00 00 00 00       	mov    $0x0,%eax
  366411:	eb 26                	jmp    366439 <minix_namei+0xa2>
  366413:	83 ec 0c             	sub    $0xc,%esp
  366416:	6a 00                	push   $0x0
  366418:	e8 cc f7 ff ff       	call   365be9 <time>
  36641d:	83 c4 10             	add    $0x10,%esp
  366420:	89 c2                	mov    %eax,%edx
  366422:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366425:	89 50 28             	mov    %edx,0x28(%eax)
  366428:	83 ec 0c             	sub    $0xc,%esp
  36642b:	ff 75 ec             	pushl  -0x14(%ebp)
  36642e:	e8 41 14 00 00       	call   367874 <minix_sync_inode>
  366433:	83 c4 10             	add    $0x10,%esp
  366436:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366439:	c9                   	leave  
  36643a:	c3                   	ret    

0036643b <open_namei>:
  36643b:	55                   	push   %ebp
  36643c:	89 e5                	mov    %esp,%ebp
  36643e:	83 ec 28             	sub    $0x28,%esp
  366441:	8b 45 10             	mov    0x10(%ebp),%eax
  366444:	25 00 02 00 00       	and    $0x200,%eax
  366449:	85 c0                	test   %eax,%eax
  36644b:	74 0e                	je     36645b <open_namei+0x20>
  36644d:	8b 45 10             	mov    0x10(%ebp),%eax
  366450:	83 e0 03             	and    $0x3,%eax
  366453:	85 c0                	test   %eax,%eax
  366455:	75 04                	jne    36645b <open_namei+0x20>
  366457:	83 4d 10 01          	orl    $0x1,0x10(%ebp)
  36645b:	81 65 14 ff 01 00 00 	andl   $0x1ff,0x14(%ebp)
  366462:	81 4d 14 00 80 00 00 	orl    $0x8000,0x14(%ebp)
  366469:	8d 45 ec             	lea    -0x14(%ebp),%eax
  36646c:	50                   	push   %eax
  36646d:	8d 45 e8             	lea    -0x18(%ebp),%eax
  366470:	50                   	push   %eax
  366471:	ff 75 0c             	pushl  0xc(%ebp)
  366474:	ff 75 08             	pushl  0x8(%ebp)
  366477:	e8 ac fe ff ff       	call   366328 <minix_dir_namei>
  36647c:	83 c4 10             	add    $0x10,%esp
  36647f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  366482:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  366486:	75 0a                	jne    366492 <open_namei+0x57>
  366488:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  36648d:	e9 78 01 00 00       	jmp    36660a <open_namei+0x1cf>
  366492:	8b 45 e8             	mov    -0x18(%ebp),%eax
  366495:	85 c0                	test   %eax,%eax
  366497:	75 28                	jne    3664c1 <open_namei+0x86>
  366499:	8b 45 10             	mov    0x10(%ebp),%eax
  36649c:	25 43 02 00 00       	and    $0x243,%eax
  3664a1:	85 c0                	test   %eax,%eax
  3664a3:	75 12                	jne    3664b7 <open_namei+0x7c>
  3664a5:	8b 45 18             	mov    0x18(%ebp),%eax
  3664a8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  3664ab:	89 10                	mov    %edx,(%eax)
  3664ad:	b8 00 00 00 00       	mov    $0x0,%eax
  3664b2:	e9 53 01 00 00       	jmp    36660a <open_namei+0x1cf>
  3664b7:	b8 eb ff ff ff       	mov    $0xffffffeb,%eax
  3664bc:	e9 49 01 00 00       	jmp    36660a <open_namei+0x1cf>
  3664c1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3664c4:	89 c2                	mov    %eax,%edx
  3664c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3664c9:	83 ec 04             	sub    $0x4,%esp
  3664cc:	52                   	push   %edx
  3664cd:	50                   	push   %eax
  3664ce:	ff 75 f4             	pushl  -0xc(%ebp)
  3664d1:	e8 e7 fc ff ff       	call   3661bd <minix_lookup>
  3664d6:	83 c4 10             	add    $0x10,%esp
  3664d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3664dc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  3664e0:	0f 85 a7 00 00 00    	jne    36658d <open_namei+0x152>
  3664e6:	8b 45 10             	mov    0x10(%ebp),%eax
  3664e9:	83 e0 40             	and    $0x40,%eax
  3664ec:	85 c0                	test   %eax,%eax
  3664ee:	75 0a                	jne    3664fa <open_namei+0xbf>
  3664f0:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  3664f5:	e9 10 01 00 00       	jmp    36660a <open_namei+0x1cf>
  3664fa:	83 ec 08             	sub    $0x8,%esp
  3664fd:	6a 02                	push   $0x2
  3664ff:	ff 75 f4             	pushl  -0xc(%ebp)
  366502:	e8 4b f8 ff ff       	call   365d52 <permission>
  366507:	83 c4 10             	add    $0x10,%esp
  36650a:	83 f0 01             	xor    $0x1,%eax
  36650d:	84 c0                	test   %al,%al
  36650f:	74 0a                	je     36651b <open_namei+0xe0>
  366511:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  366516:	e9 ef 00 00 00       	jmp    36660a <open_namei+0x1cf>
  36651b:	8b 45 14             	mov    0x14(%ebp),%eax
  36651e:	83 ec 04             	sub    $0x4,%esp
  366521:	8d 55 e4             	lea    -0x1c(%ebp),%edx
  366524:	52                   	push   %edx
  366525:	50                   	push   %eax
  366526:	ff 75 f4             	pushl  -0xc(%ebp)
  366529:	e8 70 29 00 00       	call   368e9e <minix_new_inode>
  36652e:	83 c4 10             	add    $0x10,%esp
  366531:	89 45 f0             	mov    %eax,-0x10(%ebp)
  366534:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  366538:	75 08                	jne    366542 <open_namei+0x107>
  36653a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36653d:	e9 c8 00 00 00       	jmp    36660a <open_namei+0x1cf>
  366542:	8b 45 f0             	mov    -0x10(%ebp),%eax
  366545:	8b 48 10             	mov    0x10(%eax),%ecx
  366548:	8b 55 e8             	mov    -0x18(%ebp),%edx
  36654b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36654e:	51                   	push   %ecx
  36654f:	52                   	push   %edx
  366550:	50                   	push   %eax
  366551:	ff 75 f4             	pushl  -0xc(%ebp)
  366554:	e8 08 fa ff ff       	call   365f61 <minix_add_entry>
  366559:	83 c4 10             	add    $0x10,%esp
  36655c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36655f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  366562:	85 c0                	test   %eax,%eax
  366564:	74 18                	je     36657e <open_namei+0x143>
  366566:	83 ec 0c             	sub    $0xc,%esp
  366569:	ff 75 f0             	pushl  -0x10(%ebp)
  36656c:	e8 e0 27 00 00       	call   368d51 <minix_free_inode>
  366571:	83 c4 10             	add    $0x10,%esp
  366574:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  366577:	f7 d8                	neg    %eax
  366579:	e9 8c 00 00 00       	jmp    36660a <open_namei+0x1cf>
  36657e:	8b 45 18             	mov    0x18(%ebp),%eax
  366581:	8b 55 f0             	mov    -0x10(%ebp),%edx
  366584:	89 10                	mov    %edx,(%eax)
  366586:	b8 00 00 00 00       	mov    $0x0,%eax
  36658b:	eb 7d                	jmp    36660a <open_namei+0x1cf>
  36658d:	8b 45 10             	mov    0x10(%ebp),%eax
  366590:	25 80 00 00 00       	and    $0x80,%eax
  366595:	85 c0                	test   %eax,%eax
  366597:	74 07                	je     3665a0 <open_namei+0x165>
  366599:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
  36659e:	eb 6a                	jmp    36660a <open_namei+0x1cf>
  3665a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3665a3:	8b 00                	mov    (%eax),%eax
  3665a5:	25 00 f0 00 00       	and    $0xf000,%eax
  3665aa:	3d 00 40 00 00       	cmp    $0x4000,%eax
  3665af:	75 0a                	jne    3665bb <open_namei+0x180>
  3665b1:	8b 45 10             	mov    0x10(%ebp),%eax
  3665b4:	83 e0 03             	and    $0x3,%eax
  3665b7:	85 c0                	test   %eax,%eax
  3665b9:	75 26                	jne    3665e1 <open_namei+0x1a6>
  3665bb:	8b 45 10             	mov    0x10(%ebp),%eax
  3665be:	83 e0 03             	and    $0x3,%eax
  3665c1:	0f b6 80 ef df 36 00 	movzbl 0x36dfef(%eax),%eax
  3665c8:	0f be c0             	movsbl %al,%eax
  3665cb:	83 ec 08             	sub    $0x8,%esp
  3665ce:	50                   	push   %eax
  3665cf:	ff 75 f0             	pushl  -0x10(%ebp)
  3665d2:	e8 7b f7 ff ff       	call   365d52 <permission>
  3665d7:	83 c4 10             	add    $0x10,%esp
  3665da:	83 f0 01             	xor    $0x1,%eax
  3665dd:	84 c0                	test   %al,%al
  3665df:	74 07                	je     3665e8 <open_namei+0x1ad>
  3665e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  3665e6:	eb 22                	jmp    36660a <open_namei+0x1cf>
  3665e8:	83 ec 0c             	sub    $0xc,%esp
  3665eb:	6a 00                	push   $0x0
  3665ed:	e8 f7 f5 ff ff       	call   365be9 <time>
  3665f2:	83 c4 10             	add    $0x10,%esp
  3665f5:	89 c2                	mov    %eax,%edx
  3665f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3665fa:	89 50 28             	mov    %edx,0x28(%eax)
  3665fd:	8b 45 18             	mov    0x18(%ebp),%eax
  366600:	8b 55 f0             	mov    -0x10(%ebp),%edx
  366603:	89 10                	mov    %edx,(%eax)
  366605:	b8 00 00 00 00       	mov    $0x0,%eax
  36660a:	c9                   	leave  
  36660b:	c3                   	ret    

0036660c <sys_mknod>:
  36660c:	55                   	push   %ebp
  36660d:	89 e5                	mov    %esp,%ebp
  36660f:	83 ec 28             	sub    $0x28,%esp
  366612:	8d 45 e0             	lea    -0x20(%ebp),%eax
  366615:	50                   	push   %eax
  366616:	8d 45 e8             	lea    -0x18(%ebp),%eax
  366619:	50                   	push   %eax
  36661a:	ff 75 0c             	pushl  0xc(%ebp)
  36661d:	ff 75 08             	pushl  0x8(%ebp)
  366620:	e8 03 fd ff ff       	call   366328 <minix_dir_namei>
  366625:	83 c4 10             	add    $0x10,%esp
  366628:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36662b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36662f:	75 0a                	jne    36663b <sys_mknod+0x2f>
  366631:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  366636:	e9 2b 01 00 00       	jmp    366766 <sys_mknod+0x15a>
  36663b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36663e:	85 c0                	test   %eax,%eax
  366640:	75 0a                	jne    36664c <sys_mknod+0x40>
  366642:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  366647:	e9 1a 01 00 00       	jmp    366766 <sys_mknod+0x15a>
  36664c:	83 ec 08             	sub    $0x8,%esp
  36664f:	6a 02                	push   $0x2
  366651:	ff 75 f4             	pushl  -0xc(%ebp)
  366654:	e8 f9 f6 ff ff       	call   365d52 <permission>
  366659:	83 c4 10             	add    $0x10,%esp
  36665c:	83 f0 01             	xor    $0x1,%eax
  36665f:	84 c0                	test   %al,%al
  366661:	74 0a                	je     36666d <sys_mknod+0x61>
  366663:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  366668:	e9 f9 00 00 00       	jmp    366766 <sys_mknod+0x15a>
  36666d:	8b 55 e8             	mov    -0x18(%ebp),%edx
  366670:	8b 45 e0             	mov    -0x20(%ebp),%eax
  366673:	83 ec 0c             	sub    $0xc,%esp
  366676:	6a 00                	push   $0x0
  366678:	8d 4d dc             	lea    -0x24(%ebp),%ecx
  36667b:	51                   	push   %ecx
  36667c:	52                   	push   %edx
  36667d:	50                   	push   %eax
  36667e:	ff 75 f4             	pushl  -0xc(%ebp)
  366681:	e8 15 f7 ff ff       	call   365d9b <minix_find_entry>
  366686:	83 c4 20             	add    $0x20,%esp
  366689:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36668c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  366690:	74 1a                	je     3666ac <sys_mknod+0xa0>
  366692:	83 ec 08             	sub    $0x8,%esp
  366695:	6a 00                	push   $0x0
  366697:	ff 75 f0             	pushl  -0x10(%ebp)
  36669a:	e8 00 52 00 00       	call   36b89f <kfree_s>
  36669f:	83 c4 10             	add    $0x10,%esp
  3666a2:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
  3666a7:	e9 ba 00 00 00       	jmp    366766 <sys_mknod+0x15a>
  3666ac:	83 ec 04             	sub    $0x4,%esp
  3666af:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  3666b2:	50                   	push   %eax
  3666b3:	ff 75 10             	pushl  0x10(%ebp)
  3666b6:	ff 75 f4             	pushl  -0xc(%ebp)
  3666b9:	e8 e0 27 00 00       	call   368e9e <minix_new_inode>
  3666be:	83 c4 10             	add    $0x10,%esp
  3666c1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3666c4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  3666c8:	75 0a                	jne    3666d4 <sys_mknod+0xc8>
  3666ca:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
  3666cf:	e9 92 00 00 00       	jmp    366766 <sys_mknod+0x15a>
  3666d4:	8b 45 10             	mov    0x10(%ebp),%eax
  3666d7:	25 00 f0 00 00       	and    $0xf000,%eax
  3666dc:	3d 00 60 00 00       	cmp    $0x6000,%eax
  3666e1:	74 0f                	je     3666f2 <sys_mknod+0xe6>
  3666e3:	8b 45 10             	mov    0x10(%ebp),%eax
  3666e6:	25 00 f0 00 00       	and    $0xf000,%eax
  3666eb:	3d 00 20 00 00       	cmp    $0x2000,%eax
  3666f0:	75 09                	jne    3666fb <sys_mknod+0xef>
  3666f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3666f5:	8b 55 14             	mov    0x14(%ebp),%edx
  3666f8:	89 50 14             	mov    %edx,0x14(%eax)
  3666fb:	83 ec 0c             	sub    $0xc,%esp
  3666fe:	6a 00                	push   $0x0
  366700:	e8 e4 f4 ff ff       	call   365be9 <time>
  366705:	83 c4 10             	add    $0x10,%esp
  366708:	89 c2                	mov    %eax,%edx
  36670a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36670d:	89 50 28             	mov    %edx,0x28(%eax)
  366710:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366713:	8b 50 28             	mov    0x28(%eax),%edx
  366716:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366719:	89 50 30             	mov    %edx,0x30(%eax)
  36671c:	83 ec 0c             	sub    $0xc,%esp
  36671f:	ff 75 ec             	pushl  -0x14(%ebp)
  366722:	e8 4d 11 00 00       	call   367874 <minix_sync_inode>
  366727:	83 c4 10             	add    $0x10,%esp
  36672a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36672d:	8b 48 10             	mov    0x10(%eax),%ecx
  366730:	8b 55 e8             	mov    -0x18(%ebp),%edx
  366733:	8b 45 e0             	mov    -0x20(%ebp),%eax
  366736:	51                   	push   %ecx
  366737:	52                   	push   %edx
  366738:	50                   	push   %eax
  366739:	ff 75 f4             	pushl  -0xc(%ebp)
  36673c:	e8 20 f8 ff ff       	call   365f61 <minix_add_entry>
  366741:	83 c4 10             	add    $0x10,%esp
  366744:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  366747:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36674a:	85 c0                	test   %eax,%eax
  36674c:	74 13                	je     366761 <sys_mknod+0x155>
  36674e:	83 ec 0c             	sub    $0xc,%esp
  366751:	ff 75 ec             	pushl  -0x14(%ebp)
  366754:	e8 f8 25 00 00       	call   368d51 <minix_free_inode>
  366759:	83 c4 10             	add    $0x10,%esp
  36675c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36675f:	eb 05                	jmp    366766 <sys_mknod+0x15a>
  366761:	b8 00 00 00 00       	mov    $0x0,%eax
  366766:	c9                   	leave  
  366767:	c3                   	ret    

00366768 <minix_mkdir>:
  366768:	55                   	push   %ebp
  366769:	89 e5                	mov    %esp,%ebp
  36676b:	83 ec 38             	sub    $0x38,%esp
  36676e:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  366771:	50                   	push   %eax
  366772:	8d 45 dc             	lea    -0x24(%ebp),%eax
  366775:	50                   	push   %eax
  366776:	ff 75 0c             	pushl  0xc(%ebp)
  366779:	ff 75 08             	pushl  0x8(%ebp)
  36677c:	e8 a7 fb ff ff       	call   366328 <minix_dir_namei>
  366781:	83 c4 10             	add    $0x10,%esp
  366784:	89 45 f4             	mov    %eax,-0xc(%ebp)
  366787:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36678b:	74 07                	je     366794 <minix_mkdir+0x2c>
  36678d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  366790:	85 c0                	test   %eax,%eax
  366792:	75 0a                	jne    36679e <minix_mkdir+0x36>
  366794:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  366799:	e9 46 02 00 00       	jmp    3669e4 <minix_mkdir+0x27c>
  36679e:	83 ec 08             	sub    $0x8,%esp
  3667a1:	6a 02                	push   $0x2
  3667a3:	ff 75 f4             	pushl  -0xc(%ebp)
  3667a6:	e8 a7 f5 ff ff       	call   365d52 <permission>
  3667ab:	83 c4 10             	add    $0x10,%esp
  3667ae:	83 f0 01             	xor    $0x1,%eax
  3667b1:	84 c0                	test   %al,%al
  3667b3:	74 0a                	je     3667bf <minix_mkdir+0x57>
  3667b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  3667ba:	e9 25 02 00 00       	jmp    3669e4 <minix_mkdir+0x27c>
  3667bf:	8b 55 dc             	mov    -0x24(%ebp),%edx
  3667c2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  3667c5:	83 ec 0c             	sub    $0xc,%esp
  3667c8:	6a 00                	push   $0x0
  3667ca:	8d 4d d0             	lea    -0x30(%ebp),%ecx
  3667cd:	51                   	push   %ecx
  3667ce:	52                   	push   %edx
  3667cf:	50                   	push   %eax
  3667d0:	ff 75 f4             	pushl  -0xc(%ebp)
  3667d3:	e8 c3 f5 ff ff       	call   365d9b <minix_find_entry>
  3667d8:	83 c4 20             	add    $0x20,%esp
  3667db:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3667de:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  3667e2:	74 1a                	je     3667fe <minix_mkdir+0x96>
  3667e4:	83 ec 08             	sub    $0x8,%esp
  3667e7:	6a 00                	push   $0x0
  3667e9:	ff 75 f0             	pushl  -0x10(%ebp)
  3667ec:	e8 ae 50 00 00       	call   36b89f <kfree_s>
  3667f1:	83 c4 10             	add    $0x10,%esp
  3667f4:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
  3667f9:	e9 e6 01 00 00       	jmp    3669e4 <minix_mkdir+0x27c>
  3667fe:	8b 45 10             	mov    0x10(%ebp),%eax
  366801:	83 ec 04             	sub    $0x4,%esp
  366804:	8d 55 d8             	lea    -0x28(%ebp),%edx
  366807:	52                   	push   %edx
  366808:	50                   	push   %eax
  366809:	ff 75 f4             	pushl  -0xc(%ebp)
  36680c:	e8 8d 26 00 00       	call   368e9e <minix_new_inode>
  366811:	83 c4 10             	add    $0x10,%esp
  366814:	89 45 ec             	mov    %eax,-0x14(%ebp)
  366817:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  36681b:	75 08                	jne    366825 <minix_mkdir+0xbd>
  36681d:	8b 45 d8             	mov    -0x28(%ebp),%eax
  366820:	e9 bf 01 00 00       	jmp    3669e4 <minix_mkdir+0x27c>
  366825:	83 ec 0c             	sub    $0xc,%esp
  366828:	ff 75 ec             	pushl  -0x14(%ebp)
  36682b:	e8 1e f4 ff ff       	call   365c4e <inode_sb>
  366830:	83 c4 10             	add    $0x10,%esp
  366833:	89 45 e8             	mov    %eax,-0x18(%ebp)
  366836:	83 ec 0c             	sub    $0xc,%esp
  366839:	ff 75 e8             	pushl  -0x18(%ebp)
  36683c:	e8 f7 f3 ff ff       	call   365c38 <sb_info>
  366841:	83 c4 10             	add    $0x10,%esp
  366844:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  366847:	83 ec 0c             	sub    $0xc,%esp
  36684a:	ff 75 ec             	pushl  -0x14(%ebp)
  36684d:	e8 f1 f3 ff ff       	call   365c43 <inode_info>
  366852:	83 c4 10             	add    $0x10,%esp
  366855:	89 45 e0             	mov    %eax,-0x20(%ebp)
  366858:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36685b:	0f b7 40 26          	movzwl 0x26(%eax),%eax
  36685f:	0f b7 c0             	movzwl %ax,%eax
  366862:	01 c0                	add    %eax,%eax
  366864:	89 c2                	mov    %eax,%edx
  366866:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366869:	89 50 18             	mov    %edx,0x18(%eax)
  36686c:	83 ec 0c             	sub    $0xc,%esp
  36686f:	6a 00                	push   $0x0
  366871:	e8 73 f3 ff ff       	call   365be9 <time>
  366876:	83 c4 10             	add    $0x10,%esp
  366879:	89 c2                	mov    %eax,%edx
  36687b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36687e:	89 50 28             	mov    %edx,0x28(%eax)
  366881:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366884:	8b 50 28             	mov    0x28(%eax),%edx
  366887:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36688a:	89 50 30             	mov    %edx,0x30(%eax)
  36688d:	8b 45 10             	mov    0x10(%ebp),%eax
  366890:	25 ff 01 00 00       	and    $0x1ff,%eax
  366895:	80 cc 40             	or     $0x40,%ah
  366898:	89 c2                	mov    %eax,%edx
  36689a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36689d:	89 10                	mov    %edx,(%eax)
  36689f:	83 ec 0c             	sub    $0xc,%esp
  3668a2:	ff 75 ec             	pushl  -0x14(%ebp)
  3668a5:	e8 20 23 00 00       	call   368bca <minix_new_block>
  3668aa:	83 c4 10             	add    $0x10,%esp
  3668ad:	89 c2                	mov    %eax,%edx
  3668af:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3668b2:	89 10                	mov    %edx,(%eax)
  3668b4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3668b7:	8b 00                	mov    (%eax),%eax
  3668b9:	85 c0                	test   %eax,%eax
  3668bb:	75 18                	jne    3668d5 <minix_mkdir+0x16d>
  3668bd:	83 ec 0c             	sub    $0xc,%esp
  3668c0:	ff 75 ec             	pushl  -0x14(%ebp)
  3668c3:	e8 89 24 00 00       	call   368d51 <minix_free_inode>
  3668c8:	83 c4 10             	add    $0x10,%esp
  3668cb:	b8 e4 ff ff ff       	mov    $0xffffffe4,%eax
  3668d0:	e9 0f 01 00 00       	jmp    3669e4 <minix_mkdir+0x27c>
  3668d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3668d8:	8b 40 1c             	mov    0x1c(%eax),%eax
  3668db:	83 ec 0c             	sub    $0xc,%esp
  3668de:	50                   	push   %eax
  3668df:	e8 4f 4e 00 00       	call   36b733 <kalloc>
  3668e4:	83 c4 10             	add    $0x10,%esp
  3668e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3668ea:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  3668ee:	75 18                	jne    366908 <minix_mkdir+0x1a0>
  3668f0:	83 ec 0c             	sub    $0xc,%esp
  3668f3:	ff 75 ec             	pushl  -0x14(%ebp)
  3668f6:	e8 56 24 00 00       	call   368d51 <minix_free_inode>
  3668fb:	83 c4 10             	add    $0x10,%esp
  3668fe:	b8 f4 ff ff ff       	mov    $0xfffffff4,%eax
  366903:	e9 dc 00 00 00       	jmp    3669e4 <minix_mkdir+0x27c>
  366908:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36690b:	89 45 d0             	mov    %eax,-0x30(%ebp)
  36690e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  366911:	8b 55 ec             	mov    -0x14(%ebp),%edx
  366914:	8b 52 10             	mov    0x10(%edx),%edx
  366917:	66 89 10             	mov    %dx,(%eax)
  36691a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  36691d:	83 c0 02             	add    $0x2,%eax
  366920:	83 ec 08             	sub    $0x8,%esp
  366923:	68 f4 df 36 00       	push   $0x36dff4
  366928:	50                   	push   %eax
  366929:	e8 2b f3 ff ff       	call   365c59 <strcpy>
  36692e:	83 c4 10             	add    $0x10,%esp
  366931:	8b 45 d0             	mov    -0x30(%ebp),%eax
  366934:	83 ec 08             	sub    $0x8,%esp
  366937:	ff 75 e4             	pushl  -0x1c(%ebp)
  36693a:	50                   	push   %eax
  36693b:	e8 fe f3 ff ff       	call   365d3e <minix_next_entry>
  366940:	83 c4 10             	add    $0x10,%esp
  366943:	89 45 d0             	mov    %eax,-0x30(%ebp)
  366946:	8b 45 d0             	mov    -0x30(%ebp),%eax
  366949:	8b 55 f4             	mov    -0xc(%ebp),%edx
  36694c:	8b 52 10             	mov    0x10(%edx),%edx
  36694f:	66 89 10             	mov    %dx,(%eax)
  366952:	8b 45 d0             	mov    -0x30(%ebp),%eax
  366955:	83 c0 02             	add    $0x2,%eax
  366958:	83 ec 08             	sub    $0x8,%esp
  36695b:	68 f6 df 36 00       	push   $0x36dff6
  366960:	50                   	push   %eax
  366961:	e8 f3 f2 ff ff       	call   365c59 <strcpy>
  366966:	83 c4 10             	add    $0x10,%esp
  366969:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36696c:	c7 40 48 02 00 00 00 	movl   $0x2,0x48(%eax)
  366973:	8b 45 e0             	mov    -0x20(%ebp),%eax
  366976:	8b 00                	mov    (%eax),%eax
  366978:	83 ec 04             	sub    $0x4,%esp
  36697b:	50                   	push   %eax
  36697c:	ff 75 f0             	pushl  -0x10(%ebp)
  36697f:	ff 75 e8             	pushl  -0x18(%ebp)
  366982:	e8 39 64 00 00       	call   36cdc0 <sb_bwrite>
  366987:	83 c4 10             	add    $0x10,%esp
  36698a:	83 ec 08             	sub    $0x8,%esp
  36698d:	6a 00                	push   $0x0
  36698f:	ff 75 f0             	pushl  -0x10(%ebp)
  366992:	e8 08 4f 00 00       	call   36b89f <kfree_s>
  366997:	83 c4 10             	add    $0x10,%esp
  36699a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36699d:	8b 48 10             	mov    0x10(%eax),%ecx
  3669a0:	8b 55 dc             	mov    -0x24(%ebp),%edx
  3669a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  3669a6:	51                   	push   %ecx
  3669a7:	52                   	push   %edx
  3669a8:	50                   	push   %eax
  3669a9:	ff 75 f4             	pushl  -0xc(%ebp)
  3669ac:	e8 b0 f5 ff ff       	call   365f61 <minix_add_entry>
  3669b1:	83 c4 10             	add    $0x10,%esp
  3669b4:	89 45 d8             	mov    %eax,-0x28(%ebp)
  3669b7:	8b 45 d8             	mov    -0x28(%ebp),%eax
  3669ba:	85 c0                	test   %eax,%eax
  3669bc:	74 13                	je     3669d1 <minix_mkdir+0x269>
  3669be:	83 ec 0c             	sub    $0xc,%esp
  3669c1:	ff 75 ec             	pushl  -0x14(%ebp)
  3669c4:	e8 88 23 00 00       	call   368d51 <minix_free_inode>
  3669c9:	83 c4 10             	add    $0x10,%esp
  3669cc:	8b 45 d8             	mov    -0x28(%ebp),%eax
  3669cf:	eb 13                	jmp    3669e4 <minix_mkdir+0x27c>
  3669d1:	83 ec 0c             	sub    $0xc,%esp
  3669d4:	ff 75 ec             	pushl  -0x14(%ebp)
  3669d7:	e8 98 0e 00 00       	call   367874 <minix_sync_inode>
  3669dc:	83 c4 10             	add    $0x10,%esp
  3669df:	b8 00 00 00 00       	mov    $0x0,%eax
  3669e4:	c9                   	leave  
  3669e5:	c3                   	ret    

003669e6 <minix_emtry_dir>:
  3669e6:	55                   	push   %ebp
  3669e7:	89 e5                	mov    %esp,%ebp
  3669e9:	83 ec 38             	sub    $0x38,%esp
  3669ec:	ff 75 08             	pushl  0x8(%ebp)
  3669ef:	e8 5a f2 ff ff       	call   365c4e <inode_sb>
  3669f4:	83 c4 04             	add    $0x4,%esp
  3669f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3669fa:	ff 75 ec             	pushl  -0x14(%ebp)
  3669fd:	e8 36 f2 ff ff       	call   365c38 <sb_info>
  366a02:	83 c4 04             	add    $0x4,%esp
  366a05:	89 45 e8             	mov    %eax,-0x18(%ebp)
  366a08:	ff 75 08             	pushl  0x8(%ebp)
  366a0b:	e8 33 f2 ff ff       	call   365c43 <inode_info>
  366a10:	83 c4 04             	add    $0x4,%esp
  366a13:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  366a16:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366a19:	8b 40 1c             	mov    0x1c(%eax),%eax
  366a1c:	8b 55 e8             	mov    -0x18(%ebp),%edx
  366a1f:	0f b7 52 26          	movzwl 0x26(%edx),%edx
  366a23:	0f b7 ca             	movzwl %dx,%ecx
  366a26:	ba 00 00 00 00       	mov    $0x0,%edx
  366a2b:	f7 f1                	div    %ecx
  366a2d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  366a30:	8b 45 08             	mov    0x8(%ebp),%eax
  366a33:	8b 40 18             	mov    0x18(%eax),%eax
  366a36:	8b 55 e8             	mov    -0x18(%ebp),%edx
  366a39:	0f b7 52 26          	movzwl 0x26(%edx),%edx
  366a3d:	0f b7 ca             	movzwl %dx,%ecx
  366a40:	ba 00 00 00 00       	mov    $0x0,%edx
  366a45:	f7 f1                	div    %ecx
  366a47:	89 45 dc             	mov    %eax,-0x24(%ebp)
  366a4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366a4d:	8b 40 1c             	mov    0x1c(%eax),%eax
  366a50:	83 ec 0c             	sub    $0xc,%esp
  366a53:	50                   	push   %eax
  366a54:	e8 da 4c 00 00       	call   36b733 <kalloc>
  366a59:	83 c4 10             	add    $0x10,%esp
  366a5c:	89 45 d8             	mov    %eax,-0x28(%ebp)
  366a5f:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  366a63:	75 0a                	jne    366a6f <minix_emtry_dir+0x89>
  366a65:	b8 00 00 00 00       	mov    $0x0,%eax
  366a6a:	e9 c0 01 00 00       	jmp    366c2f <minix_emtry_dir+0x249>
  366a6f:	83 7d dc 01          	cmpl   $0x1,-0x24(%ebp)
  366a73:	7e 20                	jle    366a95 <minix_emtry_dir+0xaf>
  366a75:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  366a78:	8b 00                	mov    (%eax),%eax
  366a7a:	85 c0                	test   %eax,%eax
  366a7c:	74 17                	je     366a95 <minix_emtry_dir+0xaf>
  366a7e:	83 ec 04             	sub    $0x4,%esp
  366a81:	6a 00                	push   $0x0
  366a83:	ff 75 d8             	pushl  -0x28(%ebp)
  366a86:	ff 75 08             	pushl  0x8(%ebp)
  366a89:	e8 ec ea ff ff       	call   36557a <inode_bread>
  366a8e:	83 c4 10             	add    $0x10,%esp
  366a91:	85 c0                	test   %eax,%eax
  366a93:	74 26                	je     366abb <minix_emtry_dir+0xd5>
  366a95:	8b 45 08             	mov    0x8(%ebp),%eax
  366a98:	8b 40 14             	mov    0x14(%eax),%eax
  366a9b:	83 ec 04             	sub    $0x4,%esp
  366a9e:	50                   	push   %eax
  366a9f:	68 f9 df 36 00       	push   $0x36dff9
  366aa4:	68 00 e0 36 00       	push   $0x36e000
  366aa9:	e8 da 25 00 00       	call   369088 <printk>
  366aae:	83 c4 10             	add    $0x10,%esp
  366ab1:	b8 00 00 00 00       	mov    $0x0,%eax
  366ab6:	e9 74 01 00 00       	jmp    366c2f <minix_emtry_dir+0x249>
  366abb:	8b 45 d8             	mov    -0x28(%ebp),%eax
  366abe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  366ac1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  366ac4:	0f b7 00             	movzwl (%eax),%eax
  366ac7:	0f b7 d0             	movzwl %ax,%edx
  366aca:	8b 45 08             	mov    0x8(%ebp),%eax
  366acd:	8b 40 10             	mov    0x10(%eax),%eax
  366ad0:	39 c2                	cmp    %eax,%edx
  366ad2:	75 1b                	jne    366aef <minix_emtry_dir+0x109>
  366ad4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  366ad7:	83 c0 02             	add    $0x2,%eax
  366ada:	83 ec 08             	sub    $0x8,%esp
  366add:	68 f4 df 36 00       	push   $0x36dff4
  366ae2:	50                   	push   %eax
  366ae3:	e8 8e f1 ff ff       	call   365c76 <strcmp>
  366ae8:	83 c4 10             	add    $0x10,%esp
  366aeb:	85 c0                	test   %eax,%eax
  366aed:	74 0a                	je     366af9 <minix_emtry_dir+0x113>
  366aef:	b8 00 00 00 00       	mov    $0x0,%eax
  366af4:	e9 36 01 00 00       	jmp    366c2f <minix_emtry_dir+0x249>
  366af9:	83 ec 08             	sub    $0x8,%esp
  366afc:	ff 75 e8             	pushl  -0x18(%ebp)
  366aff:	ff 75 f0             	pushl  -0x10(%ebp)
  366b02:	e8 37 f2 ff ff       	call   365d3e <minix_next_entry>
  366b07:	83 c4 10             	add    $0x10,%esp
  366b0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  366b0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  366b10:	0f b7 00             	movzwl (%eax),%eax
  366b13:	66 85 c0             	test   %ax,%ax
  366b16:	74 1b                	je     366b33 <minix_emtry_dir+0x14d>
  366b18:	8b 45 f0             	mov    -0x10(%ebp),%eax
  366b1b:	83 c0 02             	add    $0x2,%eax
  366b1e:	83 ec 08             	sub    $0x8,%esp
  366b21:	68 f6 df 36 00       	push   $0x36dff6
  366b26:	50                   	push   %eax
  366b27:	e8 4a f1 ff ff       	call   365c76 <strcmp>
  366b2c:	83 c4 10             	add    $0x10,%esp
  366b2f:	85 c0                	test   %eax,%eax
  366b31:	74 0a                	je     366b3d <minix_emtry_dir+0x157>
  366b33:	b8 00 00 00 00       	mov    $0x0,%eax
  366b38:	e9 f2 00 00 00       	jmp    366c2f <minix_emtry_dir+0x249>
  366b3d:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
  366b44:	83 ec 08             	sub    $0x8,%esp
  366b47:	ff 75 e8             	pushl  -0x18(%ebp)
  366b4a:	ff 75 f0             	pushl  -0x10(%ebp)
  366b4d:	e8 ec f1 ff ff       	call   365d3e <minix_next_entry>
  366b52:	83 c4 10             	add    $0x10,%esp
  366b55:	89 45 f0             	mov    %eax,-0x10(%ebp)
  366b58:	e9 b1 00 00 00       	jmp    366c0e <minix_emtry_dir+0x228>
  366b5d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366b60:	8b 50 1c             	mov    0x1c(%eax),%edx
  366b63:	8b 45 d8             	mov    -0x28(%ebp),%eax
  366b66:	01 d0                	add    %edx,%eax
  366b68:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  366b6b:	77 67                	ja     366bd4 <minix_emtry_dir+0x1ee>
  366b6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  366b70:	ba 00 00 00 00       	mov    $0x0,%edx
  366b75:	f7 75 e0             	divl   -0x20(%ebp)
  366b78:	83 ec 04             	sub    $0x4,%esp
  366b7b:	6a 00                	push   $0x0
  366b7d:	50                   	push   %eax
  366b7e:	ff 75 08             	pushl  0x8(%ebp)
  366b81:	e8 ae 06 00 00       	call   367234 <bmap>
  366b86:	83 c4 10             	add    $0x10,%esp
  366b89:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  366b8c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  366b90:	75 0d                	jne    366b9f <minix_emtry_dir+0x1b9>
  366b92:	8b 55 f4             	mov    -0xc(%ebp),%edx
  366b95:	8b 45 e0             	mov    -0x20(%ebp),%eax
  366b98:	01 d0                	add    %edx,%eax
  366b9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  366b9d:	eb 6f                	jmp    366c0e <minix_emtry_dir+0x228>
  366b9f:	83 ec 04             	sub    $0x4,%esp
  366ba2:	ff 75 d4             	pushl  -0x2c(%ebp)
  366ba5:	ff 75 d8             	pushl  -0x28(%ebp)
  366ba8:	ff 75 ec             	pushl  -0x14(%ebp)
  366bab:	e8 f0 61 00 00       	call   36cda0 <sb_bread>
  366bb0:	83 c4 10             	add    $0x10,%esp
  366bb3:	85 c0                	test   %eax,%eax
  366bb5:	74 17                	je     366bce <minix_emtry_dir+0x1e8>
  366bb7:	83 ec 08             	sub    $0x8,%esp
  366bba:	6a 00                	push   $0x0
  366bbc:	ff 75 d8             	pushl  -0x28(%ebp)
  366bbf:	e8 db 4c 00 00       	call   36b89f <kfree_s>
  366bc4:	83 c4 10             	add    $0x10,%esp
  366bc7:	b8 00 00 00 00       	mov    $0x0,%eax
  366bcc:	eb 61                	jmp    366c2f <minix_emtry_dir+0x249>
  366bce:	8b 45 d8             	mov    -0x28(%ebp),%eax
  366bd1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  366bd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  366bd7:	0f b7 00             	movzwl (%eax),%eax
  366bda:	66 85 c0             	test   %ax,%ax
  366bdd:	74 17                	je     366bf6 <minix_emtry_dir+0x210>
  366bdf:	83 ec 08             	sub    $0x8,%esp
  366be2:	6a 00                	push   $0x0
  366be4:	ff 75 d8             	pushl  -0x28(%ebp)
  366be7:	e8 b3 4c 00 00       	call   36b89f <kfree_s>
  366bec:	83 c4 10             	add    $0x10,%esp
  366bef:	b8 00 00 00 00       	mov    $0x0,%eax
  366bf4:	eb 39                	jmp    366c2f <minix_emtry_dir+0x249>
  366bf6:	83 ec 08             	sub    $0x8,%esp
  366bf9:	ff 75 e8             	pushl  -0x18(%ebp)
  366bfc:	ff 75 f0             	pushl  -0x10(%ebp)
  366bff:	e8 3a f1 ff ff       	call   365d3e <minix_next_entry>
  366c04:	83 c4 10             	add    $0x10,%esp
  366c07:	89 45 f0             	mov    %eax,-0x10(%ebp)
  366c0a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  366c0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  366c11:	3b 45 dc             	cmp    -0x24(%ebp),%eax
  366c14:	0f 8c 43 ff ff ff    	jl     366b5d <minix_emtry_dir+0x177>
  366c1a:	83 ec 08             	sub    $0x8,%esp
  366c1d:	6a 00                	push   $0x0
  366c1f:	ff 75 d8             	pushl  -0x28(%ebp)
  366c22:	e8 78 4c 00 00       	call   36b89f <kfree_s>
  366c27:	83 c4 10             	add    $0x10,%esp
  366c2a:	b8 01 00 00 00       	mov    $0x1,%eax
  366c2f:	c9                   	leave  
  366c30:	c3                   	ret    

00366c31 <minix_rmdir>:
  366c31:	55                   	push   %ebp
  366c32:	89 e5                	mov    %esp,%ebp
  366c34:	83 ec 28             	sub    $0x28,%esp
  366c37:	8d 45 e0             	lea    -0x20(%ebp),%eax
  366c3a:	50                   	push   %eax
  366c3b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  366c3e:	50                   	push   %eax
  366c3f:	ff 75 0c             	pushl  0xc(%ebp)
  366c42:	ff 75 08             	pushl  0x8(%ebp)
  366c45:	e8 de f6 ff ff       	call   366328 <minix_dir_namei>
  366c4a:	83 c4 10             	add    $0x10,%esp
  366c4d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  366c50:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  366c54:	75 0a                	jne    366c60 <minix_rmdir+0x2f>
  366c56:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  366c5b:	e9 93 01 00 00       	jmp    366df3 <minix_rmdir+0x1c2>
  366c60:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  366c63:	85 c0                	test   %eax,%eax
  366c65:	75 0a                	jne    366c71 <minix_rmdir+0x40>
  366c67:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  366c6c:	e9 82 01 00 00       	jmp    366df3 <minix_rmdir+0x1c2>
  366c71:	83 ec 08             	sub    $0x8,%esp
  366c74:	6a 02                	push   $0x2
  366c76:	ff 75 f4             	pushl  -0xc(%ebp)
  366c79:	e8 d4 f0 ff ff       	call   365d52 <permission>
  366c7e:	83 c4 10             	add    $0x10,%esp
  366c81:	83 f0 01             	xor    $0x1,%eax
  366c84:	84 c0                	test   %al,%al
  366c86:	74 0a                	je     366c92 <minix_rmdir+0x61>
  366c88:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  366c8d:	e9 61 01 00 00       	jmp    366df3 <minix_rmdir+0x1c2>
  366c92:	83 ec 0c             	sub    $0xc,%esp
  366c95:	ff 75 f4             	pushl  -0xc(%ebp)
  366c98:	e8 b1 ef ff ff       	call   365c4e <inode_sb>
  366c9d:	83 c4 10             	add    $0x10,%esp
  366ca0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  366ca3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  366ca6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  366ca9:	83 ec 0c             	sub    $0xc,%esp
  366cac:	8d 4d dc             	lea    -0x24(%ebp),%ecx
  366caf:	51                   	push   %ecx
  366cb0:	8d 4d d8             	lea    -0x28(%ebp),%ecx
  366cb3:	51                   	push   %ecx
  366cb4:	52                   	push   %edx
  366cb5:	50                   	push   %eax
  366cb6:	ff 75 f4             	pushl  -0xc(%ebp)
  366cb9:	e8 dd f0 ff ff       	call   365d9b <minix_find_entry>
  366cbe:	83 c4 20             	add    $0x20,%esp
  366cc1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  366cc4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  366cc8:	75 0a                	jne    366cd4 <minix_rmdir+0xa3>
  366cca:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  366ccf:	e9 1f 01 00 00       	jmp    366df3 <minix_rmdir+0x1c2>
  366cd4:	8b 45 d8             	mov    -0x28(%ebp),%eax
  366cd7:	0f b7 00             	movzwl (%eax),%eax
  366cda:	0f b7 c0             	movzwl %ax,%eax
  366cdd:	83 ec 08             	sub    $0x8,%esp
  366ce0:	50                   	push   %eax
  366ce1:	ff 75 f0             	pushl  -0x10(%ebp)
  366ce4:	e8 da 0f 00 00       	call   367cc3 <minix_find_inode>
  366ce9:	83 c4 10             	add    $0x10,%esp
  366cec:	89 45 e8             	mov    %eax,-0x18(%ebp)
  366cef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  366cf2:	8b 00                	mov    (%eax),%eax
  366cf4:	25 00 02 00 00       	and    $0x200,%eax
  366cf9:	85 c0                	test   %eax,%eax
  366cfb:	74 0a                	je     366d07 <minix_rmdir+0xd6>
  366cfd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  366d02:	e9 ec 00 00 00       	jmp    366df3 <minix_rmdir+0x1c2>
  366d07:	8b 45 e8             	mov    -0x18(%ebp),%eax
  366d0a:	8b 50 14             	mov    0x14(%eax),%edx
  366d0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  366d10:	8b 40 14             	mov    0x14(%eax),%eax
  366d13:	39 c2                	cmp    %eax,%edx
  366d15:	74 0a                	je     366d21 <minix_rmdir+0xf0>
  366d17:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  366d1c:	e9 d2 00 00 00       	jmp    366df3 <minix_rmdir+0x1c2>
  366d21:	8b 45 e8             	mov    -0x18(%ebp),%eax
  366d24:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  366d27:	75 0a                	jne    366d33 <minix_rmdir+0x102>
  366d29:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  366d2e:	e9 c0 00 00 00       	jmp    366df3 <minix_rmdir+0x1c2>
  366d33:	8b 45 e8             	mov    -0x18(%ebp),%eax
  366d36:	8b 00                	mov    (%eax),%eax
  366d38:	25 00 f0 00 00       	and    $0xf000,%eax
  366d3d:	3d 00 40 00 00       	cmp    $0x4000,%eax
  366d42:	74 0a                	je     366d4e <minix_rmdir+0x11d>
  366d44:	b8 ec ff ff ff       	mov    $0xffffffec,%eax
  366d49:	e9 a5 00 00 00       	jmp    366df3 <minix_rmdir+0x1c2>
  366d4e:	83 ec 0c             	sub    $0xc,%esp
  366d51:	ff 75 e8             	pushl  -0x18(%ebp)
  366d54:	e8 8d fc ff ff       	call   3669e6 <minix_emtry_dir>
  366d59:	83 c4 10             	add    $0x10,%esp
  366d5c:	83 f0 01             	xor    $0x1,%eax
  366d5f:	84 c0                	test   %al,%al
  366d61:	74 0a                	je     366d6d <minix_rmdir+0x13c>
  366d63:	b8 d9 ff ff ff       	mov    $0xffffffd9,%eax
  366d68:	e9 86 00 00 00       	jmp    366df3 <minix_rmdir+0x1c2>
  366d6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  366d70:	8b 40 48             	mov    0x48(%eax),%eax
  366d73:	83 f8 02             	cmp    $0x2,%eax
  366d76:	74 1c                	je     366d94 <minix_rmdir+0x163>
  366d78:	8b 45 e8             	mov    -0x18(%ebp),%eax
  366d7b:	8b 40 48             	mov    0x48(%eax),%eax
  366d7e:	83 ec 04             	sub    $0x4,%esp
  366d81:	50                   	push   %eax
  366d82:	68 f9 df 36 00       	push   $0x36dff9
  366d87:	68 30 e0 36 00       	push   $0x36e030
  366d8c:	e8 f7 22 00 00       	call   369088 <printk>
  366d91:	83 c4 10             	add    $0x10,%esp
  366d94:	83 ec 0c             	sub    $0xc,%esp
  366d97:	ff 75 e8             	pushl  -0x18(%ebp)
  366d9a:	e8 b2 1f 00 00       	call   368d51 <minix_free_inode>
  366d9f:	83 c4 10             	add    $0x10,%esp
  366da2:	8b 45 d8             	mov    -0x28(%ebp),%eax
  366da5:	66 c7 00 00 00       	movw   $0x0,(%eax)
  366daa:	83 ec 0c             	sub    $0xc,%esp
  366dad:	6a 00                	push   $0x0
  366daf:	e8 35 ee ff ff       	call   365be9 <time>
  366db4:	83 c4 10             	add    $0x10,%esp
  366db7:	89 c2                	mov    %eax,%edx
  366db9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  366dbc:	89 50 30             	mov    %edx,0x30(%eax)
  366dbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  366dc2:	8b 50 30             	mov    0x30(%eax),%edx
  366dc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  366dc8:	89 50 38             	mov    %edx,0x38(%eax)
  366dcb:	8b 45 dc             	mov    -0x24(%ebp),%eax
  366dce:	83 ec 04             	sub    $0x4,%esp
  366dd1:	50                   	push   %eax
  366dd2:	ff 75 ec             	pushl  -0x14(%ebp)
  366dd5:	ff 75 f4             	pushl  -0xc(%ebp)
  366dd8:	e8 e5 e7 ff ff       	call   3655c2 <inode_bwrite>
  366ddd:	83 c4 10             	add    $0x10,%esp
  366de0:	83 ec 0c             	sub    $0xc,%esp
  366de3:	ff 75 f4             	pushl  -0xc(%ebp)
  366de6:	e8 89 0a 00 00       	call   367874 <minix_sync_inode>
  366deb:	83 c4 10             	add    $0x10,%esp
  366dee:	b8 00 00 00 00       	mov    $0x0,%eax
  366df3:	c9                   	leave  
  366df4:	c3                   	ret    

00366df5 <minix_unlink>:
  366df5:	55                   	push   %ebp
  366df6:	89 e5                	mov    %esp,%ebp
  366df8:	53                   	push   %ebx
  366df9:	83 ec 24             	sub    $0x24,%esp
  366dfc:	8d 45 e0             	lea    -0x20(%ebp),%eax
  366dff:	50                   	push   %eax
  366e00:	8d 45 e8             	lea    -0x18(%ebp),%eax
  366e03:	50                   	push   %eax
  366e04:	ff 75 0c             	pushl  0xc(%ebp)
  366e07:	ff 75 08             	pushl  0x8(%ebp)
  366e0a:	e8 19 f5 ff ff       	call   366328 <minix_dir_namei>
  366e0f:	83 c4 10             	add    $0x10,%esp
  366e12:	89 45 f4             	mov    %eax,-0xc(%ebp)
  366e15:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  366e19:	75 0a                	jne    366e25 <minix_unlink+0x30>
  366e1b:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  366e20:	e9 a0 01 00 00       	jmp    366fc5 <minix_unlink+0x1d0>
  366e25:	8b 45 e8             	mov    -0x18(%ebp),%eax
  366e28:	85 c0                	test   %eax,%eax
  366e2a:	75 0a                	jne    366e36 <minix_unlink+0x41>
  366e2c:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  366e31:	e9 8f 01 00 00       	jmp    366fc5 <minix_unlink+0x1d0>
  366e36:	83 ec 08             	sub    $0x8,%esp
  366e39:	6a 02                	push   $0x2
  366e3b:	ff 75 f4             	pushl  -0xc(%ebp)
  366e3e:	e8 0f ef ff ff       	call   365d52 <permission>
  366e43:	83 c4 10             	add    $0x10,%esp
  366e46:	83 f0 01             	xor    $0x1,%eax
  366e49:	84 c0                	test   %al,%al
  366e4b:	74 0a                	je     366e57 <minix_unlink+0x62>
  366e4d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  366e52:	e9 6e 01 00 00       	jmp    366fc5 <minix_unlink+0x1d0>
  366e57:	8b 55 e8             	mov    -0x18(%ebp),%edx
  366e5a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  366e5d:	83 ec 0c             	sub    $0xc,%esp
  366e60:	8d 4d e4             	lea    -0x1c(%ebp),%ecx
  366e63:	51                   	push   %ecx
  366e64:	8d 4d dc             	lea    -0x24(%ebp),%ecx
  366e67:	51                   	push   %ecx
  366e68:	52                   	push   %edx
  366e69:	50                   	push   %eax
  366e6a:	ff 75 f4             	pushl  -0xc(%ebp)
  366e6d:	e8 29 ef ff ff       	call   365d9b <minix_find_entry>
  366e72:	83 c4 20             	add    $0x20,%esp
  366e75:	89 45 f0             	mov    %eax,-0x10(%ebp)
  366e78:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  366e7c:	75 0a                	jne    366e88 <minix_unlink+0x93>
  366e7e:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  366e83:	e9 3d 01 00 00       	jmp    366fc5 <minix_unlink+0x1d0>
  366e88:	8b 45 dc             	mov    -0x24(%ebp),%eax
  366e8b:	0f b7 00             	movzwl (%eax),%eax
  366e8e:	0f b7 d8             	movzwl %ax,%ebx
  366e91:	83 ec 0c             	sub    $0xc,%esp
  366e94:	ff 75 f4             	pushl  -0xc(%ebp)
  366e97:	e8 b2 ed ff ff       	call   365c4e <inode_sb>
  366e9c:	83 c4 10             	add    $0x10,%esp
  366e9f:	83 ec 08             	sub    $0x8,%esp
  366ea2:	53                   	push   %ebx
  366ea3:	50                   	push   %eax
  366ea4:	e8 1a 0e 00 00       	call   367cc3 <minix_find_inode>
  366ea9:	83 c4 10             	add    $0x10,%esp
  366eac:	89 45 ec             	mov    %eax,-0x14(%ebp)
  366eaf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  366eb3:	75 1a                	jne    366ecf <minix_unlink+0xda>
  366eb5:	83 ec 08             	sub    $0x8,%esp
  366eb8:	6a 00                	push   $0x0
  366eba:	ff 75 f0             	pushl  -0x10(%ebp)
  366ebd:	e8 dd 49 00 00       	call   36b89f <kfree_s>
  366ec2:	83 c4 10             	add    $0x10,%esp
  366ec5:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
  366eca:	e9 f6 00 00 00       	jmp    366fc5 <minix_unlink+0x1d0>
  366ecf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  366ed2:	8b 00                	mov    (%eax),%eax
  366ed4:	25 00 02 00 00       	and    $0x200,%eax
  366ed9:	85 c0                	test   %eax,%eax
  366edb:	74 1a                	je     366ef7 <minix_unlink+0x102>
  366edd:	83 ec 08             	sub    $0x8,%esp
  366ee0:	6a 00                	push   $0x0
  366ee2:	ff 75 f0             	pushl  -0x10(%ebp)
  366ee5:	e8 b5 49 00 00       	call   36b89f <kfree_s>
  366eea:	83 c4 10             	add    $0x10,%esp
  366eed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  366ef2:	e9 ce 00 00 00       	jmp    366fc5 <minix_unlink+0x1d0>
  366ef7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366efa:	8b 00                	mov    (%eax),%eax
  366efc:	25 00 f0 00 00       	and    $0xf000,%eax
  366f01:	3d 00 40 00 00       	cmp    $0x4000,%eax
  366f06:	75 1a                	jne    366f22 <minix_unlink+0x12d>
  366f08:	83 ec 08             	sub    $0x8,%esp
  366f0b:	6a 00                	push   $0x0
  366f0d:	ff 75 f0             	pushl  -0x10(%ebp)
  366f10:	e8 8a 49 00 00       	call   36b89f <kfree_s>
  366f15:	83 c4 10             	add    $0x10,%esp
  366f18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  366f1d:	e9 a3 00 00 00       	jmp    366fc5 <minix_unlink+0x1d0>
  366f22:	83 ec 0c             	sub    $0xc,%esp
  366f25:	ff 75 ec             	pushl  -0x14(%ebp)
  366f28:	e8 16 ed ff ff       	call   365c43 <inode_info>
  366f2d:	83 c4 10             	add    $0x10,%esp
  366f30:	89 45 ec             	mov    %eax,-0x14(%ebp)
  366f33:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366f36:	8b 40 48             	mov    0x48(%eax),%eax
  366f39:	85 c0                	test   %eax,%eax
  366f3b:	75 34                	jne    366f71 <minix_unlink+0x17c>
  366f3d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366f40:	8b 48 48             	mov    0x48(%eax),%ecx
  366f43:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366f46:	8b 50 10             	mov    0x10(%eax),%edx
  366f49:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366f4c:	8b 40 14             	mov    0x14(%eax),%eax
  366f4f:	83 ec 0c             	sub    $0xc,%esp
  366f52:	51                   	push   %ecx
  366f53:	52                   	push   %edx
  366f54:	50                   	push   %eax
  366f55:	68 f9 df 36 00       	push   $0x36dff9
  366f5a:	68 64 e0 36 00       	push   $0x36e064
  366f5f:	e8 24 21 00 00       	call   369088 <printk>
  366f64:	83 c4 20             	add    $0x20,%esp
  366f67:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366f6a:	c7 40 48 01 00 00 00 	movl   $0x1,0x48(%eax)
  366f71:	8b 45 dc             	mov    -0x24(%ebp),%eax
  366f74:	66 c7 00 00 00       	movw   $0x0,(%eax)
  366f79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  366f7c:	83 ec 04             	sub    $0x4,%esp
  366f7f:	50                   	push   %eax
  366f80:	ff 75 f0             	pushl  -0x10(%ebp)
  366f83:	ff 75 f4             	pushl  -0xc(%ebp)
  366f86:	e8 37 e6 ff ff       	call   3655c2 <inode_bwrite>
  366f8b:	83 c4 10             	add    $0x10,%esp
  366f8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366f91:	8b 40 48             	mov    0x48(%eax),%eax
  366f94:	8d 50 ff             	lea    -0x1(%eax),%edx
  366f97:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366f9a:	89 50 48             	mov    %edx,0x48(%eax)
  366f9d:	83 ec 0c             	sub    $0xc,%esp
  366fa0:	6a 00                	push   $0x0
  366fa2:	e8 42 ec ff ff       	call   365be9 <time>
  366fa7:	83 c4 10             	add    $0x10,%esp
  366faa:	89 c2                	mov    %eax,%edx
  366fac:	8b 45 ec             	mov    -0x14(%ebp),%eax
  366faf:	89 50 38             	mov    %edx,0x38(%eax)
  366fb2:	83 ec 0c             	sub    $0xc,%esp
  366fb5:	ff 75 ec             	pushl  -0x14(%ebp)
  366fb8:	e8 94 1d 00 00       	call   368d51 <minix_free_inode>
  366fbd:	83 c4 10             	add    $0x10,%esp
  366fc0:	b8 00 00 00 00       	mov    $0x0,%eax
  366fc5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  366fc8:	c9                   	leave  
  366fc9:	c3                   	ret    

00366fca <time>:
  366fca:	55                   	push   %ebp
  366fcb:	89 e5                	mov    %esp,%ebp
  366fcd:	57                   	push   %edi
  366fce:	56                   	push   %esi
  366fcf:	53                   	push   %ebx
  366fd0:	83 ec 10             	sub    $0x10,%esp
  366fd3:	b8 01 00 00 00       	mov    $0x1,%eax
  366fd8:	bb 07 00 00 00       	mov    $0x7,%ebx
  366fdd:	b9 10 00 00 00       	mov    $0x10,%ecx
  366fe2:	8b 55 08             	mov    0x8(%ebp),%edx
  366fe5:	be 00 00 00 00       	mov    $0x0,%esi
  366fea:	bf 00 00 00 00       	mov    $0x0,%edi
  366fef:	cd 80                	int    $0x80
  366ff1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  366ff4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  366ff7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  366ffa:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  366ffe:	74 0e                	je     36700e <time+0x44>
  367000:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  367004:	7e 08                	jle    36700e <time+0x44>
  367006:	8b 45 08             	mov    0x8(%ebp),%eax
  367009:	8b 55 ec             	mov    -0x14(%ebp),%edx
  36700c:	89 10                	mov    %edx,(%eax)
  36700e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367011:	83 c4 10             	add    $0x10,%esp
  367014:	5b                   	pop    %ebx
  367015:	5e                   	pop    %esi
  367016:	5f                   	pop    %edi
  367017:	5d                   	pop    %ebp
  367018:	c3                   	ret    

00367019 <INIT_LIST_HEAD>:
  367019:	55                   	push   %ebp
  36701a:	89 e5                	mov    %esp,%ebp
  36701c:	8b 45 08             	mov    0x8(%ebp),%eax
  36701f:	8b 55 08             	mov    0x8(%ebp),%edx
  367022:	89 10                	mov    %edx,(%eax)
  367024:	8b 45 08             	mov    0x8(%ebp),%eax
  367027:	8b 55 08             	mov    0x8(%ebp),%edx
  36702a:	89 50 04             	mov    %edx,0x4(%eax)
  36702d:	5d                   	pop    %ebp
  36702e:	c3                   	ret    

0036702f <__list_add>:
  36702f:	55                   	push   %ebp
  367030:	89 e5                	mov    %esp,%ebp
  367032:	8b 45 10             	mov    0x10(%ebp),%eax
  367035:	8b 55 08             	mov    0x8(%ebp),%edx
  367038:	89 50 04             	mov    %edx,0x4(%eax)
  36703b:	8b 45 08             	mov    0x8(%ebp),%eax
  36703e:	8b 55 10             	mov    0x10(%ebp),%edx
  367041:	89 10                	mov    %edx,(%eax)
  367043:	8b 45 08             	mov    0x8(%ebp),%eax
  367046:	8b 55 0c             	mov    0xc(%ebp),%edx
  367049:	89 50 04             	mov    %edx,0x4(%eax)
  36704c:	8b 45 0c             	mov    0xc(%ebp),%eax
  36704f:	8b 55 08             	mov    0x8(%ebp),%edx
  367052:	89 10                	mov    %edx,(%eax)
  367054:	5d                   	pop    %ebp
  367055:	c3                   	ret    

00367056 <list_add>:
  367056:	55                   	push   %ebp
  367057:	89 e5                	mov    %esp,%ebp
  367059:	8b 45 0c             	mov    0xc(%ebp),%eax
  36705c:	8b 00                	mov    (%eax),%eax
  36705e:	50                   	push   %eax
  36705f:	ff 75 0c             	pushl  0xc(%ebp)
  367062:	ff 75 08             	pushl  0x8(%ebp)
  367065:	e8 c5 ff ff ff       	call   36702f <__list_add>
  36706a:	83 c4 0c             	add    $0xc,%esp
  36706d:	c9                   	leave  
  36706e:	c3                   	ret    

0036706f <sb_info>:
  36706f:	55                   	push   %ebp
  367070:	89 e5                	mov    %esp,%ebp
  367072:	8b 45 08             	mov    0x8(%ebp),%eax
  367075:	83 c0 70             	add    $0x70,%eax
  367078:	5d                   	pop    %ebp
  367079:	c3                   	ret    

0036707a <inode_info>:
  36707a:	55                   	push   %ebp
  36707b:	89 e5                	mov    %esp,%ebp
  36707d:	8b 45 08             	mov    0x8(%ebp),%eax
  367080:	83 c0 60             	add    $0x60,%eax
  367083:	5d                   	pop    %ebp
  367084:	c3                   	ret    

00367085 <inode_sb>:
  367085:	55                   	push   %ebp
  367086:	89 e5                	mov    %esp,%ebp
  367088:	8b 45 08             	mov    0x8(%ebp),%eax
  36708b:	8b 40 1c             	mov    0x1c(%eax),%eax
  36708e:	5d                   	pop    %ebp
  36708f:	c3                   	ret    

00367090 <strcpy>:
  367090:	55                   	push   %ebp
  367091:	89 e5                	mov    %esp,%ebp
  367093:	57                   	push   %edi
  367094:	56                   	push   %esi
  367095:	8b 55 0c             	mov    0xc(%ebp),%edx
  367098:	8b 4d 08             	mov    0x8(%ebp),%ecx
  36709b:	89 d6                	mov    %edx,%esi
  36709d:	89 cf                	mov    %ecx,%edi
  36709f:	fc                   	cld    
  3670a0:	ac                   	lods   %ds:(%esi),%al
  3670a1:	aa                   	stos   %al,%es:(%edi)
  3670a2:	84 c0                	test   %al,%al
  3670a4:	75 fa                	jne    3670a0 <strcpy+0x10>
  3670a6:	8b 45 08             	mov    0x8(%ebp),%eax
  3670a9:	5e                   	pop    %esi
  3670aa:	5f                   	pop    %edi
  3670ab:	5d                   	pop    %ebp
  3670ac:	c3                   	ret    

003670ad <memset>:
  3670ad:	55                   	push   %ebp
  3670ae:	89 e5                	mov    %esp,%ebp
  3670b0:	57                   	push   %edi
  3670b1:	8b 45 0c             	mov    0xc(%ebp),%eax
  3670b4:	8b 55 08             	mov    0x8(%ebp),%edx
  3670b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  3670ba:	89 d7                	mov    %edx,%edi
  3670bc:	fc                   	cld    
  3670bd:	f3 aa                	rep stos %al,%es:(%edi)
  3670bf:	8b 45 08             	mov    0x8(%ebp),%eax
  3670c2:	5f                   	pop    %edi
  3670c3:	5d                   	pop    %ebp
  3670c4:	c3                   	ret    

003670c5 <__set_bit>:
  3670c5:	55                   	push   %ebp
  3670c6:	89 e5                	mov    %esp,%ebp
  3670c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  3670cb:	8b 55 08             	mov    0x8(%ebp),%edx
  3670ce:	0f ab 10             	bts    %edx,(%eax)
  3670d1:	5d                   	pop    %ebp
  3670d2:	c3                   	ret    

003670d3 <_get>:
  3670d3:	55                   	push   %ebp
  3670d4:	89 e5                	mov    %esp,%ebp
  3670d6:	8b 45 08             	mov    0x8(%ebp),%eax
  3670d9:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  3670dd:	66 83 f8 01          	cmp    $0x1,%ax
  3670e1:	75 13                	jne    3670f6 <_get+0x23>
  3670e3:	8b 45 10             	mov    0x10(%ebp),%eax
  3670e6:	8d 14 00             	lea    (%eax,%eax,1),%edx
  3670e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  3670ec:	01 d0                	add    %edx,%eax
  3670ee:	0f b7 00             	movzwl (%eax),%eax
  3670f1:	0f b7 c0             	movzwl %ax,%eax
  3670f4:	eb 11                	jmp    367107 <_get+0x34>
  3670f6:	8b 45 10             	mov    0x10(%ebp),%eax
  3670f9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  367100:	8b 45 0c             	mov    0xc(%ebp),%eax
  367103:	01 d0                	add    %edx,%eax
  367105:	8b 00                	mov    (%eax),%eax
  367107:	5d                   	pop    %ebp
  367108:	c3                   	ret    

00367109 <_set>:
  367109:	55                   	push   %ebp
  36710a:	89 e5                	mov    %esp,%ebp
  36710c:	8b 45 08             	mov    0x8(%ebp),%eax
  36710f:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  367113:	66 83 f8 01          	cmp    $0x1,%ax
  367117:	75 13                	jne    36712c <_set+0x23>
  367119:	8b 45 10             	mov    0x10(%ebp),%eax
  36711c:	8d 14 00             	lea    (%eax,%eax,1),%edx
  36711f:	8b 45 0c             	mov    0xc(%ebp),%eax
  367122:	01 d0                	add    %edx,%eax
  367124:	8b 55 14             	mov    0x14(%ebp),%edx
  367127:	66 89 10             	mov    %dx,(%eax)
  36712a:	eb 21                	jmp    36714d <_set+0x44>
  36712c:	8b 45 08             	mov    0x8(%ebp),%eax
  36712f:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  367133:	66 83 f8 02          	cmp    $0x2,%ax
  367137:	75 14                	jne    36714d <_set+0x44>
  367139:	8b 45 10             	mov    0x10(%ebp),%eax
  36713c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  367143:	8b 45 0c             	mov    0xc(%ebp),%eax
  367146:	01 c2                	add    %eax,%edx
  367148:	8b 45 14             	mov    0x14(%ebp),%eax
  36714b:	89 02                	mov    %eax,(%edx)
  36714d:	5d                   	pop    %ebp
  36714e:	c3                   	ret    

0036714f <__indir_map>:
  36714f:	55                   	push   %ebp
  367150:	89 e5                	mov    %esp,%ebp
  367152:	83 ec 28             	sub    $0x28,%esp
  367155:	8b 45 14             	mov    0x14(%ebp),%eax
  367158:	88 45 e4             	mov    %al,-0x1c(%ebp)
  36715b:	ff 75 08             	pushl  0x8(%ebp)
  36715e:	e8 22 ff ff ff       	call   367085 <inode_sb>
  367163:	83 c4 04             	add    $0x4,%esp
  367166:	89 45 f0             	mov    %eax,-0x10(%ebp)
  367169:	ff 75 f0             	pushl  -0x10(%ebp)
  36716c:	e8 fe fe ff ff       	call   36706f <sb_info>
  367171:	83 c4 04             	add    $0x4,%esp
  367174:	89 45 ec             	mov    %eax,-0x14(%ebp)
  367177:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36717e:	83 ec 0c             	sub    $0xc,%esp
  367181:	68 00 04 00 00       	push   $0x400
  367186:	e8 a8 45 00 00       	call   36b733 <kalloc>
  36718b:	83 c4 10             	add    $0x10,%esp
  36718e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  367191:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  367195:	75 0a                	jne    3671a1 <__indir_map+0x52>
  367197:	b8 00 00 00 00       	mov    $0x0,%eax
  36719c:	e9 91 00 00 00       	jmp    367232 <__indir_map+0xe3>
  3671a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  3671a4:	83 ec 04             	sub    $0x4,%esp
  3671a7:	50                   	push   %eax
  3671a8:	ff 75 e8             	pushl  -0x18(%ebp)
  3671ab:	ff 75 f0             	pushl  -0x10(%ebp)
  3671ae:	e8 ed 5b 00 00       	call   36cda0 <sb_bread>
  3671b3:	83 c4 10             	add    $0x10,%esp
  3671b6:	85 c0                	test   %eax,%eax
  3671b8:	74 02                	je     3671bc <__indir_map+0x6d>
  3671ba:	eb 63                	jmp    36721f <__indir_map+0xd0>
  3671bc:	83 ec 04             	sub    $0x4,%esp
  3671bf:	ff 75 10             	pushl  0x10(%ebp)
  3671c2:	ff 75 e8             	pushl  -0x18(%ebp)
  3671c5:	ff 75 ec             	pushl  -0x14(%ebp)
  3671c8:	e8 06 ff ff ff       	call   3670d3 <_get>
  3671cd:	83 c4 10             	add    $0x10,%esp
  3671d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3671d3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3671d7:	75 46                	jne    36721f <__indir_map+0xd0>
  3671d9:	80 7d e4 00          	cmpb   $0x0,-0x1c(%ebp)
  3671dd:	74 40                	je     36721f <__indir_map+0xd0>
  3671df:	83 ec 0c             	sub    $0xc,%esp
  3671e2:	ff 75 08             	pushl  0x8(%ebp)
  3671e5:	e8 e0 19 00 00       	call   368bca <minix_new_block>
  3671ea:	83 c4 10             	add    $0x10,%esp
  3671ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3671f0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3671f4:	74 29                	je     36721f <__indir_map+0xd0>
  3671f6:	ff 75 f4             	pushl  -0xc(%ebp)
  3671f9:	ff 75 10             	pushl  0x10(%ebp)
  3671fc:	ff 75 e8             	pushl  -0x18(%ebp)
  3671ff:	ff 75 ec             	pushl  -0x14(%ebp)
  367202:	e8 02 ff ff ff       	call   367109 <_set>
  367207:	83 c4 10             	add    $0x10,%esp
  36720a:	8b 45 0c             	mov    0xc(%ebp),%eax
  36720d:	83 ec 04             	sub    $0x4,%esp
  367210:	50                   	push   %eax
  367211:	ff 75 e8             	pushl  -0x18(%ebp)
  367214:	ff 75 f0             	pushl  -0x10(%ebp)
  367217:	e8 a4 5b 00 00       	call   36cdc0 <sb_bwrite>
  36721c:	83 c4 10             	add    $0x10,%esp
  36721f:	83 ec 08             	sub    $0x8,%esp
  367222:	6a 00                	push   $0x0
  367224:	ff 75 e8             	pushl  -0x18(%ebp)
  367227:	e8 73 46 00 00       	call   36b89f <kfree_s>
  36722c:	83 c4 10             	add    $0x10,%esp
  36722f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  367232:	c9                   	leave  
  367233:	c3                   	ret    

00367234 <bmap>:
  367234:	55                   	push   %ebp
  367235:	89 e5                	mov    %esp,%ebp
  367237:	53                   	push   %ebx
  367238:	83 ec 34             	sub    $0x34,%esp
  36723b:	8b 45 10             	mov    0x10(%ebp),%eax
  36723e:	88 45 d4             	mov    %al,-0x2c(%ebp)
  367241:	ff 75 08             	pushl  0x8(%ebp)
  367244:	e8 3c fe ff ff       	call   367085 <inode_sb>
  367249:	83 c4 04             	add    $0x4,%esp
  36724c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36724f:	ff 75 f4             	pushl  -0xc(%ebp)
  367252:	e8 18 fe ff ff       	call   36706f <sb_info>
  367257:	83 c4 04             	add    $0x4,%esp
  36725a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36725d:	ff 75 08             	pushl  0x8(%ebp)
  367260:	e8 15 fe ff ff       	call   36707a <inode_info>
  367265:	83 c4 04             	add    $0x4,%esp
  367268:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36726b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36726e:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  367272:	66 83 f8 01          	cmp    $0x1,%ax
  367276:	75 07                	jne    36727f <bmap+0x4b>
  367278:	b8 00 02 00 00       	mov    $0x200,%eax
  36727d:	eb 05                	jmp    367284 <bmap+0x50>
  36727f:	b8 00 01 00 00       	mov    $0x100,%eax
  367284:	89 45 e8             	mov    %eax,-0x18(%ebp)
  367287:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  36728e:	8b 45 08             	mov    0x8(%ebp),%eax
  367291:	8b 40 18             	mov    0x18(%eax),%eax
  367294:	05 ff 03 00 00       	add    $0x3ff,%eax
  367299:	c1 e8 0a             	shr    $0xa,%eax
  36729c:	3b 45 0c             	cmp    0xc(%ebp),%eax
  36729f:	73 0a                	jae    3672ab <bmap+0x77>
  3672a1:	b8 00 00 00 00       	mov    $0x0,%eax
  3672a6:	e9 16 03 00 00       	jmp    3675c1 <bmap+0x38d>
  3672ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3672ae:	8b 40 14             	mov    0x14(%eax),%eax
  3672b1:	3b 45 0c             	cmp    0xc(%ebp),%eax
  3672b4:	76 6a                	jbe    367320 <bmap+0xec>
  3672b6:	80 7d d4 00          	cmpb   $0x0,-0x2c(%ebp)
  3672ba:	74 56                	je     367312 <bmap+0xde>
  3672bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3672bf:	8b 55 0c             	mov    0xc(%ebp),%edx
  3672c2:	8b 04 90             	mov    (%eax,%edx,4),%eax
  3672c5:	85 c0                	test   %eax,%eax
  3672c7:	75 49                	jne    367312 <bmap+0xde>
  3672c9:	83 ec 0c             	sub    $0xc,%esp
  3672cc:	ff 75 08             	pushl  0x8(%ebp)
  3672cf:	e8 f6 18 00 00       	call   368bca <minix_new_block>
  3672d4:	83 c4 10             	add    $0x10,%esp
  3672d7:	89 c1                	mov    %eax,%ecx
  3672d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3672dc:	8b 55 0c             	mov    0xc(%ebp),%edx
  3672df:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  3672e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3672e5:	8b 55 0c             	mov    0xc(%ebp),%edx
  3672e8:	8b 04 90             	mov    (%eax,%edx,4),%eax
  3672eb:	85 c0                	test   %eax,%eax
  3672ed:	74 23                	je     367312 <bmap+0xde>
  3672ef:	83 ec 0c             	sub    $0xc,%esp
  3672f2:	6a 00                	push   $0x0
  3672f4:	e8 d1 fc ff ff       	call   366fca <time>
  3672f9:	83 c4 10             	add    $0x10,%esp
  3672fc:	89 c2                	mov    %eax,%edx
  3672fe:	8b 45 08             	mov    0x8(%ebp),%eax
  367301:	89 50 38             	mov    %edx,0x38(%eax)
  367304:	83 ec 0c             	sub    $0xc,%esp
  367307:	ff 75 08             	pushl  0x8(%ebp)
  36730a:	e8 65 05 00 00       	call   367874 <minix_sync_inode>
  36730f:	83 c4 10             	add    $0x10,%esp
  367312:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367315:	8b 55 0c             	mov    0xc(%ebp),%edx
  367318:	8b 04 90             	mov    (%eax,%edx,4),%eax
  36731b:	e9 a1 02 00 00       	jmp    3675c1 <bmap+0x38d>
  367320:	8b 45 f0             	mov    -0x10(%ebp),%eax
  367323:	8b 40 14             	mov    0x14(%eax),%eax
  367326:	29 45 0c             	sub    %eax,0xc(%ebp)
  367329:	8b 45 0c             	mov    0xc(%ebp),%eax
  36732c:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  36732f:	0f 83 87 00 00 00    	jae    3673bc <bmap+0x188>
  367335:	80 7d d4 00          	cmpb   $0x0,-0x2c(%ebp)
  367339:	74 4d                	je     367388 <bmap+0x154>
  36733b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36733e:	8b 40 1c             	mov    0x1c(%eax),%eax
  367341:	85 c0                	test   %eax,%eax
  367343:	75 43                	jne    367388 <bmap+0x154>
  367345:	83 ec 0c             	sub    $0xc,%esp
  367348:	ff 75 08             	pushl  0x8(%ebp)
  36734b:	e8 7a 18 00 00       	call   368bca <minix_new_block>
  367350:	83 c4 10             	add    $0x10,%esp
  367353:	89 c2                	mov    %eax,%edx
  367355:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367358:	89 50 1c             	mov    %edx,0x1c(%eax)
  36735b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36735e:	8b 40 1c             	mov    0x1c(%eax),%eax
  367361:	85 c0                	test   %eax,%eax
  367363:	74 23                	je     367388 <bmap+0x154>
  367365:	83 ec 0c             	sub    $0xc,%esp
  367368:	6a 00                	push   $0x0
  36736a:	e8 5b fc ff ff       	call   366fca <time>
  36736f:	83 c4 10             	add    $0x10,%esp
  367372:	89 c2                	mov    %eax,%edx
  367374:	8b 45 08             	mov    0x8(%ebp),%eax
  367377:	89 50 38             	mov    %edx,0x38(%eax)
  36737a:	83 ec 0c             	sub    $0xc,%esp
  36737d:	ff 75 08             	pushl  0x8(%ebp)
  367380:	e8 ef 04 00 00       	call   367874 <minix_sync_inode>
  367385:	83 c4 10             	add    $0x10,%esp
  367388:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36738b:	8b 40 1c             	mov    0x1c(%eax),%eax
  36738e:	85 c0                	test   %eax,%eax
  367390:	75 0a                	jne    36739c <bmap+0x168>
  367392:	b8 00 00 00 00       	mov    $0x0,%eax
  367397:	e9 25 02 00 00       	jmp    3675c1 <bmap+0x38d>
  36739c:	0f b6 4d d4          	movzbl -0x2c(%ebp),%ecx
  3673a0:	8b 55 0c             	mov    0xc(%ebp),%edx
  3673a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3673a6:	8b 40 1c             	mov    0x1c(%eax),%eax
  3673a9:	51                   	push   %ecx
  3673aa:	52                   	push   %edx
  3673ab:	50                   	push   %eax
  3673ac:	ff 75 08             	pushl  0x8(%ebp)
  3673af:	e8 9b fd ff ff       	call   36714f <__indir_map>
  3673b4:	83 c4 10             	add    $0x10,%esp
  3673b7:	e9 05 02 00 00       	jmp    3675c1 <bmap+0x38d>
  3673bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3673bf:	29 45 0c             	sub    %eax,0xc(%ebp)
  3673c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3673c5:	0f af 45 e8          	imul   -0x18(%ebp),%eax
  3673c9:	3b 45 0c             	cmp    0xc(%ebp),%eax
  3673cc:	0f 86 c5 00 00 00    	jbe    367497 <bmap+0x263>
  3673d2:	80 7d d4 00          	cmpb   $0x0,-0x2c(%ebp)
  3673d6:	74 4d                	je     367425 <bmap+0x1f1>
  3673d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3673db:	8b 40 20             	mov    0x20(%eax),%eax
  3673de:	85 c0                	test   %eax,%eax
  3673e0:	75 43                	jne    367425 <bmap+0x1f1>
  3673e2:	83 ec 0c             	sub    $0xc,%esp
  3673e5:	ff 75 08             	pushl  0x8(%ebp)
  3673e8:	e8 dd 17 00 00       	call   368bca <minix_new_block>
  3673ed:	83 c4 10             	add    $0x10,%esp
  3673f0:	89 c2                	mov    %eax,%edx
  3673f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3673f5:	89 50 20             	mov    %edx,0x20(%eax)
  3673f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3673fb:	8b 40 20             	mov    0x20(%eax),%eax
  3673fe:	85 c0                	test   %eax,%eax
  367400:	74 23                	je     367425 <bmap+0x1f1>
  367402:	83 ec 0c             	sub    $0xc,%esp
  367405:	6a 00                	push   $0x0
  367407:	e8 be fb ff ff       	call   366fca <time>
  36740c:	83 c4 10             	add    $0x10,%esp
  36740f:	89 c2                	mov    %eax,%edx
  367411:	8b 45 08             	mov    0x8(%ebp),%eax
  367414:	89 50 38             	mov    %edx,0x38(%eax)
  367417:	83 ec 0c             	sub    $0xc,%esp
  36741a:	ff 75 08             	pushl  0x8(%ebp)
  36741d:	e8 52 04 00 00       	call   367874 <minix_sync_inode>
  367422:	83 c4 10             	add    $0x10,%esp
  367425:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367428:	8b 40 20             	mov    0x20(%eax),%eax
  36742b:	85 c0                	test   %eax,%eax
  36742d:	75 0a                	jne    367439 <bmap+0x205>
  36742f:	b8 00 00 00 00       	mov    $0x0,%eax
  367434:	e9 88 01 00 00       	jmp    3675c1 <bmap+0x38d>
  367439:	0f b6 4d d4          	movzbl -0x2c(%ebp),%ecx
  36743d:	8b 45 0c             	mov    0xc(%ebp),%eax
  367440:	ba 00 00 00 00       	mov    $0x0,%edx
  367445:	f7 75 e8             	divl   -0x18(%ebp)
  367448:	89 c2                	mov    %eax,%edx
  36744a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36744d:	8b 40 20             	mov    0x20(%eax),%eax
  367450:	51                   	push   %ecx
  367451:	52                   	push   %edx
  367452:	50                   	push   %eax
  367453:	ff 75 08             	pushl  0x8(%ebp)
  367456:	e8 f4 fc ff ff       	call   36714f <__indir_map>
  36745b:	83 c4 10             	add    $0x10,%esp
  36745e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  367461:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  367465:	75 0a                	jne    367471 <bmap+0x23d>
  367467:	b8 00 00 00 00       	mov    $0x0,%eax
  36746c:	e9 50 01 00 00       	jmp    3675c1 <bmap+0x38d>
  367471:	0f b6 4d d4          	movzbl -0x2c(%ebp),%ecx
  367475:	8b 45 0c             	mov    0xc(%ebp),%eax
  367478:	ba 00 00 00 00       	mov    $0x0,%edx
  36747d:	f7 75 e8             	divl   -0x18(%ebp)
  367480:	89 d0                	mov    %edx,%eax
  367482:	51                   	push   %ecx
  367483:	50                   	push   %eax
  367484:	ff 75 e4             	pushl  -0x1c(%ebp)
  367487:	ff 75 08             	pushl  0x8(%ebp)
  36748a:	e8 c0 fc ff ff       	call   36714f <__indir_map>
  36748f:	83 c4 10             	add    $0x10,%esp
  367492:	e9 2a 01 00 00       	jmp    3675c1 <bmap+0x38d>
  367497:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36749a:	0f af 45 e8          	imul   -0x18(%ebp),%eax
  36749e:	29 45 0c             	sub    %eax,0xc(%ebp)
  3674a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  3674a4:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  3674a8:	66 83 f8 02          	cmp    $0x2,%ax
  3674ac:	0f 85 0a 01 00 00    	jne    3675bc <bmap+0x388>
  3674b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3674b5:	0f af 45 e8          	imul   -0x18(%ebp),%eax
  3674b9:	0f af 45 e8          	imul   -0x18(%ebp),%eax
  3674bd:	3b 45 0c             	cmp    0xc(%ebp),%eax
  3674c0:	0f 86 f6 00 00 00    	jbe    3675bc <bmap+0x388>
  3674c6:	80 7d d4 00          	cmpb   $0x0,-0x2c(%ebp)
  3674ca:	74 4d                	je     367519 <bmap+0x2e5>
  3674cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3674cf:	8b 40 24             	mov    0x24(%eax),%eax
  3674d2:	85 c0                	test   %eax,%eax
  3674d4:	74 43                	je     367519 <bmap+0x2e5>
  3674d6:	83 ec 0c             	sub    $0xc,%esp
  3674d9:	ff 75 08             	pushl  0x8(%ebp)
  3674dc:	e8 e9 16 00 00       	call   368bca <minix_new_block>
  3674e1:	83 c4 10             	add    $0x10,%esp
  3674e4:	89 c2                	mov    %eax,%edx
  3674e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3674e9:	89 50 24             	mov    %edx,0x24(%eax)
  3674ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3674ef:	8b 40 24             	mov    0x24(%eax),%eax
  3674f2:	85 c0                	test   %eax,%eax
  3674f4:	74 23                	je     367519 <bmap+0x2e5>
  3674f6:	83 ec 0c             	sub    $0xc,%esp
  3674f9:	6a 00                	push   $0x0
  3674fb:	e8 ca fa ff ff       	call   366fca <time>
  367500:	83 c4 10             	add    $0x10,%esp
  367503:	89 c2                	mov    %eax,%edx
  367505:	8b 45 08             	mov    0x8(%ebp),%eax
  367508:	89 50 38             	mov    %edx,0x38(%eax)
  36750b:	83 ec 0c             	sub    $0xc,%esp
  36750e:	ff 75 08             	pushl  0x8(%ebp)
  367511:	e8 5e 03 00 00       	call   367874 <minix_sync_inode>
  367516:	83 c4 10             	add    $0x10,%esp
  367519:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36751c:	8b 40 24             	mov    0x24(%eax),%eax
  36751f:	85 c0                	test   %eax,%eax
  367521:	75 0a                	jne    36752d <bmap+0x2f9>
  367523:	b8 00 00 00 00       	mov    $0x0,%eax
  367528:	e9 94 00 00 00       	jmp    3675c1 <bmap+0x38d>
  36752d:	0f b6 4d d4          	movzbl -0x2c(%ebp),%ecx
  367531:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367534:	0f af 45 e8          	imul   -0x18(%ebp),%eax
  367538:	89 c3                	mov    %eax,%ebx
  36753a:	8b 45 0c             	mov    0xc(%ebp),%eax
  36753d:	ba 00 00 00 00       	mov    $0x0,%edx
  367542:	f7 f3                	div    %ebx
  367544:	89 c2                	mov    %eax,%edx
  367546:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367549:	8b 40 24             	mov    0x24(%eax),%eax
  36754c:	51                   	push   %ecx
  36754d:	52                   	push   %edx
  36754e:	50                   	push   %eax
  36754f:	ff 75 08             	pushl  0x8(%ebp)
  367552:	e8 f8 fb ff ff       	call   36714f <__indir_map>
  367557:	83 c4 10             	add    $0x10,%esp
  36755a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36755d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  367561:	75 07                	jne    36756a <bmap+0x336>
  367563:	b8 00 00 00 00       	mov    $0x0,%eax
  367568:	eb 57                	jmp    3675c1 <bmap+0x38d>
  36756a:	0f b6 4d d4          	movzbl -0x2c(%ebp),%ecx
  36756e:	8b 45 0c             	mov    0xc(%ebp),%eax
  367571:	ba 00 00 00 00       	mov    $0x0,%edx
  367576:	f7 75 e8             	divl   -0x18(%ebp)
  367579:	51                   	push   %ecx
  36757a:	50                   	push   %eax
  36757b:	ff 75 e4             	pushl  -0x1c(%ebp)
  36757e:	ff 75 08             	pushl  0x8(%ebp)
  367581:	e8 c9 fb ff ff       	call   36714f <__indir_map>
  367586:	83 c4 10             	add    $0x10,%esp
  367589:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36758c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  367590:	75 07                	jne    367599 <bmap+0x365>
  367592:	b8 00 00 00 00       	mov    $0x0,%eax
  367597:	eb 28                	jmp    3675c1 <bmap+0x38d>
  367599:	0f b6 4d d4          	movzbl -0x2c(%ebp),%ecx
  36759d:	8b 45 0c             	mov    0xc(%ebp),%eax
  3675a0:	ba 00 00 00 00       	mov    $0x0,%edx
  3675a5:	f7 75 e8             	divl   -0x18(%ebp)
  3675a8:	89 d0                	mov    %edx,%eax
  3675aa:	51                   	push   %ecx
  3675ab:	50                   	push   %eax
  3675ac:	ff 75 e4             	pushl  -0x1c(%ebp)
  3675af:	ff 75 08             	pushl  0x8(%ebp)
  3675b2:	e8 98 fb ff ff       	call   36714f <__indir_map>
  3675b7:	83 c4 10             	add    $0x10,%esp
  3675ba:	eb 05                	jmp    3675c1 <bmap+0x38d>
  3675bc:	b8 00 00 00 00       	mov    $0x0,%eax
  3675c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  3675c4:	c9                   	leave  
  3675c5:	c3                   	ret    

003675c6 <minix_special_inode>:
  3675c6:	55                   	push   %ebp
  3675c7:	89 e5                	mov    %esp,%ebp
  3675c9:	83 ec 28             	sub    $0x28,%esp
  3675cc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  3675d0:	74 0c                	je     3675de <minix_special_inode+0x18>
  3675d2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  3675d6:	74 06                	je     3675de <minix_special_inode+0x18>
  3675d8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  3675dc:	75 0a                	jne    3675e8 <minix_special_inode+0x22>
  3675de:	b8 00 00 00 00       	mov    $0x0,%eax
  3675e3:	e9 8a 02 00 00       	jmp    367872 <minix_special_inode+0x2ac>
  3675e8:	83 ec 0c             	sub    $0xc,%esp
  3675eb:	68 8c 00 00 00       	push   $0x8c
  3675f0:	e8 3e 41 00 00       	call   36b733 <kalloc>
  3675f5:	83 c4 10             	add    $0x10,%esp
  3675f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3675fb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  3675ff:	75 0a                	jne    36760b <minix_special_inode+0x45>
  367601:	b8 00 00 00 00       	mov    $0x0,%eax
  367606:	e9 67 02 00 00       	jmp    367872 <minix_special_inode+0x2ac>
  36760b:	83 ec 0c             	sub    $0xc,%esp
  36760e:	ff 75 ec             	pushl  -0x14(%ebp)
  367611:	e8 64 fa ff ff       	call   36707a <inode_info>
  367616:	83 c4 10             	add    $0x10,%esp
  367619:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36761c:	83 ec 0c             	sub    $0xc,%esp
  36761f:	ff 75 08             	pushl  0x8(%ebp)
  367622:	e8 48 fa ff ff       	call   36706f <sb_info>
  367627:	83 c4 10             	add    $0x10,%esp
  36762a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36762d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367630:	8b 55 08             	mov    0x8(%ebp),%edx
  367633:	89 50 1c             	mov    %edx,0x1c(%eax)
  367636:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367639:	8b 55 10             	mov    0x10(%ebp),%edx
  36763c:	89 50 10             	mov    %edx,0x10(%eax)
  36763f:	8b 45 08             	mov    0x8(%ebp),%eax
  367642:	8b 50 04             	mov    0x4(%eax),%edx
  367645:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367648:	89 50 14             	mov    %edx,0x14(%eax)
  36764b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36764e:	8b 55 0c             	mov    0xc(%ebp),%edx
  367651:	89 50 28             	mov    %edx,0x28(%eax)
  367654:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  367657:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  36765b:	66 83 f8 01          	cmp    $0x1,%ax
  36765f:	0f 85 e6 00 00 00    	jne    36774b <minix_special_inode+0x185>
  367665:	8b 45 0c             	mov    0xc(%ebp),%eax
  367668:	89 45 dc             	mov    %eax,-0x24(%ebp)
  36766b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36766e:	0f b7 00             	movzwl (%eax),%eax
  367671:	0f b7 d0             	movzwl %ax,%edx
  367674:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367677:	89 10                	mov    %edx,(%eax)
  367679:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36767c:	0f b7 40 02          	movzwl 0x2(%eax),%eax
  367680:	0f b7 d0             	movzwl %ax,%edx
  367683:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367686:	89 50 04             	mov    %edx,0x4(%eax)
  367689:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36768c:	0f b6 40 0c          	movzbl 0xc(%eax),%eax
  367690:	0f b6 d0             	movzbl %al,%edx
  367693:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367696:	89 50 08             	mov    %edx,0x8(%eax)
  367699:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36769c:	8b 40 08             	mov    0x8(%eax),%eax
  36769f:	89 c2                	mov    %eax,%edx
  3676a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3676a4:	89 50 30             	mov    %edx,0x30(%eax)
  3676a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3676aa:	8b 40 08             	mov    0x8(%eax),%eax
  3676ad:	89 c2                	mov    %eax,%edx
  3676af:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3676b2:	89 50 38             	mov    %edx,0x38(%eax)
  3676b5:	83 ec 0c             	sub    $0xc,%esp
  3676b8:	6a 00                	push   $0x0
  3676ba:	e8 0b f9 ff ff       	call   366fca <time>
  3676bf:	83 c4 10             	add    $0x10,%esp
  3676c2:	89 c2                	mov    %eax,%edx
  3676c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3676c7:	89 50 28             	mov    %edx,0x28(%eax)
  3676ca:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3676cd:	8b 50 04             	mov    0x4(%eax),%edx
  3676d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3676d3:	89 50 18             	mov    %edx,0x18(%eax)
  3676d6:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3676d9:	0f b6 40 0d          	movzbl 0xd(%eax),%eax
  3676dd:	0f b6 d0             	movzbl %al,%edx
  3676e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3676e3:	89 50 48             	mov    %edx,0x48(%eax)
  3676e6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3676ed:	eb 1b                	jmp    36770a <minix_special_inode+0x144>
  3676ef:	8b 45 dc             	mov    -0x24(%ebp),%eax
  3676f2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  3676f5:	0f b7 44 50 0e       	movzwl 0xe(%eax,%edx,2),%eax
  3676fa:	0f b7 c8             	movzwl %ax,%ecx
  3676fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367700:	8b 55 f4             	mov    -0xc(%ebp),%edx
  367703:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  367706:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36770a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36770d:	8b 40 14             	mov    0x14(%eax),%eax
  367710:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  367713:	77 da                	ja     3676ef <minix_special_inode+0x129>
  367715:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  367718:	8b 50 14             	mov    0x14(%eax),%edx
  36771b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36771e:	0f b7 44 50 0e       	movzwl 0xe(%eax,%edx,2),%eax
  367723:	0f b7 d0             	movzwl %ax,%edx
  367726:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367729:	89 50 1c             	mov    %edx,0x1c(%eax)
  36772c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36772f:	8b 40 14             	mov    0x14(%eax),%eax
  367732:	8d 50 01             	lea    0x1(%eax),%edx
  367735:	8b 45 dc             	mov    -0x24(%ebp),%eax
  367738:	0f b7 44 50 0e       	movzwl 0xe(%eax,%edx,2),%eax
  36773d:	0f b7 d0             	movzwl %ax,%edx
  367740:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367743:	89 50 20             	mov    %edx,0x20(%eax)
  367746:	e9 0b 01 00 00       	jmp    367856 <minix_special_inode+0x290>
  36774b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36774e:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  367752:	66 83 f8 02          	cmp    $0x2,%ax
  367756:	0f 85 ce 00 00 00    	jne    36782a <minix_special_inode+0x264>
  36775c:	8b 45 0c             	mov    0xc(%ebp),%eax
  36775f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  367762:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367765:	0f b7 00             	movzwl (%eax),%eax
  367768:	0f b7 d0             	movzwl %ax,%edx
  36776b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36776e:	89 10                	mov    %edx,(%eax)
  367770:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367773:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  367777:	0f b7 d0             	movzwl %ax,%edx
  36777a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36777d:	89 50 04             	mov    %edx,0x4(%eax)
  367780:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367783:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  367787:	0f b7 d0             	movzwl %ax,%edx
  36778a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36778d:	89 50 08             	mov    %edx,0x8(%eax)
  367790:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367793:	8b 50 08             	mov    0x8(%eax),%edx
  367796:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367799:	89 50 18             	mov    %edx,0x18(%eax)
  36779c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  36779f:	8b 40 0c             	mov    0xc(%eax),%eax
  3677a2:	89 c2                	mov    %eax,%edx
  3677a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3677a7:	89 50 28             	mov    %edx,0x28(%eax)
  3677aa:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3677ad:	8b 40 10             	mov    0x10(%eax),%eax
  3677b0:	89 c2                	mov    %eax,%edx
  3677b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3677b5:	89 50 30             	mov    %edx,0x30(%eax)
  3677b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3677bb:	8b 40 14             	mov    0x14(%eax),%eax
  3677be:	89 c2                	mov    %eax,%edx
  3677c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3677c3:	89 50 38             	mov    %edx,0x38(%eax)
  3677c6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3677c9:	0f b7 40 02          	movzwl 0x2(%eax),%eax
  3677cd:	0f b7 d0             	movzwl %ax,%edx
  3677d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3677d3:	89 50 48             	mov    %edx,0x48(%eax)
  3677d6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  3677dd:	eb 1a                	jmp    3677f9 <minix_special_inode+0x233>
  3677df:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3677e2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  3677e5:	83 c2 04             	add    $0x4,%edx
  3677e8:	8b 4c 90 08          	mov    0x8(%eax,%edx,4),%ecx
  3677ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3677ef:	8b 55 f0             	mov    -0x10(%ebp),%edx
  3677f2:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  3677f5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  3677f9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3677fc:	8b 40 14             	mov    0x14(%eax),%eax
  3677ff:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  367802:	77 db                	ja     3677df <minix_special_inode+0x219>
  367804:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367807:	8b 50 34             	mov    0x34(%eax),%edx
  36780a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36780d:	89 50 1c             	mov    %edx,0x1c(%eax)
  367810:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367813:	8b 50 38             	mov    0x38(%eax),%edx
  367816:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367819:	89 50 20             	mov    %edx,0x20(%eax)
  36781c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  36781f:	8b 50 3c             	mov    0x3c(%eax),%edx
  367822:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367825:	89 50 24             	mov    %edx,0x24(%eax)
  367828:	eb 2c                	jmp    367856 <minix_special_inode+0x290>
  36782a:	83 ec 08             	sub    $0x8,%esp
  36782d:	68 98 e0 36 00       	push   $0x36e098
  367832:	68 a0 e0 36 00       	push   $0x36e0a0
  367837:	e8 4c 18 00 00       	call   369088 <printk>
  36783c:	83 c4 10             	add    $0x10,%esp
  36783f:	83 ec 08             	sub    $0x8,%esp
  367842:	6a 00                	push   $0x0
  367844:	ff 75 ec             	pushl  -0x14(%ebp)
  367847:	e8 53 40 00 00       	call   36b89f <kfree_s>
  36784c:	83 c4 10             	add    $0x10,%esp
  36784f:	b8 00 00 00 00       	mov    $0x0,%eax
  367854:	eb 1c                	jmp    367872 <minix_special_inode+0x2ac>
  367856:	8b 45 08             	mov    0x8(%ebp),%eax
  367859:	8d 50 30             	lea    0x30(%eax),%edx
  36785c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36785f:	83 c0 20             	add    $0x20,%eax
  367862:	83 ec 08             	sub    $0x8,%esp
  367865:	52                   	push   %edx
  367866:	50                   	push   %eax
  367867:	e8 ea f7 ff ff       	call   367056 <list_add>
  36786c:	83 c4 10             	add    $0x10,%esp
  36786f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367872:	c9                   	leave  
  367873:	c3                   	ret    

00367874 <minix_sync_inode>:
  367874:	55                   	push   %ebp
  367875:	89 e5                	mov    %esp,%ebp
  367877:	83 ec 38             	sub    $0x38,%esp
  36787a:	ff 75 08             	pushl  0x8(%ebp)
  36787d:	e8 03 f8 ff ff       	call   367085 <inode_sb>
  367882:	83 c4 04             	add    $0x4,%esp
  367885:	89 45 ec             	mov    %eax,-0x14(%ebp)
  367888:	ff 75 ec             	pushl  -0x14(%ebp)
  36788b:	e8 df f7 ff ff       	call   36706f <sb_info>
  367890:	83 c4 04             	add    $0x4,%esp
  367893:	89 45 e8             	mov    %eax,-0x18(%ebp)
  367896:	ff 75 08             	pushl  0x8(%ebp)
  367899:	e8 dc f7 ff ff       	call   36707a <inode_info>
  36789e:	83 c4 04             	add    $0x4,%esp
  3678a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3678a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3678a7:	8b 40 1c             	mov    0x1c(%eax),%eax
  3678aa:	8b 55 e8             	mov    -0x18(%ebp),%edx
  3678ad:	8b 4a 10             	mov    0x10(%edx),%ecx
  3678b0:	ba 00 00 00 00       	mov    $0x0,%edx
  3678b5:	f7 f1                	div    %ecx
  3678b7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  3678ba:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  3678c1:	8b 45 08             	mov    0x8(%ebp),%eax
  3678c4:	8b 40 10             	mov    0x10(%eax),%eax
  3678c7:	83 e8 01             	sub    $0x1,%eax
  3678ca:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  3678cd:	ba 00 00 00 00       	mov    $0x0,%edx
  3678d2:	f7 f1                	div    %ecx
  3678d4:	89 45 d8             	mov    %eax,-0x28(%ebp)
  3678d7:	8b 45 08             	mov    0x8(%ebp),%eax
  3678da:	8b 40 10             	mov    0x10(%eax),%eax
  3678dd:	83 e8 01             	sub    $0x1,%eax
  3678e0:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  3678e3:	ba 00 00 00 00       	mov    $0x0,%edx
  3678e8:	f7 f1                	div    %ecx
  3678ea:	89 d0                	mov    %edx,%eax
  3678ec:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  3678ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3678f2:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  3678f6:	66 83 f8 01          	cmp    $0x1,%ax
  3678fa:	0f 85 bd 00 00 00    	jne    3679bd <minix_sync_inode+0x149>
  367900:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  367903:	8b 40 28             	mov    0x28(%eax),%eax
  367906:	89 45 cc             	mov    %eax,-0x34(%ebp)
  367909:	8b 45 08             	mov    0x8(%ebp),%eax
  36790c:	8b 00                	mov    (%eax),%eax
  36790e:	89 c2                	mov    %eax,%edx
  367910:	8b 45 cc             	mov    -0x34(%ebp),%eax
  367913:	66 89 10             	mov    %dx,(%eax)
  367916:	8b 45 08             	mov    0x8(%ebp),%eax
  367919:	8b 40 04             	mov    0x4(%eax),%eax
  36791c:	89 c2                	mov    %eax,%edx
  36791e:	8b 45 cc             	mov    -0x34(%ebp),%eax
  367921:	66 89 50 02          	mov    %dx,0x2(%eax)
  367925:	8b 45 08             	mov    0x8(%ebp),%eax
  367928:	8b 40 08             	mov    0x8(%eax),%eax
  36792b:	89 c2                	mov    %eax,%edx
  36792d:	8b 45 cc             	mov    -0x34(%ebp),%eax
  367930:	88 50 0c             	mov    %dl,0xc(%eax)
  367933:	8b 45 08             	mov    0x8(%ebp),%eax
  367936:	8b 40 30             	mov    0x30(%eax),%eax
  367939:	89 c2                	mov    %eax,%edx
  36793b:	8b 45 cc             	mov    -0x34(%ebp),%eax
  36793e:	89 50 08             	mov    %edx,0x8(%eax)
  367941:	8b 45 08             	mov    0x8(%ebp),%eax
  367944:	8b 50 18             	mov    0x18(%eax),%edx
  367947:	8b 45 cc             	mov    -0x34(%ebp),%eax
  36794a:	89 50 04             	mov    %edx,0x4(%eax)
  36794d:	8b 45 08             	mov    0x8(%ebp),%eax
  367950:	8b 40 48             	mov    0x48(%eax),%eax
  367953:	89 c2                	mov    %eax,%edx
  367955:	8b 45 cc             	mov    -0x34(%ebp),%eax
  367958:	88 50 0d             	mov    %dl,0xd(%eax)
  36795b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  367962:	eb 1a                	jmp    36797e <minix_sync_inode+0x10a>
  367964:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  367967:	8b 55 f4             	mov    -0xc(%ebp),%edx
  36796a:	8b 04 90             	mov    (%eax,%edx,4),%eax
  36796d:	89 c1                	mov    %eax,%ecx
  36796f:	8b 45 cc             	mov    -0x34(%ebp),%eax
  367972:	8b 55 f4             	mov    -0xc(%ebp),%edx
  367975:	66 89 4c 50 0e       	mov    %cx,0xe(%eax,%edx,2)
  36797a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36797e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367981:	8b 40 14             	mov    0x14(%eax),%eax
  367984:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  367987:	77 db                	ja     367964 <minix_sync_inode+0xf0>
  367989:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36798c:	8b 50 14             	mov    0x14(%eax),%edx
  36798f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  367992:	8b 40 1c             	mov    0x1c(%eax),%eax
  367995:	89 c1                	mov    %eax,%ecx
  367997:	8b 45 cc             	mov    -0x34(%ebp),%eax
  36799a:	66 89 4c 50 0e       	mov    %cx,0xe(%eax,%edx,2)
  36799f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3679a2:	8b 40 14             	mov    0x14(%eax),%eax
  3679a5:	8d 50 01             	lea    0x1(%eax),%edx
  3679a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3679ab:	8b 40 20             	mov    0x20(%eax),%eax
  3679ae:	89 c1                	mov    %eax,%ecx
  3679b0:	8b 45 cc             	mov    -0x34(%ebp),%eax
  3679b3:	66 89 4c 50 0e       	mov    %cx,0xe(%eax,%edx,2)
  3679b8:	e9 f5 00 00 00       	jmp    367ab2 <minix_sync_inode+0x23e>
  3679bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3679c0:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  3679c4:	66 83 f8 02          	cmp    $0x2,%ax
  3679c8:	0f 85 cd 00 00 00    	jne    367a9b <minix_sync_inode+0x227>
  3679ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3679d1:	8b 40 28             	mov    0x28(%eax),%eax
  3679d4:	89 45 d0             	mov    %eax,-0x30(%ebp)
  3679d7:	8b 45 08             	mov    0x8(%ebp),%eax
  3679da:	8b 00                	mov    (%eax),%eax
  3679dc:	89 c2                	mov    %eax,%edx
  3679de:	8b 45 d0             	mov    -0x30(%ebp),%eax
  3679e1:	66 89 10             	mov    %dx,(%eax)
  3679e4:	8b 45 08             	mov    0x8(%ebp),%eax
  3679e7:	8b 40 04             	mov    0x4(%eax),%eax
  3679ea:	89 c2                	mov    %eax,%edx
  3679ec:	8b 45 d0             	mov    -0x30(%ebp),%eax
  3679ef:	66 89 50 04          	mov    %dx,0x4(%eax)
  3679f3:	8b 45 08             	mov    0x8(%ebp),%eax
  3679f6:	8b 40 08             	mov    0x8(%eax),%eax
  3679f9:	89 c2                	mov    %eax,%edx
  3679fb:	8b 45 d0             	mov    -0x30(%ebp),%eax
  3679fe:	66 89 50 06          	mov    %dx,0x6(%eax)
  367a02:	8b 45 08             	mov    0x8(%ebp),%eax
  367a05:	8b 40 30             	mov    0x30(%eax),%eax
  367a08:	89 c2                	mov    %eax,%edx
  367a0a:	8b 45 d0             	mov    -0x30(%ebp),%eax
  367a0d:	89 50 10             	mov    %edx,0x10(%eax)
  367a10:	8b 45 08             	mov    0x8(%ebp),%eax
  367a13:	8b 40 38             	mov    0x38(%eax),%eax
  367a16:	89 c2                	mov    %eax,%edx
  367a18:	8b 45 d0             	mov    -0x30(%ebp),%eax
  367a1b:	89 50 14             	mov    %edx,0x14(%eax)
  367a1e:	8b 45 08             	mov    0x8(%ebp),%eax
  367a21:	8b 40 28             	mov    0x28(%eax),%eax
  367a24:	89 c2                	mov    %eax,%edx
  367a26:	8b 45 d0             	mov    -0x30(%ebp),%eax
  367a29:	89 50 0c             	mov    %edx,0xc(%eax)
  367a2c:	8b 45 08             	mov    0x8(%ebp),%eax
  367a2f:	8b 50 18             	mov    0x18(%eax),%edx
  367a32:	8b 45 d0             	mov    -0x30(%ebp),%eax
  367a35:	89 50 08             	mov    %edx,0x8(%eax)
  367a38:	8b 45 08             	mov    0x8(%ebp),%eax
  367a3b:	8b 40 48             	mov    0x48(%eax),%eax
  367a3e:	89 c2                	mov    %eax,%edx
  367a40:	8b 45 d0             	mov    -0x30(%ebp),%eax
  367a43:	66 89 50 02          	mov    %dx,0x2(%eax)
  367a47:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  367a4e:	eb 1a                	jmp    367a6a <minix_sync_inode+0x1f6>
  367a50:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  367a53:	8b 55 f0             	mov    -0x10(%ebp),%edx
  367a56:	8b 14 90             	mov    (%eax,%edx,4),%edx
  367a59:	8b 45 d0             	mov    -0x30(%ebp),%eax
  367a5c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  367a5f:	83 c1 04             	add    $0x4,%ecx
  367a62:	89 54 88 08          	mov    %edx,0x8(%eax,%ecx,4)
  367a66:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  367a6a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367a6d:	8b 40 14             	mov    0x14(%eax),%eax
  367a70:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  367a73:	77 db                	ja     367a50 <minix_sync_inode+0x1dc>
  367a75:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  367a78:	8b 50 1c             	mov    0x1c(%eax),%edx
  367a7b:	8b 45 d0             	mov    -0x30(%ebp),%eax
  367a7e:	89 50 34             	mov    %edx,0x34(%eax)
  367a81:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  367a84:	8b 50 20             	mov    0x20(%eax),%edx
  367a87:	8b 45 d0             	mov    -0x30(%ebp),%eax
  367a8a:	89 50 38             	mov    %edx,0x38(%eax)
  367a8d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  367a90:	8b 50 24             	mov    0x24(%eax),%edx
  367a93:	8b 45 d0             	mov    -0x30(%ebp),%eax
  367a96:	89 50 3c             	mov    %edx,0x3c(%eax)
  367a99:	eb 17                	jmp    367ab2 <minix_sync_inode+0x23e>
  367a9b:	83 ec 08             	sub    $0x8,%esp
  367a9e:	68 98 e0 36 00       	push   $0x36e098
  367aa3:	68 cc e0 36 00       	push   $0x36e0cc
  367aa8:	e8 db 15 00 00       	call   369088 <printk>
  367aad:	83 c4 10             	add    $0x10,%esp
  367ab0:	eb 41                	jmp    367af3 <minix_sync_inode+0x27f>
  367ab2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  367ab5:	8b 50 28             	mov    0x28(%eax),%edx
  367ab8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367abb:	8b 48 10             	mov    0x10(%eax),%ecx
  367abe:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  367ac1:	0f af c1             	imul   %ecx,%eax
  367ac4:	f7 d8                	neg    %eax
  367ac6:	01 d0                	add    %edx,%eax
  367ac8:	89 45 dc             	mov    %eax,-0x24(%ebp)
  367acb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367ace:	8b 50 08             	mov    0x8(%eax),%edx
  367ad1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367ad4:	8b 40 0c             	mov    0xc(%eax),%eax
  367ad7:	01 c2                	add    %eax,%edx
  367ad9:	8b 45 d8             	mov    -0x28(%ebp),%eax
  367adc:	01 d0                	add    %edx,%eax
  367ade:	83 c0 02             	add    $0x2,%eax
  367ae1:	83 ec 04             	sub    $0x4,%esp
  367ae4:	50                   	push   %eax
  367ae5:	ff 75 dc             	pushl  -0x24(%ebp)
  367ae8:	ff 75 ec             	pushl  -0x14(%ebp)
  367aeb:	e8 d0 52 00 00       	call   36cdc0 <sb_bwrite>
  367af0:	83 c4 10             	add    $0x10,%esp
  367af3:	c9                   	leave  
  367af4:	c3                   	ret    

00367af5 <minix_iget>:
  367af5:	55                   	push   %ebp
  367af6:	89 e5                	mov    %esp,%ebp
  367af8:	83 ec 38             	sub    $0x38,%esp
  367afb:	ff 75 08             	pushl  0x8(%ebp)
  367afe:	e8 6c f5 ff ff       	call   36706f <sb_info>
  367b03:	83 c4 04             	add    $0x4,%esp
  367b06:	89 45 f0             	mov    %eax,-0x10(%ebp)
  367b09:	8b 45 08             	mov    0x8(%ebp),%eax
  367b0c:	8b 40 1c             	mov    0x1c(%eax),%eax
  367b0f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  367b12:	8b 4a 10             	mov    0x10(%edx),%ecx
  367b15:	ba 00 00 00 00       	mov    $0x0,%edx
  367b1a:	f7 f1                	div    %ecx
  367b1c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  367b1f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  367b23:	74 0a                	je     367b2f <minix_iget+0x3a>
  367b25:	8b 45 f0             	mov    -0x10(%ebp),%eax
  367b28:	8b 00                	mov    (%eax),%eax
  367b2a:	3b 45 0c             	cmp    0xc(%ebp),%eax
  367b2d:	73 26                	jae    367b55 <minix_iget+0x60>
  367b2f:	8b 45 08             	mov    0x8(%ebp),%eax
  367b32:	83 c0 3c             	add    $0x3c,%eax
  367b35:	ff 75 0c             	pushl  0xc(%ebp)
  367b38:	50                   	push   %eax
  367b39:	68 98 e0 36 00       	push   $0x36e098
  367b3e:	68 00 e1 36 00       	push   $0x36e100
  367b43:	e8 40 15 00 00       	call   369088 <printk>
  367b48:	83 c4 10             	add    $0x10,%esp
  367b4b:	b8 00 00 00 00       	mov    $0x0,%eax
  367b50:	e9 6c 01 00 00       	jmp    367cc1 <minix_iget+0x1cc>
  367b55:	83 ec 0c             	sub    $0xc,%esp
  367b58:	68 00 04 00 00       	push   $0x400
  367b5d:	e8 d1 3b 00 00       	call   36b733 <kalloc>
  367b62:	83 c4 10             	add    $0x10,%esp
  367b65:	89 45 e8             	mov    %eax,-0x18(%ebp)
  367b68:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  367b6c:	75 1f                	jne    367b8d <minix_iget+0x98>
  367b6e:	83 ec 08             	sub    $0x8,%esp
  367b71:	68 98 e0 36 00       	push   $0x36e098
  367b76:	68 39 e1 36 00       	push   $0x36e139
  367b7b:	e8 08 15 00 00       	call   369088 <printk>
  367b80:	83 c4 10             	add    $0x10,%esp
  367b83:	b8 00 00 00 00       	mov    $0x0,%eax
  367b88:	e9 34 01 00 00       	jmp    367cc1 <minix_iget+0x1cc>
  367b8d:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
  367b91:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  367b94:	8b 45 0c             	mov    0xc(%ebp),%eax
  367b97:	ba 00 00 00 00       	mov    $0x0,%edx
  367b9c:	f7 f1                	div    %ecx
  367b9e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  367ba1:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  367ba4:	8b 45 0c             	mov    0xc(%ebp),%eax
  367ba7:	ba 00 00 00 00       	mov    $0x0,%edx
  367bac:	f7 f1                	div    %ecx
  367bae:	89 d0                	mov    %edx,%eax
  367bb0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  367bb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  367bb6:	8b 50 08             	mov    0x8(%eax),%edx
  367bb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  367bbc:	8b 40 0c             	mov    0xc(%eax),%eax
  367bbf:	01 c2                	add    %eax,%edx
  367bc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  367bc4:	01 d0                	add    %edx,%eax
  367bc6:	83 c0 02             	add    $0x2,%eax
  367bc9:	89 45 dc             	mov    %eax,-0x24(%ebp)
  367bcc:	83 ec 04             	sub    $0x4,%esp
  367bcf:	ff 75 dc             	pushl  -0x24(%ebp)
  367bd2:	ff 75 e8             	pushl  -0x18(%ebp)
  367bd5:	ff 75 08             	pushl  0x8(%ebp)
  367bd8:	e8 c3 51 00 00       	call   36cda0 <sb_bread>
  367bdd:	83 c4 10             	add    $0x10,%esp
  367be0:	89 45 d8             	mov    %eax,-0x28(%ebp)
  367be3:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  367be7:	74 1a                	je     367c03 <minix_iget+0x10e>
  367be9:	83 ec 08             	sub    $0x8,%esp
  367bec:	68 98 e0 36 00       	push   $0x36e098
  367bf1:	68 50 e1 36 00       	push   $0x36e150
  367bf6:	e8 8d 14 00 00       	call   369088 <printk>
  367bfb:	83 c4 10             	add    $0x10,%esp
  367bfe:	e9 a8 00 00 00       	jmp    367cab <minix_iget+0x1b6>
  367c03:	8b 45 0c             	mov    0xc(%ebp),%eax
  367c06:	8d 50 01             	lea    0x1(%eax),%edx
  367c09:	8b 45 f0             	mov    -0x10(%ebp),%eax
  367c0c:	8b 48 10             	mov    0x10(%eax),%ecx
  367c0f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367c12:	0f af c8             	imul   %eax,%ecx
  367c15:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367c18:	01 c8                	add    %ecx,%eax
  367c1a:	83 ec 04             	sub    $0x4,%esp
  367c1d:	52                   	push   %edx
  367c1e:	50                   	push   %eax
  367c1f:	ff 75 08             	pushl  0x8(%ebp)
  367c22:	e8 9f f9 ff ff       	call   3675c6 <minix_special_inode>
  367c27:	83 c4 10             	add    $0x10,%esp
  367c2a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  367c2d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  367c31:	75 17                	jne    367c4a <minix_iget+0x155>
  367c33:	83 ec 08             	sub    $0x8,%esp
  367c36:	68 98 e0 36 00       	push   $0x36e098
  367c3b:	68 78 e1 36 00       	push   $0x36e178
  367c40:	e8 43 14 00 00       	call   369088 <printk>
  367c45:	83 c4 10             	add    $0x10,%esp
  367c48:	eb 61                	jmp    367cab <minix_iget+0x1b6>
  367c4a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367c4d:	29 45 0c             	sub    %eax,0xc(%ebp)
  367c50:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  367c57:	eb 45                	jmp    367c9e <minix_iget+0x1a9>
  367c59:	8b 45 f4             	mov    -0xc(%ebp),%eax
  367c5c:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  367c5f:	75 02                	jne    367c63 <minix_iget+0x16e>
  367c61:	eb 37                	jmp    367c9a <minix_iget+0x1a5>
  367c63:	8b 55 f4             	mov    -0xc(%ebp),%edx
  367c66:	8b 45 0c             	mov    0xc(%ebp),%eax
  367c69:	01 d0                	add    %edx,%eax
  367c6b:	8d 50 01             	lea    0x1(%eax),%edx
  367c6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  367c71:	8b 48 10             	mov    0x10(%eax),%ecx
  367c74:	8b 45 f4             	mov    -0xc(%ebp),%eax
  367c77:	0f af c8             	imul   %eax,%ecx
  367c7a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367c7d:	01 c8                	add    %ecx,%eax
  367c7f:	83 ec 04             	sub    $0x4,%esp
  367c82:	52                   	push   %edx
  367c83:	50                   	push   %eax
  367c84:	ff 75 08             	pushl  0x8(%ebp)
  367c87:	e8 3a f9 ff ff       	call   3675c6 <minix_special_inode>
  367c8c:	83 c4 10             	add    $0x10,%esp
  367c8f:	89 45 d0             	mov    %eax,-0x30(%ebp)
  367c92:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  367c96:	75 02                	jne    367c9a <minix_iget+0x1a5>
  367c98:	eb 0c                	jmp    367ca6 <minix_iget+0x1b1>
  367c9a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  367c9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  367ca1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  367ca4:	7c b3                	jl     367c59 <minix_iget+0x164>
  367ca6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  367ca9:	eb 16                	jmp    367cc1 <minix_iget+0x1cc>
  367cab:	83 ec 08             	sub    $0x8,%esp
  367cae:	6a 00                	push   $0x0
  367cb0:	ff 75 e8             	pushl  -0x18(%ebp)
  367cb3:	e8 e7 3b 00 00       	call   36b89f <kfree_s>
  367cb8:	83 c4 10             	add    $0x10,%esp
  367cbb:	90                   	nop
  367cbc:	b8 00 00 00 00       	mov    $0x0,%eax
  367cc1:	c9                   	leave  
  367cc2:	c3                   	ret    

00367cc3 <minix_find_inode>:
  367cc3:	55                   	push   %ebp
  367cc4:	89 e5                	mov    %esp,%ebp
  367cc6:	83 ec 18             	sub    $0x18,%esp
  367cc9:	8b 45 08             	mov    0x8(%ebp),%eax
  367ccc:	8b 40 30             	mov    0x30(%eax),%eax
  367ccf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  367cd2:	eb 27                	jmp    367cfb <minix_find_inode+0x38>
  367cd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  367cd7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  367cda:	8b 45 f0             	mov    -0x10(%ebp),%eax
  367cdd:	83 e8 20             	sub    $0x20,%eax
  367ce0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  367ce3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367ce6:	8b 40 10             	mov    0x10(%eax),%eax
  367ce9:	3b 45 0c             	cmp    0xc(%ebp),%eax
  367cec:	75 05                	jne    367cf3 <minix_find_inode+0x30>
  367cee:	8b 45 ec             	mov    -0x14(%ebp),%eax
  367cf1:	eb 24                	jmp    367d17 <minix_find_inode+0x54>
  367cf3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  367cf6:	8b 00                	mov    (%eax),%eax
  367cf8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  367cfb:	8b 45 08             	mov    0x8(%ebp),%eax
  367cfe:	83 c0 30             	add    $0x30,%eax
  367d01:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  367d04:	75 ce                	jne    367cd4 <minix_find_inode+0x11>
  367d06:	83 ec 08             	sub    $0x8,%esp
  367d09:	ff 75 0c             	pushl  0xc(%ebp)
  367d0c:	ff 75 08             	pushl  0x8(%ebp)
  367d0f:	e8 e1 fd ff ff       	call   367af5 <minix_iget>
  367d14:	83 c4 10             	add    $0x10,%esp
  367d17:	c9                   	leave  
  367d18:	c3                   	ret    

00367d19 <minix_alloc_sb>:
  367d19:	55                   	push   %ebp
  367d1a:	89 e5                	mov    %esp,%ebp
  367d1c:	83 ec 18             	sub    $0x18,%esp
  367d1f:	83 ec 0c             	sub    $0xc,%esp
  367d22:	68 a4 00 00 00       	push   $0xa4
  367d27:	e8 07 3a 00 00       	call   36b733 <kalloc>
  367d2c:	83 c4 10             	add    $0x10,%esp
  367d2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  367d32:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  367d36:	75 07                	jne    367d3f <minix_alloc_sb+0x26>
  367d38:	b8 00 00 00 00       	mov    $0x0,%eax
  367d3d:	eb 6b                	jmp    367daa <minix_alloc_sb+0x91>
  367d3f:	83 ec 04             	sub    $0x4,%esp
  367d42:	68 a4 00 00 00       	push   $0xa4
  367d47:	6a 00                	push   $0x0
  367d49:	ff 75 f4             	pushl  -0xc(%ebp)
  367d4c:	e8 5c f3 ff ff       	call   3670ad <memset>
  367d51:	83 c4 10             	add    $0x10,%esp
  367d54:	8b 45 f4             	mov    -0xc(%ebp),%eax
  367d57:	8b 55 08             	mov    0x8(%ebp),%edx
  367d5a:	89 50 04             	mov    %edx,0x4(%eax)
  367d5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  367d60:	c7 40 1c 00 04 00 00 	movl   $0x400,0x1c(%eax)
  367d67:	8b 45 f4             	mov    -0xc(%ebp),%eax
  367d6a:	c6 40 18 0a          	movb   $0xa,0x18(%eax)
  367d6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  367d71:	83 c0 3c             	add    $0x3c,%eax
  367d74:	83 ec 08             	sub    $0x8,%esp
  367d77:	ff 75 0c             	pushl  0xc(%ebp)
  367d7a:	50                   	push   %eax
  367d7b:	e8 10 f3 ff ff       	call   367090 <strcpy>
  367d80:	83 c4 10             	add    $0x10,%esp
  367d83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  367d86:	83 c0 28             	add    $0x28,%eax
  367d89:	83 ec 0c             	sub    $0xc,%esp
  367d8c:	50                   	push   %eax
  367d8d:	e8 87 f2 ff ff       	call   367019 <INIT_LIST_HEAD>
  367d92:	83 c4 10             	add    $0x10,%esp
  367d95:	8b 45 f4             	mov    -0xc(%ebp),%eax
  367d98:	83 c0 30             	add    $0x30,%eax
  367d9b:	83 ec 0c             	sub    $0xc,%esp
  367d9e:	50                   	push   %eax
  367d9f:	e8 75 f2 ff ff       	call   367019 <INIT_LIST_HEAD>
  367da4:	83 c4 10             	add    $0x10,%esp
  367da7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  367daa:	c9                   	leave  
  367dab:	c3                   	ret    

00367dac <minix_sget>:
  367dac:	55                   	push   %ebp
  367dad:	89 e5                	mov    %esp,%ebp
  367daf:	53                   	push   %ebx
  367db0:	83 ec 24             	sub    $0x24,%esp
  367db3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  367dba:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  367dc1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  367dc8:	83 ec 0c             	sub    $0xc,%esp
  367dcb:	68 00 04 00 00       	push   $0x400
  367dd0:	e8 5e 39 00 00       	call   36b733 <kalloc>
  367dd5:	83 c4 10             	add    $0x10,%esp
  367dd8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  367ddb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  367ddf:	75 13                	jne    367df4 <minix_sget+0x48>
  367de1:	8b 45 0c             	mov    0xc(%ebp),%eax
  367de4:	c7 00 f4 ff ff ff    	movl   $0xfffffff4,(%eax)
  367dea:	b8 00 00 00 00       	mov    $0x0,%eax
  367def:	e9 7b 04 00 00       	jmp    36826f <minix_sget+0x4c3>
  367df4:	83 ec 08             	sub    $0x8,%esp
  367df7:	68 9c e1 36 00       	push   $0x36e19c
  367dfc:	ff 75 08             	pushl  0x8(%ebp)
  367dff:	e8 15 ff ff ff       	call   367d19 <minix_alloc_sb>
  367e04:	83 c4 10             	add    $0x10,%esp
  367e07:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  367e0a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  367e0e:	75 24                	jne    367e34 <minix_sget+0x88>
  367e10:	8b 45 0c             	mov    0xc(%ebp),%eax
  367e13:	c7 00 f4 ff ff ff    	movl   $0xfffffff4,(%eax)
  367e19:	90                   	nop
  367e1a:	83 ec 08             	sub    $0x8,%esp
  367e1d:	68 98 e0 36 00       	push   $0x36e098
  367e22:	68 8e e2 36 00       	push   $0x36e28e
  367e27:	e8 5c 12 00 00       	call   369088 <printk>
  367e2c:	83 c4 10             	add    $0x10,%esp
  367e2f:	e9 25 04 00 00       	jmp    368259 <minix_sget+0x4ad>
  367e34:	83 ec 0c             	sub    $0xc,%esp
  367e37:	ff 75 e4             	pushl  -0x1c(%ebp)
  367e3a:	e8 30 f2 ff ff       	call   36706f <sb_info>
  367e3f:	83 c4 10             	add    $0x10,%esp
  367e42:	89 45 e0             	mov    %eax,-0x20(%ebp)
  367e45:	83 ec 04             	sub    $0x4,%esp
  367e48:	6a 01                	push   $0x1
  367e4a:	ff 75 e8             	pushl  -0x18(%ebp)
  367e4d:	ff 75 e4             	pushl  -0x1c(%ebp)
  367e50:	e8 4b 4f 00 00       	call   36cda0 <sb_bread>
  367e55:	83 c4 10             	add    $0x10,%esp
  367e58:	89 c2                	mov    %eax,%edx
  367e5a:	8b 45 0c             	mov    0xc(%ebp),%eax
  367e5d:	89 10                	mov    %edx,(%eax)
  367e5f:	8b 45 0c             	mov    0xc(%ebp),%eax
  367e62:	8b 00                	mov    (%eax),%eax
  367e64:	85 c0                	test   %eax,%eax
  367e66:	74 1b                	je     367e83 <minix_sget+0xd7>
  367e68:	90                   	nop
  367e69:	83 ec 08             	sub    $0x8,%esp
  367e6c:	68 98 e0 36 00       	push   $0x36e098
  367e71:	68 68 e2 36 00       	push   $0x36e268
  367e76:	e8 0d 12 00 00       	call   369088 <printk>
  367e7b:	83 c4 10             	add    $0x10,%esp
  367e7e:	e9 c6 03 00 00       	jmp    368249 <minix_sget+0x49d>
  367e83:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367e86:	0f b7 00             	movzwl (%eax),%eax
  367e89:	0f b7 d0             	movzwl %ax,%edx
  367e8c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367e8f:	89 50 04             	mov    %edx,0x4(%eax)
  367e92:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367e95:	0f b7 00             	movzwl (%eax),%eax
  367e98:	0f b7 d0             	movzwl %ax,%edx
  367e9b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367e9e:	89 10                	mov    %edx,(%eax)
  367ea0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367ea3:	8b 50 0c             	mov    0xc(%eax),%edx
  367ea6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367ea9:	89 50 20             	mov    %edx,0x20(%eax)
  367eac:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367eaf:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  367eb3:	0f b7 d0             	movzwl %ax,%edx
  367eb6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367eb9:	89 50 08             	mov    %edx,0x8(%eax)
  367ebc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367ebf:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  367ec3:	0f b7 d0             	movzwl %ax,%edx
  367ec6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367ec9:	89 50 0c             	mov    %edx,0xc(%eax)
  367ecc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367ecf:	0f b7 40 08          	movzwl 0x8(%eax),%eax
  367ed3:	0f b7 d0             	movzwl %ax,%edx
  367ed6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367ed9:	89 50 18             	mov    %edx,0x18(%eax)
  367edc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367edf:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
  367ee3:	0f b7 d0             	movzwl %ax,%edx
  367ee6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367ee9:	89 50 1c             	mov    %edx,0x1c(%eax)
  367eec:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367eef:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  367ef3:	66 3d 7f 13          	cmp    $0x137f,%ax
  367ef7:	75 34                	jne    367f2d <minix_sget+0x181>
  367ef9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367efc:	66 c7 40 28 01 00    	movw   $0x1,0x28(%eax)
  367f02:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367f05:	66 c7 40 26 10 00    	movw   $0x10,0x26(%eax)
  367f0b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367f0e:	66 c7 40 24 0e 00    	movw   $0xe,0x24(%eax)
  367f14:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367f17:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
  367f1e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367f21:	c7 40 14 07 00 00 00 	movl   $0x7,0x14(%eax)
  367f28:	e9 e3 00 00 00       	jmp    368010 <minix_sget+0x264>
  367f2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367f30:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  367f34:	66 3d 8f 13          	cmp    $0x138f,%ax
  367f38:	75 34                	jne    367f6e <minix_sget+0x1c2>
  367f3a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367f3d:	66 c7 40 28 01 00    	movw   $0x1,0x28(%eax)
  367f43:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367f46:	66 c7 40 26 20 00    	movw   $0x20,0x26(%eax)
  367f4c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367f4f:	66 c7 40 24 1e 00    	movw   $0x1e,0x24(%eax)
  367f55:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367f58:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
  367f5f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367f62:	c7 40 14 07 00 00 00 	movl   $0x7,0x14(%eax)
  367f69:	e9 a2 00 00 00       	jmp    368010 <minix_sget+0x264>
  367f6e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367f71:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  367f75:	66 3d 68 24          	cmp    $0x2468,%ax
  367f79:	75 31                	jne    367fac <minix_sget+0x200>
  367f7b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367f7e:	66 c7 40 28 02 00    	movw   $0x2,0x28(%eax)
  367f84:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367f87:	66 c7 40 26 10 00    	movw   $0x10,0x26(%eax)
  367f8d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367f90:	66 c7 40 24 0e 00    	movw   $0xe,0x24(%eax)
  367f96:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367f99:	c7 40 10 40 00 00 00 	movl   $0x40,0x10(%eax)
  367fa0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367fa3:	c7 40 14 07 00 00 00 	movl   $0x7,0x14(%eax)
  367faa:	eb 64                	jmp    368010 <minix_sget+0x264>
  367fac:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367faf:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  367fb3:	66 3d 78 24          	cmp    $0x2478,%ax
  367fb7:	75 31                	jne    367fea <minix_sget+0x23e>
  367fb9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367fbc:	66 c7 40 28 02 00    	movw   $0x2,0x28(%eax)
  367fc2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367fc5:	66 c7 40 26 20 00    	movw   $0x20,0x26(%eax)
  367fcb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367fce:	66 c7 40 24 1e 00    	movw   $0x1e,0x24(%eax)
  367fd4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367fd7:	c7 40 10 40 00 00 00 	movl   $0x40,0x10(%eax)
  367fde:	8b 45 e0             	mov    -0x20(%ebp),%eax
  367fe1:	c7 40 14 07 00 00 00 	movl   $0x7,0x14(%eax)
  367fe8:	eb 26                	jmp    368010 <minix_sget+0x264>
  367fea:	90                   	nop
  367feb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  367fee:	0f b7 40 10          	movzwl 0x10(%eax),%eax
  367ff2:	0f b7 c0             	movzwl %ax,%eax
  367ff5:	83 ec 04             	sub    $0x4,%esp
  367ff8:	50                   	push   %eax
  367ff9:	68 98 e0 36 00       	push   $0x36e098
  367ffe:	68 3c e2 36 00       	push   $0x36e23c
  368003:	e8 80 10 00 00       	call   369088 <printk>
  368008:	83 c4 10             	add    $0x10,%esp
  36800b:	e9 39 02 00 00       	jmp    368249 <minix_sget+0x49d>
  368010:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368013:	8b 40 08             	mov    0x8(%eax),%eax
  368016:	85 c0                	test   %eax,%eax
  368018:	0f 84 15 02 00 00    	je     368233 <minix_sget+0x487>
  36801e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368021:	8b 40 0c             	mov    0xc(%eax),%eax
  368024:	85 c0                	test   %eax,%eax
  368026:	0f 84 07 02 00 00    	je     368233 <minix_sget+0x487>
  36802c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  36802f:	8b 50 08             	mov    0x8(%eax),%edx
  368032:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368035:	8b 40 0c             	mov    0xc(%eax),%eax
  368038:	01 d0                	add    %edx,%eax
  36803a:	c1 e0 02             	shl    $0x2,%eax
  36803d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  368040:	83 ec 0c             	sub    $0xc,%esp
  368043:	ff 75 f4             	pushl  -0xc(%ebp)
  368046:	e8 e8 36 00 00       	call   36b733 <kalloc>
  36804b:	83 c4 10             	add    $0x10,%esp
  36804e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  368051:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  368055:	75 1b                	jne    368072 <minix_sget+0x2c6>
  368057:	90                   	nop
  368058:	83 ec 08             	sub    $0x8,%esp
  36805b:	68 98 e0 36 00       	push   $0x36e098
  368060:	68 00 e2 36 00       	push   $0x36e200
  368065:	e8 1e 10 00 00       	call   369088 <printk>
  36806a:	83 c4 10             	add    $0x10,%esp
  36806d:	e9 d7 01 00 00       	jmp    368249 <minix_sget+0x49d>
  368072:	83 ec 04             	sub    $0x4,%esp
  368075:	ff 75 f4             	pushl  -0xc(%ebp)
  368078:	6a 00                	push   $0x0
  36807a:	ff 75 ec             	pushl  -0x14(%ebp)
  36807d:	e8 2b f0 ff ff       	call   3670ad <memset>
  368082:	83 c4 10             	add    $0x10,%esp
  368085:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368088:	8b 55 ec             	mov    -0x14(%ebp),%edx
  36808b:	89 50 2c             	mov    %edx,0x2c(%eax)
  36808e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368091:	8b 40 08             	mov    0x8(%eax),%eax
  368094:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  36809b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36809e:	01 c2                	add    %eax,%edx
  3680a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  3680a3:	89 50 30             	mov    %edx,0x30(%eax)
  3680a6:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
  3680ad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3680b4:	eb 7d                	jmp    368133 <minix_sget+0x387>
  3680b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3680b9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3680c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3680c3:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
  3680c6:	83 ec 0c             	sub    $0xc,%esp
  3680c9:	68 00 04 00 00       	push   $0x400
  3680ce:	e8 60 36 00 00       	call   36b733 <kalloc>
  3680d3:	83 c4 10             	add    $0x10,%esp
  3680d6:	89 03                	mov    %eax,(%ebx)
  3680d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3680db:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3680e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3680e5:	01 d0                	add    %edx,%eax
  3680e7:	8b 00                	mov    (%eax),%eax
  3680e9:	85 c0                	test   %eax,%eax
  3680eb:	75 05                	jne    3680f2 <minix_sget+0x346>
  3680ed:	e9 c6 00 00 00       	jmp    3681b8 <minix_sget+0x40c>
  3680f2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  3680f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3680f8:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  3680ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368102:	01 c8                	add    %ecx,%eax
  368104:	8b 00                	mov    (%eax),%eax
  368106:	83 ec 04             	sub    $0x4,%esp
  368109:	52                   	push   %edx
  36810a:	50                   	push   %eax
  36810b:	ff 75 e4             	pushl  -0x1c(%ebp)
  36810e:	e8 8d 4c 00 00       	call   36cda0 <sb_bread>
  368113:	83 c4 10             	add    $0x10,%esp
  368116:	89 c2                	mov    %eax,%edx
  368118:	8b 45 0c             	mov    0xc(%ebp),%eax
  36811b:	89 10                	mov    %edx,(%eax)
  36811d:	8b 45 0c             	mov    0xc(%ebp),%eax
  368120:	8b 00                	mov    (%eax),%eax
  368122:	85 c0                	test   %eax,%eax
  368124:	74 05                	je     36812b <minix_sget+0x37f>
  368126:	e9 8d 00 00 00       	jmp    3681b8 <minix_sget+0x40c>
  36812b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  36812f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  368133:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368136:	8b 50 08             	mov    0x8(%eax),%edx
  368139:	8b 45 e0             	mov    -0x20(%ebp),%eax
  36813c:	8b 40 0c             	mov    0xc(%eax),%eax
  36813f:	01 d0                	add    %edx,%eax
  368141:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  368144:	0f 87 6c ff ff ff    	ja     3680b6 <minix_sget+0x30a>
  36814a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  36814d:	8b 40 2c             	mov    0x2c(%eax),%eax
  368150:	8b 00                	mov    (%eax),%eax
  368152:	83 ec 08             	sub    $0x8,%esp
  368155:	50                   	push   %eax
  368156:	6a 00                	push   $0x0
  368158:	e8 68 ef ff ff       	call   3670c5 <__set_bit>
  36815d:	83 c4 10             	add    $0x10,%esp
  368160:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368163:	8b 40 30             	mov    0x30(%eax),%eax
  368166:	8b 00                	mov    (%eax),%eax
  368168:	83 ec 08             	sub    $0x8,%esp
  36816b:	50                   	push   %eax
  36816c:	6a 00                	push   $0x0
  36816e:	e8 52 ef ff ff       	call   3670c5 <__set_bit>
  368173:	83 c4 10             	add    $0x10,%esp
  368176:	83 ec 08             	sub    $0x8,%esp
  368179:	6a 01                	push   $0x1
  36817b:	ff 75 e4             	pushl  -0x1c(%ebp)
  36817e:	e8 40 fb ff ff       	call   367cc3 <minix_find_inode>
  368183:	83 c4 10             	add    $0x10,%esp
  368186:	89 c2                	mov    %eax,%edx
  368188:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36818b:	89 50 38             	mov    %edx,0x38(%eax)
  36818e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  368191:	8b 40 38             	mov    0x38(%eax),%eax
  368194:	85 c0                	test   %eax,%eax
  368196:	75 18                	jne    3681b0 <minix_sget+0x404>
  368198:	90                   	nop
  368199:	83 ec 08             	sub    $0x8,%esp
  36819c:	68 98 e0 36 00       	push   $0x36e098
  3681a1:	68 a4 e1 36 00       	push   $0x36e1a4
  3681a6:	e8 dd 0e 00 00       	call   369088 <printk>
  3681ab:	83 c4 10             	add    $0x10,%esp
  3681ae:	eb 1d                	jmp    3681cd <minix_sget+0x421>
  3681b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  3681b3:	e9 b7 00 00 00       	jmp    36826f <minix_sget+0x4c3>
  3681b8:	83 ec 08             	sub    $0x8,%esp
  3681bb:	68 98 e0 36 00       	push   $0x36e098
  3681c0:	68 c8 e1 36 00       	push   $0x36e1c8
  3681c5:	e8 be 0e 00 00       	call   369088 <printk>
  3681ca:	83 c4 10             	add    $0x10,%esp
  3681cd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3681d4:	eb 38                	jmp    36820e <minix_sget+0x462>
  3681d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3681d9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3681e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3681e3:	01 d0                	add    %edx,%eax
  3681e5:	8b 00                	mov    (%eax),%eax
  3681e7:	85 c0                	test   %eax,%eax
  3681e9:	74 1f                	je     36820a <minix_sget+0x45e>
  3681eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3681ee:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3681f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3681f8:	01 d0                	add    %edx,%eax
  3681fa:	8b 00                	mov    (%eax),%eax
  3681fc:	83 ec 08             	sub    $0x8,%esp
  3681ff:	6a 00                	push   $0x0
  368201:	50                   	push   %eax
  368202:	e8 98 36 00 00       	call   36b89f <kfree_s>
  368207:	83 c4 10             	add    $0x10,%esp
  36820a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36820e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368211:	8b 50 08             	mov    0x8(%eax),%edx
  368214:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368217:	8b 40 0c             	mov    0xc(%eax),%eax
  36821a:	01 d0                	add    %edx,%eax
  36821c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  36821f:	77 b5                	ja     3681d6 <minix_sget+0x42a>
  368221:	83 ec 08             	sub    $0x8,%esp
  368224:	6a 00                	push   $0x0
  368226:	ff 75 ec             	pushl  -0x14(%ebp)
  368229:	e8 71 36 00 00       	call   36b89f <kfree_s>
  36822e:	83 c4 10             	add    $0x10,%esp
  368231:	eb 16                	jmp    368249 <minix_sget+0x49d>
  368233:	83 ec 08             	sub    $0x8,%esp
  368236:	68 98 e0 36 00       	push   $0x36e098
  36823b:	68 1f e2 36 00       	push   $0x36e21f
  368240:	e8 43 0e 00 00       	call   369088 <printk>
  368245:	83 c4 10             	add    $0x10,%esp
  368248:	90                   	nop
  368249:	83 ec 08             	sub    $0x8,%esp
  36824c:	6a 00                	push   $0x0
  36824e:	ff 75 e4             	pushl  -0x1c(%ebp)
  368251:	e8 49 36 00 00       	call   36b89f <kfree_s>
  368256:	83 c4 10             	add    $0x10,%esp
  368259:	83 ec 08             	sub    $0x8,%esp
  36825c:	6a 00                	push   $0x0
  36825e:	ff 75 e8             	pushl  -0x18(%ebp)
  368261:	e8 39 36 00 00       	call   36b89f <kfree_s>
  368266:	83 c4 10             	add    $0x10,%esp
  368269:	90                   	nop
  36826a:	b8 00 00 00 00       	mov    $0x0,%eax
  36826f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  368272:	c9                   	leave  
  368273:	c3                   	ret    

00368274 <sb_info>:
  368274:	55                   	push   %ebp
  368275:	89 e5                	mov    %esp,%ebp
  368277:	8b 45 08             	mov    0x8(%ebp),%eax
  36827a:	83 c0 70             	add    $0x70,%eax
  36827d:	5d                   	pop    %ebp
  36827e:	c3                   	ret    

0036827f <inode_info>:
  36827f:	55                   	push   %ebp
  368280:	89 e5                	mov    %esp,%ebp
  368282:	8b 45 08             	mov    0x8(%ebp),%eax
  368285:	83 c0 60             	add    $0x60,%eax
  368288:	5d                   	pop    %ebp
  368289:	c3                   	ret    

0036828a <inode_sb>:
  36828a:	55                   	push   %ebp
  36828b:	89 e5                	mov    %esp,%ebp
  36828d:	8b 45 08             	mov    0x8(%ebp),%eax
  368290:	8b 40 1c             	mov    0x1c(%eax),%eax
  368293:	5d                   	pop    %ebp
  368294:	c3                   	ret    

00368295 <_get>:
  368295:	55                   	push   %ebp
  368296:	89 e5                	mov    %esp,%ebp
  368298:	8b 45 08             	mov    0x8(%ebp),%eax
  36829b:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  36829f:	66 83 f8 01          	cmp    $0x1,%ax
  3682a3:	75 13                	jne    3682b8 <_get+0x23>
  3682a5:	8b 45 10             	mov    0x10(%ebp),%eax
  3682a8:	8d 14 00             	lea    (%eax,%eax,1),%edx
  3682ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  3682ae:	01 d0                	add    %edx,%eax
  3682b0:	0f b7 00             	movzwl (%eax),%eax
  3682b3:	0f b7 c0             	movzwl %ax,%eax
  3682b6:	eb 11                	jmp    3682c9 <_get+0x34>
  3682b8:	8b 45 10             	mov    0x10(%ebp),%eax
  3682bb:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3682c2:	8b 45 0c             	mov    0xc(%ebp),%eax
  3682c5:	01 d0                	add    %edx,%eax
  3682c7:	8b 00                	mov    (%eax),%eax
  3682c9:	5d                   	pop    %ebp
  3682ca:	c3                   	ret    

003682cb <__free_indir>:
  3682cb:	55                   	push   %ebp
  3682cc:	89 e5                	mov    %esp,%ebp
  3682ce:	83 ec 28             	sub    $0x28,%esp
  3682d1:	ff 75 08             	pushl  0x8(%ebp)
  3682d4:	e8 b1 ff ff ff       	call   36828a <inode_sb>
  3682d9:	83 c4 04             	add    $0x4,%esp
  3682dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3682df:	ff 75 f0             	pushl  -0x10(%ebp)
  3682e2:	e8 8d ff ff ff       	call   368274 <sb_info>
  3682e7:	83 c4 04             	add    $0x4,%esp
  3682ea:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3682ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3682f0:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  3682f4:	66 83 f8 01          	cmp    $0x1,%ax
  3682f8:	75 07                	jne    368301 <__free_indir+0x36>
  3682fa:	b8 00 02 00 00       	mov    $0x200,%eax
  3682ff:	eb 05                	jmp    368306 <__free_indir+0x3b>
  368301:	b8 00 01 00 00       	mov    $0x100,%eax
  368306:	89 45 e8             	mov    %eax,-0x18(%ebp)
  368309:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  36830d:	75 0a                	jne    368319 <__free_indir+0x4e>
  36830f:	b8 01 00 00 00       	mov    $0x1,%eax
  368314:	e9 a8 00 00 00       	jmp    3683c1 <__free_indir+0xf6>
  368319:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36831c:	8b 40 1c             	mov    0x1c(%eax),%eax
  36831f:	83 ec 0c             	sub    $0xc,%esp
  368322:	50                   	push   %eax
  368323:	e8 0b 34 00 00       	call   36b733 <kalloc>
  368328:	83 c4 10             	add    $0x10,%esp
  36832b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36832e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  368332:	75 0a                	jne    36833e <__free_indir+0x73>
  368334:	b8 01 00 00 00       	mov    $0x1,%eax
  368339:	e9 83 00 00 00       	jmp    3683c1 <__free_indir+0xf6>
  36833e:	8b 45 0c             	mov    0xc(%ebp),%eax
  368341:	83 ec 04             	sub    $0x4,%esp
  368344:	50                   	push   %eax
  368345:	ff 75 e4             	pushl  -0x1c(%ebp)
  368348:	ff 75 f0             	pushl  -0x10(%ebp)
  36834b:	e8 50 4a 00 00       	call   36cda0 <sb_bread>
  368350:	83 c4 10             	add    $0x10,%esp
  368353:	85 c0                	test   %eax,%eax
  368355:	75 44                	jne    36839b <__free_indir+0xd0>
  368357:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36835e:	eb 33                	jmp    368393 <__free_indir+0xc8>
  368360:	8b 45 f4             	mov    -0xc(%ebp),%eax
  368363:	83 ec 04             	sub    $0x4,%esp
  368366:	50                   	push   %eax
  368367:	ff 75 e4             	pushl  -0x1c(%ebp)
  36836a:	ff 75 ec             	pushl  -0x14(%ebp)
  36836d:	e8 23 ff ff ff       	call   368295 <_get>
  368372:	83 c4 10             	add    $0x10,%esp
  368375:	89 45 e0             	mov    %eax,-0x20(%ebp)
  368378:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  36837c:	74 11                	je     36838f <__free_indir+0xc4>
  36837e:	83 ec 08             	sub    $0x8,%esp
  368381:	ff 75 e0             	pushl  -0x20(%ebp)
  368384:	ff 75 08             	pushl  0x8(%ebp)
  368387:	e8 e1 06 00 00       	call   368a6d <minix_free_block>
  36838c:	83 c4 10             	add    $0x10,%esp
  36838f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  368393:	8b 45 f4             	mov    -0xc(%ebp),%eax
  368396:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  368399:	72 c5                	jb     368360 <__free_indir+0x95>
  36839b:	83 ec 08             	sub    $0x8,%esp
  36839e:	ff 75 0c             	pushl  0xc(%ebp)
  3683a1:	ff 75 08             	pushl  0x8(%ebp)
  3683a4:	e8 c4 06 00 00       	call   368a6d <minix_free_block>
  3683a9:	83 c4 10             	add    $0x10,%esp
  3683ac:	83 ec 08             	sub    $0x8,%esp
  3683af:	6a 00                	push   $0x0
  3683b1:	ff 75 e4             	pushl  -0x1c(%ebp)
  3683b4:	e8 e6 34 00 00       	call   36b89f <kfree_s>
  3683b9:	83 c4 10             	add    $0x10,%esp
  3683bc:	b8 00 00 00 00       	mov    $0x0,%eax
  3683c1:	c9                   	leave  
  3683c2:	c3                   	ret    

003683c3 <__free_double_indir>:
  3683c3:	55                   	push   %ebp
  3683c4:	89 e5                	mov    %esp,%ebp
  3683c6:	83 ec 28             	sub    $0x28,%esp
  3683c9:	ff 75 08             	pushl  0x8(%ebp)
  3683cc:	e8 b9 fe ff ff       	call   36828a <inode_sb>
  3683d1:	83 c4 04             	add    $0x4,%esp
  3683d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3683d7:	ff 75 f0             	pushl  -0x10(%ebp)
  3683da:	e8 95 fe ff ff       	call   368274 <sb_info>
  3683df:	83 c4 04             	add    $0x4,%esp
  3683e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3683e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3683e8:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  3683ec:	66 83 f8 01          	cmp    $0x1,%ax
  3683f0:	75 07                	jne    3683f9 <__free_double_indir+0x36>
  3683f2:	b8 00 02 00 00       	mov    $0x200,%eax
  3683f7:	eb 05                	jmp    3683fe <__free_double_indir+0x3b>
  3683f9:	b8 00 01 00 00       	mov    $0x100,%eax
  3683fe:	89 45 e8             	mov    %eax,-0x18(%ebp)
  368401:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  368405:	75 0a                	jne    368411 <__free_double_indir+0x4e>
  368407:	b8 01 00 00 00       	mov    $0x1,%eax
  36840c:	e9 a8 00 00 00       	jmp    3684b9 <__free_double_indir+0xf6>
  368411:	8b 45 f0             	mov    -0x10(%ebp),%eax
  368414:	8b 40 1c             	mov    0x1c(%eax),%eax
  368417:	83 ec 0c             	sub    $0xc,%esp
  36841a:	50                   	push   %eax
  36841b:	e8 13 33 00 00       	call   36b733 <kalloc>
  368420:	83 c4 10             	add    $0x10,%esp
  368423:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  368426:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  36842a:	75 0a                	jne    368436 <__free_double_indir+0x73>
  36842c:	b8 01 00 00 00       	mov    $0x1,%eax
  368431:	e9 83 00 00 00       	jmp    3684b9 <__free_double_indir+0xf6>
  368436:	8b 45 0c             	mov    0xc(%ebp),%eax
  368439:	83 ec 04             	sub    $0x4,%esp
  36843c:	50                   	push   %eax
  36843d:	ff 75 e4             	pushl  -0x1c(%ebp)
  368440:	ff 75 f0             	pushl  -0x10(%ebp)
  368443:	e8 58 49 00 00       	call   36cda0 <sb_bread>
  368448:	83 c4 10             	add    $0x10,%esp
  36844b:	85 c0                	test   %eax,%eax
  36844d:	75 44                	jne    368493 <__free_double_indir+0xd0>
  36844f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  368456:	eb 33                	jmp    36848b <__free_double_indir+0xc8>
  368458:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36845b:	83 ec 04             	sub    $0x4,%esp
  36845e:	50                   	push   %eax
  36845f:	ff 75 e4             	pushl  -0x1c(%ebp)
  368462:	ff 75 ec             	pushl  -0x14(%ebp)
  368465:	e8 2b fe ff ff       	call   368295 <_get>
  36846a:	83 c4 10             	add    $0x10,%esp
  36846d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  368470:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  368474:	74 11                	je     368487 <__free_double_indir+0xc4>
  368476:	83 ec 08             	sub    $0x8,%esp
  368479:	ff 75 e0             	pushl  -0x20(%ebp)
  36847c:	ff 75 08             	pushl  0x8(%ebp)
  36847f:	e8 47 fe ff ff       	call   3682cb <__free_indir>
  368484:	83 c4 10             	add    $0x10,%esp
  368487:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36848b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36848e:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  368491:	72 c5                	jb     368458 <__free_double_indir+0x95>
  368493:	83 ec 08             	sub    $0x8,%esp
  368496:	ff 75 0c             	pushl  0xc(%ebp)
  368499:	ff 75 08             	pushl  0x8(%ebp)
  36849c:	e8 cc 05 00 00       	call   368a6d <minix_free_block>
  3684a1:	83 c4 10             	add    $0x10,%esp
  3684a4:	83 ec 08             	sub    $0x8,%esp
  3684a7:	6a 00                	push   $0x0
  3684a9:	ff 75 e4             	pushl  -0x1c(%ebp)
  3684ac:	e8 ee 33 00 00       	call   36b89f <kfree_s>
  3684b1:	83 c4 10             	add    $0x10,%esp
  3684b4:	b8 00 00 00 00       	mov    $0x0,%eax
  3684b9:	c9                   	leave  
  3684ba:	c3                   	ret    

003684bb <__free_triple_indir>:
  3684bb:	55                   	push   %ebp
  3684bc:	89 e5                	mov    %esp,%ebp
  3684be:	83 ec 28             	sub    $0x28,%esp
  3684c1:	ff 75 08             	pushl  0x8(%ebp)
  3684c4:	e8 c1 fd ff ff       	call   36828a <inode_sb>
  3684c9:	83 c4 04             	add    $0x4,%esp
  3684cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3684cf:	ff 75 f0             	pushl  -0x10(%ebp)
  3684d2:	e8 9d fd ff ff       	call   368274 <sb_info>
  3684d7:	83 c4 04             	add    $0x4,%esp
  3684da:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3684dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3684e0:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  3684e4:	66 83 f8 01          	cmp    $0x1,%ax
  3684e8:	75 07                	jne    3684f1 <__free_triple_indir+0x36>
  3684ea:	b8 00 02 00 00       	mov    $0x200,%eax
  3684ef:	eb 05                	jmp    3684f6 <__free_triple_indir+0x3b>
  3684f1:	b8 00 01 00 00       	mov    $0x100,%eax
  3684f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3684f9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  3684fd:	75 0a                	jne    368509 <__free_triple_indir+0x4e>
  3684ff:	b8 01 00 00 00       	mov    $0x1,%eax
  368504:	e9 a8 00 00 00       	jmp    3685b1 <__free_triple_indir+0xf6>
  368509:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36850c:	8b 40 1c             	mov    0x1c(%eax),%eax
  36850f:	83 ec 0c             	sub    $0xc,%esp
  368512:	50                   	push   %eax
  368513:	e8 1b 32 00 00       	call   36b733 <kalloc>
  368518:	83 c4 10             	add    $0x10,%esp
  36851b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36851e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  368522:	75 0a                	jne    36852e <__free_triple_indir+0x73>
  368524:	b8 01 00 00 00       	mov    $0x1,%eax
  368529:	e9 83 00 00 00       	jmp    3685b1 <__free_triple_indir+0xf6>
  36852e:	8b 45 0c             	mov    0xc(%ebp),%eax
  368531:	83 ec 04             	sub    $0x4,%esp
  368534:	50                   	push   %eax
  368535:	ff 75 e4             	pushl  -0x1c(%ebp)
  368538:	ff 75 f0             	pushl  -0x10(%ebp)
  36853b:	e8 60 48 00 00       	call   36cda0 <sb_bread>
  368540:	83 c4 10             	add    $0x10,%esp
  368543:	85 c0                	test   %eax,%eax
  368545:	75 44                	jne    36858b <__free_triple_indir+0xd0>
  368547:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36854e:	eb 33                	jmp    368583 <__free_triple_indir+0xc8>
  368550:	8b 45 f4             	mov    -0xc(%ebp),%eax
  368553:	83 ec 04             	sub    $0x4,%esp
  368556:	50                   	push   %eax
  368557:	ff 75 e4             	pushl  -0x1c(%ebp)
  36855a:	ff 75 ec             	pushl  -0x14(%ebp)
  36855d:	e8 33 fd ff ff       	call   368295 <_get>
  368562:	83 c4 10             	add    $0x10,%esp
  368565:	89 45 e0             	mov    %eax,-0x20(%ebp)
  368568:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  36856c:	74 11                	je     36857f <__free_triple_indir+0xc4>
  36856e:	83 ec 08             	sub    $0x8,%esp
  368571:	ff 75 e0             	pushl  -0x20(%ebp)
  368574:	ff 75 08             	pushl  0x8(%ebp)
  368577:	e8 4f fd ff ff       	call   3682cb <__free_indir>
  36857c:	83 c4 10             	add    $0x10,%esp
  36857f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  368583:	8b 45 f4             	mov    -0xc(%ebp),%eax
  368586:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  368589:	72 c5                	jb     368550 <__free_triple_indir+0x95>
  36858b:	83 ec 08             	sub    $0x8,%esp
  36858e:	ff 75 0c             	pushl  0xc(%ebp)
  368591:	ff 75 08             	pushl  0x8(%ebp)
  368594:	e8 d4 04 00 00       	call   368a6d <minix_free_block>
  368599:	83 c4 10             	add    $0x10,%esp
  36859c:	83 ec 08             	sub    $0x8,%esp
  36859f:	6a 00                	push   $0x0
  3685a1:	ff 75 e4             	pushl  -0x1c(%ebp)
  3685a4:	e8 f6 32 00 00       	call   36b89f <kfree_s>
  3685a9:	83 c4 10             	add    $0x10,%esp
  3685ac:	b8 00 00 00 00       	mov    $0x0,%eax
  3685b1:	c9                   	leave  
  3685b2:	c3                   	ret    

003685b3 <truncate>:
  3685b3:	55                   	push   %ebp
  3685b4:	89 e5                	mov    %esp,%ebp
  3685b6:	83 ec 18             	sub    $0x18,%esp
  3685b9:	ff 75 08             	pushl  0x8(%ebp)
  3685bc:	e8 c9 fc ff ff       	call   36828a <inode_sb>
  3685c1:	83 c4 04             	add    $0x4,%esp
  3685c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3685c7:	ff 75 f0             	pushl  -0x10(%ebp)
  3685ca:	e8 a5 fc ff ff       	call   368274 <sb_info>
  3685cf:	83 c4 04             	add    $0x4,%esp
  3685d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  3685d5:	ff 75 08             	pushl  0x8(%ebp)
  3685d8:	e8 a2 fc ff ff       	call   36827f <inode_info>
  3685dd:	83 c4 04             	add    $0x4,%esp
  3685e0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3685e3:	8b 45 08             	mov    0x8(%ebp),%eax
  3685e6:	8b 00                	mov    (%eax),%eax
  3685e8:	25 00 f0 00 00       	and    $0xf000,%eax
  3685ed:	3d 00 80 00 00       	cmp    $0x8000,%eax
  3685f2:	74 27                	je     36861b <truncate+0x68>
  3685f4:	8b 45 08             	mov    0x8(%ebp),%eax
  3685f7:	8b 00                	mov    (%eax),%eax
  3685f9:	25 00 f0 00 00       	and    $0xf000,%eax
  3685fe:	3d 00 40 00 00       	cmp    $0x4000,%eax
  368603:	74 16                	je     36861b <truncate+0x68>
  368605:	8b 45 08             	mov    0x8(%ebp),%eax
  368608:	8b 00                	mov    (%eax),%eax
  36860a:	25 00 f0 00 00       	and    $0xf000,%eax
  36860f:	3d 00 a0 00 00       	cmp    $0xa000,%eax
  368614:	74 05                	je     36861b <truncate+0x68>
  368616:	e9 d2 00 00 00       	jmp    3686ed <truncate+0x13a>
  36861b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  368622:	eb 36                	jmp    36865a <truncate+0xa7>
  368624:	8b 45 e8             	mov    -0x18(%ebp),%eax
  368627:	8b 55 f4             	mov    -0xc(%ebp),%edx
  36862a:	8b 04 90             	mov    (%eax,%edx,4),%eax
  36862d:	85 c0                	test   %eax,%eax
  36862f:	74 25                	je     368656 <truncate+0xa3>
  368631:	8b 45 e8             	mov    -0x18(%ebp),%eax
  368634:	8b 55 f4             	mov    -0xc(%ebp),%edx
  368637:	8b 04 90             	mov    (%eax,%edx,4),%eax
  36863a:	83 ec 08             	sub    $0x8,%esp
  36863d:	50                   	push   %eax
  36863e:	ff 75 08             	pushl  0x8(%ebp)
  368641:	e8 27 04 00 00       	call   368a6d <minix_free_block>
  368646:	83 c4 10             	add    $0x10,%esp
  368649:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36864c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  36864f:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
  368656:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36865a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36865d:	8b 40 14             	mov    0x14(%eax),%eax
  368660:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  368663:	77 bf                	ja     368624 <truncate+0x71>
  368665:	8b 45 e8             	mov    -0x18(%ebp),%eax
  368668:	8b 40 1c             	mov    0x1c(%eax),%eax
  36866b:	85 c0                	test   %eax,%eax
  36866d:	74 1f                	je     36868e <truncate+0xdb>
  36866f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  368672:	8b 40 1c             	mov    0x1c(%eax),%eax
  368675:	83 ec 08             	sub    $0x8,%esp
  368678:	50                   	push   %eax
  368679:	ff 75 08             	pushl  0x8(%ebp)
  36867c:	e8 4a fc ff ff       	call   3682cb <__free_indir>
  368681:	83 c4 10             	add    $0x10,%esp
  368684:	8b 45 e8             	mov    -0x18(%ebp),%eax
  368687:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
  36868e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  368691:	8b 40 20             	mov    0x20(%eax),%eax
  368694:	85 c0                	test   %eax,%eax
  368696:	74 1f                	je     3686b7 <truncate+0x104>
  368698:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36869b:	8b 40 20             	mov    0x20(%eax),%eax
  36869e:	83 ec 08             	sub    $0x8,%esp
  3686a1:	50                   	push   %eax
  3686a2:	ff 75 08             	pushl  0x8(%ebp)
  3686a5:	e8 19 fd ff ff       	call   3683c3 <__free_double_indir>
  3686aa:	83 c4 10             	add    $0x10,%esp
  3686ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3686b0:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
  3686b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  3686ba:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  3686be:	66 83 f8 02          	cmp    $0x2,%ax
  3686c2:	75 29                	jne    3686ed <truncate+0x13a>
  3686c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3686c7:	8b 40 24             	mov    0x24(%eax),%eax
  3686ca:	85 c0                	test   %eax,%eax
  3686cc:	74 1f                	je     3686ed <truncate+0x13a>
  3686ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3686d1:	8b 40 24             	mov    0x24(%eax),%eax
  3686d4:	83 ec 08             	sub    $0x8,%esp
  3686d7:	50                   	push   %eax
  3686d8:	ff 75 08             	pushl  0x8(%ebp)
  3686db:	e8 db fd ff ff       	call   3684bb <__free_triple_indir>
  3686e0:	83 c4 10             	add    $0x10,%esp
  3686e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  3686e6:	c7 40 24 00 00 00 00 	movl   $0x0,0x24(%eax)
  3686ed:	c9                   	leave  
  3686ee:	c3                   	ret    

003686ef <time>:
  3686ef:	55                   	push   %ebp
  3686f0:	89 e5                	mov    %esp,%ebp
  3686f2:	57                   	push   %edi
  3686f3:	56                   	push   %esi
  3686f4:	53                   	push   %ebx
  3686f5:	83 ec 10             	sub    $0x10,%esp
  3686f8:	b8 01 00 00 00       	mov    $0x1,%eax
  3686fd:	bb 07 00 00 00       	mov    $0x7,%ebx
  368702:	b9 10 00 00 00       	mov    $0x10,%ecx
  368707:	8b 55 08             	mov    0x8(%ebp),%edx
  36870a:	be 00 00 00 00       	mov    $0x0,%esi
  36870f:	bf 00 00 00 00       	mov    $0x0,%edi
  368714:	cd 80                	int    $0x80
  368716:	89 45 f0             	mov    %eax,-0x10(%ebp)
  368719:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36871c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36871f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  368723:	74 0e                	je     368733 <time+0x44>
  368725:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  368729:	7e 08                	jle    368733 <time+0x44>
  36872b:	8b 45 08             	mov    0x8(%ebp),%eax
  36872e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  368731:	89 10                	mov    %edx,(%eax)
  368733:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368736:	83 c4 10             	add    $0x10,%esp
  368739:	5b                   	pop    %ebx
  36873a:	5e                   	pop    %esi
  36873b:	5f                   	pop    %edi
  36873c:	5d                   	pop    %ebp
  36873d:	c3                   	ret    

0036873e <sb_info>:
  36873e:	55                   	push   %ebp
  36873f:	89 e5                	mov    %esp,%ebp
  368741:	8b 45 08             	mov    0x8(%ebp),%eax
  368744:	83 c0 70             	add    $0x70,%eax
  368747:	5d                   	pop    %ebp
  368748:	c3                   	ret    

00368749 <inode_sb>:
  368749:	55                   	push   %ebp
  36874a:	89 e5                	mov    %esp,%ebp
  36874c:	8b 45 08             	mov    0x8(%ebp),%eax
  36874f:	8b 40 1c             	mov    0x1c(%eax),%eax
  368752:	5d                   	pop    %ebp
  368753:	c3                   	ret    

00368754 <memset>:
  368754:	55                   	push   %ebp
  368755:	89 e5                	mov    %esp,%ebp
  368757:	57                   	push   %edi
  368758:	8b 45 0c             	mov    0xc(%ebp),%eax
  36875b:	8b 55 08             	mov    0x8(%ebp),%edx
  36875e:	8b 4d 10             	mov    0x10(%ebp),%ecx
  368761:	89 d7                	mov    %edx,%edi
  368763:	fc                   	cld    
  368764:	f3 aa                	rep stos %al,%es:(%edi)
  368766:	8b 45 08             	mov    0x8(%ebp),%eax
  368769:	5f                   	pop    %edi
  36876a:	5d                   	pop    %ebp
  36876b:	c3                   	ret    

0036876c <__set_bit>:
  36876c:	55                   	push   %ebp
  36876d:	89 e5                	mov    %esp,%ebp
  36876f:	8b 45 0c             	mov    0xc(%ebp),%eax
  368772:	8b 55 08             	mov    0x8(%ebp),%edx
  368775:	0f ab 10             	bts    %edx,(%eax)
  368778:	5d                   	pop    %ebp
  368779:	c3                   	ret    

0036877a <ffz>:
  36877a:	55                   	push   %ebp
  36877b:	89 e5                	mov    %esp,%ebp
  36877d:	8b 45 08             	mov    0x8(%ebp),%eax
  368780:	f7 d0                	not    %eax
  368782:	f3 0f bc c0          	tzcnt  %eax,%eax
  368786:	89 45 08             	mov    %eax,0x8(%ebp)
  368789:	8b 45 08             	mov    0x8(%ebp),%eax
  36878c:	5d                   	pop    %ebp
  36878d:	c3                   	ret    

0036878e <find_first_zero_bit>:
  36878e:	55                   	push   %ebp
  36878f:	89 e5                	mov    %esp,%ebp
  368791:	53                   	push   %ebx
  368792:	83 ec 10             	sub    $0x10,%esp
  368795:	8b 45 08             	mov    0x8(%ebp),%eax
  368798:	89 45 f8             	mov    %eax,-0x8(%ebp)
  36879b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3687a2:	eb 1e                	jmp    3687c2 <find_first_zero_bit+0x34>
  3687a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  3687a7:	8d 50 04             	lea    0x4(%eax),%edx
  3687aa:	89 55 f8             	mov    %edx,-0x8(%ebp)
  3687ad:	8b 00                	mov    (%eax),%eax
  3687af:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3687b2:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  3687b6:	74 02                	je     3687ba <find_first_zero_bit+0x2c>
  3687b8:	eb 45                	jmp    3687ff <find_first_zero_bit+0x71>
  3687ba:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
  3687be:	83 6d 0c 20          	subl   $0x20,0xc(%ebp)
  3687c2:	8b 45 0c             	mov    0xc(%ebp),%eax
  3687c5:	83 e0 e0             	and    $0xffffffe0,%eax
  3687c8:	85 c0                	test   %eax,%eax
  3687ca:	75 d8                	jne    3687a4 <find_first_zero_bit+0x16>
  3687cc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  3687d0:	75 05                	jne    3687d7 <find_first_zero_bit+0x49>
  3687d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3687d5:	eb 3a                	jmp    368811 <find_first_zero_bit+0x83>
  3687d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  3687da:	8b 10                	mov    (%eax),%edx
  3687dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  3687df:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  3687e4:	89 c1                	mov    %eax,%ecx
  3687e6:	d3 e3                	shl    %cl,%ebx
  3687e8:	89 d8                	mov    %ebx,%eax
  3687ea:	09 d0                	or     %edx,%eax
  3687ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
  3687ef:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
  3687f3:	75 0a                	jne    3687ff <find_first_zero_bit+0x71>
  3687f5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  3687f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  3687fb:	01 d0                	add    %edx,%eax
  3687fd:	eb 12                	jmp    368811 <find_first_zero_bit+0x83>
  3687ff:	ff 75 f0             	pushl  -0x10(%ebp)
  368802:	e8 73 ff ff ff       	call   36877a <ffz>
  368807:	83 c4 04             	add    $0x4,%esp
  36880a:	89 c2                	mov    %eax,%edx
  36880c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36880f:	01 d0                	add    %edx,%eax
  368811:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  368814:	c9                   	leave  
  368815:	c3                   	ret    

00368816 <__test_and_clear_bit>:
  368816:	55                   	push   %ebp
  368817:	89 e5                	mov    %esp,%ebp
  368819:	83 ec 10             	sub    $0x10,%esp
  36881c:	8b 55 0c             	mov    0xc(%ebp),%edx
  36881f:	8b 45 08             	mov    0x8(%ebp),%eax
  368822:	0f b3 02             	btr    %eax,(%edx)
  368825:	19 c0                	sbb    %eax,%eax
  368827:	89 45 fc             	mov    %eax,-0x4(%ebp)
  36882a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  36882d:	c9                   	leave  
  36882e:	c3                   	ret    

0036882f <__test_and_set_bit>:
  36882f:	55                   	push   %ebp
  368830:	89 e5                	mov    %esp,%ebp
  368832:	83 ec 10             	sub    $0x10,%esp
  368835:	8b 55 0c             	mov    0xc(%ebp),%edx
  368838:	8b 45 08             	mov    0x8(%ebp),%eax
  36883b:	0f ab 02             	bts    %eax,(%edx)
  36883e:	19 c0                	sbb    %eax,%eax
  368840:	89 45 fc             	mov    %eax,-0x4(%ebp)
  368843:	8b 45 fc             	mov    -0x4(%ebp),%eax
  368846:	c9                   	leave  
  368847:	c3                   	ret    

00368848 <hweight8>:
  368848:	55                   	push   %ebp
  368849:	89 e5                	mov    %esp,%ebp
  36884b:	57                   	push   %edi
  36884c:	56                   	push   %esi
  36884d:	53                   	push   %ebx
  36884e:	83 ec 3c             	sub    $0x3c,%esp
  368851:	8b 45 08             	mov    0x8(%ebp),%eax
  368854:	88 45 ec             	mov    %al,-0x14(%ebp)
  368857:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  36885b:	ba 00 00 00 00       	mov    $0x0,%edx
  368860:	89 c7                	mov    %eax,%edi
  368862:	83 e7 01             	and    $0x1,%edi
  368865:	89 f9                	mov    %edi,%ecx
  368867:	89 d0                	mov    %edx,%eax
  368869:	83 e0 00             	and    $0x0,%eax
  36886c:	89 c3                	mov    %eax,%ebx
  36886e:	89 c8                	mov    %ecx,%eax
  368870:	09 d8                	or     %ebx,%eax
  368872:	85 c0                	test   %eax,%eax
  368874:	0f 95 c0             	setne  %al
  368877:	0f b6 c8             	movzbl %al,%ecx
  36887a:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  36887e:	ba 00 00 00 00       	mov    $0x0,%edx
  368883:	89 c7                	mov    %eax,%edi
  368885:	83 e7 02             	and    $0x2,%edi
  368888:	89 7d e0             	mov    %edi,-0x20(%ebp)
  36888b:	89 d0                	mov    %edx,%eax
  36888d:	83 e0 00             	and    $0x0,%eax
  368890:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  368893:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368896:	0b 45 e4             	or     -0x1c(%ebp),%eax
  368899:	85 c0                	test   %eax,%eax
  36889b:	0f 95 c0             	setne  %al
  36889e:	0f b6 c0             	movzbl %al,%eax
  3688a1:	01 c1                	add    %eax,%ecx
  3688a3:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  3688a7:	ba 00 00 00 00       	mov    $0x0,%edx
  3688ac:	89 c7                	mov    %eax,%edi
  3688ae:	83 e7 04             	and    $0x4,%edi
  3688b1:	89 7d d8             	mov    %edi,-0x28(%ebp)
  3688b4:	89 d0                	mov    %edx,%eax
  3688b6:	83 e0 00             	and    $0x0,%eax
  3688b9:	89 45 dc             	mov    %eax,-0x24(%ebp)
  3688bc:	8b 5d d8             	mov    -0x28(%ebp),%ebx
  3688bf:	8b 75 dc             	mov    -0x24(%ebp),%esi
  3688c2:	89 d8                	mov    %ebx,%eax
  3688c4:	09 f0                	or     %esi,%eax
  3688c6:	85 c0                	test   %eax,%eax
  3688c8:	0f 95 c0             	setne  %al
  3688cb:	0f b6 c0             	movzbl %al,%eax
  3688ce:	01 c1                	add    %eax,%ecx
  3688d0:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  3688d4:	ba 00 00 00 00       	mov    $0x0,%edx
  3688d9:	89 c7                	mov    %eax,%edi
  3688db:	83 e7 08             	and    $0x8,%edi
  3688de:	89 7d d0             	mov    %edi,-0x30(%ebp)
  3688e1:	89 d0                	mov    %edx,%eax
  3688e3:	83 e0 00             	and    $0x0,%eax
  3688e6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  3688e9:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  3688ec:	8b 75 d4             	mov    -0x2c(%ebp),%esi
  3688ef:	89 d8                	mov    %ebx,%eax
  3688f1:	09 f0                	or     %esi,%eax
  3688f3:	85 c0                	test   %eax,%eax
  3688f5:	0f 95 c0             	setne  %al
  3688f8:	0f b6 c0             	movzbl %al,%eax
  3688fb:	01 c1                	add    %eax,%ecx
  3688fd:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  368901:	ba 00 00 00 00       	mov    $0x0,%edx
  368906:	89 c7                	mov    %eax,%edi
  368908:	83 e7 10             	and    $0x10,%edi
  36890b:	89 7d c8             	mov    %edi,-0x38(%ebp)
  36890e:	89 d0                	mov    %edx,%eax
  368910:	83 e0 00             	and    $0x0,%eax
  368913:	89 45 cc             	mov    %eax,-0x34(%ebp)
  368916:	8b 5d c8             	mov    -0x38(%ebp),%ebx
  368919:	8b 75 cc             	mov    -0x34(%ebp),%esi
  36891c:	89 d8                	mov    %ebx,%eax
  36891e:	09 f0                	or     %esi,%eax
  368920:	85 c0                	test   %eax,%eax
  368922:	0f 95 c0             	setne  %al
  368925:	0f b6 c0             	movzbl %al,%eax
  368928:	01 c1                	add    %eax,%ecx
  36892a:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  36892e:	ba 00 00 00 00       	mov    $0x0,%edx
  368933:	89 c7                	mov    %eax,%edi
  368935:	83 e7 20             	and    $0x20,%edi
  368938:	89 7d c0             	mov    %edi,-0x40(%ebp)
  36893b:	89 d0                	mov    %edx,%eax
  36893d:	83 e0 00             	and    $0x0,%eax
  368940:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  368943:	8b 5d c0             	mov    -0x40(%ebp),%ebx
  368946:	8b 75 c4             	mov    -0x3c(%ebp),%esi
  368949:	89 d8                	mov    %ebx,%eax
  36894b:	09 f0                	or     %esi,%eax
  36894d:	85 c0                	test   %eax,%eax
  36894f:	0f 95 c0             	setne  %al
  368952:	0f b6 c0             	movzbl %al,%eax
  368955:	01 c1                	add    %eax,%ecx
  368957:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  36895b:	ba 00 00 00 00       	mov    $0x0,%edx
  368960:	89 c7                	mov    %eax,%edi
  368962:	83 e7 40             	and    $0x40,%edi
  368965:	89 7d b8             	mov    %edi,-0x48(%ebp)
  368968:	89 d0                	mov    %edx,%eax
  36896a:	83 e0 00             	and    $0x0,%eax
  36896d:	89 45 bc             	mov    %eax,-0x44(%ebp)
  368970:	8b 5d b8             	mov    -0x48(%ebp),%ebx
  368973:	8b 75 bc             	mov    -0x44(%ebp),%esi
  368976:	89 d8                	mov    %ebx,%eax
  368978:	09 f0                	or     %esi,%eax
  36897a:	85 c0                	test   %eax,%eax
  36897c:	0f 95 c0             	setne  %al
  36897f:	0f b6 c0             	movzbl %al,%eax
  368982:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  368985:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  368989:	c0 e8 07             	shr    $0x7,%al
  36898c:	0f b6 c0             	movzbl %al,%eax
  36898f:	01 d0                	add    %edx,%eax
  368991:	83 c4 3c             	add    $0x3c,%esp
  368994:	5b                   	pop    %ebx
  368995:	5e                   	pop    %esi
  368996:	5f                   	pop    %edi
  368997:	5d                   	pop    %ebp
  368998:	c3                   	ret    

00368999 <hweight16>:
  368999:	55                   	push   %ebp
  36899a:	89 e5                	mov    %esp,%ebp
  36899c:	53                   	push   %ebx
  36899d:	83 ec 0c             	sub    $0xc,%esp
  3689a0:	8b 45 08             	mov    0x8(%ebp),%eax
  3689a3:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  3689a7:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  3689ab:	0f b6 c0             	movzbl %al,%eax
  3689ae:	83 ec 04             	sub    $0x4,%esp
  3689b1:	50                   	push   %eax
  3689b2:	e8 91 fe ff ff       	call   368848 <hweight8>
  3689b7:	83 c4 08             	add    $0x8,%esp
  3689ba:	89 c3                	mov    %eax,%ebx
  3689bc:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  3689c0:	66 c1 e8 08          	shr    $0x8,%ax
  3689c4:	0f b6 c0             	movzbl %al,%eax
  3689c7:	83 ec 04             	sub    $0x4,%esp
  3689ca:	50                   	push   %eax
  3689cb:	e8 78 fe ff ff       	call   368848 <hweight8>
  3689d0:	83 c4 08             	add    $0x8,%esp
  3689d3:	01 d8                	add    %ebx,%eax
  3689d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  3689d8:	c9                   	leave  
  3689d9:	c3                   	ret    

003689da <count_free>:
  3689da:	55                   	push   %ebp
  3689db:	89 e5                	mov    %esp,%ebp
  3689dd:	83 ec 10             	sub    $0x10,%esp
  3689e0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  3689e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  3689ea:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
  3689f1:	8b 45 10             	mov    0x10(%ebp),%eax
  3689f4:	01 d0                	add    %edx,%eax
  3689f6:	83 e8 01             	sub    $0x1,%eax
  3689f9:	8b 55 0c             	mov    0xc(%ebp),%edx
  3689fc:	8d 0c d5 00 00 00 00 	lea    0x0(,%edx,8),%ecx
  368a03:	ba 00 00 00 00       	mov    $0x0,%edx
  368a08:	f7 f1                	div    %ecx
  368a0a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  368a0d:	eb 4c                	jmp    368a5b <count_free+0x81>
  368a0f:	8b 45 0c             	mov    0xc(%ebp),%eax
  368a12:	d1 e8                	shr    %eax
  368a14:	89 45 f4             	mov    %eax,-0xc(%ebp)
  368a17:	8b 45 08             	mov    0x8(%ebp),%eax
  368a1a:	8d 50 04             	lea    0x4(%eax),%edx
  368a1d:	89 55 08             	mov    %edx,0x8(%ebp)
  368a20:	8b 00                	mov    (%eax),%eax
  368a22:	89 45 f0             	mov    %eax,-0x10(%ebp)
  368a25:	eb 27                	jmp    368a4e <count_free+0x74>
  368a27:	8b 45 f0             	mov    -0x10(%ebp),%eax
  368a2a:	8d 50 02             	lea    0x2(%eax),%edx
  368a2d:	89 55 f0             	mov    %edx,-0x10(%ebp)
  368a30:	0f b7 00             	movzwl (%eax),%eax
  368a33:	0f b7 c0             	movzwl %ax,%eax
  368a36:	83 ec 04             	sub    $0x4,%esp
  368a39:	50                   	push   %eax
  368a3a:	e8 5a ff ff ff       	call   368999 <hweight16>
  368a3f:	83 c4 08             	add    $0x8,%esp
  368a42:	ba 10 00 00 00       	mov    $0x10,%edx
  368a47:	29 c2                	sub    %eax,%edx
  368a49:	89 d0                	mov    %edx,%eax
  368a4b:	01 45 fc             	add    %eax,-0x4(%ebp)
  368a4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  368a51:	8d 50 ff             	lea    -0x1(%eax),%edx
  368a54:	89 55 f4             	mov    %edx,-0xc(%ebp)
  368a57:	85 c0                	test   %eax,%eax
  368a59:	75 cc                	jne    368a27 <count_free+0x4d>
  368a5b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  368a5e:	8d 50 ff             	lea    -0x1(%eax),%edx
  368a61:	89 55 f8             	mov    %edx,-0x8(%ebp)
  368a64:	85 c0                	test   %eax,%eax
  368a66:	75 a7                	jne    368a0f <count_free+0x35>
  368a68:	8b 45 fc             	mov    -0x4(%ebp),%eax
  368a6b:	c9                   	leave  
  368a6c:	c3                   	ret    

00368a6d <minix_free_block>:
  368a6d:	55                   	push   %ebp
  368a6e:	89 e5                	mov    %esp,%ebp
  368a70:	83 ec 28             	sub    $0x28,%esp
  368a73:	ff 75 08             	pushl  0x8(%ebp)
  368a76:	e8 ce fc ff ff       	call   368749 <inode_sb>
  368a7b:	83 c4 04             	add    $0x4,%esp
  368a7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  368a81:	ff 75 f4             	pushl  -0xc(%ebp)
  368a84:	e8 b5 fc ff ff       	call   36873e <sb_info>
  368a89:	83 c4 04             	add    $0x4,%esp
  368a8c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  368a8f:	c7 45 ec 0d 00 00 00 	movl   $0xd,-0x14(%ebp)
  368a96:	8b 45 f0             	mov    -0x10(%ebp),%eax
  368a99:	8b 40 18             	mov    0x18(%eax),%eax
  368a9c:	3b 45 0c             	cmp    0xc(%ebp),%eax
  368a9f:	77 0b                	ja     368aac <minix_free_block+0x3f>
  368aa1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  368aa4:	8b 40 04             	mov    0x4(%eax),%eax
  368aa7:	3b 45 0c             	cmp    0xc(%ebp),%eax
  368aaa:	77 1a                	ja     368ac6 <minix_free_block+0x59>
  368aac:	83 ec 08             	sub    $0x8,%esp
  368aaf:	68 a4 e2 36 00       	push   $0x36e2a4
  368ab4:	68 ac e2 36 00       	push   $0x36e2ac
  368ab9:	e8 ca 05 00 00       	call   369088 <printk>
  368abe:	83 c4 10             	add    $0x10,%esp
  368ac1:	e9 b7 00 00 00       	jmp    368b7d <minix_free_block+0x110>
  368ac6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  368ac9:	8b 40 18             	mov    0x18(%eax),%eax
  368acc:	8b 55 0c             	mov    0xc(%ebp),%edx
  368acf:	29 c2                	sub    %eax,%edx
  368ad1:	89 d0                	mov    %edx,%eax
  368ad3:	83 c0 01             	add    $0x1,%eax
  368ad6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  368ad9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368adc:	ba 01 00 00 00       	mov    $0x1,%edx
  368ae1:	89 c1                	mov    %eax,%ecx
  368ae3:	d3 e2                	shl    %cl,%edx
  368ae5:	89 d0                	mov    %edx,%eax
  368ae7:	83 e8 01             	sub    $0x1,%eax
  368aea:	23 45 e8             	and    -0x18(%ebp),%eax
  368aed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  368af0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368af3:	89 c1                	mov    %eax,%ecx
  368af5:	d3 6d e8             	shrl   %cl,-0x18(%ebp)
  368af8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  368afb:	8b 40 0c             	mov    0xc(%eax),%eax
  368afe:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  368b01:	77 17                	ja     368b1a <minix_free_block+0xad>
  368b03:	83 ec 08             	sub    $0x8,%esp
  368b06:	68 a4 e2 36 00       	push   $0x36e2a4
  368b0b:	68 e0 e2 36 00       	push   $0x36e2e0
  368b10:	e8 73 05 00 00       	call   369088 <printk>
  368b15:	83 c4 10             	add    $0x10,%esp
  368b18:	eb 63                	jmp    368b7d <minix_free_block+0x110>
  368b1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  368b1d:	8b 40 30             	mov    0x30(%eax),%eax
  368b20:	8b 55 e8             	mov    -0x18(%ebp),%edx
  368b23:	c1 e2 02             	shl    $0x2,%edx
  368b26:	01 d0                	add    %edx,%eax
  368b28:	8b 00                	mov    (%eax),%eax
  368b2a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  368b2d:	fa                   	cli    
  368b2e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  368b31:	83 ec 08             	sub    $0x8,%esp
  368b34:	ff 75 e0             	pushl  -0x20(%ebp)
  368b37:	50                   	push   %eax
  368b38:	e8 d9 fc ff ff       	call   368816 <__test_and_clear_bit>
  368b3d:	83 c4 10             	add    $0x10,%esp
  368b40:	85 c0                	test   %eax,%eax
  368b42:	75 18                	jne    368b5c <minix_free_block+0xef>
  368b44:	83 ec 04             	sub    $0x4,%esp
  368b47:	ff 75 0c             	pushl  0xc(%ebp)
  368b4a:	68 a4 e2 36 00       	push   $0x36e2a4
  368b4f:	68 08 e3 36 00       	push   $0x36e308
  368b54:	e8 2f 05 00 00       	call   369088 <printk>
  368b59:	83 c4 10             	add    $0x10,%esp
  368b5c:	fb                   	sti    
  368b5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  368b60:	8b 50 08             	mov    0x8(%eax),%edx
  368b63:	8b 45 e8             	mov    -0x18(%ebp),%eax
  368b66:	01 d0                	add    %edx,%eax
  368b68:	83 c0 02             	add    $0x2,%eax
  368b6b:	83 ec 04             	sub    $0x4,%esp
  368b6e:	50                   	push   %eax
  368b6f:	ff 75 e0             	pushl  -0x20(%ebp)
  368b72:	ff 75 f4             	pushl  -0xc(%ebp)
  368b75:	e8 46 42 00 00       	call   36cdc0 <sb_bwrite>
  368b7a:	83 c4 10             	add    $0x10,%esp
  368b7d:	c9                   	leave  
  368b7e:	c3                   	ret    

00368b7f <clear_block>:
  368b7f:	55                   	push   %ebp
  368b80:	89 e5                	mov    %esp,%ebp
  368b82:	83 ec 18             	sub    $0x18,%esp
  368b85:	83 ec 0c             	sub    $0xc,%esp
  368b88:	68 00 04 00 00       	push   $0x400
  368b8d:	e8 a1 2b 00 00       	call   36b733 <kalloc>
  368b92:	83 c4 10             	add    $0x10,%esp
  368b95:	89 45 f4             	mov    %eax,-0xc(%ebp)
  368b98:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  368b9c:	74 2a                	je     368bc8 <clear_block+0x49>
  368b9e:	83 ec 04             	sub    $0x4,%esp
  368ba1:	68 00 04 00 00       	push   $0x400
  368ba6:	6a 00                	push   $0x0
  368ba8:	ff 75 f4             	pushl  -0xc(%ebp)
  368bab:	e8 a4 fb ff ff       	call   368754 <memset>
  368bb0:	83 c4 10             	add    $0x10,%esp
  368bb3:	8b 45 0c             	mov    0xc(%ebp),%eax
  368bb6:	83 ec 04             	sub    $0x4,%esp
  368bb9:	50                   	push   %eax
  368bba:	ff 75 f4             	pushl  -0xc(%ebp)
  368bbd:	ff 75 08             	pushl  0x8(%ebp)
  368bc0:	e8 fb 41 00 00       	call   36cdc0 <sb_bwrite>
  368bc5:	83 c4 10             	add    $0x10,%esp
  368bc8:	c9                   	leave  
  368bc9:	c3                   	ret    

00368bca <minix_new_block>:
  368bca:	55                   	push   %ebp
  368bcb:	89 e5                	mov    %esp,%ebp
  368bcd:	83 ec 28             	sub    $0x28,%esp
  368bd0:	ff 75 08             	pushl  0x8(%ebp)
  368bd3:	e8 71 fb ff ff       	call   368749 <inode_sb>
  368bd8:	83 c4 04             	add    $0x4,%esp
  368bdb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  368bde:	ff 75 f0             	pushl  -0x10(%ebp)
  368be1:	e8 58 fb ff ff       	call   36873e <sb_info>
  368be6:	83 c4 04             	add    $0x4,%esp
  368be9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  368bec:	8b 45 f0             	mov    -0x10(%ebp),%eax
  368bef:	8b 40 1c             	mov    0x1c(%eax),%eax
  368bf2:	c1 e0 03             	shl    $0x3,%eax
  368bf5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  368bf8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  368bff:	e9 aa 00 00 00       	jmp    368cae <minix_new_block+0xe4>
  368c04:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368c07:	8b 40 30             	mov    0x30(%eax),%eax
  368c0a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  368c0d:	c1 e2 02             	shl    $0x2,%edx
  368c10:	01 d0                	add    %edx,%eax
  368c12:	8b 00                	mov    (%eax),%eax
  368c14:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  368c17:	fa                   	cli    
  368c18:	ff 75 e8             	pushl  -0x18(%ebp)
  368c1b:	ff 75 e4             	pushl  -0x1c(%ebp)
  368c1e:	e8 6b fb ff ff       	call   36878e <find_first_zero_bit>
  368c23:	83 c4 08             	add    $0x8,%esp
  368c26:	89 45 e0             	mov    %eax,-0x20(%ebp)
  368c29:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368c2c:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  368c2f:	73 78                	jae    368ca9 <minix_new_block+0xdf>
  368c31:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368c34:	ff 75 e4             	pushl  -0x1c(%ebp)
  368c37:	50                   	push   %eax
  368c38:	e8 2f fb ff ff       	call   36876c <__set_bit>
  368c3d:	83 c4 08             	add    $0x8,%esp
  368c40:	fb                   	sti    
  368c41:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368c44:	8b 50 08             	mov    0x8(%eax),%edx
  368c47:	8b 45 f4             	mov    -0xc(%ebp),%eax
  368c4a:	01 d0                	add    %edx,%eax
  368c4c:	83 c0 02             	add    $0x2,%eax
  368c4f:	83 ec 04             	sub    $0x4,%esp
  368c52:	50                   	push   %eax
  368c53:	ff 75 e4             	pushl  -0x1c(%ebp)
  368c56:	ff 75 f0             	pushl  -0x10(%ebp)
  368c59:	e8 62 41 00 00       	call   36cdc0 <sb_bwrite>
  368c5e:	83 c4 10             	add    $0x10,%esp
  368c61:	8b 45 f4             	mov    -0xc(%ebp),%eax
  368c64:	0f af 45 e8          	imul   -0x18(%ebp),%eax
  368c68:	89 c2                	mov    %eax,%edx
  368c6a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368c6d:	8b 40 18             	mov    0x18(%eax),%eax
  368c70:	01 c2                	add    %eax,%edx
  368c72:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368c75:	01 d0                	add    %edx,%eax
  368c77:	83 e8 01             	sub    $0x1,%eax
  368c7a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  368c7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368c80:	8b 40 18             	mov    0x18(%eax),%eax
  368c83:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  368c86:	77 35                	ja     368cbd <minix_new_block+0xf3>
  368c88:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368c8b:	8b 40 04             	mov    0x4(%eax),%eax
  368c8e:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  368c91:	76 2a                	jbe    368cbd <minix_new_block+0xf3>
  368c93:	83 ec 08             	sub    $0x8,%esp
  368c96:	ff 75 e0             	pushl  -0x20(%ebp)
  368c99:	ff 75 f0             	pushl  -0x10(%ebp)
  368c9c:	e8 de fe ff ff       	call   368b7f <clear_block>
  368ca1:	83 c4 10             	add    $0x10,%esp
  368ca4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368ca7:	eb 19                	jmp    368cc2 <minix_new_block+0xf8>
  368ca9:	fb                   	sti    
  368caa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  368cae:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368cb1:	8b 40 0c             	mov    0xc(%eax),%eax
  368cb4:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  368cb7:	0f 87 47 ff ff ff    	ja     368c04 <minix_new_block+0x3a>
  368cbd:	b8 00 00 00 00       	mov    $0x0,%eax
  368cc2:	c9                   	leave  
  368cc3:	c3                   	ret    

00368cc4 <minix_count_free_blocks>:
  368cc4:	55                   	push   %ebp
  368cc5:	89 e5                	mov    %esp,%ebp
  368cc7:	83 ec 10             	sub    $0x10,%esp
  368cca:	ff 75 08             	pushl  0x8(%ebp)
  368ccd:	e8 6c fa ff ff       	call   36873e <sb_info>
  368cd2:	83 c4 04             	add    $0x4,%esp
  368cd5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  368cd8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  368cdb:	8b 50 04             	mov    0x4(%eax),%edx
  368cde:	8b 45 fc             	mov    -0x4(%ebp),%eax
  368ce1:	8b 40 18             	mov    0x18(%eax),%eax
  368ce4:	29 c2                	sub    %eax,%edx
  368ce6:	89 d0                	mov    %edx,%eax
  368ce8:	83 c0 01             	add    $0x1,%eax
  368ceb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  368cee:	8b 45 08             	mov    0x8(%ebp),%eax
  368cf1:	8b 50 1c             	mov    0x1c(%eax),%edx
  368cf4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  368cf7:	8b 40 30             	mov    0x30(%eax),%eax
  368cfa:	83 ec 04             	sub    $0x4,%esp
  368cfd:	ff 75 f8             	pushl  -0x8(%ebp)
  368d00:	52                   	push   %edx
  368d01:	50                   	push   %eax
  368d02:	e8 d3 fc ff ff       	call   3689da <count_free>
  368d07:	83 c4 10             	add    $0x10,%esp
  368d0a:	89 c2                	mov    %eax,%edx
  368d0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  368d0f:	8b 40 1c             	mov    0x1c(%eax),%eax
  368d12:	89 c1                	mov    %eax,%ecx
  368d14:	d3 e2                	shl    %cl,%edx
  368d16:	89 d0                	mov    %edx,%eax
  368d18:	c9                   	leave  
  368d19:	c3                   	ret    

00368d1a <minix_clear_inode>:
  368d1a:	55                   	push   %ebp
  368d1b:	89 e5                	mov    %esp,%ebp
  368d1d:	83 ec 08             	sub    $0x8,%esp
  368d20:	8b 45 08             	mov    0x8(%ebp),%eax
  368d23:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
  368d2a:	8b 45 08             	mov    0x8(%ebp),%eax
  368d2d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  368d33:	83 ec 0c             	sub    $0xc,%esp
  368d36:	ff 75 08             	pushl  0x8(%ebp)
  368d39:	e8 75 f8 ff ff       	call   3685b3 <truncate>
  368d3e:	83 c4 10             	add    $0x10,%esp
  368d41:	83 ec 0c             	sub    $0xc,%esp
  368d44:	ff 75 08             	pushl  0x8(%ebp)
  368d47:	e8 28 eb ff ff       	call   367874 <minix_sync_inode>
  368d4c:	83 c4 10             	add    $0x10,%esp
  368d4f:	c9                   	leave  
  368d50:	c3                   	ret    

00368d51 <minix_free_inode>:
  368d51:	55                   	push   %ebp
  368d52:	89 e5                	mov    %esp,%ebp
  368d54:	83 ec 28             	sub    $0x28,%esp
  368d57:	ff 75 08             	pushl  0x8(%ebp)
  368d5a:	e8 ea f9 ff ff       	call   368749 <inode_sb>
  368d5f:	83 c4 04             	add    $0x4,%esp
  368d62:	89 45 f4             	mov    %eax,-0xc(%ebp)
  368d65:	ff 75 f4             	pushl  -0xc(%ebp)
  368d68:	e8 d1 f9 ff ff       	call   36873e <sb_info>
  368d6d:	83 c4 04             	add    $0x4,%esp
  368d70:	89 45 f0             	mov    %eax,-0x10(%ebp)
  368d73:	c7 45 ec 0d 00 00 00 	movl   $0xd,-0x14(%ebp)
  368d7a:	8b 45 08             	mov    0x8(%ebp),%eax
  368d7d:	8b 40 10             	mov    0x10(%eax),%eax
  368d80:	89 45 e8             	mov    %eax,-0x18(%ebp)
  368d83:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  368d87:	74 0a                	je     368d93 <minix_free_inode+0x42>
  368d89:	8b 45 f0             	mov    -0x10(%ebp),%eax
  368d8c:	8b 00                	mov    (%eax),%eax
  368d8e:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  368d91:	73 1a                	jae    368dad <minix_free_inode+0x5c>
  368d93:	83 ec 08             	sub    $0x8,%esp
  368d96:	68 a4 e2 36 00       	push   $0x36e2a4
  368d9b:	68 30 e3 36 00       	push   $0x36e330
  368da0:	e8 e3 02 00 00       	call   369088 <printk>
  368da5:	83 c4 10             	add    $0x10,%esp
  368da8:	e9 aa 00 00 00       	jmp    368e57 <minix_free_inode+0x106>
  368dad:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368db0:	ba 01 00 00 00       	mov    $0x1,%edx
  368db5:	89 c1                	mov    %eax,%ecx
  368db7:	d3 e2                	shl    %cl,%edx
  368db9:	89 d0                	mov    %edx,%eax
  368dbb:	83 e8 01             	sub    $0x1,%eax
  368dbe:	23 45 e8             	and    -0x18(%ebp),%eax
  368dc1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  368dc4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368dc7:	89 c1                	mov    %eax,%ecx
  368dc9:	d3 6d e8             	shrl   %cl,-0x18(%ebp)
  368dcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  368dcf:	8b 40 08             	mov    0x8(%eax),%eax
  368dd2:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  368dd5:	77 17                	ja     368dee <minix_free_inode+0x9d>
  368dd7:	83 ec 08             	sub    $0x8,%esp
  368dda:	68 a4 e2 36 00       	push   $0x36e2a4
  368ddf:	68 5c e3 36 00       	push   $0x36e35c
  368de4:	e8 9f 02 00 00       	call   369088 <printk>
  368de9:	83 c4 10             	add    $0x10,%esp
  368dec:	eb 69                	jmp    368e57 <minix_free_inode+0x106>
  368dee:	83 ec 0c             	sub    $0xc,%esp
  368df1:	ff 75 08             	pushl  0x8(%ebp)
  368df4:	e8 21 ff ff ff       	call   368d1a <minix_clear_inode>
  368df9:	83 c4 10             	add    $0x10,%esp
  368dfc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  368dff:	8b 40 2c             	mov    0x2c(%eax),%eax
  368e02:	8b 55 e8             	mov    -0x18(%ebp),%edx
  368e05:	c1 e2 02             	shl    $0x2,%edx
  368e08:	01 d0                	add    %edx,%eax
  368e0a:	8b 00                	mov    (%eax),%eax
  368e0c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  368e0f:	fa                   	cli    
  368e10:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  368e13:	83 ec 08             	sub    $0x8,%esp
  368e16:	ff 75 e0             	pushl  -0x20(%ebp)
  368e19:	50                   	push   %eax
  368e1a:	e8 f7 f9 ff ff       	call   368816 <__test_and_clear_bit>
  368e1f:	83 c4 10             	add    $0x10,%esp
  368e22:	85 c0                	test   %eax,%eax
  368e24:	75 18                	jne    368e3e <minix_free_inode+0xed>
  368e26:	83 ec 04             	sub    $0x4,%esp
  368e29:	ff 75 e4             	pushl  -0x1c(%ebp)
  368e2c:	68 a4 e2 36 00       	push   $0x36e2a4
  368e31:	68 88 e3 36 00       	push   $0x36e388
  368e36:	e8 4d 02 00 00       	call   369088 <printk>
  368e3b:	83 c4 10             	add    $0x10,%esp
  368e3e:	fb                   	sti    
  368e3f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  368e42:	83 c0 02             	add    $0x2,%eax
  368e45:	83 ec 04             	sub    $0x4,%esp
  368e48:	50                   	push   %eax
  368e49:	ff 75 e0             	pushl  -0x20(%ebp)
  368e4c:	ff 75 f4             	pushl  -0xc(%ebp)
  368e4f:	e8 6c 3f 00 00       	call   36cdc0 <sb_bwrite>
  368e54:	83 c4 10             	add    $0x10,%esp
  368e57:	c9                   	leave  
  368e58:	c3                   	ret    

00368e59 <minix_inode_init_owner>:
  368e59:	55                   	push   %ebp
  368e5a:	89 e5                	mov    %esp,%ebp
  368e5c:	8b 45 08             	mov    0x8(%ebp),%eax
  368e5f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  368e66:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  368e6a:	74 30                	je     368e9c <minix_inode_init_owner+0x43>
  368e6c:	8b 45 0c             	mov    0xc(%ebp),%eax
  368e6f:	8b 00                	mov    (%eax),%eax
  368e71:	25 00 04 00 00       	and    $0x400,%eax
  368e76:	85 c0                	test   %eax,%eax
  368e78:	74 22                	je     368e9c <minix_inode_init_owner+0x43>
  368e7a:	8b 45 0c             	mov    0xc(%ebp),%eax
  368e7d:	8b 50 08             	mov    0x8(%eax),%edx
  368e80:	8b 45 08             	mov    0x8(%ebp),%eax
  368e83:	89 50 08             	mov    %edx,0x8(%eax)
  368e86:	8b 45 10             	mov    0x10(%ebp),%eax
  368e89:	25 00 f0 00 00       	and    $0xf000,%eax
  368e8e:	3d 00 40 00 00       	cmp    $0x4000,%eax
  368e93:	75 07                	jne    368e9c <minix_inode_init_owner+0x43>
  368e95:	81 4d 10 00 04 00 00 	orl    $0x400,0x10(%ebp)
  368e9c:	5d                   	pop    %ebp
  368e9d:	c3                   	ret    

00368e9e <minix_new_inode>:
  368e9e:	55                   	push   %ebp
  368e9f:	89 e5                	mov    %esp,%ebp
  368ea1:	83 ec 28             	sub    $0x28,%esp
  368ea4:	ff 75 08             	pushl  0x8(%ebp)
  368ea7:	e8 9d f8 ff ff       	call   368749 <inode_sb>
  368eac:	83 c4 04             	add    $0x4,%esp
  368eaf:	89 45 e8             	mov    %eax,-0x18(%ebp)
  368eb2:	ff 75 e8             	pushl  -0x18(%ebp)
  368eb5:	e8 84 f8 ff ff       	call   36873e <sb_info>
  368eba:	83 c4 04             	add    $0x4,%esp
  368ebd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  368ec0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  368ec3:	8b 40 1c             	mov    0x1c(%eax),%eax
  368ec6:	c1 e0 03             	shl    $0x3,%eax
  368ec9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  368ecc:	8b 45 e0             	mov    -0x20(%ebp),%eax
  368ecf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  368ed2:	8b 45 10             	mov    0x10(%ebp),%eax
  368ed5:	c7 00 e4 ff ff ff    	movl   $0xffffffe4,(%eax)
  368edb:	fa                   	cli    
  368edc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  368ee3:	eb 32                	jmp    368f17 <minix_new_inode+0x79>
  368ee5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  368ee8:	8b 40 2c             	mov    0x2c(%eax),%eax
  368eeb:	8b 55 f0             	mov    -0x10(%ebp),%edx
  368eee:	c1 e2 02             	shl    $0x2,%edx
  368ef1:	01 d0                	add    %edx,%eax
  368ef3:	8b 00                	mov    (%eax),%eax
  368ef5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  368ef8:	ff 75 e0             	pushl  -0x20(%ebp)
  368efb:	ff 75 f4             	pushl  -0xc(%ebp)
  368efe:	e8 8b f8 ff ff       	call   36878e <find_first_zero_bit>
  368f03:	83 c4 08             	add    $0x8,%esp
  368f06:	89 45 ec             	mov    %eax,-0x14(%ebp)
  368f09:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368f0c:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  368f0f:	73 02                	jae    368f13 <minix_new_inode+0x75>
  368f11:	eb 0f                	jmp    368f22 <minix_new_inode+0x84>
  368f13:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  368f17:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  368f1a:	8b 40 08             	mov    0x8(%eax),%eax
  368f1d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  368f20:	77 c3                	ja     368ee5 <minix_new_inode+0x47>
  368f22:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  368f26:	74 08                	je     368f30 <minix_new_inode+0x92>
  368f28:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368f2b:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  368f2e:	72 0b                	jb     368f3b <minix_new_inode+0x9d>
  368f30:	fb                   	sti    
  368f31:	b8 00 00 00 00       	mov    $0x0,%eax
  368f36:	e9 f2 00 00 00       	jmp    36902d <minix_new_inode+0x18f>
  368f3b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  368f3e:	ff 75 f4             	pushl  -0xc(%ebp)
  368f41:	50                   	push   %eax
  368f42:	e8 e8 f8 ff ff       	call   36882f <__test_and_set_bit>
  368f47:	83 c4 08             	add    $0x8,%esp
  368f4a:	85 c0                	test   %eax,%eax
  368f4c:	74 20                	je     368f6e <minix_new_inode+0xd0>
  368f4e:	fb                   	sti    
  368f4f:	83 ec 08             	sub    $0x8,%esp
  368f52:	68 a4 e2 36 00       	push   $0x36e2a4
  368f57:	68 ac e3 36 00       	push   $0x36e3ac
  368f5c:	e8 27 01 00 00       	call   369088 <printk>
  368f61:	83 c4 10             	add    $0x10,%esp
  368f64:	b8 00 00 00 00       	mov    $0x0,%eax
  368f69:	e9 bf 00 00 00       	jmp    36902d <minix_new_inode+0x18f>
  368f6e:	fb                   	sti    
  368f6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  368f72:	83 c0 02             	add    $0x2,%eax
  368f75:	83 ec 04             	sub    $0x4,%esp
  368f78:	50                   	push   %eax
  368f79:	ff 75 f4             	pushl  -0xc(%ebp)
  368f7c:	ff 75 e8             	pushl  -0x18(%ebp)
  368f7f:	e8 3c 3e 00 00       	call   36cdc0 <sb_bwrite>
  368f84:	83 c4 10             	add    $0x10,%esp
  368f87:	8b 45 f0             	mov    -0x10(%ebp),%eax
  368f8a:	0f af 45 e0          	imul   -0x20(%ebp),%eax
  368f8e:	01 45 ec             	add    %eax,-0x14(%ebp)
  368f91:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  368f95:	74 0a                	je     368fa1 <minix_new_inode+0x103>
  368f97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  368f9a:	8b 00                	mov    (%eax),%eax
  368f9c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  368f9f:	73 0a                	jae    368fab <minix_new_inode+0x10d>
  368fa1:	b8 00 00 00 00       	mov    $0x0,%eax
  368fa6:	e9 82 00 00 00       	jmp    36902d <minix_new_inode+0x18f>
  368fab:	83 ec 08             	sub    $0x8,%esp
  368fae:	ff 75 ec             	pushl  -0x14(%ebp)
  368fb1:	ff 75 e8             	pushl  -0x18(%ebp)
  368fb4:	e8 0a ed ff ff       	call   367cc3 <minix_find_inode>
  368fb9:	83 c4 10             	add    $0x10,%esp
  368fbc:	89 45 dc             	mov    %eax,-0x24(%ebp)
  368fbf:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  368fc3:	75 07                	jne    368fcc <minix_new_inode+0x12e>
  368fc5:	b8 00 00 00 00       	mov    $0x0,%eax
  368fca:	eb 61                	jmp    36902d <minix_new_inode+0x18f>
  368fcc:	8b 45 0c             	mov    0xc(%ebp),%eax
  368fcf:	83 ec 04             	sub    $0x4,%esp
  368fd2:	50                   	push   %eax
  368fd3:	ff 75 08             	pushl  0x8(%ebp)
  368fd6:	ff 75 dc             	pushl  -0x24(%ebp)
  368fd9:	e8 7b fe ff ff       	call   368e59 <minix_inode_init_owner>
  368fde:	83 c4 10             	add    $0x10,%esp
  368fe1:	8b 45 dc             	mov    -0x24(%ebp),%eax
  368fe4:	8b 55 ec             	mov    -0x14(%ebp),%edx
  368fe7:	89 50 10             	mov    %edx,0x10(%eax)
  368fea:	8b 45 dc             	mov    -0x24(%ebp),%eax
  368fed:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
  368ff4:	83 ec 0c             	sub    $0xc,%esp
  368ff7:	6a 00                	push   $0x0
  368ff9:	e8 f1 f6 ff ff       	call   3686ef <time>
  368ffe:	83 c4 10             	add    $0x10,%esp
  369001:	89 c2                	mov    %eax,%edx
  369003:	8b 45 dc             	mov    -0x24(%ebp),%eax
  369006:	89 50 38             	mov    %edx,0x38(%eax)
  369009:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36900c:	8b 50 38             	mov    0x38(%eax),%edx
  36900f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  369012:	89 50 28             	mov    %edx,0x28(%eax)
  369015:	8b 45 dc             	mov    -0x24(%ebp),%eax
  369018:	8b 50 28             	mov    0x28(%eax),%edx
  36901b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36901e:	89 50 30             	mov    %edx,0x30(%eax)
  369021:	8b 45 10             	mov    0x10(%ebp),%eax
  369024:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  36902a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36902d:	c9                   	leave  
  36902e:	c3                   	ret    

0036902f <minix_count_free_inodes>:
  36902f:	55                   	push   %ebp
  369030:	89 e5                	mov    %esp,%ebp
  369032:	83 ec 10             	sub    $0x10,%esp
  369035:	ff 75 08             	pushl  0x8(%ebp)
  369038:	e8 01 f7 ff ff       	call   36873e <sb_info>
  36903d:	83 c4 04             	add    $0x4,%esp
  369040:	89 45 fc             	mov    %eax,-0x4(%ebp)
  369043:	8b 45 fc             	mov    -0x4(%ebp),%eax
  369046:	8b 00                	mov    (%eax),%eax
  369048:	83 c0 01             	add    $0x1,%eax
  36904b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  36904e:	8b 45 08             	mov    0x8(%ebp),%eax
  369051:	8b 50 1c             	mov    0x1c(%eax),%edx
  369054:	8b 45 fc             	mov    -0x4(%ebp),%eax
  369057:	8b 40 2c             	mov    0x2c(%eax),%eax
  36905a:	83 ec 04             	sub    $0x4,%esp
  36905d:	ff 75 f8             	pushl  -0x8(%ebp)
  369060:	52                   	push   %edx
  369061:	50                   	push   %eax
  369062:	e8 73 f9 ff ff       	call   3689da <count_free>
  369067:	83 c4 10             	add    $0x10,%esp
  36906a:	c9                   	leave  
  36906b:	c3                   	ret    

0036906c <panic>:
  36906c:	55                   	push   %ebp
  36906d:	89 e5                	mov    %esp,%ebp
  36906f:	83 ec 08             	sub    $0x8,%esp
  369072:	83 ec 08             	sub    $0x8,%esp
  369075:	ff 75 08             	pushl  0x8(%ebp)
  369078:	68 c8 e3 36 00       	push   $0x36e3c8
  36907d:	e8 06 00 00 00       	call   369088 <printk>
  369082:	83 c4 10             	add    $0x10,%esp
  369085:	fa                   	cli    
  369086:	eb fe                	jmp    369086 <panic+0x1a>

00369088 <printk>:
  369088:	55                   	push   %ebp
  369089:	89 e5                	mov    %esp,%ebp
  36908b:	83 ec 18             	sub    $0x18,%esp
  36908e:	8d 45 0c             	lea    0xc(%ebp),%eax
  369091:	89 45 f0             	mov    %eax,-0x10(%ebp)
  369094:	8b 45 f0             	mov    -0x10(%ebp),%eax
  369097:	83 ec 04             	sub    $0x4,%esp
  36909a:	50                   	push   %eax
  36909b:	ff 75 08             	pushl  0x8(%ebp)
  36909e:	68 c0 33 37 00       	push   $0x3733c0
  3690a3:	e8 a4 38 00 00       	call   36c94c <vsprintf>
  3690a8:	83 c4 10             	add    $0x10,%esp
  3690ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  3690ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3690b1:	83 ec 04             	sub    $0x4,%esp
  3690b4:	50                   	push   %eax
  3690b5:	68 c0 33 37 00       	push   $0x3733c0
  3690ba:	6a 00                	push   $0x0
  3690bc:	e8 4d ae ff ff       	call   363f0e <cons_print>
  3690c1:	83 c4 10             	add    $0x10,%esp
  3690c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3690c7:	c9                   	leave  
  3690c8:	c3                   	ret    

003690c9 <printx>:
  3690c9:	55                   	push   %ebp
  3690ca:	89 e5                	mov    %esp,%ebp
  3690cc:	83 ec 18             	sub    $0x18,%esp
  3690cf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  3690d6:	e9 d9 00 00 00       	jmp    3691b4 <printx+0xeb>
  3690db:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3690de:	83 e0 0f             	and    $0xf,%eax
  3690e1:	85 c0                	test   %eax,%eax
  3690e3:	0f 85 8e 00 00 00    	jne    369177 <printx+0xae>
  3690e9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3690ed:	74 73                	je     369162 <printx+0x99>
  3690ef:	83 ec 0c             	sub    $0xc,%esp
  3690f2:	68 d9 e3 36 00       	push   $0x36e3d9
  3690f7:	e8 8c ff ff ff       	call   369088 <printk>
  3690fc:	83 c4 10             	add    $0x10,%esp
  3690ff:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  369106:	eb 44                	jmp    36914c <printx+0x83>
  369108:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36910b:	8d 50 f0             	lea    -0x10(%eax),%edx
  36910e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  369111:	01 d0                	add    %edx,%eax
  369113:	89 c2                	mov    %eax,%edx
  369115:	8b 45 08             	mov    0x8(%ebp),%eax
  369118:	01 d0                	add    %edx,%eax
  36911a:	0f b6 00             	movzbl (%eax),%eax
  36911d:	88 45 ef             	mov    %al,-0x11(%ebp)
  369120:	80 7d ef 20          	cmpb   $0x20,-0x11(%ebp)
  369124:	7e 0c                	jle    369132 <printx+0x69>
  369126:	80 7d ef 7f          	cmpb   $0x7f,-0x11(%ebp)
  36912a:	74 06                	je     369132 <printx+0x69>
  36912c:	0f be 45 ef          	movsbl -0x11(%ebp),%eax
  369130:	eb 05                	jmp    369137 <printx+0x6e>
  369132:	b8 2e 00 00 00       	mov    $0x2e,%eax
  369137:	83 ec 08             	sub    $0x8,%esp
  36913a:	50                   	push   %eax
  36913b:	68 dc e3 36 00       	push   $0x36e3dc
  369140:	e8 43 ff ff ff       	call   369088 <printk>
  369145:	83 c4 10             	add    $0x10,%esp
  369148:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  36914c:	83 7d f0 0f          	cmpl   $0xf,-0x10(%ebp)
  369150:	7e b6                	jle    369108 <printx+0x3f>
  369152:	83 ec 0c             	sub    $0xc,%esp
  369155:	68 df e3 36 00       	push   $0x36e3df
  36915a:	e8 29 ff ff ff       	call   369088 <printk>
  36915f:	83 c4 10             	add    $0x10,%esp
  369162:	83 ec 08             	sub    $0x8,%esp
  369165:	ff 75 f4             	pushl  -0xc(%ebp)
  369168:	68 e1 e3 36 00       	push   $0x36e3e1
  36916d:	e8 16 ff ff ff       	call   369088 <printk>
  369172:	83 c4 10             	add    $0x10,%esp
  369175:	eb 1a                	jmp    369191 <printx+0xc8>
  369177:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36917a:	83 e0 07             	and    $0x7,%eax
  36917d:	85 c0                	test   %eax,%eax
  36917f:	75 10                	jne    369191 <printx+0xc8>
  369181:	83 ec 0c             	sub    $0xc,%esp
  369184:	68 e9 e3 36 00       	push   $0x36e3e9
  369189:	e8 fa fe ff ff       	call   369088 <printk>
  36918e:	83 c4 10             	add    $0x10,%esp
  369191:	8b 55 f4             	mov    -0xc(%ebp),%edx
  369194:	8b 45 08             	mov    0x8(%ebp),%eax
  369197:	01 d0                	add    %edx,%eax
  369199:	0f b6 00             	movzbl (%eax),%eax
  36919c:	0f be c0             	movsbl %al,%eax
  36919f:	83 ec 08             	sub    $0x8,%esp
  3691a2:	50                   	push   %eax
  3691a3:	68 ed e3 36 00       	push   $0x36e3ed
  3691a8:	e8 db fe ff ff       	call   369088 <printk>
  3691ad:	83 c4 10             	add    $0x10,%esp
  3691b0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  3691b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  3691b7:	3b 45 0c             	cmp    0xc(%ebp),%eax
  3691ba:	0f 82 1b ff ff ff    	jb     3690db <printx+0x12>
  3691c0:	83 ec 0c             	sub    $0xc,%esp
  3691c3:	68 df e3 36 00       	push   $0x36e3df
  3691c8:	e8 bb fe ff ff       	call   369088 <printk>
  3691cd:	83 c4 10             	add    $0x10,%esp
  3691d0:	c9                   	leave  
  3691d1:	c3                   	ret    

003691d2 <outb>:
  3691d2:	55                   	push   %ebp
  3691d3:	89 e5                	mov    %esp,%ebp
  3691d5:	83 ec 08             	sub    $0x8,%esp
  3691d8:	8b 55 08             	mov    0x8(%ebp),%edx
  3691db:	8b 45 0c             	mov    0xc(%ebp),%eax
  3691de:	88 55 fc             	mov    %dl,-0x4(%ebp)
  3691e1:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  3691e5:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  3691e9:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  3691ed:	ee                   	out    %al,(%dx)
  3691ee:	c9                   	leave  
  3691ef:	c3                   	ret    

003691f0 <inb>:
  3691f0:	55                   	push   %ebp
  3691f1:	89 e5                	mov    %esp,%ebp
  3691f3:	83 ec 14             	sub    $0x14,%esp
  3691f6:	8b 45 08             	mov    0x8(%ebp),%eax
  3691f9:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  3691fd:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  369201:	89 c2                	mov    %eax,%edx
  369203:	ec                   	in     (%dx),%al
  369204:	88 45 ff             	mov    %al,-0x1(%ebp)
  369207:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  36920b:	c9                   	leave  
  36920c:	c3                   	ret    

0036920d <io_delay>:
  36920d:	55                   	push   %ebp
  36920e:	89 e5                	mov    %esp,%ebp
  369210:	83 ec 10             	sub    $0x10,%esp
  369213:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
  369219:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  36921d:	89 c2                	mov    %eax,%edx
  36921f:	ee                   	out    %al,(%dx)
  369220:	c9                   	leave  
  369221:	c3                   	ret    

00369222 <outb_p>:
  369222:	55                   	push   %ebp
  369223:	89 e5                	mov    %esp,%ebp
  369225:	83 ec 08             	sub    $0x8,%esp
  369228:	8b 55 08             	mov    0x8(%ebp),%edx
  36922b:	8b 45 0c             	mov    0xc(%ebp),%eax
  36922e:	88 55 fc             	mov    %dl,-0x4(%ebp)
  369231:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  369235:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  369239:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  36923d:	52                   	push   %edx
  36923e:	50                   	push   %eax
  36923f:	e8 8e ff ff ff       	call   3691d2 <outb>
  369244:	83 c4 08             	add    $0x8,%esp
  369247:	e8 c1 ff ff ff       	call   36920d <io_delay>
  36924c:	c9                   	leave  
  36924d:	c3                   	ret    

0036924e <inb_p>:
  36924e:	55                   	push   %ebp
  36924f:	89 e5                	mov    %esp,%ebp
  369251:	83 ec 14             	sub    $0x14,%esp
  369254:	8b 45 08             	mov    0x8(%ebp),%eax
  369257:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  36925b:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  36925f:	50                   	push   %eax
  369260:	e8 8b ff ff ff       	call   3691f0 <inb>
  369265:	83 c4 04             	add    $0x4,%esp
  369268:	88 45 ff             	mov    %al,-0x1(%ebp)
  36926b:	e8 9d ff ff ff       	call   36920d <io_delay>
  369270:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  369274:	c9                   	leave  
  369275:	c3                   	ret    

00369276 <print_cpu_info>:
  369276:	55                   	push   %ebp
  369277:	89 e5                	mov    %esp,%ebp
  369279:	83 ec 08             	sub    $0x8,%esp
  36927c:	8b 45 08             	mov    0x8(%ebp),%eax
  36927f:	8b 50 30             	mov    0x30(%eax),%edx
  369282:	8b 45 08             	mov    0x8(%ebp),%eax
  369285:	8b 40 34             	mov    0x34(%eax),%eax
  369288:	83 ec 04             	sub    $0x4,%esp
  36928b:	52                   	push   %edx
  36928c:	50                   	push   %eax
  36928d:	68 f4 e3 36 00       	push   $0x36e3f4
  369292:	e8 f1 fd ff ff       	call   369088 <printk>
  369297:	83 c4 10             	add    $0x10,%esp
  36929a:	8b 45 08             	mov    0x8(%ebp),%eax
  36929d:	8b 50 1c             	mov    0x1c(%eax),%edx
  3692a0:	8b 45 08             	mov    0x8(%ebp),%eax
  3692a3:	8b 40 40             	mov    0x40(%eax),%eax
  3692a6:	83 ec 04             	sub    $0x4,%esp
  3692a9:	52                   	push   %edx
  3692aa:	50                   	push   %eax
  3692ab:	68 10 e4 36 00       	push   $0x36e410
  3692b0:	e8 d3 fd ff ff       	call   369088 <printk>
  3692b5:	83 c4 10             	add    $0x10,%esp
  3692b8:	8b 45 08             	mov    0x8(%ebp),%eax
  3692bb:	8b 50 10             	mov    0x10(%eax),%edx
  3692be:	8b 45 08             	mov    0x8(%ebp),%eax
  3692c1:	8b 40 08             	mov    0x8(%eax),%eax
  3692c4:	83 ec 04             	sub    $0x4,%esp
  3692c7:	52                   	push   %edx
  3692c8:	50                   	push   %eax
  3692c9:	68 29 e4 36 00       	push   $0x36e429
  3692ce:	e8 b5 fd ff ff       	call   369088 <printk>
  3692d3:	83 c4 10             	add    $0x10,%esp
  3692d6:	8b 45 08             	mov    0x8(%ebp),%eax
  3692d9:	8b 50 14             	mov    0x14(%eax),%edx
  3692dc:	8b 45 08             	mov    0x8(%ebp),%eax
  3692df:	8b 40 0c             	mov    0xc(%eax),%eax
  3692e2:	83 ec 04             	sub    $0x4,%esp
  3692e5:	52                   	push   %edx
  3692e6:	50                   	push   %eax
  3692e7:	68 45 e4 36 00       	push   $0x36e445
  3692ec:	e8 97 fd ff ff       	call   369088 <printk>
  3692f1:	83 c4 10             	add    $0x10,%esp
  3692f4:	8b 45 08             	mov    0x8(%ebp),%eax
  3692f7:	8b 50 28             	mov    0x28(%eax),%edx
  3692fa:	8b 45 08             	mov    0x8(%ebp),%eax
  3692fd:	8b 40 2c             	mov    0x2c(%eax),%eax
  369300:	83 ec 04             	sub    $0x4,%esp
  369303:	52                   	push   %edx
  369304:	50                   	push   %eax
  369305:	68 5e e4 36 00       	push   $0x36e45e
  36930a:	e8 79 fd ff ff       	call   369088 <printk>
  36930f:	83 c4 10             	add    $0x10,%esp
  369312:	8b 45 08             	mov    0x8(%ebp),%eax
  369315:	8b 50 24             	mov    0x24(%eax),%edx
  369318:	8b 45 08             	mov    0x8(%ebp),%eax
  36931b:	8b 40 20             	mov    0x20(%eax),%eax
  36931e:	83 ec 04             	sub    $0x4,%esp
  369321:	52                   	push   %edx
  369322:	50                   	push   %eax
  369323:	68 7a e4 36 00       	push   $0x36e47a
  369328:	e8 5b fd ff ff       	call   369088 <printk>
  36932d:	83 c4 10             	add    $0x10,%esp
  369330:	c9                   	leave  
  369331:	c3                   	ret    

00369332 <print_task_info>:
  369332:	55                   	push   %ebp
  369333:	89 e5                	mov    %esp,%ebp
  369335:	83 ec 08             	sub    $0x8,%esp
  369338:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36933d:	8d 48 14             	lea    0x14(%eax),%ecx
  369340:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  369345:	8b 10                	mov    (%eax),%edx
  369347:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36934c:	83 ec 08             	sub    $0x8,%esp
  36934f:	51                   	push   %ecx
  369350:	52                   	push   %edx
  369351:	50                   	push   %eax
  369352:	ff 75 0c             	pushl  0xc(%ebp)
  369355:	ff 75 08             	pushl  0x8(%ebp)
  369358:	68 94 e4 36 00       	push   $0x36e494
  36935d:	e8 26 fd ff ff       	call   369088 <printk>
  369362:	83 c4 20             	add    $0x20,%esp
  369365:	c9                   	leave  
  369366:	c3                   	ret    

00369367 <die>:
  369367:	55                   	push   %ebp
  369368:	89 e5                	mov    %esp,%ebp
  36936a:	57                   	push   %edi
  36936b:	56                   	push   %esi
  36936c:	53                   	push   %ebx
  36936d:	83 ec 1c             	sub    $0x1c,%esp
  369370:	83 ec 08             	sub    $0x8,%esp
  369373:	ff 75 10             	pushl  0x10(%ebp)
  369376:	ff 75 08             	pushl  0x8(%ebp)
  369379:	e8 b4 ff ff ff       	call   369332 <print_task_info>
  36937e:	83 c4 10             	add    $0x10,%esp
  369381:	8b 45 0c             	mov    0xc(%ebp),%eax
  369384:	83 e8 04             	sub    $0x4,%eax
  369387:	83 ec 0c             	sub    $0xc,%esp
  36938a:	50                   	push   %eax
  36938b:	e8 e6 fe ff ff       	call   369276 <print_cpu_info>
  369390:	83 c4 10             	add    $0x10,%esp
  369393:	b8 01 00 00 00       	mov    $0x1,%eax
  369398:	bb 03 00 00 00       	mov    $0x3,%ebx
  36939d:	b9 01 00 00 00       	mov    $0x1,%ecx
  3693a2:	ba 00 00 00 00       	mov    $0x0,%edx
  3693a7:	be 00 00 00 00       	mov    $0x0,%esi
  3693ac:	bf 00 00 00 00       	mov    $0x0,%edi
  3693b1:	cd 80                	int    $0x80
  3693b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3693b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  3693b9:	5b                   	pop    %ebx
  3693ba:	5e                   	pop    %esi
  3693bb:	5f                   	pop    %edi
  3693bc:	5d                   	pop    %ebp
  3693bd:	c3                   	ret    

003693be <do_divide_error>:
  3693be:	55                   	push   %ebp
  3693bf:	89 e5                	mov    %esp,%ebp
  3693c1:	83 ec 08             	sub    $0x8,%esp
  3693c4:	83 ec 04             	sub    $0x4,%esp
  3693c7:	ff 75 08             	pushl  0x8(%ebp)
  3693ca:	ff 75 0c             	pushl  0xc(%ebp)
  3693cd:	68 b8 e4 36 00       	push   $0x36e4b8
  3693d2:	e8 90 ff ff ff       	call   369367 <die>
  3693d7:	83 c4 10             	add    $0x10,%esp
  3693da:	c9                   	leave  
  3693db:	c3                   	ret    

003693dc <do_debug>:
  3693dc:	55                   	push   %ebp
  3693dd:	89 e5                	mov    %esp,%ebp
  3693df:	83 ec 08             	sub    $0x8,%esp
  3693e2:	83 ec 04             	sub    $0x4,%esp
  3693e5:	ff 75 08             	pushl  0x8(%ebp)
  3693e8:	ff 75 0c             	pushl  0xc(%ebp)
  3693eb:	68 c5 e4 36 00       	push   $0x36e4c5
  3693f0:	e8 72 ff ff ff       	call   369367 <die>
  3693f5:	83 c4 10             	add    $0x10,%esp
  3693f8:	83 ec 0c             	sub    $0xc,%esp
  3693fb:	68 d4 e4 36 00       	push   $0x36e4d4
  369400:	e8 83 fc ff ff       	call   369088 <printk>
  369405:	83 c4 10             	add    $0x10,%esp
  369408:	c9                   	leave  
  369409:	c3                   	ret    

0036940a <do_nmi>:
  36940a:	55                   	push   %ebp
  36940b:	89 e5                	mov    %esp,%ebp
  36940d:	83 ec 08             	sub    $0x8,%esp
  369410:	83 ec 04             	sub    $0x4,%esp
  369413:	ff 75 08             	pushl  0x8(%ebp)
  369416:	ff 75 0c             	pushl  0xc(%ebp)
  369419:	68 fe e4 36 00       	push   $0x36e4fe
  36941e:	e8 44 ff ff ff       	call   369367 <die>
  369423:	83 c4 10             	add    $0x10,%esp
  369426:	c9                   	leave  
  369427:	c3                   	ret    

00369428 <do_breakpoint>:
  369428:	55                   	push   %ebp
  369429:	89 e5                	mov    %esp,%ebp
  36942b:	83 ec 08             	sub    $0x8,%esp
  36942e:	83 ec 04             	sub    $0x4,%esp
  369431:	ff 75 08             	pushl  0x8(%ebp)
  369434:	ff 75 0c             	pushl  0xc(%ebp)
  369437:	68 09 e5 36 00       	push   $0x36e509
  36943c:	e8 26 ff ff ff       	call   369367 <die>
  369441:	83 c4 10             	add    $0x10,%esp
  369444:	83 ec 0c             	sub    $0xc,%esp
  369447:	68 1b e5 36 00       	push   $0x36e51b
  36944c:	e8 37 fc ff ff       	call   369088 <printk>
  369451:	83 c4 10             	add    $0x10,%esp
  369454:	c9                   	leave  
  369455:	c3                   	ret    

00369456 <do_overflow>:
  369456:	55                   	push   %ebp
  369457:	89 e5                	mov    %esp,%ebp
  369459:	83 ec 08             	sub    $0x8,%esp
  36945c:	83 ec 04             	sub    $0x4,%esp
  36945f:	ff 75 08             	pushl  0x8(%ebp)
  369462:	ff 75 0c             	pushl  0xc(%ebp)
  369465:	68 31 e5 36 00       	push   $0x36e531
  36946a:	e8 f8 fe ff ff       	call   369367 <die>
  36946f:	83 c4 10             	add    $0x10,%esp
  369472:	c9                   	leave  
  369473:	c3                   	ret    

00369474 <do_bounds_check>:
  369474:	55                   	push   %ebp
  369475:	89 e5                	mov    %esp,%ebp
  369477:	83 ec 08             	sub    $0x8,%esp
  36947a:	83 ec 04             	sub    $0x4,%esp
  36947d:	ff 75 08             	pushl  0x8(%ebp)
  369480:	ff 75 0c             	pushl  0xc(%ebp)
  369483:	68 3a e5 36 00       	push   $0x36e53a
  369488:	e8 da fe ff ff       	call   369367 <die>
  36948d:	83 c4 10             	add    $0x10,%esp
  369490:	c9                   	leave  
  369491:	c3                   	ret    

00369492 <do_inval_opcode>:
  369492:	55                   	push   %ebp
  369493:	89 e5                	mov    %esp,%ebp
  369495:	83 ec 08             	sub    $0x8,%esp
  369498:	83 ec 04             	sub    $0x4,%esp
  36949b:	ff 75 08             	pushl  0x8(%ebp)
  36949e:	ff 75 0c             	pushl  0xc(%ebp)
  3694a1:	68 41 e5 36 00       	push   $0x36e541
  3694a6:	e8 bc fe ff ff       	call   369367 <die>
  3694ab:	83 c4 10             	add    $0x10,%esp
  3694ae:	c9                   	leave  
  3694af:	c3                   	ret    

003694b0 <do_copr_not_available>:
  3694b0:	55                   	push   %ebp
  3694b1:	89 e5                	mov    %esp,%ebp
  3694b3:	83 ec 08             	sub    $0x8,%esp
  3694b6:	83 ec 04             	sub    $0x4,%esp
  3694b9:	ff 75 08             	pushl  0x8(%ebp)
  3694bc:	ff 75 0c             	pushl  0xc(%ebp)
  3694bf:	68 51 e5 36 00       	push   $0x36e551
  3694c4:	e8 9e fe ff ff       	call   369367 <die>
  3694c9:	83 c4 10             	add    $0x10,%esp
  3694cc:	c9                   	leave  
  3694cd:	c3                   	ret    

003694ce <do_double_fault>:
  3694ce:	55                   	push   %ebp
  3694cf:	89 e5                	mov    %esp,%ebp
  3694d1:	83 ec 08             	sub    $0x8,%esp
  3694d4:	83 ec 04             	sub    $0x4,%esp
  3694d7:	ff 75 08             	pushl  0x8(%ebp)
  3694da:	ff 75 0c             	pushl  0xc(%ebp)
  3694dd:	68 65 e5 36 00       	push   $0x36e565
  3694e2:	e8 80 fe ff ff       	call   369367 <die>
  3694e7:	83 c4 10             	add    $0x10,%esp
  3694ea:	c9                   	leave  
  3694eb:	c3                   	ret    

003694ec <do_copr_seg_overrun>:
  3694ec:	55                   	push   %ebp
  3694ed:	89 e5                	mov    %esp,%ebp
  3694ef:	83 ec 08             	sub    $0x8,%esp
  3694f2:	83 ec 04             	sub    $0x4,%esp
  3694f5:	ff 75 08             	pushl  0x8(%ebp)
  3694f8:	ff 75 0c             	pushl  0xc(%ebp)
  3694fb:	68 72 e5 36 00       	push   $0x36e572
  369500:	e8 62 fe ff ff       	call   369367 <die>
  369505:	83 c4 10             	add    $0x10,%esp
  369508:	c9                   	leave  
  369509:	c3                   	ret    

0036950a <do_inval_tss>:
  36950a:	55                   	push   %ebp
  36950b:	89 e5                	mov    %esp,%ebp
  36950d:	83 ec 08             	sub    $0x8,%esp
  369510:	83 ec 04             	sub    $0x4,%esp
  369513:	ff 75 08             	pushl  0x8(%ebp)
  369516:	ff 75 0c             	pushl  0xc(%ebp)
  369519:	68 87 e5 36 00       	push   $0x36e587
  36951e:	e8 44 fe ff ff       	call   369367 <die>
  369523:	83 c4 10             	add    $0x10,%esp
  369526:	c9                   	leave  
  369527:	c3                   	ret    

00369528 <do_segment_not_present>:
  369528:	55                   	push   %ebp
  369529:	89 e5                	mov    %esp,%ebp
  36952b:	83 ec 08             	sub    $0x8,%esp
  36952e:	83 ec 04             	sub    $0x4,%esp
  369531:	ff 75 08             	pushl  0x8(%ebp)
  369534:	ff 75 0c             	pushl  0xc(%ebp)
  369537:	68 91 e5 36 00       	push   $0x36e591
  36953c:	e8 26 fe ff ff       	call   369367 <die>
  369541:	83 c4 10             	add    $0x10,%esp
  369544:	c9                   	leave  
  369545:	c3                   	ret    

00369546 <do_stack_exception>:
  369546:	55                   	push   %ebp
  369547:	89 e5                	mov    %esp,%ebp
  369549:	83 ec 08             	sub    $0x8,%esp
  36954c:	83 ec 04             	sub    $0x4,%esp
  36954f:	ff 75 08             	pushl  0x8(%ebp)
  369552:	ff 75 0c             	pushl  0xc(%ebp)
  369555:	68 a5 e5 36 00       	push   $0x36e5a5
  36955a:	e8 08 fe ff ff       	call   369367 <die>
  36955f:	83 c4 10             	add    $0x10,%esp
  369562:	c9                   	leave  
  369563:	c3                   	ret    

00369564 <do_general_protection>:
  369564:	55                   	push   %ebp
  369565:	89 e5                	mov    %esp,%ebp
  369567:	83 ec 08             	sub    $0x8,%esp
  36956a:	83 ec 04             	sub    $0x4,%esp
  36956d:	ff 75 08             	pushl  0x8(%ebp)
  369570:	ff 75 0c             	pushl  0xc(%ebp)
  369573:	68 b3 e5 36 00       	push   $0x36e5b3
  369578:	e8 ea fd ff ff       	call   369367 <die>
  36957d:	83 c4 10             	add    $0x10,%esp
  369580:	c9                   	leave  
  369581:	c3                   	ret    

00369582 <do_page_fault>:
  369582:	55                   	push   %ebp
  369583:	89 e5                	mov    %esp,%ebp
  369585:	57                   	push   %edi
  369586:	56                   	push   %esi
  369587:	53                   	push   %ebx
  369588:	83 ec 10             	sub    $0x10,%esp
  36958b:	0f 20 d0             	mov    %cr2,%eax
  36958e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  369591:	8b 45 f0             	mov    -0x10(%ebp),%eax
  369594:	89 45 ec             	mov    %eax,-0x14(%ebp)
  369597:	8b 45 08             	mov    0x8(%ebp),%eax
  36959a:	83 e0 01             	and    $0x1,%eax
  36959d:	85 c0                	test   %eax,%eax
  36959f:	75 23                	jne    3695c4 <do_page_fault+0x42>
  3695a1:	b8 01 00 00 00       	mov    $0x1,%eax
  3695a6:	bb 03 00 00 00       	mov    $0x3,%ebx
  3695ab:	b9 10 00 00 00       	mov    $0x10,%ecx
  3695b0:	8b 55 ec             	mov    -0x14(%ebp),%edx
  3695b3:	be 00 00 00 00       	mov    $0x0,%esi
  3695b8:	bf 00 00 00 00       	mov    $0x0,%edi
  3695bd:	cd 80                	int    $0x80
  3695bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
  3695c2:	eb 2b                	jmp    3695ef <do_page_fault+0x6d>
  3695c4:	8b 45 08             	mov    0x8(%ebp),%eax
  3695c7:	83 e0 02             	and    $0x2,%eax
  3695ca:	85 c0                	test   %eax,%eax
  3695cc:	74 21                	je     3695ef <do_page_fault+0x6d>
  3695ce:	b8 01 00 00 00       	mov    $0x1,%eax
  3695d3:	bb 03 00 00 00       	mov    $0x3,%ebx
  3695d8:	b9 11 00 00 00       	mov    $0x11,%ecx
  3695dd:	8b 55 ec             	mov    -0x14(%ebp),%edx
  3695e0:	be 00 00 00 00       	mov    $0x0,%esi
  3695e5:	bf 00 00 00 00       	mov    $0x0,%edi
  3695ea:	cd 80                	int    $0x80
  3695ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  3695ef:	83 c4 10             	add    $0x10,%esp
  3695f2:	5b                   	pop    %ebx
  3695f3:	5e                   	pop    %esi
  3695f4:	5f                   	pop    %edi
  3695f5:	5d                   	pop    %ebp
  3695f6:	c3                   	ret    

003695f7 <do_copr_error>:
  3695f7:	55                   	push   %ebp
  3695f8:	89 e5                	mov    %esp,%ebp
  3695fa:	83 ec 08             	sub    $0x8,%esp
  3695fd:	83 ec 04             	sub    $0x4,%esp
  369600:	ff 75 08             	pushl  0x8(%ebp)
  369603:	ff 75 0c             	pushl  0xc(%ebp)
  369606:	68 c6 e5 36 00       	push   $0x36e5c6
  36960b:	e8 57 fd ff ff       	call   369367 <die>
  369610:	83 c4 10             	add    $0x10,%esp
  369613:	c9                   	leave  
  369614:	c3                   	ret    

00369615 <do_none>:
  369615:	55                   	push   %ebp
  369616:	89 e5                	mov    %esp,%ebp
  369618:	83 ec 08             	sub    $0x8,%esp
  36961b:	83 ec 04             	sub    $0x4,%esp
  36961e:	ff 75 08             	pushl  0x8(%ebp)
  369621:	ff 75 0c             	pushl  0xc(%ebp)
  369624:	68 d1 e5 36 00       	push   $0x36e5d1
  369629:	e8 39 fd ff ff       	call   369367 <die>
  36962e:	83 c4 10             	add    $0x10,%esp
  369631:	c9                   	leave  
  369632:	c3                   	ret    

00369633 <_null>:
  369633:	55                   	push   %ebp
  369634:	89 e5                	mov    %esp,%ebp
  369636:	5d                   	pop    %ebp
  369637:	c3                   	ret    

00369638 <disable_irq>:
  369638:	55                   	push   %ebp
  369639:	89 e5                	mov    %esp,%ebp
  36963b:	83 ec 18             	sub    $0x18,%esp
  36963e:	83 7d 08 10          	cmpl   $0x10,0x8(%ebp)
  369642:	7f 06                	jg     36964a <disable_irq+0x12>
  369644:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  369648:	79 10                	jns    36965a <disable_irq+0x22>
  36964a:	83 ec 0c             	sub    $0xc,%esp
  36964d:	68 e0 e5 36 00       	push   $0x36e5e0
  369652:	e8 15 fa ff ff       	call   36906c <panic>
  369657:	83 c4 10             	add    $0x10,%esp
  36965a:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
  36965e:	7e 1a                	jle    36967a <disable_irq+0x42>
  369660:	8b 45 08             	mov    0x8(%ebp),%eax
  369663:	83 e8 08             	sub    $0x8,%eax
  369666:	ba 01 00 00 00       	mov    $0x1,%edx
  36966b:	89 c1                	mov    %eax,%ecx
  36966d:	d3 e2                	shl    %cl,%edx
  36966f:	89 d0                	mov    %edx,%eax
  369671:	88 45 f7             	mov    %al,-0x9(%ebp)
  369674:	c6 45 f6 a1          	movb   $0xa1,-0xa(%ebp)
  369678:	eb 15                	jmp    36968f <disable_irq+0x57>
  36967a:	8b 45 08             	mov    0x8(%ebp),%eax
  36967d:	ba 01 00 00 00       	mov    $0x1,%edx
  369682:	89 c1                	mov    %eax,%ecx
  369684:	d3 e2                	shl    %cl,%edx
  369686:	89 d0                	mov    %edx,%eax
  369688:	88 45 f7             	mov    %al,-0x9(%ebp)
  36968b:	c6 45 f6 21          	movb   $0x21,-0xa(%ebp)
  36968f:	fa                   	cli    
  369690:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  369694:	83 ec 0c             	sub    $0xc,%esp
  369697:	50                   	push   %eax
  369698:	e8 53 fb ff ff       	call   3691f0 <inb>
  36969d:	83 c4 10             	add    $0x10,%esp
  3696a0:	08 45 f7             	or     %al,-0x9(%ebp)
  3696a3:	0f b6 55 f6          	movzbl -0xa(%ebp),%edx
  3696a7:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  3696ab:	83 ec 08             	sub    $0x8,%esp
  3696ae:	52                   	push   %edx
  3696af:	50                   	push   %eax
  3696b0:	e8 1d fb ff ff       	call   3691d2 <outb>
  3696b5:	83 c4 10             	add    $0x10,%esp
  3696b8:	fb                   	sti    
  3696b9:	c9                   	leave  
  3696ba:	c3                   	ret    

003696bb <enable_irq>:
  3696bb:	55                   	push   %ebp
  3696bc:	89 e5                	mov    %esp,%ebp
  3696be:	83 ec 18             	sub    $0x18,%esp
  3696c1:	83 7d 08 10          	cmpl   $0x10,0x8(%ebp)
  3696c5:	7f 06                	jg     3696cd <enable_irq+0x12>
  3696c7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  3696cb:	79 10                	jns    3696dd <enable_irq+0x22>
  3696cd:	83 ec 0c             	sub    $0xc,%esp
  3696d0:	68 e0 e5 36 00       	push   $0x36e5e0
  3696d5:	e8 92 f9 ff ff       	call   36906c <panic>
  3696da:	83 c4 10             	add    $0x10,%esp
  3696dd:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
  3696e1:	7e 1c                	jle    3696ff <enable_irq+0x44>
  3696e3:	8b 45 08             	mov    0x8(%ebp),%eax
  3696e6:	83 e8 08             	sub    $0x8,%eax
  3696e9:	ba 01 00 00 00       	mov    $0x1,%edx
  3696ee:	89 c1                	mov    %eax,%ecx
  3696f0:	d3 e2                	shl    %cl,%edx
  3696f2:	89 d0                	mov    %edx,%eax
  3696f4:	f7 d0                	not    %eax
  3696f6:	88 45 f7             	mov    %al,-0x9(%ebp)
  3696f9:	c6 45 f6 a1          	movb   $0xa1,-0xa(%ebp)
  3696fd:	eb 17                	jmp    369716 <enable_irq+0x5b>
  3696ff:	8b 45 08             	mov    0x8(%ebp),%eax
  369702:	ba 01 00 00 00       	mov    $0x1,%edx
  369707:	89 c1                	mov    %eax,%ecx
  369709:	d3 e2                	shl    %cl,%edx
  36970b:	89 d0                	mov    %edx,%eax
  36970d:	f7 d0                	not    %eax
  36970f:	88 45 f7             	mov    %al,-0x9(%ebp)
  369712:	c6 45 f6 21          	movb   $0x21,-0xa(%ebp)
  369716:	fa                   	cli    
  369717:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  36971b:	83 ec 0c             	sub    $0xc,%esp
  36971e:	50                   	push   %eax
  36971f:	e8 2a fb ff ff       	call   36924e <inb_p>
  369724:	83 c4 10             	add    $0x10,%esp
  369727:	20 45 f7             	and    %al,-0x9(%ebp)
  36972a:	0f b6 55 f6          	movzbl -0xa(%ebp),%edx
  36972e:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  369732:	83 ec 08             	sub    $0x8,%esp
  369735:	52                   	push   %edx
  369736:	50                   	push   %eax
  369737:	e8 e6 fa ff ff       	call   369222 <outb_p>
  36973c:	83 c4 10             	add    $0x10,%esp
  36973f:	fb                   	sti    
  369740:	c9                   	leave  
  369741:	c3                   	ret    

00369742 <irq_handler>:
  369742:	55                   	push   %ebp
  369743:	89 e5                	mov    %esp,%ebp
  369745:	83 ec 08             	sub    $0x8,%esp
  369748:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  36974c:	78 06                	js     369754 <irq_handler+0x12>
  36974e:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
  369752:	7e 10                	jle    369764 <irq_handler+0x22>
  369754:	83 ec 0c             	sub    $0xc,%esp
  369757:	68 f8 e5 36 00       	push   $0x36e5f8
  36975c:	e8 0b f9 ff ff       	call   36906c <panic>
  369761:	83 c4 10             	add    $0x10,%esp
  369764:	83 ec 08             	sub    $0x8,%esp
  369767:	6a 21                	push   $0x21
  369769:	6a 00                	push   $0x0
  36976b:	e8 b2 fa ff ff       	call   369222 <outb_p>
  369770:	83 c4 10             	add    $0x10,%esp
  369773:	8b 45 08             	mov    0x8(%ebp),%eax
  369776:	8b 04 85 c0 30 37 00 	mov    0x3730c0(,%eax,4),%eax
  36977d:	85 c0                	test   %eax,%eax
  36977f:	79 15                	jns    369796 <irq_handler+0x54>
  369781:	83 ec 08             	sub    $0x8,%esp
  369784:	ff 75 08             	pushl  0x8(%ebp)
  369787:	68 15 e6 36 00       	push   $0x36e615
  36978c:	e8 f7 f8 ff ff       	call   369088 <printk>
  369791:	83 c4 10             	add    $0x10,%esp
  369794:	eb 20                	jmp    3697b6 <irq_handler+0x74>
  369796:	8b 55 08             	mov    0x8(%ebp),%edx
  369799:	8b 45 08             	mov    0x8(%ebp),%eax
  36979c:	8b 04 85 c0 30 37 00 	mov    0x3730c0(,%eax,4),%eax
  3697a3:	83 ec 0c             	sub    $0xc,%esp
  3697a6:	6a 00                	push   $0x0
  3697a8:	6a 00                	push   $0x0
  3697aa:	52                   	push   %edx
  3697ab:	6a 0a                	push   $0xa
  3697ad:	50                   	push   %eax
  3697ae:	e8 4c 0b 00 00       	call   36a2ff <doint>
  3697b3:	83 c4 20             	add    $0x20,%esp
  3697b6:	c9                   	leave  
  3697b7:	c3                   	ret    

003697b8 <put_irq_handler>:
  3697b8:	55                   	push   %ebp
  3697b9:	89 e5                	mov    %esp,%ebp
  3697bb:	83 ec 08             	sub    $0x8,%esp
  3697be:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  3697c2:	78 06                	js     3697ca <put_irq_handler+0x12>
  3697c4:	83 7d 0c 0f          	cmpl   $0xf,0xc(%ebp)
  3697c8:	7e 07                	jle    3697d1 <put_irq_handler+0x19>
  3697ca:	b8 de ff ff ff       	mov    $0xffffffde,%eax
  3697cf:	eb 44                	jmp    369815 <put_irq_handler+0x5d>
  3697d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  3697d4:	8b 04 85 c0 30 37 00 	mov    0x3730c0(,%eax,4),%eax
  3697db:	83 f8 04             	cmp    $0x4,%eax
  3697de:	74 07                	je     3697e7 <put_irq_handler+0x2f>
  3697e0:	b8 ef ff ff ff       	mov    $0xffffffef,%eax
  3697e5:	eb 2e                	jmp    369815 <put_irq_handler+0x5d>
  3697e7:	83 ec 0c             	sub    $0xc,%esp
  3697ea:	ff 75 0c             	pushl  0xc(%ebp)
  3697ed:	e8 46 fe ff ff       	call   369638 <disable_irq>
  3697f2:	83 c4 10             	add    $0x10,%esp
  3697f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  3697f8:	8b 55 08             	mov    0x8(%ebp),%edx
  3697fb:	89 14 85 c0 30 37 00 	mov    %edx,0x3730c0(,%eax,4)
  369802:	83 ec 0c             	sub    $0xc,%esp
  369805:	ff 75 0c             	pushl  0xc(%ebp)
  369808:	e8 ae fe ff ff       	call   3696bb <enable_irq>
  36980d:	83 c4 10             	add    $0x10,%esp
  369810:	b8 00 00 00 00       	mov    $0x0,%eax
  369815:	c9                   	leave  
  369816:	c3                   	ret    

00369817 <trap_init>:
  369817:	55                   	push   %ebp
  369818:	89 e5                	mov    %esp,%ebp
  36981a:	83 ec 10             	sub    $0x10,%esp
  36981d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  369824:	eb 39                	jmp    36985f <trap_init+0x48>
  369826:	8b 45 fc             	mov    -0x4(%ebp),%eax
  369829:	c1 e0 03             	shl    $0x3,%eax
  36982c:	05 00 00 02 00       	add    $0x20000,%eax
  369831:	ba 43 11 36 00       	mov    $0x361143,%edx
  369836:	0f b7 d2             	movzwl %dx,%edx
  369839:	81 ca 00 00 08 00    	or     $0x80000,%edx
  36983f:	89 10                	mov    %edx,(%eax)
  369841:	8b 45 fc             	mov    -0x4(%ebp),%eax
  369844:	c1 e0 03             	shl    $0x3,%eax
  369847:	05 00 00 02 00       	add    $0x20000,%eax
  36984c:	ba 43 11 36 00       	mov    $0x361143,%edx
  369851:	66 ba 00 00          	mov    $0x0,%dx
  369855:	80 ce 8e             	or     $0x8e,%dh
  369858:	89 50 04             	mov    %edx,0x4(%eax)
  36985b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  36985f:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  369866:	7e be                	jle    369826 <trap_init+0xf>
  369868:	ba 00 00 02 00       	mov    $0x20000,%edx
  36986d:	b8 7a 10 36 00       	mov    $0x36107a,%eax
  369872:	0f b7 c0             	movzwl %ax,%eax
  369875:	0d 00 00 08 00       	or     $0x80000,%eax
  36987a:	89 02                	mov    %eax,(%edx)
  36987c:	ba 00 00 02 00       	mov    $0x20000,%edx
  369881:	b8 7a 10 36 00       	mov    $0x36107a,%eax
  369886:	66 b8 00 00          	mov    $0x0,%ax
  36988a:	80 cc 8f             	or     $0x8f,%ah
  36988d:	89 42 04             	mov    %eax,0x4(%edx)
  369890:	ba 08 00 02 00       	mov    $0x20008,%edx
  369895:	b8 b3 10 36 00       	mov    $0x3610b3,%eax
  36989a:	0f b7 c0             	movzwl %ax,%eax
  36989d:	0d 00 00 08 00       	or     $0x80000,%eax
  3698a2:	89 02                	mov    %eax,(%edx)
  3698a4:	ba 08 00 02 00       	mov    $0x20008,%edx
  3698a9:	b8 b3 10 36 00       	mov    $0x3610b3,%eax
  3698ae:	66 b8 00 00          	mov    $0x0,%ax
  3698b2:	80 cc 8f             	or     $0x8f,%ah
  3698b5:	89 42 04             	mov    %eax,0x4(%edx)
  3698b8:	ba 10 00 02 00       	mov    $0x20010,%edx
  3698bd:	b8 bc 10 36 00       	mov    $0x3610bc,%eax
  3698c2:	0f b7 c0             	movzwl %ax,%eax
  3698c5:	0d 00 00 08 00       	or     $0x80000,%eax
  3698ca:	89 02                	mov    %eax,(%edx)
  3698cc:	ba 10 00 02 00       	mov    $0x20010,%edx
  3698d1:	b8 bc 10 36 00       	mov    $0x3610bc,%eax
  3698d6:	66 b8 00 00          	mov    $0x0,%ax
  3698da:	80 cc 8e             	or     $0x8e,%ah
  3698dd:	89 42 04             	mov    %eax,0x4(%edx)
  3698e0:	ba 18 00 02 00       	mov    $0x20018,%edx
  3698e5:	b8 c5 10 36 00       	mov    $0x3610c5,%eax
  3698ea:	0f b7 c0             	movzwl %ax,%eax
  3698ed:	0d 00 00 08 00       	or     $0x80000,%eax
  3698f2:	89 02                	mov    %eax,(%edx)
  3698f4:	ba 18 00 02 00       	mov    $0x20018,%edx
  3698f9:	b8 c5 10 36 00       	mov    $0x3610c5,%eax
  3698fe:	66 b8 00 00          	mov    $0x0,%ax
  369902:	80 cc 8f             	or     $0x8f,%ah
  369905:	89 42 04             	mov    %eax,0x4(%edx)
  369908:	ba 20 00 02 00       	mov    $0x20020,%edx
  36990d:	b8 ce 10 36 00       	mov    $0x3610ce,%eax
  369912:	0f b7 c0             	movzwl %ax,%eax
  369915:	0d 00 00 08 00       	or     $0x80000,%eax
  36991a:	89 02                	mov    %eax,(%edx)
  36991c:	ba 20 00 02 00       	mov    $0x20020,%edx
  369921:	b8 ce 10 36 00       	mov    $0x3610ce,%eax
  369926:	66 b8 00 00          	mov    $0x0,%ax
  36992a:	80 cc 8f             	or     $0x8f,%ah
  36992d:	89 42 04             	mov    %eax,0x4(%edx)
  369930:	ba 28 00 02 00       	mov    $0x20028,%edx
  369935:	b8 d7 10 36 00       	mov    $0x3610d7,%eax
  36993a:	0f b7 c0             	movzwl %ax,%eax
  36993d:	0d 00 00 08 00       	or     $0x80000,%eax
  369942:	89 02                	mov    %eax,(%edx)
  369944:	ba 28 00 02 00       	mov    $0x20028,%edx
  369949:	b8 d7 10 36 00       	mov    $0x3610d7,%eax
  36994e:	66 b8 00 00          	mov    $0x0,%ax
  369952:	80 cc 8f             	or     $0x8f,%ah
  369955:	89 42 04             	mov    %eax,0x4(%edx)
  369958:	ba 30 00 02 00       	mov    $0x20030,%edx
  36995d:	b8 e0 10 36 00       	mov    $0x3610e0,%eax
  369962:	0f b7 c0             	movzwl %ax,%eax
  369965:	0d 00 00 08 00       	or     $0x80000,%eax
  36996a:	89 02                	mov    %eax,(%edx)
  36996c:	ba 30 00 02 00       	mov    $0x20030,%edx
  369971:	b8 e0 10 36 00       	mov    $0x3610e0,%eax
  369976:	66 b8 00 00          	mov    $0x0,%ax
  36997a:	80 cc 8f             	or     $0x8f,%ah
  36997d:	89 42 04             	mov    %eax,0x4(%edx)
  369980:	ba 38 00 02 00       	mov    $0x20038,%edx
  369985:	b8 e9 10 36 00       	mov    $0x3610e9,%eax
  36998a:	0f b7 c0             	movzwl %ax,%eax
  36998d:	0d 00 00 08 00       	or     $0x80000,%eax
  369992:	89 02                	mov    %eax,(%edx)
  369994:	ba 38 00 02 00       	mov    $0x20038,%edx
  369999:	b8 e9 10 36 00       	mov    $0x3610e9,%eax
  36999e:	66 b8 00 00          	mov    $0x0,%ax
  3699a2:	80 cc 8f             	or     $0x8f,%ah
  3699a5:	89 42 04             	mov    %eax,0x4(%edx)
  3699a8:	ba 40 00 02 00       	mov    $0x20040,%edx
  3699ad:	b8 f2 10 36 00       	mov    $0x3610f2,%eax
  3699b2:	0f b7 c0             	movzwl %ax,%eax
  3699b5:	0d 00 00 08 00       	or     $0x80000,%eax
  3699ba:	89 02                	mov    %eax,(%edx)
  3699bc:	ba 40 00 02 00       	mov    $0x20040,%edx
  3699c1:	b8 f2 10 36 00       	mov    $0x3610f2,%eax
  3699c6:	66 b8 00 00          	mov    $0x0,%ax
  3699ca:	80 cc 8f             	or     $0x8f,%ah
  3699cd:	89 42 04             	mov    %eax,0x4(%edx)
  3699d0:	ba 48 00 02 00       	mov    $0x20048,%edx
  3699d5:	b8 f9 10 36 00       	mov    $0x3610f9,%eax
  3699da:	0f b7 c0             	movzwl %ax,%eax
  3699dd:	0d 00 00 08 00       	or     $0x80000,%eax
  3699e2:	89 02                	mov    %eax,(%edx)
  3699e4:	ba 48 00 02 00       	mov    $0x20048,%edx
  3699e9:	b8 f9 10 36 00       	mov    $0x3610f9,%eax
  3699ee:	66 b8 00 00          	mov    $0x0,%ax
  3699f2:	80 cc 8f             	or     $0x8f,%ah
  3699f5:	89 42 04             	mov    %eax,0x4(%edx)
  3699f8:	ba 50 00 02 00       	mov    $0x20050,%edx
  3699fd:	b8 05 11 36 00       	mov    $0x361105,%eax
  369a02:	0f b7 c0             	movzwl %ax,%eax
  369a05:	0d 00 00 08 00       	or     $0x80000,%eax
  369a0a:	89 02                	mov    %eax,(%edx)
  369a0c:	ba 50 00 02 00       	mov    $0x20050,%edx
  369a11:	b8 05 11 36 00       	mov    $0x361105,%eax
  369a16:	66 b8 00 00          	mov    $0x0,%ax
  369a1a:	80 cc 8f             	or     $0x8f,%ah
  369a1d:	89 42 04             	mov    %eax,0x4(%edx)
  369a20:	ba 58 00 02 00       	mov    $0x20058,%edx
  369a25:	b8 0f 11 36 00       	mov    $0x36110f,%eax
  369a2a:	0f b7 c0             	movzwl %ax,%eax
  369a2d:	0d 00 00 08 00       	or     $0x80000,%eax
  369a32:	89 02                	mov    %eax,(%edx)
  369a34:	ba 58 00 02 00       	mov    $0x20058,%edx
  369a39:	b8 0f 11 36 00       	mov    $0x36110f,%eax
  369a3e:	66 b8 00 00          	mov    $0x0,%ax
  369a42:	80 cc 8f             	or     $0x8f,%ah
  369a45:	89 42 04             	mov    %eax,0x4(%edx)
  369a48:	ba 60 00 02 00       	mov    $0x20060,%edx
  369a4d:	b8 19 11 36 00       	mov    $0x361119,%eax
  369a52:	0f b7 c0             	movzwl %ax,%eax
  369a55:	0d 00 00 08 00       	or     $0x80000,%eax
  369a5a:	89 02                	mov    %eax,(%edx)
  369a5c:	ba 60 00 02 00       	mov    $0x20060,%edx
  369a61:	b8 19 11 36 00       	mov    $0x361119,%eax
  369a66:	66 b8 00 00          	mov    $0x0,%ax
  369a6a:	80 cc 8f             	or     $0x8f,%ah
  369a6d:	89 42 04             	mov    %eax,0x4(%edx)
  369a70:	ba 68 00 02 00       	mov    $0x20068,%edx
  369a75:	b8 23 11 36 00       	mov    $0x361123,%eax
  369a7a:	0f b7 c0             	movzwl %ax,%eax
  369a7d:	0d 00 00 08 00       	or     $0x80000,%eax
  369a82:	89 02                	mov    %eax,(%edx)
  369a84:	ba 68 00 02 00       	mov    $0x20068,%edx
  369a89:	b8 23 11 36 00       	mov    $0x361123,%eax
  369a8e:	66 b8 00 00          	mov    $0x0,%ax
  369a92:	80 cc 8f             	or     $0x8f,%ah
  369a95:	89 42 04             	mov    %eax,0x4(%edx)
  369a98:	ba 70 00 02 00       	mov    $0x20070,%edx
  369a9d:	b8 2d 11 36 00       	mov    $0x36112d,%eax
  369aa2:	0f b7 c0             	movzwl %ax,%eax
  369aa5:	0d 00 00 08 00       	or     $0x80000,%eax
  369aaa:	89 02                	mov    %eax,(%edx)
  369aac:	ba 70 00 02 00       	mov    $0x20070,%edx
  369ab1:	b8 2d 11 36 00       	mov    $0x36112d,%eax
  369ab6:	66 b8 00 00          	mov    $0x0,%ax
  369aba:	80 cc 8f             	or     $0x8f,%ah
  369abd:	89 42 04             	mov    %eax,0x4(%edx)
  369ac0:	ba 80 00 02 00       	mov    $0x20080,%edx
  369ac5:	b8 37 11 36 00       	mov    $0x361137,%eax
  369aca:	0f b7 c0             	movzwl %ax,%eax
  369acd:	0d 00 00 08 00       	or     $0x80000,%eax
  369ad2:	89 02                	mov    %eax,(%edx)
  369ad4:	ba 80 00 02 00       	mov    $0x20080,%edx
  369ad9:	b8 37 11 36 00       	mov    $0x361137,%eax
  369ade:	66 b8 00 00          	mov    $0x0,%ax
  369ae2:	80 cc 8f             	or     $0x8f,%ah
  369ae5:	89 42 04             	mov    %eax,0x4(%edx)
  369ae8:	ba 00 01 02 00       	mov    $0x20100,%edx
  369aed:	b8 91 11 36 00       	mov    $0x361191,%eax
  369af2:	0f b7 c0             	movzwl %ax,%eax
  369af5:	0d 00 00 08 00       	or     $0x80000,%eax
  369afa:	89 02                	mov    %eax,(%edx)
  369afc:	ba 00 01 02 00       	mov    $0x20100,%edx
  369b01:	b8 91 11 36 00       	mov    $0x361191,%eax
  369b06:	66 b8 00 00          	mov    $0x0,%ax
  369b0a:	80 cc 8e             	or     $0x8e,%ah
  369b0d:	89 42 04             	mov    %eax,0x4(%edx)
  369b10:	ba 08 01 02 00       	mov    $0x20108,%edx
  369b15:	b8 19 12 36 00       	mov    $0x361219,%eax
  369b1a:	0f b7 c0             	movzwl %ax,%eax
  369b1d:	0d 00 00 08 00       	or     $0x80000,%eax
  369b22:	89 02                	mov    %eax,(%edx)
  369b24:	ba 08 01 02 00       	mov    $0x20108,%edx
  369b29:	b8 19 12 36 00       	mov    $0x361219,%eax
  369b2e:	66 b8 00 00          	mov    $0x0,%ax
  369b32:	80 cc 8e             	or     $0x8e,%ah
  369b35:	89 42 04             	mov    %eax,0x4(%edx)
  369b38:	ba 10 01 02 00       	mov    $0x20110,%edx
  369b3d:	b8 51 12 36 00       	mov    $0x361251,%eax
  369b42:	0f b7 c0             	movzwl %ax,%eax
  369b45:	0d 00 00 08 00       	or     $0x80000,%eax
  369b4a:	89 02                	mov    %eax,(%edx)
  369b4c:	ba 10 01 02 00       	mov    $0x20110,%edx
  369b51:	b8 51 12 36 00       	mov    $0x361251,%eax
  369b56:	66 b8 00 00          	mov    $0x0,%ax
  369b5a:	80 cc 8e             	or     $0x8e,%ah
  369b5d:	89 42 04             	mov    %eax,0x4(%edx)
  369b60:	ba 18 01 02 00       	mov    $0x20118,%edx
  369b65:	b8 89 12 36 00       	mov    $0x361289,%eax
  369b6a:	0f b7 c0             	movzwl %ax,%eax
  369b6d:	0d 00 00 08 00       	or     $0x80000,%eax
  369b72:	89 02                	mov    %eax,(%edx)
  369b74:	ba 18 01 02 00       	mov    $0x20118,%edx
  369b79:	b8 89 12 36 00       	mov    $0x361289,%eax
  369b7e:	66 b8 00 00          	mov    $0x0,%ax
  369b82:	80 cc 8e             	or     $0x8e,%ah
  369b85:	89 42 04             	mov    %eax,0x4(%edx)
  369b88:	ba 20 01 02 00       	mov    $0x20120,%edx
  369b8d:	b8 c1 12 36 00       	mov    $0x3612c1,%eax
  369b92:	0f b7 c0             	movzwl %ax,%eax
  369b95:	0d 00 00 08 00       	or     $0x80000,%eax
  369b9a:	89 02                	mov    %eax,(%edx)
  369b9c:	ba 20 01 02 00       	mov    $0x20120,%edx
  369ba1:	b8 c1 12 36 00       	mov    $0x3612c1,%eax
  369ba6:	66 b8 00 00          	mov    $0x0,%ax
  369baa:	80 cc 8e             	or     $0x8e,%ah
  369bad:	89 42 04             	mov    %eax,0x4(%edx)
  369bb0:	ba 28 01 02 00       	mov    $0x20128,%edx
  369bb5:	b8 f9 12 36 00       	mov    $0x3612f9,%eax
  369bba:	0f b7 c0             	movzwl %ax,%eax
  369bbd:	0d 00 00 08 00       	or     $0x80000,%eax
  369bc2:	89 02                	mov    %eax,(%edx)
  369bc4:	ba 28 01 02 00       	mov    $0x20128,%edx
  369bc9:	b8 f9 12 36 00       	mov    $0x3612f9,%eax
  369bce:	66 b8 00 00          	mov    $0x0,%ax
  369bd2:	80 cc 8e             	or     $0x8e,%ah
  369bd5:	89 42 04             	mov    %eax,0x4(%edx)
  369bd8:	ba 30 01 02 00       	mov    $0x20130,%edx
  369bdd:	b8 31 13 36 00       	mov    $0x361331,%eax
  369be2:	0f b7 c0             	movzwl %ax,%eax
  369be5:	0d 00 00 08 00       	or     $0x80000,%eax
  369bea:	89 02                	mov    %eax,(%edx)
  369bec:	ba 30 01 02 00       	mov    $0x20130,%edx
  369bf1:	b8 31 13 36 00       	mov    $0x361331,%eax
  369bf6:	66 b8 00 00          	mov    $0x0,%ax
  369bfa:	80 cc 8e             	or     $0x8e,%ah
  369bfd:	89 42 04             	mov    %eax,0x4(%edx)
  369c00:	ba 38 01 02 00       	mov    $0x20138,%edx
  369c05:	b8 69 13 36 00       	mov    $0x361369,%eax
  369c0a:	0f b7 c0             	movzwl %ax,%eax
  369c0d:	0d 00 00 08 00       	or     $0x80000,%eax
  369c12:	89 02                	mov    %eax,(%edx)
  369c14:	ba 38 01 02 00       	mov    $0x20138,%edx
  369c19:	b8 69 13 36 00       	mov    $0x361369,%eax
  369c1e:	66 b8 00 00          	mov    $0x0,%ax
  369c22:	80 cc 8e             	or     $0x8e,%ah
  369c25:	89 42 04             	mov    %eax,0x4(%edx)
  369c28:	ba 40 01 02 00       	mov    $0x20140,%edx
  369c2d:	b8 a1 13 36 00       	mov    $0x3613a1,%eax
  369c32:	0f b7 c0             	movzwl %ax,%eax
  369c35:	0d 00 00 08 00       	or     $0x80000,%eax
  369c3a:	89 02                	mov    %eax,(%edx)
  369c3c:	ba 40 01 02 00       	mov    $0x20140,%edx
  369c41:	b8 a1 13 36 00       	mov    $0x3613a1,%eax
  369c46:	66 b8 00 00          	mov    $0x0,%ax
  369c4a:	80 cc 8e             	or     $0x8e,%ah
  369c4d:	89 42 04             	mov    %eax,0x4(%edx)
  369c50:	ba 48 01 02 00       	mov    $0x20148,%edx
  369c55:	b8 dd 13 36 00       	mov    $0x3613dd,%eax
  369c5a:	0f b7 c0             	movzwl %ax,%eax
  369c5d:	0d 00 00 08 00       	or     $0x80000,%eax
  369c62:	89 02                	mov    %eax,(%edx)
  369c64:	ba 48 01 02 00       	mov    $0x20148,%edx
  369c69:	b8 dd 13 36 00       	mov    $0x3613dd,%eax
  369c6e:	66 b8 00 00          	mov    $0x0,%ax
  369c72:	80 cc 8e             	or     $0x8e,%ah
  369c75:	89 42 04             	mov    %eax,0x4(%edx)
  369c78:	ba 50 01 02 00       	mov    $0x20150,%edx
  369c7d:	b8 19 14 36 00       	mov    $0x361419,%eax
  369c82:	0f b7 c0             	movzwl %ax,%eax
  369c85:	0d 00 00 08 00       	or     $0x80000,%eax
  369c8a:	89 02                	mov    %eax,(%edx)
  369c8c:	ba 50 01 02 00       	mov    $0x20150,%edx
  369c91:	b8 19 14 36 00       	mov    $0x361419,%eax
  369c96:	66 b8 00 00          	mov    $0x0,%ax
  369c9a:	80 cc 8e             	or     $0x8e,%ah
  369c9d:	89 42 04             	mov    %eax,0x4(%edx)
  369ca0:	ba 58 01 02 00       	mov    $0x20158,%edx
  369ca5:	b8 55 14 36 00       	mov    $0x361455,%eax
  369caa:	0f b7 c0             	movzwl %ax,%eax
  369cad:	0d 00 00 08 00       	or     $0x80000,%eax
  369cb2:	89 02                	mov    %eax,(%edx)
  369cb4:	ba 58 01 02 00       	mov    $0x20158,%edx
  369cb9:	b8 55 14 36 00       	mov    $0x361455,%eax
  369cbe:	66 b8 00 00          	mov    $0x0,%ax
  369cc2:	80 cc 8e             	or     $0x8e,%ah
  369cc5:	89 42 04             	mov    %eax,0x4(%edx)
  369cc8:	ba 60 01 02 00       	mov    $0x20160,%edx
  369ccd:	b8 91 14 36 00       	mov    $0x361491,%eax
  369cd2:	0f b7 c0             	movzwl %ax,%eax
  369cd5:	0d 00 00 08 00       	or     $0x80000,%eax
  369cda:	89 02                	mov    %eax,(%edx)
  369cdc:	ba 60 01 02 00       	mov    $0x20160,%edx
  369ce1:	b8 91 14 36 00       	mov    $0x361491,%eax
  369ce6:	66 b8 00 00          	mov    $0x0,%ax
  369cea:	80 cc 8e             	or     $0x8e,%ah
  369ced:	89 42 04             	mov    %eax,0x4(%edx)
  369cf0:	ba 68 01 02 00       	mov    $0x20168,%edx
  369cf5:	b8 cd 14 36 00       	mov    $0x3614cd,%eax
  369cfa:	0f b7 c0             	movzwl %ax,%eax
  369cfd:	0d 00 00 08 00       	or     $0x80000,%eax
  369d02:	89 02                	mov    %eax,(%edx)
  369d04:	ba 68 01 02 00       	mov    $0x20168,%edx
  369d09:	b8 cd 14 36 00       	mov    $0x3614cd,%eax
  369d0e:	66 b8 00 00          	mov    $0x0,%ax
  369d12:	80 cc 8e             	or     $0x8e,%ah
  369d15:	89 42 04             	mov    %eax,0x4(%edx)
  369d18:	ba 70 01 02 00       	mov    $0x20170,%edx
  369d1d:	b8 09 15 36 00       	mov    $0x361509,%eax
  369d22:	0f b7 c0             	movzwl %ax,%eax
  369d25:	0d 00 00 08 00       	or     $0x80000,%eax
  369d2a:	89 02                	mov    %eax,(%edx)
  369d2c:	ba 70 01 02 00       	mov    $0x20170,%edx
  369d31:	b8 09 15 36 00       	mov    $0x361509,%eax
  369d36:	66 b8 00 00          	mov    $0x0,%ax
  369d3a:	80 cc 8e             	or     $0x8e,%ah
  369d3d:	89 42 04             	mov    %eax,0x4(%edx)
  369d40:	ba 78 01 02 00       	mov    $0x20178,%edx
  369d45:	b8 45 15 36 00       	mov    $0x361545,%eax
  369d4a:	0f b7 c0             	movzwl %ax,%eax
  369d4d:	0d 00 00 08 00       	or     $0x80000,%eax
  369d52:	89 02                	mov    %eax,(%edx)
  369d54:	ba 78 01 02 00       	mov    $0x20178,%edx
  369d59:	b8 45 15 36 00       	mov    $0x361545,%eax
  369d5e:	66 b8 00 00          	mov    $0x0,%ax
  369d62:	80 cc 8e             	or     $0x8e,%ah
  369d65:	89 42 04             	mov    %eax,0x4(%edx)
  369d68:	ba 00 04 02 00       	mov    $0x20400,%edx
  369d6d:	b8 b5 15 36 00       	mov    $0x3615b5,%eax
  369d72:	0f b7 c0             	movzwl %ax,%eax
  369d75:	0d 00 00 08 00       	or     $0x80000,%eax
  369d7a:	89 02                	mov    %eax,(%edx)
  369d7c:	ba 00 04 02 00       	mov    $0x20400,%edx
  369d81:	b8 b5 15 36 00       	mov    $0x3615b5,%eax
  369d86:	66 b8 00 00          	mov    $0x0,%ax
  369d8a:	80 cc ee             	or     $0xee,%ah
  369d8d:	89 42 04             	mov    %eax,0x4(%edx)
  369d90:	ba 08 04 02 00       	mov    $0x20408,%edx
  369d95:	b8 4f 11 36 00       	mov    $0x36114f,%eax
  369d9a:	0f b7 c0             	movzwl %ax,%eax
  369d9d:	0d 00 00 08 00       	or     $0x80000,%eax
  369da2:	89 02                	mov    %eax,(%edx)
  369da4:	ba 08 04 02 00       	mov    $0x20408,%edx
  369da9:	b8 4f 11 36 00       	mov    $0x36114f,%eax
  369dae:	66 b8 00 00          	mov    $0x0,%ax
  369db2:	80 cc ee             	or     $0xee,%ah
  369db5:	89 42 04             	mov    %eax,0x4(%edx)
  369db8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  369dbf:	eb 12                	jmp    369dd3 <trap_init+0x5bc>
  369dc1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  369dc4:	c7 04 85 c0 30 37 00 	movl   $0x4,0x3730c0(,%eax,4)
  369dcb:	04 00 00 00 
  369dcf:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  369dd3:	83 7d f8 0f          	cmpl   $0xf,-0x8(%ebp)
  369dd7:	7e e8                	jle    369dc1 <trap_init+0x5aa>
  369dd9:	6a 20                	push   $0x20
  369ddb:	6a 11                	push   $0x11
  369ddd:	e8 40 f4 ff ff       	call   369222 <outb_p>
  369de2:	83 c4 08             	add    $0x8,%esp
  369de5:	6a 21                	push   $0x21
  369de7:	6a 20                	push   $0x20
  369de9:	e8 34 f4 ff ff       	call   369222 <outb_p>
  369dee:	83 c4 08             	add    $0x8,%esp
  369df1:	6a 21                	push   $0x21
  369df3:	6a 04                	push   $0x4
  369df5:	e8 28 f4 ff ff       	call   369222 <outb_p>
  369dfa:	83 c4 08             	add    $0x8,%esp
  369dfd:	6a 21                	push   $0x21
  369dff:	6a 01                	push   $0x1
  369e01:	e8 1c f4 ff ff       	call   369222 <outb_p>
  369e06:	83 c4 08             	add    $0x8,%esp
  369e09:	6a 21                	push   $0x21
  369e0b:	68 fb 00 00 00       	push   $0xfb
  369e10:	e8 0d f4 ff ff       	call   369222 <outb_p>
  369e15:	83 c4 08             	add    $0x8,%esp
  369e18:	68 a0 00 00 00       	push   $0xa0
  369e1d:	6a 11                	push   $0x11
  369e1f:	e8 fe f3 ff ff       	call   369222 <outb_p>
  369e24:	83 c4 08             	add    $0x8,%esp
  369e27:	68 a1 00 00 00       	push   $0xa1
  369e2c:	6a 28                	push   $0x28
  369e2e:	e8 ef f3 ff ff       	call   369222 <outb_p>
  369e33:	83 c4 08             	add    $0x8,%esp
  369e36:	68 a1 00 00 00       	push   $0xa1
  369e3b:	6a 02                	push   $0x2
  369e3d:	e8 e0 f3 ff ff       	call   369222 <outb_p>
  369e42:	83 c4 08             	add    $0x8,%esp
  369e45:	68 a1 00 00 00       	push   $0xa1
  369e4a:	6a 01                	push   $0x1
  369e4c:	e8 d1 f3 ff ff       	call   369222 <outb_p>
  369e51:	83 c4 08             	add    $0x8,%esp
  369e54:	68 a1 00 00 00       	push   $0xa1
  369e59:	68 ff 00 00 00       	push   $0xff
  369e5e:	e8 bf f3 ff ff       	call   369222 <outb_p>
  369e63:	83 c4 08             	add    $0x8,%esp
  369e66:	c9                   	leave  
  369e67:	c3                   	ret    

00369e68 <strcpy>:
  369e68:	55                   	push   %ebp
  369e69:	89 e5                	mov    %esp,%ebp
  369e6b:	57                   	push   %edi
  369e6c:	56                   	push   %esi
  369e6d:	8b 55 0c             	mov    0xc(%ebp),%edx
  369e70:	8b 4d 08             	mov    0x8(%ebp),%ecx
  369e73:	89 d6                	mov    %edx,%esi
  369e75:	89 cf                	mov    %ecx,%edi
  369e77:	fc                   	cld    
  369e78:	ac                   	lods   %ds:(%esi),%al
  369e79:	aa                   	stos   %al,%es:(%edi)
  369e7a:	84 c0                	test   %al,%al
  369e7c:	75 fa                	jne    369e78 <strcpy+0x10>
  369e7e:	8b 45 08             	mov    0x8(%ebp),%eax
  369e81:	5e                   	pop    %esi
  369e82:	5f                   	pop    %edi
  369e83:	5d                   	pop    %ebp
  369e84:	c3                   	ret    

00369e85 <memcpy>:
  369e85:	55                   	push   %ebp
  369e86:	89 e5                	mov    %esp,%ebp
  369e88:	57                   	push   %edi
  369e89:	56                   	push   %esi
  369e8a:	53                   	push   %ebx
  369e8b:	8b 45 10             	mov    0x10(%ebp),%eax
  369e8e:	8b 55 0c             	mov    0xc(%ebp),%edx
  369e91:	8b 5d 08             	mov    0x8(%ebp),%ebx
  369e94:	89 c1                	mov    %eax,%ecx
  369e96:	89 d6                	mov    %edx,%esi
  369e98:	89 df                	mov    %ebx,%edi
  369e9a:	fc                   	cld    
  369e9b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  369e9d:	8b 45 08             	mov    0x8(%ebp),%eax
  369ea0:	5b                   	pop    %ebx
  369ea1:	5e                   	pop    %esi
  369ea2:	5f                   	pop    %edi
  369ea3:	5d                   	pop    %ebp
  369ea4:	c3                   	ret    

00369ea5 <pick_task>:
  369ea5:	55                   	push   %ebp
  369ea6:	89 e5                	mov    %esp,%ebp
  369ea8:	a1 cc 37 37 00       	mov    0x3737cc,%eax
  369ead:	85 c0                	test   %eax,%eax
  369eaf:	74 0c                	je     369ebd <pick_task+0x18>
  369eb1:	a1 cc 37 37 00       	mov    0x3737cc,%eax
  369eb6:	a3 c4 37 37 00       	mov    %eax,0x3737c4
  369ebb:	eb 1f                	jmp    369edc <pick_task+0x37>
  369ebd:	a1 d0 37 37 00       	mov    0x3737d0,%eax
  369ec2:	85 c0                	test   %eax,%eax
  369ec4:	74 0c                	je     369ed2 <pick_task+0x2d>
  369ec6:	a1 d0 37 37 00       	mov    0x3737d0,%eax
  369ecb:	a3 c4 37 37 00       	mov    %eax,0x3737c4
  369ed0:	eb 0a                	jmp    369edc <pick_task+0x37>
  369ed2:	a1 d4 37 37 00       	mov    0x3737d4,%eax
  369ed7:	a3 c4 37 37 00       	mov    %eax,0x3737c4
  369edc:	a1 e4 37 37 00       	mov    0x3737e4,%eax
  369ee1:	8b 15 c4 37 37 00    	mov    0x3737c4,%edx
  369ee7:	81 c2 00 10 00 00    	add    $0x1000,%edx
  369eed:	89 50 04             	mov    %edx,0x4(%eax)
  369ef0:	5d                   	pop    %ebp
  369ef1:	c3                   	ret    

00369ef2 <sched>:
  369ef2:	55                   	push   %ebp
  369ef3:	89 e5                	mov    %esp,%ebp
  369ef5:	a1 d0 37 37 00       	mov    0x3737d0,%eax
  369efa:	85 c0                	test   %eax,%eax
  369efc:	74 60                	je     369f5e <sched+0x6c>
  369efe:	a1 d0 37 37 00       	mov    0x3737d0,%eax
  369f03:	8b 80 f8 00 00 00    	mov    0xf8(%eax),%eax
  369f09:	85 c0                	test   %eax,%eax
  369f0b:	75 51                	jne    369f5e <sched+0x6c>
  369f0d:	a1 dc 37 37 00       	mov    0x3737dc,%eax
  369f12:	8b 15 d0 37 37 00    	mov    0x3737d0,%edx
  369f18:	89 90 08 01 00 00    	mov    %edx,0x108(%eax)
  369f1e:	a1 d0 37 37 00       	mov    0x3737d0,%eax
  369f23:	a3 dc 37 37 00       	mov    %eax,0x3737dc
  369f28:	a1 d0 37 37 00       	mov    0x3737d0,%eax
  369f2d:	8b 80 08 01 00 00    	mov    0x108(%eax),%eax
  369f33:	a3 d0 37 37 00       	mov    %eax,0x3737d0
  369f38:	a1 dc 37 37 00       	mov    0x3737dc,%eax
  369f3d:	c7 80 08 01 00 00 00 	movl   $0x0,0x108(%eax)
  369f44:	00 00 00 
  369f47:	a1 d0 37 37 00       	mov    0x3737d0,%eax
  369f4c:	8b 15 d0 37 37 00    	mov    0x3737d0,%edx
  369f52:	8b 92 f4 00 00 00    	mov    0xf4(%edx),%edx
  369f58:	89 90 f8 00 00 00    	mov    %edx,0xf8(%eax)
  369f5e:	e8 42 ff ff ff       	call   369ea5 <pick_task>
  369f63:	5d                   	pop    %ebp
  369f64:	c3                   	ret    

00369f65 <ready>:
  369f65:	55                   	push   %ebp
  369f66:	89 e5                	mov    %esp,%ebp
  369f68:	83 ec 08             	sub    $0x8,%esp
  369f6b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  369f6f:	75 10                	jne    369f81 <ready+0x1c>
  369f71:	83 ec 0c             	sub    $0xc,%esp
  369f74:	68 2c e6 36 00       	push   $0x36e62c
  369f79:	e8 ee f0 ff ff       	call   36906c <panic>
  369f7e:	83 c4 10             	add    $0x10,%esp
  369f81:	8b 45 08             	mov    0x8(%ebp),%eax
  369f84:	8b 80 fc 00 00 00    	mov    0xfc(%eax),%eax
  369f8a:	8b 04 85 cc 37 37 00 	mov    0x3737cc(,%eax,4),%eax
  369f91:	85 c0                	test   %eax,%eax
  369f93:	75 15                	jne    369faa <ready+0x45>
  369f95:	8b 45 08             	mov    0x8(%ebp),%eax
  369f98:	8b 80 fc 00 00 00    	mov    0xfc(%eax),%eax
  369f9e:	8b 55 08             	mov    0x8(%ebp),%edx
  369fa1:	89 14 85 cc 37 37 00 	mov    %edx,0x3737cc(,%eax,4)
  369fa8:	eb 19                	jmp    369fc3 <ready+0x5e>
  369faa:	8b 45 08             	mov    0x8(%ebp),%eax
  369fad:	8b 80 fc 00 00 00    	mov    0xfc(%eax),%eax
  369fb3:	8b 04 85 d8 37 37 00 	mov    0x3737d8(,%eax,4),%eax
  369fba:	8b 55 08             	mov    0x8(%ebp),%edx
  369fbd:	89 90 08 01 00 00    	mov    %edx,0x108(%eax)
  369fc3:	8b 45 08             	mov    0x8(%ebp),%eax
  369fc6:	c7 80 08 01 00 00 00 	movl   $0x0,0x108(%eax)
  369fcd:	00 00 00 
  369fd0:	8b 45 08             	mov    0x8(%ebp),%eax
  369fd3:	8b 80 fc 00 00 00    	mov    0xfc(%eax),%eax
  369fd9:	8b 55 08             	mov    0x8(%ebp),%edx
  369fdc:	89 14 85 d8 37 37 00 	mov    %edx,0x3737d8(,%eax,4)
  369fe3:	c9                   	leave  
  369fe4:	c3                   	ret    

00369fe5 <unready>:
  369fe5:	55                   	push   %ebp
  369fe6:	89 e5                	mov    %esp,%ebp
  369fe8:	83 ec 18             	sub    $0x18,%esp
  369feb:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  369fef:	75 10                	jne    36a001 <unready+0x1c>
  369ff1:	83 ec 0c             	sub    $0xc,%esp
  369ff4:	68 4c e6 36 00       	push   $0x36e64c
  369ff9:	e8 6e f0 ff ff       	call   36906c <panic>
  369ffe:	83 c4 10             	add    $0x10,%esp
  36a001:	8b 45 08             	mov    0x8(%ebp),%eax
  36a004:	8b 80 fc 00 00 00    	mov    0xfc(%eax),%eax
  36a00a:	8b 04 85 cc 37 37 00 	mov    0x3737cc(,%eax,4),%eax
  36a011:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36a014:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36a018:	0f 84 95 00 00 00    	je     36a0b3 <unready+0xce>
  36a01e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a021:	3b 45 08             	cmp    0x8(%ebp),%eax
  36a024:	75 1b                	jne    36a041 <unready+0x5c>
  36a026:	8b 45 08             	mov    0x8(%ebp),%eax
  36a029:	8b 80 fc 00 00 00    	mov    0xfc(%eax),%eax
  36a02f:	8b 55 08             	mov    0x8(%ebp),%edx
  36a032:	8b 92 08 01 00 00    	mov    0x108(%edx),%edx
  36a038:	89 14 85 cc 37 37 00 	mov    %edx,0x3737cc(,%eax,4)
  36a03f:	eb 72                	jmp    36a0b3 <unready+0xce>
  36a041:	eb 22                	jmp    36a065 <unready+0x80>
  36a043:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a046:	8b 80 08 01 00 00    	mov    0x108(%eax),%eax
  36a04c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36a04f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36a053:	75 10                	jne    36a065 <unready+0x80>
  36a055:	83 ec 0c             	sub    $0xc,%esp
  36a058:	68 70 e6 36 00       	push   $0x36e670
  36a05d:	e8 0a f0 ff ff       	call   36906c <panic>
  36a062:	83 c4 10             	add    $0x10,%esp
  36a065:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a068:	8b 80 08 01 00 00    	mov    0x108(%eax),%eax
  36a06e:	3b 45 08             	cmp    0x8(%ebp),%eax
  36a071:	75 d0                	jne    36a043 <unready+0x5e>
  36a073:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a076:	8b 80 08 01 00 00    	mov    0x108(%eax),%eax
  36a07c:	8b 90 08 01 00 00    	mov    0x108(%eax),%edx
  36a082:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a085:	89 90 08 01 00 00    	mov    %edx,0x108(%eax)
  36a08b:	8b 45 08             	mov    0x8(%ebp),%eax
  36a08e:	8b 80 fc 00 00 00    	mov    0xfc(%eax),%eax
  36a094:	8b 04 85 d8 37 37 00 	mov    0x3737d8(,%eax,4),%eax
  36a09b:	3b 45 08             	cmp    0x8(%ebp),%eax
  36a09e:	75 13                	jne    36a0b3 <unready+0xce>
  36a0a0:	8b 45 08             	mov    0x8(%ebp),%eax
  36a0a3:	8b 80 fc 00 00 00    	mov    0xfc(%eax),%eax
  36a0a9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  36a0ac:	89 14 85 d8 37 37 00 	mov    %edx,0x3737d8(,%eax,4)
  36a0b3:	cd 81                	int    $0x81
  36a0b5:	c9                   	leave  
  36a0b6:	c3                   	ret    

0036a0b7 <_sleep>:
  36a0b7:	55                   	push   %ebp
  36a0b8:	89 e5                	mov    %esp,%ebp
  36a0ba:	83 ec 18             	sub    $0x18,%esp
  36a0bd:	8b 45 08             	mov    0x8(%ebp),%eax
  36a0c0:	c7 80 dc 00 00 00 01 	movl   $0x1,0xdc(%eax)
  36a0c7:	00 00 00 
  36a0ca:	8b 45 08             	mov    0x8(%ebp),%eax
  36a0cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36a0d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a0d3:	83 ec 0c             	sub    $0xc,%esp
  36a0d6:	50                   	push   %eax
  36a0d7:	e8 09 ff ff ff       	call   369fe5 <unready>
  36a0dc:	83 c4 10             	add    $0x10,%esp
  36a0df:	c9                   	leave  
  36a0e0:	c3                   	ret    

0036a0e1 <_wait>:
  36a0e1:	55                   	push   %ebp
  36a0e2:	89 e5                	mov    %esp,%ebp
  36a0e4:	83 ec 18             	sub    $0x18,%esp
  36a0e7:	8b 45 08             	mov    0x8(%ebp),%eax
  36a0ea:	c7 80 dc 00 00 00 00 	movl   $0x0,0xdc(%eax)
  36a0f1:	00 00 00 
  36a0f4:	8b 45 08             	mov    0x8(%ebp),%eax
  36a0f7:	8b 55 0c             	mov    0xc(%ebp),%edx
  36a0fa:	89 90 d8 00 00 00    	mov    %edx,0xd8(%eax)
  36a100:	8b 45 08             	mov    0x8(%ebp),%eax
  36a103:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36a106:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a109:	83 ec 0c             	sub    $0xc,%esp
  36a10c:	50                   	push   %eax
  36a10d:	e8 d3 fe ff ff       	call   369fe5 <unready>
  36a112:	83 c4 10             	add    $0x10,%esp
  36a115:	c9                   	leave  
  36a116:	c3                   	ret    

0036a117 <_wakeup>:
  36a117:	55                   	push   %ebp
  36a118:	89 e5                	mov    %esp,%ebp
  36a11a:	83 ec 18             	sub    $0x18,%esp
  36a11d:	8b 45 08             	mov    0x8(%ebp),%eax
  36a120:	c7 80 dc 00 00 00 02 	movl   $0x2,0xdc(%eax)
  36a127:	00 00 00 
  36a12a:	8b 45 08             	mov    0x8(%ebp),%eax
  36a12d:	c7 80 d8 00 00 00 00 	movl   $0x0,0xd8(%eax)
  36a134:	00 00 00 
  36a137:	8b 45 08             	mov    0x8(%ebp),%eax
  36a13a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36a13d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a140:	83 ec 0c             	sub    $0xc,%esp
  36a143:	50                   	push   %eax
  36a144:	e8 1c fe ff ff       	call   369f65 <ready>
  36a149:	83 c4 10             	add    $0x10,%esp
  36a14c:	c9                   	leave  
  36a14d:	c3                   	ret    

0036a14e <dohook>:
  36a14e:	55                   	push   %ebp
  36a14f:	89 e5                	mov    %esp,%ebp
  36a151:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  36a155:	77 18                	ja     36a16f <dohook+0x21>
  36a157:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a15c:	8b 55 08             	mov    0x8(%ebp),%edx
  36a15f:	8d 4a 14             	lea    0x14(%edx),%ecx
  36a162:	8b 55 0c             	mov    0xc(%ebp),%edx
  36a165:	89 14 88             	mov    %edx,(%eax,%ecx,4)
  36a168:	b8 00 00 00 00       	mov    $0x0,%eax
  36a16d:	eb 05                	jmp    36a174 <dohook+0x26>
  36a16f:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
  36a174:	5d                   	pop    %ebp
  36a175:	c3                   	ret    

0036a176 <dofn>:
  36a176:	55                   	push   %ebp
  36a177:	89 e5                	mov    %esp,%ebp
  36a179:	83 ec 18             	sub    $0x18,%esp
  36a17c:	8b 45 08             	mov    0x8(%ebp),%eax
  36a17f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36a182:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  36a186:	7f 18                	jg     36a1a0 <dofn+0x2a>
  36a188:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36a18c:	78 12                	js     36a1a0 <dofn+0x2a>
  36a18e:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a193:	8b 55 08             	mov    0x8(%ebp),%edx
  36a196:	83 c2 0c             	add    $0xc,%edx
  36a199:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  36a19d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36a1a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a1a3:	8b 04 85 00 3d 37 00 	mov    0x373d00(,%eax,4),%eax
  36a1aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36a1ad:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  36a1b1:	75 0a                	jne    36a1bd <dofn+0x47>
  36a1b3:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
  36a1b8:	e9 b8 00 00 00       	jmp    36a275 <dofn+0xff>
  36a1bd:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a1c2:	8b 55 0c             	mov    0xc(%ebp),%edx
  36a1c5:	89 50 40             	mov    %edx,0x40(%eax)
  36a1c8:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a1cd:	8b 55 10             	mov    0x10(%ebp),%edx
  36a1d0:	89 50 44             	mov    %edx,0x44(%eax)
  36a1d3:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a1d8:	8b 55 14             	mov    0x14(%ebp),%edx
  36a1db:	89 50 48             	mov    %edx,0x48(%eax)
  36a1de:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a1e3:	8b 55 18             	mov    0x18(%ebp),%edx
  36a1e6:	89 50 4c             	mov    %edx,0x4c(%eax)
  36a1e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36a1ec:	8b 80 e0 00 00 00    	mov    0xe0(%eax),%eax
  36a1f2:	85 c0                	test   %eax,%eax
  36a1f4:	75 11                	jne    36a207 <dofn+0x91>
  36a1f6:	8b 15 c4 37 37 00    	mov    0x3737c4,%edx
  36a1fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36a1ff:	89 90 e0 00 00 00    	mov    %edx,0xe0(%eax)
  36a205:	eb 15                	jmp    36a21c <dofn+0xa6>
  36a207:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36a20a:	8b 80 e8 00 00 00    	mov    0xe8(%eax),%eax
  36a210:	8b 15 c4 37 37 00    	mov    0x3737c4,%edx
  36a216:	89 90 e4 00 00 00    	mov    %edx,0xe4(%eax)
  36a21c:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a221:	c7 80 e4 00 00 00 00 	movl   $0x0,0xe4(%eax)
  36a228:	00 00 00 
  36a22b:	8b 15 c4 37 37 00    	mov    0x3737c4,%edx
  36a231:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36a234:	89 90 e8 00 00 00    	mov    %edx,0xe8(%eax)
  36a23a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36a23d:	8b 80 dc 00 00 00    	mov    0xdc(%eax),%eax
  36a243:	83 f8 01             	cmp    $0x1,%eax
  36a246:	75 0e                	jne    36a256 <dofn+0xe0>
  36a248:	83 ec 0c             	sub    $0xc,%esp
  36a24b:	ff 75 f0             	pushl  -0x10(%ebp)
  36a24e:	e8 c4 fe ff ff       	call   36a117 <_wakeup>
  36a253:	83 c4 10             	add    $0x10,%esp
  36a256:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a25b:	83 ec 08             	sub    $0x8,%esp
  36a25e:	ff 75 f0             	pushl  -0x10(%ebp)
  36a261:	50                   	push   %eax
  36a262:	e8 7a fe ff ff       	call   36a0e1 <_wait>
  36a267:	83 c4 10             	add    $0x10,%esp
  36a26a:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a26f:	8b 80 d0 00 00 00    	mov    0xd0(%eax),%eax
  36a275:	c9                   	leave  
  36a276:	c3                   	ret    

0036a277 <alloc_iLink>:
  36a277:	55                   	push   %ebp
  36a278:	89 e5                	mov    %esp,%ebp
  36a27a:	83 ec 18             	sub    $0x18,%esp
  36a27d:	a1 e8 37 37 00       	mov    0x3737e8,%eax
  36a282:	85 c0                	test   %eax,%eax
  36a284:	75 0f                	jne    36a295 <alloc_iLink+0x1e>
  36a286:	83 ec 0c             	sub    $0xc,%esp
  36a289:	6a 18                	push   $0x18
  36a28b:	e8 a3 14 00 00       	call   36b733 <kalloc>
  36a290:	83 c4 10             	add    $0x10,%esp
  36a293:	eb 25                	jmp    36a2ba <alloc_iLink+0x43>
  36a295:	a1 e8 37 37 00       	mov    0x3737e8,%eax
  36a29a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36a29d:	a1 e8 37 37 00       	mov    0x3737e8,%eax
  36a2a2:	8b 40 14             	mov    0x14(%eax),%eax
  36a2a5:	a3 e8 37 37 00       	mov    %eax,0x3737e8
  36a2aa:	a1 ec 37 37 00       	mov    0x3737ec,%eax
  36a2af:	83 e8 01             	sub    $0x1,%eax
  36a2b2:	a3 ec 37 37 00       	mov    %eax,0x3737ec
  36a2b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a2ba:	c9                   	leave  
  36a2bb:	c3                   	ret    

0036a2bc <free_iLink>:
  36a2bc:	55                   	push   %ebp
  36a2bd:	89 e5                	mov    %esp,%ebp
  36a2bf:	83 ec 08             	sub    $0x8,%esp
  36a2c2:	a1 ec 37 37 00       	mov    0x3737ec,%eax
  36a2c7:	83 f8 1f             	cmp    $0x1f,%eax
  36a2ca:	77 23                	ja     36a2ef <free_iLink+0x33>
  36a2cc:	8b 15 e8 37 37 00    	mov    0x3737e8,%edx
  36a2d2:	8b 45 08             	mov    0x8(%ebp),%eax
  36a2d5:	89 50 14             	mov    %edx,0x14(%eax)
  36a2d8:	8b 45 08             	mov    0x8(%ebp),%eax
  36a2db:	a3 e8 37 37 00       	mov    %eax,0x3737e8
  36a2e0:	a1 ec 37 37 00       	mov    0x3737ec,%eax
  36a2e5:	83 c0 01             	add    $0x1,%eax
  36a2e8:	a3 ec 37 37 00       	mov    %eax,0x3737ec
  36a2ed:	eb 0e                	jmp    36a2fd <free_iLink+0x41>
  36a2ef:	83 ec 0c             	sub    $0xc,%esp
  36a2f2:	ff 75 08             	pushl  0x8(%ebp)
  36a2f5:	e8 ac 1f 00 00       	call   36c2a6 <free>
  36a2fa:	83 c4 10             	add    $0x10,%esp
  36a2fd:	c9                   	leave  
  36a2fe:	c3                   	ret    

0036a2ff <doint>:
  36a2ff:	55                   	push   %ebp
  36a300:	89 e5                	mov    %esp,%ebp
  36a302:	83 ec 18             	sub    $0x18,%esp
  36a305:	8b 45 08             	mov    0x8(%ebp),%eax
  36a308:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36a30b:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  36a30f:	7f 18                	jg     36a329 <doint+0x2a>
  36a311:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36a315:	78 12                	js     36a329 <doint+0x2a>
  36a317:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a31c:	8b 55 08             	mov    0x8(%ebp),%edx
  36a31f:	83 c2 0c             	add    $0xc,%edx
  36a322:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  36a326:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36a329:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a32c:	8b 04 85 00 3d 37 00 	mov    0x373d00(,%eax,4),%eax
  36a333:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36a336:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  36a33a:	75 10                	jne    36a34c <doint+0x4d>
  36a33c:	83 ec 0c             	sub    $0xc,%esp
  36a33f:	68 91 e6 36 00       	push   $0x36e691
  36a344:	e8 23 ed ff ff       	call   36906c <panic>
  36a349:	83 c4 10             	add    $0x10,%esp
  36a34c:	e8 26 ff ff ff       	call   36a277 <alloc_iLink>
  36a351:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36a354:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  36a358:	75 10                	jne    36a36a <doint+0x6b>
  36a35a:	83 ec 0c             	sub    $0xc,%esp
  36a35d:	68 a9 e6 36 00       	push   $0x36e6a9
  36a362:	e8 05 ed ff ff       	call   36906c <panic>
  36a367:	83 c4 10             	add    $0x10,%esp
  36a36a:	8b 55 0c             	mov    0xc(%ebp),%edx
  36a36d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36a370:	89 50 04             	mov    %edx,0x4(%eax)
  36a373:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36a376:	8b 55 10             	mov    0x10(%ebp),%edx
  36a379:	89 50 08             	mov    %edx,0x8(%eax)
  36a37c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36a37f:	8b 55 14             	mov    0x14(%ebp),%edx
  36a382:	89 50 0c             	mov    %edx,0xc(%eax)
  36a385:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36a388:	8b 55 18             	mov    0x18(%ebp),%edx
  36a38b:	89 50 10             	mov    %edx,0x10(%eax)
  36a38e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36a391:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
  36a398:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36a39b:	8b 80 ec 00 00 00    	mov    0xec(%eax),%eax
  36a3a1:	85 c0                	test   %eax,%eax
  36a3a3:	74 0f                	je     36a3b4 <doint+0xb5>
  36a3a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36a3a8:	8b 90 ec 00 00 00    	mov    0xec(%eax),%edx
  36a3ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36a3b1:	89 50 14             	mov    %edx,0x14(%eax)
  36a3b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36a3b7:	8b 55 ec             	mov    -0x14(%ebp),%edx
  36a3ba:	89 90 ec 00 00 00    	mov    %edx,0xec(%eax)
  36a3c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36a3c3:	8b 80 dc 00 00 00    	mov    0xdc(%eax),%eax
  36a3c9:	83 f8 01             	cmp    $0x1,%eax
  36a3cc:	75 0e                	jne    36a3dc <doint+0xdd>
  36a3ce:	83 ec 0c             	sub    $0xc,%esp
  36a3d1:	ff 75 f0             	pushl  -0x10(%ebp)
  36a3d4:	e8 3e fd ff ff       	call   36a117 <_wakeup>
  36a3d9:	83 c4 10             	add    $0x10,%esp
  36a3dc:	b8 00 00 00 00       	mov    $0x0,%eax
  36a3e1:	c9                   	leave  
  36a3e2:	c3                   	ret    

0036a3e3 <doret>:
  36a3e3:	55                   	push   %ebp
  36a3e4:	89 e5                	mov    %esp,%ebp
  36a3e6:	83 ec 18             	sub    $0x18,%esp
  36a3e9:	8b 45 08             	mov    0x8(%ebp),%eax
  36a3ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36a3ef:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  36a3f3:	7f 18                	jg     36a40d <doret+0x2a>
  36a3f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36a3f9:	78 12                	js     36a40d <doret+0x2a>
  36a3fb:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a400:	8b 55 08             	mov    0x8(%ebp),%edx
  36a403:	83 c2 0c             	add    $0xc,%edx
  36a406:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  36a40a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36a40d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a410:	8b 04 85 00 3d 37 00 	mov    0x373d00(,%eax,4),%eax
  36a417:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36a41a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  36a41e:	74 38                	je     36a458 <doret+0x75>
  36a420:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36a423:	8b 90 d8 00 00 00    	mov    0xd8(%eax),%edx
  36a429:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a42e:	39 c2                	cmp    %eax,%edx
  36a430:	75 26                	jne    36a458 <doret+0x75>
  36a432:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36a435:	8b 55 0c             	mov    0xc(%ebp),%edx
  36a438:	89 90 d0 00 00 00    	mov    %edx,0xd0(%eax)
  36a43e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36a441:	8b 55 10             	mov    0x10(%ebp),%edx
  36a444:	89 90 d4 00 00 00    	mov    %edx,0xd4(%eax)
  36a44a:	83 ec 0c             	sub    $0xc,%esp
  36a44d:	ff 75 f0             	pushl  -0x10(%ebp)
  36a450:	e8 c2 fc ff ff       	call   36a117 <_wakeup>
  36a455:	83 c4 10             	add    $0x10,%esp
  36a458:	b8 00 00 00 00       	mov    $0x0,%eax
  36a45d:	c9                   	leave  
  36a45e:	c3                   	ret    

0036a45f <doloop>:
  36a45f:	55                   	push   %ebp
  36a460:	89 e5                	mov    %esp,%ebp
  36a462:	57                   	push   %edi
  36a463:	56                   	push   %esi
  36a464:	53                   	push   %ebx
  36a465:	83 ec 2c             	sub    $0x2c,%esp
  36a468:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a46d:	8b 80 ec 00 00 00    	mov    0xec(%eax),%eax
  36a473:	85 c0                	test   %eax,%eax
  36a475:	74 5a                	je     36a4d1 <doloop+0x72>
  36a477:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a47c:	8b 80 ec 00 00 00    	mov    0xec(%eax),%eax
  36a482:	89 45 cc             	mov    %eax,-0x34(%ebp)
  36a485:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  36a48c:	8b 45 cc             	mov    -0x34(%ebp),%eax
  36a48f:	8b 40 04             	mov    0x4(%eax),%eax
  36a492:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36a495:	8b 45 cc             	mov    -0x34(%ebp),%eax
  36a498:	8b 40 08             	mov    0x8(%eax),%eax
  36a49b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36a49e:	8b 45 cc             	mov    -0x34(%ebp),%eax
  36a4a1:	8b 40 0c             	mov    0xc(%eax),%eax
  36a4a4:	89 45 dc             	mov    %eax,-0x24(%ebp)
  36a4a7:	8b 45 cc             	mov    -0x34(%ebp),%eax
  36a4aa:	8b 40 10             	mov    0x10(%eax),%eax
  36a4ad:	89 45 d8             	mov    %eax,-0x28(%ebp)
  36a4b0:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a4b5:	8b 55 cc             	mov    -0x34(%ebp),%edx
  36a4b8:	8b 52 14             	mov    0x14(%edx),%edx
  36a4bb:	89 90 ec 00 00 00    	mov    %edx,0xec(%eax)
  36a4c1:	83 ec 0c             	sub    $0xc,%esp
  36a4c4:	ff 75 cc             	pushl  -0x34(%ebp)
  36a4c7:	e8 f0 fd ff ff       	call   36a2bc <free_iLink>
  36a4cc:	83 c4 10             	add    $0x10,%esp
  36a4cf:	eb 75                	jmp    36a546 <doloop+0xe7>
  36a4d1:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a4d6:	8b 80 e0 00 00 00    	mov    0xe0(%eax),%eax
  36a4dc:	85 c0                	test   %eax,%eax
  36a4de:	74 50                	je     36a530 <doloop+0xd1>
  36a4e0:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a4e5:	8b 80 e0 00 00 00    	mov    0xe0(%eax),%eax
  36a4eb:	89 45 d0             	mov    %eax,-0x30(%ebp)
  36a4ee:	8b 45 d0             	mov    -0x30(%ebp),%eax
  36a4f1:	8b 00                	mov    (%eax),%eax
  36a4f3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  36a4f6:	8b 45 d0             	mov    -0x30(%ebp),%eax
  36a4f9:	8b 40 40             	mov    0x40(%eax),%eax
  36a4fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36a4ff:	8b 45 d0             	mov    -0x30(%ebp),%eax
  36a502:	8b 40 44             	mov    0x44(%eax),%eax
  36a505:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36a508:	8b 45 d0             	mov    -0x30(%ebp),%eax
  36a50b:	8b 40 48             	mov    0x48(%eax),%eax
  36a50e:	89 45 dc             	mov    %eax,-0x24(%ebp)
  36a511:	8b 45 d0             	mov    -0x30(%ebp),%eax
  36a514:	8b 40 4c             	mov    0x4c(%eax),%eax
  36a517:	89 45 d8             	mov    %eax,-0x28(%ebp)
  36a51a:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a51f:	8b 55 d0             	mov    -0x30(%ebp),%edx
  36a522:	8b 92 e4 00 00 00    	mov    0xe4(%edx),%edx
  36a528:	89 90 e0 00 00 00    	mov    %edx,0xe0(%eax)
  36a52e:	eb 16                	jmp    36a546 <doloop+0xe7>
  36a530:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a535:	83 ec 0c             	sub    $0xc,%esp
  36a538:	50                   	push   %eax
  36a539:	e8 79 fb ff ff       	call   36a0b7 <_sleep>
  36a53e:	83 c4 10             	add    $0x10,%esp
  36a541:	e9 22 ff ff ff       	jmp    36a468 <doloop+0x9>
  36a546:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a54b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  36a54e:	83 c2 14             	add    $0x14,%edx
  36a551:	8b 04 90             	mov    (%eax,%edx,4),%eax
  36a554:	85 c0                	test   %eax,%eax
  36a556:	75 17                	jne    36a56f <doloop+0x110>
  36a558:	83 ec 04             	sub    $0x4,%esp
  36a55b:	6a da                	push   $0xffffffda
  36a55d:	6a ff                	push   $0xffffffff
  36a55f:	ff 75 d4             	pushl  -0x2c(%ebp)
  36a562:	e8 7c fe ff ff       	call   36a3e3 <doret>
  36a567:	83 c4 10             	add    $0x10,%esp
  36a56a:	e9 f9 fe ff ff       	jmp    36a468 <doloop+0x9>
  36a56f:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a574:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  36a577:	83 c2 14             	add    $0x14,%edx
  36a57a:	8b 04 90             	mov    (%eax,%edx,4),%eax
  36a57d:	89 45 c8             	mov    %eax,-0x38(%ebp)
  36a580:	8b 45 c8             	mov    -0x38(%ebp),%eax
  36a583:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
  36a586:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  36a589:	8b 55 dc             	mov    -0x24(%ebp),%edx
  36a58c:	8b 75 d8             	mov    -0x28(%ebp),%esi
  36a58f:	89 f7                	mov    %esi,%edi
  36a591:	c9                   	leave  
  36a592:	c3                   	ret    
  36a593:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36a596:	5b                   	pop    %ebx
  36a597:	5e                   	pop    %esi
  36a598:	5f                   	pop    %edi
  36a599:	5d                   	pop    %ebp
  36a59a:	c3                   	ret    

0036a59b <gam>:
  36a59b:	55                   	push   %ebp
  36a59c:	89 e5                	mov    %esp,%ebp
  36a59e:	8b 45 08             	mov    0x8(%ebp),%eax
  36a5a1:	c7 40 34 06 00 00 00 	movl   $0x6,0x34(%eax)
  36a5a8:	8b 45 08             	mov    0x8(%ebp),%eax
  36a5ab:	c7 40 38 06 00 00 00 	movl   $0x6,0x38(%eax)
  36a5b2:	8b 45 08             	mov    0x8(%ebp),%eax
  36a5b5:	c7 40 3c 06 00 00 00 	movl   $0x6,0x3c(%eax)
  36a5bc:	5d                   	pop    %ebp
  36a5bd:	c3                   	ret    

0036a5be <make_task>:
  36a5be:	55                   	push   %ebp
  36a5bf:	89 e5                	mov    %esp,%ebp
  36a5c1:	57                   	push   %edi
  36a5c2:	83 ec 54             	sub    $0x54,%esp
  36a5c5:	e8 b3 0c 00 00       	call   36b27d <get_kfree_page>
  36a5ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36a5cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a5d0:	8b 55 08             	mov    0x8(%ebp),%edx
  36a5d3:	89 10                	mov    %edx,(%eax)
  36a5d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a5d8:	8b 55 18             	mov    0x18(%ebp),%edx
  36a5db:	89 90 fc 00 00 00    	mov    %edx,0xfc(%eax)
  36a5e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a5e4:	c7 80 f4 00 00 00 14 	movl   $0x14,0xf4(%eax)
  36a5eb:	00 00 00 
  36a5ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a5f1:	c7 80 f8 00 00 00 14 	movl   $0x14,0xf8(%eax)
  36a5f8:	00 00 00 
  36a5fb:	0f 20 d8             	mov    %cr3,%eax
  36a5fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36a601:	8b 55 f0             	mov    -0x10(%ebp),%edx
  36a604:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a607:	89 90 04 01 00 00    	mov    %edx,0x104(%eax)
  36a60d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a610:	8d 90 bc 0f 00 00    	lea    0xfbc(%eax),%edx
  36a616:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a619:	89 90 00 01 00 00    	mov    %edx,0x100(%eax)
  36a61f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a622:	83 c0 14             	add    $0x14,%eax
  36a625:	83 ec 08             	sub    $0x8,%esp
  36a628:	ff 75 0c             	pushl  0xc(%ebp)
  36a62b:	50                   	push   %eax
  36a62c:	e8 37 f8 ff ff       	call   369e68 <strcpy>
  36a631:	83 c4 10             	add    $0x10,%esp
  36a634:	8d 55 ac             	lea    -0x54(%ebp),%edx
  36a637:	b8 00 00 00 00       	mov    $0x0,%eax
  36a63c:	b9 11 00 00 00       	mov    $0x11,%ecx
  36a641:	89 d7                	mov    %edx,%edi
  36a643:	f3 ab                	rep stos %eax,%es:(%edi)
  36a645:	8b 45 10             	mov    0x10(%ebp),%eax
  36a648:	89 45 ac             	mov    %eax,-0x54(%ebp)
  36a64b:	8b 45 10             	mov    0x10(%ebp),%eax
  36a64e:	89 45 b0             	mov    %eax,-0x50(%ebp)
  36a651:	8b 45 10             	mov    0x10(%ebp),%eax
  36a654:	89 45 b4             	mov    %eax,-0x4c(%ebp)
  36a657:	8b 45 10             	mov    0x10(%ebp),%eax
  36a65a:	89 45 b8             	mov    %eax,-0x48(%ebp)
  36a65d:	8b 45 1c             	mov    0x1c(%ebp),%eax
  36a660:	89 45 dc             	mov    %eax,-0x24(%ebp)
  36a663:	8b 45 14             	mov    0x14(%ebp),%eax
  36a666:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36a669:	c7 45 e4 00 02 00 00 	movl   $0x200,-0x1c(%ebp)
  36a670:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a673:	8b 80 00 01 00 00    	mov    0x100(%eax),%eax
  36a679:	83 ec 04             	sub    $0x4,%esp
  36a67c:	6a 44                	push   $0x44
  36a67e:	8d 55 ac             	lea    -0x54(%ebp),%edx
  36a681:	52                   	push   %edx
  36a682:	50                   	push   %eax
  36a683:	e8 fd f7 ff ff       	call   369e85 <memcpy>
  36a688:	83 c4 10             	add    $0x10,%esp
  36a68b:	8b 45 08             	mov    0x8(%ebp),%eax
  36a68e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  36a691:	89 14 85 00 3d 37 00 	mov    %edx,0x373d00(,%eax,4)
  36a698:	83 ec 0c             	sub    $0xc,%esp
  36a69b:	ff 75 f4             	pushl  -0xc(%ebp)
  36a69e:	e8 f8 fe ff ff       	call   36a59b <gam>
  36a6a3:	83 c4 10             	add    $0x10,%esp
  36a6a6:	83 ec 0c             	sub    $0xc,%esp
  36a6a9:	ff 75 f4             	pushl  -0xc(%ebp)
  36a6ac:	e8 b4 f8 ff ff       	call   369f65 <ready>
  36a6b1:	83 c4 10             	add    $0x10,%esp
  36a6b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a6b7:	8b 7d fc             	mov    -0x4(%ebp),%edi
  36a6ba:	c9                   	leave  
  36a6bb:	c3                   	ret    

0036a6bc <god_init>:
  36a6bc:	55                   	push   %ebp
  36a6bd:	89 e5                	mov    %esp,%ebp
  36a6bf:	83 ec 18             	sub    $0x18,%esp
  36a6c2:	c7 45 f0 38 00 00 00 	movl   $0x38,-0x10(%ebp)
  36a6c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36a6d0:	eb 26                	jmp    36a6f8 <god_init+0x3c>
  36a6d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a6d5:	c7 04 85 d8 37 37 00 	movl   $0x0,0x3737d8(,%eax,4)
  36a6dc:	00 00 00 00 
  36a6e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a6e3:	8b 14 85 d8 37 37 00 	mov    0x3737d8(,%eax,4),%edx
  36a6ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36a6ed:	89 14 85 cc 37 37 00 	mov    %edx,0x3737cc(,%eax,4)
  36a6f4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36a6f8:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  36a6fc:	7e d4                	jle    36a6d2 <god_init+0x16>
  36a6fe:	83 ec 08             	sub    $0x8,%esp
  36a701:	6a 00                	push   $0x0
  36a703:	6a 02                	push   $0x2
  36a705:	6a 08                	push   $0x8
  36a707:	6a 10                	push   $0x10
  36a709:	68 c5 e6 36 00       	push   $0x36e6c5
  36a70e:	6a 00                	push   $0x0
  36a710:	e8 a9 fe ff ff       	call   36a5be <make_task>
  36a715:	83 c4 20             	add    $0x20,%esp
  36a718:	a3 c4 37 37 00       	mov    %eax,0x3737c4
  36a71d:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a722:	8b 15 c4 37 37 00    	mov    0x3737c4,%edx
  36a728:	89 90 08 01 00 00    	mov    %edx,0x108(%eax)
  36a72e:	83 ec 08             	sub    $0x8,%esp
  36a731:	68 25 2b 36 00       	push   $0x362b25
  36a736:	6a 00                	push   $0x0
  36a738:	6a 08                	push   $0x8
  36a73a:	6a 10                	push   $0x10
  36a73c:	68 c9 e6 36 00       	push   $0x36e6c9
  36a741:	6a 03                	push   $0x3
  36a743:	e8 76 fe ff ff       	call   36a5be <make_task>
  36a748:	83 c4 20             	add    $0x20,%esp
  36a74b:	c7 05 e4 37 37 00 00 	movl   $0x20800,0x3737e4
  36a752:	08 02 00 
  36a755:	a1 e4 37 37 00       	mov    0x3737e4,%eax
  36a75a:	c7 40 08 10 00 00 00 	movl   $0x10,0x8(%eax)
  36a761:	a1 e4 37 37 00       	mov    0x3737e4,%eax
  36a766:	8b 15 c4 37 37 00    	mov    0x3737c4,%edx
  36a76c:	81 c2 00 10 00 00    	add    $0x1000,%edx
  36a772:	89 50 04             	mov    %edx,0x4(%eax)
  36a775:	a1 e4 37 37 00       	mov    0x3737e4,%eax
  36a77a:	c7 40 60 00 00 00 00 	movl   $0x0,0x60(%eax)
  36a781:	a1 e4 37 37 00       	mov    0x3737e4,%eax
  36a786:	c7 40 64 00 00 ff ff 	movl   $0xffff0000,0x64(%eax)
  36a78d:	a1 e4 37 37 00       	mov    0x3737e4,%eax
  36a792:	c7 40 24 00 02 00 00 	movl   $0x200,0x24(%eax)
  36a799:	0f 00 5d f0          	ltr    -0x10(%ebp)
  36a79d:	cd 81                	int    $0x81
  36a79f:	c9                   	leave  
  36a7a0:	c3                   	ret    

0036a7a1 <strlen>:
  36a7a1:	55                   	push   %ebp
  36a7a2:	89 e5                	mov    %esp,%ebp
  36a7a4:	57                   	push   %edi
  36a7a5:	8b 55 08             	mov    0x8(%ebp),%edx
  36a7a8:	b8 00 00 00 00       	mov    $0x0,%eax
  36a7ad:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  36a7b2:	89 d7                	mov    %edx,%edi
  36a7b4:	fc                   	cld    
  36a7b5:	f2 ae                	repnz scas %es:(%edi),%al
  36a7b7:	f7 d1                	not    %ecx
  36a7b9:	49                   	dec    %ecx
  36a7ba:	89 c8                	mov    %ecx,%eax
  36a7bc:	5f                   	pop    %edi
  36a7bd:	5d                   	pop    %ebp
  36a7be:	c3                   	ret    

0036a7bf <memcpy>:
  36a7bf:	55                   	push   %ebp
  36a7c0:	89 e5                	mov    %esp,%ebp
  36a7c2:	57                   	push   %edi
  36a7c3:	56                   	push   %esi
  36a7c4:	53                   	push   %ebx
  36a7c5:	8b 45 10             	mov    0x10(%ebp),%eax
  36a7c8:	8b 55 0c             	mov    0xc(%ebp),%edx
  36a7cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36a7ce:	89 c1                	mov    %eax,%ecx
  36a7d0:	89 d6                	mov    %edx,%esi
  36a7d2:	89 df                	mov    %ebx,%edi
  36a7d4:	fc                   	cld    
  36a7d5:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  36a7d7:	8b 45 08             	mov    0x8(%ebp),%eax
  36a7da:	5b                   	pop    %ebx
  36a7db:	5e                   	pop    %esi
  36a7dc:	5f                   	pop    %edi
  36a7dd:	5d                   	pop    %ebp
  36a7de:	c3                   	ret    

0036a7df <clear_methon>:
  36a7df:	55                   	push   %ebp
  36a7e0:	89 e5                	mov    %esp,%ebp
  36a7e2:	57                   	push   %edi
  36a7e3:	56                   	push   %esi
  36a7e4:	53                   	push   %ebx
  36a7e5:	83 ec 10             	sub    $0x10,%esp
  36a7e8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  36a7ef:	eb 25                	jmp    36a816 <clear_methon+0x37>
  36a7f1:	b8 03 00 00 00       	mov    $0x3,%eax
  36a7f6:	8b 5d f0             	mov    -0x10(%ebp),%ebx
  36a7f9:	b9 00 00 00 00       	mov    $0x0,%ecx
  36a7fe:	ba 00 00 00 00       	mov    $0x0,%edx
  36a803:	be 00 00 00 00       	mov    $0x0,%esi
  36a808:	bf 00 00 00 00       	mov    $0x0,%edi
  36a80d:	cd 80                	int    $0x80
  36a80f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36a812:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  36a816:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  36a81a:	7e d5                	jle    36a7f1 <clear_methon+0x12>
  36a81c:	83 c4 10             	add    $0x10,%esp
  36a81f:	5b                   	pop    %ebx
  36a820:	5e                   	pop    %esi
  36a821:	5f                   	pop    %edi
  36a822:	5d                   	pop    %ebp
  36a823:	c3                   	ret    

0036a824 <system_shell>:
  36a824:	55                   	push   %ebp
  36a825:	89 e5                	mov    %esp,%ebp
  36a827:	57                   	push   %edi
  36a828:	56                   	push   %esi
  36a829:	53                   	push   %ebx
  36a82a:	83 ec 1c             	sub    $0x1c,%esp
  36a82d:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a832:	83 c0 14             	add    $0x14,%eax
  36a835:	6a 06                	push   $0x6
  36a837:	68 cc e6 36 00       	push   $0x36e6cc
  36a83c:	50                   	push   %eax
  36a83d:	e8 7d ff ff ff       	call   36a7bf <memcpy>
  36a842:	83 c4 0c             	add    $0xc,%esp
  36a845:	e8 95 ff ff ff       	call   36a7df <clear_methon>
  36a84a:	b8 01 00 00 00       	mov    $0x1,%eax
  36a84f:	bb 04 00 00 00       	mov    $0x4,%ebx
  36a854:	b9 01 00 00 00       	mov    $0x1,%ecx
  36a859:	ba 01 00 00 00       	mov    $0x1,%edx
  36a85e:	be 00 00 00 00       	mov    $0x0,%esi
  36a863:	bf 00 00 00 00       	mov    $0x0,%edi
  36a868:	cd 80                	int    $0x80
  36a86a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36a86d:	c7 45 e0 d2 e6 36 00 	movl   $0x36e6d2,-0x20(%ebp)
  36a874:	83 ec 04             	sub    $0x4,%esp
  36a877:	8d 45 e0             	lea    -0x20(%ebp),%eax
  36a87a:	50                   	push   %eax
  36a87b:	6a 01                	push   $0x1
  36a87d:	68 d7 e6 36 00       	push   $0x36e6d7
  36a882:	e8 e1 11 00 00       	call   36ba68 <exec>
  36a887:	83 c4 10             	add    $0x10,%esp
  36a88a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36a88d:	5b                   	pop    %ebx
  36a88e:	5e                   	pop    %esi
  36a88f:	5f                   	pop    %edi
  36a890:	5d                   	pop    %ebp
  36a891:	c3                   	ret    

0036a892 <system_dup2>:
  36a892:	55                   	push   %ebp
  36a893:	89 e5                	mov    %esp,%ebp
  36a895:	57                   	push   %edi
  36a896:	56                   	push   %esi
  36a897:	53                   	push   %ebx
  36a898:	83 ec 10             	sub    $0x10,%esp
  36a89b:	8b 45 08             	mov    0x8(%ebp),%eax
  36a89e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36a8a1:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
  36a8a5:	7f 18                	jg     36a8bf <system_dup2+0x2d>
  36a8a7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  36a8ab:	78 12                	js     36a8bf <system_dup2+0x2d>
  36a8ad:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36a8b2:	8b 55 08             	mov    0x8(%ebp),%edx
  36a8b5:	83 c2 0c             	add    $0xc,%edx
  36a8b8:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
  36a8bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36a8bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36a8c2:	8b 04 85 00 3d 37 00 	mov    0x373d00(,%eax,4),%eax
  36a8c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36a8cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36a8cf:	8b 40 44             	mov    0x44(%eax),%eax
  36a8d2:	83 f8 02             	cmp    $0x2,%eax
  36a8d5:	77 31                	ja     36a908 <system_dup2+0x76>
  36a8d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36a8da:	8b 55 0c             	mov    0xc(%ebp),%edx
  36a8dd:	8d 4a 0c             	lea    0xc(%edx),%ecx
  36a8e0:	8b 55 10             	mov    0x10(%ebp),%edx
  36a8e3:	89 54 88 04          	mov    %edx,0x4(%eax,%ecx,4)
  36a8e7:	b8 02 00 00 00       	mov    $0x2,%eax
  36a8ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36a8ef:	b9 00 00 00 00       	mov    $0x0,%ecx
  36a8f4:	ba 00 00 00 00       	mov    $0x0,%edx
  36a8f9:	be 00 00 00 00       	mov    $0x0,%esi
  36a8fe:	bf 00 00 00 00       	mov    $0x0,%edi
  36a903:	cd 80                	int    $0x80
  36a905:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36a908:	b8 02 00 00 00       	mov    $0x2,%eax
  36a90d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36a910:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  36a915:	ba da ff ff ff       	mov    $0xffffffda,%edx
  36a91a:	be 00 00 00 00       	mov    $0x0,%esi
  36a91f:	bf 00 00 00 00       	mov    $0x0,%edi
  36a924:	cd 80                	int    $0x80
  36a926:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36a929:	83 c4 10             	add    $0x10,%esp
  36a92c:	5b                   	pop    %ebx
  36a92d:	5e                   	pop    %esi
  36a92e:	5f                   	pop    %edi
  36a92f:	5d                   	pop    %ebp
  36a930:	c3                   	ret    

0036a931 <system_pri>:
  36a931:	55                   	push   %ebp
  36a932:	89 e5                	mov    %esp,%ebp
  36a934:	57                   	push   %edi
  36a935:	56                   	push   %esi
  36a936:	53                   	push   %ebx
  36a937:	83 ec 10             	sub    $0x10,%esp
  36a93a:	8b 45 08             	mov    0x8(%ebp),%eax
  36a93d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36a940:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36a943:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36a946:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36a949:	8b 55 0c             	mov    0xc(%ebp),%edx
  36a94c:	89 90 fc 00 00 00    	mov    %edx,0xfc(%eax)
  36a952:	b8 02 00 00 00       	mov    $0x2,%eax
  36a957:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36a95a:	b9 00 00 00 00       	mov    $0x0,%ecx
  36a95f:	ba 00 00 00 00       	mov    $0x0,%edx
  36a964:	be 00 00 00 00       	mov    $0x0,%esi
  36a969:	bf 00 00 00 00       	mov    $0x0,%edi
  36a96e:	cd 80                	int    $0x80
  36a970:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36a973:	83 c4 10             	add    $0x10,%esp
  36a976:	5b                   	pop    %ebx
  36a977:	5e                   	pop    %esi
  36a978:	5f                   	pop    %edi
  36a979:	5d                   	pop    %ebp
  36a97a:	c3                   	ret    

0036a97b <system_private>:
  36a97b:	55                   	push   %ebp
  36a97c:	89 e5                	mov    %esp,%ebp
  36a97e:	57                   	push   %edi
  36a97f:	56                   	push   %esi
  36a980:	53                   	push   %ebx
  36a981:	83 ec 1c             	sub    $0x1c,%esp
  36a984:	83 ec 0c             	sub    $0xc,%esp
  36a987:	ff 75 08             	pushl  0x8(%ebp)
  36a98a:	e8 32 0d 00 00       	call   36b6c1 <objectById>
  36a98f:	83 c4 10             	add    $0x10,%esp
  36a992:	8b 88 f0 00 00 00    	mov    0xf0(%eax),%ecx
  36a998:	b8 02 00 00 00       	mov    $0x2,%eax
  36a99d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36a9a0:	ba 00 00 00 00       	mov    $0x0,%edx
  36a9a5:	be 00 00 00 00       	mov    $0x0,%esi
  36a9aa:	bf 00 00 00 00       	mov    $0x0,%edi
  36a9af:	cd 80                	int    $0x80
  36a9b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36a9b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36a9b7:	5b                   	pop    %ebx
  36a9b8:	5e                   	pop    %esi
  36a9b9:	5f                   	pop    %edi
  36a9ba:	5d                   	pop    %ebp
  36a9bb:	c3                   	ret    

0036a9bc <system_regirq>:
  36a9bc:	55                   	push   %ebp
  36a9bd:	89 e5                	mov    %esp,%ebp
  36a9bf:	57                   	push   %edi
  36a9c0:	56                   	push   %esi
  36a9c1:	53                   	push   %ebx
  36a9c2:	83 ec 1c             	sub    $0x1c,%esp
  36a9c5:	83 ec 08             	sub    $0x8,%esp
  36a9c8:	ff 75 0c             	pushl  0xc(%ebp)
  36a9cb:	ff 75 08             	pushl  0x8(%ebp)
  36a9ce:	e8 e5 ed ff ff       	call   3697b8 <put_irq_handler>
  36a9d3:	83 c4 10             	add    $0x10,%esp
  36a9d6:	89 c1                	mov    %eax,%ecx
  36a9d8:	b8 02 00 00 00       	mov    $0x2,%eax
  36a9dd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36a9e0:	ba 00 00 00 00       	mov    $0x0,%edx
  36a9e5:	be 00 00 00 00       	mov    $0x0,%esi
  36a9ea:	bf 00 00 00 00       	mov    $0x0,%edi
  36a9ef:	cd 80                	int    $0x80
  36a9f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36a9f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36a9f7:	5b                   	pop    %ebx
  36a9f8:	5e                   	pop    %esi
  36a9f9:	5f                   	pop    %edi
  36a9fa:	5d                   	pop    %ebp
  36a9fb:	c3                   	ret    

0036a9fc <system_irq>:
  36a9fc:	55                   	push   %ebp
  36a9fd:	89 e5                	mov    %esp,%ebp
  36a9ff:	83 ec 08             	sub    $0x8,%esp
  36aa02:	83 ec 04             	sub    $0x4,%esp
  36aa05:	ff 75 0c             	pushl  0xc(%ebp)
  36aa08:	68 e1 e6 36 00       	push   $0x36e6e1
  36aa0d:	68 e8 e6 36 00       	push   $0x36e6e8
  36aa12:	e8 71 e6 ff ff       	call   369088 <printk>
  36aa17:	83 c4 10             	add    $0x10,%esp
  36aa1a:	c9                   	leave  
  36aa1b:	c3                   	ret    

0036aa1c <system_init>:
  36aa1c:	55                   	push   %ebp
  36aa1d:	89 e5                	mov    %esp,%ebp
  36aa1f:	57                   	push   %edi
  36aa20:	56                   	push   %esi
  36aa21:	53                   	push   %ebx
  36aa22:	83 ec 20             	sub    $0x20,%esp
  36aa25:	b8 03 00 00 00       	mov    $0x3,%eax
  36aa2a:	bb 11 00 00 00       	mov    $0x11,%ebx
  36aa2f:	b9 92 a8 36 00       	mov    $0x36a892,%ecx
  36aa34:	ba 00 00 00 00       	mov    $0x0,%edx
  36aa39:	be 00 00 00 00       	mov    $0x0,%esi
  36aa3e:	bf 00 00 00 00       	mov    $0x0,%edi
  36aa43:	cd 80                	int    $0x80
  36aa45:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36aa48:	b8 03 00 00 00       	mov    $0x3,%eax
  36aa4d:	bb 12 00 00 00       	mov    $0x12,%ebx
  36aa52:	b9 7b a9 36 00       	mov    $0x36a97b,%ecx
  36aa57:	ba 00 00 00 00       	mov    $0x0,%edx
  36aa5c:	be 00 00 00 00       	mov    $0x0,%esi
  36aa61:	bf 00 00 00 00       	mov    $0x0,%edi
  36aa66:	cd 80                	int    $0x80
  36aa68:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36aa6b:	b8 03 00 00 00       	mov    $0x3,%eax
  36aa70:	bb 13 00 00 00       	mov    $0x13,%ebx
  36aa75:	b9 bc a9 36 00       	mov    $0x36a9bc,%ecx
  36aa7a:	ba 00 00 00 00       	mov    $0x0,%edx
  36aa7f:	be 00 00 00 00       	mov    $0x0,%esi
  36aa84:	bf 00 00 00 00       	mov    $0x0,%edi
  36aa89:	cd 80                	int    $0x80
  36aa8b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36aa8e:	b8 03 00 00 00       	mov    $0x3,%eax
  36aa93:	bb 0a 00 00 00       	mov    $0xa,%ebx
  36aa98:	b9 fc a9 36 00       	mov    $0x36a9fc,%ecx
  36aa9d:	ba 00 00 00 00       	mov    $0x0,%edx
  36aaa2:	be 00 00 00 00       	mov    $0x0,%esi
  36aaa7:	bf 00 00 00 00       	mov    $0x0,%edi
  36aaac:	cd 80                	int    $0x80
  36aaae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36aab1:	b8 03 00 00 00       	mov    $0x3,%eax
  36aab6:	bb 01 00 00 00       	mov    $0x1,%ebx
  36aabb:	b9 31 a9 36 00       	mov    $0x36a931,%ecx
  36aac0:	ba 00 00 00 00       	mov    $0x0,%edx
  36aac5:	be 00 00 00 00       	mov    $0x0,%esi
  36aaca:	bf 00 00 00 00       	mov    $0x0,%edi
  36aacf:	cd 80                	int    $0x80
  36aad1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36aad4:	83 c4 20             	add    $0x20,%esp
  36aad7:	5b                   	pop    %ebx
  36aad8:	5e                   	pop    %esi
  36aad9:	5f                   	pop    %edi
  36aada:	5d                   	pop    %ebp
  36aadb:	c3                   	ret    

0036aadc <builtin_task>:
  36aadc:	55                   	push   %ebp
  36aadd:	89 e5                	mov    %esp,%ebp
  36aadf:	83 ec 38             	sub    $0x38,%esp
  36aae2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36aae9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  36aaf0:	c7 45 d0 04 e7 36 00 	movl   $0x36e704,-0x30(%ebp)
  36aaf7:	c7 45 d4 80 47 36 00 	movl   $0x364780,-0x2c(%ebp)
  36aafe:	c7 45 d8 0b e7 36 00 	movl   $0x36e70b,-0x28(%ebp)
  36ab05:	c7 45 dc 9f b1 36 00 	movl   $0x36b19f,-0x24(%ebp)
  36ab0c:	c7 45 e0 11 e7 36 00 	movl   $0x36e711,-0x20(%ebp)
  36ab13:	c7 45 e4 44 36 36 00 	movl   $0x363644,-0x1c(%ebp)
  36ab1a:	c7 45 e8 1a e7 36 00 	movl   $0x36e71a,-0x18(%ebp)
  36ab21:	c7 45 ec e7 54 36 00 	movl   $0x3654e7,-0x14(%ebp)
  36ab28:	e8 5a 11 00 00       	call   36bc87 <fork>
  36ab2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36ab30:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  36ab34:	75 44                	jne    36ab7a <builtin_task+0x9e>
  36ab36:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36ab39:	8b 44 c5 d0          	mov    -0x30(%ebp,%eax,8),%eax
  36ab3d:	83 ec 0c             	sub    $0xc,%esp
  36ab40:	50                   	push   %eax
  36ab41:	e8 5b fc ff ff       	call   36a7a1 <strlen>
  36ab46:	83 c4 10             	add    $0x10,%esp
  36ab49:	8d 48 01             	lea    0x1(%eax),%ecx
  36ab4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36ab4f:	8b 44 c5 d0          	mov    -0x30(%ebp,%eax,8),%eax
  36ab53:	8b 15 c4 37 37 00    	mov    0x3737c4,%edx
  36ab59:	83 c2 14             	add    $0x14,%edx
  36ab5c:	83 ec 04             	sub    $0x4,%esp
  36ab5f:	51                   	push   %ecx
  36ab60:	50                   	push   %eax
  36ab61:	52                   	push   %edx
  36ab62:	e8 58 fc ff ff       	call   36a7bf <memcpy>
  36ab67:	83 c4 10             	add    $0x10,%esp
  36ab6a:	e8 70 fc ff ff       	call   36a7df <clear_methon>
  36ab6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36ab72:	8b 44 c5 d4          	mov    -0x2c(%ebp,%eax,8),%eax
  36ab76:	ff d0                	call   *%eax
  36ab78:	eb 2c                	jmp    36aba6 <builtin_task+0xca>
  36ab7a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  36ab7e:	7e 0c                	jle    36ab8c <builtin_task+0xb0>
  36ab80:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36ab84:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
  36ab88:	77 1c                	ja     36aba6 <builtin_task+0xca>
  36ab8a:	eb 9c                	jmp    36ab28 <builtin_task+0x4c>
  36ab8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36ab8f:	8b 44 c5 d0          	mov    -0x30(%ebp,%eax,8),%eax
  36ab93:	83 ec 08             	sub    $0x8,%esp
  36ab96:	50                   	push   %eax
  36ab97:	68 21 e7 36 00       	push   $0x36e721
  36ab9c:	e8 e7 e4 ff ff       	call   369088 <printk>
  36aba1:	83 c4 10             	add    $0x10,%esp
  36aba4:	eb 82                	jmp    36ab28 <builtin_task+0x4c>
  36aba6:	e8 79 fc ff ff       	call   36a824 <system_shell>
  36abab:	c9                   	leave  
  36abac:	c3                   	ret    

0036abad <system_main>:
  36abad:	55                   	push   %ebp
  36abae:	89 e5                	mov    %esp,%ebp
  36abb0:	57                   	push   %edi
  36abb1:	56                   	push   %esi
  36abb2:	53                   	push   %ebx
  36abb3:	83 ec 1c             	sub    $0x1c,%esp
  36abb6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  36abbd:	e8 c5 10 00 00       	call   36bc87 <fork>
  36abc2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36abc5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  36abc9:	7e 2a                	jle    36abf5 <system_main+0x48>
  36abcb:	e8 4c fe ff ff       	call   36aa1c <system_init>
  36abd0:	b8 00 00 00 00       	mov    $0x0,%eax
  36abd5:	bb 00 00 00 00       	mov    $0x0,%ebx
  36abda:	b9 00 00 00 00       	mov    $0x0,%ecx
  36abdf:	ba 00 00 00 00       	mov    $0x0,%edx
  36abe4:	be 00 00 00 00       	mov    $0x0,%esi
  36abe9:	bf 00 00 00 00       	mov    $0x0,%edi
  36abee:	cd 80                	int    $0x80
  36abf0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36abf3:	eb 26                	jmp    36ac1b <system_main+0x6e>
  36abf5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  36abf9:	75 20                	jne    36ac1b <system_main+0x6e>
  36abfb:	a1 c4 37 37 00       	mov    0x3737c4,%eax
  36ac00:	83 c0 14             	add    $0x14,%eax
  36ac03:	83 ec 04             	sub    $0x4,%esp
  36ac06:	6a 08                	push   $0x8
  36ac08:	68 39 e7 36 00       	push   $0x36e739
  36ac0d:	50                   	push   %eax
  36ac0e:	e8 ac fb ff ff       	call   36a7bf <memcpy>
  36ac13:	83 c4 10             	add    $0x10,%esp
  36ac16:	e8 c1 fe ff ff       	call   36aadc <builtin_task>
  36ac1b:	b8 00 00 00 00       	mov    $0x0,%eax
  36ac20:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36ac23:	5b                   	pop    %ebx
  36ac24:	5e                   	pop    %esi
  36ac25:	5f                   	pop    %edi
  36ac26:	5d                   	pop    %ebp
  36ac27:	c3                   	ret    

0036ac28 <memcpy>:
  36ac28:	55                   	push   %ebp
  36ac29:	89 e5                	mov    %esp,%ebp
  36ac2b:	57                   	push   %edi
  36ac2c:	56                   	push   %esi
  36ac2d:	53                   	push   %ebx
  36ac2e:	8b 45 10             	mov    0x10(%ebp),%eax
  36ac31:	8b 55 0c             	mov    0xc(%ebp),%edx
  36ac34:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36ac37:	89 c1                	mov    %eax,%ecx
  36ac39:	89 d6                	mov    %edx,%esi
  36ac3b:	89 df                	mov    %ebx,%edi
  36ac3d:	fc                   	cld    
  36ac3e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  36ac40:	8b 45 08             	mov    0x8(%ebp),%eax
  36ac43:	5b                   	pop    %ebx
  36ac44:	5e                   	pop    %esi
  36ac45:	5f                   	pop    %edi
  36ac46:	5d                   	pop    %ebp
  36ac47:	c3                   	ret    

0036ac48 <buffer_init>:
  36ac48:	55                   	push   %ebp
  36ac49:	89 e5                	mov    %esp,%ebp
  36ac4b:	83 ec 10             	sub    $0x10,%esp
  36ac4e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  36ac55:	c7 45 f8 00 50 02 00 	movl   $0x25000,-0x8(%ebp)
  36ac5c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  36ac63:	eb 23                	jmp    36ac88 <buffer_init+0x40>
  36ac65:	8b 45 fc             	mov    -0x4(%ebp),%eax
  36ac68:	c1 e0 0c             	shl    $0xc,%eax
  36ac6b:	89 c2                	mov    %eax,%edx
  36ac6d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36ac70:	01 d0                	add    %edx,%eax
  36ac72:	8b 55 fc             	mov    -0x4(%ebp),%edx
  36ac75:	83 c2 01             	add    $0x1,%edx
  36ac78:	89 d1                	mov    %edx,%ecx
  36ac7a:	c1 e1 0c             	shl    $0xc,%ecx
  36ac7d:	8b 55 f8             	mov    -0x8(%ebp),%edx
  36ac80:	01 ca                	add    %ecx,%edx
  36ac82:	89 10                	mov    %edx,(%eax)
  36ac84:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  36ac88:	83 7d fc 79          	cmpl   $0x79,-0x4(%ebp)
  36ac8c:	7e d7                	jle    36ac65 <buffer_init+0x1d>
  36ac8e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  36ac91:	c1 e0 0c             	shl    $0xc,%eax
  36ac94:	89 c2                	mov    %eax,%edx
  36ac96:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36ac99:	01 d0                	add    %edx,%eax
  36ac9b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  36aca1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36aca4:	a3 f8 37 37 00       	mov    %eax,0x3737f8
  36aca9:	c9                   	leave  
  36acaa:	c3                   	ret    

0036acab <get_buffer>:
  36acab:	55                   	push   %ebp
  36acac:	89 e5                	mov    %esp,%ebp
  36acae:	83 ec 10             	sub    $0x10,%esp
  36acb1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  36acb8:	a1 f8 37 37 00       	mov    0x3737f8,%eax
  36acbd:	85 c0                	test   %eax,%eax
  36acbf:	74 14                	je     36acd5 <get_buffer+0x2a>
  36acc1:	a1 f8 37 37 00       	mov    0x3737f8,%eax
  36acc6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  36acc9:	a1 f8 37 37 00       	mov    0x3737f8,%eax
  36acce:	8b 00                	mov    (%eax),%eax
  36acd0:	a3 f8 37 37 00       	mov    %eax,0x3737f8
  36acd5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  36acd8:	c9                   	leave  
  36acd9:	c3                   	ret    

0036acda <free_buffer>:
  36acda:	55                   	push   %ebp
  36acdb:	89 e5                	mov    %esp,%ebp
  36acdd:	83 ec 08             	sub    $0x8,%esp
  36ace0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  36ace4:	75 10                	jne    36acf6 <free_buffer+0x1c>
  36ace6:	83 ec 0c             	sub    $0xc,%esp
  36ace9:	68 41 e7 36 00       	push   $0x36e741
  36acee:	e8 79 e3 ff ff       	call   36906c <panic>
  36acf3:	83 c4 10             	add    $0x10,%esp
  36acf6:	8b 45 08             	mov    0x8(%ebp),%eax
  36acf9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  36acfe:	89 45 08             	mov    %eax,0x8(%ebp)
  36ad01:	8b 15 f8 37 37 00    	mov    0x3737f8,%edx
  36ad07:	8b 45 08             	mov    0x8(%ebp),%eax
  36ad0a:	89 10                	mov    %edx,(%eax)
  36ad0c:	8b 45 08             	mov    0x8(%ebp),%eax
  36ad0f:	a3 f8 37 37 00       	mov    %eax,0x3737f8
  36ad14:	c9                   	leave  
  36ad15:	c3                   	ret    

0036ad16 <dobuffer>:
  36ad16:	55                   	push   %ebp
  36ad17:	89 e5                	mov    %esp,%ebp
  36ad19:	83 ec 18             	sub    $0x18,%esp
  36ad1c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36ad23:	81 65 10 ff 0f 00 00 	andl   $0xfff,0x10(%ebp)
  36ad2a:	83 7d 08 06          	cmpl   $0x6,0x8(%ebp)
  36ad2e:	75 2e                	jne    36ad5e <dobuffer+0x48>
  36ad30:	e8 76 ff ff ff       	call   36acab <get_buffer>
  36ad35:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36ad38:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36ad3c:	74 34                	je     36ad72 <dobuffer+0x5c>
  36ad3e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  36ad42:	74 2e                	je     36ad72 <dobuffer+0x5c>
  36ad44:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  36ad48:	74 28                	je     36ad72 <dobuffer+0x5c>
  36ad4a:	8b 45 10             	mov    0x10(%ebp),%eax
  36ad4d:	50                   	push   %eax
  36ad4e:	ff 75 0c             	pushl  0xc(%ebp)
  36ad51:	ff 75 f4             	pushl  -0xc(%ebp)
  36ad54:	e8 cf fe ff ff       	call   36ac28 <memcpy>
  36ad59:	83 c4 0c             	add    $0xc,%esp
  36ad5c:	eb 14                	jmp    36ad72 <dobuffer+0x5c>
  36ad5e:	83 7d 08 05          	cmpl   $0x5,0x8(%ebp)
  36ad62:	75 0e                	jne    36ad72 <dobuffer+0x5c>
  36ad64:	83 ec 0c             	sub    $0xc,%esp
  36ad67:	ff 75 0c             	pushl  0xc(%ebp)
  36ad6a:	e8 6b ff ff ff       	call   36acda <free_buffer>
  36ad6f:	83 c4 10             	add    $0x10,%esp
  36ad72:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36ad75:	c9                   	leave  
  36ad76:	c3                   	ret    

0036ad77 <outb>:
  36ad77:	55                   	push   %ebp
  36ad78:	89 e5                	mov    %esp,%ebp
  36ad7a:	83 ec 08             	sub    $0x8,%esp
  36ad7d:	8b 55 08             	mov    0x8(%ebp),%edx
  36ad80:	8b 45 0c             	mov    0xc(%ebp),%eax
  36ad83:	88 55 fc             	mov    %dl,-0x4(%ebp)
  36ad86:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  36ad8a:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  36ad8e:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  36ad92:	ee                   	out    %al,(%dx)
  36ad93:	c9                   	leave  
  36ad94:	c3                   	ret    

0036ad95 <inb>:
  36ad95:	55                   	push   %ebp
  36ad96:	89 e5                	mov    %esp,%ebp
  36ad98:	83 ec 14             	sub    $0x14,%esp
  36ad9b:	8b 45 08             	mov    0x8(%ebp),%eax
  36ad9e:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  36ada2:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  36ada6:	89 c2                	mov    %eax,%edx
  36ada8:	ec                   	in     (%dx),%al
  36ada9:	88 45 ff             	mov    %al,-0x1(%ebp)
  36adac:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  36adb0:	c9                   	leave  
  36adb1:	c3                   	ret    

0036adb2 <io_delay>:
  36adb2:	55                   	push   %ebp
  36adb3:	89 e5                	mov    %esp,%ebp
  36adb5:	83 ec 10             	sub    $0x10,%esp
  36adb8:	66 c7 45 fe 80 00    	movw   $0x80,-0x2(%ebp)
  36adbe:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  36adc2:	89 c2                	mov    %eax,%edx
  36adc4:	ee                   	out    %al,(%dx)
  36adc5:	c9                   	leave  
  36adc6:	c3                   	ret    

0036adc7 <outb_p>:
  36adc7:	55                   	push   %ebp
  36adc8:	89 e5                	mov    %esp,%ebp
  36adca:	83 ec 08             	sub    $0x8,%esp
  36adcd:	8b 55 08             	mov    0x8(%ebp),%edx
  36add0:	8b 45 0c             	mov    0xc(%ebp),%eax
  36add3:	88 55 fc             	mov    %dl,-0x4(%ebp)
  36add6:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  36adda:	0f b7 55 f8          	movzwl -0x8(%ebp),%edx
  36adde:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  36ade2:	52                   	push   %edx
  36ade3:	50                   	push   %eax
  36ade4:	e8 8e ff ff ff       	call   36ad77 <outb>
  36ade9:	83 c4 08             	add    $0x8,%esp
  36adec:	e8 c1 ff ff ff       	call   36adb2 <io_delay>
  36adf1:	c9                   	leave  
  36adf2:	c3                   	ret    

0036adf3 <inb_p>:
  36adf3:	55                   	push   %ebp
  36adf4:	89 e5                	mov    %esp,%ebp
  36adf6:	83 ec 14             	sub    $0x14,%esp
  36adf9:	8b 45 08             	mov    0x8(%ebp),%eax
  36adfc:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
  36ae00:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  36ae04:	50                   	push   %eax
  36ae05:	e8 8b ff ff ff       	call   36ad95 <inb>
  36ae0a:	83 c4 04             	add    $0x4,%esp
  36ae0d:	88 45 ff             	mov    %al,-0x1(%ebp)
  36ae10:	e8 9d ff ff ff       	call   36adb2 <io_delay>
  36ae15:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  36ae19:	c9                   	leave  
  36ae1a:	c3                   	ret    

0036ae1b <mktime>:
  36ae1b:	55                   	push   %ebp
  36ae1c:	89 e5                	mov    %esp,%ebp
  36ae1e:	83 ec 10             	sub    $0x10,%esp
  36ae21:	8b 45 08             	mov    0x8(%ebp),%eax
  36ae24:	8b 40 14             	mov    0x14(%eax),%eax
  36ae27:	69 d0 80 33 e1 01    	imul   $0x1e13380,%eax,%edx
  36ae2d:	8b 45 08             	mov    0x8(%ebp),%eax
  36ae30:	8b 40 14             	mov    0x14(%eax),%eax
  36ae33:	83 c0 03             	add    $0x3,%eax
  36ae36:	69 c0 80 51 01 00    	imul   $0x15180,%eax,%eax
  36ae3c:	8d 48 03             	lea    0x3(%eax),%ecx
  36ae3f:	85 c0                	test   %eax,%eax
  36ae41:	0f 48 c1             	cmovs  %ecx,%eax
  36ae44:	c1 f8 02             	sar    $0x2,%eax
  36ae47:	01 d0                	add    %edx,%eax
  36ae49:	89 45 fc             	mov    %eax,-0x4(%ebp)
  36ae4c:	8b 45 08             	mov    0x8(%ebp),%eax
  36ae4f:	8b 40 10             	mov    0x10(%eax),%eax
  36ae52:	8b 04 85 60 e7 36 00 	mov    0x36e760(,%eax,4),%eax
  36ae59:	69 c0 80 51 01 00    	imul   $0x15180,%eax,%eax
  36ae5f:	01 45 fc             	add    %eax,-0x4(%ebp)
  36ae62:	8b 45 08             	mov    0x8(%ebp),%eax
  36ae65:	8b 40 10             	mov    0x10(%eax),%eax
  36ae68:	83 f8 01             	cmp    $0x1,%eax
  36ae6b:	7e 14                	jle    36ae81 <mktime+0x66>
  36ae6d:	8b 45 08             	mov    0x8(%ebp),%eax
  36ae70:	8b 40 14             	mov    0x14(%eax),%eax
  36ae73:	83 e0 03             	and    $0x3,%eax
  36ae76:	85 c0                	test   %eax,%eax
  36ae78:	75 07                	jne    36ae81 <mktime+0x66>
  36ae7a:	81 45 fc 80 51 01 00 	addl   $0x15180,-0x4(%ebp)
  36ae81:	8b 45 08             	mov    0x8(%ebp),%eax
  36ae84:	8b 40 0c             	mov    0xc(%eax),%eax
  36ae87:	83 e8 01             	sub    $0x1,%eax
  36ae8a:	69 c0 80 51 01 00    	imul   $0x15180,%eax,%eax
  36ae90:	01 45 fc             	add    %eax,-0x4(%ebp)
  36ae93:	8b 45 08             	mov    0x8(%ebp),%eax
  36ae96:	8b 40 08             	mov    0x8(%eax),%eax
  36ae99:	69 c0 10 0e 00 00    	imul   $0xe10,%eax,%eax
  36ae9f:	01 45 fc             	add    %eax,-0x4(%ebp)
  36aea2:	8b 45 08             	mov    0x8(%ebp),%eax
  36aea5:	8b 40 04             	mov    0x4(%eax),%eax
  36aea8:	c1 e0 02             	shl    $0x2,%eax
  36aeab:	89 c2                	mov    %eax,%edx
  36aead:	c1 e2 04             	shl    $0x4,%edx
  36aeb0:	29 c2                	sub    %eax,%edx
  36aeb2:	89 d0                	mov    %edx,%eax
  36aeb4:	01 45 fc             	add    %eax,-0x4(%ebp)
  36aeb7:	8b 45 08             	mov    0x8(%ebp),%eax
  36aeba:	8b 00                	mov    (%eax),%eax
  36aebc:	01 45 fc             	add    %eax,-0x4(%ebp)
  36aebf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  36aec2:	c9                   	leave  
  36aec3:	c3                   	ret    

0036aec4 <cmos_time>:
  36aec4:	55                   	push   %ebp
  36aec5:	89 e5                	mov    %esp,%ebp
  36aec7:	53                   	push   %ebx
  36aec8:	6a 70                	push   $0x70
  36aeca:	68 80 00 00 00       	push   $0x80
  36aecf:	e8 f3 fe ff ff       	call   36adc7 <outb_p>
  36aed4:	83 c4 08             	add    $0x8,%esp
  36aed7:	6a 71                	push   $0x71
  36aed9:	e8 15 ff ff ff       	call   36adf3 <inb_p>
  36aede:	83 c4 04             	add    $0x4,%esp
  36aee1:	0f b6 c0             	movzbl %al,%eax
  36aee4:	a3 20 38 37 00       	mov    %eax,0x373820
  36aee9:	6a 70                	push   $0x70
  36aeeb:	68 82 00 00 00       	push   $0x82
  36aef0:	e8 d2 fe ff ff       	call   36adc7 <outb_p>
  36aef5:	83 c4 08             	add    $0x8,%esp
  36aef8:	6a 71                	push   $0x71
  36aefa:	e8 f4 fe ff ff       	call   36adf3 <inb_p>
  36aeff:	83 c4 04             	add    $0x4,%esp
  36af02:	0f b6 c0             	movzbl %al,%eax
  36af05:	a3 24 38 37 00       	mov    %eax,0x373824
  36af0a:	6a 70                	push   $0x70
  36af0c:	68 84 00 00 00       	push   $0x84
  36af11:	e8 b1 fe ff ff       	call   36adc7 <outb_p>
  36af16:	83 c4 08             	add    $0x8,%esp
  36af19:	6a 71                	push   $0x71
  36af1b:	e8 d3 fe ff ff       	call   36adf3 <inb_p>
  36af20:	83 c4 04             	add    $0x4,%esp
  36af23:	0f b6 c0             	movzbl %al,%eax
  36af26:	a3 28 38 37 00       	mov    %eax,0x373828
  36af2b:	6a 70                	push   $0x70
  36af2d:	68 87 00 00 00       	push   $0x87
  36af32:	e8 90 fe ff ff       	call   36adc7 <outb_p>
  36af37:	83 c4 08             	add    $0x8,%esp
  36af3a:	6a 71                	push   $0x71
  36af3c:	e8 b2 fe ff ff       	call   36adf3 <inb_p>
  36af41:	83 c4 04             	add    $0x4,%esp
  36af44:	0f b6 c0             	movzbl %al,%eax
  36af47:	a3 2c 38 37 00       	mov    %eax,0x37382c
  36af4c:	6a 70                	push   $0x70
  36af4e:	68 88 00 00 00       	push   $0x88
  36af53:	e8 6f fe ff ff       	call   36adc7 <outb_p>
  36af58:	83 c4 08             	add    $0x8,%esp
  36af5b:	6a 71                	push   $0x71
  36af5d:	e8 91 fe ff ff       	call   36adf3 <inb_p>
  36af62:	83 c4 04             	add    $0x4,%esp
  36af65:	0f b6 c0             	movzbl %al,%eax
  36af68:	a3 30 38 37 00       	mov    %eax,0x373830
  36af6d:	6a 70                	push   $0x70
  36af6f:	68 89 00 00 00       	push   $0x89
  36af74:	e8 4e fe ff ff       	call   36adc7 <outb_p>
  36af79:	83 c4 08             	add    $0x8,%esp
  36af7c:	6a 71                	push   $0x71
  36af7e:	e8 70 fe ff ff       	call   36adf3 <inb_p>
  36af83:	83 c4 04             	add    $0x4,%esp
  36af86:	0f b6 c0             	movzbl %al,%eax
  36af89:	a3 34 38 37 00       	mov    %eax,0x373834
  36af8e:	8b 1d 20 38 37 00    	mov    0x373820,%ebx
  36af94:	6a 70                	push   $0x70
  36af96:	68 80 00 00 00       	push   $0x80
  36af9b:	e8 27 fe ff ff       	call   36adc7 <outb_p>
  36afa0:	83 c4 08             	add    $0x8,%esp
  36afa3:	6a 71                	push   $0x71
  36afa5:	e8 49 fe ff ff       	call   36adf3 <inb_p>
  36afaa:	83 c4 04             	add    $0x4,%esp
  36afad:	0f b6 c0             	movzbl %al,%eax
  36afb0:	39 c3                	cmp    %eax,%ebx
  36afb2:	0f 85 10 ff ff ff    	jne    36aec8 <cmos_time+0x4>
  36afb8:	a1 20 38 37 00       	mov    0x373820,%eax
  36afbd:	83 e0 0f             	and    $0xf,%eax
  36afc0:	89 c1                	mov    %eax,%ecx
  36afc2:	a1 20 38 37 00       	mov    0x373820,%eax
  36afc7:	c1 f8 04             	sar    $0x4,%eax
  36afca:	89 c2                	mov    %eax,%edx
  36afcc:	89 d0                	mov    %edx,%eax
  36afce:	c1 e0 02             	shl    $0x2,%eax
  36afd1:	01 d0                	add    %edx,%eax
  36afd3:	01 c0                	add    %eax,%eax
  36afd5:	01 c8                	add    %ecx,%eax
  36afd7:	a3 20 38 37 00       	mov    %eax,0x373820
  36afdc:	a1 24 38 37 00       	mov    0x373824,%eax
  36afe1:	83 e0 0f             	and    $0xf,%eax
  36afe4:	89 c1                	mov    %eax,%ecx
  36afe6:	a1 24 38 37 00       	mov    0x373824,%eax
  36afeb:	c1 f8 04             	sar    $0x4,%eax
  36afee:	89 c2                	mov    %eax,%edx
  36aff0:	89 d0                	mov    %edx,%eax
  36aff2:	c1 e0 02             	shl    $0x2,%eax
  36aff5:	01 d0                	add    %edx,%eax
  36aff7:	01 c0                	add    %eax,%eax
  36aff9:	01 c8                	add    %ecx,%eax
  36affb:	a3 24 38 37 00       	mov    %eax,0x373824
  36b000:	a1 28 38 37 00       	mov    0x373828,%eax
  36b005:	83 e0 0f             	and    $0xf,%eax
  36b008:	89 c1                	mov    %eax,%ecx
  36b00a:	a1 28 38 37 00       	mov    0x373828,%eax
  36b00f:	c1 f8 04             	sar    $0x4,%eax
  36b012:	89 c2                	mov    %eax,%edx
  36b014:	89 d0                	mov    %edx,%eax
  36b016:	c1 e0 02             	shl    $0x2,%eax
  36b019:	01 d0                	add    %edx,%eax
  36b01b:	01 c0                	add    %eax,%eax
  36b01d:	01 c8                	add    %ecx,%eax
  36b01f:	a3 28 38 37 00       	mov    %eax,0x373828
  36b024:	a1 2c 38 37 00       	mov    0x37382c,%eax
  36b029:	83 e0 0f             	and    $0xf,%eax
  36b02c:	89 c1                	mov    %eax,%ecx
  36b02e:	a1 2c 38 37 00       	mov    0x37382c,%eax
  36b033:	c1 f8 04             	sar    $0x4,%eax
  36b036:	89 c2                	mov    %eax,%edx
  36b038:	89 d0                	mov    %edx,%eax
  36b03a:	c1 e0 02             	shl    $0x2,%eax
  36b03d:	01 d0                	add    %edx,%eax
  36b03f:	01 c0                	add    %eax,%eax
  36b041:	01 c8                	add    %ecx,%eax
  36b043:	a3 2c 38 37 00       	mov    %eax,0x37382c
  36b048:	a1 30 38 37 00       	mov    0x373830,%eax
  36b04d:	83 e0 0f             	and    $0xf,%eax
  36b050:	89 c1                	mov    %eax,%ecx
  36b052:	a1 30 38 37 00       	mov    0x373830,%eax
  36b057:	c1 f8 04             	sar    $0x4,%eax
  36b05a:	89 c2                	mov    %eax,%edx
  36b05c:	89 d0                	mov    %edx,%eax
  36b05e:	c1 e0 02             	shl    $0x2,%eax
  36b061:	01 d0                	add    %edx,%eax
  36b063:	01 c0                	add    %eax,%eax
  36b065:	01 c8                	add    %ecx,%eax
  36b067:	a3 30 38 37 00       	mov    %eax,0x373830
  36b06c:	a1 34 38 37 00       	mov    0x373834,%eax
  36b071:	83 e0 0f             	and    $0xf,%eax
  36b074:	89 c1                	mov    %eax,%ecx
  36b076:	a1 34 38 37 00       	mov    0x373834,%eax
  36b07b:	c1 f8 04             	sar    $0x4,%eax
  36b07e:	89 c2                	mov    %eax,%edx
  36b080:	89 d0                	mov    %edx,%eax
  36b082:	c1 e0 02             	shl    $0x2,%eax
  36b085:	01 d0                	add    %edx,%eax
  36b087:	01 c0                	add    %eax,%eax
  36b089:	01 c8                	add    %ecx,%eax
  36b08b:	a3 34 38 37 00       	mov    %eax,0x373834
  36b090:	a1 30 38 37 00       	mov    0x373830,%eax
  36b095:	83 e8 01             	sub    $0x1,%eax
  36b098:	a3 30 38 37 00       	mov    %eax,0x373830
  36b09d:	68 20 38 37 00       	push   $0x373820
  36b0a2:	e8 74 fd ff ff       	call   36ae1b <mktime>
  36b0a7:	83 c4 04             	add    $0x4,%esp
  36b0aa:	a3 08 38 37 00       	mov    %eax,0x373808
  36b0af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  36b0b2:	c9                   	leave  
  36b0b3:	c3                   	ret    

0036b0b4 <get_time>:
  36b0b4:	55                   	push   %ebp
  36b0b5:	89 e5                	mov    %esp,%ebp
  36b0b7:	57                   	push   %edi
  36b0b8:	56                   	push   %esi
  36b0b9:	53                   	push   %ebx
  36b0ba:	83 ec 10             	sub    $0x10,%esp
  36b0bd:	8b 0d 08 38 37 00    	mov    0x373808,%ecx
  36b0c3:	b8 02 00 00 00       	mov    $0x2,%eax
  36b0c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36b0cb:	ba 00 00 00 00       	mov    $0x0,%edx
  36b0d0:	be 00 00 00 00       	mov    $0x0,%esi
  36b0d5:	bf 00 00 00 00       	mov    $0x0,%edi
  36b0da:	cd 80                	int    $0x80
  36b0dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36b0df:	83 c4 10             	add    $0x10,%esp
  36b0e2:	5b                   	pop    %ebx
  36b0e3:	5e                   	pop    %esi
  36b0e4:	5f                   	pop    %edi
  36b0e5:	5d                   	pop    %ebp
  36b0e6:	c3                   	ret    

0036b0e7 <_clk>:
  36b0e7:	55                   	push   %ebp
  36b0e8:	89 e5                	mov    %esp,%ebp
  36b0ea:	a1 08 38 37 00       	mov    0x373808,%eax
  36b0ef:	83 c0 01             	add    $0x1,%eax
  36b0f2:	a3 08 38 37 00       	mov    %eax,0x373808
  36b0f7:	5d                   	pop    %ebp
  36b0f8:	c3                   	ret    

0036b0f9 <clock_init>:
  36b0f9:	55                   	push   %ebp
  36b0fa:	89 e5                	mov    %esp,%ebp
  36b0fc:	57                   	push   %edi
  36b0fd:	56                   	push   %esi
  36b0fe:	53                   	push   %ebx
  36b0ff:	83 ec 10             	sub    $0x10,%esp
  36b102:	b8 03 00 00 00       	mov    $0x3,%eax
  36b107:	bb 10 00 00 00       	mov    $0x10,%ebx
  36b10c:	b9 b4 b0 36 00       	mov    $0x36b0b4,%ecx
  36b111:	ba 00 00 00 00       	mov    $0x0,%edx
  36b116:	be 00 00 00 00       	mov    $0x0,%esi
  36b11b:	bf 00 00 00 00       	mov    $0x0,%edi
  36b120:	cd 80                	int    $0x80
  36b122:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36b125:	b8 03 00 00 00       	mov    $0x3,%eax
  36b12a:	bb 0a 00 00 00       	mov    $0xa,%ebx
  36b12f:	b9 e7 b0 36 00       	mov    $0x36b0e7,%ecx
  36b134:	ba 00 00 00 00       	mov    $0x0,%edx
  36b139:	be 00 00 00 00       	mov    $0x0,%esi
  36b13e:	bf 00 00 00 00       	mov    $0x0,%edi
  36b143:	cd 80                	int    $0x80
  36b145:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36b148:	e8 77 fd ff ff       	call   36aec4 <cmos_time>
  36b14d:	6a 43                	push   $0x43
  36b14f:	6a 36                	push   $0x36
  36b151:	e8 71 fc ff ff       	call   36adc7 <outb_p>
  36b156:	83 c4 08             	add    $0x8,%esp
  36b159:	6a 40                	push   $0x40
  36b15b:	68 9c 00 00 00       	push   $0x9c
  36b160:	e8 62 fc ff ff       	call   36adc7 <outb_p>
  36b165:	83 c4 08             	add    $0x8,%esp
  36b168:	6a 40                	push   $0x40
  36b16a:	6a 2e                	push   $0x2e
  36b16c:	e8 56 fc ff ff       	call   36adc7 <outb_p>
  36b171:	83 c4 08             	add    $0x8,%esp
  36b174:	b8 01 00 00 00       	mov    $0x1,%eax
  36b179:	bb 04 00 00 00       	mov    $0x4,%ebx
  36b17e:	b9 13 00 00 00       	mov    $0x13,%ecx
  36b183:	ba 00 00 00 00       	mov    $0x0,%edx
  36b188:	be 00 00 00 00       	mov    $0x0,%esi
  36b18d:	bf 00 00 00 00       	mov    $0x0,%edi
  36b192:	cd 80                	int    $0x80
  36b194:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36b197:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36b19a:	5b                   	pop    %ebx
  36b19b:	5e                   	pop    %esi
  36b19c:	5f                   	pop    %edi
  36b19d:	5d                   	pop    %ebp
  36b19e:	c3                   	ret    

0036b19f <clock_main>:
  36b19f:	55                   	push   %ebp
  36b1a0:	89 e5                	mov    %esp,%ebp
  36b1a2:	57                   	push   %edi
  36b1a3:	56                   	push   %esi
  36b1a4:	53                   	push   %ebx
  36b1a5:	83 ec 10             	sub    $0x10,%esp
  36b1a8:	e8 4c ff ff ff       	call   36b0f9 <clock_init>
  36b1ad:	b8 00 00 00 00       	mov    $0x0,%eax
  36b1b2:	bb 00 00 00 00       	mov    $0x0,%ebx
  36b1b7:	b9 00 00 00 00       	mov    $0x0,%ecx
  36b1bc:	ba 00 00 00 00       	mov    $0x0,%edx
  36b1c1:	be 00 00 00 00       	mov    $0x0,%esi
  36b1c6:	bf 00 00 00 00       	mov    $0x0,%edi
  36b1cb:	cd 80                	int    $0x80
  36b1cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36b1d0:	b8 00 00 00 00       	mov    $0x0,%eax
  36b1d5:	83 c4 10             	add    $0x10,%esp
  36b1d8:	5b                   	pop    %ebx
  36b1d9:	5e                   	pop    %esi
  36b1da:	5f                   	pop    %edi
  36b1db:	5d                   	pop    %ebp
  36b1dc:	c3                   	ret    

0036b1dd <memcpy>:
  36b1dd:	55                   	push   %ebp
  36b1de:	89 e5                	mov    %esp,%ebp
  36b1e0:	57                   	push   %edi
  36b1e1:	56                   	push   %esi
  36b1e2:	53                   	push   %ebx
  36b1e3:	8b 45 10             	mov    0x10(%ebp),%eax
  36b1e6:	8b 55 0c             	mov    0xc(%ebp),%edx
  36b1e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36b1ec:	89 c1                	mov    %eax,%ecx
  36b1ee:	89 d6                	mov    %edx,%esi
  36b1f0:	89 df                	mov    %ebx,%edi
  36b1f2:	fc                   	cld    
  36b1f3:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  36b1f5:	8b 45 08             	mov    0x8(%ebp),%eax
  36b1f8:	5b                   	pop    %ebx
  36b1f9:	5e                   	pop    %esi
  36b1fa:	5f                   	pop    %edi
  36b1fb:	5d                   	pop    %ebp
  36b1fc:	c3                   	ret    

0036b1fd <memset>:
  36b1fd:	55                   	push   %ebp
  36b1fe:	89 e5                	mov    %esp,%ebp
  36b200:	57                   	push   %edi
  36b201:	8b 45 0c             	mov    0xc(%ebp),%eax
  36b204:	8b 55 08             	mov    0x8(%ebp),%edx
  36b207:	8b 4d 10             	mov    0x10(%ebp),%ecx
  36b20a:	89 d7                	mov    %edx,%edi
  36b20c:	fc                   	cld    
  36b20d:	f3 aa                	rep stos %al,%es:(%edi)
  36b20f:	8b 45 08             	mov    0x8(%ebp),%eax
  36b212:	5f                   	pop    %edi
  36b213:	5d                   	pop    %ebp
  36b214:	c3                   	ret    

0036b215 <get_free_page>:
  36b215:	55                   	push   %ebp
  36b216:	89 e5                	mov    %esp,%ebp
  36b218:	57                   	push   %edi
  36b219:	83 ec 10             	sub    $0x10,%esp
  36b21c:	c7 45 f8 00 08 00 00 	movl   $0x800,-0x8(%ebp)
  36b223:	eb 47                	jmp    36b26c <get_free_page+0x57>
  36b225:	8b 15 00 31 37 00    	mov    0x373100,%edx
  36b22b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36b22e:	01 d0                	add    %edx,%eax
  36b230:	0f b6 00             	movzbl (%eax),%eax
  36b233:	84 c0                	test   %al,%al
  36b235:	75 31                	jne    36b268 <get_free_page+0x53>
  36b237:	8b 15 00 31 37 00    	mov    0x373100,%edx
  36b23d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36b240:	01 d0                	add    %edx,%eax
  36b242:	0f b6 10             	movzbl (%eax),%edx
  36b245:	83 c2 01             	add    $0x1,%edx
  36b248:	88 10                	mov    %dl,(%eax)
  36b24a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36b24d:	c1 e0 0c             	shl    $0xc,%eax
  36b250:	89 c2                	mov    %eax,%edx
  36b252:	b8 00 00 00 00       	mov    $0x0,%eax
  36b257:	b9 00 04 00 00       	mov    $0x400,%ecx
  36b25c:	89 d7                	mov    %edx,%edi
  36b25e:	f3 ab                	rep stos %eax,%es:(%edi)
  36b260:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36b263:	c1 e0 0c             	shl    $0xc,%eax
  36b266:	eb 0f                	jmp    36b277 <get_free_page+0x62>
  36b268:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  36b26c:	81 7d f8 ff ff 03 00 	cmpl   $0x3ffff,-0x8(%ebp)
  36b273:	7e b0                	jle    36b225 <get_free_page+0x10>
  36b275:	eb a5                	jmp    36b21c <get_free_page+0x7>
  36b277:	83 c4 10             	add    $0x10,%esp
  36b27a:	5f                   	pop    %edi
  36b27b:	5d                   	pop    %ebp
  36b27c:	c3                   	ret    

0036b27d <get_kfree_page>:
  36b27d:	55                   	push   %ebp
  36b27e:	89 e5                	mov    %esp,%ebp
  36b280:	57                   	push   %edi
  36b281:	83 ec 10             	sub    $0x10,%esp
  36b284:	c7 45 f8 00 04 00 00 	movl   $0x400,-0x8(%ebp)
  36b28b:	eb 47                	jmp    36b2d4 <get_kfree_page+0x57>
  36b28d:	8b 15 00 31 37 00    	mov    0x373100,%edx
  36b293:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36b296:	01 d0                	add    %edx,%eax
  36b298:	0f b6 00             	movzbl (%eax),%eax
  36b29b:	84 c0                	test   %al,%al
  36b29d:	75 31                	jne    36b2d0 <get_kfree_page+0x53>
  36b29f:	8b 15 00 31 37 00    	mov    0x373100,%edx
  36b2a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36b2a8:	01 d0                	add    %edx,%eax
  36b2aa:	0f b6 10             	movzbl (%eax),%edx
  36b2ad:	83 c2 01             	add    $0x1,%edx
  36b2b0:	88 10                	mov    %dl,(%eax)
  36b2b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36b2b5:	c1 e0 0c             	shl    $0xc,%eax
  36b2b8:	89 c2                	mov    %eax,%edx
  36b2ba:	b8 00 00 00 00       	mov    $0x0,%eax
  36b2bf:	b9 00 04 00 00       	mov    $0x400,%ecx
  36b2c4:	89 d7                	mov    %edx,%edi
  36b2c6:	f3 ab                	rep stos %eax,%es:(%edi)
  36b2c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36b2cb:	c1 e0 0c             	shl    $0xc,%eax
  36b2ce:	eb 12                	jmp    36b2e2 <get_kfree_page+0x65>
  36b2d0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  36b2d4:	81 7d f8 ff 07 00 00 	cmpl   $0x7ff,-0x8(%ebp)
  36b2db:	7e b0                	jle    36b28d <get_kfree_page+0x10>
  36b2dd:	b8 00 00 00 00       	mov    $0x0,%eax
  36b2e2:	83 c4 10             	add    $0x10,%esp
  36b2e5:	5f                   	pop    %edi
  36b2e6:	5d                   	pop    %ebp
  36b2e7:	c3                   	ret    

0036b2e8 <share_page>:
  36b2e8:	55                   	push   %ebp
  36b2e9:	89 e5                	mov    %esp,%ebp
  36b2eb:	83 ec 08             	sub    $0x8,%esp
  36b2ee:	81 7d 08 ff ff 3f 00 	cmpl   $0x3fffff,0x8(%ebp)
  36b2f5:	77 1a                	ja     36b311 <share_page+0x29>
  36b2f7:	83 ec 08             	sub    $0x8,%esp
  36b2fa:	ff 75 08             	pushl  0x8(%ebp)
  36b2fd:	68 90 e7 36 00       	push   $0x36e790
  36b302:	e8 81 dd ff ff       	call   369088 <printk>
  36b307:	83 c4 10             	add    $0x10,%esp
  36b30a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  36b30f:	eb 1a                	jmp    36b32b <share_page+0x43>
  36b311:	a1 00 31 37 00       	mov    0x373100,%eax
  36b316:	8b 55 08             	mov    0x8(%ebp),%edx
  36b319:	c1 ea 0c             	shr    $0xc,%edx
  36b31c:	01 d0                	add    %edx,%eax
  36b31e:	0f b6 10             	movzbl (%eax),%edx
  36b321:	83 c2 01             	add    $0x1,%edx
  36b324:	88 10                	mov    %dl,(%eax)
  36b326:	b8 00 00 00 00       	mov    $0x0,%eax
  36b32b:	c9                   	leave  
  36b32c:	c3                   	ret    

0036b32d <page_share_nr>:
  36b32d:	55                   	push   %ebp
  36b32e:	89 e5                	mov    %esp,%ebp
  36b330:	a1 00 31 37 00       	mov    0x373100,%eax
  36b335:	8b 55 08             	mov    0x8(%ebp),%edx
  36b338:	c1 ea 0c             	shr    $0xc,%edx
  36b33b:	01 d0                	add    %edx,%eax
  36b33d:	0f b6 00             	movzbl (%eax),%eax
  36b340:	0f b6 c0             	movzbl %al,%eax
  36b343:	5d                   	pop    %ebp
  36b344:	c3                   	ret    

0036b345 <free_page>:
  36b345:	55                   	push   %ebp
  36b346:	89 e5                	mov    %esp,%ebp
  36b348:	83 ec 08             	sub    $0x8,%esp
  36b34b:	81 7d 08 ff ff 3f 00 	cmpl   $0x3fffff,0x8(%ebp)
  36b352:	77 1a                	ja     36b36e <free_page+0x29>
  36b354:	83 ec 08             	sub    $0x8,%esp
  36b357:	ff 75 08             	pushl  0x8(%ebp)
  36b35a:	68 d8 e7 36 00       	push   $0x36e7d8
  36b35f:	e8 24 dd ff ff       	call   369088 <printk>
  36b364:	83 c4 10             	add    $0x10,%esp
  36b367:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  36b36c:	eb 48                	jmp    36b3b6 <free_page+0x71>
  36b36e:	a1 00 31 37 00       	mov    0x373100,%eax
  36b373:	8b 55 08             	mov    0x8(%ebp),%edx
  36b376:	c1 ea 0c             	shr    $0xc,%edx
  36b379:	01 d0                	add    %edx,%eax
  36b37b:	0f b6 00             	movzbl (%eax),%eax
  36b37e:	84 c0                	test   %al,%al
  36b380:	75 1a                	jne    36b39c <free_page+0x57>
  36b382:	83 ec 08             	sub    $0x8,%esp
  36b385:	ff 75 08             	pushl  0x8(%ebp)
  36b388:	68 08 e8 36 00       	push   $0x36e808
  36b38d:	e8 f6 dc ff ff       	call   369088 <printk>
  36b392:	83 c4 10             	add    $0x10,%esp
  36b395:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  36b39a:	eb 1a                	jmp    36b3b6 <free_page+0x71>
  36b39c:	a1 00 31 37 00       	mov    0x373100,%eax
  36b3a1:	8b 55 08             	mov    0x8(%ebp),%edx
  36b3a4:	c1 ea 0c             	shr    $0xc,%edx
  36b3a7:	01 d0                	add    %edx,%eax
  36b3a9:	0f b6 10             	movzbl (%eax),%edx
  36b3ac:	83 ea 01             	sub    $0x1,%edx
  36b3af:	88 10                	mov    %dl,(%eax)
  36b3b1:	b8 00 00 00 00       	mov    $0x0,%eax
  36b3b6:	c9                   	leave  
  36b3b7:	c3                   	ret    

0036b3b8 <open_pagination>:
  36b3b8:	55                   	push   %ebp
  36b3b9:	89 e5                	mov    %esp,%ebp
  36b3bb:	83 ec 20             	sub    $0x20,%esp
  36b3be:	c7 45 ec 00 00 26 00 	movl   $0x260000,-0x14(%ebp)
  36b3c5:	c7 45 fc 00 10 26 00 	movl   $0x261000,-0x4(%ebp)
  36b3cc:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  36b3d3:	68 00 10 00 00       	push   $0x1000
  36b3d8:	6a 00                	push   $0x0
  36b3da:	ff 75 ec             	pushl  -0x14(%ebp)
  36b3dd:	e8 1b fe ff ff       	call   36b1fd <memset>
  36b3e2:	83 c4 0c             	add    $0xc,%esp
  36b3e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36b3ec:	eb 5d                	jmp    36b44b <open_pagination+0x93>
  36b3ee:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  36b3f5:	eb 25                	jmp    36b41c <open_pagination+0x64>
  36b3f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b3fa:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  36b401:	8b 45 fc             	mov    -0x4(%ebp),%eax
  36b404:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  36b407:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36b40a:	8d 50 01             	lea    0x1(%eax),%edx
  36b40d:	89 55 f8             	mov    %edx,-0x8(%ebp)
  36b410:	c1 e0 0c             	shl    $0xc,%eax
  36b413:	83 c8 07             	or     $0x7,%eax
  36b416:	89 01                	mov    %eax,(%ecx)
  36b418:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  36b41c:	81 7d f0 ff 03 00 00 	cmpl   $0x3ff,-0x10(%ebp)
  36b423:	7e d2                	jle    36b3f7 <open_pagination+0x3f>
  36b425:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b428:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  36b42f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36b432:	01 d0                	add    %edx,%eax
  36b434:	8b 55 fc             	mov    -0x4(%ebp),%edx
  36b437:	83 ca 07             	or     $0x7,%edx
  36b43a:	89 10                	mov    %edx,(%eax)
  36b43c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  36b43f:	05 00 10 00 00       	add    $0x1000,%eax
  36b444:	89 45 fc             	mov    %eax,-0x4(%ebp)
  36b447:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36b44b:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
  36b452:	7e 9a                	jle    36b3ee <open_pagination+0x36>
  36b454:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36b457:	0f 22 d8             	mov    %eax,%cr3
  36b45a:	0f 20 c0             	mov    %cr0,%eax
  36b45d:	0d 00 00 01 80       	or     $0x80010000,%eax
  36b462:	0f 22 c0             	mov    %eax,%cr0
  36b465:	c9                   	leave  
  36b466:	c3                   	ret    

0036b467 <mm_init>:
  36b467:	55                   	push   %ebp
  36b468:	89 e5                	mov    %esp,%ebp
  36b46a:	83 ec 28             	sub    $0x28,%esp
  36b46d:	a1 00 30 37 00       	mov    0x373000,%eax
  36b472:	8b 40 30             	mov    0x30(%eax),%eax
  36b475:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36b478:	a1 00 30 37 00       	mov    0x373000,%eax
  36b47d:	8b 50 30             	mov    0x30(%eax),%edx
  36b480:	a1 00 30 37 00       	mov    0x373000,%eax
  36b485:	8b 40 2c             	mov    0x2c(%eax),%eax
  36b488:	01 d0                	add    %edx,%eax
  36b48a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36b48d:	a1 00 30 37 00       	mov    0x373000,%eax
  36b492:	8b 40 18             	mov    0x18(%eax),%eax
  36b495:	89 45 dc             	mov    %eax,-0x24(%ebp)
  36b498:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36b49b:	8b 00                	mov    (%eax),%eax
  36b49d:	89 45 d8             	mov    %eax,-0x28(%ebp)
  36b4a0:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36b4a3:	8b 50 04             	mov    0x4(%eax),%edx
  36b4a6:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36b4a9:	8b 00                	mov    (%eax),%eax
  36b4ab:	29 c2                	sub    %eax,%edx
  36b4ad:	89 d0                	mov    %edx,%eax
  36b4af:	a3 dc 3c 37 00       	mov    %eax,0x373cdc
  36b4b4:	a1 dc 3c 37 00       	mov    0x373cdc,%eax
  36b4b9:	ba 00 00 06 00       	mov    $0x60000,%edx
  36b4be:	3d 00 00 06 00       	cmp    $0x60000,%eax
  36b4c3:	0f 47 c2             	cmova  %edx,%eax
  36b4c6:	a3 dc 3c 37 00       	mov    %eax,0x373cdc
  36b4cb:	a1 dc 3c 37 00       	mov    0x373cdc,%eax
  36b4d0:	50                   	push   %eax
  36b4d1:	ff 75 d8             	pushl  -0x28(%ebp)
  36b4d4:	68 00 00 20 00       	push   $0x200000
  36b4d9:	e8 ff fc ff ff       	call   36b1dd <memcpy>
  36b4de:	83 c4 0c             	add    $0xc,%esp
  36b4e1:	c6 45 f3 64          	movb   $0x64,-0xd(%ebp)
  36b4e5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  36b4ec:	eb 12                	jmp    36b500 <mm_init+0x99>
  36b4ee:	8b 15 00 31 37 00    	mov    0x373100,%edx
  36b4f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36b4f7:	01 d0                	add    %edx,%eax
  36b4f9:	c6 00 64             	movb   $0x64,(%eax)
  36b4fc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  36b500:	8b 15 00 31 37 00    	mov    0x373100,%edx
  36b506:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36b509:	01 d0                	add    %edx,%eax
  36b50b:	3d ff ff 1f 00       	cmp    $0x1fffff,%eax
  36b510:	76 dc                	jbe    36b4ee <mm_init+0x87>
  36b512:	eb 65                	jmp    36b579 <mm_init+0x112>
  36b514:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b517:	8b 40 14             	mov    0x14(%eax),%eax
  36b51a:	83 f8 01             	cmp    $0x1,%eax
  36b51d:	75 19                	jne    36b538 <mm_init+0xd1>
  36b51f:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
  36b523:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b526:	8b 50 04             	mov    0x4(%eax),%edx
  36b529:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b52c:	8b 40 0c             	mov    0xc(%eax),%eax
  36b52f:	01 d0                	add    %edx,%eax
  36b531:	a3 40 38 37 00       	mov    %eax,0x373840
  36b536:	eb 04                	jmp    36b53c <mm_init+0xd5>
  36b538:	c6 45 f3 64          	movb   $0x64,-0xd(%ebp)
  36b53c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b53f:	8b 40 04             	mov    0x4(%eax),%eax
  36b542:	c1 e8 0c             	shr    $0xc,%eax
  36b545:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36b548:	eb 15                	jmp    36b55f <mm_init+0xf8>
  36b54a:	8b 15 00 31 37 00    	mov    0x373100,%edx
  36b550:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36b553:	01 c2                	add    %eax,%edx
  36b555:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  36b559:	88 02                	mov    %al,(%edx)
  36b55b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  36b55f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b562:	8b 50 04             	mov    0x4(%eax),%edx
  36b565:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b568:	8b 40 0c             	mov    0xc(%eax),%eax
  36b56b:	01 d0                	add    %edx,%eax
  36b56d:	c1 e8 0c             	shr    $0xc,%eax
  36b570:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  36b573:	77 d5                	ja     36b54a <mm_init+0xe3>
  36b575:	83 45 f4 18          	addl   $0x18,-0xc(%ebp)
  36b579:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b57c:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  36b57f:	72 93                	jb     36b514 <mm_init+0xad>
  36b581:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  36b588:	eb 12                	jmp    36b59c <mm_init+0x135>
  36b58a:	8b 15 00 31 37 00    	mov    0x373100,%edx
  36b590:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36b593:	01 d0                	add    %edx,%eax
  36b595:	c6 00 64             	movb   $0x64,(%eax)
  36b598:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  36b59c:	81 7d e4 ff 03 00 00 	cmpl   $0x3ff,-0x1c(%ebp)
  36b5a3:	7e e5                	jle    36b58a <mm_init+0x123>
  36b5a5:	a1 40 38 37 00       	mov    0x373840,%eax
  36b5aa:	3d 00 00 00 40       	cmp    $0x40000000,%eax
  36b5af:	76 0c                	jbe    36b5bd <mm_init+0x156>
  36b5b1:	c7 05 44 38 37 00 00 	movl   $0x40000000,0x373844
  36b5b8:	00 00 40 
  36b5bb:	eb 0a                	jmp    36b5c7 <mm_init+0x160>
  36b5bd:	a1 40 38 37 00       	mov    0x373840,%eax
  36b5c2:	a3 44 38 37 00       	mov    %eax,0x373844
  36b5c7:	e8 7c f6 ff ff       	call   36ac48 <buffer_init>
  36b5cc:	e8 e7 fd ff ff       	call   36b3b8 <open_pagination>
  36b5d1:	c9                   	leave  
  36b5d2:	c3                   	ret    

0036b5d3 <main>:
  36b5d3:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  36b5d7:	83 e4 f0             	and    $0xfffffff0,%esp
  36b5da:	ff 71 fc             	pushl  -0x4(%ecx)
  36b5dd:	55                   	push   %ebp
  36b5de:	89 e5                	mov    %esp,%ebp
  36b5e0:	51                   	push   %ecx
  36b5e1:	83 ec 04             	sub    $0x4,%esp
  36b5e4:	fa                   	cli    
  36b5e5:	e8 e9 8e ff ff       	call   3644d3 <cons_init>
  36b5ea:	e8 78 fe ff ff       	call   36b467 <mm_init>
  36b5ef:	e8 23 e2 ff ff       	call   369817 <trap_init>
  36b5f4:	e8 c3 f0 ff ff       	call   36a6bc <god_init>
  36b5f9:	b8 00 00 00 00       	mov    $0x0,%eax
  36b5fe:	83 c4 04             	add    $0x4,%esp
  36b601:	59                   	pop    %ecx
  36b602:	5d                   	pop    %ebp
  36b603:	8d 61 fc             	lea    -0x4(%ecx),%esp
  36b606:	c3                   	ret    

0036b607 <memcpy>:
  36b607:	55                   	push   %ebp
  36b608:	89 e5                	mov    %esp,%ebp
  36b60a:	57                   	push   %edi
  36b60b:	56                   	push   %esi
  36b60c:	53                   	push   %ebx
  36b60d:	8b 45 10             	mov    0x10(%ebp),%eax
  36b610:	8b 55 0c             	mov    0xc(%ebp),%edx
  36b613:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36b616:	89 c1                	mov    %eax,%ecx
  36b618:	89 d6                	mov    %edx,%esi
  36b61a:	89 df                	mov    %ebx,%edi
  36b61c:	fc                   	cld    
  36b61d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  36b61f:	8b 45 08             	mov    0x8(%ebp),%eax
  36b622:	5b                   	pop    %ebx
  36b623:	5e                   	pop    %esi
  36b624:	5f                   	pop    %edi
  36b625:	5d                   	pop    %ebp
  36b626:	c3                   	ret    

0036b627 <getFreeObject>:
  36b627:	55                   	push   %ebp
  36b628:	89 e5                	mov    %esp,%ebp
  36b62a:	83 ec 10             	sub    $0x10,%esp
  36b62d:	c7 45 fc 03 00 00 00 	movl   $0x3,-0x4(%ebp)
  36b634:	eb 17                	jmp    36b64d <getFreeObject+0x26>
  36b636:	8b 45 fc             	mov    -0x4(%ebp),%eax
  36b639:	8b 04 85 00 3d 37 00 	mov    0x373d00(,%eax,4),%eax
  36b640:	85 c0                	test   %eax,%eax
  36b642:	75 05                	jne    36b649 <getFreeObject+0x22>
  36b644:	8b 45 fc             	mov    -0x4(%ebp),%eax
  36b647:	eb 12                	jmp    36b65b <getFreeObject+0x34>
  36b649:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  36b64d:	81 7d fc ff 02 00 00 	cmpl   $0x2ff,-0x4(%ebp)
  36b654:	7e e0                	jle    36b636 <getFreeObject+0xf>
  36b656:	b8 00 00 00 00       	mov    $0x0,%eax
  36b65b:	c9                   	leave  
  36b65c:	c3                   	ret    

0036b65d <cloneObject>:
  36b65d:	55                   	push   %ebp
  36b65e:	89 e5                	mov    %esp,%ebp
  36b660:	83 ec 18             	sub    $0x18,%esp
  36b663:	e8 bf ff ff ff       	call   36b627 <getFreeObject>
  36b668:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36b66b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36b66f:	74 49                	je     36b6ba <cloneObject+0x5d>
  36b671:	e8 07 fc ff ff       	call   36b27d <get_kfree_page>
  36b676:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36b679:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  36b67d:	74 3b                	je     36b6ba <cloneObject+0x5d>
  36b67f:	83 ec 04             	sub    $0x4,%esp
  36b682:	68 00 10 00 00       	push   $0x1000
  36b687:	ff 75 08             	pushl  0x8(%ebp)
  36b68a:	ff 75 f0             	pushl  -0x10(%ebp)
  36b68d:	e8 75 ff ff ff       	call   36b607 <memcpy>
  36b692:	83 c4 10             	add    $0x10,%esp
  36b695:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b698:	8b 55 f0             	mov    -0x10(%ebp),%edx
  36b69b:	89 14 85 00 3d 37 00 	mov    %edx,0x373d00(,%eax,4)
  36b6a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b6a5:	8b 55 f4             	mov    -0xc(%ebp),%edx
  36b6a8:	89 10                	mov    %edx,(%eax)
  36b6aa:	8b 45 08             	mov    0x8(%ebp),%eax
  36b6ad:	8b 10                	mov    (%eax),%edx
  36b6af:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b6b2:	89 50 0c             	mov    %edx,0xc(%eax)
  36b6b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b6b8:	eb 05                	jmp    36b6bf <cloneObject+0x62>
  36b6ba:	b8 00 00 00 00       	mov    $0x0,%eax
  36b6bf:	c9                   	leave  
  36b6c0:	c3                   	ret    

0036b6c1 <objectById>:
  36b6c1:	55                   	push   %ebp
  36b6c2:	89 e5                	mov    %esp,%ebp
  36b6c4:	8b 45 08             	mov    0x8(%ebp),%eax
  36b6c7:	8b 04 85 00 3d 37 00 	mov    0x373d00(,%eax,4),%eax
  36b6ce:	5d                   	pop    %ebp
  36b6cf:	c3                   	ret    

0036b6d0 <bucket_init>:
  36b6d0:	55                   	push   %ebp
  36b6d1:	89 e5                	mov    %esp,%ebp
  36b6d3:	83 ec 18             	sub    $0x18,%esp
  36b6d6:	e8 a2 fb ff ff       	call   36b27d <get_kfree_page>
  36b6db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36b6de:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b6e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36b6e4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36b6e8:	75 10                	jne    36b6fa <bucket_init+0x2a>
  36b6ea:	83 ec 0c             	sub    $0xc,%esp
  36b6ed:	68 34 e8 36 00       	push   $0x36e834
  36b6f2:	e8 75 d9 ff ff       	call   36906c <panic>
  36b6f7:	83 c4 10             	add    $0x10,%esp
  36b6fa:	c7 45 f0 00 01 00 00 	movl   $0x100,-0x10(%ebp)
  36b701:	eb 14                	jmp    36b717 <bucket_init+0x47>
  36b703:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b706:	8d 50 10             	lea    0x10(%eax),%edx
  36b709:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b70c:	89 50 04             	mov    %edx,0x4(%eax)
  36b70f:	83 45 f4 10          	addl   $0x10,-0xc(%ebp)
  36b713:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
  36b717:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
  36b71b:	7f e6                	jg     36b703 <bucket_init+0x33>
  36b71d:	8b 15 58 38 37 00    	mov    0x373858,%edx
  36b723:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b726:	89 50 04             	mov    %edx,0x4(%eax)
  36b729:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36b72c:	a3 58 38 37 00       	mov    %eax,0x373858
  36b731:	c9                   	leave  
  36b732:	c3                   	ret    

0036b733 <kalloc>:
  36b733:	55                   	push   %ebp
  36b734:	89 e5                	mov    %esp,%ebp
  36b736:	83 ec 28             	sub    $0x28,%esp
  36b739:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  36b740:	c7 45 f0 40 31 37 00 	movl   $0x373140,-0x10(%ebp)
  36b747:	eb 10                	jmp    36b759 <kalloc+0x26>
  36b749:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b74c:	8b 00                	mov    (%eax),%eax
  36b74e:	3b 45 08             	cmp    0x8(%ebp),%eax
  36b751:	76 02                	jbe    36b755 <kalloc+0x22>
  36b753:	eb 0d                	jmp    36b762 <kalloc+0x2f>
  36b755:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
  36b759:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b75c:	8b 00                	mov    (%eax),%eax
  36b75e:	85 c0                	test   %eax,%eax
  36b760:	75 e7                	jne    36b749 <kalloc+0x16>
  36b762:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b765:	8b 00                	mov    (%eax),%eax
  36b767:	85 c0                	test   %eax,%eax
  36b769:	75 10                	jne    36b77b <kalloc+0x48>
  36b76b:	83 ec 0c             	sub    $0xc,%esp
  36b76e:	68 58 e8 36 00       	push   $0x36e858
  36b773:	e8 f4 d8 ff ff       	call   36906c <panic>
  36b778:	83 c4 10             	add    $0x10,%esp
  36b77b:	fa                   	cli    
  36b77c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b77f:	8b 40 04             	mov    0x4(%eax),%eax
  36b782:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36b785:	eb 15                	jmp    36b79c <kalloc+0x69>
  36b787:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b78a:	8b 40 08             	mov    0x8(%eax),%eax
  36b78d:	85 c0                	test   %eax,%eax
  36b78f:	74 02                	je     36b793 <kalloc+0x60>
  36b791:	eb 0f                	jmp    36b7a2 <kalloc+0x6f>
  36b793:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b796:	8b 40 04             	mov    0x4(%eax),%eax
  36b799:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36b79c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36b7a0:	75 e5                	jne    36b787 <kalloc+0x54>
  36b7a2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36b7a6:	0f 85 c8 00 00 00    	jne    36b874 <kalloc+0x141>
  36b7ac:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  36b7b3:	a1 58 38 37 00       	mov    0x373858,%eax
  36b7b8:	85 c0                	test   %eax,%eax
  36b7ba:	75 05                	jne    36b7c1 <kalloc+0x8e>
  36b7bc:	e8 0f ff ff ff       	call   36b6d0 <bucket_init>
  36b7c1:	a1 58 38 37 00       	mov    0x373858,%eax
  36b7c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36b7c9:	a1 58 38 37 00       	mov    0x373858,%eax
  36b7ce:	8b 40 04             	mov    0x4(%eax),%eax
  36b7d1:	a3 58 38 37 00       	mov    %eax,0x373858
  36b7d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b7d9:	66 c7 40 0c 00 00    	movw   $0x0,0xc(%eax)
  36b7df:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b7e2:	8b 00                	mov    (%eax),%eax
  36b7e4:	89 c2                	mov    %eax,%edx
  36b7e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b7e9:	66 89 50 0e          	mov    %dx,0xe(%eax)
  36b7ed:	e8 8b fa ff ff       	call   36b27d <get_kfree_page>
  36b7f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36b7f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b7f8:	8b 55 ec             	mov    -0x14(%ebp),%edx
  36b7fb:	89 50 08             	mov    %edx,0x8(%eax)
  36b7fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b801:	8b 50 08             	mov    0x8(%eax),%edx
  36b804:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b807:	89 10                	mov    %edx,(%eax)
  36b809:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  36b80d:	75 10                	jne    36b81f <kalloc+0xec>
  36b80f:	83 ec 0c             	sub    $0xc,%esp
  36b812:	68 74 e8 36 00       	push   $0x36e874
  36b817:	e8 50 d8 ff ff       	call   36906c <panic>
  36b81c:	83 c4 10             	add    $0x10,%esp
  36b81f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b822:	8b 08                	mov    (%eax),%ecx
  36b824:	b8 00 10 00 00       	mov    $0x1000,%eax
  36b829:	ba 00 00 00 00       	mov    $0x0,%edx
  36b82e:	f7 f1                	div    %ecx
  36b830:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36b833:	eb 1b                	jmp    36b850 <kalloc+0x11d>
  36b835:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b838:	8b 10                	mov    (%eax),%edx
  36b83a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36b83d:	01 c2                	add    %eax,%edx
  36b83f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36b842:	89 10                	mov    %edx,(%eax)
  36b844:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b847:	8b 00                	mov    (%eax),%eax
  36b849:	01 45 ec             	add    %eax,-0x14(%ebp)
  36b84c:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  36b850:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
  36b854:	7f df                	jg     36b835 <kalloc+0x102>
  36b856:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36b859:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  36b85f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b862:	8b 50 04             	mov    0x4(%eax),%edx
  36b865:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b868:	89 50 04             	mov    %edx,0x4(%eax)
  36b86b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b86e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  36b871:	89 50 04             	mov    %edx,0x4(%eax)
  36b874:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b877:	8b 40 08             	mov    0x8(%eax),%eax
  36b87a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36b87d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36b880:	8b 10                	mov    (%eax),%edx
  36b882:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b885:	89 50 08             	mov    %edx,0x8(%eax)
  36b888:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b88b:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
  36b88f:	8d 50 01             	lea    0x1(%eax),%edx
  36b892:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b895:	66 89 50 0c          	mov    %dx,0xc(%eax)
  36b899:	fb                   	sti    
  36b89a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36b89d:	c9                   	leave  
  36b89e:	c3                   	ret    

0036b89f <kfree_s>:
  36b89f:	55                   	push   %ebp
  36b8a0:	89 e5                	mov    %esp,%ebp
  36b8a2:	83 ec 18             	sub    $0x18,%esp
  36b8a5:	8b 45 08             	mov    0x8(%ebp),%eax
  36b8a8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  36b8ad:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36b8b0:	c7 45 f4 40 31 37 00 	movl   $0x373140,-0xc(%ebp)
  36b8b7:	eb 43                	jmp    36b8fc <kfree_s+0x5d>
  36b8b9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  36b8c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b8c3:	8b 00                	mov    (%eax),%eax
  36b8c5:	3b 45 0c             	cmp    0xc(%ebp),%eax
  36b8c8:	73 02                	jae    36b8cc <kfree_s+0x2d>
  36b8ca:	eb 2c                	jmp    36b8f8 <kfree_s+0x59>
  36b8cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b8cf:	8b 40 04             	mov    0x4(%eax),%eax
  36b8d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36b8d5:	eb 1b                	jmp    36b8f2 <kfree_s+0x53>
  36b8d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b8da:	8b 00                	mov    (%eax),%eax
  36b8dc:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  36b8df:	75 02                	jne    36b8e3 <kfree_s+0x44>
  36b8e1:	eb 45                	jmp    36b928 <kfree_s+0x89>
  36b8e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b8e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36b8e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b8ec:	8b 40 04             	mov    0x4(%eax),%eax
  36b8ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36b8f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  36b8f6:	75 df                	jne    36b8d7 <kfree_s+0x38>
  36b8f8:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
  36b8fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b8ff:	8b 00                	mov    (%eax),%eax
  36b901:	85 c0                	test   %eax,%eax
  36b903:	75 b4                	jne    36b8b9 <kfree_s+0x1a>
  36b905:	83 ec 08             	sub    $0x8,%esp
  36b908:	ff 75 08             	pushl  0x8(%ebp)
  36b90b:	68 96 e8 36 00       	push   $0x36e896
  36b910:	e8 73 d7 ff ff       	call   369088 <printk>
  36b915:	83 c4 10             	add    $0x10,%esp
  36b918:	83 ec 0c             	sub    $0xc,%esp
  36b91b:	68 a0 e8 36 00       	push   $0x36e8a0
  36b920:	e8 47 d7 ff ff       	call   36906c <panic>
  36b925:	83 c4 10             	add    $0x10,%esp
  36b928:	fa                   	cli    
  36b929:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b92c:	8b 50 08             	mov    0x8(%eax),%edx
  36b92f:	8b 45 08             	mov    0x8(%ebp),%eax
  36b932:	89 10                	mov    %edx,(%eax)
  36b934:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b937:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
  36b93b:	8d 50 ff             	lea    -0x1(%eax),%edx
  36b93e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b941:	66 89 50 0c          	mov    %dx,0xc(%eax)
  36b945:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b948:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
  36b94c:	66 85 c0             	test   %ax,%ax
  36b94f:	0f 85 a9 00 00 00    	jne    36b9fe <kfree_s+0x15f>
  36b955:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  36b959:	74 0b                	je     36b966 <kfree_s+0xc7>
  36b95b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36b95e:	8b 40 04             	mov    0x4(%eax),%eax
  36b961:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  36b964:	75 11                	jne    36b977 <kfree_s+0xd8>
  36b966:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  36b96a:	75 32                	jne    36b99e <kfree_s+0xff>
  36b96c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b96f:	8b 40 04             	mov    0x4(%eax),%eax
  36b972:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  36b975:	74 27                	je     36b99e <kfree_s+0xff>
  36b977:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b97a:	8b 40 04             	mov    0x4(%eax),%eax
  36b97d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36b980:	eb 16                	jmp    36b998 <kfree_s+0xf9>
  36b982:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36b985:	8b 40 04             	mov    0x4(%eax),%eax
  36b988:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  36b98b:	75 02                	jne    36b98f <kfree_s+0xf0>
  36b98d:	eb 0f                	jmp    36b99e <kfree_s+0xff>
  36b98f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36b992:	8b 40 04             	mov    0x4(%eax),%eax
  36b995:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36b998:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  36b99c:	75 e4                	jne    36b982 <kfree_s+0xe3>
  36b99e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  36b9a2:	74 0e                	je     36b9b2 <kfree_s+0x113>
  36b9a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b9a7:	8b 50 04             	mov    0x4(%eax),%edx
  36b9aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36b9ad:	89 50 04             	mov    %edx,0x4(%eax)
  36b9b0:	eb 27                	jmp    36b9d9 <kfree_s+0x13a>
  36b9b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b9b5:	8b 40 04             	mov    0x4(%eax),%eax
  36b9b8:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  36b9bb:	74 10                	je     36b9cd <kfree_s+0x12e>
  36b9bd:	83 ec 0c             	sub    $0xc,%esp
  36b9c0:	68 c6 e8 36 00       	push   $0x36e8c6
  36b9c5:	e8 a2 d6 ff ff       	call   36906c <panic>
  36b9ca:	83 c4 10             	add    $0x10,%esp
  36b9cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b9d0:	8b 50 04             	mov    0x4(%eax),%edx
  36b9d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36b9d6:	89 50 04             	mov    %edx,0x4(%eax)
  36b9d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b9dc:	8b 00                	mov    (%eax),%eax
  36b9de:	83 ec 0c             	sub    $0xc,%esp
  36b9e1:	50                   	push   %eax
  36b9e2:	e8 5e f9 ff ff       	call   36b345 <free_page>
  36b9e7:	83 c4 10             	add    $0x10,%esp
  36b9ea:	8b 15 58 38 37 00    	mov    0x373858,%edx
  36b9f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b9f3:	89 50 04             	mov    %edx,0x4(%eax)
  36b9f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36b9f9:	a3 58 38 37 00       	mov    %eax,0x373858
  36b9fe:	fb                   	sti    
  36b9ff:	c9                   	leave  
  36ba00:	c3                   	ret    

0036ba01 <strcpy>:
  36ba01:	55                   	push   %ebp
  36ba02:	89 e5                	mov    %esp,%ebp
  36ba04:	57                   	push   %edi
  36ba05:	56                   	push   %esi
  36ba06:	8b 55 0c             	mov    0xc(%ebp),%edx
  36ba09:	8b 4d 08             	mov    0x8(%ebp),%ecx
  36ba0c:	89 d6                	mov    %edx,%esi
  36ba0e:	89 cf                	mov    %ecx,%edi
  36ba10:	fc                   	cld    
  36ba11:	ac                   	lods   %ds:(%esi),%al
  36ba12:	aa                   	stos   %al,%es:(%edi)
  36ba13:	84 c0                	test   %al,%al
  36ba15:	75 fa                	jne    36ba11 <strcpy+0x10>
  36ba17:	8b 45 08             	mov    0x8(%ebp),%eax
  36ba1a:	5e                   	pop    %esi
  36ba1b:	5f                   	pop    %edi
  36ba1c:	5d                   	pop    %ebp
  36ba1d:	c3                   	ret    

0036ba1e <strcat>:
  36ba1e:	55                   	push   %ebp
  36ba1f:	89 e5                	mov    %esp,%ebp
  36ba21:	57                   	push   %edi
  36ba22:	56                   	push   %esi
  36ba23:	53                   	push   %ebx
  36ba24:	8b 55 0c             	mov    0xc(%ebp),%edx
  36ba27:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36ba2a:	b8 00 00 00 00       	mov    $0x0,%eax
  36ba2f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  36ba34:	89 d6                	mov    %edx,%esi
  36ba36:	89 df                	mov    %ebx,%edi
  36ba38:	fc                   	cld    
  36ba39:	f2 ae                	repnz scas %es:(%edi),%al
  36ba3b:	4f                   	dec    %edi
  36ba3c:	ac                   	lods   %ds:(%esi),%al
  36ba3d:	aa                   	stos   %al,%es:(%edi)
  36ba3e:	84 c0                	test   %al,%al
  36ba40:	75 fa                	jne    36ba3c <strcat+0x1e>
  36ba42:	8b 45 08             	mov    0x8(%ebp),%eax
  36ba45:	5b                   	pop    %ebx
  36ba46:	5e                   	pop    %esi
  36ba47:	5f                   	pop    %edi
  36ba48:	5d                   	pop    %ebp
  36ba49:	c3                   	ret    

0036ba4a <strlen>:
  36ba4a:	55                   	push   %ebp
  36ba4b:	89 e5                	mov    %esp,%ebp
  36ba4d:	57                   	push   %edi
  36ba4e:	8b 55 08             	mov    0x8(%ebp),%edx
  36ba51:	b8 00 00 00 00       	mov    $0x0,%eax
  36ba56:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  36ba5b:	89 d7                	mov    %edx,%edi
  36ba5d:	fc                   	cld    
  36ba5e:	f2 ae                	repnz scas %es:(%edi),%al
  36ba60:	f7 d1                	not    %ecx
  36ba62:	49                   	dec    %ecx
  36ba63:	89 c8                	mov    %ecx,%eax
  36ba65:	5f                   	pop    %edi
  36ba66:	5d                   	pop    %ebp
  36ba67:	c3                   	ret    

0036ba68 <exec>:
  36ba68:	55                   	push   %ebp
  36ba69:	89 e5                	mov    %esp,%ebp
  36ba6b:	57                   	push   %edi
  36ba6c:	56                   	push   %esi
  36ba6d:	53                   	push   %ebx
  36ba6e:	81 ec bc 00 00 00    	sub    $0xbc,%esp
  36ba74:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  36ba7b:	c7 85 43 ff ff ff 2f 	movl   $0x6e69622f,-0xbd(%ebp)
  36ba82:	62 69 6e 
  36ba85:	c7 85 47 ff ff ff 2f 	movl   $0x2f,-0xb9(%ebp)
  36ba8c:	00 00 00 
  36ba8f:	8d 85 4b ff ff ff    	lea    -0xb5(%ebp),%eax
  36ba95:	b9 75 00 00 00       	mov    $0x75,%ecx
  36ba9a:	bb 00 00 00 00       	mov    $0x0,%ebx
  36ba9f:	89 18                	mov    %ebx,(%eax)
  36baa1:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
  36baa5:	8d 50 04             	lea    0x4(%eax),%edx
  36baa8:	83 e2 fc             	and    $0xfffffffc,%edx
  36baab:	29 d0                	sub    %edx,%eax
  36baad:	01 c1                	add    %eax,%ecx
  36baaf:	83 e1 fc             	and    $0xfffffffc,%ecx
  36bab2:	c1 e9 02             	shr    $0x2,%ecx
  36bab5:	89 d7                	mov    %edx,%edi
  36bab7:	89 d8                	mov    %ebx,%eax
  36bab9:	f3 ab                	rep stos %eax,%es:(%edi)
  36babb:	8b 45 08             	mov    0x8(%ebp),%eax
  36babe:	0f b6 00             	movzbl (%eax),%eax
  36bac1:	3c 2e                	cmp    $0x2e,%al
  36bac3:	74 0a                	je     36bacf <exec+0x67>
  36bac5:	8b 45 08             	mov    0x8(%ebp),%eax
  36bac8:	0f b6 00             	movzbl (%eax),%eax
  36bacb:	3c 2f                	cmp    $0x2f,%al
  36bacd:	75 14                	jne    36bae3 <exec+0x7b>
  36bacf:	ff 75 08             	pushl  0x8(%ebp)
  36bad2:	8d 85 43 ff ff ff    	lea    -0xbd(%ebp),%eax
  36bad8:	50                   	push   %eax
  36bad9:	e8 23 ff ff ff       	call   36ba01 <strcpy>
  36bade:	83 c4 08             	add    $0x8,%esp
  36bae1:	eb 12                	jmp    36baf5 <exec+0x8d>
  36bae3:	ff 75 08             	pushl  0x8(%ebp)
  36bae6:	8d 85 43 ff ff ff    	lea    -0xbd(%ebp),%eax
  36baec:	50                   	push   %eax
  36baed:	e8 2c ff ff ff       	call   36ba1e <strcat>
  36baf2:	83 c4 08             	add    $0x8,%esp
  36baf5:	83 ec 08             	sub    $0x8,%esp
  36baf8:	6a 00                	push   $0x0
  36bafa:	8d 85 43 ff ff ff    	lea    -0xbd(%ebp),%eax
  36bb00:	50                   	push   %eax
  36bb01:	e8 85 09 00 00       	call   36c48b <open>
  36bb06:	83 c4 10             	add    $0x10,%esp
  36bb09:	89 45 d8             	mov    %eax,-0x28(%ebp)
  36bb0c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  36bb10:	79 05                	jns    36bb17 <exec+0xaf>
  36bb12:	e9 e1 00 00 00       	jmp    36bbf8 <exec+0x190>
  36bb17:	8b 45 d8             	mov    -0x28(%ebp),%eax
  36bb1a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  36bb1d:	b8 1f 00 00 00       	mov    $0x1f,%eax
  36bb22:	83 7d 0c 1f          	cmpl   $0x1f,0xc(%ebp)
  36bb26:	0f 4e 45 0c          	cmovle 0xc(%ebp),%eax
  36bb2a:	89 45 d0             	mov    %eax,-0x30(%ebp)
  36bb2d:	b8 04 00 00 00       	mov    $0x4,%eax
  36bb32:	bb 06 00 00 00       	mov    $0x6,%ebx
  36bb37:	b9 00 00 00 00       	mov    $0x0,%ecx
  36bb3c:	ba 00 00 00 00       	mov    $0x0,%edx
  36bb41:	be 00 00 00 00       	mov    $0x0,%esi
  36bb46:	bf 00 00 00 00       	mov    $0x0,%edi
  36bb4b:	cd 80                	int    $0x80
  36bb4d:	89 45 cc             	mov    %eax,-0x34(%ebp)
  36bb50:	8b 45 cc             	mov    -0x34(%ebp),%eax
  36bb53:	89 45 c8             	mov    %eax,-0x38(%ebp)
  36bb56:	8b 45 c8             	mov    -0x38(%ebp),%eax
  36bb59:	83 e8 80             	sub    $0xffffff80,%eax
  36bb5c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36bb5f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  36bb66:	eb 44                	jmp    36bbac <exec+0x144>
  36bb68:	8b 45 c8             	mov    -0x38(%ebp),%eax
  36bb6b:	8b 55 dc             	mov    -0x24(%ebp),%edx
  36bb6e:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  36bb71:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  36bb74:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36bb77:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  36bb7e:	8b 45 10             	mov    0x10(%ebp),%eax
  36bb81:	01 d0                	add    %edx,%eax
  36bb83:	8b 00                	mov    (%eax),%eax
  36bb85:	83 ec 08             	sub    $0x8,%esp
  36bb88:	50                   	push   %eax
  36bb89:	ff 75 e0             	pushl  -0x20(%ebp)
  36bb8c:	e8 70 fe ff ff       	call   36ba01 <strcpy>
  36bb91:	83 c4 10             	add    $0x10,%esp
  36bb94:	83 ec 0c             	sub    $0xc,%esp
  36bb97:	ff 75 e0             	pushl  -0x20(%ebp)
  36bb9a:	e8 ab fe ff ff       	call   36ba4a <strlen>
  36bb9f:	83 c4 10             	add    $0x10,%esp
  36bba2:	83 c0 01             	add    $0x1,%eax
  36bba5:	01 45 e0             	add    %eax,-0x20(%ebp)
  36bba8:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
  36bbac:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36bbaf:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  36bbb2:	72 b4                	jb     36bb68 <exec+0x100>
  36bbb4:	b8 01 00 00 00       	mov    $0x1,%eax
  36bbb9:	bb 03 00 00 00       	mov    $0x3,%ebx
  36bbbe:	b9 12 00 00 00       	mov    $0x12,%ecx
  36bbc3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  36bbc6:	8b 75 0c             	mov    0xc(%ebp),%esi
  36bbc9:	8b 7d c8             	mov    -0x38(%ebp),%edi
  36bbcc:	cd 80                	int    $0x80
  36bbce:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  36bbd1:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  36bbd4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36bbd7:	b8 04 00 00 00       	mov    $0x4,%eax
  36bbdc:	bb 05 00 00 00       	mov    $0x5,%ebx
  36bbe1:	8b 4d c8             	mov    -0x38(%ebp),%ecx
  36bbe4:	ba 00 00 00 00       	mov    $0x0,%edx
  36bbe9:	be 00 00 00 00       	mov    $0x0,%esi
  36bbee:	bf 00 00 00 00       	mov    $0x0,%edi
  36bbf3:	cd 80                	int    $0x80
  36bbf5:	89 45 c0             	mov    %eax,-0x40(%ebp)
  36bbf8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36bbfb:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36bbfe:	5b                   	pop    %ebx
  36bbff:	5e                   	pop    %esi
  36bc00:	5f                   	pop    %edi
  36bc01:	5d                   	pop    %ebp
  36bc02:	c3                   	ret    

0036bc03 <execvp>:
  36bc03:	55                   	push   %ebp
  36bc04:	89 e5                	mov    %esp,%ebp
  36bc06:	83 ec 18             	sub    $0x18,%esp
  36bc09:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
  36bc10:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  36bc17:	eb 32                	jmp    36bc4b <execvp+0x48>
  36bc19:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36bc1c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  36bc23:	8b 45 0c             	mov    0xc(%ebp),%eax
  36bc26:	01 d0                	add    %edx,%eax
  36bc28:	8b 00                	mov    (%eax),%eax
  36bc2a:	85 c0                	test   %eax,%eax
  36bc2c:	75 19                	jne    36bc47 <execvp+0x44>
  36bc2e:	83 ec 04             	sub    $0x4,%esp
  36bc31:	ff 75 0c             	pushl  0xc(%ebp)
  36bc34:	ff 75 f0             	pushl  -0x10(%ebp)
  36bc37:	ff 75 08             	pushl  0x8(%ebp)
  36bc3a:	e8 29 fe ff ff       	call   36ba68 <exec>
  36bc3f:	83 c4 10             	add    $0x10,%esp
  36bc42:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36bc45:	eb 0a                	jmp    36bc51 <execvp+0x4e>
  36bc47:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  36bc4b:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  36bc4f:	7e c8                	jle    36bc19 <execvp+0x16>
  36bc51:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36bc54:	c9                   	leave  
  36bc55:	c3                   	ret    

0036bc56 <lseek>:
  36bc56:	55                   	push   %ebp
  36bc57:	89 e5                	mov    %esp,%ebp
  36bc59:	57                   	push   %edi
  36bc5a:	56                   	push   %esi
  36bc5b:	53                   	push   %ebx
  36bc5c:	83 ec 10             	sub    $0x10,%esp
  36bc5f:	b8 01 00 00 00       	mov    $0x1,%eax
  36bc64:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36bc67:	b9 09 00 00 00       	mov    $0x9,%ecx
  36bc6c:	8b 55 10             	mov    0x10(%ebp),%edx
  36bc6f:	be 00 00 00 00       	mov    $0x0,%esi
  36bc74:	8b 7d 0c             	mov    0xc(%ebp),%edi
  36bc77:	cd 80                	int    $0x80
  36bc79:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36bc7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36bc7f:	83 c4 10             	add    $0x10,%esp
  36bc82:	5b                   	pop    %ebx
  36bc83:	5e                   	pop    %esi
  36bc84:	5f                   	pop    %edi
  36bc85:	5d                   	pop    %ebp
  36bc86:	c3                   	ret    

0036bc87 <fork>:
  36bc87:	55                   	push   %ebp
  36bc88:	89 e5                	mov    %esp,%ebp
  36bc8a:	57                   	push   %edi
  36bc8b:	56                   	push   %esi
  36bc8c:	53                   	push   %ebx
  36bc8d:	83 ec 10             	sub    $0x10,%esp
  36bc90:	b8 01 00 00 00       	mov    $0x1,%eax
  36bc95:	bb 03 00 00 00       	mov    $0x3,%ebx
  36bc9a:	b9 03 00 00 00       	mov    $0x3,%ecx
  36bc9f:	ba 00 00 00 00       	mov    $0x0,%edx
  36bca4:	be 00 00 00 00       	mov    $0x0,%esi
  36bca9:	bf 00 00 00 00       	mov    $0x0,%edi
  36bcae:	cd 80                	int    $0x80
  36bcb0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36bcb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36bcb6:	83 c4 10             	add    $0x10,%esp
  36bcb9:	5b                   	pop    %ebx
  36bcba:	5e                   	pop    %esi
  36bcbb:	5f                   	pop    %edi
  36bcbc:	5d                   	pop    %ebp
  36bcbd:	c3                   	ret    

0036bcbe <memcpy>:
  36bcbe:	55                   	push   %ebp
  36bcbf:	89 e5                	mov    %esp,%ebp
  36bcc1:	57                   	push   %edi
  36bcc2:	56                   	push   %esi
  36bcc3:	53                   	push   %ebx
  36bcc4:	8b 45 10             	mov    0x10(%ebp),%eax
  36bcc7:	8b 55 0c             	mov    0xc(%ebp),%edx
  36bcca:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36bccd:	89 c1                	mov    %eax,%ecx
  36bccf:	89 d6                	mov    %edx,%esi
  36bcd1:	89 df                	mov    %ebx,%edi
  36bcd3:	fc                   	cld    
  36bcd4:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  36bcd6:	8b 45 08             	mov    0x8(%ebp),%eax
  36bcd9:	5b                   	pop    %ebx
  36bcda:	5e                   	pop    %esi
  36bcdb:	5f                   	pop    %edi
  36bcdc:	5d                   	pop    %ebp
  36bcdd:	c3                   	ret    

0036bcde <read>:
  36bcde:	55                   	push   %ebp
  36bcdf:	89 e5                	mov    %esp,%ebp
  36bce1:	57                   	push   %edi
  36bce2:	56                   	push   %esi
  36bce3:	53                   	push   %ebx
  36bce4:	83 ec 20             	sub    $0x20,%esp
  36bce7:	b8 04 00 00 00       	mov    $0x4,%eax
  36bcec:	bb 06 00 00 00       	mov    $0x6,%ebx
  36bcf1:	b9 00 00 00 00       	mov    $0x0,%ecx
  36bcf6:	8b 55 10             	mov    0x10(%ebp),%edx
  36bcf9:	be 00 00 00 00       	mov    $0x0,%esi
  36bcfe:	bf 00 00 00 00       	mov    $0x0,%edi
  36bd03:	cd 80                	int    $0x80
  36bd05:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36bd08:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36bd0b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36bd0e:	b8 01 00 00 00       	mov    $0x1,%eax
  36bd13:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36bd16:	b9 05 00 00 00       	mov    $0x5,%ecx
  36bd1b:	8b 55 ec             	mov    -0x14(%ebp),%edx
  36bd1e:	be 00 00 00 00       	mov    $0x0,%esi
  36bd23:	8b 7d 10             	mov    0x10(%ebp),%edi
  36bd26:	cd 80                	int    $0x80
  36bd28:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36bd2b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36bd2e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36bd31:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  36bd35:	7e 11                	jle    36bd48 <read+0x6a>
  36bd37:	ff 75 e4             	pushl  -0x1c(%ebp)
  36bd3a:	ff 75 ec             	pushl  -0x14(%ebp)
  36bd3d:	ff 75 0c             	pushl  0xc(%ebp)
  36bd40:	e8 79 ff ff ff       	call   36bcbe <memcpy>
  36bd45:	83 c4 0c             	add    $0xc,%esp
  36bd48:	b8 04 00 00 00       	mov    $0x4,%eax
  36bd4d:	bb 05 00 00 00       	mov    $0x5,%ebx
  36bd52:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  36bd55:	ba 00 00 00 00       	mov    $0x0,%edx
  36bd5a:	be 00 00 00 00       	mov    $0x0,%esi
  36bd5f:	bf 00 00 00 00       	mov    $0x0,%edi
  36bd64:	cd 80                	int    $0x80
  36bd66:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36bd69:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36bd6c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36bd6f:	5b                   	pop    %ebx
  36bd70:	5e                   	pop    %esi
  36bd71:	5f                   	pop    %edi
  36bd72:	5d                   	pop    %ebp
  36bd73:	c3                   	ret    

0036bd74 <memset>:
  36bd74:	55                   	push   %ebp
  36bd75:	89 e5                	mov    %esp,%ebp
  36bd77:	57                   	push   %edi
  36bd78:	8b 45 0c             	mov    0xc(%ebp),%eax
  36bd7b:	8b 55 08             	mov    0x8(%ebp),%edx
  36bd7e:	8b 4d 10             	mov    0x10(%ebp),%ecx
  36bd81:	89 d7                	mov    %edx,%edi
  36bd83:	fc                   	cld    
  36bd84:	f3 aa                	rep stos %al,%es:(%edi)
  36bd86:	8b 45 08             	mov    0x8(%ebp),%eax
  36bd89:	5f                   	pop    %edi
  36bd8a:	5d                   	pop    %ebp
  36bd8b:	c3                   	ret    

0036bd8c <delMObject>:
  36bd8c:	55                   	push   %ebp
  36bd8d:	89 e5                	mov    %esp,%ebp
  36bd8f:	56                   	push   %esi
  36bd90:	53                   	push   %ebx
  36bd91:	83 ec 10             	sub    $0x10,%esp
  36bd94:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  36bd98:	75 17                	jne    36bdb1 <delMObject+0x25>
  36bd9a:	83 ec 0c             	sub    $0xc,%esp
  36bd9d:	68 e0 e8 36 00       	push   $0x36e8e0
  36bda2:	e8 93 0e 00 00       	call   36cc3a <printf>
  36bda7:	83 c4 10             	add    $0x10,%esp
  36bdaa:	b8 00 00 00 00       	mov    $0x0,%eax
  36bdaf:	eb 72                	jmp    36be23 <delMObject+0x97>
  36bdb1:	8b 45 08             	mov    0x8(%ebp),%eax
  36bdb4:	8b 40 0c             	mov    0xc(%eax),%eax
  36bdb7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36bdba:	8b 45 08             	mov    0x8(%ebp),%eax
  36bdbd:	8b 40 10             	mov    0x10(%eax),%eax
  36bdc0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36bdc3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  36bdc7:	74 0b                	je     36bdd4 <delMObject+0x48>
  36bdc9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36bdcc:	8b 55 f0             	mov    -0x10(%ebp),%edx
  36bdcf:	89 50 0c             	mov    %edx,0xc(%eax)
  36bdd2:	eb 33                	jmp    36be07 <delMObject+0x7b>
  36bdd4:	a1 68 38 37 00       	mov    0x373868,%eax
  36bdd9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36bde0:	eb 04                	jmp    36bde6 <delMObject+0x5a>
  36bde2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36bde6:	8b 55 08             	mov    0x8(%ebp),%edx
  36bde9:	8b 5a 08             	mov    0x8(%edx),%ebx
  36bdec:	8b 55 f4             	mov    -0xc(%ebp),%edx
  36bdef:	be 01 00 00 00       	mov    $0x1,%esi
  36bdf4:	89 d1                	mov    %edx,%ecx
  36bdf6:	d3 e6                	shl    %cl,%esi
  36bdf8:	89 f2                	mov    %esi,%edx
  36bdfa:	39 d3                	cmp    %edx,%ebx
  36bdfc:	77 e4                	ja     36bde2 <delMObject+0x56>
  36bdfe:	8b 55 f4             	mov    -0xc(%ebp),%edx
  36be01:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  36be04:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  36be07:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  36be0b:	74 09                	je     36be16 <delMObject+0x8a>
  36be0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36be10:	8b 55 ec             	mov    -0x14(%ebp),%edx
  36be13:	89 50 10             	mov    %edx,0x10(%eax)
  36be16:	8b 45 08             	mov    0x8(%ebp),%eax
  36be19:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
  36be20:	8b 45 08             	mov    0x8(%ebp),%eax
  36be23:	8d 65 f8             	lea    -0x8(%ebp),%esp
  36be26:	5b                   	pop    %ebx
  36be27:	5e                   	pop    %esi
  36be28:	5d                   	pop    %ebp
  36be29:	c3                   	ret    

0036be2a <insertMObject>:
  36be2a:	55                   	push   %ebp
  36be2b:	89 e5                	mov    %esp,%ebp
  36be2d:	83 ec 08             	sub    $0x8,%esp
  36be30:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  36be34:	75 17                	jne    36be4d <insertMObject+0x23>
  36be36:	83 ec 0c             	sub    $0xc,%esp
  36be39:	68 10 e9 36 00       	push   $0x36e910
  36be3e:	e8 f7 0d 00 00       	call   36cc3a <printf>
  36be43:	83 c4 10             	add    $0x10,%esp
  36be46:	b8 00 00 00 00       	mov    $0x0,%eax
  36be4b:	eb 2f                	jmp    36be7c <insertMObject+0x52>
  36be4d:	8b 45 0c             	mov    0xc(%ebp),%eax
  36be50:	8b 55 08             	mov    0x8(%ebp),%edx
  36be53:	89 50 0c             	mov    %edx,0xc(%eax)
  36be56:	8b 45 0c             	mov    0xc(%ebp),%eax
  36be59:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  36be60:	8b 45 0c             	mov    0xc(%ebp),%eax
  36be63:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  36be6a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  36be6e:	74 09                	je     36be79 <insertMObject+0x4f>
  36be70:	8b 45 08             	mov    0x8(%ebp),%eax
  36be73:	8b 55 0c             	mov    0xc(%ebp),%edx
  36be76:	89 50 10             	mov    %edx,0x10(%eax)
  36be79:	8b 45 0c             	mov    0xc(%ebp),%eax
  36be7c:	c9                   	leave  
  36be7d:	c3                   	ret    

0036be7e <splitMObject>:
  36be7e:	55                   	push   %ebp
  36be7f:	89 e5                	mov    %esp,%ebp
  36be81:	53                   	push   %ebx
  36be82:	83 ec 14             	sub    $0x14,%esp
  36be85:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  36be89:	75 1a                	jne    36bea5 <splitMObject+0x27>
  36be8b:	83 ec 0c             	sub    $0xc,%esp
  36be8e:	68 40 e9 36 00       	push   $0x36e940
  36be93:	e8 a2 0d 00 00       	call   36cc3a <printf>
  36be98:	83 c4 10             	add    $0x10,%esp
  36be9b:	b8 00 00 00 00       	mov    $0x0,%eax
  36bea0:	e9 df 00 00 00       	jmp    36bf84 <splitMObject+0x106>
  36bea5:	8b 45 08             	mov    0x8(%ebp),%eax
  36bea8:	8b 40 08             	mov    0x8(%eax),%eax
  36beab:	d1 e8                	shr    %eax
  36bead:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36beb0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36beb7:	eb 04                	jmp    36bebd <splitMObject+0x3f>
  36beb9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36bebd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36bec0:	ba 01 00 00 00       	mov    $0x1,%edx
  36bec5:	89 c1                	mov    %eax,%ecx
  36bec7:	d3 e2                	shl    %cl,%edx
  36bec9:	89 d0                	mov    %edx,%eax
  36becb:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  36bece:	72 e9                	jb     36beb9 <splitMObject+0x3b>
  36bed0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36bed3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36bed6:	8b 55 08             	mov    0x8(%ebp),%edx
  36bed9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36bedc:	01 d0                	add    %edx,%eax
  36bede:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36bee1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36bee4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  36beea:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  36bef1:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  36bef8:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  36beff:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  36bf06:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36bf09:	8b 55 08             	mov    0x8(%ebp),%edx
  36bf0c:	89 10                	mov    %edx,(%eax)
  36bf0e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36bf11:	8b 55 f0             	mov    -0x10(%ebp),%edx
  36bf14:	89 50 08             	mov    %edx,0x8(%eax)
  36bf17:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36bf1a:	8b 50 08             	mov    0x8(%eax),%edx
  36bf1d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36bf20:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  36bf23:	8b 15 68 38 37 00    	mov    0x373868,%edx
  36bf29:	a1 68 38 37 00       	mov    0x373868,%eax
  36bf2e:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
  36bf34:	83 e8 80             	sub    $0xffffff80,%eax
  36bf37:	01 d0                	add    %edx,%eax
  36bf39:	83 c0 04             	add    $0x4,%eax
  36bf3c:	39 c1                	cmp    %eax,%ecx
  36bf3e:	73 10                	jae    36bf50 <splitMObject+0xd2>
  36bf40:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36bf43:	8b 50 08             	mov    0x8(%eax),%edx
  36bf46:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36bf49:	01 c2                	add    %eax,%edx
  36bf4b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36bf4e:	89 02                	mov    %eax,(%edx)
  36bf50:	8b 1d 68 38 37 00    	mov    0x373868,%ebx
  36bf56:	a1 68 38 37 00       	mov    0x373868,%eax
  36bf5b:	8b 55 ec             	mov    -0x14(%ebp),%edx
  36bf5e:	8b 04 90             	mov    (%eax,%edx,4),%eax
  36bf61:	83 ec 08             	sub    $0x8,%esp
  36bf64:	ff 75 e8             	pushl  -0x18(%ebp)
  36bf67:	50                   	push   %eax
  36bf68:	e8 bd fe ff ff       	call   36be2a <insertMObject>
  36bf6d:	83 c4 10             	add    $0x10,%esp
  36bf70:	89 c2                	mov    %eax,%edx
  36bf72:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36bf75:	89 14 83             	mov    %edx,(%ebx,%eax,4)
  36bf78:	8b 45 08             	mov    0x8(%ebp),%eax
  36bf7b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  36bf7e:	89 50 08             	mov    %edx,0x8(%eax)
  36bf81:	8b 45 08             	mov    0x8(%ebp),%eax
  36bf84:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  36bf87:	c9                   	leave  
  36bf88:	c3                   	ret    

0036bf89 <mergerMObject>:
  36bf89:	55                   	push   %ebp
  36bf8a:	89 e5                	mov    %esp,%ebp
  36bf8c:	83 ec 08             	sub    $0x8,%esp
  36bf8f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  36bf93:	74 06                	je     36bf9b <mergerMObject+0x12>
  36bf95:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  36bf99:	75 1a                	jne    36bfb5 <mergerMObject+0x2c>
  36bf9b:	83 ec 0c             	sub    $0xc,%esp
  36bf9e:	68 6c e9 36 00       	push   $0x36e96c
  36bfa3:	e8 92 0c 00 00       	call   36cc3a <printf>
  36bfa8:	83 c4 10             	add    $0x10,%esp
  36bfab:	83 ec 0c             	sub    $0xc,%esp
  36bfae:	6a 01                	push   $0x1
  36bfb0:	e8 4c 0d 00 00       	call   36cd01 <exit>
  36bfb5:	8b 45 08             	mov    0x8(%ebp),%eax
  36bfb8:	8b 50 08             	mov    0x8(%eax),%edx
  36bfbb:	8b 45 08             	mov    0x8(%ebp),%eax
  36bfbe:	01 d0                	add    %edx,%eax
  36bfc0:	3b 45 0c             	cmp    0xc(%ebp),%eax
  36bfc3:	74 2e                	je     36bff3 <mergerMObject+0x6a>
  36bfc5:	8b 45 0c             	mov    0xc(%ebp),%eax
  36bfc8:	8b 50 08             	mov    0x8(%eax),%edx
  36bfcb:	8b 45 08             	mov    0x8(%ebp),%eax
  36bfce:	8b 40 08             	mov    0x8(%eax),%eax
  36bfd1:	83 ec 0c             	sub    $0xc,%esp
  36bfd4:	52                   	push   %edx
  36bfd5:	ff 75 0c             	pushl  0xc(%ebp)
  36bfd8:	50                   	push   %eax
  36bfd9:	ff 75 08             	pushl  0x8(%ebp)
  36bfdc:	68 98 e9 36 00       	push   $0x36e998
  36bfe1:	e8 54 0c 00 00       	call   36cc3a <printf>
  36bfe6:	83 c4 20             	add    $0x20,%esp
  36bfe9:	83 ec 0c             	sub    $0xc,%esp
  36bfec:	6a 01                	push   $0x1
  36bfee:	e8 0e 0d 00 00       	call   36cd01 <exit>
  36bff3:	8b 45 08             	mov    0x8(%ebp),%eax
  36bff6:	8b 50 08             	mov    0x8(%eax),%edx
  36bff9:	8b 45 0c             	mov    0xc(%ebp),%eax
  36bffc:	8b 40 08             	mov    0x8(%eax),%eax
  36bfff:	39 c2                	cmp    %eax,%edx
  36c001:	75 48                	jne    36c04b <mergerMObject+0xc2>
  36c003:	8b 45 08             	mov    0x8(%ebp),%eax
  36c006:	8b 40 08             	mov    0x8(%eax),%eax
  36c009:	8d 14 00             	lea    (%eax,%eax,1),%edx
  36c00c:	8b 45 08             	mov    0x8(%ebp),%eax
  36c00f:	89 50 08             	mov    %edx,0x8(%eax)
  36c012:	8b 45 08             	mov    0x8(%ebp),%eax
  36c015:	8b 50 08             	mov    0x8(%eax),%edx
  36c018:	8b 45 08             	mov    0x8(%ebp),%eax
  36c01b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  36c01e:	8b 15 68 38 37 00    	mov    0x373868,%edx
  36c024:	a1 68 38 37 00       	mov    0x373868,%eax
  36c029:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
  36c02f:	83 e8 80             	sub    $0xffffff80,%eax
  36c032:	01 d0                	add    %edx,%eax
  36c034:	83 c0 04             	add    $0x4,%eax
  36c037:	39 c1                	cmp    %eax,%ecx
  36c039:	73 10                	jae    36c04b <mergerMObject+0xc2>
  36c03b:	8b 45 08             	mov    0x8(%ebp),%eax
  36c03e:	8b 50 08             	mov    0x8(%eax),%edx
  36c041:	8b 45 08             	mov    0x8(%ebp),%eax
  36c044:	01 c2                	add    %eax,%edx
  36c046:	8b 45 08             	mov    0x8(%ebp),%eax
  36c049:	89 02                	mov    %eax,(%edx)
  36c04b:	8b 45 08             	mov    0x8(%ebp),%eax
  36c04e:	c9                   	leave  
  36c04f:	c3                   	ret    

0036c050 <getMObject>:
  36c050:	55                   	push   %ebp
  36c051:	89 e5                	mov    %esp,%ebp
  36c053:	83 ec 18             	sub    $0x18,%esp
  36c056:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  36c05a:	7f 06                	jg     36c062 <getMObject+0x12>
  36c05c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  36c060:	79 07                	jns    36c069 <getMObject+0x19>
  36c062:	b8 00 00 00 00       	mov    $0x0,%eax
  36c067:	eb 5a                	jmp    36c0c3 <getMObject+0x73>
  36c069:	a1 68 38 37 00       	mov    0x373868,%eax
  36c06e:	8b 55 08             	mov    0x8(%ebp),%edx
  36c071:	8b 04 90             	mov    (%eax,%edx,4),%eax
  36c074:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36c077:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36c07b:	74 16                	je     36c093 <getMObject+0x43>
  36c07d:	83 ec 0c             	sub    $0xc,%esp
  36c080:	ff 75 f4             	pushl  -0xc(%ebp)
  36c083:	e8 04 fd ff ff       	call   36bd8c <delMObject>
  36c088:	83 c4 10             	add    $0x10,%esp
  36c08b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36c08e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36c091:	eb 30                	jmp    36c0c3 <getMObject+0x73>
  36c093:	8b 45 08             	mov    0x8(%ebp),%eax
  36c096:	83 c0 01             	add    $0x1,%eax
  36c099:	83 ec 0c             	sub    $0xc,%esp
  36c09c:	50                   	push   %eax
  36c09d:	e8 ae ff ff ff       	call   36c050 <getMObject>
  36c0a2:	83 c4 10             	add    $0x10,%esp
  36c0a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36c0a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36c0ac:	75 07                	jne    36c0b5 <getMObject+0x65>
  36c0ae:	b8 00 00 00 00       	mov    $0x0,%eax
  36c0b3:	eb 0e                	jmp    36c0c3 <getMObject+0x73>
  36c0b5:	83 ec 0c             	sub    $0xc,%esp
  36c0b8:	ff 75 f4             	pushl  -0xc(%ebp)
  36c0bb:	e8 be fd ff ff       	call   36be7e <splitMObject>
  36c0c0:	83 c4 10             	add    $0x10,%esp
  36c0c3:	c9                   	leave  
  36c0c4:	c3                   	ret    

0036c0c5 <realizeMHeap>:
  36c0c5:	55                   	push   %ebp
  36c0c6:	89 e5                	mov    %esp,%ebp
  36c0c8:	53                   	push   %ebx
  36c0c9:	83 ec 14             	sub    $0x14,%esp
  36c0cc:	a1 68 38 37 00       	mov    0x373868,%eax
  36c0d1:	85 c0                	test   %eax,%eax
  36c0d3:	74 25                	je     36c0fa <realizeMHeap+0x35>
  36c0d5:	a1 68 38 37 00       	mov    0x373868,%eax
  36c0da:	83 ec 04             	sub    $0x4,%esp
  36c0dd:	68 68 38 37 00       	push   $0x373868
  36c0e2:	50                   	push   %eax
  36c0e3:	68 f8 e9 36 00       	push   $0x36e9f8
  36c0e8:	e8 4d 0b 00 00       	call   36cc3a <printf>
  36c0ed:	83 c4 10             	add    $0x10,%esp
  36c0f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  36c0f5:	e9 26 01 00 00       	jmp    36c220 <realizeMHeap+0x15b>
  36c0fa:	81 45 08 84 00 00 00 	addl   $0x84,0x8(%ebp)
  36c101:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36c108:	eb 04                	jmp    36c10e <realizeMHeap+0x49>
  36c10a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36c10e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36c111:	ba 01 00 00 00       	mov    $0x1,%edx
  36c116:	89 c1                	mov    %eax,%ecx
  36c118:	d3 e2                	shl    %cl,%edx
  36c11a:	89 d0                	mov    %edx,%eax
  36c11c:	3b 45 08             	cmp    0x8(%ebp),%eax
  36c11f:	72 e9                	jb     36c10a <realizeMHeap+0x45>
  36c121:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36c124:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36c127:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  36c12b:	7f 06                	jg     36c133 <realizeMHeap+0x6e>
  36c12d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  36c131:	79 22                	jns    36c155 <realizeMHeap+0x90>
  36c133:	83 ec 04             	sub    $0x4,%esp
  36c136:	ff 75 08             	pushl  0x8(%ebp)
  36c139:	68 7c ff ff 7f       	push   $0x7fffff7c
  36c13e:	68 38 ea 36 00       	push   $0x36ea38
  36c143:	e8 f2 0a 00 00       	call   36cc3a <printf>
  36c148:	83 c4 10             	add    $0x10,%esp
  36c14b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  36c150:	e9 cb 00 00 00       	jmp    36c220 <realizeMHeap+0x15b>
  36c155:	c7 05 68 38 37 00 00 	movl   $0x374900,0x373868
  36c15c:	49 37 00 
  36c15f:	a1 68 38 37 00       	mov    0x373868,%eax
  36c164:	85 c0                	test   %eax,%eax
  36c166:	75 1a                	jne    36c182 <realizeMHeap+0xbd>
  36c168:	83 ec 0c             	sub    $0xc,%esp
  36c16b:	68 74 ea 36 00       	push   $0x36ea74
  36c170:	e8 c5 0a 00 00       	call   36cc3a <printf>
  36c175:	83 c4 10             	add    $0x10,%esp
  36c178:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  36c17d:	e9 9e 00 00 00       	jmp    36c220 <realizeMHeap+0x15b>
  36c182:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36c185:	ba 01 00 00 00       	mov    $0x1,%edx
  36c18a:	89 c1                	mov    %eax,%ecx
  36c18c:	d3 e2                	shl    %cl,%edx
  36c18e:	89 d0                	mov    %edx,%eax
  36c190:	8d 90 84 00 00 00    	lea    0x84(%eax),%edx
  36c196:	a1 68 38 37 00       	mov    0x373868,%eax
  36c19b:	83 ec 04             	sub    $0x4,%esp
  36c19e:	52                   	push   %edx
  36c19f:	6a 00                	push   $0x0
  36c1a1:	50                   	push   %eax
  36c1a2:	e8 cd fb ff ff       	call   36bd74 <memset>
  36c1a7:	83 c4 10             	add    $0x10,%esp
  36c1aa:	a1 68 38 37 00       	mov    0x373868,%eax
  36c1af:	8b 55 f0             	mov    -0x10(%ebp),%edx
  36c1b2:	bb 01 00 00 00       	mov    $0x1,%ebx
  36c1b7:	89 d1                	mov    %edx,%ecx
  36c1b9:	d3 e3                	shl    %cl,%ebx
  36c1bb:	89 da                	mov    %ebx,%edx
  36c1bd:	89 90 80 00 00 00    	mov    %edx,0x80(%eax)
  36c1c3:	a1 68 38 37 00       	mov    0x373868,%eax
  36c1c8:	05 84 00 00 00       	add    $0x84,%eax
  36c1cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36c1d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36c1d3:	ba 01 00 00 00       	mov    $0x1,%edx
  36c1d8:	89 c1                	mov    %eax,%ecx
  36c1da:	d3 e2                	shl    %cl,%edx
  36c1dc:	89 d0                	mov    %edx,%eax
  36c1de:	89 c2                	mov    %eax,%edx
  36c1e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36c1e3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  36c1e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36c1ec:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  36c1f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36c1f6:	89 50 08             	mov    %edx,0x8(%eax)
  36c1f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36c1fc:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  36c203:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36c206:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
  36c20d:	a1 68 38 37 00       	mov    0x373868,%eax
  36c212:	8b 55 f0             	mov    -0x10(%ebp),%edx
  36c215:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  36c218:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
  36c21b:	b8 00 00 00 00       	mov    $0x0,%eax
  36c220:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  36c223:	c9                   	leave  
  36c224:	c3                   	ret    

0036c225 <domalloc>:
  36c225:	55                   	push   %ebp
  36c226:	89 e5                	mov    %esp,%ebp
  36c228:	83 ec 18             	sub    $0x18,%esp
  36c22b:	83 45 08 0c          	addl   $0xc,0x8(%ebp)
  36c22f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36c236:	eb 04                	jmp    36c23c <domalloc+0x17>
  36c238:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36c23c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36c23f:	ba 01 00 00 00       	mov    $0x1,%edx
  36c244:	89 c1                	mov    %eax,%ecx
  36c246:	d3 e2                	shl    %cl,%edx
  36c248:	89 d0                	mov    %edx,%eax
  36c24a:	3b 45 08             	cmp    0x8(%ebp),%eax
  36c24d:	72 e9                	jb     36c238 <domalloc+0x13>
  36c24f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36c252:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36c255:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  36c259:	7f 06                	jg     36c261 <domalloc+0x3c>
  36c25b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  36c25f:	79 1f                	jns    36c280 <domalloc+0x5b>
  36c261:	83 ec 04             	sub    $0x4,%esp
  36c264:	ff 75 08             	pushl  0x8(%ebp)
  36c267:	68 68 ff ff 7f       	push   $0x7fffff68
  36c26c:	68 a8 ea 36 00       	push   $0x36eaa8
  36c271:	e8 c4 09 00 00       	call   36cc3a <printf>
  36c276:	83 c4 10             	add    $0x10,%esp
  36c279:	b8 00 00 00 00       	mov    $0x0,%eax
  36c27e:	eb 24                	jmp    36c2a4 <domalloc+0x7f>
  36c280:	83 ec 0c             	sub    $0xc,%esp
  36c283:	ff 75 f0             	pushl  -0x10(%ebp)
  36c286:	e8 c5 fd ff ff       	call   36c050 <getMObject>
  36c28b:	83 c4 10             	add    $0x10,%esp
  36c28e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36c291:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  36c295:	74 08                	je     36c29f <domalloc+0x7a>
  36c297:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36c29a:	83 c0 0c             	add    $0xc,%eax
  36c29d:	eb 05                	jmp    36c2a4 <domalloc+0x7f>
  36c29f:	b8 00 00 00 00       	mov    $0x0,%eax
  36c2a4:	c9                   	leave  
  36c2a5:	c3                   	ret    

0036c2a6 <free>:
  36c2a6:	55                   	push   %ebp
  36c2a7:	89 e5                	mov    %esp,%ebp
  36c2a9:	53                   	push   %ebx
  36c2aa:	83 ec 24             	sub    $0x24,%esp
  36c2ad:	8b 45 08             	mov    0x8(%ebp),%eax
  36c2b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36c2b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36c2b6:	83 e8 0c             	sub    $0xc,%eax
  36c2b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36c2bc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  36c2c0:	74 2d                	je     36c2ef <free+0x49>
  36c2c2:	8b 15 68 38 37 00    	mov    0x373868,%edx
  36c2c8:	a1 68 38 37 00       	mov    0x373868,%eax
  36c2cd:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
  36c2d3:	83 e8 80             	sub    $0xffffff80,%eax
  36c2d6:	01 d0                	add    %edx,%eax
  36c2d8:	83 c0 04             	add    $0x4,%eax
  36c2db:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  36c2de:	72 0f                	jb     36c2ef <free+0x49>
  36c2e0:	a1 68 38 37 00       	mov    0x373868,%eax
  36c2e5:	05 84 00 00 00       	add    $0x84,%eax
  36c2ea:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  36c2ed:	76 18                	jbe    36c307 <free+0x61>
  36c2ef:	83 ec 08             	sub    $0x8,%esp
  36c2f2:	ff 75 08             	pushl  0x8(%ebp)
  36c2f5:	68 e0 ea 36 00       	push   $0x36eae0
  36c2fa:	e8 3b 09 00 00       	call   36cc3a <printf>
  36c2ff:	83 c4 10             	add    $0x10,%esp
  36c302:	e9 f9 00 00 00       	jmp    36c400 <free+0x15a>
  36c307:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36c30a:	8b 00                	mov    (%eax),%eax
  36c30c:	85 c0                	test   %eax,%eax
  36c30e:	74 37                	je     36c347 <free+0xa1>
  36c310:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36c313:	8b 00                	mov    (%eax),%eax
  36c315:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36c318:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36c31b:	8b 40 04             	mov    0x4(%eax),%eax
  36c31e:	85 c0                	test   %eax,%eax
  36c320:	75 25                	jne    36c347 <free+0xa1>
  36c322:	83 ec 0c             	sub    $0xc,%esp
  36c325:	ff 75 e8             	pushl  -0x18(%ebp)
  36c328:	e8 5f fa ff ff       	call   36bd8c <delMObject>
  36c32d:	83 c4 10             	add    $0x10,%esp
  36c330:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36c333:	83 ec 08             	sub    $0x8,%esp
  36c336:	ff 75 f4             	pushl  -0xc(%ebp)
  36c339:	ff 75 e8             	pushl  -0x18(%ebp)
  36c33c:	e8 48 fc ff ff       	call   36bf89 <mergerMObject>
  36c341:	83 c4 10             	add    $0x10,%esp
  36c344:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36c347:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36c34a:	8b 50 08             	mov    0x8(%eax),%edx
  36c34d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36c350:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  36c353:	8b 15 68 38 37 00    	mov    0x373868,%edx
  36c359:	a1 68 38 37 00       	mov    0x373868,%eax
  36c35e:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
  36c364:	83 e8 80             	sub    $0xffffff80,%eax
  36c367:	01 d0                	add    %edx,%eax
  36c369:	83 c0 04             	add    $0x4,%eax
  36c36c:	39 c1                	cmp    %eax,%ecx
  36c36e:	73 3d                	jae    36c3ad <free+0x107>
  36c370:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36c373:	8b 50 08             	mov    0x8(%eax),%edx
  36c376:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36c379:	01 d0                	add    %edx,%eax
  36c37b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36c37e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36c381:	8b 40 04             	mov    0x4(%eax),%eax
  36c384:	85 c0                	test   %eax,%eax
  36c386:	75 25                	jne    36c3ad <free+0x107>
  36c388:	83 ec 0c             	sub    $0xc,%esp
  36c38b:	ff 75 e4             	pushl  -0x1c(%ebp)
  36c38e:	e8 f9 f9 ff ff       	call   36bd8c <delMObject>
  36c393:	83 c4 10             	add    $0x10,%esp
  36c396:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36c399:	83 ec 08             	sub    $0x8,%esp
  36c39c:	ff 75 e4             	pushl  -0x1c(%ebp)
  36c39f:	ff 75 f4             	pushl  -0xc(%ebp)
  36c3a2:	e8 e2 fb ff ff       	call   36bf89 <mergerMObject>
  36c3a7:	83 c4 10             	add    $0x10,%esp
  36c3aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36c3ad:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  36c3b4:	eb 04                	jmp    36c3ba <free+0x114>
  36c3b6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  36c3ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36c3bd:	8b 50 08             	mov    0x8(%eax),%edx
  36c3c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36c3c3:	bb 01 00 00 00       	mov    $0x1,%ebx
  36c3c8:	89 c1                	mov    %eax,%ecx
  36c3ca:	d3 e3                	shl    %cl,%ebx
  36c3cc:	89 d8                	mov    %ebx,%eax
  36c3ce:	39 c2                	cmp    %eax,%edx
  36c3d0:	77 e4                	ja     36c3b6 <free+0x110>
  36c3d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36c3d5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36c3d8:	8b 1d 68 38 37 00    	mov    0x373868,%ebx
  36c3de:	a1 68 38 37 00       	mov    0x373868,%eax
  36c3e3:	8b 55 e0             	mov    -0x20(%ebp),%edx
  36c3e6:	8b 04 90             	mov    (%eax,%edx,4),%eax
  36c3e9:	83 ec 08             	sub    $0x8,%esp
  36c3ec:	ff 75 f4             	pushl  -0xc(%ebp)
  36c3ef:	50                   	push   %eax
  36c3f0:	e8 35 fa ff ff       	call   36be2a <insertMObject>
  36c3f5:	83 c4 10             	add    $0x10,%esp
  36c3f8:	89 c2                	mov    %eax,%edx
  36c3fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
  36c3fd:	89 14 83             	mov    %edx,(%ebx,%eax,4)
  36c400:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  36c403:	c9                   	leave  
  36c404:	c3                   	ret    

0036c405 <realize>:
  36c405:	55                   	push   %ebp
  36c406:	89 e5                	mov    %esp,%ebp
  36c408:	83 ec 18             	sub    $0x18,%esp
  36c40b:	83 ec 0c             	sub    $0xc,%esp
  36c40e:	68 00 00 40 00       	push   $0x400000
  36c413:	e8 ad fc ff ff       	call   36c0c5 <realizeMHeap>
  36c418:	83 c4 10             	add    $0x10,%esp
  36c41b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36c41e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  36c422:	79 17                	jns    36c43b <realize+0x36>
  36c424:	83 ec 0c             	sub    $0xc,%esp
  36c427:	68 10 eb 36 00       	push   $0x36eb10
  36c42c:	e8 09 08 00 00       	call   36cc3a <printf>
  36c431:	83 c4 10             	add    $0x10,%esp
  36c434:	b8 00 00 00 00       	mov    $0x0,%eax
  36c439:	eb 18                	jmp    36c453 <realize+0x4e>
  36c43b:	c7 05 90 31 37 00 25 	movl   $0x36c225,0x373190
  36c442:	c2 36 00 
  36c445:	83 ec 0c             	sub    $0xc,%esp
  36c448:	ff 75 08             	pushl  0x8(%ebp)
  36c44b:	e8 d5 fd ff ff       	call   36c225 <domalloc>
  36c450:	83 c4 10             	add    $0x10,%esp
  36c453:	c9                   	leave  
  36c454:	c3                   	ret    

0036c455 <malloc>:
  36c455:	55                   	push   %ebp
  36c456:	89 e5                	mov    %esp,%ebp
  36c458:	83 ec 08             	sub    $0x8,%esp
  36c45b:	a1 90 31 37 00       	mov    0x373190,%eax
  36c460:	83 ec 0c             	sub    $0xc,%esp
  36c463:	ff 75 08             	pushl  0x8(%ebp)
  36c466:	ff d0                	call   *%eax
  36c468:	83 c4 10             	add    $0x10,%esp
  36c46b:	c9                   	leave  
  36c46c:	c3                   	ret    

0036c46d <strlen>:
  36c46d:	55                   	push   %ebp
  36c46e:	89 e5                	mov    %esp,%ebp
  36c470:	57                   	push   %edi
  36c471:	8b 55 08             	mov    0x8(%ebp),%edx
  36c474:	b8 00 00 00 00       	mov    $0x0,%eax
  36c479:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  36c47e:	89 d7                	mov    %edx,%edi
  36c480:	fc                   	cld    
  36c481:	f2 ae                	repnz scas %es:(%edi),%al
  36c483:	f7 d1                	not    %ecx
  36c485:	49                   	dec    %ecx
  36c486:	89 c8                	mov    %ecx,%eax
  36c488:	5f                   	pop    %edi
  36c489:	5d                   	pop    %ebp
  36c48a:	c3                   	ret    

0036c48b <open>:
  36c48b:	55                   	push   %ebp
  36c48c:	89 e5                	mov    %esp,%ebp
  36c48e:	57                   	push   %edi
  36c48f:	56                   	push   %esi
  36c490:	53                   	push   %ebx
  36c491:	83 ec 20             	sub    $0x20,%esp
  36c494:	ff 75 08             	pushl  0x8(%ebp)
  36c497:	e8 d1 ff ff ff       	call   36c46d <strlen>
  36c49c:	83 c4 04             	add    $0x4,%esp
  36c49f:	8d 50 01             	lea    0x1(%eax),%edx
  36c4a2:	b8 04 00 00 00       	mov    $0x4,%eax
  36c4a7:	bb 06 00 00 00       	mov    $0x6,%ebx
  36c4ac:	8b 4d 08             	mov    0x8(%ebp),%ecx
  36c4af:	be 00 00 00 00       	mov    $0x0,%esi
  36c4b4:	bf 00 00 00 00       	mov    $0x0,%edi
  36c4b9:	cd 80                	int    $0x80
  36c4bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36c4be:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36c4c1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36c4c4:	8d 45 10             	lea    0x10(%ebp),%eax
  36c4c7:	89 45 dc             	mov    %eax,-0x24(%ebp)
  36c4ca:	b8 01 00 00 00       	mov    $0x1,%eax
  36c4cf:	bb 09 00 00 00       	mov    $0x9,%ebx
  36c4d4:	b9 00 00 00 00       	mov    $0x0,%ecx
  36c4d9:	8b 55 ec             	mov    -0x14(%ebp),%edx
  36c4dc:	be 00 00 00 00       	mov    $0x0,%esi
  36c4e1:	8b 7d 0c             	mov    0xc(%ebp),%edi
  36c4e4:	cd 80                	int    $0x80
  36c4e6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36c4e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36c4ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36c4ef:	b8 04 00 00 00       	mov    $0x4,%eax
  36c4f4:	bb 05 00 00 00       	mov    $0x5,%ebx
  36c4f9:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  36c4fc:	ba 00 00 00 00       	mov    $0x0,%edx
  36c501:	be 00 00 00 00       	mov    $0x0,%esi
  36c506:	bf 00 00 00 00       	mov    $0x0,%edi
  36c50b:	cd 80                	int    $0x80
  36c50d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36c510:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36c513:	8d 65 f4             	lea    -0xc(%ebp),%esp
  36c516:	5b                   	pop    %ebx
  36c517:	5e                   	pop    %esi
  36c518:	5f                   	pop    %edi
  36c519:	5d                   	pop    %ebp
  36c51a:	c3                   	ret    

0036c51b <close>:
  36c51b:	55                   	push   %ebp
  36c51c:	89 e5                	mov    %esp,%ebp
  36c51e:	57                   	push   %edi
  36c51f:	56                   	push   %esi
  36c520:	53                   	push   %ebx
  36c521:	83 ec 10             	sub    $0x10,%esp
  36c524:	b8 01 00 00 00       	mov    $0x1,%eax
  36c529:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36c52c:	b9 01 00 00 00       	mov    $0x1,%ecx
  36c531:	ba 00 00 00 00       	mov    $0x0,%edx
  36c536:	be 00 00 00 00       	mov    $0x0,%esi
  36c53b:	bf 00 00 00 00       	mov    $0x0,%edi
  36c540:	cd 80                	int    $0x80
  36c542:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36c545:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36c548:	83 c4 10             	add    $0x10,%esp
  36c54b:	5b                   	pop    %ebx
  36c54c:	5e                   	pop    %esi
  36c54d:	5f                   	pop    %edi
  36c54e:	5d                   	pop    %ebp
  36c54f:	c3                   	ret    

0036c550 <strlen>:
  36c550:	55                   	push   %ebp
  36c551:	89 e5                	mov    %esp,%ebp
  36c553:	57                   	push   %edi
  36c554:	8b 55 08             	mov    0x8(%ebp),%edx
  36c557:	b8 00 00 00 00       	mov    $0x0,%eax
  36c55c:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  36c561:	89 d7                	mov    %edx,%edi
  36c563:	fc                   	cld    
  36c564:	f2 ae                	repnz scas %es:(%edi),%al
  36c566:	f7 d1                	not    %ecx
  36c568:	49                   	dec    %ecx
  36c569:	89 c8                	mov    %ecx,%eax
  36c56b:	5f                   	pop    %edi
  36c56c:	5d                   	pop    %ebp
  36c56d:	c3                   	ret    

0036c56e <memcpy>:
  36c56e:	55                   	push   %ebp
  36c56f:	89 e5                	mov    %esp,%ebp
  36c571:	57                   	push   %edi
  36c572:	56                   	push   %esi
  36c573:	53                   	push   %ebx
  36c574:	8b 45 10             	mov    0x10(%ebp),%eax
  36c577:	8b 55 0c             	mov    0xc(%ebp),%edx
  36c57a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36c57d:	89 c1                	mov    %eax,%ecx
  36c57f:	89 d6                	mov    %edx,%esi
  36c581:	89 df                	mov    %ebx,%edi
  36c583:	fc                   	cld    
  36c584:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  36c586:	8b 45 08             	mov    0x8(%ebp),%eax
  36c589:	5b                   	pop    %ebx
  36c58a:	5e                   	pop    %esi
  36c58b:	5f                   	pop    %edi
  36c58c:	5d                   	pop    %ebp
  36c58d:	c3                   	ret    

0036c58e <_atoi>:
  36c58e:	55                   	push   %ebp
  36c58f:	89 e5                	mov    %esp,%ebp
  36c591:	53                   	push   %ebx
  36c592:	83 ec 10             	sub    $0x10,%esp
  36c595:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  36c59c:	eb 29                	jmp    36c5c7 <_atoi+0x39>
  36c59e:	8b 55 f8             	mov    -0x8(%ebp),%edx
  36c5a1:	89 d0                	mov    %edx,%eax
  36c5a3:	c1 e0 02             	shl    $0x2,%eax
  36c5a6:	01 d0                	add    %edx,%eax
  36c5a8:	01 c0                	add    %eax,%eax
  36c5aa:	89 c3                	mov    %eax,%ebx
  36c5ac:	8b 45 08             	mov    0x8(%ebp),%eax
  36c5af:	8b 00                	mov    (%eax),%eax
  36c5b1:	8d 48 01             	lea    0x1(%eax),%ecx
  36c5b4:	8b 55 08             	mov    0x8(%ebp),%edx
  36c5b7:	89 0a                	mov    %ecx,(%edx)
  36c5b9:	0f b6 00             	movzbl (%eax),%eax
  36c5bc:	0f be c0             	movsbl %al,%eax
  36c5bf:	01 d8                	add    %ebx,%eax
  36c5c1:	83 e8 30             	sub    $0x30,%eax
  36c5c4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  36c5c7:	8b 45 08             	mov    0x8(%ebp),%eax
  36c5ca:	8b 00                	mov    (%eax),%eax
  36c5cc:	0f b6 00             	movzbl (%eax),%eax
  36c5cf:	3c 2f                	cmp    $0x2f,%al
  36c5d1:	7e 0c                	jle    36c5df <_atoi+0x51>
  36c5d3:	8b 45 08             	mov    0x8(%ebp),%eax
  36c5d6:	8b 00                	mov    (%eax),%eax
  36c5d8:	0f b6 00             	movzbl (%eax),%eax
  36c5db:	3c 39                	cmp    $0x39,%al
  36c5dd:	7e bf                	jle    36c59e <_atoi+0x10>
  36c5df:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36c5e2:	83 c4 10             	add    $0x10,%esp
  36c5e5:	5b                   	pop    %ebx
  36c5e6:	5d                   	pop    %ebp
  36c5e7:	c3                   	ret    

0036c5e8 <_octal>:
  36c5e8:	55                   	push   %ebp
  36c5e9:	89 e5                	mov    %esp,%ebp
  36c5eb:	83 ec 10             	sub    $0x10,%esp
  36c5ee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  36c5f5:	8b 45 08             	mov    0x8(%ebp),%eax
  36c5f8:	8d 50 04             	lea    0x4(%eax),%edx
  36c5fb:	89 55 08             	mov    %edx,0x8(%ebp)
  36c5fe:	8b 55 0c             	mov    0xc(%ebp),%edx
  36c601:	83 e2 07             	and    $0x7,%edx
  36c604:	89 10                	mov    %edx,(%eax)
  36c606:	c1 6d 0c 03          	shrl   $0x3,0xc(%ebp)
  36c60a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  36c60e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  36c612:	75 e1                	jne    36c5f5 <_octal+0xd>
  36c614:	8b 45 fc             	mov    -0x4(%ebp),%eax
  36c617:	c9                   	leave  
  36c618:	c3                   	ret    

0036c619 <_decimal>:
  36c619:	55                   	push   %ebp
  36c61a:	89 e5                	mov    %esp,%ebp
  36c61c:	53                   	push   %ebx
  36c61d:	83 ec 10             	sub    $0x10,%esp
  36c620:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  36c627:	8b 4d 08             	mov    0x8(%ebp),%ecx
  36c62a:	8d 41 04             	lea    0x4(%ecx),%eax
  36c62d:	89 45 08             	mov    %eax,0x8(%ebp)
  36c630:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  36c633:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  36c638:	89 d8                	mov    %ebx,%eax
  36c63a:	f7 e2                	mul    %edx
  36c63c:	c1 ea 03             	shr    $0x3,%edx
  36c63f:	89 d0                	mov    %edx,%eax
  36c641:	c1 e0 02             	shl    $0x2,%eax
  36c644:	01 d0                	add    %edx,%eax
  36c646:	01 c0                	add    %eax,%eax
  36c648:	29 c3                	sub    %eax,%ebx
  36c64a:	89 da                	mov    %ebx,%edx
  36c64c:	89 d0                	mov    %edx,%eax
  36c64e:	89 01                	mov    %eax,(%ecx)
  36c650:	8b 45 0c             	mov    0xc(%ebp),%eax
  36c653:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  36c658:	f7 e2                	mul    %edx
  36c65a:	89 d0                	mov    %edx,%eax
  36c65c:	c1 e8 03             	shr    $0x3,%eax
  36c65f:	89 45 0c             	mov    %eax,0xc(%ebp)
  36c662:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  36c666:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  36c66a:	75 bb                	jne    36c627 <_decimal+0xe>
  36c66c:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36c66f:	83 c4 10             	add    $0x10,%esp
  36c672:	5b                   	pop    %ebx
  36c673:	5d                   	pop    %ebp
  36c674:	c3                   	ret    

0036c675 <_hex>:
  36c675:	55                   	push   %ebp
  36c676:	89 e5                	mov    %esp,%ebp
  36c678:	83 ec 10             	sub    $0x10,%esp
  36c67b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  36c682:	8b 45 08             	mov    0x8(%ebp),%eax
  36c685:	8d 50 04             	lea    0x4(%eax),%edx
  36c688:	89 55 08             	mov    %edx,0x8(%ebp)
  36c68b:	8b 55 0c             	mov    0xc(%ebp),%edx
  36c68e:	83 e2 0f             	and    $0xf,%edx
  36c691:	89 10                	mov    %edx,(%eax)
  36c693:	c1 6d 0c 04          	shrl   $0x4,0xc(%ebp)
  36c697:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  36c69b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  36c69f:	75 e1                	jne    36c682 <_hex+0xd>
  36c6a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  36c6a4:	c9                   	leave  
  36c6a5:	c3                   	ret    

0036c6a6 <_toNumber>:
  36c6a6:	55                   	push   %ebp
  36c6a7:	89 e5                	mov    %esp,%ebp
  36c6a9:	81 ec 18 01 00 00    	sub    $0x118,%esp
  36c6af:	8b 45 0c             	mov    0xc(%ebp),%eax
  36c6b2:	89 85 e8 fe ff ff    	mov    %eax,-0x118(%ebp)
  36c6b8:	8b 45 10             	mov    0x10(%ebp),%eax
  36c6bb:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
  36c6c1:	c6 45 ff 2b          	movb   $0x2b,-0x1(%ebp)
  36c6c5:	c7 45 f8 34 eb 36 00 	movl   $0x36eb34,-0x8(%ebp)
  36c6cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36c6d3:	8b 45 20             	mov    0x20(%ebp),%eax
  36c6d6:	83 e0 10             	and    $0x10,%eax
  36c6d9:	85 c0                	test   %eax,%eax
  36c6db:	74 07                	je     36c6e4 <_toNumber+0x3e>
  36c6dd:	c7 45 f8 4c eb 36 00 	movl   $0x36eb4c,-0x8(%ebp)
  36c6e4:	8b 45 20             	mov    0x20(%ebp),%eax
  36c6e7:	83 e0 01             	and    $0x1,%eax
  36c6ea:	85 c0                	test   %eax,%eax
  36c6ec:	74 04                	je     36c6f2 <_toNumber+0x4c>
  36c6ee:	83 65 20 f7          	andl   $0xfffffff7,0x20(%ebp)
  36c6f2:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
  36c6f6:	74 0d                	je     36c705 <_toNumber+0x5f>
  36c6f8:	c7 45 14 00 00 00 00 	movl   $0x0,0x14(%ebp)
  36c6ff:	83 65 20 fd          	andl   $0xfffffffd,0x20(%ebp)
  36c703:	eb 04                	jmp    36c709 <_toNumber+0x63>
  36c705:	83 65 20 fb          	andl   $0xfffffffb,0x20(%ebp)
  36c709:	8b 45 20             	mov    0x20(%ebp),%eax
  36c70c:	83 e0 04             	and    $0x4,%eax
  36c70f:	85 c0                	test   %eax,%eax
  36c711:	74 16                	je     36c729 <_toNumber+0x83>
  36c713:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
  36c717:	75 06                	jne    36c71f <_toNumber+0x79>
  36c719:	83 6d 1c 02          	subl   $0x2,0x1c(%ebp)
  36c71d:	eb 0a                	jmp    36c729 <_toNumber+0x83>
  36c71f:	83 7d 18 08          	cmpl   $0x8,0x18(%ebp)
  36c723:	75 04                	jne    36c729 <_toNumber+0x83>
  36c725:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  36c729:	83 7d 14 01          	cmpl   $0x1,0x14(%ebp)
  36c72d:	75 24                	jne    36c753 <_toNumber+0xad>
  36c72f:	83 bd ec fe ff ff 00 	cmpl   $0x0,-0x114(%ebp)
  36c736:	79 1b                	jns    36c753 <_toNumber+0xad>
  36c738:	83 4d 20 02          	orl    $0x2,0x20(%ebp)
  36c73c:	f7 9d e8 fe ff ff    	negl   -0x118(%ebp)
  36c742:	83 95 ec fe ff ff 00 	adcl   $0x0,-0x114(%ebp)
  36c749:	f7 9d ec fe ff ff    	negl   -0x114(%ebp)
  36c74f:	c6 45 ff 2d          	movb   $0x2d,-0x1(%ebp)
  36c753:	8b 45 24             	mov    0x24(%ebp),%eax
  36c756:	99                   	cltd   
  36c757:	21 85 e8 fe ff ff    	and    %eax,-0x118(%ebp)
  36c75d:	21 95 ec fe ff ff    	and    %edx,-0x114(%ebp)
  36c763:	8b 45 20             	mov    0x20(%ebp),%eax
  36c766:	83 e0 02             	and    $0x2,%eax
  36c769:	85 c0                	test   %eax,%eax
  36c76b:	74 04                	je     36c771 <_toNumber+0xcb>
  36c76d:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  36c771:	8b 45 18             	mov    0x18(%ebp),%eax
  36c774:	83 f8 0a             	cmp    $0xa,%eax
  36c777:	74 25                	je     36c79e <_toNumber+0xf8>
  36c779:	83 f8 10             	cmp    $0x10,%eax
  36c77c:	74 3b                	je     36c7b9 <_toNumber+0x113>
  36c77e:	83 f8 08             	cmp    $0x8,%eax
  36c781:	75 50                	jne    36c7d3 <_toNumber+0x12d>
  36c783:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  36c789:	50                   	push   %eax
  36c78a:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  36c790:	50                   	push   %eax
  36c791:	e8 52 fe ff ff       	call   36c5e8 <_octal>
  36c796:	83 c4 08             	add    $0x8,%esp
  36c799:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36c79c:	eb 35                	jmp    36c7d3 <_toNumber+0x12d>
  36c79e:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  36c7a4:	50                   	push   %eax
  36c7a5:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  36c7ab:	50                   	push   %eax
  36c7ac:	e8 68 fe ff ff       	call   36c619 <_decimal>
  36c7b1:	83 c4 08             	add    $0x8,%esp
  36c7b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36c7b7:	eb 1a                	jmp    36c7d3 <_toNumber+0x12d>
  36c7b9:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
  36c7bf:	50                   	push   %eax
  36c7c0:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
  36c7c6:	50                   	push   %eax
  36c7c7:	e8 a9 fe ff ff       	call   36c675 <_hex>
  36c7cc:	83 c4 08             	add    $0x8,%esp
  36c7cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36c7d2:	90                   	nop
  36c7d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36c7d6:	29 45 1c             	sub    %eax,0x1c(%ebp)
  36c7d9:	8b 45 20             	mov    0x20(%ebp),%eax
  36c7dc:	83 e0 09             	and    $0x9,%eax
  36c7df:	85 c0                	test   %eax,%eax
  36c7e1:	75 1b                	jne    36c7fe <_toNumber+0x158>
  36c7e3:	eb 0c                	jmp    36c7f1 <_toNumber+0x14b>
  36c7e5:	8b 45 08             	mov    0x8(%ebp),%eax
  36c7e8:	8d 50 01             	lea    0x1(%eax),%edx
  36c7eb:	89 55 08             	mov    %edx,0x8(%ebp)
  36c7ee:	c6 00 20             	movb   $0x20,(%eax)
  36c7f1:	8b 45 1c             	mov    0x1c(%ebp),%eax
  36c7f4:	8d 50 ff             	lea    -0x1(%eax),%edx
  36c7f7:	89 55 1c             	mov    %edx,0x1c(%ebp)
  36c7fa:	85 c0                	test   %eax,%eax
  36c7fc:	7f e7                	jg     36c7e5 <_toNumber+0x13f>
  36c7fe:	8b 45 20             	mov    0x20(%ebp),%eax
  36c801:	83 e0 02             	and    $0x2,%eax
  36c804:	85 c0                	test   %eax,%eax
  36c806:	74 0f                	je     36c817 <_toNumber+0x171>
  36c808:	8b 45 08             	mov    0x8(%ebp),%eax
  36c80b:	8d 50 01             	lea    0x1(%eax),%edx
  36c80e:	89 55 08             	mov    %edx,0x8(%ebp)
  36c811:	0f b6 55 ff          	movzbl -0x1(%ebp),%edx
  36c815:	88 10                	mov    %dl,(%eax)
  36c817:	8b 45 20             	mov    0x20(%ebp),%eax
  36c81a:	83 e0 04             	and    $0x4,%eax
  36c81d:	85 c0                	test   %eax,%eax
  36c81f:	74 24                	je     36c845 <_toNumber+0x19f>
  36c821:	8b 45 08             	mov    0x8(%ebp),%eax
  36c824:	8d 50 01             	lea    0x1(%eax),%edx
  36c827:	89 55 08             	mov    %edx,0x8(%ebp)
  36c82a:	c6 00 30             	movb   $0x30,(%eax)
  36c82d:	83 7d 18 10          	cmpl   $0x10,0x18(%ebp)
  36c831:	75 12                	jne    36c845 <_toNumber+0x19f>
  36c833:	8b 45 08             	mov    0x8(%ebp),%eax
  36c836:	8d 50 01             	lea    0x1(%eax),%edx
  36c839:	89 55 08             	mov    %edx,0x8(%ebp)
  36c83c:	8b 55 f8             	mov    -0x8(%ebp),%edx
  36c83f:	0f b6 52 10          	movzbl 0x10(%edx),%edx
  36c843:	88 10                	mov    %dl,(%eax)
  36c845:	8b 45 20             	mov    0x20(%ebp),%eax
  36c848:	83 e0 08             	and    $0x8,%eax
  36c84b:	85 c0                	test   %eax,%eax
  36c84d:	74 1b                	je     36c86a <_toNumber+0x1c4>
  36c84f:	eb 0c                	jmp    36c85d <_toNumber+0x1b7>
  36c851:	8b 45 08             	mov    0x8(%ebp),%eax
  36c854:	8d 50 01             	lea    0x1(%eax),%edx
  36c857:	89 55 08             	mov    %edx,0x8(%ebp)
  36c85a:	c6 00 30             	movb   $0x30,(%eax)
  36c85d:	8b 45 1c             	mov    0x1c(%ebp),%eax
  36c860:	8d 50 ff             	lea    -0x1(%eax),%edx
  36c863:	89 55 1c             	mov    %edx,0x1c(%ebp)
  36c866:	85 c0                	test   %eax,%eax
  36c868:	7f e7                	jg     36c851 <_toNumber+0x1ab>
  36c86a:	eb 1f                	jmp    36c88b <_toNumber+0x1e5>
  36c86c:	8b 45 08             	mov    0x8(%ebp),%eax
  36c86f:	8d 50 01             	lea    0x1(%eax),%edx
  36c872:	89 55 08             	mov    %edx,0x8(%ebp)
  36c875:	8b 55 f4             	mov    -0xc(%ebp),%edx
  36c878:	8b 94 95 f4 fe ff ff 	mov    -0x10c(%ebp,%edx,4),%edx
  36c87f:	89 d1                	mov    %edx,%ecx
  36c881:	8b 55 f8             	mov    -0x8(%ebp),%edx
  36c884:	01 ca                	add    %ecx,%edx
  36c886:	0f b6 12             	movzbl (%edx),%edx
  36c889:	88 10                	mov    %dl,(%eax)
  36c88b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36c88e:	8d 50 ff             	lea    -0x1(%eax),%edx
  36c891:	89 55 f4             	mov    %edx,-0xc(%ebp)
  36c894:	85 c0                	test   %eax,%eax
  36c896:	7f d4                	jg     36c86c <_toNumber+0x1c6>
  36c898:	8b 45 20             	mov    0x20(%ebp),%eax
  36c89b:	83 e0 01             	and    $0x1,%eax
  36c89e:	85 c0                	test   %eax,%eax
  36c8a0:	74 1b                	je     36c8bd <_toNumber+0x217>
  36c8a2:	eb 0c                	jmp    36c8b0 <_toNumber+0x20a>
  36c8a4:	8b 45 08             	mov    0x8(%ebp),%eax
  36c8a7:	8d 50 01             	lea    0x1(%eax),%edx
  36c8aa:	89 55 08             	mov    %edx,0x8(%ebp)
  36c8ad:	c6 00 20             	movb   $0x20,(%eax)
  36c8b0:	8b 45 1c             	mov    0x1c(%ebp),%eax
  36c8b3:	8d 50 ff             	lea    -0x1(%eax),%edx
  36c8b6:	89 55 1c             	mov    %edx,0x1c(%ebp)
  36c8b9:	85 c0                	test   %eax,%eax
  36c8bb:	7f e7                	jg     36c8a4 <_toNumber+0x1fe>
  36c8bd:	8b 45 08             	mov    0x8(%ebp),%eax
  36c8c0:	c9                   	leave  
  36c8c1:	c3                   	ret    

0036c8c2 <_toString>:
  36c8c2:	55                   	push   %ebp
  36c8c3:	89 e5                	mov    %esp,%ebp
  36c8c5:	83 ec 10             	sub    $0x10,%esp
  36c8c8:	ff 75 0c             	pushl  0xc(%ebp)
  36c8cb:	e8 80 fc ff ff       	call   36c550 <strlen>
  36c8d0:	83 c4 04             	add    $0x4,%esp
  36c8d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36c8d6:	8b 45 08             	mov    0x8(%ebp),%eax
  36c8d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  36c8dc:	8b 45 08             	mov    0x8(%ebp),%eax
  36c8df:	89 45 f8             	mov    %eax,-0x8(%ebp)
  36c8e2:	8b 45 14             	mov    0x14(%ebp),%eax
  36c8e5:	83 e0 01             	and    $0x1,%eax
  36c8e8:	85 c0                	test   %eax,%eax
  36c8ea:	74 0d                	je     36c8f9 <_toString+0x37>
  36c8ec:	8b 55 f0             	mov    -0x10(%ebp),%edx
  36c8ef:	8b 45 08             	mov    0x8(%ebp),%eax
  36c8f2:	01 d0                	add    %edx,%eax
  36c8f4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  36c8f7:	eb 0b                	jmp    36c904 <_toString+0x42>
  36c8f9:	8b 55 f0             	mov    -0x10(%ebp),%edx
  36c8fc:	8b 45 08             	mov    0x8(%ebp),%eax
  36c8ff:	01 d0                	add    %edx,%eax
  36c901:	89 45 f8             	mov    %eax,-0x8(%ebp)
  36c904:	ff 75 f0             	pushl  -0x10(%ebp)
  36c907:	ff 75 0c             	pushl  0xc(%ebp)
  36c90a:	ff 75 fc             	pushl  -0x4(%ebp)
  36c90d:	e8 5c fc ff ff       	call   36c56e <memcpy>
  36c912:	83 c4 0c             	add    $0xc,%esp
  36c915:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36c91c:	eb 10                	jmp    36c92e <_toString+0x6c>
  36c91e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36c921:	8d 50 01             	lea    0x1(%eax),%edx
  36c924:	89 55 f8             	mov    %edx,-0x8(%ebp)
  36c927:	c6 00 20             	movb   $0x20,(%eax)
  36c92a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  36c92e:	8b 45 10             	mov    0x10(%ebp),%eax
  36c931:	2b 45 f0             	sub    -0x10(%ebp),%eax
  36c934:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  36c937:	7f e5                	jg     36c91e <_toString+0x5c>
  36c939:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36c93c:	39 45 10             	cmp    %eax,0x10(%ebp)
  36c93f:	0f 4d 45 10          	cmovge 0x10(%ebp),%eax
  36c943:	89 c2                	mov    %eax,%edx
  36c945:	8b 45 08             	mov    0x8(%ebp),%eax
  36c948:	01 d0                	add    %edx,%eax
  36c94a:	c9                   	leave  
  36c94b:	c3                   	ret    

0036c94c <vsprintf>:
  36c94c:	55                   	push   %ebp
  36c94d:	89 e5                	mov    %esp,%ebp
  36c94f:	83 ec 30             	sub    $0x30,%esp
  36c952:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  36c959:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  36c960:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  36c967:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  36c96e:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  36c975:	c7 45 e4 6c 00 00 00 	movl   $0x6c,-0x1c(%ebp)
  36c97c:	8b 45 08             	mov    0x8(%ebp),%eax
  36c97f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36c982:	e9 6a 02 00 00       	jmp    36cbf1 <vsprintf+0x2a5>
  36c987:	8b 45 0c             	mov    0xc(%ebp),%eax
  36c98a:	0f b6 00             	movzbl (%eax),%eax
  36c98d:	3c 25                	cmp    $0x25,%al
  36c98f:	0f 85 42 02 00 00    	jne    36cbd7 <vsprintf+0x28b>
  36c995:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  36c99c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36c9a3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  36c9aa:	c7 45 e4 6c 00 00 00 	movl   $0x6c,-0x1c(%ebp)
  36c9b1:	8b 45 0c             	mov    0xc(%ebp),%eax
  36c9b4:	83 c0 01             	add    $0x1,%eax
  36c9b7:	89 45 0c             	mov    %eax,0xc(%ebp)
  36c9ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  36c9bd:	0f b6 00             	movzbl (%eax),%eax
  36c9c0:	0f be c0             	movsbl %al,%eax
  36c9c3:	83 e8 20             	sub    $0x20,%eax
  36c9c6:	83 f8 10             	cmp    $0x10,%eax
  36c9c9:	77 27                	ja     36c9f2 <vsprintf+0xa6>
  36c9cb:	8b 04 85 6c eb 36 00 	mov    0x36eb6c(,%eax,4),%eax
  36c9d2:	ff e0                	jmp    *%eax
  36c9d4:	83 4d fc 01          	orl    $0x1,-0x4(%ebp)
  36c9d8:	eb d7                	jmp    36c9b1 <vsprintf+0x65>
  36c9da:	83 4d fc 02          	orl    $0x2,-0x4(%ebp)
  36c9de:	eb d1                	jmp    36c9b1 <vsprintf+0x65>
  36c9e0:	83 4d fc 02          	orl    $0x2,-0x4(%ebp)
  36c9e4:	eb cb                	jmp    36c9b1 <vsprintf+0x65>
  36c9e6:	83 4d fc 08          	orl    $0x8,-0x4(%ebp)
  36c9ea:	eb c5                	jmp    36c9b1 <vsprintf+0x65>
  36c9ec:	83 4d fc 04          	orl    $0x4,-0x4(%ebp)
  36c9f0:	eb bf                	jmp    36c9b1 <vsprintf+0x65>
  36c9f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  36c9f5:	0f b6 00             	movzbl (%eax),%eax
  36c9f8:	3c 2f                	cmp    $0x2f,%al
  36c9fa:	7e 1b                	jle    36ca17 <vsprintf+0xcb>
  36c9fc:	8b 45 0c             	mov    0xc(%ebp),%eax
  36c9ff:	0f b6 00             	movzbl (%eax),%eax
  36ca02:	3c 39                	cmp    $0x39,%al
  36ca04:	7f 11                	jg     36ca17 <vsprintf+0xcb>
  36ca06:	8d 45 0c             	lea    0xc(%ebp),%eax
  36ca09:	50                   	push   %eax
  36ca0a:	e8 7f fb ff ff       	call   36c58e <_atoi>
  36ca0f:	83 c4 04             	add    $0x4,%esp
  36ca12:	89 45 f8             	mov    %eax,-0x8(%ebp)
  36ca15:	eb 21                	jmp    36ca38 <vsprintf+0xec>
  36ca17:	8b 45 0c             	mov    0xc(%ebp),%eax
  36ca1a:	0f b6 00             	movzbl (%eax),%eax
  36ca1d:	3c 2a                	cmp    $0x2a,%al
  36ca1f:	75 17                	jne    36ca38 <vsprintf+0xec>
  36ca21:	8b 45 0c             	mov    0xc(%ebp),%eax
  36ca24:	83 c0 01             	add    $0x1,%eax
  36ca27:	89 45 0c             	mov    %eax,0xc(%ebp)
  36ca2a:	8b 45 10             	mov    0x10(%ebp),%eax
  36ca2d:	8d 50 04             	lea    0x4(%eax),%edx
  36ca30:	89 55 10             	mov    %edx,0x10(%ebp)
  36ca33:	8b 00                	mov    (%eax),%eax
  36ca35:	89 45 f8             	mov    %eax,-0x8(%ebp)
  36ca38:	8b 45 0c             	mov    0xc(%ebp),%eax
  36ca3b:	0f b6 00             	movzbl (%eax),%eax
  36ca3e:	3c 68                	cmp    $0x68,%al
  36ca40:	74 1e                	je     36ca60 <vsprintf+0x114>
  36ca42:	8b 45 0c             	mov    0xc(%ebp),%eax
  36ca45:	0f b6 00             	movzbl (%eax),%eax
  36ca48:	3c 6c                	cmp    $0x6c,%al
  36ca4a:	74 14                	je     36ca60 <vsprintf+0x114>
  36ca4c:	8b 45 0c             	mov    0xc(%ebp),%eax
  36ca4f:	0f b6 00             	movzbl (%eax),%eax
  36ca52:	3c 4c                	cmp    $0x4c,%al
  36ca54:	74 0a                	je     36ca60 <vsprintf+0x114>
  36ca56:	8b 45 0c             	mov    0xc(%ebp),%eax
  36ca59:	0f b6 00             	movzbl (%eax),%eax
  36ca5c:	3c 48                	cmp    $0x48,%al
  36ca5e:	75 15                	jne    36ca75 <vsprintf+0x129>
  36ca60:	8b 45 0c             	mov    0xc(%ebp),%eax
  36ca63:	0f b6 00             	movzbl (%eax),%eax
  36ca66:	0f be c0             	movsbl %al,%eax
  36ca69:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36ca6c:	8b 45 0c             	mov    0xc(%ebp),%eax
  36ca6f:	83 c0 01             	add    $0x1,%eax
  36ca72:	89 45 0c             	mov    %eax,0xc(%ebp)
  36ca75:	8b 45 0c             	mov    0xc(%ebp),%eax
  36ca78:	0f b6 00             	movzbl (%eax),%eax
  36ca7b:	0f be c0             	movsbl %al,%eax
  36ca7e:	83 e8 58             	sub    $0x58,%eax
  36ca81:	83 f8 20             	cmp    $0x20,%eax
  36ca84:	77 60                	ja     36cae6 <vsprintf+0x19a>
  36ca86:	8b 04 85 b0 eb 36 00 	mov    0x36ebb0(,%eax,4),%eax
  36ca8d:	ff e0                	jmp    *%eax
  36ca8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36ca92:	8d 50 01             	lea    0x1(%eax),%edx
  36ca95:	89 55 ec             	mov    %edx,-0x14(%ebp)
  36ca98:	8b 55 10             	mov    0x10(%ebp),%edx
  36ca9b:	8d 4a 04             	lea    0x4(%edx),%ecx
  36ca9e:	89 4d 10             	mov    %ecx,0x10(%ebp)
  36caa1:	8b 12                	mov    (%edx),%edx
  36caa3:	88 10                	mov    %dl,(%eax)
  36caa5:	e9 3e 01 00 00       	jmp    36cbe8 <vsprintf+0x29c>
  36caaa:	c7 45 e4 73 00 00 00 	movl   $0x73,-0x1c(%ebp)
  36cab1:	eb 59                	jmp    36cb0c <vsprintf+0x1c0>
  36cab3:	83 4d fc 04          	orl    $0x4,-0x4(%ebp)
  36cab7:	c7 45 f0 10 00 00 00 	movl   $0x10,-0x10(%ebp)
  36cabe:	eb 4c                	jmp    36cb0c <vsprintf+0x1c0>
  36cac0:	83 4d fc 10          	orl    $0x10,-0x4(%ebp)
  36cac4:	c7 45 f0 10 00 00 00 	movl   $0x10,-0x10(%ebp)
  36cacb:	eb 3f                	jmp    36cb0c <vsprintf+0x1c0>
  36cacd:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  36cad4:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  36cadb:	eb 2e                	jmp    36cb0b <vsprintf+0x1bf>
  36cadd:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
  36cae4:	eb 26                	jmp    36cb0c <vsprintf+0x1c0>
  36cae6:	8b 45 0c             	mov    0xc(%ebp),%eax
  36cae9:	0f b6 00             	movzbl (%eax),%eax
  36caec:	84 c0                	test   %al,%al
  36caee:	74 16                	je     36cb06 <vsprintf+0x1ba>
  36caf0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36caf3:	8d 50 01             	lea    0x1(%eax),%edx
  36caf6:	89 55 ec             	mov    %edx,-0x14(%ebp)
  36caf9:	8b 55 0c             	mov    0xc(%ebp),%edx
  36cafc:	0f b6 12             	movzbl (%edx),%edx
  36caff:	88 10                	mov    %dl,(%eax)
  36cb01:	e9 e2 00 00 00       	jmp    36cbe8 <vsprintf+0x29c>
  36cb06:	e9 dd 00 00 00       	jmp    36cbe8 <vsprintf+0x29c>
  36cb0b:	90                   	nop
  36cb0c:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  36cb13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36cb16:	83 e8 48             	sub    $0x48,%eax
  36cb19:	83 f8 2b             	cmp    $0x2b,%eax
  36cb1c:	0f 87 c6 00 00 00    	ja     36cbe8 <vsprintf+0x29c>
  36cb22:	8b 04 85 34 ec 36 00 	mov    0x36ec34(,%eax,4),%eax
  36cb29:	ff e0                	jmp    *%eax
  36cb2b:	c7 45 e0 ff 00 00 00 	movl   $0xff,-0x20(%ebp)
  36cb32:	81 65 e0 ff ff 00 00 	andl   $0xffff,-0x20(%ebp)
  36cb39:	8b 45 10             	mov    0x10(%ebp),%eax
  36cb3c:	8d 50 04             	lea    0x4(%eax),%edx
  36cb3f:	89 55 10             	mov    %edx,0x10(%ebp)
  36cb42:	8b 00                	mov    (%eax),%eax
  36cb44:	89 45 dc             	mov    %eax,-0x24(%ebp)
  36cb47:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36cb4a:	99                   	cltd   
  36cb4b:	ff 75 e0             	pushl  -0x20(%ebp)
  36cb4e:	ff 75 fc             	pushl  -0x4(%ebp)
  36cb51:	ff 75 f8             	pushl  -0x8(%ebp)
  36cb54:	ff 75 f0             	pushl  -0x10(%ebp)
  36cb57:	ff 75 f4             	pushl  -0xc(%ebp)
  36cb5a:	52                   	push   %edx
  36cb5b:	50                   	push   %eax
  36cb5c:	ff 75 ec             	pushl  -0x14(%ebp)
  36cb5f:	e8 42 fb ff ff       	call   36c6a6 <_toNumber>
  36cb64:	83 c4 20             	add    $0x20,%esp
  36cb67:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36cb6a:	eb 69                	jmp    36cbd5 <vsprintf+0x289>
  36cb6c:	8b 45 10             	mov    0x10(%ebp),%eax
  36cb6f:	8d 50 08             	lea    0x8(%eax),%edx
  36cb72:	89 55 10             	mov    %edx,0x10(%ebp)
  36cb75:	8b 50 04             	mov    0x4(%eax),%edx
  36cb78:	8b 00                	mov    (%eax),%eax
  36cb7a:	89 45 dc             	mov    %eax,-0x24(%ebp)
  36cb7d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  36cb80:	99                   	cltd   
  36cb81:	ff 75 e0             	pushl  -0x20(%ebp)
  36cb84:	ff 75 fc             	pushl  -0x4(%ebp)
  36cb87:	ff 75 f8             	pushl  -0x8(%ebp)
  36cb8a:	ff 75 f0             	pushl  -0x10(%ebp)
  36cb8d:	ff 75 f4             	pushl  -0xc(%ebp)
  36cb90:	52                   	push   %edx
  36cb91:	50                   	push   %eax
  36cb92:	ff 75 ec             	pushl  -0x14(%ebp)
  36cb95:	e8 0c fb ff ff       	call   36c6a6 <_toNumber>
  36cb9a:	83 c4 20             	add    $0x20,%esp
  36cb9d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36cba0:	eb 33                	jmp    36cbd5 <vsprintf+0x289>
  36cba2:	8b 45 10             	mov    0x10(%ebp),%eax
  36cba5:	8d 50 04             	lea    0x4(%eax),%edx
  36cba8:	89 55 10             	mov    %edx,0x10(%ebp)
  36cbab:	8b 00                	mov    (%eax),%eax
  36cbad:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36cbb0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  36cbb4:	75 07                	jne    36cbbd <vsprintf+0x271>
  36cbb6:	c7 45 e8 64 eb 36 00 	movl   $0x36eb64,-0x18(%ebp)
  36cbbd:	ff 75 fc             	pushl  -0x4(%ebp)
  36cbc0:	ff 75 f8             	pushl  -0x8(%ebp)
  36cbc3:	ff 75 e8             	pushl  -0x18(%ebp)
  36cbc6:	ff 75 ec             	pushl  -0x14(%ebp)
  36cbc9:	e8 f4 fc ff ff       	call   36c8c2 <_toString>
  36cbce:	83 c4 10             	add    $0x10,%esp
  36cbd1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36cbd4:	90                   	nop
  36cbd5:	eb 11                	jmp    36cbe8 <vsprintf+0x29c>
  36cbd7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36cbda:	8d 50 01             	lea    0x1(%eax),%edx
  36cbdd:	89 55 ec             	mov    %edx,-0x14(%ebp)
  36cbe0:	8b 55 0c             	mov    0xc(%ebp),%edx
  36cbe3:	0f b6 12             	movzbl (%edx),%edx
  36cbe6:	88 10                	mov    %dl,(%eax)
  36cbe8:	8b 45 0c             	mov    0xc(%ebp),%eax
  36cbeb:	83 c0 01             	add    $0x1,%eax
  36cbee:	89 45 0c             	mov    %eax,0xc(%ebp)
  36cbf1:	8b 45 0c             	mov    0xc(%ebp),%eax
  36cbf4:	0f b6 00             	movzbl (%eax),%eax
  36cbf7:	84 c0                	test   %al,%al
  36cbf9:	0f 85 88 fd ff ff    	jne    36c987 <vsprintf+0x3b>
  36cbff:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36cc02:	c6 00 00             	movb   $0x0,(%eax)
  36cc05:	8b 55 ec             	mov    -0x14(%ebp),%edx
  36cc08:	8b 45 08             	mov    0x8(%ebp),%eax
  36cc0b:	29 c2                	sub    %eax,%edx
  36cc0d:	89 d0                	mov    %edx,%eax
  36cc0f:	c9                   	leave  
  36cc10:	c3                   	ret    

0036cc11 <sprintf>:
  36cc11:	55                   	push   %ebp
  36cc12:	89 e5                	mov    %esp,%ebp
  36cc14:	83 ec 10             	sub    $0x10,%esp
  36cc17:	8d 45 10             	lea    0x10(%ebp),%eax
  36cc1a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  36cc1d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  36cc20:	83 ec 04             	sub    $0x4,%esp
  36cc23:	50                   	push   %eax
  36cc24:	ff 75 0c             	pushl  0xc(%ebp)
  36cc27:	ff 75 08             	pushl  0x8(%ebp)
  36cc2a:	e8 1d fd ff ff       	call   36c94c <vsprintf>
  36cc2f:	83 c4 10             	add    $0x10,%esp
  36cc32:	89 45 fc             	mov    %eax,-0x4(%ebp)
  36cc35:	8b 45 fc             	mov    -0x4(%ebp),%eax
  36cc38:	c9                   	leave  
  36cc39:	c3                   	ret    

0036cc3a <printf>:
  36cc3a:	55                   	push   %ebp
  36cc3b:	89 e5                	mov    %esp,%ebp
  36cc3d:	83 ec 18             	sub    $0x18,%esp
  36cc40:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  36cc47:	8d 45 0c             	lea    0xc(%ebp),%eax
  36cc4a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36cc4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36cc50:	83 ec 04             	sub    $0x4,%esp
  36cc53:	50                   	push   %eax
  36cc54:	ff 75 08             	pushl  0x8(%ebp)
  36cc57:	68 80 38 37 00       	push   $0x373880
  36cc5c:	e8 eb fc ff ff       	call   36c94c <vsprintf>
  36cc61:	83 c4 10             	add    $0x10,%esp
  36cc64:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36cc67:	83 ec 04             	sub    $0x4,%esp
  36cc6a:	ff 75 f4             	pushl  -0xc(%ebp)
  36cc6d:	68 80 38 37 00       	push   $0x373880
  36cc72:	6a 01                	push   $0x1
  36cc74:	e8 0b 00 00 00       	call   36cc84 <write>
  36cc79:	83 c4 10             	add    $0x10,%esp
  36cc7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  36cc7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36cc82:	c9                   	leave  
  36cc83:	c3                   	ret    

0036cc84 <write>:
  36cc84:	55                   	push   %ebp
  36cc85:	89 e5                	mov    %esp,%ebp
  36cc87:	57                   	push   %edi
  36cc88:	56                   	push   %esi
  36cc89:	53                   	push   %ebx
  36cc8a:	83 ec 20             	sub    $0x20,%esp
  36cc8d:	b8 04 00 00 00       	mov    $0x4,%eax
  36cc92:	bb 06 00 00 00       	mov    $0x6,%ebx
  36cc97:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  36cc9a:	8b 55 10             	mov    0x10(%ebp),%edx
  36cc9d:	be 00 00 00 00       	mov    $0x0,%esi
  36cca2:	bf 00 00 00 00       	mov    $0x0,%edi
  36cca7:	cd 80                	int    $0x80
  36cca9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36ccac:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36ccaf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36ccb2:	b8 01 00 00 00       	mov    $0x1,%eax
  36ccb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36ccba:	b9 06 00 00 00       	mov    $0x6,%ecx
  36ccbf:	8b 55 ec             	mov    -0x14(%ebp),%edx
  36ccc2:	be 00 00 00 00       	mov    $0x0,%esi
  36ccc7:	8b 7d 10             	mov    0x10(%ebp),%edi
  36ccca:	cd 80                	int    $0x80
  36cccc:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36cccf:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36ccd2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36ccd5:	b8 04 00 00 00       	mov    $0x4,%eax
  36ccda:	bb 05 00 00 00       	mov    $0x5,%ebx
  36ccdf:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  36cce2:	ba 00 00 00 00       	mov    $0x0,%edx
  36cce7:	be 00 00 00 00       	mov    $0x0,%esi
  36ccec:	bf 00 00 00 00       	mov    $0x0,%edi
  36ccf1:	cd 80                	int    $0x80
  36ccf3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36ccf6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  36ccf9:	83 c4 20             	add    $0x20,%esp
  36ccfc:	5b                   	pop    %ebx
  36ccfd:	5e                   	pop    %esi
  36ccfe:	5f                   	pop    %edi
  36ccff:	5d                   	pop    %ebp
  36cd00:	c3                   	ret    

0036cd01 <exit>:
  36cd01:	55                   	push   %ebp
  36cd02:	89 e5                	mov    %esp,%ebp
  36cd04:	57                   	push   %edi
  36cd05:	56                   	push   %esi
  36cd06:	53                   	push   %ebx
  36cd07:	83 ec 10             	sub    $0x10,%esp
  36cd0a:	b8 01 00 00 00       	mov    $0x1,%eax
  36cd0f:	bb 03 00 00 00       	mov    $0x3,%ebx
  36cd14:	b9 01 00 00 00       	mov    $0x1,%ecx
  36cd19:	8b 55 08             	mov    0x8(%ebp),%edx
  36cd1c:	be 00 00 00 00       	mov    $0x0,%esi
  36cd21:	bf 00 00 00 00       	mov    $0x0,%edi
  36cd26:	cd 80                	int    $0x80
  36cd28:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36cd2b:	83 c4 10             	add    $0x10,%esp
  36cd2e:	5b                   	pop    %ebx
  36cd2f:	5e                   	pop    %esi
  36cd30:	5f                   	pop    %edi
  36cd31:	5d                   	pop    %ebp
  36cd32:	c3                   	ret    

0036cd33 <blk_readpage>:
  36cd33:	55                   	push   %ebp
  36cd34:	89 e5                	mov    %esp,%ebp
  36cd36:	83 ec 08             	sub    $0x8,%esp
  36cd39:	83 ec 0c             	sub    $0xc,%esp
  36cd3c:	6a 01                	push   $0x1
  36cd3e:	ff 75 10             	pushl  0x10(%ebp)
  36cd41:	ff 75 0c             	pushl  0xc(%ebp)
  36cd44:	6a 07                	push   $0x7
  36cd46:	ff 75 08             	pushl  0x8(%ebp)
  36cd49:	e8 25 00 00 00       	call   36cd73 <blk_rw>
  36cd4e:	83 c4 20             	add    $0x20,%esp
  36cd51:	c9                   	leave  
  36cd52:	c3                   	ret    

0036cd53 <blk_writepage>:
  36cd53:	55                   	push   %ebp
  36cd54:	89 e5                	mov    %esp,%ebp
  36cd56:	83 ec 08             	sub    $0x8,%esp
  36cd59:	83 ec 0c             	sub    $0xc,%esp
  36cd5c:	6a 01                	push   $0x1
  36cd5e:	ff 75 10             	pushl  0x10(%ebp)
  36cd61:	ff 75 0c             	pushl  0xc(%ebp)
  36cd64:	6a 08                	push   $0x8
  36cd66:	ff 75 08             	pushl  0x8(%ebp)
  36cd69:	e8 05 00 00 00       	call   36cd73 <blk_rw>
  36cd6e:	83 c4 20             	add    $0x20,%esp
  36cd71:	c9                   	leave  
  36cd72:	c3                   	ret    

0036cd73 <blk_rw>:
  36cd73:	55                   	push   %ebp
  36cd74:	89 e5                	mov    %esp,%ebp
  36cd76:	57                   	push   %edi
  36cd77:	56                   	push   %esi
  36cd78:	53                   	push   %ebx
  36cd79:	83 ec 10             	sub    $0x10,%esp
  36cd7c:	b8 01 00 00 00       	mov    $0x1,%eax
  36cd81:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36cd84:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  36cd87:	8b 55 10             	mov    0x10(%ebp),%edx
  36cd8a:	8b 75 14             	mov    0x14(%ebp),%esi
  36cd8d:	8b 7d 18             	mov    0x18(%ebp),%edi
  36cd90:	cd 80                	int    $0x80
  36cd92:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36cd95:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36cd98:	83 c4 10             	add    $0x10,%esp
  36cd9b:	5b                   	pop    %ebx
  36cd9c:	5e                   	pop    %esi
  36cd9d:	5f                   	pop    %edi
  36cd9e:	5d                   	pop    %ebp
  36cd9f:	c3                   	ret    

0036cda0 <sb_bread>:
  36cda0:	55                   	push   %ebp
  36cda1:	89 e5                	mov    %esp,%ebp
  36cda3:	83 ec 08             	sub    $0x8,%esp
  36cda6:	8b 45 08             	mov    0x8(%ebp),%eax
  36cda9:	8b 40 04             	mov    0x4(%eax),%eax
  36cdac:	83 ec 04             	sub    $0x4,%esp
  36cdaf:	ff 75 10             	pushl  0x10(%ebp)
  36cdb2:	ff 75 0c             	pushl  0xc(%ebp)
  36cdb5:	50                   	push   %eax
  36cdb6:	e8 78 ff ff ff       	call   36cd33 <blk_readpage>
  36cdbb:	83 c4 10             	add    $0x10,%esp
  36cdbe:	c9                   	leave  
  36cdbf:	c3                   	ret    

0036cdc0 <sb_bwrite>:
  36cdc0:	55                   	push   %ebp
  36cdc1:	89 e5                	mov    %esp,%ebp
  36cdc3:	83 ec 08             	sub    $0x8,%esp
  36cdc6:	8b 45 08             	mov    0x8(%ebp),%eax
  36cdc9:	8b 40 04             	mov    0x4(%eax),%eax
  36cdcc:	83 ec 04             	sub    $0x4,%esp
  36cdcf:	ff 75 10             	pushl  0x10(%ebp)
  36cdd2:	ff 75 0c             	pushl  0xc(%ebp)
  36cdd5:	50                   	push   %eax
  36cdd6:	e8 78 ff ff ff       	call   36cd53 <blk_writepage>
  36cddb:	83 c4 10             	add    $0x10,%esp
  36cdde:	c9                   	leave  
  36cddf:	c3                   	ret    

0036cde0 <generic_seek>:
  36cde0:	55                   	push   %ebp
  36cde1:	89 e5                	mov    %esp,%ebp
  36cde3:	57                   	push   %edi
  36cde4:	56                   	push   %esi
  36cde5:	53                   	push   %ebx
  36cde6:	83 ec 10             	sub    $0x10,%esp
  36cde9:	b8 01 00 00 00       	mov    $0x1,%eax
  36cdee:	bb 04 00 00 00       	mov    $0x4,%ebx
  36cdf3:	b9 12 00 00 00       	mov    $0x12,%ecx
  36cdf8:	ba 00 00 00 00       	mov    $0x0,%edx
  36cdfd:	be 00 00 00 00       	mov    $0x0,%esi
  36ce02:	bf 00 00 00 00       	mov    $0x0,%edi
  36ce07:	cd 80                	int    $0x80
  36ce09:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36ce0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36ce0f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36ce12:	8b 45 0c             	mov    0xc(%ebp),%eax
  36ce15:	83 f8 01             	cmp    $0x1,%eax
  36ce18:	74 14                	je     36ce2e <generic_seek+0x4e>
  36ce1a:	83 f8 02             	cmp    $0x2,%eax
  36ce1d:	74 22                	je     36ce41 <generic_seek+0x61>
  36ce1f:	85 c0                	test   %eax,%eax
  36ce21:	75 35                	jne    36ce58 <generic_seek+0x78>
  36ce23:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36ce26:	8b 55 10             	mov    0x10(%ebp),%edx
  36ce29:	89 50 04             	mov    %edx,0x4(%eax)
  36ce2c:	eb 2a                	jmp    36ce58 <generic_seek+0x78>
  36ce2e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36ce31:	8b 50 04             	mov    0x4(%eax),%edx
  36ce34:	8b 45 10             	mov    0x10(%ebp),%eax
  36ce37:	01 c2                	add    %eax,%edx
  36ce39:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36ce3c:	89 50 04             	mov    %edx,0x4(%eax)
  36ce3f:	eb 17                	jmp    36ce58 <generic_seek+0x78>
  36ce41:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36ce44:	8b 40 08             	mov    0x8(%eax),%eax
  36ce47:	8b 50 18             	mov    0x18(%eax),%edx
  36ce4a:	8b 45 10             	mov    0x10(%ebp),%eax
  36ce4d:	01 d0                	add    %edx,%eax
  36ce4f:	89 c2                	mov    %eax,%edx
  36ce51:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36ce54:	89 50 04             	mov    %edx,0x4(%eax)
  36ce57:	90                   	nop
  36ce58:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36ce5b:	8b 48 04             	mov    0x4(%eax),%ecx
  36ce5e:	b8 02 00 00 00       	mov    $0x2,%eax
  36ce63:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36ce66:	ba 00 00 00 00       	mov    $0x0,%edx
  36ce6b:	be 00 00 00 00       	mov    $0x0,%esi
  36ce70:	bf 00 00 00 00       	mov    $0x0,%edi
  36ce75:	cd 80                	int    $0x80
  36ce77:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36ce7a:	83 c4 10             	add    $0x10,%esp
  36ce7d:	5b                   	pop    %ebx
  36ce7e:	5e                   	pop    %esi
  36ce7f:	5f                   	pop    %edi
  36ce80:	5d                   	pop    %ebp
  36ce81:	c3                   	ret    

0036ce82 <generic_umount>:
  36ce82:	55                   	push   %ebp
  36ce83:	89 e5                	mov    %esp,%ebp
  36ce85:	57                   	push   %edi
  36ce86:	56                   	push   %esi
  36ce87:	53                   	push   %ebx
  36ce88:	83 ec 10             	sub    $0x10,%esp
  36ce8b:	b8 02 00 00 00       	mov    $0x2,%eax
  36ce90:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36ce93:	b9 da ff ff ff       	mov    $0xffffffda,%ecx
  36ce98:	ba 00 00 00 00       	mov    $0x0,%edx
  36ce9d:	be 00 00 00 00       	mov    $0x0,%esi
  36cea2:	bf 00 00 00 00       	mov    $0x0,%edi
  36cea7:	cd 80                	int    $0x80
  36cea9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36ceac:	83 c4 10             	add    $0x10,%esp
  36ceaf:	5b                   	pop    %ebx
  36ceb0:	5e                   	pop    %esi
  36ceb1:	5f                   	pop    %edi
  36ceb2:	5d                   	pop    %ebp
  36ceb3:	c3                   	ret    

0036ceb4 <generic_mount>:
  36ceb4:	55                   	push   %ebp
  36ceb5:	89 e5                	mov    %esp,%ebp
  36ceb7:	57                   	push   %edi
  36ceb8:	56                   	push   %esi
  36ceb9:	53                   	push   %ebx
  36ceba:	83 ec 20             	sub    $0x20,%esp
  36cebd:	b8 01 00 00 00       	mov    $0x1,%eax
  36cec2:	bb 04 00 00 00       	mov    $0x4,%ebx
  36cec7:	b9 12 00 00 00       	mov    $0x12,%ecx
  36cecc:	ba 00 00 00 00       	mov    $0x0,%edx
  36ced1:	be 00 00 00 00       	mov    $0x0,%esi
  36ced6:	bf 00 00 00 00       	mov    $0x0,%edi
  36cedb:	cd 80                	int    $0x80
  36cedd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  36cee0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  36cee3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  36cee6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  36cee9:	8b 40 08             	mov    0x8(%eax),%eax
  36ceec:	89 45 e8             	mov    %eax,-0x18(%ebp)
  36ceef:	8b 45 10             	mov    0x10(%ebp),%eax
  36cef2:	25 ff 01 00 00       	and    $0x1ff,%eax
  36cef7:	80 cc e0             	or     $0xe0,%ah
  36cefa:	89 c2                	mov    %eax,%edx
  36cefc:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36ceff:	89 10                	mov    %edx,(%eax)
  36cf01:	8b 45 e8             	mov    -0x18(%ebp),%eax
  36cf04:	8b 55 0c             	mov    0xc(%ebp),%edx
  36cf07:	89 50 14             	mov    %edx,0x14(%eax)
  36cf0a:	b8 03 00 00 00       	mov    $0x3,%eax
  36cf0f:	bb 0d 00 00 00       	mov    $0xd,%ebx
  36cf14:	b9 82 ce 36 00       	mov    $0x36ce82,%ecx
  36cf19:	ba 00 00 00 00       	mov    $0x0,%edx
  36cf1e:	be 00 00 00 00       	mov    $0x0,%esi
  36cf23:	bf 00 00 00 00       	mov    $0x0,%edi
  36cf28:	cd 80                	int    $0x80
  36cf2a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  36cf2d:	b8 02 00 00 00       	mov    $0x2,%eax
  36cf32:	8b 5d 08             	mov    0x8(%ebp),%ebx
  36cf35:	b9 00 00 00 00       	mov    $0x0,%ecx
  36cf3a:	ba 00 00 00 00       	mov    $0x0,%edx
  36cf3f:	be 00 00 00 00       	mov    $0x0,%esi
  36cf44:	bf 00 00 00 00       	mov    $0x0,%edi
  36cf49:	cd 80                	int    $0x80
  36cf4b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  36cf4e:	83 c4 20             	add    $0x20,%esp
  36cf51:	5b                   	pop    %ebx
  36cf52:	5e                   	pop    %esi
  36cf53:	5f                   	pop    %edi
  36cf54:	5d                   	pop    %ebp
  36cf55:	c3                   	ret    
