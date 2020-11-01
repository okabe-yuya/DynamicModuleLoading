defmodule DynamicModuleLoadingTest do
  use ExUnit.Case
  doctest DynamicModuleLoading

  test "greets the world" do
    assert DynamicModuleLoading.hello() == :world
  end
end
