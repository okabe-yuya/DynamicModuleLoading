defmodule Processes.Children.Orange do
  def start(p_pid) do
    pid = spawn(fn -> run(p_pid) end)
    pid
  end

  defp run(p_pid) do
    Processes.Job.run(p_pid, "🍊")
  end
end
