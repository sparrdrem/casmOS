//
//  except.h -- C++ default exception handlers
//
// =========================================================================
//
//                          Open Watcom Project
//
//    Copyright (c) 2002-2010 Open Watcom Contributors. All Rights Reserved.
//    Portions Copyright (c) 1983-2002 Sybase, Inc. All Rights Reserved.
//
//    This file is automatically generated. Do not edit directly.
//
// =========================================================================
//
#ifndef _EXCEPT_H_INCLUDED
#define _EXCEPT_H_INCLUDED

#ifndef _ENABLE_AUTODEPEND
 #pragma read_only_file;
#endif

#ifndef __cplusplus
 #error This header file requires C++
#endif

#ifndef _COMDEF_H_INCLUDED
 #include <_comdef.h>
#endif

#ifndef _PFV_DEFINED
#define _PFV_DEFINED
 #define _PFV_DEFINED_
 typedef void (*PFV)( void );
#endif
#ifndef _PFU_DEFINED
#define _PFU_DEFINED
 #define _PFU_DEFINED_
 typedef int (*PFU)( unsigned );
#endif
#ifndef _PNH_DEFINED
#define _PNH_DEFINED
 #define _PNH_DEFINED_
 typedef int (*_PNH)( unsigned );
#endif
#ifdef __SW_BR
 #ifndef _PPV_DEFINED
 #define _PPV_DEFINED
  #define _PPV_DEFINED_
  typedef void (*_PVV)( void *);
 #endif
 #ifndef _PUP_DEFINED
 #define _PUP_DEFINED
  #define _PUP_DEFINED_
  typedef void* (*_PUP)( unsigned );
 #endif
#endif

#ifndef _WATCOM_EXCEPTION_DEFINED
#define _WATCOM_EXCEPTION_DEFINED
 #define _WATCOM_EXCEPTION_DEFINED_
 struct __WATCOM_exception {
  #if defined(__AXP__) || defined(__PPC__)
     void *__filler;
  #endif
 };
#endif

namespace std {

  _WPRTLINK extern void     terminate( void );
  _WPRTLINK extern PFV      set_terminate( PFV );
  _WPRTLINK extern void     unexpected( void );
  _WPRTLINK extern PFV      set_unexpected( PFV );

}
using std::terminate;
using std::set_terminate;
using std::unexpected;
using std::set_unexpected;

#endif
