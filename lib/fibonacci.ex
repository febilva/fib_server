defmodule Fibonacci do
  use Agent

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
    case find(n) do
      false ->
        sum = fib(n - 1) + fib(n - 2)
        update(n, sum)
        sum

      true ->
        get(n)
    end
  end

  def start_link(initial_value \\ %{}) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def find(key) do
    Agent.get(__MODULE__, fn state -> Map.has_key?(state, key) end)
  end

  def update(key, value) do
    Agent.update(__MODULE__, fn state -> Map.put(state, key, value) end)
  end

  def get(key) do
    Agent.get(__MODULE__, fn state -> Map.get(state, key) end)
  end

  def history do
    [Agent.get(__MODULE__, & &1)]
  end
end
