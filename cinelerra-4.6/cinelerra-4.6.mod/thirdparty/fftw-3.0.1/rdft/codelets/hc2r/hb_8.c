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
/* Generated on Sat Jul  5 22:11:28 EDT 2003 */

#include "codelet-rdft.h"

/* Generated by: /homee/stevenj/cvs/fftw3.0.1/genfft/gen_hc2hc -compact -variables 4 -sign 1 -n 8 -dif -name hb_8 -include hb.h */

/*
 * This function contains 66 FP additions, 32 FP multiplications,
 * (or, 52 additions, 18 multiplications, 14 fused multiply/add),
 * 30 stack variables, and 32 memory accesses
 */
/*
 * Generator Id's : 
 * $Id: algsimp.ml,v 1.7 2003/03/15 20:29:42 stevenj Exp $
 * $Id: fft.ml,v 1.2 2003/03/15 20:29:42 stevenj Exp $
 * $Id: gen_hc2hc.ml,v 1.9 2003/04/17 19:25:50 athena Exp $
 */

#include "hb.h"

static const R *hb_8(R *rio, R *iio, const R *W, stride ios, int m, int dist)
{
     DK(KP707106781, +0.707106781186547524400844362104849039284835938);
     int i;
     for (i = m - 2; i > 0; i = i - 2, rio = rio + dist, iio = iio - dist, W = W + 14) {
	  E T7, T18, T1d, Tg, Tx, TT, TY, TG, Te, TZ, T10, Tn, Tq, TM, TP;
	  E TH;
	  {
	       E T3, TR, Tt, TX, T6, TW, Tw, TS;
	       {
		    E T1, T2, Tr, Ts;
		    T1 = rio[0];
		    T2 = iio[-WS(ios, 4)];
		    T3 = T1 + T2;
		    TR = T1 - T2;
		    Tr = iio[0];
		    Ts = rio[WS(ios, 4)];
		    Tt = Tr - Ts;
		    TX = Tr + Ts;
	       }
	       {
		    E T4, T5, Tu, Tv;
		    T4 = rio[WS(ios, 2)];
		    T5 = iio[-WS(ios, 6)];
		    T6 = T4 + T5;
		    TW = T4 - T5;
		    Tu = iio[-WS(ios, 2)];
		    Tv = rio[WS(ios, 6)];
		    Tw = Tu - Tv;
		    TS = Tu + Tv;
	       }
	       T7 = T3 + T6;
	       T18 = TX - TW;
	       T1d = TR + TS;
	       Tg = T3 - T6;
	       Tx = Tt - Tw;
	       TT = TR - TS;
	       TY = TW + TX;
	       TG = Tt + Tw;
	  }
	  {
	       E Ta, TO, Tj, TN, Td, TK, Tm, TL;
	       {
		    E T8, T9, Th, Ti;
		    T8 = rio[WS(ios, 1)];
		    T9 = iio[-WS(ios, 5)];
		    Ta = T8 + T9;
		    TO = T8 - T9;
		    Th = iio[-WS(ios, 1)];
		    Ti = rio[WS(ios, 5)];
		    Tj = Th - Ti;
		    TN = Th + Ti;
	       }
	       {
		    E Tb, Tc, Tk, Tl;
		    Tb = iio[-WS(ios, 7)];
		    Tc = rio[WS(ios, 3)];
		    Td = Tb + Tc;
		    TK = Tb - Tc;
		    Tk = iio[-WS(ios, 3)];
		    Tl = rio[WS(ios, 7)];
		    Tm = Tk - Tl;
		    TL = Tl + Tk;
	       }
	       Te = Ta + Td;
	       TZ = TO + TN;
	       T10 = TK + TL;
	       Tn = Tj - Tm;
	       Tq = Td - Ta;
	       TM = TK - TL;
	       TP = TN - TO;
	       TH = Tj + Tm;
	  }
	  rio[0] = T7 + Te;
	  iio[-WS(ios, 7)] = TH + TG;
	  {
	       E To, Ty, Tf, Tp;
	       To = Tg + Tn;
	       Ty = Tq + Tx;
	       Tf = W[10];
	       Tp = W[11];
	       rio[WS(ios, 6)] = FNMS(Tp, Ty, Tf * To);
	       iio[-WS(ios, 1)] = FMA(Tp, To, Tf * Ty);
	  }
	  {
	       E TE, TI, TD, TF;
	       TE = T7 - Te;
	       TI = TG - TH;
	       TD = W[6];
	       TF = W[7];
	       rio[WS(ios, 4)] = FNMS(TF, TI, TD * TE);
	       iio[-WS(ios, 3)] = FMA(TF, TE, TD * TI);
	  }
	  {
	       E TA, TC, Tz, TB;
	       TA = Tg - Tn;
	       TC = Tx - Tq;
	       Tz = W[2];
	       TB = W[3];
	       rio[WS(ios, 2)] = FNMS(TB, TC, Tz * TA);
	       iio[-WS(ios, 5)] = FMA(TB, TA, Tz * TC);
	  }
	  {
	       E TU, T16, T12, T14, TQ, T11;
	       TQ = KP707106781 * (TM - TP);
	       TU = TQ + TT;
	       T16 = TT - TQ;
	       T11 = KP707106781 * (TZ - T10);
	       T12 = TY + T11;
	       T14 = TY - T11;
	       {
		    E TJ, TV, T13, T15;
		    TJ = W[0];
		    TV = W[1];
		    rio[WS(ios, 1)] = FNMS(TV, T12, TJ * TU);
		    iio[-WS(ios, 6)] = FMA(TJ, T12, TV * TU);
		    T13 = W[8];
		    T15 = W[9];
		    iio[-WS(ios, 2)] = FMA(T13, T14, T15 * T16);
		    rio[WS(ios, 5)] = FNMS(T15, T14, T13 * T16);
	       }
	  }
	  {
	       E T1a, T1i, T1e, T1g, T19, T1c;
	       T19 = KP707106781 * (TP + TM);
	       T1a = T18 + T19;
	       T1i = T18 - T19;
	       T1c = KP707106781 * (TZ + T10);
	       T1e = T1c + T1d;
	       T1g = T1d - T1c;
	       {
		    E T17, T1b, T1f, T1h;
		    T17 = W[12];
		    T1b = W[13];
		    iio[0] = FMA(T17, T1a, T1b * T1e);
		    rio[WS(ios, 7)] = FNMS(T1b, T1a, T17 * T1e);
		    T1f = W[4];
		    T1h = W[5];
		    rio[WS(ios, 3)] = FNMS(T1h, T1i, T1f * T1g);
		    iio[-WS(ios, 4)] = FMA(T1f, T1i, T1h * T1g);
	       }
	  }
     }
     return W;
}

static const tw_instr twinstr[] = {
     {TW_FULL, 0, 8},
     {TW_NEXT, 1, 0}
};

static const hc2hc_desc desc = { 8, "hb_8", twinstr, {52, 18, 14, 0}, &GENUS, 0, 0, 0 };

void X(codelet_hb_8) (planner *p) {
     X(khc2hc_dif_register) (p, hb_8, &desc);
}
