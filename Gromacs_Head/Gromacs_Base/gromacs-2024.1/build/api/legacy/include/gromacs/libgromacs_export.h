
#ifndef LIBGROMACS_EXPORT_H
#define LIBGROMACS_EXPORT_H

#ifdef LIBGROMACS_STATIC_DEFINE
#  define LIBGROMACS_EXPORT
#  define LIBGROMACS_NO_EXPORT
#else
#  ifndef LIBGROMACS_EXPORT
#    ifdef libgromacs_EXPORTS
        /* We are building this library */
#      define LIBGROMACS_EXPORT __attribute__((visibility("default")))
#    else
        /* We are using this library */
#      define LIBGROMACS_EXPORT __attribute__((visibility("default")))
#    endif
#  endif

#  ifndef LIBGROMACS_NO_EXPORT
#    define LIBGROMACS_NO_EXPORT __attribute__((visibility("hidden")))
#  endif
#endif

#ifndef LIBGROMACS_DEPRECATED
#  define LIBGROMACS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#ifndef LIBGROMACS_DEPRECATED_EXPORT
#  define LIBGROMACS_DEPRECATED_EXPORT LIBGROMACS_EXPORT LIBGROMACS_DEPRECATED
#endif

#ifndef LIBGROMACS_DEPRECATED_NO_EXPORT
#  define LIBGROMACS_DEPRECATED_NO_EXPORT LIBGROMACS_NO_EXPORT LIBGROMACS_DEPRECATED
#endif

#if 0 /* DEFINE_NO_DEPRECATED */
#  ifndef LIBGROMACS_NO_DEPRECATED
#    define LIBGROMACS_NO_DEPRECATED
#  endif
#endif

#endif /* LIBGROMACS_EXPORT_H */
