set(proj magic_enum)
message("external project: ${proj}")

# SET DIRS
set(EP_SOURCE_DIR "${CMAKE_BINARY_DIR}/${proj}")
set(EP_BINARY_DIR "${CMAKE_BINARY_DIR}/${proj}-build")
set(EP_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/${proj}-install")
list(APPEND CMAKE_PREFIX_PATH ${EP_INSTALL_DIR})

#-----------------------------------------------------------------------------
set(magic_enum_ROOT ${EP_INSTALL_DIR})

set(DEPENDENCIES "")

ExternalProject_Add(${proj}
  GIT_REPOSITORY "https://github.com/Neargye/magic_enum.git"
  GIT_TAG "v0.7.3"
  SOURCE_DIR ${EP_SOURCE_DIR}
  BINARY_DIR ${EP_BINARY_DIR}
  INSTALL_DIR ${EP_INSTALL_DIR}
  CMAKE_CACHE_ARGS
    # CMake settings
    -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
    -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
    -DCMAKE_CXX_STANDARD:STRING=${CMAKE_CXX_STANDARD}
    -DCMAKE_CXX_STANDARD_REQUIRED:BOOL=${CMAKE_CXX_STANDARD_REQUIRED}
    -DCMAKE_CXX_EXTENSIONS:BOOL=${CMAKE_CXX_EXTENSIONS}
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    # Lib settings
    -DMAGIC_ENUM_OPT_BUILD_TESTS:BOOL=OFF
  DEPENDS ${DEPENDENCIES}
  )
