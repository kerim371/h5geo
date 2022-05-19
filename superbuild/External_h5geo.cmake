set(proj h5geo)
message("external project: ${proj}")

set(h5geo_DIR "${CMAKE_INSTALL_PREFIX}/cmake/h5geo")

set(DEPENDENCIES Eigen3 mio ZLIB HDF5 h5gt magic_enum units)

if(H5GEO_USE_THREADS)
  list(APPEND DEPENDENCIES TBB)
endif()

if(H5GEO_USE_GDAL)
  list(APPEND DEPENDENCIES GDAL)
endif()

set(H5GEO_RUNTIME_DIRS "${CMAKE_INSTALL_PREFIX}/lib")
message("GDAL_LIBS: ${GDAL_LIBS}")

ExternalProject_Add(${proj}
  DOWNLOAD_COMMAND ""
  INSTALL_COMMAND ""
  SOURCE_DIR ${CMAKE_SOURCE_DIR}
  BINARY_DIR ${CMAKE_BINARY_DIR}
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  CMAKE_CACHE_ARGS
    # Compiler settings
    -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
    -DCMAKE_CXX_FLAGS:STRING=${ep_common_cxx_flags}
    -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
    -DCMAKE_C_FLAGS:STRING=${ep_common_c_flags}
    -DCMAKE_CXX_STANDARD:STRING=${CMAKE_CXX_STANDARD}
    -DCMAKE_CXX_STANDARD_REQUIRED:BOOL=${CMAKE_CXX_STANDARD_REQUIRED}
    -DCMAKE_CXX_EXTENSIONS:BOOL=${CMAKE_CXX_EXTENSIONS}
    -DCMAKE_PREFIX_PATH:PATH=${CMAKE_PREFIX_PATH} # pass dirs to find for libs needed
    # Output directories
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    # GNUInstallDirs expands CMAKE_INSTALL_LIBDIR to 'lib' or to'lib64' depending on the OS
    -DCMAKE_INSTALL_LIBDIR:PATH=lib
    # Lib settings
    -DEigen3_ROOT:PATH=${Eigen3_ROOT}
    -Dmio_ROOT:PATH=${mio_ROOT}
    -DZLIB_ROOT:PATH=${ZLIB_ROOT}
    -DHDF5_ROOT:PATH=${HDF5_ROOT}
    -Dh5gt_ROOT:PATH=${h5gt_ROOT}
    -Dmagic_enum_ROOT:PATH=${magic_enum_ROOT}
    -Dunits_DIR:PATH=${units_DIR}
    -DTBB_ROOT:PATH=${TBB_INSTALL_DIR}
    -DTBB_ROOT_DIR:PATH=${TBB_INSTALL_DIR}
    -DTBB_LIBRARY:PATH=${TBB_LIB_DIR}
    -DTBB_INCLUDE_DIRS:PATH=${TBB_INCLUDE_DIR}
    -DGDAL_ROOT:PATH=${GDAL_ROOT}
    -DGDAL_INCLUDE_DIRS:PATH=${GDAL_INCLUDE_DIR}
    -DGDAL_LIBS:FILEPATH=${GDAL_LIBS}
    # Lib settings
    -DH5GEO_SUPERBUILD:BOOL=OFF
    -DH5GEO_USE_THREADS:BOOL=${H5GEO_USE_THREADS}
    -DH5GEO_USE_GDAL:BOOL=${H5GEO_USE_GDAL}
    -DH5GEO_BUILD_SHARED_LIBS:BOOL=${H5GEO_BUILD_SHARED_LIBS}
    -DH5GEO_BUILD_TESTS:BOOL=${H5GEO_BUILD_TESTS}
    -DH5GEO_BUILD_h5geopy:BOOL=${H5GEO_BUILD_h5geopy}
    -DHDF5_USE_STATIC_LIBRARIES:BOOL=${HDF5_USE_STATIC_LIBRARIES}
    -DHDF5_PREFER_PARALLEL:BOOL=${HDF5_PREFER_PARALLEL}
    -DHDF5_RUNTIME_DIRS:PATH=${HDF5_RUNTIME_DIRS}
    -DZLIB_RUNTIME_DIRS:PATH=${ZLIB_RUNTIME_DIRS}
    -DUNITS_RUNTIME_DIRS:PATH=${UNITS_RUNTIME_DIRS}
    -DTBB_RUNTIME_DIRS:PATH=${TBB_RUNTIME_DIRS}
    -DGDAL_RUNTIME_DIRS:PATH=${GDAL_RUNTIME_DIRS}
    -DH5GEO_RUNTIME_DIRS:PATH=${H5GEO_RUNTIME_DIRS}
    # h5gt and h5geo use pybind11 (PYTHON_EXECUTABLE)
    -DPYTHON_EXECUTABLE:PATH=${PYTHON_EXECUTABLE}
  DEPENDS ${DEPENDENCIES}
  )
