defmodule Processes.Children.Pineapple do
  def start(p_pid) do
    pid = spawn(fn -> run(p_pid) end)
    pid
  end

  # original job
  defp run(p_pid) do
    Processes.Job.send_times_mess(p_pid, self(), "🍍")
    Processes.Job.random_sleep()
    run(p_pid)
  end
end
