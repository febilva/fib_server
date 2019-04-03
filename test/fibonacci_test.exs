defmodule FibonacciTest do
  use ExUnit.Case
  doctest Fibonacci

  test "greets the world" do
    assert Fibonacci.hello() == :world
  end

  test "should return 0 when the input is 0" do
    assert Fibonacci.calculate(0) == 0
  end

  test "should return 1 when the input is 1" do
    assert Fibonacci.calculate(1) == 1
  end

  test "should return 1 when the input is 2" do
    assert Fibonacci.calculate(2) == 1
  end

  test "should return 55 when the input is 2" do
    assert Fibonacci.calculate(10) == 55
  end
end
