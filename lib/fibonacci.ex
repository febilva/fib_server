defmodule Fibonacci do
  alias Fibonacci.Cache
  alias Fibonacci.History
  alias Fibonacci.HistoryCount
  require IEx

  @moduledoc """
  Documentation for Fibonacci.
  """

  @doc """
    accept a integer to calculate and return the result
  """
  def calculate(n) when is_integer(n) do
    result = fib(n)
    History.update(n, result)
    HistoryCount.update(n)
    {:ok, result}
  end

  @doc """
    accept a list of numbers to calculate and return the result
  """
  def calculate(list) when is_list(list) do
    result = Enum.map(list, fn x -> fib(x) end)

    for i <- list do
      HistoryCount.update(i)

      for r <- result do
        History.update(i, r)
      end
    end

    {:ok, result}
  end

  @doc """
  history of requested numbers, ordered from first to last call
  """
  def history() do
    History.value() |> Enum.map(fn x -> x end)
  end

  def history_count() do
    HistoryCount.value()
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
