defmodule Fibonacci.Router do
  require IEx
  use Plug.Router
  alias Fibonacci
  alias Fibonacci.History

  use Plug.Router

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:match)
  plug(:dispatch)

  get "/history" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(get_history()))
  end

  post "/fibonacci" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(get_fibonacci(conn.params["input"])))
  end

  def get_fibonacci(number_or_numbers) do
    {:ok, value} = Fibonacci.calculate(number_or_numbers)
    number_or_numbers |> format(value)
  end

  def get_history() do
    Fibonacci.history()
    |> Enum.map(fn {k, v} -> format(k, v) end)
  end

  def format(number, fibonacci) do
    %{
      number: number,
      fibonacci: fibonacci
    }
  end
end
