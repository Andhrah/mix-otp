defmodule KVTest do
  use ExUnit.Case
  doctest KV

  test "greets the world" do
    assert KV.hello() == "I am the Goddess, I am divine"
  end
end
