defmodule FindModule do
  # https://groups.google.com/g/elixir-lang-talk/c/Ls0eJDdMMW8?pli=1

  def module_names do
    processes_path()
    |> File.ls!
    |> Enum.filter(fn fname -> ex_extension_slice(fname) == ".ex" end)
    |> Enum.map(fn fname -> merge_module_name(fname) end)
  end

  def root_path do
    File.cwd!
  end

  def processes_path do
    Path.join(root_path(), processes_path_static())
  end

  defp ex_extension_slice(str) do
    String.slice(str, -3..-1)
  end

  defp merge_module_name(str) do
    "#{processes_module_static()}.#{ex_camelize_and_slice(str)}"
  end

  defp processes_path_static do
    "lib/processes/children"
  end

  defp processes_module_static do
    "Processes.Children"
  end

  defp ex_camelize_and_slice(str) do
    str
    |> Macro.camelize
    |> String.slice(0..-4)
  end
end
