defmodule Challenge do
  @moduledoc """
  Documentation for Challenge.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Challenge.hello()
      :world

  """
  def fetch do
    HTTPoison.start
    result = HTTPoison.get!("https://jsonplaceholder.typicode.com/todos/1")
    JSON.decode(result.body) |> elem(1)
  end

  def display do

    result = fetch()
    IO.puts  "title: " <> result["title"]

  end
end
