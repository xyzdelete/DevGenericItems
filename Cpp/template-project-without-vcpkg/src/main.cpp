import std;

// Importing custom modules
import utilities;

int main()
{
  std::vector<int> numbers = {
    1,
    5,
    8,
    7,
    6,  // sum == 27
    9,
    6,
    4,
    8  // sum == 27
  };
  const int& result{utilities::find_split(numbers)};
  std::println("Result: {}", result);

  constexpr std::size_t n{3};
  const auto& fibonacciSequence{utilities::fibonacci(n)};
  std::println("Fibonacci sequence of {} elements is {}", n, fibonacciSequence);

  std::println(
    "F({}) === sum of fibonacci sequence of {} elements is {}",
    n,
    n,
    std::reduce(
      std::execution::par,
      fibonacciSequence.cbegin(),
      fibonacciSequence.cend(),
      0,
      std::plus{}));

  return 0;
}