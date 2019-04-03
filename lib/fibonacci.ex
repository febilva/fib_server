defmodule Fibonacci do
  use Agent

  @moduledoc """
  Documentation for Fibonacci.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Fibonacci.hello()
      :world

  """

  def calculate(0) do
    0
  end

  def calculate(1) do
    1
  end

  def calculate(n) do
    case find(n) do
      false ->
        val = calculate(n - 1) + calculate(n - 2)
        update(n, val)
        val

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

  def value do
    Agent.get(__MODULE__, & &1)
  end
end
