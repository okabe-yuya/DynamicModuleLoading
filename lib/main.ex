defmodule Main do
  @moduledoc """
  Documentation for `DynamicModuleLoading`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> DynamicModuleLoading.hello()
      :world

  """
  def execute do
    Processes.Manage.start()
  end
end
