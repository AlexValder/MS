#!/usr/bin/env python
import os

env = SConscript("godot-cpp/SConstruct")

# For reference:
# - CCFLAGS are compilation flags shared between C and C++
# - CFLAGS are for C-specific compilation flags
# - CXXFLAGS are for C++-specific compilation flags
# - CPPFLAGS are for pre-processor flags
# - CPPDEFINES are for pre-processor defines
# - LINKFLAGS are for linking flags

sourcesDir = "cpp"
env.Append(CPPPATH=["{sourcesDir}/"])

sources = []
for dir, _, _ in os.walk(sourcesDir):
    sources.extend(Glob(os.path.join(dir, "*.cc")))

libname = "libgame"

library = env.SharedLibrary(
    "game/bin/{}{}{}".format(libname, env["suffix"], env["SHLIBSUFFIX"]),
    source=sources,
)

Default(library)
