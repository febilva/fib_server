defmodule Fibonacci.Cache do
  use Agent

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
