set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR ARMHF)

set(triple arm-linux-musleabihf)

set(CMAKE_C_COMPILER "zig" cc -target ${triple})
set(CMAKE_CXX_COMPILER "zig" c++ -target ${triple})

set(COMPILER_COMMON -Drelease-safe -Dcpu=baseline -DZIG_TARGET_MCPU=baseline)

set(CMAKE_AR "${CMAKE_CURRENT_LIST_DIR}/zig-ar.sh")
set(CMAKE_RANLIB "${CMAKE_CURRENT_LIST_DIR}/zig-ranlib.sh")

SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
