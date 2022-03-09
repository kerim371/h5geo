set(include_files_h5geo
  ${CMAKE_SOURCE_DIR}/include/h5geo/misc/h5core.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/misc/h5enum_string.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/misc/h5segy.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/misc/h5deviation.h

  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5easyhull.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5interpolation.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5sort.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5polyfit.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5enum.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5enum_operators.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5sr_settings.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5coreimpl.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5utilimpl.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5base.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5basecontainerimpl.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5baseimpl.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5baseobjectimpl.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5devcurveimpl.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5logcurveimpl.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5seisimpl.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5seiscontainerimpl.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5mapcontainerimpl.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5mapimpl.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5wellcontainerimpl.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5wellimpl.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5point.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5pointsimpl.h

  ${CMAKE_SOURCE_DIR}/include/h5geo/h5basecontainer.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/h5baseobject.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/h5util.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/h5devcurve.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/h5logcurve.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/h5seis.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/h5seiscontainer.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/h5mapcontainer.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/h5map.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/h5well.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/h5wellcontainer.h
  ${CMAKE_SOURCE_DIR}/include/h5geo/h5points.h
  )

if(H5GEO_USE_GDAL)
  list(APPEND include_files_h5geo ${CMAKE_SOURCE_DIR}/include/h5geo/impl/h5sr_settings.h)
endif()