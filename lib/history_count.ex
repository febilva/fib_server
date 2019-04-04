defmodule Fibonacci.HistoryCount do
  use Agent

  def start_link(initial_value \\ %{}) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def update(key) do
    case get(key) do
      nil ->
        Agent.update(__MODULE__, fn state -> Map.put(state, key, 1) end)

      integer ->
        Agent.update(__MODULE__, fn state -> Map.put(state, key, integer + 1) end)
    end
  end

  def get(key) do
    Agent.get(__MODULE__, fn state -> Map.get(state, key) end)
  end
end
