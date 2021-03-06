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
/* Generated on Sat Jul  5 21:56:41 EDT 2003 */

#include "codelet-rdft.h"

/* Generated by: /homee/stevenj/cvs/fftw3.0.1/genfft/gen_r2hc -compact -variables 4 -n 8 -name r2hc_8 -include r2hc.h */

/*
 * This function contains 20 FP additions, 2 FP multiplications,
 * (or, 20 additions, 2 multiplications, 0 fused multiply/add),
 * 14 stack variables, and 16 memory accesses
 */
/*
 * Generator Id's : 
 * $Id: algsimp.ml,v 1.7 2003/03/15 20:29:42 stevenj Exp $
 * $Id: fft.ml,v 1.2 2003/03/15 20:29:42 stevenj Exp $
 * $Id: gen_r2hc.ml,v 1.13 2003/04/17 19:25:50 athena Exp $
 */

#include "r2hc.h"

static void r2hc_8(const R *I, R *ro, R *io, stride is, stride ros, stride ios, int v, int ivs, int ovs)
{
     DK(KP707106781, +0.707106781186547524400844362104849039284835938);
     int i;
     for (i = v; i > 0; i = i - 1, I = I + ivs, ro = ro + ovs, io = io + ovs) {
	  E T3, T7, Td, Tj, T6, Tg, Ta, Ti;
	  {
	       E T1, T2, Tb, Tc;
	       T1 = I[0];
	       T2 = I[WS(is, 4)];
	       T3 = T1 + T2;
	       T7 = T1 - T2;
	       Tb = I[WS(is, 7)];
	       Tc = I[WS(is, 3)];
	       Td = Tb - Tc;
	       Tj = Tb + Tc;
	  }
	  {
	       E T4, T5, T8, T9;
	       T4 = I[WS(is, 2)];
	       T5 = I[WS(is, 6)];
	       T6 = T4 + T5;
	       Tg = T4 - T5;
	       T8 = I[WS(is, 1)];
	       T9 = I[WS(is, 5)];
	       Ta = T8 - T9;
	       Ti = T8 + T9;
	  }
	  ro[WS(ros, 2)] = T3 - T6;
	  io[WS(ios, 2)] = Tj - Ti;
	  {
	       E Te, Tf, Th, Tk;
	       Te = KP707106781 * (Ta + Td);
	       ro[WS(ros, 3)] = T7 - Te;
	       ro[WS(ros, 1)] = T7 + Te;
	       Tf = KP707106781 * (Td - Ta);
	       io[WS(ios, 1)] = Tf - Tg;
	       io[WS(ios, 3)] = Tg + Tf;
	       Th = T3 + T6;
	       Tk = Ti + Tj;
	       ro[WS(ros, 4)] = Th - Tk;
	       ro[0] = Th + Tk;
	  }
     }
}

static const kr2hc_desc desc = { 8, "r2hc_8", {20, 2, 0, 0}, &GENUS, 0, 0, 0, 0, 0 };

void X(codelet_r2hc_8) (planner *p) {
     X(kr2hc_register) (p, r2hc_8, &desc);
}
