FILE(TO_CMAKE_PATH "$ENV{GTK2_DIR}" TRY1_DIR)
FILE(TO_CMAKE_PATH "${GTK2_DIR}" TRY2_DIR)
FILE(GLOB GTK_DIR ${TRY1_DIR} ${TRY2_DIR})

FIND_PATH(GTK_gtk_2_INCLUDE_DIR gtk/gtk.h
                                PATHS ${GTK_DIR}/include /usr/local/include/gtk-2.0 /usr/include/gtk-2.0
                                ENV INCLUDE DOC "Directory containing gtk/gtk.h include file")

FIND_PATH(GTK_gdk_2_INCLUDE_DIR gdk/gdk.h
                                PATHS ${GTK_DIR}/include /usr/local/include/gtk-2.0 /usr/include/gtk-2.0
                                ENV INCLUDE DOC "Directory containing gdk/gdk.h include file")

FIND_PATH(GTK_gdkconfig_2_INCLUDE_DIR gdkconfig.h
                                      PATHS ${GTK_DIR}/include ${GTK_DIR}/lib/include /usr/local/include/gtk-2.0 /usr/include/gtk-2.0 /usr/lib/gtk-2.0/include /usr/local/lib/gtk-2.0/include
                                      ENV INCLUDE DOC "Directory containing gdkconfig.h include file")

FIND_LIBRARY(GTK_gdk_pixbuf_2_LIBRARY NAMES gdk_pixbuf-2.0
                                      PATHS ${GTK_DIR}/lib ${GTK_DIR}/bin ${GTK_DIR}/win32/bin ${GTK_DIR}/lib ${GTK_DIR}/win32/lib /usr/local/lib /usr/lib
                                      ENV LIB
                                      DOC "gdk_pixbuf library to link with"
                                      NO_SYSTEM_ENVIRONMENT_PATH)

FIND_LIBRARY(GTK_gdk_2_LIBRARY NAMES gdk-win32-2.0 gdk-x11-2.0
                                     PATHS ${GTK_DIR}/lib ${GTK_DIR}/bin ${GTK_DIR}/win32/bin ${GTK_DIR}/lib ${GTK_DIR}/win32/lib /usr/lib /usr/local/lib
                                     ENV LIB
                                     DOC "gdk2 library to link with"
                                     NO_SYSTEM_ENVIRONMENT_PATH)

FIND_LIBRARY(GTK_gtk_2_LIBRARY NAMES gtk-win32-2.0 gtk-x11-2.0
                                     PATHS ${GTK_DIR}/lib ${GTK_DIR}/bin ${GTK_DIR}/win32/bin ${GTK_DIR}/lib ${GTK_DIR}/win32/lib /usr/lib /usr/local/lib
                                     ENV LIB
                                     DOC "gtk2 library to link with"
                                     NO_SYSTEM_ENVIRONMENT_PATH)


IF (GTK_gtk_2_INCLUDE_DIR AND GTK_gdk_2_INCLUDE_DIR AND GTK_gdkconfig_2_INCLUDE_DIR AND
    GTK_gdk_pixbuf_2_LIBRARY AND GTK_gdk_2_LIBRARY AND GTK_gtk_2_LIBRARY)
  SET(GTK2_INCLUDE_DIR ${GTK_gtk_2_INCLUDE_DIR} ${GTK_gdk_2_INCLUDE_DIR} ${GTK_gdkconfig_2_INCLUDE_DIR})
  list(REMOVE_DUPLICATES GTK2_INCLUDE_DIR)
  SET(GTK2_LIBRARIES ${GTK_gdk_pixbuf_2_LIBRARY} ${GTK_gdk_2_LIBRARY} ${GTK_gtk_2_LIBRARY})
  list(REMOVE_DUPLICATES GTK2_LIBRARIES)
  SET(GTK2_FOUND TRUE)
ENDIF (GTK_gtk_2_INCLUDE_DIR AND GTK_gdk_2_INCLUDE_DIR AND GTK_gdkconfig_2_INCLUDE_DIR AND
       GTK_gdk_pixbuf_2_LIBRARY AND GTK_gdk_2_LIBRARY AND GTK_gtk_2_LIBRARY)
