/*
 *  search.h    Function prototypes for searching functions
 *
 * =========================================================================
 *
 *                          Open Watcom Project
 *
 *    Copyright (c) 2002-2010 Open Watcom Contributors. All Rights Reserved.
 *    Portions Copyright (c) 1983-2002 Sybase, Inc. All Rights Reserved.
 *
 *    This file is automatically generated. Do not edit directly.
 *
 * =========================================================================
 */
#ifndef _SEARCH_H_INCLUDED
#define _SEARCH_H_INCLUDED

#ifndef _ENABLE_AUTODEPEND
 #pragma read_only_file;
#endif

#ifndef _COMDEF_H_INCLUDED
 #include <_comdef.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

_WCRTLINK extern void *lfind( const void *__key, const void *__base,
                              unsigned *__num, unsigned __width,
                              int (* __compare)(const void *, const void *) );
_WCRTLINK extern void *lsearch( const void *__key, void *__base,
                                unsigned *__num, unsigned __width,
                                int (* __compare)(const void *, const void *) );

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif
