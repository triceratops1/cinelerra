/*
 * Copyright (c) 2003 Matteo Frigo
 * Copyright (c) 2003 Massachusetts Institute of Technology
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 */

/* This file was automatically generated --- DO NOT EDIT */
/* Generated on Sat Jul  5 21:51:40 EDT 2003 */

#include "config.h"



/* cheap-mode: VECTGRADE_FULL succeeded. (2796 steps) */
/* Generated by: /homee/stevenj/cvs/fftw3.0.1/genfft-k7/gen_notw -no-randomized-cse -n 64 -sign 1 -name n1k7i_64 */

/*
 * Generator Id's : 
 * $Id: algsimp.ml,v 1.3 2003/03/15 20:29:42 stevenj Exp $
 * $Id: fft.ml,v 1.3 2003/03/15 20:29:43 stevenj Exp $
 * $Id: gen_notw.ml,v 1.11 2003/04/18 01:21:45 athena Exp $
 */

/* The following asm code is Copyright (c) 2000-2001 Stefan Kral */
.section .rodata
	.balign 64
KP707106781KP707106781: .float +0.707106781186547524400844362104849039284835938, +0.707106781186547524400844362104849039284835938
chs_lo: .long 0x80000000, 0x00000000
chs_hi: .long 0x00000000, 0x80000000
KP923879532KP382683432: .float +0.923879532511286756128183189396788286822416626, +0.382683432365089771728459984030398866761344562
KP382683432KP923879532: .float +0.382683432365089771728459984030398866761344562, +0.923879532511286756128183189396788286822416626
KP831469612KP555570233: .float +0.831469612302545237078788377617905756738560812, +0.555570233019602224742830813948532874374937191
KP555570233KP831469612: .float +0.555570233019602224742830813948532874374937191, +0.831469612302545237078788377617905756738560812
KP195090322KP980785280: .float +0.195090322016128267848284868477022240927691618, +0.980785280403230449126182236134239036973933731
KP980785280KP195090322: .float +0.980785280403230449126182236134239036973933731, +0.195090322016128267848284868477022240927691618
KP471396736KP881921264: .float +0.471396736825997648556387625905254377657460319, +0.881921264348355029712756863660388349508442621
KP956940335KP290284677: .float +0.956940335732208864935797886980269969482849206, +0.290284677254462367636192375817395274691476278
KP881921264KP471396736: .float +0.881921264348355029712756863660388349508442621, +0.471396736825997648556387625905254377657460319
KP290284677KP956940335: .float +0.290284677254462367636192375817395274691476278, +0.956940335732208864935797886980269969482849206
KP098017140KP995184726: .float +0.098017140329560601994195563888641845861136673, +0.995184726672196886244836953109479921575474869
KP995184726KP098017140: .float +0.995184726672196886244836953109479921575474869, +0.098017140329560601994195563888641845861136673
KP634393284KP773010453: .float +0.634393284163645498215171613225493370675687095, +0.773010453362736960810906609758469800971041293
KP773010453KP634393284: .float +0.773010453362736960810906609758469800971041293, +0.634393284163645498215171613225493370675687095
.text
.text
	.balign 64
n1k7i_64:
	subl $1020, %esp
	femms 
	movl 1040(%esp), %ecx
	movl %esi, 1012(%esp)
	movl 1044(%esp), %esi
	movl 1028(%esp), %eax
	movl %ebx, 1016(%esp)
	movl 1036(%esp), %ebx
	movl %edi, 1008(%esp)
	leal (,%ecx,4), %ecx
	movl %ebp, 1004(%esp)
	leal (,%esi,4), %esi
	movl %ecx, %edx
	movl %esi, %edi
	sall $5, %edx
	addl %eax, %edx
	sall $5, %edi
	addl %ebx, %edi
	sall $2, 1052(%esp)
	sall $2, 1056(%esp)
	.p2align 4,,7
