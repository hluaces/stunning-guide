# Locate PCRE library
# This module defines
#  PCRE_FOUND, if false, do not try to link to PCRE 
#  PCRE_LIBRARIES
#  PCRE_INCLUDE_DIR, where to find pcre.h 


FIND_PATH(PCRE_INCLUDE_DIR pcre.h
  HINTS
  ${PCRE_DIR} $ENV{PCRE_DIR}
  PATH_SUFFIXES include/pcre include
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw # Fink
  /opt/local # DarwinPorts
  /opt/csw # Blastwave
  /opt
)

FIND_LIBRARY(PCRE_LIBRARY_RELEASE 
  NAMES pcre
  HINTS
  ${PCRE_DIR} $ENV{PCRE_DIR}
  PATH_SUFFIXES lib64 lib
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
)

FIND_LIBRARY(PCRE_LIBRARY_DEBUG 
  NAMES pcred
  HINTS
  ${PCRE_DIR} $ENV{PCRE_DIR}
  PATH_SUFFIXES lib64 lib
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
)

FIND_LIBRARY(PCRECPP_LIBRARY_RELEASE 
  NAMES pcrecpp
  HINTS
  ${PCRE_DIR} $ENV{PCRE_DIR}
  PATH_SUFFIXES lib64 lib
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
)

FIND_LIBRARY(PCRECPP_LIBRARY_DEBUG 
  NAMES pcrecppd
  HINTS
  ${PCRE_DIR} $ENV{PCRE_DIR}
  PATH_SUFFIXES lib64 lib
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
)

FIND_LIBRARY(PCREPOSIX_LIBRARY_RELEASE 
  NAMES pcreposix
  HINTS
  ${PCRE_DIR} $ENV{PCRE_DIR}
  PATH_SUFFIXES lib64 lib
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
)

FIND_LIBRARY(PCREPOSIX_LIBRARY_DEBUG 
  NAMES pcreposixd
  HINTS
  ${PCRE_DIR} $ENV{PCRE_DIR}
  PATH_SUFFIXES lib64 lib
  PATHS
  ~/Library/Frameworks
  /Library/Frameworks
  /usr/local
  /usr
  /sw
  /opt/local
  /opt/csw
  /opt
)

SET( PCRE_STATIC OFF CACHE BOOL "Use PCRE static libraries.")

IF(PCRE_STATIC)
  ADD_DEFINITIONS(-DPCRE_STATIC)
ENDIF(PCRE_STATIC)

IF(PCRE_LIBRARY_DEBUG AND PCRE_LIBRARY_RELEASE)
  SET(PCRE_LIBRARY optimized ${PCRE_LIBRARY_RELEASE} debug ${PCRE_LIBRARY_DEBUG} )
ELSEIF(PCRE_LIBRARY_RELEASE)
  SET(PCRE_LIBRARY ${PCRE_LIBRARY_RELEASE} )
ELSEIF(PCRE_LIBRARY_DEBUG)
  SET(PCRE_LIBRARY ${PCRE_LIBRARY_DEBUG} )
ENDIF()

IF(PCRECPP_LIBRARY_DEBUG AND PCRECPP_LIBRARY_RELEASE)
  SET(PCRECPP_LIBRARY optimized ${PCRECPP_LIBRARY_RELEASE} debug ${PCRECPP_LIBRARY_DEBUG} )
ELSEIF(PCRECPP_LIBRARY_RELEASE)
  SET(PCRECPP_LIBRARY ${PCRECPP_LIBRARY_RELEASE} )
ELSEIF(PCRECPP_LIBRARY_DEBUG)
  SET(PCRECPP_LIBRARY ${PCRECPP_LIBRARY_DEBUG} )
ENDIF()

IF(PCREPOSIX_LIBRARY_DEBUG AND PCREPOSIX_LIBRARY_RELEASE)
  SET(PCREPOSIX_LIBRARY optimized ${PCREPOSIX_LIBRARY_RELEASE} debug ${PCREPOSIX_LIBRARY_DEBUG} )
ELSEIF(PCREPOSIX_LIBRARY_RELEASE)
  SET(PCREPOSIX_LIBRARY ${PCREPOSIX_LIBRARY_RELEASE} )
ELSEIF(PCREPOSIX_LIBRARY_DEBUG)
  SET(PCREPOSIX_LIBRARY ${PCREPOSIX_LIBRARY_DEBUG} )
ENDIF()

SET( PCRE_LIBRARIES "${PCRE_LIBRARY};${PCRECPP_LIBRARY};${PCREPOSIX_LIBRARY}" CACHE STRING "PCRE Libraries")

INCLUDE(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set PCRE_FOUND to TRUE if 
# all listed variables are TRUE
FIND_PACKAGE_HANDLE_STANDARD_ARGS(PCRE  DEFAULT_MSG  PCRE_LIBRARIES PCRE_INCLUDE_DIR)

MARK_AS_ADVANCED(PCRE_INCLUDE_DIR PCRE_LIBRARIES PCRE_LIBRARY PCRE_LIBRARY_RELEASE PCRE_LIBRARY_DEBUG PCRECPP_LIBRARY PCRECPP_LIBRARY_RELEASE PCRECPP_LIBRARY_DEBUG PCREPOSIX_LIBRARY PCREPOSIX_LIBRARY_RELEASE PCREPOSIX_LIBRARY_DEBUG)
