/* MTI_DPI */

/*
 * Copyright 2002-2009 Mentor Graphics Corporation.
 *
 * Note:
 *   This file is automatically generated.
 *   Please do not edit this file - you will lose your edits.
 *
 * Settings when this file was generated:
 *   PLATFORM = 'linux_x86_64'
 */
#ifndef INCLUDED_CLARVI_AVALON
#define INCLUDED_CLARVI_AVALON

#ifdef __cplusplus
#define DPI_LINK_DECL  extern "C" 
#else
#define DPI_LINK_DECL 
#endif

#include "svdpi.h"


DPI_LINK_DECL DPI_DLLESPEC
int
clarvi_avalon_read_mem(
    int address,
    char byteena);

DPI_LINK_DECL DPI_DLLESPEC
void
clarvi_avalon_setup();

DPI_LINK_DECL DPI_DLLESPEC
void
clarvi_avalon_write_mem(
    int address,
    int data,
    char byteena);

#endif 