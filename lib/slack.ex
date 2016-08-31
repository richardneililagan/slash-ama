defmodule Slack do
  use HTTPoison.Base

  def process_url(url) do
    "https://slack.com/api" <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end
