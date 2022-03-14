message("external project: h5gt")

# SET DIRS
set(EP_SOURCE_DIR "${CMAKE_BINARY_DIR}/h5gt")
set(EP_BINARY_DIR "${CMAKE_BINARY_DIR}/h5gt-build")
set(EP_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/h5gt-install")
list(APPEND CMAKE_PREFIX_PATH ${EP_INSTALL_DIR})

#-----------------------------------------------------------------------------
set(h5gt_ROOT ${EP_INSTALL_DIR})

set(DEPENDENCIES Eigen3 ZLIB HDF5)

ExternalProject_Add(h5gt
  GIT_REPOSITORY "https://github.com/TierraColada/h5gt.git"
  GIT_TAG "main"
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
    -DH5GT_USE_EIGEN:BOOL=ON
    -DH5GT_USE_XTENSOR:BOOL=OFF
    -DH5GT_USE_OPENCV:BOOL=OFF
    -DH5GT_UNIT_TESTS:BOOL=OFF
    -DH5GT_EXAMPLES:BOOL=OFF
    -DH5GT_PARALLEL_HDF5:BOOL=OFF
    -DH5GT_BUILD_h5gtpy:BOOL=${H5GEO_BUILD_h5geopy}
    -DHDF5_RUNTIME_DIRS:PATH=${HDF5_RUNTIME_DIRS}
    -DZLIB_RUNTIME_DIRS:PATH=${ZLIB_RUNTIME_DIRS}
    -DCOPY_H5GTPY_RUNTIME_DEPS:BOOL=OFF
    -DHDF5_USE_STATIC_LIBRARIES:BOOL=OFF
    -DEigen3_ROOT:PATH=${Eigen3_ROOT}
    -DZLIB_ROOT:PATH=${ZLIB_ROOT}
    -DHDF5_ROOT:PATH=${HDF5_ROOT}
    # h5gt and h5geo use pybind11 (PYTHON_EXECUTABLE)
    -DPYTHON_EXECUTABLE:PATH=${PYTHON_EXECUTABLE}
  DEPENDS ${DEPENDENCIES}
  )
