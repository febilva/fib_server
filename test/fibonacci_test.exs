defmodule FibonacciTest do
  use ExUnit.Case
  doctest Fibonacci

  test "should return 0 when the input is 0" do
    assert Fibonacci.calculate(0) == {:ok, 0}
  end

  test "should return 1 when the input is 1" do
    assert Fibonacci.calculate(1) == {:ok, 1}
  end

  test "should return 1 when the input is 2" do
    assert Fibonacci.calculate(2) == {:ok, 1}
  end

  test "should return 55 when the input is 10" do
    assert Fibonacci.calculate(10) == {:ok, 55}
  end

  test "when the input is a list" do
    # Fibonacci.HistoryCount.stop()
    # Fibonacci.HistoryCount.start_link()
    assert Fibonacci.calculate([0, 1, 100]) == {:ok, [0, 1, 354_224_848_179_261_915_075]}
  end

  test "history results should be ordered from first to last call." do
    Fibonacci.calculate(0)
    Fibonacci.calculate(1)
    Fibonacci.calculate(2)
    Fibonacci.calculate(10)
    Fibonacci.calculate(100)

    assert Fibonacci.history() == [
             {0, 0},
             {1, 1},
             {2, 1},
             {10, 55},
             {100, 354_224_848_179_261_915_075}
           ]
  end

  # test "history by the times that a number was called" do
  #   Fibonacci.calculate(0)
  #   Fibonacci.calculate(0)
  #   Fibonacci.calculate(1)
  #   Fibonacci.calculate(100)

  #   assert Fibonacci.history_count() == %{0 => 2, 1 => 1, 100 => 1}
  # end

  # test
end
