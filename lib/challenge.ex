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
    url = "https://jsonplaceholder.typicode.com/todos/1"
    result = case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
         body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end

    JSON.decode(result) |> elem(1)
  end

  def display do
    result = fetch()
    IO.puts  "TODO Title: " <> result["title"]
  end
end
