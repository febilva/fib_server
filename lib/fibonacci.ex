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
  def hello do
    :world
  end

  def calculate(0) do
    0
  end

  def calculate(1) do
    1
  end

  def calculate(n) do
    calculate(n - 1) + calculate(n - 2)
  end

  def start_link(initial_value \\ 0) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def increment do
    Agent.update(__MODULE__, &(&1 + 1))
  end
end
