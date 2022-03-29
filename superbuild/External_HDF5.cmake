set(proj HDF5)
message("external project: ${proj}")

# SET DIRS
set(EP_SOURCE_DIR "${CMAKE_BINARY_DIR}/${proj}")
set(EP_BINARY_DIR "${CMAKE_BINARY_DIR}/${proj}-build")
set(EP_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/${proj}-install")
list(APPEND CMAKE_PREFIX_PATH ${EP_INSTALL_DIR})

#-----------------------------------------------------------------------------
set(HDF5_ROOT ${EP_INSTALL_DIR})
if(WIN32)
  set(HDF5_RUNTIME_DIRS "${HDF5_ROOT}/bin")
else()
  set(HDF5_RUNTIME_DIRS "${HDF5_ROOT}/lib")
endif()

set(DEPENDENCIES ZLIB)

ExternalProject_Add(${proj}
  GIT_REPOSITORY "https://github.com/HDFGroup/hdf5.git"
  GIT_TAG "hdf5-1_12_1"
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
    -DBUILD_TESTING:BOOL=OFF
    -DHDF5_BUILD_TOOLS:BOOL=ON
    -DHDF5_BUILD_EXAMPLES:BOOL=OFF
    -DHDF5_BUILD_HL_LIB:BOOL=ON
    -DHDF5_BUILD_CPP_LIB:BOOL=OFF
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DBUILD_STATIC_LIBS:BOOL=ON
    -DHDF5_EXTERNALLY_CONFIGURED:BOOL=OFF
    -DHDF5_GENERATE_HEADERS:BOOL=ON
    -DHDF5_ENABLE_Z_LIB_SUPPORT:BOOL=ON
    -DZLIB_ROOT:PATH=${ZLIB_ROOT}
#      -DHDF_PACKAGE_NAMESPACE:STRING=hdf5::
  DEPENDS ${DEPENDENCIES}
  )
