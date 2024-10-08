@echo off
REM Paths for Qt and build directories
SET SRC_DIR="C:\Qt\6.9.0\Src"
SET BUILD_DIR="C:\Qt\my-builds\build"
SET INSTALL_DIR="C:\Qt\my-builds\qt-6-9-0\gcc\static\debug"

REM Configure options for static Qt build with GCC
SET CONFIGURE_OPTIONS=-opensource -confirm-license -static -debug -skip qtwebengine -skip qtdoc -platform win32-g++

REM Create directories
mkdir %BUILD_DIR%
mkdir %INSTALL_DIR%
cd %BUILD_DIR%

REM Configure Qt with GCC
call %SRC_DIR%\configure -prefix %INSTALL_DIR% %CONFIGURE_OPTIONS%
pause

REM Build Qt
cmake --build . --parallel
pause

REM Install Qt
cmake --install .
cd %INSTALL_DIR%

REM Clean up build directory
rmdir /s /q %BUILD_DIR%
pause