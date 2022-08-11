#!/bin/bash

. version

WPS_FILE="wps-office-11.1.0.11664.XA-1.x86_64.rpm"
WPS_URL="https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11664/"

APPDIR="WPS_Office-x86_64.AppDir"
mkdir -p ${APPDIR}
wget -c ${WPS_URL} -O ${APPDIR}/${WPS_FILE}
cp -r AppRun ${APPDIR}
cp -r com.wps.Office.desktop ${APPDIR}
cp -r wps-launcher ${APPDIR}

pushd ${APPDIR}
chmod +x AppRun
unrpm ${WPS_FILE}
rm -rf ${WPS_FILE}
cp -r usr/share/icons/hicolor/256x256/mimetypes/wps-office2019-kprometheus.png .
cp -r usr/share/icons/hicolor/256x256/mimetypes/wps-office2019-kprometheus.png ./.DirIcon
popd

wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
chmod +x appimagetool-x86_64.AppImage

./appimagetool-x86_64.AppImage ${APPDIR}
