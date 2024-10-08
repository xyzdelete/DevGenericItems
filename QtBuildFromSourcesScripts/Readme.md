1. Download `Qt` `sources` by using `Qt online installer`
2. Install latest `ATL` in `Visual Studio Installer` to be able to build some modules
3. Open and modify `ConfigureAndBuildQtFromSources.bat`

4. If you want to build with Qt Doc module you have to
4.1 Download `Qt prebuild clang compiler`
4.2 Put prebuild clang compiler somewhere
4.3 `Find and open "C:\Compilers\libclang-release_17.0.1-based-windows-vs2019_64\libclang\lib\cmake\llvm\LLVMExports.cmake"`
4.4 Find and change hardcoded path to `DIA SDK`

set_target_properties(LLVMDebugInfoPDB PROPERTIES
  INTERFACE_LINK_LIBRARIES "C:/Program Files/Microsoft Visual Studio/2022/Community/DIA SDK/lib/amd64/diaguids.lib;LLVMBinaryFormat;LLVMObject;LLVMSupport;LLVMDebugInfoCodeView;LLVMDebugInfoMSF"
)

4.5 `qtdoc` only supports release build on Windows otherwise use `-skip` option

5. If you want to build without `qtdoc` you can skip steps 4.x and add `-skip qtdoc` option inside `ConfigureAndBuildQtFromSources.bat` along with `-skip qtwebengine` because `qtwebengine` module can't be build statically

6. Run `ConfigureAndBuildQtFromSources.bat`

Also for some reason even if you build without `qtdoc` a `release + debug` build you will see linking errors if you try to run debug configuration using this kit

But if you separately build debug build you can use debug configuration but will have errors in release configuration

So build `2` kits one using `-debug` option and other using either `-release` or `-debug-and-release` options depends whether you need or not `qtdoc`

And use debug kit for debugging and debug and release kit or just release kit for release