import os
import ycm_core

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.

flags = [
'-Wall',
'-Wextra',

# Tibra is not working with these flags
#'-Werror',

'-Wno-long-long',
'-Wno-variadic-macros',
'-fexceptions',
'-DNDEBUG',
'-DUSE_CLANG_COMPLETER',

# THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
# language to use when compiling headers. So it will guess. Badly. So C++
# headers will be compiled as C headers. You don't want that so ALWAYS specify
# a "-std=<something>".
# For a C project, you would set this to something like 'c99' instead of
# 'c++11'.
'-std=c++11',
# ...and the same thing goes for the magic -x option which specifies the
# language that the files to be compiled are written in. This is mostly
# relevant for c++ headers.
# For a C project, you would set this to 'c' instead of 'c++'.
'-x', 'c++',

# Specific C++ deps
'-I', '/home/andre/Dev/Install/boost_1_53_0',

# Related to the current project
'-I', '/home/andre/Dev/Repo/Trunk',
'-I', '/home/andre/Dev/Repo/Trunk/pchNone',
'-I', '/home/andre/Dev/Builds/Trunk/tibra/Trunk',

# Specicific Tibra packages
'-I', '/home/andre/Dev/Packages/tibra.functional/1.00.00/include',
'-I', '/home/andre/Dev/Packages/tibra.base/1.01.02/include',
'-I', '/home/andre/Dev/Packages/tibra.serialization/1.00.01/include',
'-I', '/home/andre/Dev/Packages/tibra.math/1.00.03/include',
'-I', '/home/andre/Dev/Packages/tibra.allocation/1.00.00/include',
'-I', '/home/andre/Dev/Packages/tibra.meta/1.00.00/include',
'-I', '/home/andre/Dev/Packages/tibra.conversion/1.00.04/include',
'-I', '/home/andre/Dev/Packages/orc/2012a',

# Ignore all warnings
'-w',
]

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )

def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return list( flags )
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags


def FlagsForFile( filename ):

  relative_to = DirectoryOfThisScript()
  final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )

  return {
    'flags': final_flags,
    'do_cache': True}
