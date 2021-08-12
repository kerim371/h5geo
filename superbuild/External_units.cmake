message("external project: units")

# SET DIRS
set(EP_SOURCE_DIR "${CMAKE_BINARY_DIR}/units")
set(EP_BINARY_DIR "${CMAKE_BINARY_DIR}/units-build")
set(EP_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/units-install")
list(APPEND CMAKE_PREFIX_PATH "${EP_SOURCE_DIR}")

#-----------------------------------------------------------------------------
set(units_ROOT PATH ${EP_INSTALL_DIR})
set(units_DIR PATH ${EP_INSTALL_DIR}/lib/cmake/units)
find_package(units)

set(DEPENDENCIES "")

if(H5GEO_BUILD_SHARED_LIBS)
  set(UNITS_BUILD_SHARED_LIBRARY ON)
  set(UNITS_BUILD_STATIC_LIBRARY OFF)
else()
  set(UNITS_BUILD_SHARED_LIBRARY OFF)
  set(UNITS_BUILD_STATIC_LIBRARY ON)
endif()

if(NOT DEFINED units_FOUND OR NOT units_FOUND)
  ExternalProject_Add(units
    GIT_REPOSITORY "https://github.com/LLNL/units"
    GIT_TAG "v0.4.0"
    SOURCE_DIR ${EP_SOURCE_DIR}
    BINARY_DIR ${EP_BINARY_DIR}
    INSTALL_DIR ${EP_INSTALL_DIR}
    CMAKE_CACHE_ARGS
      # Compiler settings
      -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
      -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
      -DCMAKE_CXX_STANDARD:STRING=${CMAKE_CXX_STANDARD}
      -DCMAKE_CXX_STANDARD_REQUIRED:BOOL=${CMAKE_CXX_STANDARD_REQUIRED}
      -DCMAKE_CXX_EXTENSIONS:BOOL=${CMAKE_CXX_EXTENSIONS}
      -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
      -DINSTALL_BIN_DIR:PATH=<INSTALL_DIR>/bin
      -DINSTALL_INC_DIR:PATH=<INSTALL_DIR>/include
      -DINSTALL_LIB_DIR:PATH=<INSTALL_DIR>/lib
      -DINSTALL_MAN_DIR:PATH=<INSTALL_DIR>/share/man
      -DINSTALL_PKGCONFIG_DIR:PATH=<INSTALL_DIR>/share/pkgconfig
      # Lib settings
      -DUNITS_BUILD_FUZZ_TARGETS:BOOL=OFF
      -DUNITS_BUILD_SHARED_LIBRARY:BOOL=${UNITS_BUILD_SHARED_LIBRARY}
      -DUNITS_BUILD_STATIC_LIBRARY:BOOL=${UNITS_BUILD_STATIC_LIBRARY}
      -DUNITS_ENABLE_TESTS:BOOL=OFF
      -DUNITS_HEADER_ONLY:BOOL=OFF
    DEPENDS ${DEPENDENCIES}
    )
else()
  # Add empty project that exports target units
  ExternalProject_Add(units
    SOURCE_DIR ${EP_SOURCE_DIR}
    BINARY_DIR ${EP_BINARY_DIR}
    INSTALL_DIR ${EP_INSTALL_DIR}
    DOWNLOAD_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    DEPENDS ${DEPENDENCIES}
    )
endif()
