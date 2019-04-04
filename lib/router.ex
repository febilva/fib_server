defmodule Fibonacci.Router do
  require IEx
  use Plug.Router
  alias Fibonacci

  use Plug.Router

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:match)
  plug(:dispatch)

  #   get "/" do
  #     conn
  #     |> put_resp_content_type("application/json")
  #     |> send_resp(200, Poison.encode!(message()))
  #   end

  post "/fibonacci" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(get_fibonacci(conn.params["input"])))
  end

  def get_fibonacci(number_or_numbers) do
    {:ok, value} = Fibonacci.calculate(number_or_numbers)

    %{
      input: number_or_numbers,
      output: value
    }
  end
end
