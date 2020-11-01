defmodule Processes.Manage do
  def start do
    p_pid = Processes.Parent.start()
    c_pids = start_child_processes(p_pid)
    resp(p_pid, c_pids)
  end

  defp start_child_processes(p_pid) do
    FindModule.module_names()
    |> Enum.map(fn mn -> call_start_func(mn, p_pid) end)
  end

  defp call_start_func(module_name, p_pid) do
    String.to_existing_atom("Elixir." <> module_name)
    |> apply(:start, [p_pid])
  end

  defp resp(p_pid, c_pids) do
    %{
      parent: p_pid,
      children: c_pids,
    }
  end
end
