defmodule Fibonacci do
  alias Fibonacci.Cache

  @moduledoc """
  Documentation for Fibonacci.
  """

  def calculate(n) when is_integer(n) do
    {:ok, fib(n)}
  end

  @doc """
    accept a list of numbers to calculate and return the result
  """
  def calculate(list) when is_list(list) do
    {:ok, Enum.map(list, fn x -> fib(x) end)}
  end

  def fib(0) do
    0
  end

  def fib(1) do
    1
  end

  def fib(n) do
    case Cache.find(n) do
      false ->
        sum = fib(n - 1) + fib(n - 2)
        Cache.update(n, sum)
        sum

      true ->
        Cache.get(n)
    end
  end
end
