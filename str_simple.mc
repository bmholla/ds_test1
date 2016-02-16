// $Id:

//
// Copyright 2005-2015 SRC Computers, LLC.  All rights reserved.
//
//      Manufactured in the United States of America.
//
// SRC Computers, LLC
// 4240 N Nevada Avenue
// Colorado Springs, CO 80907
// (v) (719) 262-0213
// (f) (719) 262-0223
//
// As covered under the End User Software License Agreement, no 
// permission has been granted to distribute or copy this software 
// without the express permission of SRC Computers, LLC.
//
// This program is distributed WITHOUT ANY WARRANTY OF ANY KIND.
//
// SRC Computers, LLC Confidential as covered under the NDA agreement.
//

#include <libmap.h>

void subr (int64_t A[], int64_t B[], int sz, int64_t *tm, int mapnum) {
    OBM_BANK_A (AL, int64_t, MAX_OBM_SIZE)
    OBM_BANK_B (BL, int64_t, MAX_OBM_SIZE)
    Stream_64 S0;
    int64_t t0, t1;

    buffered_dma_cpu (CM2OBM, PATH_0, AL, MAP_OBM_stripe(1,"A"), A, 1, sz*8);

    read_timer (&t0);

    #pragma src parallel sections
    {
        #pragma src section
	{
	int i;
	for (i=0; i<sz; i++)
	    put_stream_64 (&S0, AL[i]+42, 1);
	}

	#pragma src section
	{
	int i;
	for (i=0; i<sz; i++)
	    get_stream_64 (&S0, &BL[i]);
	}
    }

    read_timer (&t1);

    *tm = t1 - t0;

    buffered_dma_cpu (OBM2CM, PATH_0, BL, MAP_OBM_stripe(1,"B"), B, 1, sz*8);
    }
