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

#define SIZE 8

void subr (int64_t A[], int64_t B[], int sz, int64_t *tm, int mapnum);


int main () {
    int64_t *A, *B;
    int mapnum = 0;
    int i, err=0;
    int64_t tm;

    A = (int64_t*) malloc (SIZE * sizeof (int64_t));
    B = (int64_t*) malloc (SIZE * sizeof (int64_t));

    map_allocate (1);

    for (i=0; i<SIZE; i++)
        A[i] = random ();

    subr (A, B, SIZE, &tm, mapnum);

    map_free (1);

    for (i=0; i<SIZE; i++)
        if (A[i]+42 != B[i]) {
	    printf ("error: %lld vs %lld\n", A[i]+42, B[i]);
	    err = 1;
	    }

    if (err)
        exit (1);

    printf ("results are correct\n");

    exit(0);
    }

