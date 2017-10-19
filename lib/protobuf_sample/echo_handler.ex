defmodule ProtobufSample.EchoHandler do
  alias ProtobufSample.Protobufs.Basic
  @behaviour :cowboy_handler
  @headers %{"content-type" => "application/octet-stream"}

  def init(req, _opts) do
    {:ok, req_body, req} = :cowboy_req.read_body(req)
    %Basic{
      f1: f1,
      f2: f2,
      type: type
    } = Basic.decode(req_body)
    IO.puts("#{f1}, #{f2}, #{type}")
    req = :cowboy_req.reply(200, @headers, req_body, req)
    {:ok, req, nil}
  end

end
