// Copyright (c) 2009 Syntext Inc.
//
// This is a copyrighted commercial software.
// Please see COPYRIGHT file for details.

/** \file
 *  
 */

#ifndef THREADMUTEXATOMICS_CPP
#define THREADMUTEXATOMICS_CPP

COMMON_NS_BEGIN

INLINE_ATOMICS ThreadMutex::IntType
ThreadMutex::atomicRead(VolatileIntType& lval)
{
    return AO_load(&lval);
}

INLINE_ATOMICS void ThreadMutex::atomicAssign(VolatileIntType& lval,
                                              IntType rval)
{
    return AO_store(&lval, rval);
}

INLINE_ATOMICS ThreadMutex::IntType
ThreadMutex::atomicIncrement(VolatileIntType& lval)
{
    return AO_fetch_and_add1(&lval) + 1;
}

INLINE_ATOMICS ThreadMutex::IntType
ThreadMutex::atomicDecrement(VolatileIntType& lval)
{
    return AO_fetch_and_sub1(&lval) - 1;
}

COMMON_NS_END

#endif // THREADMUTEXATOMICS_CPP
