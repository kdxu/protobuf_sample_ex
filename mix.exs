defmodule ProtobufSample.Mixfile do
  use Mix.Project

  def project do
    [
      app: :protobuf_sample,
      version: "0.1.0",
      elixir: "~> 1.5",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :exprotobuf],
      mod: {ProtobufSample.Application, []},
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, github: "ninenines/cowboy", tag: "2.0.0"},
      {:exprotobuf, "~> 1.2.9"},
      {:httpoison, "~> 0.13", only: [:test]},
      {:distillery, "1.4.1", runtime: false},
    ]
  end
end
