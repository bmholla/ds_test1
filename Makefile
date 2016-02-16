# $Id: Makefile,v 1.1 2012/05/24 22:53:45 lak Exp $

#
# Copyright 2005 SRC Computers, LLC  All Rights Reserved.
#
#	Manufactured in the United States of America.
#
# SRC Computers, LLC
# 4240 N Nevada Avenue
# Colorado Springs, CO 80907
# (v) (719) 262-0213
# (f) (719) 262-0223
#
# No permission has been granted to distribute this software
# without the express permission of SRC Computers, LLC
#
# This program is distributed WITHOUT ANY WARRANTY OF ANY KIND.
#

# ----------------------------------
# User defines FILES, MAPFILES, and BIN here
# ----------------------------------
FILES 		= main.c

MAPFILES 	= str_simple.mc

BIN 		= str_simple

MAPTARGET	= map_m

# -----------------------------------
# User supplied MCC and MFTN flags
# -----------------------------------

MCCFLAGS 	= -log
MFTNFLAGS	= -log

# -----------------------------------
# User supplied flags for C & Fortran compilers
# -----------------------------------

CC		= gcc
LD		= gcc

CFLAGS 		=
FFLAGS 		= 

# -----------------------------------
# No modifications are required below
# -----------------------------------
MAKIN   ?= $(MC_ROOT)/opt/srcci/comp/lib/AppRules.make
include $(MAKIN)
