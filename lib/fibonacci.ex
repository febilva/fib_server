defmodule Fibonacci do
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
end
