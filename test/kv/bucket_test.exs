defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, buckets} = KV.Bucket.start_link([])
    %{bucket: buckets}
  end

  test "store values by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "delete key from bucket", %{bucket: bucket} do
    assert KV.Bucket.delete(bucket, "milk") == :nil
  end
end
