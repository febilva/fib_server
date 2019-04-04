defmodule Fibonacci.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Fibonacci, %{}},
      Plug.Adapters.Cowboy2.child_spec(
        scheme: :http,
        plug: Fibonacci.Router,
        options: [port: 4000]
      )
    ]

    opts = [strategy: :one_for_one, name: Fibonacci.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
