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
/* Generated on Sat Jul  5 21:43:15 EDT 2003 */

#include "codelet-dft.h"

/* Generated by: /homee/stevenj/cvs/fftw3.0.1/genfft/gen_twiddle_c -simd -compact -variables 4 -n 2 -name t1fv_2 -include t1f.h */

/*
 * This function contains 3 FP additions, 2 FP multiplications,
 * (or, 3 additions, 2 multiplications, 0 fused multiply/add),
 * 5 stack variables, and 4 memory accesses
 */
/*
 * Generator Id's : 
 * $Id: algsimp.ml,v 1.7 2003/03/15 20:29:42 stevenj Exp $
 * $Id: fft.ml,v 1.2 2003/03/15 20:29:42 stevenj Exp $
 * $Id: gen_twiddle_c.ml,v 1.7 2003/04/16 19:51:27 athena Exp $
 */

#include "t1f.h"

static const R *t1fv_2(R *ri, R *ii, const R *W, stride ios, int m, int dist)
{
     int i;
     R *x;
     x = ri;
     BEGIN_SIMD();
     for (i = m; i > 0; i = i - VL, x = x + (VL * dist), W = W + (TWVL * 2)) {
	  V T1, T3, T2;
	  T1 = LD(&(x[0]), dist, &(x[0]));
	  T2 = LD(&(x[WS(ios, 1)]), dist, &(x[WS(ios, 1)]));
	  T3 = BYTWJ(&(W[0]), T2);
	  ST(&(x[WS(ios, 1)]), VSUB(T1, T3), dist, &(x[WS(ios, 1)]));
	  ST(&(x[0]), VADD(T1, T3), dist, &(x[0]));
     }
     END_SIMD();
     return W;
}

static const tw_instr twinstr[] = {
     VTW(1),
     {TW_NEXT, VL, 0}
};

static const ct_desc desc = { 2, "t1fv_2", twinstr, {3, 2, 0, 0}, &GENUS, 0, 0, 0 };

void X(codelet_t1fv_2) (planner *p) {
     X(kdft_dit_register) (p, t1fv_2, &desc);
}
