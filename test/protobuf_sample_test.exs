defmodule ProtobufSampleTest do
  use ExUnit.Case
  alias ProtobufSample.Protobufs.Basic
  @headers %{"application" => "octet-stream"}

  doctest ProtobufSample.Application
  setup do
    {:ok, _} = Application.ensure_all_started(:httpoison)
    :ok
  end


  test "valid receipt" do
    %HTTPoison.Response{status_code: 200, body: body} = echo(1, "test", :STOP)
    decoded_body = Basic.decode(body)
    assert decoded_body.f1 ==  1
    assert decoded_body.f2 == "test"
    assert decoded_body.type == :STOP
  end

  defp echo(f1, f2, type) do
    body = Basic.new(%{f1: f1, f2: f2, type: type})
           |> Basic.encode()
    HTTPoison.post!("http://localhost:8080/echo", body, @headers)
  end
end
