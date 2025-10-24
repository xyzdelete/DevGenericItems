module;

export module utilities;

import std;

export namespace utilities
{
  int find_split(const std::vector<int>& numbers)
  {
    int split_index{-1};
    std::ranges::for_each(
      numbers | std::views::enumerate,
      [&split_index, &numbers = std::as_const(numbers)](auto&& indexed_value)
      {
        const auto& [index, value] = indexed_value;
        const auto& it{std::next(numbers.cbegin(), index)};

        const int& left_part_sum{std::ranges::fold_left(
          std::ranges::subrange{numbers.cbegin(), it},
          0,
          std::plus{})};

        const int& right_part_sum{std::ranges::fold_left(
          std::ranges::subrange{it, numbers.cend()},
          0,
          std::plus{})};

        if (left_part_sum == right_part_sum)
        {
          std::println("left_part_sum: {}", left_part_sum);
          std::println("right_part_sum: {}", right_part_sum);
          std::println("Index: {}, Value: {}", index, value);
          split_index = index - 1;
        }
      });

    return split_index;
  }

  std::vector<std::size_t> fibonacci(const std::size_t& n)
  {
    std::vector<std::size_t> fibonacciSequence(n, 0);
    switch (n)
    {
    case 0:
    {
      return fibonacciSequence;
    }
    case 1:
    {
      return fibonacciSequence;
    }
    default:
    {
      fibonacciSequence.at(0) = 0z;
      fibonacciSequence.at(1) = 1z;
      std::ranges::for_each(
        fibonacciSequence | std::ranges::views::enumerate |
          std::ranges::views::drop(2),
        [&fibonacciSequence, &n](auto&& indexCurrentPair)
        {
          auto&& [index, current] = indexCurrentPair;

          current =
            fibonacciSequence.at(index - 2) + fibonacciSequence.at(index - 1);
        });

      return fibonacciSequence;
    }
    }
  }
}  // namespace utilities