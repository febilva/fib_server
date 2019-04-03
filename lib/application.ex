defmodule Fibonacci.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Fibonacci, %{}}
    ]

    opts = [strategy: :one_for_one, name: Fibonacci.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
