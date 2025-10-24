// Custom libraries may not use modules import yet
// Use include before import
#include <boost/algorithm/string.hpp>
#include <boost/filesystem.hpp>
#include <boost/predef.h>
#include <boost/system/error_code.hpp>
#include <fmt/format.h>
#include <iostream>
#include <utilities.hpp>

// Importing custom modules
import utilities;

int main()
{
  fmt::println("Hello fmt::println!");

  utilities::test_function();
  utilities::say_hello();

  // Header-only: string transform
  std::string s{"hello boost"};
  boost::algorithm::to_upper(s);
  std::cout << "upper: " << s << "\n";

  // Boost.System: error_code demo
  boost::system::error_code ec{
    make_error_code(boost::system::errc::invalid_argument)};
  std::cout << "error_code: " << ec.value() << " - " << ec.message() << "\n";

  // Boost.Filesystem: current directory
  std::cout << "cwd: " << boost::filesystem::current_path().string() << "\n";

  if (BOOST_OS_WINDOWS)
  {
    std::cout << "os: Windows\n";
  }
  else if (BOOST_OS_LINUX)
  {
    std::cout << "os: Linux\n";
  }
  else if (BOOST_OS_MACOS)
  {
    std::cout << "os: macOS\n";
  }
  else
  {
    std::cout << "os: Unknown\n";
  }

  return 0;
}