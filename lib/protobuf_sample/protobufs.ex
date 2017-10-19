defmodule ProtobufSample.Protobufs do
  use Protobuf, from: Path.wildcard("proto/**/*.proto"), use_package_names: true
end