.L0:
	/* promise simd cell size = 8 */ 
	movq (%edx), %mm0
	movq (%eax), %mm1
	leal (%ecx,%ecx), %ebp
	movq (%edx,%ecx,8), %mm6
	movq (%eax,%ecx,8), %mm7
	movq (%eax,%ebp,8), %mm4
	movq (%edx,%ebp,8), %mm3
	leal (%ecx,%ecx,2), %ebp
	movq %mm1, %mm2
	pfsub %mm0, %mm1
	pfadd %mm0, %mm2
	movq %mm7, %mm0
	movq %mm4, %mm5
	pfadd %mm3, %mm4
	movq %mm1, 0(%esp)
	movq (%eax,%ebp,8), %mm1
	pfsub %mm6, %mm7
	pfsub %mm3, %mm5
	movq (%edx,%ebp,8), %mm3
	leal (%ecx,%ecx,2), %ebp
	pfadd %mm6, %mm0
	leal (%ebp,%ebp,4), %ebp
	movq %mm3, %mm6
	pfsub %mm1, %mm3
	movq %mm5, 8(%esp)
	movq %mm2, %mm5
	pfadd %mm4, %mm2
	leal (%ecx,%ebp,2), %ebp
	pfadd %mm1, %mm6
	movq %mm7, %mm1
	pfsub %mm4, %mm5
	movq %mm0, %mm4
	pfpnacc %mm3, %mm1
	pswapd %mm3, %mm3
	pfpnacc %mm7, %mm3
	pfadd %mm6, %mm0
	movq %mm5, 16(%esp)
	movq %mm2, %mm5
	pfsubr %mm6, %mm4
	movq (%eax,%ebp), %mm6
	movq %mm3, %mm7
	pfnacc %mm1, %mm3
	pfadd %mm0, %mm5
	pfsub %mm0, %mm2
	movq (%edx,%ebp), %mm0
	leal (%ecx,%ecx,2), %ebp
	pfacc %mm7, %mm1
	movq %mm4, 56(%esp)
	movq 0(%esp), %mm4
	pfmul KP707106781KP707106781, %mm3
	leal (%ebp,%ebp,4), %ebp
	movq %mm5, 72(%esp)
	movq 8(%esp), %mm5
	movq %mm0, %mm7
	pfsub %mm6, %mm0
	movq %mm2, 64(%esp)
	pfmul KP707106781KP707106781, %mm1
	movq %mm4, %mm2
	pfadd %mm6, %mm7
	movq (%edx,%ebp), %mm6
	pswapd %mm5, %mm5
	movq %mm3, 40(%esp)
	movq (%eax,%ebp), %mm3
	leal (%ecx,%ecx,2), %ebp
	pxor chs_lo, %mm5
	movq %mm0, 136(%esp)
	leal (%ebp,%ebp,8), %ebp
	movq %mm1, 24(%esp)
	movq %mm7, %mm1
	movq %mm3, %mm0
	pfadd %mm6, %mm3
	pfadd %mm5, %mm4
	pfsub %mm5, %mm2
	movq (%eax,%ebp), %mm5
	pfsub %mm6, %mm0
	movq (%edx,%ebp), %mm6
	leal (%ecx,%ecx,2), %ebp
	pfsub %mm3, %mm1
	leal (%ebp,%ecx,8), %ebp
	pfadd %mm3, %mm7
	movq %mm4, 32(%esp)
	movq %mm2, 48(%esp)
	movq (%eax,%ebp), %mm3
	movq %mm6, %mm4
	pxor chs_lo, %mm0
	movq (%edx,%ebp), %mm2
	pfsub %mm5, %mm6
	leal (%ecx,%ecx,2), %ebp
	pfadd %mm5, %mm4
	pswapd %mm1, %mm1
	movq %mm3, %mm5
	pfsub %mm2, %mm3
	movq %mm0, 112(%esp)
	pfadd %mm2, %mm5
	movq %mm6, 80(%esp)
	movq (%eax,%ebp), %mm2
	movq %mm4, %mm0
	movq (%edx,%ebp), %mm6
	leal (%ecx,%ecx,8), %ebp
	pxor chs_lo, %mm3
	leal (%ecx,%ebp,2), %ebp
	pfsub %mm5, %mm4
	pfadd %mm5, %mm0
	movq %mm2, %mm5
	pfsub %mm6, %mm2
	movq %mm3, 88(%esp)
	movq (%edx,%ebp), %mm3
	pfadd %mm6, %mm5
	movq (%eax,%ebp), %mm6
	leal (%ecx,%ecx,2), %ebp
	movq %mm4, 96(%esp)
	leal (%ecx,%ebp,2), %ebp
	movq %mm0, 144(%esp)
	movq %mm2, 104(%esp)
	movq %mm6, %mm4
	movq (%edx,%ebp), %mm2
	pfsub %mm3, %mm6
	movq %mm5, %mm0
	pfadd %mm3, %mm4
	movq (%eax,%ebp), %mm3
	leal (%ecx,%ecx,2), %ebp
	leal (%ebp,%ebp,4), %ebp
	movq %mm6, 120(%esp)
	movq %mm3, %mm6
	leal (%ebp,%ecx,8), %ebp
	pfsub %mm4, %mm5
	pfadd %mm4, %mm0
	pfsub %mm2, %mm3
	movq (%eax,%ebp), %mm4
	pfadd %mm2, %mm6
	movq (%edx,%ebp), %mm2
	leal (%ecx,%ecx,4), %ebp
	movq %mm5, 128(%esp)
	movq %mm2, %mm5
	pfadd %mm4, %mm2
	pfsub %mm4, %mm5
	movq %mm6, %mm4
	pfsub %mm2, %mm6
	pfadd %mm2, %mm4
	movq %mm3, %mm2
	pfpnacc %mm5, %mm2
	pswapd %mm5, %mm5
	pxor chs_hi, %mm6
	pfpnacc %mm3, %mm5
	movq %mm6, %mm3
	pfadd %mm1, %mm6
	pfsubr %mm1, %mm3
	movq %mm7, %mm1
	pfadd %mm4, %mm7
	pfsub %mm4, %mm1
	movq %mm6, 152(%esp)
	movq 144(%esp), %mm4
	movq %mm0, %mm6
	movq %mm3, 160(%esp)
	movq %mm5, %mm3
	pfacc %mm2, %mm5
	pfsub %mm4, %mm0
	pswapd %mm1, %mm1
	pfadd %mm4, %mm6
	movq %mm7, %mm4
	pfnacc %mm3, %mm2
	movq %mm1, %mm3
	pfmul KP707106781KP707106781, %mm5
	pxor chs_hi, %mm0
	pfsub %mm6, %mm4
	pfadd %mm6, %mm7
	movq 136(%esp), %mm6
	pfmul KP707106781KP707106781, %mm2
	pfadd %mm0, %mm1
	pfsub %mm0, %mm3
	movq %mm4, 264(%esp)
	movq 112(%esp), %mm0
	pswapd %mm6, %mm6
	movq %mm7, 272(%esp)
	movq %mm6, %mm4
	movq %mm1, 168(%esp)
	pfsub %mm0, %mm6
	movq %mm3, 224(%esp)
	movq 96(%esp), %mm3
	pfadd %mm0, %mm4
	movq 128(%esp), %mm0
	movq %mm6, %mm1
	pfsub %mm5, %mm6
	movq %mm4, %mm7
	pfsub %mm2, %mm4
	pfadd %mm5, %mm1
	pfadd %mm2, %mm7
	pswapd %mm3, %mm2
	movq %mm6, 176(%esp)
	movq 104(%esp), %mm6
	pfpnacc %mm0, %mm2
	movq %mm4, 192(%esp)
	movq 80(%esp), %mm4
	pfpnacc %mm3, %mm0
	movq %mm1, 184(%esp)
	movq %mm7, 200(%esp)
	movq 120(%esp), %mm1
	movq 88(%esp), %mm3
	pswapd %mm4, %mm4
	movq %mm0, %mm5
	pswapd %mm1, %mm1
	pfnacc %mm2, %mm0
	movq %mm4, %mm7
	pfsub %mm3, %mm4
	pfacc %mm5, %mm2
	pxor chs_lo, %mm1
	movq %mm6, %mm5
	pfadd %mm3, %mm7
	pfmul KP707106781KP707106781, %mm0
	movq %mm4, %mm3
	pfmul KP923879532KP382683432, %mm4
	pfmul KP707106781KP707106781, %mm2
	pfadd %mm1, %mm6
	pfsub %mm1, %mm5
	pfmul KP382683432KP923879532, %mm3
	movq %mm7, %mm1
	pfmul KP923879532KP382683432, %mm7
	pfmul KP382683432KP923879532, %mm1
	movq %mm0, 216(%esp)
	pswapd %mm6, %mm0
	pfmul KP923879532KP382683432, %mm6
	movq %mm2, 208(%esp)
	pfmul KP923879532KP382683432, %mm0
	pswapd %mm5, %mm2
	pfmul KP382683432KP923879532, %mm5
	pfmul KP382683432KP923879532, %mm2
	pfpnacc %mm3, %mm6
	movq (%edx,%ecx,4), %mm3
	pfpnacc %mm0, %mm4
	movq (%eax,%ecx,4), %mm0
	pfpnacc %mm7, %mm5
	pfpnacc %mm2, %mm1
	movq %mm6, 232(%esp)
	movq (%edx,%ebp,4), %mm2
	movq (%eax,%ebp,4), %mm6
	leal (%ecx,%ecx,2), %ebp
	movq %mm0, %mm7
	pfadd %mm3, %mm0
	movq %mm4, 240(%esp)
	leal (%ecx,%ebp,2), %ebp
	movq %mm5, 248(%esp)
	pfsub %mm3, %mm7
	movq %mm1, 256(%esp)
	movq %mm6, %mm4
	pfadd %mm2, %mm6
	movq (%eax,%ebp,4), %mm5
	movq (%edx,%ebp,4), %mm1
	movq %mm0, %mm3
	leal (%ecx,%ecx,2), %ebp
	pfsub %mm2, %mm4
	movq %mm7, 280(%esp)
	movq (%edx,%ebp,4), %mm7
	pfadd %mm6, %mm0
	pfsub %mm6, %mm3
	movq (%eax,%ebp,4), %mm6
	movq %mm1, %mm2
	pfsub %mm5, %mm1
	pswapd %mm4, %mm4
	leal (%ecx,%ecx,8), %ebp
	pfadd %mm5, %mm2
	pxor chs_lo, %mm4
	movq %mm6, %mm5
	pfadd %mm7, %mm6
	pswapd %mm1, %mm1
	pfsub %mm7, %mm5
	movq %mm2, %mm7
	pfadd %mm6, %mm2
	pfsub %mm6, %mm7
	movq %mm0, %mm6
	pxor chs_lo, %mm5
	pfadd %mm2, %mm0
	pfsubr %mm2, %mm6
	movq %mm1, %mm2
	pfsub %mm5, %mm1
	pfadd %mm5, %mm2
	movq %mm3, %mm5
	movq %mm0, 296(%esp)
	pfpnacc %mm7, %mm5
	pswapd %mm7, %mm7
	movq %mm6, 288(%esp)
	movq %mm1, %mm0
	pfmul KP382683432KP923879532, %mm1
	pfpnacc %mm3, %mm7
	movq %mm2, %mm6
	pfmul KP382683432KP923879532, %mm2
	pfmul KP923879532KP382683432, %mm0
	pfmul KP923879532KP382683432, %mm6
	movq %mm7, %mm3
	pfnacc %mm5, %mm7
	pfacc %mm3, %mm5
	movq 280(%esp), %mm3
	pfmul KP707106781KP707106781, %mm7
	pfmul KP707106781KP707106781, %mm5
	movq %mm7, 344(%esp)
	movq %mm3, %mm7
	pfsub %mm4, %mm3
	pfadd %mm4, %mm7
	movq %mm5, 304(%esp)
	movq %mm3, %mm4
	pfmul KP923879532KP382683432, %mm3
	movq %mm7, %mm5
	pfmul KP382683432KP923879532, %mm4
	pfmul KP923879532KP382683432, %mm7
	pfmul KP382683432KP923879532, %mm5
	pfpnacc %mm3, %mm2
	movq (%edx,%ebp,2), %mm3
	pfpnacc %mm6, %mm4
	pfpnacc %mm1, %mm7
	movq (%eax,%ebp,2), %mm1
	leal (%ecx,%ecx,2), %ebp
	pfpnacc %mm5, %mm0
	movq %mm2, 336(%esp)
	movq %mm4, 328(%esp)
	movq %mm7, 312(%esp)
	movq (%edx,%ecx,2), %mm5
	movq (%eax,%ecx,2), %mm2
	movq (%edx,%ebp,2), %mm4
	movq %mm1, %mm6
	pfadd %mm3, %mm1
	movq %mm0, 320(%esp)
	movq (%eax,%ebp,2), %mm0
	leal (%ecx,%ecx,2), %ebp
	movq %mm2, %mm7
	pfsub %mm5, %mm2
	pfsub %mm3, %mm6
	leal (%ebp,%ecx,8), %ebp
	pfadd %mm5, %mm7
	movq %mm0, %mm3
	pfsub %mm4, %mm0
	movq %mm2, 352(%esp)
	movq (%eax,%ebp,2), %mm2
	pfadd %mm4, %mm3
	movq %mm6, 360(%esp)
	movq (%edx,%ebp,2), %mm4
	movq %mm7, %mm5
	pfsub %mm1, %mm7
	leal (%ecx,%ecx,4), %ebp
	pfadd %mm1, %mm5
	movq %mm0, %mm1
	movq %mm4, %mm6
	pfsub %mm2, %mm4
	movq %mm7, 376(%esp)
	movq (%edx,%ebp,2), %mm7
	pfadd %mm2, %mm6
	movq %mm3, %mm2
	pfpnacc %mm4, %mm1
	pswapd %mm4, %mm4
	pfsub %mm6, %mm3
	pfadd %mm6, %mm2
	movq (%eax,%ebp,2), %mm6
	leal (%ecx,%ecx,2), %ebp
	pfpnacc %mm0, %mm4
	movq %mm1, 416(%esp)
	leal (%ecx,%ebp,4), %ebp
	pxor chs_hi, %mm3
	movq (%eax,%ebp,2), %mm1
	movq %mm6, %mm0
	pfsub %mm7, %mm6
	movq %mm4, 384(%esp)
	movq (%edx,%ebp,2), %mm4
	leal (%ecx,%ecx,2), %ebp
	pfadd %mm7, %mm0
	movq %mm3, 368(%esp)
	leal (%ebp,%ebp,4), %ebp
	movq %mm6, %mm3
	movq %mm4, %mm7
	pfsub %mm1, %mm4
	pfadd %mm1, %mm7
	movq %mm0, %mm1
	pfpnacc %mm4, %mm3
	pswapd %mm4, %mm4
	pfsubr %mm7, %mm0
	pfadd %mm7, %mm1
	movq (%eax,%ebp,2), %mm7
	pfpnacc %mm6, %mm4
	movq (%edx,%ebp,2), %mm6
	leal (%ecx,%ecx,2), %ebp
	movq %mm3, 392(%esp)
	leal (%ecx,%ebp,2), %ebp
	movq %mm0, 408(%esp)
	movq %mm4, 400(%esp)
	movq (%edx,%ebp,2), %mm0
	movq %mm6, %mm3
	movq (%eax,%ebp,2), %mm4
	pfsub %mm7, %mm6
	leal (%ecx,%ecx), %ebp
	pfadd %mm7, %mm3
	leal (%ecx,%ebp,8), %ebp
	movq %mm4, %mm7
	pfadd %mm0, %mm4
	pswapd %mm6, %mm6
	pfsub %mm0, %mm7
	movq %mm3, %mm0
	pfadd %mm4, %mm3
	pfsub %mm4, %mm0
	movq %mm5, %mm4
	pfsub %mm1, %mm5
	pxor chs_lo, %mm7
	pfadd %mm1, %mm4
	movq %mm3, %mm1
	pfsub %mm2, %mm3
	pswapd %mm0, %mm0
	pfadd %mm2, %mm1
	movq %mm4, %mm2
	pfadd %mm1, %mm4
	pfsubr %mm1, %mm2
	pswapd %mm3, %mm1
	pfpnacc %mm5, %mm1
	pfpnacc %mm3, %mm5
	movq %mm4, 560(%esp)
	movq %mm2, 552(%esp)
	movq 416(%esp), %mm3
	movq 384(%esp), %mm4
	movq %mm6, %mm2
	pfadd %mm7, %mm6
	movq %mm1, 432(%esp)
	pfsub %mm7, %mm2
	movq %mm3, %mm1
	movq %mm5, 424(%esp)
	movq 376(%esp), %mm5
	pfnacc %mm4, %mm3
	pfacc %mm1, %mm4
	movq %mm6, %mm7
	movq 408(%esp), %mm1
	pfmul KP707106781KP707106781, %mm3
	pfmul KP707106781KP707106781, %mm4
	pswapd %mm1, %mm1
	pxor chs_hi, %mm1
	pfsub %mm3, %mm6
	pfadd %mm3, %mm7
	movq %mm5, %mm3
	pfsub %mm1, %mm5
	pfadd %mm1, %mm3
	movq %mm2, %mm1
	movq %mm6, 448(%esp)
	movq 368(%esp), %mm6
	pfsub %mm4, %mm2
	movq %mm7, 440(%esp)
	pfadd %mm4, %mm1
	movq %mm5, 544(%esp)
	movq %mm3, 456(%esp)
	movq 352(%esp), %mm3
	movq %mm6, %mm7
	movq %mm2, 488(%esp)
	movq 360(%esp), %mm2
	pfadd %mm0, %mm6
	movq %mm1, 480(%esp)
	pfsubr %mm0, %mm7
	movq 400(%esp), %mm0
	movq %mm3, %mm1
	pswapd %mm2, %mm2
	movq %mm6, %mm5
	pfmul KP923879532KP382683432, %mm6
	movq %mm7, %mm4
	pfmul KP382683432KP923879532, %mm7
	pxor chs_lo, %mm2
	pfmul KP382683432KP923879532, %mm5
	pfmul KP923879532KP382683432, %mm4
	pfsub %mm2, %mm3
	pfadd %mm2, %mm1
	movq %mm0, %mm2
	movq %mm6, 472(%esp)
	movq %mm7, 504(%esp)
	movq %mm5, 464(%esp)
	movq 392(%esp), %mm7
	movq (%edx,%ecx), %mm5
	movq %mm3, %mm6
	movq %mm4, 496(%esp)
	movq %mm1, %mm4
	pfnacc %mm7, %mm0
	pfacc %mm2, %mm7
	pfmul KP707106781KP707106781, %mm0
	pfmul KP707106781KP707106781, %mm7
	movq (%eax,%ecx), %mm2
	pfadd %mm0, %mm3
	pfsub %mm0, %mm6
	movq %mm2, %mm0
	pfadd %mm7, %mm1
	pfsub %mm7, %mm4
	movq %mm3, 528(%esp)
	movq (%edx,%ebp), %mm7
	movq (%eax,%ebp), %mm3
	pfadd %mm5, %mm2
	pfsub %mm5, %mm0
	leal (%ecx,%ecx,8), %ebp
	movq %mm6, 536(%esp)
	movq %mm1, 512(%esp)
	movq (%edx,%ebp), %mm6
	movq (%eax,%ebp), %mm1
	leal (%ecx,%ecx,2), %ebp
	movq %mm3, %mm5
	pfadd %mm7, %mm3
	movq %mm4, 520(%esp)
	movq %mm0, 568(%esp)
	leal (%ecx,%ebp,8), %ebp
	movq %mm2, %mm0
	pfsub %mm7, %mm5
	movq (%eax,%ebp), %mm7
	movq %mm1, %mm4
	pfsub %mm6, %mm1
	pfadd %mm3, %mm0
	pfsub %mm3, %mm2
	movq (%edx,%ebp), %mm3
	leal (%ecx,%ecx,4), %ebp
	movq %mm5, 576(%esp)
	pfadd %mm6, %mm4
	movq %mm1, %mm6
	movq %mm0, 624(%esp)
	movq %mm3, %mm5
	pfsub %mm7, %mm3
	movq %mm2, 600(%esp)
	movq (%edx,%ebp), %mm2
	movq %mm4, %mm0
	pfadd %mm7, %mm5
	movq (%eax,%ebp), %mm7
	leal (%ecx,%ecx,2), %ebp
	pfpnacc %mm3, %mm6
	leal (%ecx,%ebp,4), %ebp
	pswapd %mm3, %mm3
	pfadd %mm5, %mm0
	pfpnacc %mm1, %mm3
	movq %mm6, 584(%esp)
	movq (%edx,%ebp), %mm1
	movq (%eax,%ebp), %mm6
	leal (%ecx,%ecx,4), %ebp
	pfsubr %mm5, %mm4
	movq %mm7, %mm5
	leal (%ecx,%ebp,4), %ebp
	pfsub %mm2, %mm7
	movq %mm0, 616(%esp)
	pfadd %mm2, %mm5
	movq %mm3, 592(%esp)
	movq (%edx,%ebp), %mm0
	movq (%eax,%ebp), %mm2
	leal (%ecx,%ecx,2), %ebp
	movq %mm4, 608(%esp)
	movq %mm6, %mm4
	pfsub %mm1, %mm6
	leal (%ebp,%ebp,8), %ebp
	pswapd %mm7, %mm7
	pfadd %mm1, %mm4
	movq %mm2, %mm3
	pfsub %mm0, %mm2
	leal (%ebp,%ecx,2), %ebp
	pxor chs_lo, %mm6
	pfadd %mm0, %mm3
	movq (%edx,%ebp), %mm0
	movq (%eax,%ebp), %mm1
	/* simd data load/store barrier */ 
	leal (%esi,%esi), %ebp
	addl 1052(%esp), %eax
	pxor chs_lo, %mm2
	addl 1052(%esp), %edx
	movq %mm2, 632(%esp)
	movq %mm0, %mm2
	pfsub %mm1, %mm0
	pfadd %mm1, %mm2
	movq %mm5, %mm1
	pfadd %mm3, %mm5
	pfsub %mm3, %mm1
	pswapd %mm0, %mm0
	movq %mm2, %mm3
	pfsub %mm4, %mm2
	pfadd %mm4, %mm3
	movq %mm5, %mm4
	pfsubr %mm3, %mm4
	pfadd %mm3, %mm5
	movq %mm0, %mm3
	pfsub %mm6, %mm0
	pfadd %mm6, %mm3
	movq 632(%esp), %mm6
	pswapd %mm4, %mm4
	movq %mm0, 640(%esp)
	movq %mm7, %mm0
	pxor chs_hi, %mm4
	pfsub %mm6, %mm7
	pfadd %mm6, %mm0
	movq %mm7, 648(%esp)
	movq %mm0, 656(%esp)
	movq 624(%esp), %mm6
	movq 616(%esp), %mm7
	movq %mm6, %mm0
	pfadd %mm7, %mm0
	pfsub %mm7, %mm6
	movq %mm0, %mm7
	pfsub %mm5, %mm0
	pfadd %mm5, %mm7
	movq %mm6, %mm5
	pfsub %mm4, %mm6
	pfadd %mm4, %mm5
	movq %mm6, 672(%esp)
	movq 608(%esp), %mm4
	movq 600(%esp), %mm6
	pswapd %mm4, %mm4
	movq %mm5, 664(%esp)
	pxor chs_hi, %mm4
	movq %mm6, %mm5
	pfadd %mm4, %mm5
	pfsub %mm4, %mm6
	movq %mm1, %mm4
	pfpnacc %mm2, %mm4
	pswapd %mm2, %mm2
	movq %mm5, 680(%esp)
	pfpnacc %mm1, %mm2
	movq %mm6, 704(%esp)
	movq 592(%esp), %mm1
	movq 584(%esp), %mm6
	movq %mm4, %mm5
	pfacc %mm2, %mm4
	pfnacc %mm5, %mm2
	movq %mm1, %mm5
	pfnacc %mm6, %mm1
	pfacc %mm5, %mm6
	movq 576(%esp), %mm5
	pfmul KP707106781KP707106781, %mm4
	pfmul KP707106781KP707106781, %mm2
	pfmul KP707106781KP707106781, %mm1
	pswapd %mm5, %mm5
	pfmul KP707106781KP707106781, %mm6
	pxor chs_lo, %mm5
	movq %mm4, 688(%esp)
	movq %mm2, 696(%esp)
	movq 568(%esp), %mm4
	movq %mm4, %mm2
	pfadd %mm5, %mm4
	pfsub %mm5, %mm2
	movq %mm4, %mm5
	pfadd %mm6, %mm4
	pfsub %mm6, %mm5
	movq %mm2, %mm6
	pfadd %mm1, %mm2
	movq %mm4, 720(%esp)
	movq 656(%esp), %mm4
	pfsub %mm1, %mm6
	movq %mm3, %mm1
	pfmul KP382683432KP923879532, %mm3
	movq %mm5, 712(%esp)
	pfmul KP923879532KP382683432, %mm1
	movq %mm2, 768(%esp)
	pswapd %mm4, %mm5
	pfmul KP382683432KP923879532, %mm4
	movq %mm6, 736(%esp)
	movq 640(%esp), %mm2
	pfmul KP382683432KP923879532, %mm5
	movq %mm2, %mm6
	pfmul KP923879532KP382683432, %mm2
	pfpnacc %mm4, %mm3
	pfmul KP382683432KP923879532, %mm6
	pfpnacc %mm1, %mm5
	movq 648(%esp), %mm1
	movq %mm3, %mm4
	pfnacc %mm5, %mm3
	pfacc %mm4, %mm5
	pswapd %mm1, %mm4
	pfmul KP923879532KP382683432, %mm1
	pfmul KP923879532KP382683432, %mm4
	movq %mm3, 728(%esp)
	movq %mm5, 760(%esp)
	movq 272(%esp), %mm3
	movq %mm7, %mm5
	pfpnacc %mm1, %mm2
	pfsubr %mm3, %mm7
	pfadd %mm3, %mm5
	movq 296(%esp), %mm3
	pfpnacc %mm6, %mm4
	movq 72(%esp), %mm6
	movq %mm2, %mm1
	pswapd %mm7, %mm7
	pfnacc %mm4, %mm2
	pxor chs_hi, %mm7
	pfacc %mm1, %mm4
	movq %mm6, %mm1
	pfadd %mm3, %mm6
	pfsub %mm3, %mm1
	movq %mm2, 744(%esp)
	movq %mm4, 752(%esp)
	movq 560(%esp), %mm3
	movq %mm6, %mm2
	pfsub %mm3, %mm6
	pfadd %mm3, %mm2
	movq %mm6, %mm4
	pfsub %mm7, %mm6
	movq %mm2, %mm3
	pfadd %mm5, %mm2
	pfadd %mm7, %mm4
	movq 264(%esp), %mm7
	pfsub %mm5, %mm3
	movq %mm6, (%edi,%ebp,8)
	movq 672(%esp), %mm6
	movq %mm2, (%ebx)
	pswapd %mm7, %mm5
	movq %mm4, (%ebx,%ebp,8)
	leal (%esi,%esi,2), %ebp
	movq %mm3, (%edi)
	movq 552(%esp), %mm3
	pfpnacc %mm0, %mm5
	pswapd %mm6, %mm2
	pfpnacc %mm7, %mm0
	movq %mm1, %mm7
	pfmul KP382683432KP923879532, %mm6
	pfmul KP382683432KP923879532, %mm2
	pswapd %mm3, %mm3
	movq %mm5, %mm4
	pfnacc %mm0, %mm5
	pxor chs_hi, %mm3
	pfacc %mm4, %mm0
	pfsub %mm3, %mm1
	pfmul KP707106781KP707106781, %mm5
	pfadd %mm3, %mm7
	pfmul KP707106781KP707106781, %mm0
	movq %mm1, %mm4
	movq %mm7, %mm3
	pfadd %mm5, %mm1
	pfsub %mm5, %mm4
	movq 224(%esp), %mm5
	pfadd %mm0, %mm7
	pfsub %mm0, %mm3
	movq %mm1, (%ebx,%ebp,8)
	movq 168(%esp), %mm1
	movq %mm4, (%edi,%ebp,8)
	movq 664(%esp), %mm4
	movq %mm5, %mm0
	pfmul KP382683432KP923879532, %mm5
	movq %mm7, (%ebx,%esi,8)
	leal (%esi,%esi,2), %ebp
	pfmul KP923879532KP382683432, %mm0
	movq %mm3, (%edi,%esi,8)
	movq %mm1, %mm7
	pfmul KP382683432KP923879532, %mm1
	leal (%esi,%ebp,2), %ebp
	pswapd %mm4, %mm3
	pfmul KP923879532KP382683432, %mm4
	pfmul KP923879532KP382683432, %mm7
	pfmul KP923879532KP382683432, %mm3
	pfpnacc %mm2, %mm5
	movq 432(%esp), %mm2
	pfpnacc %mm0, %mm6
	movq 424(%esp), %mm0
	pfpnacc %mm1, %mm4
	movq 64(%esp), %mm1
	pfpnacc %mm3, %mm7
	movq %mm2, %mm3
	pfnacc %mm0, %mm2
	pfacc %mm3, %mm0
	movq %mm4, 776(%esp)
	movq 288(%esp), %mm3
	movq %mm1, %mm4
	pfmul KP707106781KP707106781, %mm2
	pswapd %mm3, %mm3
	pfmul KP707106781KP707106781, %mm0
	pxor chs_hi, %mm3
	pfsub %mm3, %mm4
	pfadd %mm3, %mm1
	movq %mm4, %mm3
	pfsub %mm2, %mm4
	pfadd %mm2, %mm3
	movq %mm1, %mm2
	pfsub %mm0, %mm1
	pfadd %mm0, %mm2
	movq %mm5, %mm0
	pfnacc %mm6, %mm5
	pfacc %mm0, %mm6
	movq %mm4, %mm0
	pfsub %mm5, %mm0
	pfadd %mm5, %mm4
	movq %mm3, %mm5
	pfadd %mm6, %mm3
	pfsub %mm6, %mm5
	movq 776(%esp), %mm6
	movq %mm0, (%edi,%ebp,4)
	movq %mm7, %mm0
	movq %mm4, (%ebx,%ebp,4)
	leal (%esi,%esi,2), %ebp
	movq %mm1, %mm4
	pfnacc %mm6, %mm7
	movq %mm5, (%edi,%ebp,4)
	movq %mm2, %mm5
	pfacc %mm0, %mm6
	movq 56(%esp), %mm0
	movq %mm3, (%ebx,%ebp,4)
	leal (%esi,%esi,4), %ebp
	movq 16(%esp), %mm3
	pfsub %mm7, %mm4
	pfadd %mm7, %mm1
	pswapd %mm0, %mm0
	pfsub %mm6, %mm5
	movq %mm3, %mm7
	pfadd %mm6, %mm2
	movq 704(%esp), %mm6
	pxor chs_hi, %mm0
	movq %mm4, (%edi,%ebp,4)
	movq 696(%esp), %mm4
	movq %mm1, (%ebx,%ebp,4)
	leal (%esi,%esi,2), %ebp
	movq %mm5, (%edi,%esi,4)
	movq 344(%esp), %mm5
	movq %mm6, %mm1
	pfadd %mm0, %mm3
	movq %mm2, (%ebx,%esi,4)
	pfsub %mm0, %mm7
	movq 160(%esp), %mm0
	leal (%esi,%ebp,2), %ebp
	pfsub %mm4, %mm6
	pfadd %mm4, %mm1
	movq %mm3, 784(%esp)
	movq 216(%esp), %mm4
	movq %mm7, %mm2
	movq %mm0, %mm3
	pfadd %mm5, %mm7
	pfadd %mm4, %mm0
	pfsub %mm5, %mm2
	movq %mm1, %mm5
	pfmul KP831469612KP555570233, %mm1
	pfsub %mm4, %mm3
	pswapd %mm5, %mm5
	movq %mm0, %mm4
	pfmul KP555570233KP831469612, %mm0
	pfmul KP831469612KP555570233, %mm5
	pfmul KP831469612KP555570233, %mm4
	pfpnacc %mm0, %mm1
	movq %mm3, %mm0
	pfmul KP195090322KP980785280, %mm3
	pfpnacc %mm5, %mm4
	movq 544(%esp), %mm5
	pfmul KP980785280KP195090322, %mm0
	movq %mm1, 800(%esp)
	movq %mm5, %mm1
	pfmul KP382683432KP923879532, %mm5
	movq %mm4, 792(%esp)
	movq 504(%esp), %mm4
	pfmul KP923879532KP382683432, %mm1
	pfpnacc 496(%esp), %mm5
	pfpnacc %mm1, %mm4
	movq %mm4, %mm1
	pfnacc %mm5, %mm4
	pfacc %mm1, %mm5
	pswapd %mm6, %mm1
	pfmul KP195090322KP980785280, %mm6
	pfmul KP195090322KP980785280, %mm1
	pfpnacc %mm0, %mm6
	movq %mm2, %mm0
	pfpnacc %mm1, %mm3
	pfadd %mm4, %mm2
	pfsub %mm4, %mm0
	movq %mm6, %mm1
	pfacc %mm3, %mm6
	pfnacc %mm1, %mm3
	movq %mm2, %mm4
	movq %mm0, %mm1
	pfsub %mm6, %mm2
	pfadd %mm6, %mm4
	movq %mm7, %mm6
	pfsub %mm3, %mm1
	pfadd %mm3, %mm0
	movq 800(%esp), %mm3
	movq %mm2, (%edi,%ebp,2)
	movq 792(%esp), %mm2
	pfadd %mm5, %mm7
	movq %mm4, (%ebx,%ebp,2)
	pfsub %mm5, %mm6
	leal (%esi,%esi,2), %ebp
	movq %mm3, %mm4
	leal (%ebp,%ebp,4), %ebp
	pfacc %mm2, %mm3
	movq %mm7, %mm5
	pfnacc %mm4, %mm2
	movq %mm1, (%edi,%ebp,2)
	movq %mm6, %mm4
	movq 784(%esp), %mm1
	movq %mm0, (%ebx,%ebp,2)
	leal (%esi,%esi,2), %ebp
	movq 304(%esp), %mm0
	pfsub %mm3, %mm5
	pfadd %mm3, %mm7
	pfadd %mm2, %mm6
	movq %mm1, %mm3
	pfsub %mm2, %mm4
	movq 152(%esp), %mm2
	movq %mm5, (%edi,%ebp,2)
	movq 208(%esp), %mm5
	pfadd %mm0, %mm1
	movq %mm7, (%ebx,%ebp,2)
	leal (%esi,%esi,2), %ebp
	pfsub %mm0, %mm3
	movq 680(%esp), %mm0
	leal (%ebp,%esi,8), %ebp
	movq %mm2, %mm7
	pfsub %mm5, %mm2
	movq %mm6, (%ebx,%ebp,2)
	movq 688(%esp), %mm6
	pfadd %mm5, %mm7
	movq %mm0, %mm5
	movq %mm4, (%edi,%ebp,2)
	leal (%esi,%esi,2), %ebp
	leal (%esi,%ebp,4), %ebp
	pfadd %mm6, %mm0
	movq %mm7, %mm4
	pfmul KP980785280KP195090322, %mm7
	pfsub %mm6, %mm5
	pswapd %mm4, %mm4
	movq %mm0, %mm6
	pfmul KP980785280KP195090322, %mm4
	pfmul KP195090322KP980785280, %mm0
	pfmul KP980785280KP195090322, %mm6
	pfpnacc %mm0, %mm7
	movq %mm5, %mm0
	pfmul KP555570233KP831469612, %mm5
	pfpnacc %mm4, %mm6
	movq 456(%esp), %mm4
	pfmul KP831469612KP555570233, %mm0
	movq %mm7, 816(%esp)
	movq %mm4, %mm7
	pfmul KP923879532KP382683432, %mm4
	movq %mm6, 808(%esp)
	movq 472(%esp), %mm6
	pfmul KP382683432KP923879532, %mm7
	pfpnacc 464(%esp), %mm4
	pfpnacc %mm7, %mm6
	movq %mm6, %mm7
	pfnacc %mm4, %mm6
	pfacc %mm7, %mm4
	pswapd %mm2, %mm7
	pfmul KP555570233KP831469612, %mm2
	pfmul KP555570233KP831469612, %mm7
	pfpnacc %mm0, %mm2
	movq %mm3, %mm0
	pfpnacc %mm7, %mm5
	pfsub %mm6, %mm3
	pfadd %mm6, %mm0
	movq %mm2, %mm7
	pfnacc %mm5, %mm2
	pfacc %mm7, %mm5
	movq %mm3, %mm6
	movq %mm0, %mm7
	pfsub %mm2, %mm3
	pfadd %mm2, %mm6
	movq %mm1, %mm2
	pfsub %mm5, %mm7
	pfadd %mm5, %mm0
	movq 816(%esp), %mm5
	movq %mm3, (%edi,%ebp,2)
	movq 808(%esp), %mm3
	pfsub %mm4, %mm1
	movq %mm6, (%ebx,%ebp,2)
	leal (%esi,%esi,4), %ebp
	pfadd %mm4, %mm2
	movq 448(%esp), %mm4
	movq %mm5, %mm6
	movq %mm0, (%ebx,%ebp,2)
	pfnacc %mm3, %mm5
	movq %mm1, %mm0
	movq %mm7, (%edi,%ebp,2)
	pfacc %mm6, %mm3
	movq %mm2, %mm6
	leal (%esi,%esi,8), %ebp
	movq %mm4, %mm7
	pfmul KP980785280KP195090322, %mm4
	pfadd %mm5, %mm0
	pfmul KP195090322KP980785280, %mm7
	pfsub %mm5, %mm1
	movq 536(%esp), %mm5
	pfsub %mm3, %mm6
	pfadd %mm3, %mm2
	movq %mm0, (%ebx,%ebp,2)
	movq 768(%esp), %mm0
	movq %mm5, %mm3
	pfmul KP195090322KP980785280, %mm5
	movq %mm1, (%edi,%ebp,2)
	movq 760(%esp), %mm1
	movq %mm6, (%edi,%esi,2)
	leal (%esi,%esi,2), %ebp
	pfmul KP980785280KP195090322, %mm3
	movq %mm2, (%ebx,%esi,2)
	movq %mm0, %mm6
	leal (%ebp,%esi,8), %ebp
	pfsub %mm1, %mm0
	pfpnacc %mm4, %mm5
	pfadd %mm1, %mm6
	pfpnacc %mm3, %mm7
	movq 256(%esp), %mm3
	pswapd %mm0, %mm2
	pfmul KP471396736KP881921264, %mm0
	pfmul KP471396736KP881921264, %mm2
	pswapd %mm6, %mm1
	movq %mm7, %mm4
	pfnacc %mm5, %mm7
	pfmul KP956940335KP290284677, %mm6
	pfmul KP956940335KP290284677, %mm1
	pfacc %mm4, %mm5
	movq %mm7, 832(%esp)
	movq 248(%esp), %mm4
	movq %mm3, %mm7
	movq %mm5, 824(%esp)
	pfacc %mm4, %mm3
	movq 200(%esp), %mm5
	pfnacc %mm7, %mm4
	movq %mm5, %mm7
	pfsub %mm3, %mm5
	pfadd %mm3, %mm7
	movq %mm5, %mm3
	pfmul KP471396736KP881921264, %mm5
	pfmul KP881921264KP471396736, %mm3
	pfpnacc %mm2, %mm5
	movq %mm7, %mm2
	pfmul KP290284677KP956940335, %mm7
	pfpnacc %mm3, %mm0
	pfmul KP956940335KP290284677, %mm2
	movq %mm5, 864(%esp)
	movq %mm0, 896(%esp)
	movq 440(%esp), %mm3
	movq 528(%esp), %mm0
	movq %mm3, %mm5
	pfpnacc %mm7, %mm6
	pfmul KP555570233KP831469612, %mm3
	movq 48(%esp), %mm7
	pfpnacc %mm1, %mm2
	pfmul KP831469612KP555570233, %mm5
	movq %mm0, %mm1
	pfmul KP831469612KP555570233, %mm0
	movq %mm6, 840(%esp)
	movq %mm7, %mm6
	pfmul KP555570233KP831469612, %mm1
	movq %mm2, 848(%esp)
	movq 40(%esp), %mm2
	pfpnacc %mm3, %mm0
	pfadd %mm2, %mm7
	pfpnacc %mm1, %mm5
	movq 336(%esp), %mm1
	pfsub %mm2, %mm6
	movq 328(%esp), %mm2
	movq %mm5, %mm3
	pfnacc %mm0, %mm5
	pfacc %mm3, %mm0
	movq %mm1, %mm3
	pfnacc %mm2, %mm1
	pfacc %mm3, %mm2
	movq %mm6, %mm3
	movq %mm0, 856(%esp)
	movq %mm7, %mm0
	pfadd %mm1, %mm6
	pfsub %mm1, %mm3
	movq 192(%esp), %mm1
	pfadd %mm2, %mm7
	pfsub %mm2, %mm0
	movq %mm6, 872(%esp)
	movq %mm3, 888(%esp)
	movq 736(%esp), %mm6
	movq 728(%esp), %mm3
	movq %mm1, %mm2
	pfsub %mm4, %mm1
	movq %mm7, 880(%esp)
	pfadd %mm4, %mm2
	movq %mm6, %mm7
	pfsub %mm3, %mm6
	pfadd %mm3, %mm7
	pswapd %mm1, %mm4
	pfmul KP098017140KP995184726, %mm1
	pfmul KP098017140KP995184726, %mm4
	movq %mm6, %mm3
	pfmul KP995184726KP098017140, %mm6
	pfmul KP098017140KP995184726, %mm3
	pfpnacc %mm6, %mm1
	movq %mm7, %mm6
	pfmul KP634393284KP773010453, %mm7
	pfpnacc %mm4, %mm3
	pswapd %mm2, %mm4
	pfmul KP773010453KP634393284, %mm2
	pfmul KP773010453KP634393284, %mm6
	pfmul KP773010453KP634393284, %mm4
	pfpnacc %mm7, %mm2
	movq %mm0, %mm7
	pfsub %mm5, %mm0
	pfpnacc %mm4, %mm6
	movq 896(%esp), %mm4
	pfadd %mm5, %mm7
	movq %mm6, 904(%esp)
	movq 864(%esp), %mm5
	movq %mm4, %mm6
	pfacc %mm5, %mm4
	pfnacc %mm6, %mm5
	movq %mm7, %mm6
	pfsub %mm4, %mm6
	pfadd %mm4, %mm7
	movq %mm0, %mm4
	pfadd %mm5, %mm0
	pfsub %mm5, %mm4
	movq 888(%esp), %mm5
	movq %mm6, (%edi,%ebp)
	movq 832(%esp), %mm6
	movq %mm7, (%ebx,%ebp)
	leal (%esi,%esi,2), %ebp
	movq %mm5, %mm7
	leal (%ebp,%ebp,8), %ebp
	pfsub %mm6, %mm5
	movq %mm4, (%edi,%ebp)
	movq %mm1, %mm4
	pfnacc %mm3, %mm1
	pfadd %mm6, %mm7
	movq %mm0, (%ebx,%ebp)
	leal (%esi,%esi,2), %ebp
	pfacc %mm4, %mm3
	movq 880(%esp), %mm4
	movq %mm5, %mm6
	leal (%ebp,%ebp,4), %ebp
	pfadd %mm1, %mm5
	pfsub %mm1, %mm6
	leal (%esi,%ebp,2), %ebp
	movq 856(%esp), %mm1
	movq %mm7, %mm0
	pfsub %mm3, %mm7
	movq %mm5, (%ebx,%ebp)
	movq 848(%esp), %mm5
	pfadd %mm3, %mm0
	movq %mm6, (%edi,%ebp)
	movq 840(%esp), %mm6
	movq %mm4, %mm3
	leal (%esi,%esi,2), %ebp
	pfsub %mm1, %mm4
	pfadd %mm1, %mm3
	movq %mm5, %mm1
	leal (%ebp,%ebp,4), %ebp
	pfnacc %mm6, %mm5
	movq %mm0, (%ebx,%ebp)
	movq %mm4, %mm0
	pfacc %mm1, %mm6
	movq %mm7, (%edi,%ebp)
	leal (%esi,%esi,8), %ebp
	movq 872(%esp), %mm1
	movq %mm3, %mm7
	pfsub %mm5, %mm0
	leal (%esi,%ebp,2), %ebp
	pfadd %mm5, %mm4
	movq 824(%esp), %mm5
	pfsub %mm6, %mm7
	pfadd %mm6, %mm3
	movq %mm1, %mm6
	movq %mm0, (%edi,%ebp)
	movq 904(%esp), %mm0
	pfsub %mm5, %mm1
	movq %mm4, (%ebx,%ebp)
	movq %mm2, %mm4
	pfadd %mm5, %mm6
	leal (%esi,%esi,2), %ebp
	movq 520(%esp), %mm5
	pfnacc %mm0, %mm2
	movq %mm3, (%ebx,%ebp)
	pfacc %mm4, %mm0
	movq %mm1, %mm4
	movq %mm7, (%edi,%ebp)
	movq %mm6, %mm3
	leal (%esi,%esi,2), %ebp
	movq %mm5, %mm7
	pfmul KP831469612KP555570233, %mm5
	pfadd %mm2, %mm4
	pfmul KP555570233KP831469612, %mm7
	leal (%ebp,%ebp,4), %ebp
	pfsub %mm2, %mm1
	movq 488(%esp), %mm2
	pfsub %mm0, %mm3
	leal (%ebp,%esi,8), %ebp
	pfadd %mm0, %mm6
	movq %mm4, (%ebx,%ebp)
	movq 720(%esp), %mm4
	pswapd %mm2, %mm0
	pfmul KP555570233KP831469612, %mm2
	movq %mm1, (%edi,%ebp)
	leal (%esi,%esi,2), %ebp
	movq 752(%esp), %mm1
	pfmul KP555570233KP831469612, %mm0
	leal (%esi,%ebp,2), %ebp
	movq %mm3, (%edi,%ebp)
	pfpnacc %mm5, %mm2
	movq %mm6, (%ebx,%ebp)
	movq %mm4, %mm6
	pfsub %mm1, %mm4
	leal (%esi,%esi,8), %ebp
	pfpnacc %mm0, %mm7
	movq 240(%esp), %mm0
	pfadd %mm1, %mm6
	movq %mm2, %mm3
	pswapd %mm4, %mm5
	pfmul KP634393284KP773010453, %mm4
	pfnacc %mm7, %mm2
	pfacc %mm3, %mm7
	movq 232(%esp), %mm3
	pfmul KP634393284KP773010453, %mm5
	pswapd %mm6, %mm1
	pfmul KP995184726KP098017140, %mm6
	movq %mm2, 920(%esp)
	movq %mm0, %mm2
	pfmul KP995184726KP098017140, %mm1
	movq %mm7, 912(%esp)
	pfacc %mm3, %mm0
	movq 184(%esp), %mm7
	pfnacc %mm2, %mm3
	movq %mm7, %mm2
	pfsub %mm0, %mm7
	pfadd %mm0, %mm2
	movq %mm7, %mm0
	pfmul KP634393284KP773010453, %mm7
	pfmul KP773010453KP634393284, %mm0
	pfpnacc %mm5, %mm7
	movq %mm2, %mm5
	pfmul KP098017140KP995184726, %mm2
	pfpnacc %mm0, %mm4
	pfmul KP995184726KP098017140, %mm5
	movq %mm7, 952(%esp)
	movq %mm4, 984(%esp)
	movq 512(%esp), %mm0
	movq 480(%esp), %mm4
	movq %mm0, %mm7
	pfmul KP195090322KP980785280, %mm0
	pfpnacc %mm2, %mm6
	movq 32(%esp), %mm2
	pfpnacc %mm1, %mm5
	pfmul KP980785280KP195090322, %mm7
	pswapd %mm4, %mm1
	pfmul KP980785280KP195090322, %mm4
	movq %mm6, 928(%esp)
	movq %mm2, %mm6
	pfmul KP980785280KP195090322, %mm1
	movq %mm5, 936(%esp)
	movq 24(%esp), %mm5
	pfpnacc %mm0, %mm4
	pfadd %mm5, %mm2
	pfsub %mm5, %mm6
	movq 312(%esp), %mm5
	pfpnacc %mm1, %mm7
	movq 320(%esp), %mm1
	movq %mm4, %mm0
	pfnacc %mm7, %mm4
	pfacc %mm0, %mm7
	movq %mm1, %mm0
	pfnacc %mm5, %mm1
	pfacc %mm0, %mm5
	movq %mm6, %mm0
	movq %mm7, 944(%esp)
	movq %mm2, %mm7
	pfadd %mm1, %mm6
	pfsub %mm1, %mm0
	movq 176(%esp), %mm1
	pfadd %mm5, %mm2
	pfsub %mm5, %mm7
	movq %mm6, 960(%esp)
	movq %mm0, 976(%esp)
	movq 712(%esp), %mm6
	movq 744(%esp), %mm0
	movq %mm1, %mm5
	pfsub %mm3, %mm1
	movq %mm2, 968(%esp)
	pfadd %mm3, %mm5
	movq %mm6, %mm2
	pfsub %mm0, %mm6
	pfadd %mm0, %mm2
	pswapd %mm1, %mm3
	pfmul KP290284677KP956940335, %mm1
	pfmul KP290284677KP956940335, %mm3
	movq %mm6, %mm0
	pfmul KP956940335KP290284677, %mm6
	pfmul KP290284677KP956940335, %mm0
	pfpnacc %mm6, %mm1
	movq %mm2, %mm6
	pfmul KP471396736KP881921264, %mm2
	pfpnacc %mm3, %mm0
	pswapd %mm5, %mm3
	pfmul KP881921264KP471396736, %mm5
	pfmul KP881921264KP471396736, %mm6
	pfmul KP881921264KP471396736, %mm3
	pfpnacc %mm2, %mm5
	movq %mm7, %mm2
	pfsub %mm4, %mm7
	pfpnacc %mm3, %mm6
	movq 984(%esp), %mm3
	pfadd %mm4, %mm2
	movq %mm6, 992(%esp)
	movq 952(%esp), %mm4
	movq %mm3, %mm6
	pfacc %mm4, %mm3
	pfnacc %mm6, %mm4
	movq %mm2, %mm6
	pfsub %mm3, %mm6
	pfadd %mm3, %mm2
	movq %mm7, %mm3
	pfadd %mm4, %mm7
	pfsub %mm4, %mm3
	movq 976(%esp), %mm4
	movq %mm6, (%edi,%ebp)
	movq 920(%esp), %mm6
	movq %mm2, (%ebx,%ebp)
	leal (%esi,%esi,2), %ebp
	movq %mm4, %mm2
	leal (%esi,%ebp,8), %ebp
	pfsub %mm6, %mm4
	movq %mm3, (%edi,%ebp)
	movq %mm1, %mm3
	pfnacc %mm0, %mm1
	pfadd %mm6, %mm2
	movq %mm7, (%ebx,%ebp)
	leal (%esi,%esi,2), %ebp
	pfacc %mm3, %mm0
	movq 968(%esp), %mm3
	movq %mm4, %mm6
	leal (%ebp,%ebp,8), %ebp
	pfadd %mm1, %mm4
	pfsub %mm1, %mm6
	leal (%ebp,%esi,2), %ebp
	movq 944(%esp), %mm1
	movq %mm2, %mm7
	pfsub %mm0, %mm2
	movq %mm4, (%ebx,%ebp)
	movq 936(%esp), %mm4
	pfadd %mm0, %mm7
	movq %mm6, (%edi,%ebp)
	movq 928(%esp), %mm6
	movq %mm3, %mm0
	leal (%esi,%esi,2), %ebp
	pfsub %mm1, %mm3
	pfadd %mm1, %mm0
	movq %mm4, %mm1
	leal (%esi,%ebp,4), %ebp
	pfnacc %mm6, %mm4
	movq %mm7, (%ebx,%ebp)
	movq %mm3, %mm7
	pfacc %mm1, %mm6
	movq 960(%esp), %mm1
	movq %mm2, (%edi,%ebp)
	leal (%esi,%esi), %ebp
	movq %mm0, %mm2
	pfadd %mm4, %mm7
	leal (%esi,%ebp,8), %ebp
	pfsub %mm4, %mm3
	movq 912(%esp), %mm4
	pfsub %mm6, %mm2
	pfadd %mm6, %mm0
	movq %mm1, %mm6
	movq %mm7, (%ebx,%ebp)
	movq 992(%esp), %mm7
	pfsub %mm4, %mm6
	movq %mm3, (%edi,%ebp)
	movq %mm5, %mm3
	pfadd %mm4, %mm1
	leal (%esi,%esi,4), %ebp
	movq %mm2, (%edi,%esi)
	movq %mm0, (%ebx,%esi)
	pfnacc %mm7, %mm5
	leal (%esi,%ebp,4), %ebp
	pfacc %mm3, %mm7
	movq %mm6, %mm4
	movq %mm1, %mm2
	pfsub %mm5, %mm4
	pfadd %mm5, %mm6
	pfsub %mm7, %mm2
	pfadd %mm7, %mm1
	movq %mm4, (%edi,%ebp)
	movq %mm6, (%ebx,%ebp)
	leal (%esi,%esi,4), %ebp
	movq %mm2, (%edi,%ebp)
	movq %mm1, (%ebx,%ebp)
	addl 1056(%esp), %ebx
	addl 1056(%esp), %edi
	decl 1048(%esp)
	jnz .L0
	femms 
	movl 1016(%esp), %ebx
	movl 1012(%esp), %esi
	movl 1008(%esp), %edi
	movl 1004(%esp), %ebp
	addl $1020, %esp
	ret 

.section .rodata
nam:
	.string "n1k7i_64"
	.align 4
desc:
	.long 64
	.long nam
	.double 456
	.double 124
	.double 0
	.double 0
	.long fftwf_kdft_k7_pgenus
	.long 0
	.long 0
	.long 0
	.long 0

.text
	.align 4
.globl fftwf_codelet_n1k7i_64
fftwf_codelet_n1k7i_64:
	subl $12,%esp
	addl $-4,%esp
	pushl $desc
	pushl $n1k7i_64
	pushl 28(%esp)
	call fftwf_kdft_register
	addl $16,%esp
	addl $12,%esp
	ret

