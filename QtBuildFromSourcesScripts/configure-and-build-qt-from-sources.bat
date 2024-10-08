SET VS_ENVIRONMENT="C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvars64.bat"
SET SRC_DIR="C:\Qt\6.10.0\Src"
SET BUILD_DIR="C:\Qt\my-builds\build"
SET INSTALL_DIR="C:\Qt\my-builds\qt-6-10-0\msvc\static\debug"
SET CONFIGURE_OPTIONS=-opensource -confirm-license -static -debug -skip qtwebengine -skip qtdoc

call %VS_ENVIRONMENT%
mkdir %BUILD_DIR%
mkdir %INSTALL_DIR%
cd %BUILD_DIR%
call %SRC_DIR%\configure -prefix %INSTALL_DIR% %CONFIGURE_OPTIONS%
pause
cmake --build . --parallel
pause
cmake --install .
cd %INSTALL_DIR%
rmdir %BUILD_DIR% /Q /S
pause