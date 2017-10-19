defmodule ProtobufSample.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    children = [
    ]
    opts = [strategy: :one_for_one, name: ProtobufSample.Supervisor]
    start_cowboy()
    Supervisor.start_link(children, opts)
  end

  defp start_cowboy() do
    dispatch =
      :cowboy_router.compile([{:_, [
        {"/echo", ProtobufSample.EchoHandler, []},
      ]}])
    {:ok, _} =
      :cowboy.start_clear(:protobuf_sample, [
        {:ip, {0, 0, 0, 0}},
        {:port, 8080},
        {:max_connections, :infinity},
        {:backlog, 1024},
        {:nodelay, true},
      ], %{
        env: %{dispatch: dispatch},
      })
  end
end

