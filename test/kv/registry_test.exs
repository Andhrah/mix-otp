defmodule Kv.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    reqistry = start_supervised!(KV.Registry)
    %{registry: reqistry}
  end

  test "spawn bucket", %{registry: registry} do
    assert KV.Registry.lookup(registry, "shopping") == :error

    KV.Registry.create(registry, "shopping")
    assert {:ok, bucket} = KV.Registry.lookup(registry, "shopping")

    KV.Bucket.put(bucket, "milk", 1)
    assert KV.Bucket.get(bucket, "milk") == 1
  end
end
